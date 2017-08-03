package org.phonebook.boot;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by ashamsutdinov on 03.08.2017.
 */
public interface PhoneRepository extends CrudRepository<Phone, Integer> {
}
