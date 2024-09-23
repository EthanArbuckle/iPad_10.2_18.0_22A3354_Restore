@implementation WFWorkflowLinkProvider

- (WFWorkflowLinkProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFWorkflowLinkProvider *v9;
  id v10;
  void *v11;
  void *v12;
  WFWorkflowLinkProvider *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  WFGallerySharingURLForIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowLinkProvider;
  v9 = -[WFWorkflowItemProvider initWithWorkflow:userInterface:placeholderItem:](&v15, sel_initWithWorkflow_userInterface_placeholderItem_, v6, v7, v8);

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BEC4050]);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_msgSend(v10, "initWithWorkflow:sharingOptions:", v6, v11);
    -[WFWorkflowItemProvider setShortcutExporter:](v9, "setShortcutExporter:", v12);

    v13 = v9;
  }

  return v9;
}

- (id)shareShortcutEventForActivityType:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowLinkProvider;
  -[WFWorkflowItemProvider shareShortcutEventForActivityType:](&v5, sel_shareShortcutEventForActivityType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSharingMode:", *MEMORY[0x24BEC4690]);
  return v3;
}

- (void)generateItemURL
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD block[5];
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  _QWORD v24[4];
  NSObject *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  v3 = dispatch_semaphore_create(0);
  -[UIActivityItemProvider activityType](self, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Create iCloud Link"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Anyone with access to this shared link will be able to view the contents of this shortcut."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("is.workflow.my.linkcopier")))
    v7 = CFSTR("Copy Link");
  else
    v7 = CFSTR("Share");
  WFLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v5);
  objc_msgSend(v9, "setMessage:", v6);
  v10 = (void *)MEMORY[0x24BE19378];
  v11 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __41__WFWorkflowLinkProvider_generateItemURL__block_invoke;
  v24[3] = &unk_24E604D88;
  v12 = v3;
  v25 = v12;
  objc_msgSend(v10, "cancelButtonWithHandler:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v13);

  v14 = (void *)MEMORY[0x24BE19378];
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_2;
  v21[3] = &unk_24E604E00;
  v23 = &v26;
  v15 = v12;
  v22 = v15;
  objc_msgSend(v14, "buttonWithTitle:style:preferred:handler:", v8, 0, 1, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v16);

  -[WFWorkflowItemProvider userInterface](self, "userInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAlert:", v9);

  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v27 + 24))
  {
    v19.receiver = self;
    v19.super_class = (Class)WFWorkflowLinkProvider;
    -[WFWorkflowItemProvider generateItemURL](&v19, sel_generateItemURL);
  }
  else
  {
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_3;
    block[3] = &unk_24E604D88;
    block[4] = self;
    v18 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  _Block_object_dispose(&v26, 8);

}

- (id)item
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Check out the shortcut I built!"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE8F6E0];
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE8F6E0]))
  {
    WFLocalizedString(CFSTR("Check out the shortcut I built! #SiriShortcuts"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.activity.homescreen")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.activity.launchcenter")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.activity.submit")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.my.filesharer")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("is.workflow.my.fileduplicator")) & 1) != 0)
  {
    goto LABEL_14;
  }
  +[WFReportShortcutActivity activityType](WFReportShortcutActivity, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    -[WFWorkflowLinkProvider exclusiveActivityType](self, "exclusiveActivityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && !objc_msgSend(v9, "isEqualToString:", v3))
    {
      v13 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v18.receiver = self;
    v18.super_class = (Class)WFWorkflowLinkProvider;
    -[WFWorkflowItemProvider item](&v18, sel_item);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    if (!v10)
    {
      if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE8F6B8]) & 1) != 0
        || objc_msgSend(v3, "isEqualToString:", v5))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v4, v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE8F6A8]))
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        -[WFWorkflowItemProvider workflow](self, "workflow");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("<html><body>%@ <a href=\"%@\">%@</a></body></html>"), v4, v11, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
    }
    v12 = v11;
LABEL_20:
    v13 = v12;
    goto LABEL_21;
  }
LABEL_14:
  v13 = 0;
LABEL_23:

  return v13;
}

- (NSString)exclusiveActivityType
{
  return self->_exclusiveActivityType;
}

- (void)setExclusiveActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusiveActivityType, 0);
}

intptr_t __41__WFWorkflowLinkProvider_generateItemURL__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
