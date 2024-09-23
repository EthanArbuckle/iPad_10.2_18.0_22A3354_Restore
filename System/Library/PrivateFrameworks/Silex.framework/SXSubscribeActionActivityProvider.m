@implementation SXSubscribeActionActivityProvider

- (SXSubscribeActionActivityProvider)initWithHandler:(id)a3 viewControllerPresenting:(id)a4 actionManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXSubscribeActionActivityProvider *v12;
  SXSubscribeActionActivityProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXSubscribeActionActivityProvider;
  v12 = -[SXSubscribeActionActivityProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handler, a3);
    objc_storeStrong((id *)&v13->_viewControllerPresenting, a4);
    objc_storeWeak((id *)&v13->_actionManager, v11);
  }

  return v13;
}

- (id)activityGroupForAction:(id)a3
{
  SXActionActivityGroup *v4;
  SXBlockActionActivity *v5;
  void *v6;
  void *v7;
  SXBlockActionActivity *v8;
  _QWORD v10[5];

  v4 = -[SXActionActivityGroup initWithTitle:]([SXActionActivityGroup alloc], "initWithTitle:", 0);
  v5 = [SXBlockActionActivity alloc];
  SXBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Subscribe"), &stru_24D68E0F8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke;
  v10[3] = &unk_24D688798;
  v10[4] = self;
  v8 = -[SXBlockActionActivity initWithLabel:type:block:](v5, "initWithLabel:type:block:", v7, 0, v10);
  -[SXActionActivityGroup addActivity:](v4, "addActivity:", v8);

  return v4;
}

void __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD v15[4];
  _QWORD v16[2];

  v3 = a2;
  objc_msgSend(v3, "inAppPurchaseIdKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewControllerPresenting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "inAppPurchaseIdKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_2;
    v15[3] = &unk_24D68B1F8;
    v8 = (id *)v16;
    v9 = v3;
    v10 = *(_QWORD *)(a1 + 32);
    v16[0] = v9;
    v16[1] = v10;
    objc_msgSend(v5, "handleSubscribeActionOnPresenter:inAppPurchaseIdKey:completionBlock:", v6, v7, v15);

  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_3;
    v13[3] = &unk_24D68B1F8;
    v8 = (id *)v14;
    v11 = v3;
    v12 = *(_QWORD *)(a1 + 32);
    v14[0] = v11;
    v14[1] = v12;
    objc_msgSend(v5, "handleSubscribeActionOnPresenter:completionBlock:", v6, v13);
  }

}

uint64_t __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "postPurchaseAction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 1;
  if (a2 && v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "actionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performAction:postActionHandlers:", v5, MEMORY[0x24BDBD1A8]);

    v6 = 0;
  }

  return v6;
}

uint64_t __60__SXSubscribeActionActivityProvider_activityGroupForAction___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "postPurchaseAction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 1;
  if (a2 && v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "actionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performAction:postActionHandlers:", v5, MEMORY[0x24BDBD1A8]);

    v6 = 0;
  }

  return v6;
}

- (SXSubscribeActionHandler)handler
{
  return self->_handler;
}

- (SXViewControllerPresenting)viewControllerPresenting
{
  return self->_viewControllerPresenting;
}

- (SXActionManager)actionManager
{
  return (SXActionManager *)objc_loadWeakRetained((id *)&self->_actionManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_viewControllerPresenting, 0);
  objc_storeStrong((id *)&self->_handler, 0);
}

@end
