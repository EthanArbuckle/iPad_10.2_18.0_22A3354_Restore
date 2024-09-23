@implementation WFStopSharingWorkflowActivity

- (id)activityType
{
  return CFSTR("com.apple.shortcuts.Activity.StopSharing");
}

- (id)activityTitle
{
  return WFLocalizedString(CFSTR("Stop Sharing"));
}

- (id)_systemImageName
{
  return CFSTR("icloud.slash");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "objectsMatchingClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "count") != 0;
  return (char)v3;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "objectsMatchingClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStopSharingWorkflowActivity setShortcut:](self, "setShortcut:", v5);

}

- (id)activityViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  WFStopSharingWorkflowActivity *v20;

  WFLocalizedString(CFSTR("Stop Sharing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBD3B0];
  WFLocalizedString(CFSTR("Are you sure you want to stop sharing this shortcut? The iCloud link will be deleted and will no longer work within a few minutes."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v3, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  WFLocalizedString(CFSTR("Cancel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x24BEBD3A8];
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke;
  v18 = &unk_24E6044F8;
  v11 = v6;
  v19 = v11;
  v20 = self;
  objc_msgSend(v10, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v3, 0, 0, 2, &v15, &__block_literal_global_135);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12, v15, v16, v17, v18);
  v13 = v11;

  return v13;
}

- (WFSharedShortcut)shortcut
{
  return self->_shortcut;
}

- (void)setShortcut:(id)a3
{
  objc_storeStrong((id *)&self->_shortcut, a3);
}

- (WFCloudKitTask)unshareTask
{
  return self->_unshareTask;
}

- (void)setUnshareTask:(id)a3
{
  objc_storeStrong((id *)&self->_unshareTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unshareTask, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
}

void __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke(uint64_t a1)
{
  WFActivityProgressViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  WFActivityProgressViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  WFActivityProgressViewController *v15;
  id v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "setTitle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMessage:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setActions:", MEMORY[0x24BDBD1A8]);
  v2 = objc_alloc_init(WFActivityProgressViewController);
  objc_msgSend(*(id *)(a1 + 32), "setContentViewController:", v2);
  objc_msgSend(MEMORY[0x24BEC3D80], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "shortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_2;
  v14[3] = &unk_24E6044A8;
  v15 = v2;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v16 = v6;
  v17 = v7;
  v8 = v2;
  objc_msgSend(v3, "unshareSharedShortcut:completionHandler:", v4, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setUnshareTask:", v9);

  v10 = (void *)MEMORY[0x24BEBD3A8];
  WFLocalizedString(CFSTR("Cancel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_8;
  v13[3] = &unk_24E6044D0;
  v13[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addAction:", v12);
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_9()
{
  return 0;
}

void __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_3;
  v7[3] = &unk_24E604480;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_8(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "unshareTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
}

void __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD block[5];

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setState:", 1);
    objc_msgSend(*(id *)(a1 + 48), "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_14692);

    v6 = dispatch_time(0, 900000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_5;
    block[3] = &unk_24E604D88;
    block[4] = *(_QWORD *)(a1 + 56);
    dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
    return;
  }
  if ((objc_msgSend(v2, "wf_isUserCancelledError") & 1) != 0)
    return;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB8EA8]) & 1) == 0)
  {

    goto LABEL_8;
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "code");

  if (v4 != 20)
  {
LABEL_8:
    v7 = (void *)MEMORY[0x24BE19370];
    v8 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_6;
    v14[3] = &unk_24E604E80;
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v15 = v9;
    v16 = v10;
    objc_msgSend(v7, "alertWithError:confirmationHandler:", v8, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFUserInterfaceFromViewController();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "presentAlert:", v11);
  }
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 1);
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_6(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_7;
  v3[3] = &unk_24E604D88;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", 0);
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 0);
}

@end
