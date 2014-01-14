Reflector := Object clone
Reflector getSender := method(arg, call sender)
Reflector getMessage := method(arg, call message)
Reflector getActivated := method(arg, call activated)
Reflector getSlotContext := method(arg, call slotContext)
Reflector getTarget := method(arg, call target)
Reflector getArg := method(arg, call message argAt(0))
Reflector getNextMessage := method(arg, call message next)
