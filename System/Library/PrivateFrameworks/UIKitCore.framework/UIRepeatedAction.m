@implementation UIRepeatedAction

+ (id)_invocationForTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v15;

  v7 = a3;
  v15 = a5;
  objc_msgSend(v7, "methodSignatureForSelector:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  v10 = objc_msgSend(v8, "numberOfArguments");
  if (v10 <= 1)
  {
    NSStringFromSelector(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: method '%@' requires more than 1 argument"), "+[UIRepeatedAction _invocationForTarget:selector:object:]", v11);

LABEL_4:
    v12 = 0;
    goto LABEL_8;
  }
  v13 = v10;
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTarget:", v7);
  objc_msgSend(v12, "setSelector:", a4);
  if (v13 != 2)
    objc_msgSend(v12, "setArgument:atIndex:", &v15, 2);
  objc_msgSend(v12, "retainArguments");
LABEL_8:

  return v12;
}

+ (UIRepeatedAction)actionWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTarget:selector:object:", v9, a4, v8);

  return (UIRepeatedAction *)v10;
}

- (UIRepeatedAction)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  id v9;
  void *v10;
  UIRepeatedAction *v11;

  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_invocationForTarget:selector:object:", v9, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[UIRepeatedAction initWithInvocation:](self, "initWithInvocation:", v10);
    -[UIRepeatedAction setInvocationArgument:](self, "setInvocationArgument:", v8);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UIRepeatedAction)initWithInvocation:(id)a3
{
  id v5;
  UIRepeatedAction *v6;
  UIRepeatedAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRepeatedAction;
  v6 = -[UIRepeatedAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_invocation, a3);
    *(_OWORD *)&v7->_preInvocationDelay = xmmword_186684BA0;
    v7->_repeatedDelay = 0.1;
  }

  return v7;
}

- (void)scheduleWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[UIRepeatedAction _resetInternalState](self, "_resetInternalState");
  objc_msgSend((id)objc_opt_class(), "_invocationForTarget:selector:object:", v9, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIRepeatedAction setInvocation:](self, "setInvocation:", v10);
  -[UIRepeatedAction setInvocationArgument:](self, "setInvocationArgument:", v8);

  -[UIRepeatedAction schedule](self, "schedule");
}

- (BOOL)invoke
{
  void *v3;
  double v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  -[UIRepeatedAction invocation](self, "invocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_didCompletePreInvocationDelay)
  {
    -[UIRepeatedAction preInvocationDelay](self, "preInvocationDelay");
    if (v4 <= 0.0)
      goto LABEL_5;
  }
  objc_msgSend(v3, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "__isKindOfUIResponder");

  if (!v6)
    goto LABEL_5;
  objc_msgSend(v3, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "selector");
  -[UIRepeatedAction invocationArgument](self, "invocationArgument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v7, "canPerformAction:withSender:", v8, v9);

  if (!(_DWORD)v8)
  {
    v10 = 0;
  }
  else
  {
LABEL_5:
    objc_msgSend(v3, "invoke");
    v10 = 1;
  }

  return v10;
}

- (void)_adjustInvocationForPhase:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[UIRepeatedAction invocationArgument](self, "invocationArgument");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = (id)v5;
    -[UIRepeatedAction invocation](self, "invocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "numberOfArguments") > 1)
    {
      -[UIRepeatedAction delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        return;
      -[UIRepeatedAction delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "repeatedAction:willInvokeWithObject:forPhase:", self, self->_invocationArgument, a3);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v11;
      if (self->_invocationArgument == v11)
        goto LABEL_8;
      -[UIRepeatedAction setInvocationArgument:](self, "setInvocationArgument:");
      -[UIRepeatedAction invocation](self, "invocation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setArgument:atIndex:", &self->_invocationArgument, 2);
    }
    else
    {

    }
    v10 = v11;
LABEL_8:

  }
}

- (BOOL)_shouldInvokeRepeatedActionForPhase:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;

  -[UIRepeatedAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "shouldInvokeRepeatedAction:forPhase:", self, a3);
  else
    v7 = 1;

  return v7;
}

- (void)_preInvocationTimerFire
{
  BOOL v3;

  if (!-[UIRepeatedAction _shouldInvokeRepeatedActionForPhase:](self, "_shouldInvokeRepeatedActionForPhase:", 1))
  {
    self->_didCompletePreInvocationDelay = 1;
    goto LABEL_5;
  }
  -[UIRepeatedAction _adjustInvocationForPhase:](self, "_adjustInvocationForPhase:", 1);
  v3 = -[UIRepeatedAction invoke](self, "invoke");
  self->_didCompletePreInvocationDelay = 1;
  if (v3)
LABEL_5:
    -[UIRepeatedAction schedule](self, "schedule");
}

- (void)_invocationTimerFire
{
  BOOL v3;

  if (!-[UIRepeatedAction _shouldInvokeRepeatedActionForPhase:](self, "_shouldInvokeRepeatedActionForPhase:", 2))
  {
    self->_didCompleteInvocationDelay = 1;
    goto LABEL_5;
  }
  -[UIRepeatedAction _adjustInvocationForPhase:](self, "_adjustInvocationForPhase:", 2);
  v3 = -[UIRepeatedAction invoke](self, "invoke");
  self->_didCompleteInvocationDelay = 1;
  if (v3)
LABEL_5:
    -[UIRepeatedAction schedule](self, "schedule");
}

- (void)_repeatedTimerFire
{
  if (!-[UIRepeatedAction _shouldInvokeRepeatedActionForPhase:](self, "_shouldInvokeRepeatedActionForPhase:", 3)
    || (-[UIRepeatedAction _adjustInvocationForPhase:](self, "_adjustInvocationForPhase:", 3),
        -[UIRepeatedAction invoke](self, "invoke")))
  {
    -[UIRepeatedAction schedule](self, "schedule");
  }
}

- (void)schedule
{
  void *v3;
  void *v4;
  char *v5;
  double v6;
  double v7;
  id v8;

  -[UIRepeatedAction timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIRepeatedAction setTimer:](self, "setTimer:", 0);
  if (self->_skipInitialFire && !self->_didCompletePreInvocationDelay)
    self->_didCompletePreInvocationDelay = 1;
  if (self->_didCompleteInvocationDelay)
  {
    if (-[UIRepeatedAction disableRepeat](self, "disableRepeat"))
    {
      -[UIRepeatedAction setTimer:](self, "setTimer:", 0);
      return;
    }
    v4 = (void *)MEMORY[0x1E0C99E88];
    -[UIRepeatedAction repeatedDelay](self, "repeatedDelay");
    v5 = sel__repeatedTimerFire;
    goto LABEL_11;
  }
  if (!self->_didCompletePreInvocationDelay)
  {
    -[UIRepeatedAction preInvocationDelay](self, "preInvocationDelay");
    if (v6 == 0.0)
    {
      -[UIRepeatedAction _preInvocationTimerFire](self, "_preInvocationTimerFire");
      return;
    }
    v4 = (void *)MEMORY[0x1E0C99E88];
    -[UIRepeatedAction preInvocationDelay](self, "preInvocationDelay");
    v5 = sel__preInvocationTimerFire;
    goto LABEL_11;
  }
  if (!-[UIRepeatedAction disableRepeat](self, "disableRepeat"))
  {
    -[UIRepeatedAction invocationDelay](self, "invocationDelay");
    if (v7 == 0.0)
    {
      -[UIRepeatedAction _invocationTimerFire](self, "_invocationTimerFire");
      return;
    }
    v4 = (void *)MEMORY[0x1E0C99E88];
    -[UIRepeatedAction invocationDelay](self, "invocationDelay");
    v5 = sel__invocationTimerFire;
LABEL_11:
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, v5, 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIRepeatedAction setTimer:](self, "setTimer:", v8);

  }
}

