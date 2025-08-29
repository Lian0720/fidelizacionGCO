package com.ejemplo.fidelidad.controller;

import com.ejemplo.fidelidad.model.*;
import com.ejemplo.fidelidad.repository.*;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class ListController {

    private final IdTypeRepository idTypeRepo;
    private final BrandRepository brandRepo;
    private final CountryRepository countryRepo;
    private final DepartmentRepository deptRepo;
    private final CityRepository cityRepo;

    public ListController(IdTypeRepository idTypeRepo, BrandRepository brandRepo,
                          CountryRepository countryRepo, DepartmentRepository deptRepo,
                          CityRepository cityRepo) {
        this.idTypeRepo = idTypeRepo;
        this.brandRepo = brandRepo;
        this.countryRepo = countryRepo;
        this.deptRepo = deptRepo;
        this.cityRepo = cityRepo;
    }

    @GetMapping("/id-types")
    public List<IdType> idTypes() { return idTypeRepo.findAll(); }

    @GetMapping("/brands")
    public List<Brand> brands() { return brandRepo.findAll(); }

    @GetMapping("/countries")
    public List<Country> countries() { return countryRepo.findAll(); }

    @GetMapping("/departments")
    public List<Department> departments(@RequestParam Long countryId) {
        return deptRepo.findByCountryId(countryId);
    }

    @GetMapping("/cities")
    public List<City> cities(@RequestParam Long departmentId) {
        return cityRepo.findByDepartmentId(departmentId);
    }
}

