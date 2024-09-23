@implementation WTUISceneHostingActivationController

- (WTUISceneHostingActivationController)initWithStartupAction:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  id v8;
  WTUISceneHostingActivationController *v9;
  WTUISceneHostingActivationController *v10;
  uint64_t v11;
  id invalidationHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WTUISceneHostingActivationController;
  v9 = -[WTUISceneHostingActivationController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startupAction, a3);
    v11 = MEMORY[0x24BD1ABE8](v8);
    invalidationHandler = v10->_invalidationHandler;
    v10->_invalidationHandler = (id)v11;

  }
  return v10;
}

- (void)endManagingHostedSceneActivationForHostingController:(id)a3
{
  -[WTUISceneHostingActivationController setActivationHandle:](self, "setActivationHandle:", 0);
}

- (void)hostingController:(id)a3 isMovingToParentScene:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[WTUISceneHostingActivationController activationHandle](self, "activationHandle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  if (a4)
  {
    if ((v7 & 1) == 0)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __80__WTUISceneHostingActivationController_hostingController_isMovingToParentScene___block_invoke;
      v10[3] = &unk_251C07590;
      v10[4] = self;
      v8 = (void *)MEMORY[0x24BD1ABE8](v10);
      -[WTUISceneHostingActivationController activationHandle](self, "activationHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activate:", v8);

    }
  }
}

void __80__WTUISceneHostingActivationController_hostingController_isMovingToParentScene___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "startupAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActions:", v5);

}

- (void)activationHandleDidUpdate:(id)a3 forHostingController:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void (**v8)(void);
  id v9;

  v9 = a4;
  -[WTUISceneHostingActivationController activationHandle](self, "activationHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if ((v6 & 1) == 0)
  {
    -[WTUISceneHostingActivationController invalidationHandler](self, "invalidationHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WTUISceneHostingActivationController invalidationHandler](self, "invalidationHandler");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

    }
    objc_msgSend(v9, "invalidate");
  }

}

- (_UISceneHostingActivationHandle)activationHandle
{
  return (_UISceneHostingActivationHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActivationHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BSAction)startupAction
{
  return (BSAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartupAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_startupAction, 0);
  objc_storeStrong((id *)&self->_activationHandle, 0);
}

@end
