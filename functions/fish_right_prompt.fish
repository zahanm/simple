function fish_right_prompt
    set -l status_copy $status
    set -l status_color 0fc

    if test "$status_copy" -ne 0
        set status_color f30
    end

    if test "$CMD_DURATION" -gt 100
        set -l duration_copy $CMD_DURATION
        set -l duration (echo $CMD_DURATION | humanize_duration)

        echo_color $status_color "$duration"

    else if set -l last_job_id (last_job_id)
        echo_color $status_color "%$last_job_id"
    else
        echo_color 555 (date "+%H:%M")
    end
end