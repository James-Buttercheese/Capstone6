package co.grandcircus.Capstone6.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.Capstone6.entity.Task;
import co.grandcircus.Capstone6.entity.User;
import co.grandcircus.Capstone6.repos.TaskRepo;
import co.grandcircus.Capstone6.repos.UserRepo;

@Controller
public class Controllers {

	@Autowired
	UserRepo userRepo;
	@Autowired
	TaskRepo taskRepo;

	@Autowired
	private HttpSession sesh;

	@RequestMapping("/")
	public ModelAndView main() {

		return new ModelAndView("main");
	}

	@RequestMapping("/login")
	public ModelAndView login() {

		return new ModelAndView("login");
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam("name") String username, @RequestParam("password") String password) {

		User user = userRepo.findByNameIgnoreCase(username);

		if (user == null || !password.equals(user.getPassword())) {

			return new ModelAndView("/login", "message", "Incorrect username or  password.");

		}

		sesh.setAttribute("user", user);

		return new ModelAndView("redirect:/list/" + user.getId());
	}

	@RequestMapping("/list/{id}")
	public ModelAndView list(@PathVariable("id") User user) {

		return new ModelAndView("list", "user", user);
	}
	
	@PostMapping("/list/{id}")
	public ModelAndView searchList(@SessionAttribute(name = "user", required = false) User user,
			@RequestParam("search") String search) {

		List<Task> tasks = new ArrayList<>();

		Long id = user.getId();

		tasks = taskRepo.findByUsersIdAndDescriptionContainsIgnoreCase(id, search);

		return new ModelAndView("sorted", "tasks", tasks);
	}

	@RequestMapping("/date")
	public ModelAndView date(@SessionAttribute(name = "user", required = false) User user) {

		List<Task> tasks = new ArrayList<>();

		Long id = user.getId();

		tasks = taskRepo.findByUsersIdOrderByDueDate(id);

		return new ModelAndView("sorted", "tasks", tasks);
	}

	@RequestMapping("/status")
	public ModelAndView status(@SessionAttribute(name = "user", required = false) User user) {

		List<Task> tasks = new ArrayList<>();

		Long id = user.getId();

		tasks = taskRepo.findByUsersIdOrderByStatus(id);

		return new ModelAndView("sorted", "tasks", tasks);
	}

	@PostMapping("/date")
	public ModelAndView searchD(@SessionAttribute(name = "user", required = false) User user,
			@RequestParam("search") String search) {

		List<Task> tasks = new ArrayList<>();

		Long id = user.getId();

		tasks = taskRepo.findByUsersIdAndDescriptionContainsIgnoreCase(id, search);

		return new ModelAndView("sorted", "tasks", tasks);
	}

	@PostMapping("/status")
	public ModelAndView search(@SessionAttribute(name = "user", required = false) User user,
			@RequestParam("search") String search) {

		List<Task> tasks = new ArrayList<>();

		Long id = user.getId();

		tasks = taskRepo.findByUsersIdAndDescriptionContainsIgnoreCase(id, search);

		return new ModelAndView("sorted", "tasks", tasks);
	}

	@RequestMapping("/register")
	public ModelAndView register() {

		return new ModelAndView("register");
	}

	@RequestMapping("/verify")
	public ModelAndView verify(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("password2") String pword) {

		List<User> users = userRepo.findAll();
		for (User user : users) {
			if (user.getName().equals(name)) {
				return new ModelAndView("register", "message", "That username is already taken");
			}
		}
		if (password.equals(pword)) {
			User user = new User(name, password);
			userRepo.save(user);
			sesh.setAttribute("user", user);
			return new ModelAndView("verify", "user", user);
		} else
			return new ModelAndView("register", "message", "Your passwords did not match.");

	}

	@RequestMapping("/create")
	public ModelAndView create(@SessionAttribute(name = "user", required = false) User user) {
		return new ModelAndView("create", "user", user);
	}

	@PostMapping("/list/add")
	public ModelAndView createAdd(@SessionAttribute(name = "user", required = false) User user, Task task) {

		Long id = user.getId();

		taskRepo.save(task);

		return new ModelAndView("redirect:/list/" + id);
	}

	@RequestMapping("/logout")
	public ModelAndView logout() {
		sesh.invalidate();
		return new ModelAndView("main");
	}
	
	@RequestMapping("/complete/{id}") 
	public ModelAndView complete(@SessionAttribute(name = "user", required = false) User user, @PathVariable("id") Task task) {
		
		Long id = user.getId();
		
		if (task.isStatus() == true) {
			task.setStatus(false);
		} else {
			task.setStatus(true);
		}
		
		taskRepo.save(task);
		
		return new ModelAndView ("redirect:/list/" + id);
	}
	
	@RequestMapping("/delete/{id}")
	public ModelAndView delete(@SessionAttribute(name = "user", required = false) User user, @PathVariable("id") Long id) {
		
		Long idd = user.getId();

		taskRepo.deleteById(id);
		
		return new ModelAndView("redirect:/list/" + idd);
	}
	
	@RequestMapping("/edit/{id}")
	public ModelAndView edit(@SessionAttribute(name="user", required=false) User user, @PathVariable("id") Long id) {
		
		Task task = taskRepo.findById(id).orElse(null);
		
		return new ModelAndView("edit", "task", task);
	}
	
	@PostMapping("/list/edit")
	public ModelAndView edit(@SessionAttribute(name = "user", required = false) User user, Task task) {

		Long id = user.getId();

		taskRepo.save(task);

		return new ModelAndView("redirect:/list/" + id);
	}
	
	@RequestMapping("/admin")
	public ModelAndView admin() {
		List<Task> tasks = taskRepo.findAll();
		return new ModelAndView("admin", "tasks", tasks);
	}

}
