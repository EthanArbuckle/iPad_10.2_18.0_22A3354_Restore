@implementation SBLockScreenPluginAction

- (BOOL)isCallAction
{
  return 0;
}

+ (id)action
{
  return (id)objc_msgSend(a1, "actionWithCompletion:", 0);
}

+ (id)actionWithCompletion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCompletion:", v4);

  return v5;
}

- (SBLockScreenPluginAction)init
{
  return -[SBLockScreenPluginAction initWithCompletion:](self, "initWithCompletion:", 0);
}

- (SBLockScreenPluginAction)initWithCompletion:(id)a3
{
  id v4;
  SBLockScreenPluginAction *v5;
  SBLockScreenPluginAction *v6;
  void *v7;
  uint64_t v8;
  id completion;
  id v10;
  id v11;
  uint64_t v12;
  BSAction *action;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBLockScreenPluginAction;
  v5 = -[SBLockScreenPluginAction init](&v17, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (void *)objc_msgSend(v4, "copy");
    v8 = MEMORY[0x2199F42EC]();
    completion = v6->_completion;
    v6->_completion = (id)v8;

    v10 = objc_alloc(MEMORY[0x24BE0BD80]);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __47__SBLockScreenPluginAction_initWithCompletion___block_invoke;
    v15[3] = &unk_24D4D0528;
    v16 = v7;
    v11 = v7;
    v12 = objc_msgSend(v10, "initWithInfo:timeout:forResponseOnQueue:withHandler:", 0, MEMORY[0x24BDAC9B8], v15, 0.0);
    action = v6->_action;
    v6->_action = (BSAction *)v12;

  }
  return v6;
}

void __47__SBLockScreenPluginAction_initWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "error");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, _QWORD))(v2 + 16))(v2, objc_msgSend(v3, "code") == 0, 0);

  }
}

- (void)sendResponseWithSuccess:(BOOL)a3
{
  BSAction *action;
  id v4;

  action = self->_action;
  objc_msgSend(MEMORY[0x24BE0BD90], "response", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAction sendResponse:](action, "sendResponse:", v4);

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (void)setAuthenticationPolicy:(int64_t)a3
{
  self->_authenticationPolicy = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (BOOL)isApplicationAction
{
  return 0;
}

- (BOOL)isEmergencyDialerAction
{
  return 0;
}

@end
