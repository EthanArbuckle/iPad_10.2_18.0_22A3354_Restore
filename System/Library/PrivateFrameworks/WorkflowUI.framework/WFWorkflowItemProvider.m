@implementation WFWorkflowItemProvider

- (WFWorkflowItemProvider)initWithWorkflow:(id)a3 userInterface:(id)a4 placeholderItem:(id)a5
{
  id v9;
  id v10;
  WFWorkflowItemProvider *v11;
  WFWorkflowItemProvider *v12;
  WFWorkflowItemProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowItemProvider;
  v11 = -[UIActivityItemProvider initWithPlaceholderItem:](&v15, sel_initWithPlaceholderItem_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workflow, a3);
    objc_storeStrong((id *)&v12->_userInterface, a4);
    v13 = v12;
  }

  return v12;
}

- (NSURL)workflowURL
{
  NSURL *workflowURL;

  workflowURL = self->_workflowURL;
  if (!workflowURL)
  {
    -[WFWorkflowItemProvider generateItemURL](self, "generateItemURL");
    workflowURL = self->_workflowURL;
  }
  return workflowURL;
}

- (BOOL)hasWorkflowURL
{
  return self->_workflowURL != 0;
}

- (void)generateItemURL
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[5];
  NSObject *v15;
  _QWORD block[5];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v3 = MEMORY[0x24BDAC9B8];
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__17935;
  v19[4] = __Block_byref_object_dispose__17936;
  v20 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke;
  block[3] = &unk_24E604DB0;
  v18 = v19;
  block[4] = self;
  v6 = v4;
  v17 = v6;
  dispatch_async(v3, block);

  -[WFWorkflowItemProvider shortcutExporter](self, "shortcutExporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_4;
  v14[3] = &unk_24E604DD8;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "exportWorkflowWithCompletion:", v14);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (-[WFWorkflowItemProvider shouldShowSuccessCheckmark](self, "shouldShowSuccessCheckmark") && self->_workflowURL)
  {
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_7;
    v13[3] = &unk_24E604F20;
    v13[4] = v19;
    v9 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

    v10 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v8, v10);
  }
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_8;
  v12[3] = &unk_24E604E00;
  v12[4] = self;
  v12[5] = v19;
  v11 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

  _Block_object_dispose(v19, 8);
}

- (id)shareShortcutEventForActivityType:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x24BEC4028];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[WFWorkflowItemProvider workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionCount:", objc_msgSend(v8, "count"));

  -[WFWorkflowItemProvider workflow](self, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "associatedAppBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddToSiriBundleIdentifier:", v10);

  -[WFWorkflowItemProvider workflow](self, "workflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "galleryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGalleryIdentifier:", v12);

  objc_msgSend(v6, "setSharingDestinationBundleIdentifier:", v5);
  return v6;
}

- (id)item
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowItemProvider setShouldShowSuccessCheckmark:](self, "setShouldShowSuccessCheckmark:", objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.my.linkcopier")));
  -[WFWorkflowItemProvider workflowURL](self, "workflowURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFWorkflowItemProvider shareShortcutEventForActivityType:](self, "shareShortcutEventForActivityType:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "track");
    v6 = v4;

  }
  return v4;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a5.width >= a5.height)
    height = a5.height;
  else
    height = a5.width;
  v6 = (void *)MEMORY[0x24BEC1688];
  -[WFWorkflowItemProvider workflow](self, "workflow", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithIcon:size:", v8, height, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UIImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Shortcut: %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowItemProvider workflow](self, "workflow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc(MEMORY[0x24BEC1688]);
  -[WFWorkflowItemProvider workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIcon:", v6);

  objc_msgSend(v7, "setRounded:", 0);
  objc_msgSend(v7, "imageWithSize:", 40.0, 40.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UIImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  -[WFWorkflowItemProvider workflow](self, "workflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithObject:", v9);
  objc_msgSend(v10, "setIconProvider:", v13);

  return v10;
}

- (void)setWorkflowURL:(id)a3
{
  objc_storeStrong((id *)&self->_workflowURL, a3);
}

- (WFShortcutExporter)shortcutExporter
{
  return self->_shortcutExporter;
}

- (void)setShortcutExporter:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutExporter, a3);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

- (BOOL)shouldShowSuccessCheckmark
{
  return self->_shouldShowSuccessCheckmark;
}

- (void)setShouldShowSuccessCheckmark:(BOOL)a3
{
  self->_shouldShowSuccessCheckmark = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterface, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_shortcutExporter, 0);
  objc_storeStrong((id *)&self->_workflowURL, 0);
}

void __41__WFWorkflowItemProvider_generateItemURL__block_invoke(uint64_t a1)
{
  WFActivityProgressController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v2 = -[WFActivityProgressController initWithTitle:]([WFActivityProgressController alloc], "initWithTitle:", 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_2556557C8))
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      do
      {
        objc_msgSend(v10, "presentedViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "presentedViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v12;
      }
      while (v13);
    }
    else
    {
      v12 = v10;
    }
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_2;
    v16[3] = &unk_24E604E80;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v15;
    objc_msgSend(v14, "presentFrom:cancellationHandler:", v12, v16);

  }
}

void __41__WFWorkflowItemProvider_generateItemURL__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v11 = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_5;
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

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setState:", 1);
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_9;
  v4[3] = &unk_24E604D88;
  v4[4] = v1;
  return objc_msgSend(v2, "dismissWithCompletion:", v4);
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasWorkflowURL");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  return result;
}

intptr_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_5(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_6;
  block[3] = &unk_24E604D88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

intptr_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_3;
  block[3] = &unk_24E604D88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
