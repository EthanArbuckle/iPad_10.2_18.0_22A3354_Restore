@implementation SBSAssertion

- (SBSAssertion)initWithAssertionName:(id)a3 reason:(id)a4 receiveRight:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSAssertion *v11;
  uint64_t v12;
  NSString *assertionName;
  uint64_t v14;
  NSString *reason;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSAssertion;
  v11 = -[SBSAssertion init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    assertionName = v11->_assertionName;
    v11->_assertionName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    objc_storeStrong((id *)&v11->_receiveRight, a5);
  }

  return v11;
}

- (SBSAssertion)initWithAssertionName:(id)a3 reason:(id)a4 port:(unsigned int)a5
{
  uint64_t v5;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  SBSAssertion *v12;

  v5 = *(_QWORD *)&a5;
  v8 = (objc_class *)MEMORY[0x1E0D01798];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithPort:", v5);
  v12 = -[SBSAssertion initWithAssertionName:reason:receiveRight:](self, "initWithAssertionName:reason:receiveRight:", v10, v9, v11);

  return v12;
}

- (SBSAssertion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAssertion.m"), 41, CFSTR("use initWithAssertionName:..."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSAssertion;
  -[SBSAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[BSMachPortReceiveRight invalidate](self->_receiveRight, "invalidate");
}

- (BOOL)isValid
{
  return -[BSMachPortReceiveRight isValid](self->_receiveRight, "isValid");
}

- (void)addHandler:(id)a3 forDeathOfServerPort:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0D01810];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__SBSAssertion_addHandler_forDeathOfServerPort___block_invoke;
  v10[3] = &unk_1E288FA30;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "monitorSendRight:withHandler:", v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __48__SBSAssertion_addHandler_forDeathOfServerPort___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isValid"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)assertionName
{
  return self->_assertionName;
}

- (NSString)reason
{
  return self->_reason;
}

- (BSMachPortReceiveRight)receiveRight
{
  return self->_receiveRight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveRight, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_assertionName, 0);
}

@end
