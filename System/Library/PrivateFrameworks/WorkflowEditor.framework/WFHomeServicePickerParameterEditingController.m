@implementation WFHomeServicePickerParameterEditingController

- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  WFHomeServicePickerParameterEditingController *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEC3DE0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __104__WFHomeServicePickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke;
  v12[3] = &unk_24EE25628;
  v13 = v6;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v10, "ensureHomesAreLoadedWithCompletionHandler:", v12);

}

- (void)servicePickerDidFinish:(id)a3 selectedServices:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[WFHomeServicePickerParameterEditingController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEC3DB8]);
    objc_msgSend(v12, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHomeServicePickerParameterEditingController home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFSerializableHomeIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithService:homeIdentifier:", v7, v9);

    -[WFUIKitParameterEditingController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishEditingWithParameterState:", v10);

  }
  else
  {
    -[WFUIKitParameterEditingController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelEditing");
  }

}

- (void)servicePickerDidCancel:(id)a3
{
  id v3;

  -[WFUIKitParameterEditingController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelEditing");

}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

void __104__WFHomeServicePickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  WFHUShortcutsTriggerViewAccessoryViewController *v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeWithIdentifier:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v6 = (uint64_t)v11;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "primaryHome");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (id)v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "setHome:");
    objc_msgSend(*(id *)(a1 + 32), "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v9 = -[WFHUShortcutsTriggerViewAccessoryViewController initWithHome:services:]([WFHUShortcutsTriggerViewAccessoryViewController alloc], "initWithHome:services:", v12, v8);
    -[WFHUShortcutsTriggerViewAccessoryViewController setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

@end
