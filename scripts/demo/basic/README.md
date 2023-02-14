# Basic Demos

## Notes:
* If the file are not marked as executable on your system launch them with `bash` _script.sh_
 * remember to clean your environment before any demo (There is a convenience script `clear.sh`)

----------

## KERI core operations
This demo creates three types of AID's and performs actions on each type.
```bash
$ demo-script.sh
```

----------

## Witness interactions
This demo shows how witnesses could be used to add credibility to a series of events on an AID.

In the first terminal run:
```bash
$ kli agent demo --config-file demo-witness-oobis
```

In the second terminal run:
```bash
$ demo-witness-script.sh
```

----------

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

----------

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

----------

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

----------

## Delegate agent

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

----------

## Multi signature e.g. 1


In the first run:
```bash
$ kli witness demo
```

In the second (where the interactions happen) run:
```bash
$ multisig.sh
```

----------

## Multi signature e.g. 2


In the first run:
```bash
$ kli witness demo
```

In the second (where the interactions happen) run:
```bash
$ multisig-triple.sh
```

----------

## Multi signature with rotation


In the first run:
```bash
$ kli witness demo
```

In the second (where the interactions happen) run:
```bash
$ multisig-partial-rotation.sh
```

----------
## Multi signature delegation e.g. 1

This demo creates three Identities. A Delegator is asked for delegated authority by two Identities that both sign the request. 

In the first run:
```bash
$ kli witness demo
```

In the second (where the interactions happen) run:
```bash
$ multisig-delegate.sh
```

----------

## Multi signature delegation e.g. 2

This demo creates four Identities. Two groups of two are formed. One group acts as the delegate and the other the delegator. (the concept is the same as in the delegate example except instead of each identity acting alone all members of the group need to sign events) 

In the first run:
```bash
$ kli witness demo
```

In the second (where the interactions happen) run:
```bash
$ multisig-delegate-delegator.sh
```

----------

## Multi signature agent

This demo uses agents to demonstrate multiple signatures from agents on a network.

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
$ multisig-agent.sh
```

----------

## Multi signature delegate agent

This demo uses agents to demonstrate a request for delegated authority for multiple signatures for agents on a network.

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
$ multisig-delegate-agent.sh
```

----------

## Multi signature delegator and delegate agent

This demo uses two signature groups with on group acting as a delegator and the second as a delegate. All as agents on a network.

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
$ multisig-delegate-delegator-agent.sh
```

----------