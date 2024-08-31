ignore = {
    "111",-- setting non-standard global variable
    "212/_.*",-- unused argument for vars with "_" prefix
    "214",-- used variable with unused hint ("_" prefix)
    "121",-- setting readonly global variable "vim"
    "122", -- setting readonly field of global variable "vim
}

read_globals = {
    "vim",
}
