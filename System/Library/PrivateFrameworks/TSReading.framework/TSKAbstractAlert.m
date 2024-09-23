@implementation TSKAbstractAlert

- (TSKAbstractAlert)init
{
  TSKAbstractAlert *v2;
  TSKAbstractAlert *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKAbstractAlert;
  v2 = -[TSKAbstractAlert init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_result = 0;
    v2->_cancelOnEnterBackground = 0;
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id clickedBlock;
  id dismissedBlock;
  objc_super v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D0], 0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);
  -[TSKAbstractAlert setRetainedDelegate:](self, "setRetainedDelegate:", 0);
  clickedBlock = self->_clickedBlock;
  if (clickedBlock)
    _Block_release(clickedBlock);
  dismissedBlock = self->_dismissedBlock;
  if (dismissedBlock)
    _Block_release(dismissedBlock);
  v7.receiver = self;
  v7.super_class = (Class)TSKAbstractAlert;
  -[TSKAbstractAlert dealloc](&v7, sel_dealloc);
}

- (int64_t)addButtonWithTitle:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert addButtonWithTitle:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 67, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert addButtonWithTitle:]"), 0));
}

- (void)showWithDelegate:(id)a3 context:(id)a4
{
  self->_delegate = (TSKUIAlertProtocol *)a3;
  -[TSKAbstractAlert setContext:](self, "setContext:", a4);
  -[TSKAbstractAlert show](self, "show");
}

- (void)show
{
  TSKAbstractAlert *v3;

  self->_result = 0x7FFFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_inBackground = 0;
  *(_WORD *)&self->_didPresentAlertView = 0;
  v3 = self;
  -[TSKAbstractAlert showAlert](self, "showAlert");
}

- (void)showWithClickedButtonBlock:(id)a3
{
  TSKAbstractAlert *v4;

  self->_clickedBlock = _Block_copy(a3);
  self->_result = 0x7FFFFFFFFFFFFFFFLL;
  v4 = self;
  -[TSKAbstractAlert showAlert](self, "showAlert");
}

- (void)showWithDismissedByButtonBlock:(id)a3
{
  TSKAbstractAlert *v4;

  self->_dismissedBlock = _Block_copy(a3);
  self->_result = 0x7FFFFFFFFFFFFFFFLL;
  v4 = self;
  -[TSKAbstractAlert showAlert](self, "showAlert");
}

- (int64_t)showSynchronously
{
  TSKAbstractAlert *v3;
  int64_t result;
  const __CFString *v5;

  self->_delegate = 0;
  self->_result = 0x7FFFFFFFFFFFFFFFLL;
  *(_DWORD *)&self->_inBackground = 0;
  *(_WORD *)&self->_didPresentAlertView = 0;
  -[TSKAbstractAlert setContext:](self, "setContext:", 0);
  -[TSKAbstractAlert setCancelOnEnterBackground:](self, "setCancelOnEnterBackground:", 1);
  v3 = self;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "applicationState") == 2)
    -[TSKAbstractAlert enterBackground](self, "enterBackground");
  else
    -[TSKAbstractAlert showAlert](self, "showAlert");
  result = self->_result;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    do
    {
      CFRunLoopRunInMode(v5, 0.0, 1u);
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "applicationState") == 2
        && self->_didPresentAlertView)
      {
        -[TSKAbstractAlert enterBackground](self, "enterBackground");
      }
      result = self->_result;
    }
    while (result == 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (int64_t)result
{
  return self->_result;
}

- (id)buttonTitleAtIndex:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert buttonTitleAtIndex:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 159, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert buttonTitleAtIndex:]"), 0));
}

- (int64_t)numberOfButtons
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert numberOfButtons]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 164, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert numberOfButtons]"), 0));
}

- (int64_t)cancelButtonIndex
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert cancelButtonIndex]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 169, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert cancelButtonIndex]"), 0));
}

- (void)setCancelButtonIndex:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert setCancelButtonIndex:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 174, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert setCancelButtonIndex:]"), 0));
}

- (int64_t)firstOtherButtonIndex
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert firstOtherButtonIndex]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 179, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert firstOtherButtonIndex]"), 0));
}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert dismissWithClickedButtonIndex:animated:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 184, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert dismissWithClickedButtonIndex:animated:]"), 0));
}

