@implementation SCROVirtualBrailleDriver

- (SCROVirtualBrailleDriver)initWithMainSize:(int64_t)a3 delegate:(id)a4
{
  id v7;
  SCROVirtualBrailleDriver *v8;
  SCROVirtualBrailleDriver *v9;
  void *v10;
  NSString *mainCells;
  id v12;
  uint64_t v13;
  NSMutableArray *enqueuedEvents;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SCROVirtualBrailleDriver;
  v8 = -[SCROVirtualBrailleDriver init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mainSize = a3;
    objc_storeStrong((id *)&v8->_delegate, a4);
    v10 = (void *)objc_opt_new();
    if (a3 >= 1)
    {
      do
      {
        objc_msgSend(v10, "appendString:", CFSTR("⠀"));
        --a3;
      }
      while (a3);
    }
    mainCells = v9->_mainCells;
    v9->_mainCells = (NSString *)v10;
    v12 = v10;

    v13 = objc_opt_new();
    enqueuedEvents = v9->_enqueuedEvents;
    v9->_enqueuedEvents = (NSMutableArray *)v13;

  }
  return v9;
}

- (int)loadDriverWithIOElement:(id)a3
{
  return 0;
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (int64_t)statusSize
{
  return 0;
}

- (id)modelIdentifier
{
  return CFSTR("com.apple.scrod.virtual.display");
}

- (unint64_t)interfaceVersion
{
  return 4;
}

- (int)brailleInputMode
{
  return 2;
}

- (BOOL)postsKeyboardEvents
{
  return 1;
}

- (id)getInputEvents
{
  void *v3;

  -[NSLock lock](self->_eventLock, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_enqueuedEvents, "copy");
  -[NSMutableArray removeAllObjects](self->_enqueuedEvents, "removeAllObjects");
  -[NSLock unlock](self->_eventLock, "unlock");
  return v3;
}

- (BOOL)isDriverLoaded
{
  return 1;
}

- (BOOL)isInputEnabled
{
  return 1;
}

- (BOOL)isSleeping
{
  return 0;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  NSString *mainCells;
  id v12;

  v7 = (void *)objc_opt_new();
  if (self->_mainSize >= 1)
  {
    v8 = 0;
    do
    {
      if (v8 >= a4)
      {
        objc_msgSend(v7, "appendString:", CFSTR("⠀"));
      }
      else
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC28]), "initWithBits:", a3[v8]);
        objc_msgSend(v9, "unicode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "appendString:", v10);
      }
      ++v8;
    }
    while (v8 < self->_mainSize);
  }
  mainCells = self->_mainCells;
  self->_mainCells = (NSString *)v7;
  v12 = v7;

  -[SCROVirtualBrailleDriverDelegate didSetMainCells:](self->_delegate, "didSetMainCells:", v12);
  return 1;
}

- (void)enqueuePan:(BOOL)a3 down:(BOOL)a4
{
  int v5;
  int v6;
  uint64_t v7;
  NSMutableArray *enqueuedEvents;
  void *v9;

  if (a4)
    v5 = 65542;
  else
    v5 = 6;
  if (a3)
    v6 = 8608;
  else
    v6 = 8624;
  v7 = v5 | v6;
  -[NSLock lock](self->_eventLock, "lock");
  enqueuedEvents = self->_enqueuedEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](enqueuedEvents, "addObject:", v9);

  -[NSLock unlock](self->_eventLock, "unlock");
}

- (void)enqueueDot:(int64_t)a3 down:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  NSMutableArray *enqueuedEvents;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if ((unint64_t)(a3 - 9) >= 0xFFFFFFFFFFFFFFF8)
  {
    v15 = v5;
    v16 = v4;
    if (a4)
      v11 = 65538;
    else
      v11 = 2;
    v12 = v11 | (((_DWORD)a3 << 8) - 256) & 0xFFFEFFFF;
    -[NSLock lock](self->_eventLock, "lock", v7, v6, v15, v16, v8, v9);
    enqueuedEvents = self->_enqueuedEvents;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](enqueuedEvents, "addObject:", v14);

    -[NSLock unlock](self->_eventLock, "unlock");
  }
}

- (void)enqueueSpaceWithDown:(BOOL)a3
{
  uint64_t v4;
  NSMutableArray *enqueuedEvents;
  void *v6;

  if (a3)
    v4 = 67586;
  else
    v4 = 2050;
  -[NSLock lock](self->_eventLock, "lock");
  enqueuedEvents = self->_enqueuedEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](enqueuedEvents, "addObject:", v6);

  -[NSLock unlock](self->_eventLock, "unlock");
}

- (void)enqueueRouter:(unint64_t)a3 down:(BOOL)a4
{
  int v5;
  uint64_t v6;
  NSMutableArray *enqueuedEvents;
  void *v8;

  if (a4)
    v5 = 0x10000;
  else
    v5 = 0;
  v6 = ((_DWORD)a3 << 8) & 0xFFFEFFFF | v5;
  -[NSLock lock](self->_eventLock, "lock");
  enqueuedEvents = self->_enqueuedEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](enqueuedEvents, "addObject:", v8);

  -[NSLock unlock](self->_eventLock, "unlock");
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (BOOL)supportsBlinkingCursor
{
  return 1;
}

- (BOOL)unloadDriver
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLock, 0);
  objc_storeStrong((id *)&self->_enqueuedEvents, 0);
  objc_storeStrong((id *)&self->_mainCells, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
