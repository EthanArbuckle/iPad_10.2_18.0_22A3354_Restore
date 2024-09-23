@implementation PGRunLoopObserver

- (void)dealloc
{
  objc_super v3;

  -[PGRunLoopObserver setActions:](self, "setActions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PGRunLoopObserver;
  -[PGRunLoopObserver dealloc](&v3, sel_dealloc);
}

- (void)setActions:(id)a3
{
  id v4;
  void *v5;
  id actions;
  CFRunLoopObserverRef v7;
  __CFRunLoop *Main;
  __CFRunLoopObserver *runLoopObserver;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1B5E0FE80]();
  actions = self->_actions;
  self->_actions = v5;

  if (!self->_runLoopObserver)
  {
    if (!self->_actions)
      goto LABEL_7;
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __32__PGRunLoopObserver_setActions___block_invoke;
    v13 = &unk_1E622FD90;
    objc_copyWeak(&v14, &location);
    v7 = CFRunLoopObserverCreateWithHandler(0, 0xA0uLL, 0, 0x7FFFFFFFLL, &v10);
    -[PGRunLoopObserver setRunLoopObserver:](self, "setRunLoopObserver:", v7, v10, v11, v12, v13);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  if (!self->_actions)
  {
    runLoopObserver = self->_runLoopObserver;
    if (runLoopObserver)
    {
      CFRunLoopObserverInvalidate(runLoopObserver);
      CFRelease(self->_runLoopObserver);
      -[PGRunLoopObserver setRunLoopObserver:](self, "setRunLoopObserver:", 0);
    }
  }
LABEL_7:

}

void __32__PGRunLoopObserver_setActions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(_QWORD);
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "actions");
    v2 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActions:", 0);
    if (v2)
      v2[2](v2);

    WeakRetained = v3;
  }

}

- (id)actions
{
  return self->_actions;
}

- (__CFRunLoopObserver)runLoopObserver
{
  return self->_runLoopObserver;
}

- (void)setRunLoopObserver:(__CFRunLoopObserver *)a3
{
  self->_runLoopObserver = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actions, 0);
}

@end