- (void)invalidate
{
  void *v3;

  -[UIRepeatedAction timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIRepeatedAction setTimer:](self, "setTimer:", 0);
  -[UIRepeatedAction setInvocation:](self, "setInvocation:", 0);
  -[UIRepeatedAction setInvocationArgument:](self, "setInvocationArgument:", 0);
}

- (void)_resetInternalState
{
  -[UIRepeatedAction invalidate](self, "invalidate");
  *(_WORD *)&self->_didCompletePreInvocationDelay = 0;
}

- (void)reset
{
  -[UIRepeatedAction _resetInternalState](self, "_resetInternalState");
  *(_OWORD *)&self->_preInvocationDelay = xmmword_186684BA0;
  self->_repeatedDelay = 0.1;
  *(_WORD *)&self->_disableRepeat = 0;
}

- (void)setPreInvocationDelay:(double)a3
{
  void *v4;
  int v5;

  self->_preInvocationDelay = a3;
  -[UIRepeatedAction timer](self, "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
    -[UIRepeatedAction schedule](self, "schedule");
}

- (void)setInvocationDelay:(double)a3
{
  void *v4;
  int v5;

  self->_invocationDelay = a3;
  -[UIRepeatedAction timer](self, "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
    -[UIRepeatedAction schedule](self, "schedule");
}

- (void)setRepeatedDelay:(double)a3
{
  self->_repeatedDelay = a3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIRepeatedAction invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIRepeatedAction;
  -[UIRepeatedAction dealloc](&v3, sel_dealloc);
}

- (double)preInvocationDelay
{
  return self->_preInvocationDelay;
}

- (double)invocationDelay
{
  return self->_invocationDelay;
}

- (double)repeatedDelay
{
  return self->_repeatedDelay;
}

- (BOOL)disableRepeat
{
  return self->_disableRepeat;
}

- (void)setDisableRepeat:(BOOL)a3
{
  self->_disableRepeat = a3;
}

- (BOOL)skipInitialFire
{
  return self->_skipInitialFire;
}

- (void)setSkipInitialFire:(BOOL)a3
{
  self->_skipInitialFire = a3;
}

- (NSInvocation)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_invocation, a3);
}

- (id)invocationArgument
{
  return self->_invocationArgument;
}

- (void)setInvocationArgument:(id)a3
{
  objc_storeStrong(&self->_invocationArgument, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (UIRepeatedActionDelegate)delegate
{
  return (UIRepeatedActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_invocationArgument, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end
