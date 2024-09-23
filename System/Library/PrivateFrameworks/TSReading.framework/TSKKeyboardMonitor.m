@implementation TSKKeyboardMonitor

+ (id)sharedKeyboardMonitor
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)sharedKeyboardMonitor_sSingletonInstance;
  if (!sharedKeyboardMonitor_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedKeyboardMonitor_sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedKeyboardMonitor_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKKeyboardMonitor sharedKeyboardMonitor]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 188, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)sharedKeyboardMonitor_sSingletonInstance;
  }
  return result;
}

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSKKeyboardMonitor;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

- (TSKKeyboardMonitor)init
{
  TSKKeyboardMonitor *v2;
  TSKKeyboardMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKKeyboardMonitor;
  v2 = -[TSKKeyboardMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_keyboardIsVisibleAndDocked = 0;
    -[TSKKeyboardMonitor p_installKeyboardNotifications](v2, "p_installKeyboardNotifications");
  }
  return v3;
}

- (void)p_installKeyboardNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_keyboardWillShowOrDock_, *MEMORY[0x24BDF7B80], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_keyboardDidShowOrDock_, *MEMORY[0x24BDF7A00], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_keyboardWillHideOrUndock_, *MEMORY[0x24BDF7B78], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_keyboardDidHideOrUndock_, *MEMORY[0x24BDF79F8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_KeyboardWillChangeFrame_, *MEMORY[0x24BDF7B70], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_KeyboardDidChangeFrame_, *MEMORY[0x24BDF79F0], 0);
}

- (BOOL)keyboardIsAnimating
{
  return self->_keyboardIsAnimatingInOrDocking || self->_keyboardIsAnimatingOutOrUndocking;
}

- (void)dealloc
{
  __CFArray *keyboardObservers;
  void *v4;
  uint64_t v5;
  objc_super v6;

  -[TSKKeyboardMonitor p_removeKeyboardNotifications](self, "p_removeKeyboardNotifications");
  keyboardObservers = self->_keyboardObservers;
  if (keyboardObservers)
  {
    CFRelease(keyboardObservers);
    self->_keyboardObservers = 0;
  }

  self->_completionBlocks = 0;
  if (self->_exclusiveKeyboardObserver)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKKeyboardMonitor dealloc]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 123, CFSTR("expected nil value for '%s'"), "_exclusiveKeyboardObserver");
  }
  v6.receiver = self;
  v6.super_class = (Class)TSKKeyboardMonitor;
  -[TSKKeyboardMonitor dealloc](&v6, sel_dealloc);
}

- (void)setRootWindow:(id)a3
{
  self->_rootWindow = (UIWindow *)a3;
}

- (void)addKeyboardObserver:(id)a3
{
  __CFArray *keyboardObservers;

  keyboardObservers = self->_keyboardObservers;
  if (!keyboardObservers)
  {
    keyboardObservers = CFArrayCreateMutable(0, 0, 0);
    self->_keyboardObservers = keyboardObservers;
  }
  if ((-[__CFArray containsObject:](keyboardObservers, "containsObject:", a3) & 1) == 0)
    -[__CFArray addObject:](self->_keyboardObservers, "addObject:", a3);
}

- (void)removeKeyboardObserver:(id)a3
{
  __CFArray *keyboardObservers;

  keyboardObservers = self->_keyboardObservers;
  if (keyboardObservers)
  {
    -[__CFArray removeObject:](self->_keyboardObservers, "removeObject:", a3);
    if (!-[__CFArray count](keyboardObservers, "count"))
    {
      CFRelease(self->_keyboardObservers);
      self->_keyboardObservers = 0;
    }
  }
}

- (void)setModalKeyboardObserver:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3 && self->_exclusiveKeyboardObserver)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKKeyboardMonitor setModalKeyboardObserver:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 163, CFSTR("setModalKeyboardObserver is in a bad state."));
  }
  self->_exclusiveKeyboardObserver = (TSKKeyboardObserver *)a3;
}

