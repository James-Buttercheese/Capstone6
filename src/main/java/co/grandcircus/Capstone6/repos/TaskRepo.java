package co.grandcircus.Capstone6.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.Capstone6.entity.Task;

public interface TaskRepo  extends JpaRepository<Task, Long>{
	
	List<Task> findByUsersIdOrderByDueDate(Long id);
	List<Task> findByUsersIdOrderByStatus(Long id);
	List<Task> findByUsersIdAndDescriptionContainsIgnoreCase(Long id, String word);


}
