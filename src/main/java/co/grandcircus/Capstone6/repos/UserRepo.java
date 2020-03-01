package co.grandcircus.Capstone6.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.Capstone6.entity.User;

public interface UserRepo extends JpaRepository<User,Long>{
	
	User findByNameIgnoreCase(String name);

}
