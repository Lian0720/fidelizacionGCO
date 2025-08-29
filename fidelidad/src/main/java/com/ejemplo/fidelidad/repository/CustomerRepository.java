package com.ejemplo.fidelidad.repository;

import com.ejemplo.fidelidad.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {}
