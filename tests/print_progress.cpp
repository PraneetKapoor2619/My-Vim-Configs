#include "common_headers.h"
#include "print_progress.h"

/*
	Description
	-----------
	To display the current value of a variable and the percentage of the 
	work done. Percentage = (current value * 100) / max value
	
	Purpose of variables defined in namespace progress
	--------------------------------------------------
	* char_count: store the number of characters in a string
	* previous: store the previous value of the variable
	* tolerance: store the min. diff. req. between previous and current
				 values to update the status line
	* max: store the max. possible value of the variable
	* percentage: store the computed percentage (current * 100 / max)
	* ss: store the default precision of the terminal
	* lhs1: store the string to be prefixed to the value of the variable in
	        the display
	* lhs2: store the string to be prefixed to the percentage
	* value1: store var1
	* value2: store var2
	At present only previous, max, percentage, ss, lhs1 and lhs2 are stored.
	Status can be displayed on a single line only.
*/
namespace progress {
	int char_count;
	float previous, tolerance, max, percentage;
	std::streamsize ss = std::cout.precision();
	std::string lhs1, value1, lhs2, value2;
}

/*
	Use this one before displaying the progress bar
*/
void init_progress(float& previous, float& max)
{
	progress::previous = previous;
	progress::max = max;
	set_display();
}

/*
	Use this one before displaying the status
*/
void init_progress(std::string& lhs1, std::string& lhs2, float& max)
{
	progress::lhs1 = lhs1;
	progress::lhs2 = lhs2;
	progress::max = max;
	set_display();
}

/*
	Used for setting the precision and color of the display
*/
void set_display()
{
	// Set precision to 2 decimal places
	std::cout << std::setprecision(2) << std::fixed
			  << std::endl;
	
	// Set text color to "NOCOLOR" on the terminal
	std::cout << NOCOLOR;
	
	// Disable the cursor
	printf("\e[?25l");
}

/*
* Used for enabling the default settings of the display
*/
void reset_display()
{
	// Re-enable the cursor
	printf("\e[?25h");
	
	// Reset text color on terminal
	std::cout << WHITE;

	// Reset the default precision
	std::cout << std::setprecision(progress::ss) << std::defaultfloat
			  << std::endl;
}

/*
	Used for displaying a progress bar
*/
void print_bar(float& current)
{
	static int i;
	std::cout << "\r" << NOCOLOR << "[";
	progress::percentage = (current / progress::max) * 100;
	for (i = 1; i <= 100; ++i) {
		if (i <= (int) progress::percentage) {
			std::cout << GREEN << "#";
		}
		else {
			std::cout << RED << ".";
		}
	}
	std::cout << NOCOLOR << "]"
			  << YELLOW << std::fmin(progress::percentage, 100.0) << "%";
}

/*
	Used for displaying a line telling about the progress of the job
*/
void print_status(float& current)
{
	std::cout << "\r" << NOCOLOR << progress::lhs1
			  << YELLOW << current
			  << NOCOLOR << ",\t" << progress::lhs2
			  << YELLOW << current * 100 / progress::max << "%";
}