- (void)setKeyboardHiddenByModalObserver:(id)a3
{
  void *v4;
  uint64_t v5;

  if (self->_exclusiveKeyboardObserver != a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKKeyboardMonitor setKeyboardHiddenByModalObserver:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 170, CFSTR("setKeyboardHiddenByModalObserver - called by a non exclusive observer."));
  }
  *(_WORD *)&self->_keyboardIsVisibleAndDocked = 0;
  self->_keyboardIsAnimatingOutOrUndocking = 0;
}

- (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  NSMutableArray *completionBlocks;

  completionBlocks = self->_completionBlocks;
  if (!completionBlocks)
  {
    completionBlocks = (NSMutableArray *)objc_opt_new();
    self->_completionBlocks = completionBlocks;
  }
  -[NSMutableArray addObject:](completionBlocks, "addObject:", (id)objc_msgSend(a3, "copy"));
}

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKKeyboardMonitor allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 188, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

+ (void)addKeyboardObserver:(id)a3
{
  objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "addKeyboardObserver:", a3);
}

+ (void)removeKeyboardObserver:(id)a3
{
  objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "removeKeyboardObserver:", a3);
}

+ (void)setModalKeyboardObserver:(id)a3
{
  objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "setModalKeyboardObserver:", a3);
}

+ (void)setKeyboardHiddenByModalObserver:(id)a3
{
  objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "setKeyboardHiddenByModalObserver:", a3);
}

+ (BOOL)keyboardIsVisibleAndDocked
{
  return objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "keyboardIsVisibleAndDocked");
}

+ (BOOL)keyboardIsAnimating
{
  return objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "keyboardIsAnimating");
}

+ (BOOL)keyboardIsAnimatingInOrDocking
{
  return objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "keyboardIsAnimatingInOrDocking");
}

+ (BOOL)keyboardIsAnimatingOutOrUndocking
{
  return objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "keyboardIsAnimatingOutOrUndocking");
}

+ (void)afterKeyboardAnimationPerformBlock:(id)a3
{
  objc_msgSend((id)objc_msgSend(a1, "sharedKeyboardMonitor"), "afterKeyboardAnimationPerformBlock:", a3);
}

- (double)keyboardHeightInView:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = -[TSKKeyboardMonitor p_keyboardFrameView](self, "p_keyboardFrameView");
  -[TSKKeyboardMonitor keyboardFrame](self, "keyboardFrame");
  if (v9 <= 0.0)
    return 0.0;
  objc_msgSend((id)objc_msgSend(a3, "superview"), "convertRect:fromView:", v5, v6, v7, v8, v9);
  v11 = v10;
  objc_msgSend(a3, "frame");
  return fmax(v12 - v11, 0.0);
}

- (id)p_keyboardFrameView
{
  id result;

  if (!objc_msgSend((id)-[UIWindow subviews](self->_rootWindow, "subviews"), "count"))
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow");
  result = (id)objc_msgSend((id)-[UIWindow subviews](self->_rootWindow, "subviews"), "objectAtIndex:", 0);
  if (!result)
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow");
  return result;
}

- (void)p_updateKeyboardInfoFromNotification:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  void *v16;
  double v17;

  objc_opt_class();
  v5 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDF7A20]);
  v6 = TSUDynamicCast();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[TSKKeyboardMonitor p_keyboardFrameView](self, "p_keyboardFrameView");
    if (!v8)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKKeyboardMonitor.m"), 289, CFSTR("Can't calculate keyboard bounds without a root view."));
    }
    objc_msgSend(v7, "CGRectValue");
    objc_msgSend(v8, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v11;
    self->_keyboardFrame.origin.y = v12;
    self->_keyboardFrame.size.width = v13;
    self->_keyboardFrame.size.height = v14;
    -[UIWindow frame](self->_rootWindow, "frame");
    objc_msgSend(v8, "convertRect:fromView:", 0);
    self->_onScreenHeight = v15 - self->_keyboardFrame.origin.y;
  }
  v16 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend((id)objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDF79C0]), "doubleValue");
  self->_keyboardAnimationDuration = v17;
}

