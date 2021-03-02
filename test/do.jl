using Logging: global_logger
using TerminalLoggers: TerminalLogger

using LoggingPlayground: do_1, do_2, do_3

# global_logger(TerminalLogger())
Logging.global_logger(Logging.ConsoleLogger(stdout, Logging.LogLevel(-10000)))

# running in the REPL, you might want this to view all the log messages
# VSCodeServer.PROGRESS_ENABLED[] = false

