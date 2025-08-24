# wareball

inventory done correctly

**wareball** is designed to be a digital inventory management solution for small business/enterprises (SMEs). powered by the ancient COBOL, and the supremacy of command-line interface.

## features

> [!NOTE]
> this project is still a work-in-progress

- [x] user-friendly command line interface
- [x] add a new item
- [ ] update item
- [ ] delete item
- [ ] generate reports

## how to use

> [!WARNING]
> the release only offers an executable compiled for Ubuntu. if you are not on the same distro or operating system, please refer to the [compiling it yourself](#compiling-it-yourself) guide.

1. go to [releases](https://github.com/theluqmn/wareball/releases), download the latest release.
2. navigate to the directory of the executable and simply run `./main`.

### compiling it yourself

the following are the steps for Ubuntu.

1. install `gnucobol` using your package manager (download gnucobol).
2. clone this repository.
3. run `cobc main.cbl` in the project directory.
4. run `./main` to run the program.

## how this works

this program is written in cobol and is compiled using `gnucobol`. it is a simple CLI-based program, where users can add, update or delete items in an inventory management system, as well as generate a report of the items.

### database design

`INVENTORY(item-id PRIMARY KEY TEXT, item-description TEXT, item-quantity INT, item-price FLOAT)`

## extras

i started this project to brush up my skills just in case something happens in the future where COBOL programmers will be needed (also for fun), and apply it to an actual functioning project. it is named wareball cause why not?

this project is licensed under the [MIT License](https://github.com/theluqmn/wareball/blob/main/LICENSE).
