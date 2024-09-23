@implementation SWContentRuleManager

- (SWContentRuleManager)initWithUserContentController:(id)a3
{
  id v5;
  SWContentRuleManager *v6;
  SWContentRuleManager *v7;
  dispatch_group_t v8;
  OS_dispatch_group *dispatchGroup;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SWContentRuleManager;
  v6 = -[SWContentRuleManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userContentController, a3);
    v8 = dispatch_group_create();
    dispatchGroup = v7->_dispatchGroup;
    v7->_dispatchGroup = (OS_dispatch_group *)v8;

  }
  return v7;
}

- (void)addContentRuleList:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a4;
  v7 = a3;
  -[SWContentRuleManager dispatchGroup](self, "dispatchGroup");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v8);

  objc_msgSend(MEMORY[0x24BDFA8C8], "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__SWContentRuleManager_addContentRuleList_identifier___block_invoke;
  v10[3] = &unk_24DA0BA98;
  v10[4] = self;
  objc_msgSend(v9, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", v6, v7, v10);

}

void __54__SWContentRuleManager_addContentRuleList_identifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "userContentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addContentRuleList:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v6);

}

- (void)removeContentListForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[SWContentRuleManager dispatchGroup](self, "dispatchGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v5);

  objc_msgSend(MEMORY[0x24BDFA8C8], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SWContentRuleManager_removeContentListForIdentifier___block_invoke;
  v7[3] = &unk_24DA0BA98;
  v7[4] = self;
  objc_msgSend(v6, "lookUpContentRuleListForIdentifier:completionHandler:", v4, v7);

}

void __55__SWContentRuleManager_removeContentListForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "userContentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeContentRuleList:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v6);

}

- (id)configureContentRules
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x24BE6CF70]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SWContentRuleManager_configureContentRules__block_invoke;
  v5[3] = &unk_24DA0BAC0;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithResolver:", v5);
}

void __45__SWContentRuleManager_configureContentRules__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dispatchGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SWContentRuleManager_configureContentRules__block_invoke_2;
  block[3] = &unk_24DA0BA68;
  v7 = v3;
  v5 = v3;
  dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __45__SWContentRuleManager_configureContentRules__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (WKUserContentController)userContentController
{
  return self->_userContentController;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_userContentController, 0);
}

@end
