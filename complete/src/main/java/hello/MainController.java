package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller // This means that this class is a Controller
@RequestMapping(path = "/demo") // This means URL's start with /demo (after Application path)
public class MainController {
	@Autowired // This means to get the bean called userRepository
				// Which is auto-generated by Spring, we will use it to handle the data
	private UserRepository userRepository;

	@GetMapping(path = "/add") // Map ONLY GET Requests
	public @ResponseBody String addNewUser(@RequestParam String name, @RequestParam String email) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		User n = new User();
		n.setName(name);
		n.setEmail(email);
		userRepository.save(n);
		return "Saved";
	}

	@GetMapping(path = "/all")
	public @ResponseBody Iterable<User> getAllUsers(@RequestParam(required = false) String name,
			@RequestParam(required = false) String email, User user, Pageable pageable) {
		// This returns a JSON or XML with the users
		// return userRepository.findAll();

		// System.out.println("user=" + user);
		// System.out.println("user=" + user.toString());
		System.out.println("getId=" + user.getId());
		System.out.println("getName=" + user.getName());
		System.out.println("getEmail=" + user.getEmail());

		User n = new User();
		n.setName(name);
		n.setEmail(email);

		// UserSpec spec = new UserSpec(n);
		// return userRepository.findAll(Specification.where(UserSpec2.id(user)));
		// return userRepository.findAll(UserSpec2.id(user));

		// Specification<User> spec = UserSpec2.idEqual(user);
		// // spec.and(UserSpec2.emailEqual(user));
		// spec.and(UserSpec2.likeEmail(user));
		// spec.and(UserSpec2.nameEqual(user));

		// return userRepository.findAll(spec);
		// return userRepository
		// .findAll(UserSpec2.idEqual(user).and(UserSpec2.likeEmail(user)).and(UserSpec2.nameEqual(user)));
		// return userRepository.findAll(new UserSpec(user));
		return userRepository.findAll(new UserSpec(user), pageable);
	}
}
