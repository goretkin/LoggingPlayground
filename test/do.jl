import Logging
using TerminalLoggers: TerminalLogger

struct PlayLogger <: Logging.AbstractLogger
    log
end
Logging.min_enabled_level(::PlayLogger) = -10000
Logging.shouldlog(::PlayLogger, args...) = true
Logging.handle_message(pl::PlayLogger, args...; kwargs...) = push!(pl.log, (; args, kwargs))

using LoggingPlayground: do_1, do_2, do_3

# Logging.global_logger(TerminalLogger())
# Logging.global_logger(Logging.ConsoleLogger(stdout, Logging.LogLevel(-10000)))
pl = PlayLogger([])
Logging.global_logger(pl)

# if running in the VS Code Julia REPL, you might want this to make sure all log messages make it to the global logger
# VSCodeServer.PROGRESS_ENABLED[] = false

do_1(3)

