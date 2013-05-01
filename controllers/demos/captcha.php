<?php
	class demos_captcha_controller extends controller {
		public function execute() {
			$this->output->title = "Captcha demo";

			if ($_SERVER["REQUEST_METHOD"] == "POST") {
				$valid = captcha::valid_code($_POST["code"]);
				$this->output->add_tag("valid", show_boolean($valid));
			}
		}
	}
?>
