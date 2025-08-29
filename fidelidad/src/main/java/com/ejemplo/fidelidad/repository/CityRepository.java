package com.ejemplo.fidelidad.repository;

import com.ejemplo.fidelidad.model.City;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CityRepository extends JpaRepository<City, Long> {

    List<City> findByDepartmentId(Long departmentId);
}
