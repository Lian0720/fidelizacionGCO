package com.ejemplo.fidelidad.repository;

import com.ejemplo.fidelidad.model.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryRepository extends JpaRepository<Country, Long> {}
