@implementation SCROBrailleEventDispatcher

- (SCROBrailleEventDispatcher)initWithTarget:(id)a3
{
  id v4;
  SCROBrailleEventDispatcher *v5;
  NSLock *v6;
  NSLock *queueLock;
  NSMutableArray *v8;
  NSMutableArray *queue;
  NSMutableArray *v10;
  NSMutableArray *brailleEventQueue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCROBrailleEventDispatcher;
  v5 = -[SCROBrailleEventDispatcher init](&v13, sel_init);
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    queueLock = v5->_queueLock;
    v5->_queueLock = v6;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_storeWeak(&v5->_target, v4);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    queue = v5->_queue;
    v5->_queue = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    brailleEventQueue = v5->_brailleEventQueue;
    v5->_brailleEventQueue = v10;

    v5->_isValid = 1;
  }

  return v5;
}

- (void)dealloc
{
  NSLock *queueLock;
  NSLock *v4;
  objc_super v5;

  -[SCROBrailleEventDispatcher invalidate](self, "invalidate");
  -[NSLock lock](self->_queueLock, "lock");
  queueLock = self->_queueLock;
  self->_queueLock = 0;
  v4 = queueLock;

  -[NSLock unlock](v4, "unlock");
  v5.receiver = self;
  v5.super_class = (Class)SCROBrailleEventDispatcher;
  -[SCROBrailleEventDispatcher dealloc](&v5, sel_dealloc);
}

- (void)start
{
  __CFRunLoopSource *v3;
  CFRunLoopSourceContext v4;

  -[NSLock lock](self->_queueLock, "lock");
  if (self->_isValid && !self->_runLoop && !self->_queueSource)
  {
    self->_runLoop = CFRunLoopGetCurrent();
    v4.version = 0;
    memset(&v4.retain, 0, 56);
    v4.info = self;
    v4.perform = (void (__cdecl *)(void *))_processQueue;
    v3 = CFRunLoopSourceCreate(0, 0, &v4);
    self->_queueSource = v3;
    CFRunLoopAddSource(self->_runLoop, v3, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  }
  -[NSLock unlock](self->_queueLock, "unlock");
}

- (void)invalidate
{
  __CFRunLoopSource *queueSource;
  NSMutableArray *brailleEventQueue;
  NSMutableArray *queue;

  -[NSLock lock](self->_queueLock, "lock");
  self->_isValid = 0;
  queueSource = self->_queueSource;
  if (queueSource)
  {
    CFRunLoopSourceInvalidate(queueSource);
    CFRelease(self->_queueSource);
    self->_queueSource = 0;
  }
  brailleEventQueue = self->_brailleEventQueue;
  self->_brailleEventQueue = 0;

  queue = self->_queue;
  self->_queue = 0;

  self->_runLoop = 0;
  objc_storeWeak(&self->_target, 0);
  -[NSLock unlock](self->_queueLock, "unlock");
}

- (BOOL)isValid
{
  BOOL isValid;

  -[NSLock lock](self->_queueLock, "lock");
  isValid = self->_isValid;
  -[NSLock unlock](self->_queueLock, "unlock");
  return isValid;
}

- (void)enqueueEvent:(id)a3
{
  int v4;
  NSMutableArray **p_queue;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "type");
  -[NSLock lock](self->_queueLock, "lock");
  if (self->_queueSource && self->_runLoop)
  {
    if (v4)
    {
      p_queue = &self->_queue;
      if (-[NSMutableArray count](self->_queue, "count") >= 51)
        -[NSMutableArray removeObjectAtIndex:](*p_queue, "removeObjectAtIndex:", 0);
    }
    else
    {
      p_queue = &self->_brailleEventQueue;
    }
    -[NSMutableArray addObject:](*p_queue, "addObject:", v6);
    CFRunLoopSourceSignal(self->_queueSource);
    CFRunLoopWakeUp(self->_runLoop);
  }
  -[NSLock unlock](self->_queueLock, "unlock");

}

- (void)_processQueue
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_queueLock, "lock");
  v3 = (void *)-[NSMutableArray copy](self->_brailleEventQueue, "copy");
  -[NSMutableArray removeAllObjects](self->_brailleEventQueue, "removeAllObjects");
  v4 = (void *)-[NSMutableArray copy](self->_queue, "copy");
  -[NSMutableArray removeAllObjects](self->_queue, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained(&self->_target);
  -[NSLock unlock](self->_queueLock, "unlock");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v24 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __43__SCROBrailleEventDispatcher__processQueue__block_invoke;
  v20[3] = &unk_24CC1D908;
  v22 = v23;
  v8 = v6;
  v21 = v8;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v20);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __43__SCROBrailleEventDispatcher__processQueue__block_invoke_2;
  v18[3] = &unk_24CC1D930;
  v9 = WeakRetained;
  v19 = v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v18);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v8, "reverseObjectEnumerator", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "handleEvent:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v25, 16);
    }
    while (v11);
  }

  _Block_object_dispose(v23, 8);
}

void __43__SCROBrailleEventDispatcher__processQueue__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 29)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

uint64_t __43__SCROBrailleEventDispatcher__processQueue__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleEvent:", a2);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_brailleEventQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queueLock, 0);
}

@end