- (void)p_performAnimationCompletionBlocksWithVisible:(BOOL)a3
{
  NSMutableArray *completionBlocks;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  uint64_t v12;
  _QWORD v13[5];
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  completionBlocks = self->_completionBlocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completionBlocks, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x24BDAC760];
    v10 = MEMORY[0x24BDAC9B8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(completionBlocks);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __68__TSKKeyboardMonitor_p_performAnimationCompletionBlocksWithVisible___block_invoke;
        v13[3] = &unk_24D82A9A8;
        v13[4] = v12;
        v14 = a3;
        dispatch_async(v10, v13);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completionBlocks, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  self->_completionBlocks = 0;
}

uint64_t __68__TSKKeyboardMonitor_p_performAnimationCompletionBlocksWithVisible___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)p_removeKeyboardNotifications
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
}

- (void)p_enumerateObserversUsingBlock:(id)a3
{
  CFArrayRef Copy;
  __CFArray *keyboardObservers;
  CFArrayRef v6;

  if (self->_exclusiveKeyboardObserver)
  {
    Copy = CFArrayCreate(0, (const void **)&self->_exclusiveKeyboardObserver, 1, 0);
  }
  else
  {
    keyboardObservers = self->_keyboardObservers;
    if (!keyboardObservers)
      return;
    Copy = CFArrayCreateCopy(0, keyboardObservers);
  }
  v6 = Copy;
  -[__CFArray enumerateObjectsUsingBlock:](Copy, "enumerateObjectsUsingBlock:", a3);
  CFRelease(v6);
}

- (void)p_keyboardWillShowOrDock:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];

  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  if (fabs(self->_keyboardFrame.size.width) >= 0.00999999978 && fabs(self->_keyboardFrame.size.height) >= 0.00999999978)
  {
    if (self->_keyboardIsAnimatingOutOrUndocking)
    {
      self->_keyboardIsAnimatingOutOrUndocking = 0;
      -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", &__block_literal_global_13);
    }
    v5 = MEMORY[0x24BDAC760];
    *(_WORD *)&self->_keyboardIsVisibleAndDocked = 257;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __47__TSKKeyboardMonitor_p_keyboardWillShowOrDock___block_invoke_2;
    v6[3] = &unk_24D82AA10;
    v6[4] = a3;
    -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);
  }
  else
  {
    self->_weAreFakingAHideEvent = 1;
    if (self->_keyboardIsVisibleAndDocked)
      -[TSKKeyboardMonitor p_keyboardWillHideOrUndock:](self, "p_keyboardWillHideOrUndock:", a3);
    else
      self->_suppressDidHide = 1;
  }
}

uint64_t __47__TSKKeyboardMonitor_p_keyboardWillShowOrDock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardHideCanceled");
  return result;
}

uint64_t __47__TSKKeyboardMonitor_p_keyboardWillShowOrDock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardWillShowOrDock:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)p_keyboardDidShowOrDock:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];

  if (self->_weAreFakingAHideEvent)
  {
    if (!self->_suppressDidHide)
      -[TSKKeyboardMonitor p_keyboardDidHideOrUndock:](self, "p_keyboardDidHideOrUndock:", a3);
    *(_WORD *)&self->_weAreFakingAHideEvent = 256;
    self->_suppressDidHide = 0;
  }
  else if (self->_keyboardIsAnimatingInOrDocking)
  {
    -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:", a3);
    v5 = MEMORY[0x24BDAC760];
    self->_keyboardIsAnimatingInOrDocking = 0;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __46__TSKKeyboardMonitor_p_keyboardDidShowOrDock___block_invoke;
    v6[3] = &unk_24D82AA10;
    v6[4] = a3;
    -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);
    -[TSKKeyboardMonitor p_performAnimationCompletionBlocksWithVisible:](self, "p_performAnimationCompletionBlocksWithVisible:", 1);
  }
}

