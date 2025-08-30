package com.ejemplo.fidelidad.controller;

import com.ejemplo.fidelidad.dto.CustomerRequest;
import com.ejemplo.fidelidad.model.Customer;
import com.ejemplo.fidelidad.repository.BrandRepository;
import com.ejemplo.fidelidad.repository.CityRepository;
import com.ejemplo.fidelidad.repository.CustomerRepository;
import com.ejemplo.fidelidad.repository.IdTypeRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Map;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    private final CustomerRepository customerRepo;
    private final IdTypeRepository idTypeRepo;
    private final CityRepository cityRepo;
    private final BrandRepository brandRepo;

    public CustomerController(CustomerRepository customerRepo,
                              IdTypeRepository idTypeRepo,
                              CityRepository cityRepo,
                              BrandRepository brandRepo) {
        this.customerRepo = customerRepo;
        this.idTypeRepo = idTypeRepo;
        this.cityRepo = cityRepo;
        this.brandRepo = brandRepo;
    }

    @PostMapping
    public ResponseEntity<?> create(@RequestBody CustomerRequest req) {
        try {
            Customer c = new Customer();
            c.setIdType(idTypeRepo.findById(req.getIdTypeId()).orElseThrow());
            c.setIdNumber(req.getIdNumber());
            c.setFirstName(req.getFirstName());
            c.setLastName(req.getLastName());

            if (req.getBirthDate() != null && !req.getBirthDate().isBlank()) {
                c.setBirthDate(LocalDate.parse(req.getBirthDate()));
            }

            c.setAddress(req.getAddress());
            c.setCity(cityRepo.findById(req.getCityId()).orElseThrow());
            c.setBrand(brandRepo.findById(req.getBrandId()).orElseThrow());

            Customer saved = customerRepo.save(c);
            return ResponseEntity.ok(Map.of("id", saved.getId()));

        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("error", "Error guardando cliente: " + e.getMessage()));
        }
    }
}


