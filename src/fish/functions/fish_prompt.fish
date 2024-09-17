set lastStatusColor green
function fish_prompt_status
	set -x last_status $status
	if test $last_status -eq 0
		set -x lastStatusColor green
	else
		set -x lastStatusColor red
	end

	set_color -o $lastStatusColor
	echo -n "[$last_status]"
	set_color normal
end

function fish_prompt_pwd_foobar
	set gitColor yellow
	set pwd_output " "(prompt_pwd)

	# Git repo
	set repo (git remote -v 2> /dev/null | grep -m1 '^origin' | grep -oi -m 1 '/[a-z0-9_-]*' | awk -F '/' '{print $2}'_ | tail -n1)
	if test $repo
		# Git repo and branch
		set gitColor blue
		set pwd_output (__fish_git_prompt " $repo/%s")
	else if test (__fish_git_prompt)
		set gitColor red
		set pwd_output (__fish_git_prompt)
	end

	set_color -o $gitColor
	echo -n "$pwd_output"
	set_color normal

end

function fish_prompt
	fish_prompt_status
	fish_prompt_pwd_foobar
	echo -n " > "
	set_color normal
end
