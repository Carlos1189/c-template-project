#include "Poco/Logger.h"
#include "Poco/LogStream.h"
#include "fmt/core.h"

int main(int argc, char** argv)
{
	Poco::Logger& logger = Poco::Logger::get("Test logger");
	Poco::LogStream lstr{logger};
	lstr << "This is a text" << std::endl;
}