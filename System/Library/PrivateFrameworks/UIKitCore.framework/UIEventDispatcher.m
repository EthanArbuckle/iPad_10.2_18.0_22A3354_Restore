@implementation UIEventDispatcher

void __41__UIEventDispatcher_initWithApplication___block_invoke(uint64_t a1, void *a2)
{
  updateCycleEntry(a2);
}

- (void)eventFetcherDidReceiveEvents:(id)a3
{
  CFRunLoopSourceSignal(self->_collectHIDEventsRunLoopSource);
  CFRunLoopWakeUp(self->_runLoop);
}

- (UIEventDispatcher)initWithApplication:(id)a3
{
  UIEventDispatcher *v4;
  UIEventEnvironment *v5;
  UIEventEnvironment *mainEnvironment;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIEventDispatcher;
  v4 = -[UIEventDispatcher init](&v10, sel_init);
  if (v4)
  {
    v5 = -[UIEventEnvironment initWithApplication:]([UIEventEnvironment alloc], "initWithApplication:", a3);
    mainEnvironment = v4->_mainEnvironment;
    v4->_mainEnvironment = v5;

    if (_UIUpdateCycleEnabled())
    {
      v7 = (void *)qword_1ECD75BF0;
      qword_1ECD75BE8 = (uint64_t)v4;
      qword_1ECD75BF0 = (uint64_t)&__block_literal_global_462;

      v8 = (void *)qword_1ECD75B90;
      qword_1ECD75B88 = (uint64_t)v4;
      qword_1ECD75B90 = (uint64_t)&__block_literal_global_2_14;

    }
  }
  return v4;
}

- (void)_installEventRunLoopSources:(uint64_t)a1
{
  _QWORD *v4;
  const __CFString *v5;
  __CFRunLoopSource *v6;
  __CFRunLoopSource *v7;
  CFRunLoopSourceContext v8;

  if (a1)
  {
    *(_QWORD *)(a1 + 40) = a2;
    v4 = *(_QWORD **)(a1 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v4[1] + 152);
    memset(&v8.retain, 0, 64);
    v8.version = 0;
    v8.info = v4;
    if (_UIUpdateCycleEnabled())
    {
      v5 = (const __CFString *)*MEMORY[0x1E0C9B270];
    }
    else
    {
      v8.perform = (void (__cdecl *)(void *))__eventQueueSourceCallback;
      v6 = CFRunLoopSourceCreate(0, -1, &v8);
      *(_QWORD *)(a1 + 24) = v6;
      v5 = (const __CFString *)*MEMORY[0x1E0C9B270];
      CFRunLoopAddSource(a2, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      CFRelease(*(CFTypeRef *)(a1 + 24));
    }
    v8.perform = (void (__cdecl *)(void *))__eventFetcherSourceCallback;
    v8.info = (void *)a1;
    v7 = CFRunLoopSourceCreate(0, -2, &v8);
    *(_QWORD *)(a1 + 32) = v7;
    CFRunLoopAddSource(a2, v7, v5);
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
}

void __41__UIEventDispatcher_initWithApplication___block_invoke_2(uint64_t a1, void *a2)
{
  updateCycleEntry(a2);
}

- (void)dealloc
{
  objc_super v3;

  if ((_UIUpdateCycleEnabled() & 1) == 0)
    CFRunLoopSourceInvalidate(self->_handleEventQueueRunLoopSource);
  CFRunLoopSourceInvalidate(self->_collectHIDEventsRunLoopSource);
  v3.receiver = self;
  v3.super_class = (Class)UIEventDispatcher;
  -[UIEventDispatcher dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainEnvironment, 0);
}

@end
