module LoggingPlayground

using ProgressLogging: @progress

function do_1(n)
    @progress for i = 1:n
        sleep(0.1)
    end
end

function do_2(n)
    i = 0
    while n > 0
        @debug "do_2_progress" i blah=3
        i += 1
        n = n - 1
        sleep(0.1)
    end
end

function do_3(n, n1, n2)
    @progress for i = 1:n
        @info "do_1"
        do_1(n1)
        @info "do_2"
        do_2(n2)
    end
end

end # module
