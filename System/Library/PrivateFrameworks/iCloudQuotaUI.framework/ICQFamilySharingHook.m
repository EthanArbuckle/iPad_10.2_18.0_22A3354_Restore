@implementation ICQFamilySharingHook

- (ICQFamilySharingHook)initWithFlowDelegate:(id)a3
{
  id v4;
  ICQFamilySharingHook *v5;
  ICQFamilySharingHook *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICQFamilySharingHook;
  v5 = -[ICQFamilySharingHook init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_flowDelegate, v4);

  return v6;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ICQActionFamilySetup"));

  return v4;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:](self, "_beginFamilySharingFlowWithCompletion:", a6, a4, a5);
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("OPEN_FAMILY_SETUP"));

  return v5;
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:](self, "_beginFamilySharingFlowWithCompletion:", a4);
}

- (id)continuationResponseBody
{
  return 0;
}

- (void)_beginFamilySharingFlowWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  FACircleStateController *v10;
  FACircleStateController *familyCircleStateController;
  void *v12;
  objc_class *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  FACircleStateController *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  uint64_t p_location;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v7 = (void *)getFACircleStateControllerClass_softClass_0;
  v31 = getFACircleStateControllerClass_softClass_0;
  v8 = (void *)MEMORY[0x24BDAC760];
  if (!getFACircleStateControllerClass_softClass_0)
  {
    location = (id)MEMORY[0x24BDAC760];
    p_location = 3221225472;
    v25 = (uint64_t)__getFACircleStateControllerClass_block_invoke_0;
    v26 = &unk_24E3F3868;
    v27 = &v28;
    __getFACircleStateControllerClass_block_invoke_0((uint64_t)&location);
    v7 = (void *)v29[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v28, 8);
  v10 = (FACircleStateController *)objc_msgSend([v9 alloc], "initWithPresenter:", v6);
  familyCircleStateController = self->_familyCircleStateController;
  self->_familyCircleStateController = v10;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v12 = (void *)getFACircleContextClass_softClass_0;
  v31 = getFACircleContextClass_softClass_0;
  if (!getFACircleContextClass_softClass_0)
  {
    location = v8;
    p_location = 3221225472;
    v25 = (uint64_t)__getFACircleContextClass_block_invoke_0;
    v26 = &unk_24E3F3868;
    v27 = &v28;
    __getFACircleContextClass_block_invoke_0((uint64_t)&location);
    v12 = (void *)v29[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v28, 8);
  v14 = [v13 alloc];
  location = 0;
  p_location = (uint64_t)&location;
  v25 = 0x2020000000;
  v15 = (_QWORD *)getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  v26 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr_0;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_0)
  {
    v16 = (void *)FamilyCircleUILibrary_0();
    v15 = dlsym(v16, "FACircleEventTypeInitiate");
    *(_QWORD *)(p_location + 24) = v15;
    getFACircleEventTypeInitiateSymbolLoc_ptr_0 = (uint64_t)v15;
  }
  _Block_object_dispose(&location, 8);
  if (!v15)
    -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:].cold.1();
  v17 = (void *)objc_msgSend(v14, "initWithEventType:", *v15);
  objc_msgSend(v17, "setClientName:", CFSTR("iCloudStorage"));
  objc_initWeak(&location, self);
  v18 = self->_familyCircleStateController;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __62__ICQFamilySharingHook__beginFamilySharingFlowWithCompletion___block_invoke;
  v20[3] = &unk_24E3F4750;
  objc_copyWeak(&v22, &location);
  v19 = v4;
  v21 = v19;
  -[FACircleStateController performOperationWithContext:completion:](v18, "performOperationWithContext:completion:", v17, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __62__ICQFamilySharingHook__beginFamilySharingFlowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Family sharing flow completed with success: %d, error: %@", (uint8_t *)v9, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "flowDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissUpgradeFlowWithSuccess:", a2);

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICQServerHookDelegate)flowDelegate
{
  return (ICQServerHookDelegate *)objc_loadWeakRetained((id *)&self->_flowDelegate);
}

- (void)setFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowDelegate, a3);
}

- (FACircleStateController)familyCircleStateController
{
  return (FACircleStateController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFamilyCircleStateController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyCircleStateController, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_beginFamilySharingFlowWithCompletion:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  -[ICQBackupStatusView _sizeToFitWidth:inTableView:].cold.1(v0);
}

@end
