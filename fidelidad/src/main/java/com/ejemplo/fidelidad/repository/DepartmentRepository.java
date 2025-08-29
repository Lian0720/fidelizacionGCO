package com.ejemplo.fidelidad.repository;

import com.ejemplo.fidelidad.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface DepartmentRepository extends JpaRepository<Department, Long> {

    List<Department> findByCountryId(Long countryId);
}
