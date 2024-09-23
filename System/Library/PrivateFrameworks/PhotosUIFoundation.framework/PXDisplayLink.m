@implementation PXDisplayLink

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  PXDisplayLink *v11;

  v8 = *MEMORY[0x24BDBCB80];
  v9 = a5;
  v10 = a3;
  v11 = -[PXDisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:](self, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:", v10, a4, 0, v8, PXDisplayLinkDefaultPreferredFramesPerSecond(), v9);

  return v11;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;
  PXDisplayLink *v10;

  v5 = a5;
  v8 = *MEMORY[0x24BDBCB80];
  v9 = a3;
  v10 = -[PXDisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:](self, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:", v9, a4, v5, v8, PXDisplayLinkDefaultPreferredFramesPerSecond(), MEMORY[0x24BDAC9B8]);

  return v10;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 queue:(id)a8
{
  return -[PXDisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:](self, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:", a3, a4, a5, a6, a7, 0, a8);
}

- (NSString)runloopModes
{
  return self->_runloopModes;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7
{
  return -[PXDisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:](self, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:", a3, a4, a5, a6, a7, MEMORY[0x24BDAC9B8]);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_runloopModes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_target);
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  return -[PXDisplayLink initWithWeakTarget:selector:queue:](self, "initWithWeakTarget:selector:queue:", a3, a4, MEMORY[0x24BDAC9B8]);
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  PXDisplayLink *v14;

  v10 = *MEMORY[0x24BDBCB80];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = -[PXDisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:](self, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:", v13, a4, 0, v10, PXDisplayLinkDefaultPreferredFramesPerSecond(), v12, v11);

  return v14;
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 preferredFramesPerSecond:(int64_t)a5
{
  return -[PXDisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:](self, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:queue:", a3, a4, 0, *MEMORY[0x24BDBCB80], a5, MEMORY[0x24BDAC9B8]);
}

- (PXDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PXCADisplayLink *v21;
  void *v23;

  v12 = a5;
  v16 = (id)MEMORY[0x24BDAC9B8];
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a3;
  if (a9 != v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 81, CFSTR("Only main queue supported"));

  }
  v21 = -[PXCADisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:]([PXCADisplayLink alloc], "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:", v20, a4, v12, v19, a7, v18, v17);

  return &v21->super;
}

- (id)initInternalWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  PXDisplayLink *v18;
  PXDisplayLink *v19;
  objc_super v21;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)PXDisplayLink;
  v18 = -[PXDisplayLink init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak(&v18->_target, v14);
    v19->_selector = a4;
    objc_storeStrong((id *)&v19->_queue, a9);
    objc_storeStrong((id *)&v19->_runloopModes, a6);
    v19->_preferredFramesPerSecond = a7;
    objc_storeWeak((id *)&v19->_screen, v16);
  }

  return v19;
}

- (PXDisplayLink)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 101, CFSTR("%s is not available as initializer"), "-[PXDisplayLink init]");

  abort();
}

- (void)invalidate
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 107, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDisplayLink invalidate]", v6);

  abort();
}

- (double)currentMediaTime
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 111, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDisplayLink currentMediaTime]", v6);

  abort();
}

- (double)resolvedDuration
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 115, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDisplayLink resolvedDuration]", v6);

  abort();
}

- (double)duration
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 127, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDisplayLink duration]", v6);

  abort();
}

- (double)targetTimestamp
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 131, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDisplayLink targetTimestamp]", v6);

  abort();
}

- (double)timestamp
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDisplayLink.m"), 135, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXDisplayLink timestamp]", v6);

  abort();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

+ (BOOL)supportsSpecificScreen
{
  return +[PXCADisplayLink supportsSpecificScreen](PXCADisplayLink, "supportsSpecificScreen");
}

+ (BOOL)highFramerateRequiresReasonAndRange
{
  return +[PXCADisplayLink highFramerateRequiresReasonAndRange](PXCADisplayLink, "highFramerateRequiresReasonAndRange");
}

@end