- (void)clickedButtonAtIndex:(int64_t)a3
{
  void (**clickedBlock)(id, TSKAbstractAlert *, int64_t);

  if (!self->_clickedButtonAtIndex
    && (!-[TSKAbstractAlert inBackground](self, "inBackground")
     || -[TSKAbstractAlert cancelOnEnterBackground](self, "cancelOnEnterBackground")))
  {
    if (!self->_isDelegateRetained)
    {
      -[TSKAbstractAlert setRetainedDelegate:](self, "setRetainedDelegate:", self->_delegate);
      self->_isDelegateRetained = 1;
    }
    self->_clickedButtonAtIndex = 1;
    self->_result = a3;
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[TSKUIAlertProtocol alert:clickedButtonAtIndex:withContext:](self->_delegate, "alert:clickedButtonAtIndex:withContext:", self, a3, self->_context);
    clickedBlock = (void (**)(id, TSKAbstractAlert *, int64_t))self->_clickedBlock;
    if (clickedBlock)
      clickedBlock[2](clickedBlock, self, a3);
  }
}

- (void)didDismissWithButtonIndex:(int64_t)a3
{
  void (**dismissedBlock)(id, TSKAbstractAlert *, int64_t);
  TSKAbstractAlert *v6;

  if (!self->_didDismissWithButtonIndex
    && (!-[TSKAbstractAlert inBackground](self, "inBackground")
     || -[TSKAbstractAlert cancelOnEnterBackground](self, "cancelOnEnterBackground")))
  {
    self->_didDismissWithButtonIndex = 1;
    self->_result = a3;
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[TSKUIAlertProtocol alert:didDismissWithButtonIndex:withContext:](self->_delegate, "alert:didDismissWithButtonIndex:withContext:", self, a3, self->_context);
    dismissedBlock = (void (**)(id, TSKAbstractAlert *, int64_t))self->_dismissedBlock;
    if (dismissedBlock)
      dismissedBlock[2](dismissedBlock, self, a3);
    -[TSKAbstractAlert setCancelOnEnterBackground:](self, "setCancelOnEnterBackground:", 0);
    if (self->_isDelegateRetained)
    {
      -[TSKAbstractAlert setRetainedDelegate:](self, "setRetainedDelegate:", 0);
      self->_isDelegateRetained = 0;
    }
    self->_delegate = 0;
    v6 = self;
  }
}

- (void)willDismissWithButtonIndex:(int64_t)a3
{
  if (!self->_willDismissWithButtonIndex
    && (!-[TSKAbstractAlert inBackground](self, "inBackground")
     || -[TSKAbstractAlert cancelOnEnterBackground](self, "cancelOnEnterBackground")))
  {
    self->_willDismissWithButtonIndex = 1;
    if (self->_inBackground)
      -[TSKAbstractAlert didDismissWithButtonIndex:](self, "didDismissWithButtonIndex:", a3);
  }
}

- (void)_didPresentAlertView:(id)a3
{
  uint64_t v4;

  if (!self->_didPresentAlertView)
  {
    self->_didPresentAlertView = 1;
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "window"), "windowScene"), "activationState");
    if (v4 == 2 || v4 == -1)
      -[TSKAbstractAlert enterBackground](self, "enterBackground");
  }
}

- (void)willPresentAlertView
{
  if (!self->_willPresentAlertView)
    self->_willPresentAlertView = 1;
}

- (void)enterBackground
{
  if (!self->_inBackground && !self->_didDismissWithButtonIndex)
  {
    self->_inBackground = 1;
    self->_result = -[TSKAbstractAlert cancelButtonIndex](self, "cancelButtonIndex");
    -[TSKAbstractAlert clickedButtonAtIndex:](self, "clickedButtonAtIndex:", -[TSKAbstractAlert cancelButtonIndex](self, "cancelButtonIndex"));
    -[TSKAbstractAlert dismissWithClickedButtonIndex:animated:](self, "dismissWithClickedButtonIndex:animated:", -[TSKAbstractAlert cancelButtonIndex](self, "cancelButtonIndex"), 0);
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  _QWORD block[5];

  if (self->_inBackground && !self->_didDismissWithButtonIndex)
  {
    self->_inBackground = 0;
    if (!-[TSKAbstractAlert cancelOnEnterBackground](self, "cancelOnEnterBackground", a3))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__TSKAbstractAlert_applicationWillEnterForeground___block_invoke;
      block[3] = &unk_24D829278;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __51__TSKAbstractAlert_applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAlert");
}

- (void)showAlert
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAbstractAlert showAlert]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 329, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSKAbstractAlert showAlert]"), 0));
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (BOOL)cancelOnEnterBackground
{
  return self->_cancelOnEnterBackground;
}

- (void)setCancelOnEnterBackground:(BOOL)a3
{
  self->_cancelOnEnterBackground = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSKUIAlertProtocol)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSKUIAlertProtocol *)a3;
}

- (TSKUIAlertProtocol)retainedDelegate
{
  return self->_retainedDelegate;
}

- (void)setRetainedDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
