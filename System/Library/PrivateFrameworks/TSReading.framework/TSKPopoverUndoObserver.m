@implementation TSKPopoverUndoObserver

- (TSKPopoverUndoObserver)init
{
  TSKPopoverUndoObserver *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKPopoverUndoObserver;
  v2 = -[TSKPopoverUndoObserver init](&v4, sel_init);
  if (v2)
  {
    v2->mPopoverBasedViewControllers = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v2->mPopoverControllers = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverUndoObserver;
  -[TSKPopoverUndoObserver dealloc](&v3, sel_dealloc);
}

+ (id)sharedObserver
{
  if (sharedObserver_once != -1)
    dispatch_once(&sharedObserver_once, &__block_literal_global_16);
  return (id)sharedObserver_s_undoObserver;
}

TSKPopoverUndoObserver *__40__TSKPopoverUndoObserver_sharedObserver__block_invoke()
{
  TSKPopoverUndoObserver *result;

  result = objc_alloc_init(TSKPopoverUndoObserver);
  sharedObserver_s_undoObserver = (uint64_t)result;
  return result;
}

- (void)setObservedUndoManager:(id)a3
{
  NSUndoManager *mUndoManager;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  NSUndoManager *v12;
  NSUndoManager *v13;
  NSUndoManager *v14;

  mUndoManager = self->mUndoManager;
  if (a3)
  {
    if (!mUndoManager)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!mUndoManager)
  {
LABEL_3:
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKPopoverUndoObserver setObservedUndoManager:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverUndoObserver.m"), 50, CFSTR("In [TSKPopoverUndoObserver setObservedUndoManager:] mUndoManager must be nil when setting a non-nil undoManager, and non-nil when setting a nil undoManager."));
  }
LABEL_4:
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = v8;
  v10 = (_QWORD *)MEMORY[0x24BDD13D0];
  v11 = (_QWORD *)MEMORY[0x24BDD13C8];
  if (self->mUndoManager)
  {
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x24BDD13D0]);
    objc_msgSend(v9, "removeObserver:name:object:", self, *v11, self->mUndoManager);
    v12 = self->mUndoManager;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;
  v14 = (NSUndoManager *)a3;
  self->mUndoManager = v14;
  if (v14)
  {
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_undoManagerWillUndo_, *v10, v14);
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_undoManagerWillRedo_, *v11, self->mUndoManager);
  }
}

- (void)undoManagerWillUndo:(id)a3
{
  NSMutableSet *mPopoverControllers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableSet *mPopoverBasedViewControllers;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  mPopoverControllers = self->mPopoverControllers;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverControllers, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(mPopoverControllers);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "dismissOnUndo"))
          objc_msgSend(v9, "dismissPopoverAnimated:", 1);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverControllers, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  mPopoverBasedViewControllers = self->mPopoverBasedViewControllers;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverBasedViewControllers, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(mPopoverBasedViewControllers);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        if (objc_msgSend(v15, "dismissOnUndo"))
          objc_msgSend(v15, "dismissAnimated:", 1);
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverBasedViewControllers, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }
}

- (void)undoManagerWillRedo:(id)a3
{
  NSMutableSet *mPopoverControllers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableSet *mPopoverBasedViewControllers;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  mPopoverControllers = self->mPopoverControllers;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverControllers, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(mPopoverControllers);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "dismissOnUndo"))
          objc_msgSend(v9, "dismissPopoverAnimated:", 1);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverControllers, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  mPopoverBasedViewControllers = self->mPopoverBasedViewControllers;
  v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverBasedViewControllers, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(mPopoverBasedViewControllers);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        if (objc_msgSend(v15, "dismissOnUndo"))
          objc_msgSend(v15, "dismissAnimated:", 1);
      }
      v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mPopoverBasedViewControllers, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }
}

- (void)addPopoverController:(id)a3
{
  -[NSMutableSet addObject:](self->mPopoverControllers, "addObject:", a3);
}

- (void)removePopoverController:(id)a3
{
  -[NSMutableSet removeObject:](self->mPopoverControllers, "removeObject:", a3);
}

- (void)addPopoverBasedViewController:(id)a3
{
  -[NSMutableSet addObject:](self->mPopoverBasedViewControllers, "addObject:", a3);
}

- (void)removePopoverBasedViewController:(id)a3
{
  -[NSMutableSet removeObject:](self->mPopoverBasedViewControllers, "removeObject:", a3);
}

- (NSUndoManager)observedUndoManager
{
  return self->mUndoManager;
}

@end
