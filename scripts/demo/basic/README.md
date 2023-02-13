# Basic Demos

## Notes:
* If the file are not marked as executable on your system launch them with `bash` _script.sh_
 * remember to clean your environment before any demo (There is a convenience script `clear.sh`)

## Core operations
This demo creates three types of AID's and performs actions on each type.
```bash
$ demo-script.sh
```

## Agent interactions over a network
You will need multiple terminals for this demo.

In the first run:
```bash
$ kli agent demo --config-file demo-witness-oobis
```

In the second run:
```bash
$ kli witness demo
```

In the third (where the network interactions happen) run:
```bash
$ alice-bob-agent.sh
```

## Challenge

This demo uses the KERI cli `kli` to create and incept two parties. Then the two parties resolve each other using oobi aliases. Finally each party is asked to respond to a word based challenge.

In the first terminal run:
```bash
$ kli witness demo
```

In the second terminal (where the interactions happen) run:
```bash
$ challenge.sh
```

## Delegate

This demo creates two Identities where the one Identity delegates to the second

In the first terminal run:
```bash
$ kli witness demo
```

In the second terminal (where the interactions happen) run:
```bash
$ challenge.sh
```

## Delegate Agent

This demo uses agents to demonstrate delegation from one AID to another

In the first run:
```bash
$ kli agent demo --config-file demo-witness-oobis
```

In the second run:
```bash
$ kli witness demo
```

In the third (where the network interactions happen) run:
```bash
$ delegate-agent.sh
```