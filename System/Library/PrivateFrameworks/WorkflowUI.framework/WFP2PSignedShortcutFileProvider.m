@implementation WFP2PSignedShortcutFileProvider

- (WFP2PSignedShortcutFileProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  id v6;
  WFP2PSignedShortcutFileProvider *v7;
  id v8;
  void *v9;
  void *v10;
  WFP2PSignedShortcutFileProvider *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFP2PSignedShortcutFileProvider;
  v7 = -[WFSignedShortcutFileProvider initWithWorkflow:userInterface:](&v13, sel_initWithWorkflow_userInterface_, v6, a4);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BEC3F28]);
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_msgSend(v8, "initWithWorkflow:sharingOptions:", v6, v9);
    -[WFWorkflowItemProvider setShortcutExporter:](v7, "setShortcutExporter:", v10);

    v11 = v7;
  }

  return v7;
}

- (id)shareShortcutEventForActivityType:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFP2PSignedShortcutFileProvider;
  -[WFWorkflowItemProvider shareShortcutEventForActivityType:](&v5, sel_shareShortcutEventForActivityType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharingMode:", *MEMORY[0x24BEC4680]);
  return v3;
}

- (void)generateItemURL
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  dispatch_semaphore_t v7;

  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  v3 = dispatch_semaphore_create(0);
  -[WFWorkflowItemProvider shortcutExporter](self, "shortcutExporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke;
  v6[3] = &unk_24E604DD8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "exportWorkflowWithCompletion:", v6);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  intptr_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BE19370];
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_2;
    v12 = &unk_24E604E80;
    v6 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v6;
    objc_msgSend(v5, "alertWithError:confirmationHandler:", a3, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInterface", v9, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentAlert:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setWorkflowURL:", a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

intptr_t __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_3;
  block[3] = &unk_24E604D88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __50__WFP2PSignedShortcutFileProvider_generateItemURL__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