uint64_t __46__TSKKeyboardMonitor_p_keyboardDidShowOrDock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardDidShowOrDock:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)p_keyboardWillHideOrUndock:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];

  self->_suppressDidHide = 0;
  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  if (self->_keyboardIsAnimatingInOrDocking)
  {
    self->_keyboardIsAnimatingInOrDocking = 0;
    -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", &__block_literal_global_45);
  }
  if (self->_keyboardIsVisibleAndDocked || !self->_lastHideWasFake)
  {
    self->_keyboardIsVisibleAndDocked = 0;
    v5 = MEMORY[0x24BDAC760];
    self->_keyboardIsAnimatingOutOrUndocking = 1;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __49__TSKKeyboardMonitor_p_keyboardWillHideOrUndock___block_invoke_2;
    v6[3] = &unk_24D82AA10;
    v6[4] = a3;
    -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);
  }
}

uint64_t __49__TSKKeyboardMonitor_p_keyboardWillHideOrUndock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardShowCanceled");
  return result;
}

uint64_t __49__TSKKeyboardMonitor_p_keyboardWillHideOrUndock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardWillHideOrUndock:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)p_keyboardDidHideOrUndock:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];

  if (self->_keyboardIsAnimatingOutOrUndocking)
  {
    -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
    v5 = MEMORY[0x24BDAC760];
    self->_keyboardIsAnimatingOutOrUndocking = 0;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __48__TSKKeyboardMonitor_p_keyboardDidHideOrUndock___block_invoke;
    v6[3] = &unk_24D82AA10;
    v6[4] = a3;
    -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v6);
    -[TSKKeyboardMonitor p_performAnimationCompletionBlocksWithVisible:](self, "p_performAnimationCompletionBlocksWithVisible:", 0);
    self->_lastHideWasFake = 0;
  }
}

uint64_t __48__TSKKeyboardMonitor_p_keyboardDidHideOrUndock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardDidHideOrUndock:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)p_KeyboardWillChangeFrame:(id)a3
{
  _QWORD v5[5];

  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__TSKKeyboardMonitor_p_KeyboardWillChangeFrame___block_invoke;
  v5[3] = &unk_24D82AA10;
  v5[4] = a3;
  -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v5);
}

uint64_t __48__TSKKeyboardMonitor_p_KeyboardWillChangeFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardWillChangeFrame:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)p_KeyboardDidChangeFrame:(id)a3
{
  _QWORD v5[5];

  -[TSKKeyboardMonitor p_updateKeyboardInfoFromNotification:](self, "p_updateKeyboardInfoFromNotification:");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__TSKKeyboardMonitor_p_KeyboardDidChangeFrame___block_invoke;
  v5[3] = &unk_24D82AA10;
  v5[4] = a3;
  -[TSKKeyboardMonitor p_enumerateObserversUsingBlock:](self, "p_enumerateObserversUsingBlock:", v5);
}

uint64_t __47__TSKKeyboardMonitor_p_KeyboardDidChangeFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "keyboardDidChangeFrame:", *(_QWORD *)(a1 + 32));
  return result;
}

- (UIWindow)rootWindow
{
  return self->_rootWindow;
}

- (BOOL)keyboardIsVisibleAndDocked
{
  return self->_keyboardIsVisibleAndDocked;
}

- (BOOL)keyboardIsAnimatingInOrDocking
{
  return self->_keyboardIsAnimatingInOrDocking;
}

- (BOOL)keyboardIsAnimatingOutOrUndocking
{
  return self->_keyboardIsAnimatingOutOrUndocking;
}

- (CGRect)keyboardFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_keyboardFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)onScreenHeight
{
  return self->_onScreenHeight;
}

- (double)keyboardAnimationDuration
{
  return self->_keyboardAnimationDuration;
}

@end
