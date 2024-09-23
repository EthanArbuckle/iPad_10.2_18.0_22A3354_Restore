@implementation TSClockManagerInterface

- (TSClockManagerInterface)init
{
  TSClockManagerInterface *v3;
  objc_super v5;

  if (init_onceToken_0 != -1)
    dispatch_once(&init_onceToken_0, &__block_literal_global_6);
  v5.receiver = self;
  v5.super_class = (Class)TSClockManagerInterface;
  v3 = -[TSClockManagerInterface init](&v5, sel_init);
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_clockManagerInterfacesLock);
    objc_msgSend((id)_clockManagerInterfaces, "addObject:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  }
  return v3;
}

void __31__TSClockManagerInterface_init__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_clockManagerInterfaces;
  _clockManagerInterfaces = v0;

  _clockManagerInterfacesLock = 0;
}

- (void)addToClockManager
{
  id v3;

  -[TSClockManagerInterface clockManager](self, "clockManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addClient:", self);

}

- (void)removeFromClockManager
{
  id v3;

  -[TSClockManagerInterface clockManager](self, "clockManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", self);

}

- (void)setInterruptionCallback:(void *)a3 andRefcon:(void *)a4
{
  self->_interruptionCallback = a3;
  self->_interruptionRefcon = a4;
}

- (void)interruptedConnectionForClockManager:(id)a3
{
  void (*interruptionCallback)(void *, SEL, id);

  interruptionCallback = (void (*)(void *, SEL, id))self->_interruptionCallback;
  if (interruptionCallback)
    interruptionCallback(self->_interruptionRefcon, a2, a3);
  -[TSClockManagerInterface removeFromClockManager](self, "removeFromClockManager", a3);
  os_unfair_lock_lock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  objc_msgSend((id)_clockManagerInterfaces, "removeObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&_clockManagerInterfacesLock);
}

- (TSClockManager)clockManager
{
  return self->_clockManager;
}

- (void)setClockManager:(id)a3
{
  objc_storeStrong((id *)&self->_clockManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockManager, 0);
}

@end
