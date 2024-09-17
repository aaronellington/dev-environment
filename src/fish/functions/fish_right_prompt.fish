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

function fish_prompt_go
	if not command -q go
		return
	end

	if not test -f "go.mod"
		return
	end

	set current_version (go version | grep -Po "\d+.\d+")
	set_color -o cyan
	echo -n " go@$current_version"
	set_color normal
end

function fish_prompt_php
	if not command -q php
		return
	end

	if not test -f "composer.json"
		return
	end

	set current_version (php -v | grep -Po "\d+.\d+" | head -n 1)
	set_color -o purple
	echo -n " php@$current_version"
	set_color normal
end

function fish_prompt_node
	if not command -q node
		return
	end

	if not test -f "package.json"
		return
	end

	set current_version (node --version | grep -Po "\d+\.\d+")
	set_color -o green
	echo -n " node@$current_version"
	set_color normal
end


function fish_prompt_pwd
	# Git repo
	set repo (git remote -v 2> /dev/null | grep -m1 '^origin' | grep -oi -m 1 '/[a-z0-9_-]*' | awk -F '/' '{print $2}'_ | tail -n1)

	if test $repo
		set gitColor yellow

		# Git repo and branch
		set_color -o $gitColor
		echo -n (__fish_git_prompt " $repo/%s")
		set_color normal
	else
		# PWD
		set pwd (set_color -o normal)(prompt_pwd)
		echo -n " $pwd"
		set_color normal
	end
end

function fish_right_prompt
	fish_prompt_go
	fish_prompt_php
	fish_prompt_node

	set_color normal
end
