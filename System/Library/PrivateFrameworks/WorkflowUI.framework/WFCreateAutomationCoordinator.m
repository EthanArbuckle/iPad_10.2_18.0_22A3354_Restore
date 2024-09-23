@implementation WFCreateAutomationCoordinator

- (WFCreateAutomationCoordinator)initWithDatabase:(id)a3 homeManager:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFCreateAutomationCoordinator *v11;
  WFCreateAutomationCoordinator *v12;
  uint64_t v13;
  WFTriggerManager *triggerManager;
  WFCreateAutomationCoordinator *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCreateAutomationCoordinator.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCreateAutomationCoordinator.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeManager"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFCreateAutomationCoordinator;
  v11 = -[WFCreateAutomationCoordinator init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_database, a3);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEC4108]), "initWithDatabase:", v8);
    triggerManager = v12->_triggerManager;
    v12->_triggerManager = (WFTriggerManager *)v13;

    objc_storeStrong((id *)&v12->_homeManager, a4);
    v15 = v12;
  }

  return v12;
}

- (void)startAtStep:(unint64_t)a3 hostingViewController:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[5];
  id v17;
  unint64_t v18;

  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCreateAutomationCoordinator.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFCreateAutomationCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCreateAutomationCoordinator.m"), 80, CFSTR("Delegate must be set before starting this coordinator"));

  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFCreateAutomationCoordinator_startAtStep_hostingViewController_completion___block_invoke;
  aBlock[3] = &unk_24E604970;
  v17 = v10;
  v18 = a3;
  aBlock[4] = self;
  v12 = v10;
  v13 = _Block_copy(aBlock);
  if (a3 >= 2)
  {
    if (a3 == 2)
      -[WFCreateAutomationCoordinator buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:hostingViewController:completion:](self, "buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:hostingViewController:completion:", 1, v9, v13);
  }
  else
  {
    -[WFCreateAutomationCoordinator buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:completion:](self, "buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:completion:", 1, v13);
  }

}

- (void)buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:(unint64_t)a3 completion:(id)a4
{
  WFAutomationSelectTypeViewController *v6;
  void *v7;
  WFAutomationSelectTypeViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a4;
  v6 = [WFAutomationSelectTypeViewController alloc];
  -[WFCreateAutomationCoordinator triggerManager](self, "triggerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFAutomationSelectTypeViewController initWithTriggerManager:](v6, "initWithTriggerManager:", v7);

  -[WFAutomationSelectTypeViewController setDelegate:](v8, "setDelegate:", self);
  -[WFAutomationSelectTypeViewController navigationItem](v8, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);

  if (a3 == 1)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    -[WFAutomationSelectTypeViewController navigationItem](v8, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    goto LABEL_5;
  }
  if (!a3)
  {
    -[WFAutomationSelectTypeViewController navigationItem](v8, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", 0);
LABEL_5:

  }
  v12[2](v12, v8);

}

- (void)buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:(unint64_t)a3 hostingViewController:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(void *, void *);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(void *, void *);
  void (**v31)(id, void *);
  _QWORD v32[5];
  void (**v33)(void *, void *);
  void (**v34)(id, void *);
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD aBlock[7];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v31 = (void (**)(id, void *))a5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke;
  aBlock[3] = &unk_24E604998;
  aBlock[4] = self;
  aBlock[5] = a2;
  aBlock[6] = a3;
  v30 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[WFCreateAutomationCoordinator homeManager](self, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homesToWhichWeCanAddHomeAutomations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2](v30, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v31[2](v31, v13);
    }
    else if ((unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      v29 = v9;
      WFLocalizedString(CFSTR("Choose a Home to Automate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x24BEBD3A8];
            objc_msgSend(v20, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke_2;
            v32[3] = &unk_24E6049C0;
            v23 = v30;
            v32[4] = v20;
            v33 = v23;
            v34 = v31;
            objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v32);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addAction:", v24);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v17);
      }

      v25 = (void *)MEMORY[0x24BEBD3A8];
      WFLocalizedString(CFSTR("Cancel"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v27);

      v9 = v29;
      objc_msgSend(v29, "presentViewController:animated:completion:", v14, 1, 0);

    }
  }
  else
  {
    -[WFCreateAutomationCoordinator openHomeApp](self, "openHomeApp");
  }

}

- (void)finishWithTriggerRecord:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
    _os_log_impl(&dword_22007E000, v5, OS_LOG_TYPE_DEBUG, "%s WFCreateAutomationCoordinator is finished", buf, 0xCu);
  }

  getWFTriggersLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_INFO, "%s Updating workflow and trigger", buf, 0xCu);
    }

    -[WFCreateAutomationCoordinator workflow](self, "workflow");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFCreateAutomationCoordinator database](self, "database");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCreateAutomationCoordinator workflow](self, "workflow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "record");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCreateAutomationCoordinator workflowReference](self, "workflowReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v13 = objc_msgSend(v9, "saveRecord:withDescriptor:error:", v11, v12, &v19);
      v8 = v19;

      if ((v13 & 1) == 0)
      {
        getWFTriggersLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
          _os_log_impl(&dword_22007E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to save edited workflow", buf, 0xCu);
        }

      }
    }
    objc_initWeak((id *)buf, self);
    -[WFCreateAutomationCoordinator triggerManager](self, "triggerManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCreateAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke;
    v17[3] = &unk_24E604A10;
    objc_copyWeak(&v18, (id *)buf);
    objc_msgSend(v15, "updateConfiguredTrigger:triggerID:notifyDaemon:completion:", v4, v16, 0, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]";
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_INFO, "%s No trigger to save; was a Home Automation", buf, 0xCu);
    }

    -[WFCreateAutomationCoordinator delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createAutomationCoordinatorDidFinish:", self);
  }

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  getWFTriggersLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[WFCreateAutomationCoordinator cancel]";
    _os_log_impl(&dword_22007E000, v3, OS_LOG_TYPE_DEBUG, "%s WFCreateAutomationCoordinator was cancelled", buf, 0xCu);
  }

  -[WFCreateAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__WFCreateAutomationCoordinator_cancel__block_invoke;
    block[3] = &unk_24E604D88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[WFCreateAutomationCoordinator triggerManager](self, "triggerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCreateAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__WFCreateAutomationCoordinator_cancel__block_invoke_2;
    v8[3] = &unk_24E604A10;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "deleteTriggerWithIdentifier:notifyDaemon:completion:", v7, 1, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)openHomeApp
{
  id v2;
  id v3;

  v2 = objc_alloc(MEMORY[0x24BE19398]);
  v3 = (id)objc_msgSend(v2, "initWithBundleIdentifier:options:URL:userActivity:", *MEMORY[0x24BEC16D8], 0, 0, 0);
  objc_msgSend(v3, "performWithCompletionHandler:", &__block_literal_global_16399);

}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  getWFTriggersLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[WFCreateAutomationCoordinator triggerEditor:didFinishWithTriggerBuilder:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_DEBUG, "%s didFinishWithTriggerBuilder: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v5)
    -[WFCreateAutomationCoordinator finishWithTriggerRecord:](self, "finishWithTriggerRecord:", 0);
  else
    -[WFCreateAutomationCoordinator cancel](self, "cancel");

}

- (void)selectTypeViewController:(id)a3 didChooseTrigger:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = (void *)objc_opt_class();
  if ((objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCreateAutomationCoordinator.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger.class isSubclassOfClass:[WFTrigger class]]"));

  }
  v11 = (id)objc_msgSend(objc_alloc(+[WFTriggerConfigurationViewController viewControllerClassForTriggerClass:](WFTriggerConfigurationViewController, "viewControllerClassForTriggerClass:", objc_opt_class())), "initWithTrigger:mode:", v6, 0);

  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLargeTitleDisplayMode:", 2);

  -[WFCreateAutomationCoordinator navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v11, 1);

}

- (void)selectTypeViewController:(id)a3 didChooseAutomationType:(unint64_t)a4
{
  id v6;
  id *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  if (a4 == 1)
  {
    objc_initWeak(&location, self);
    -[WFCreateAutomationCoordinator navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke_2;
    v9[3] = &unk_24E604A78;
    objc_copyWeak(&v10, &location);
    -[WFCreateAutomationCoordinator buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:hostingViewController:completion:](self, "buildViewControllerForHomeTriggerChooserStepWithBackButtonAction:hostingViewController:completion:", 0, v8, v9);

    v7 = &v10;
    goto LABEL_5;
  }
  if (!a4)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke;
    v11[3] = &unk_24E604A78;
    objc_copyWeak(&v12, &location);
    -[WFCreateAutomationCoordinator buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:completion:](self, "buildViewControllerForPersonalTriggerChooserStepWithBackButtonAction:completion:", 0, v11);
    v7 = &v12;
LABEL_5:
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }

}

- (void)triggerConfigurationViewController:(id)a3 didFinishWithTrigger:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  WFTriggerSuggestionViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (objc_class *)MEMORY[0x24BEC3BB8];
  v7 = a4;
  v8 = a3;
  v15 = objc_alloc_init(v6);
  objc_msgSend(v7, "serializedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTriggerData:", v9);

  objc_msgSend(v15, "setShouldPrompt:", objc_msgSend(v8, "runImmediately") ^ 1);
  objc_msgSend(v15, "setShouldNotify:", objc_msgSend(v8, "shouldNotify"));
  v10 = objc_msgSend(v8, "shouldRecur");

  objc_msgSend(v15, "setShouldRecur:", v10);
  objc_msgSend(v15, "setEnabled:", 1);
  objc_msgSend(v15, "setSource:", 0);
  objc_msgSend(v15, "setNotificationLevel:", 0);
  -[WFCreateAutomationCoordinator setTriggerRecord:](self, "setTriggerRecord:", v15);
  v11 = -[WFTriggerSuggestionViewController initWithTrigger:selectedEntryMetadataData:selectedReference:]([WFTriggerSuggestionViewController alloc], "initWithTrigger:selectedEntryMetadataData:selectedReference:", v7, 0, 0);

  -[WFTriggerSuggestionViewController setDelegate:](v11, "setDelegate:", self);
  -[WFTriggerSuggestionViewController navigationItem](v11, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setSupportsTwoLineLargeTitles:", 1);

  -[WFTriggerSuggestionViewController navigationItem](v11, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLargeTitleDisplayMode:", 1);

  -[WFCreateAutomationCoordinator navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v11, 1);

}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 actions:(id)a4 editable:(BOOL)a5 selectedEntryMetadata:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  BOOL v27;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEditableShortcut:", v7);

  -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelectedEntryMetadata:", v12);

  v15 = objc_alloc_init(MEMORY[0x24BEC41B0]);
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Automation %@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setName:", v19);

  objc_msgSend(v15, "record");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHiddenFromLibraryAndSync:", 1);

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v11, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertActions:atIndexes:", v11, v21);

  }
  objc_initWeak(&location, self);
  -[WFCreateAutomationCoordinator triggerManager](self, "triggerManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "record");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke;
  v25[3] = &unk_24E604AA0;
  objc_copyWeak(&v26, &location);
  v27 = v7;
  objc_msgSend(v22, "saveNewConfiguredTrigger:workflow:notifyDaemon:completion:", v23, v24, 1, v25);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 reference:(id)a4 selectedEntryMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _BYTE location[12];
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BEC3C20], "defaultDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BEC41B0], "workflowWithReference:database:error:", v9, v11, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  if (v12)
  {
    -[WFCreateAutomationCoordinator setWorkflowReference:](self, "setWorkflowReference:", v9);
    -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEditableShortcut:", 0);

    -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSelectedEntryMetadata:", v10);

    objc_initWeak((id *)location, self);
    -[WFCreateAutomationCoordinator triggerManager](self, "triggerManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke;
    v19[3] = &unk_24E604AF0;
    v19[4] = self;
    objc_copyWeak(&v21, (id *)location);
    v20 = v9;
    objc_msgSend(v16, "saveNewConfiguredTrigger:notifyDaemon:completion:", v17, 1, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    getWFTriggersLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "-[WFCreateAutomationCoordinator triggerSuggestionViewControllerDidFinish:reference:selec"
                                "tedEntryMetadata:]";
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_22007E000, v18, OS_LOG_TYPE_ERROR, "%s Could not get workflow from reference %@ with error %@", location, 0x20u);
    }

  }
}

- (void)triggerComposeViewController:(id)a3 didFinishWithWorkflow:(id)a4
{
  void *v5;
  id v6;

  -[WFCreateAutomationCoordinator setWorkflow:](self, "setWorkflow:", a4);
  -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCreateAutomationCoordinator trackAddAutomationWithRecord:](self, "trackAddAutomationWithRecord:", v5);

  -[WFCreateAutomationCoordinator trackAddAutomationActions](self, "trackAddAutomationActions");
  -[WFCreateAutomationCoordinator triggerRecord](self, "triggerRecord");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFCreateAutomationCoordinator finishWithTriggerRecord:](self, "finishWithTriggerRecord:", v6);

}

- (void)triggerComposeViewControllerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = "-[WFCreateAutomationCoordinator triggerComposeViewControllerDidCancel:]";
    _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_DEBUG, "%s WFTriggerConfigurationViewController was cancelled", (uint8_t *)&v8, 0xCu);
  }

  -[WFCreateAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFCreateAutomationCoordinator triggerManager](self, "triggerManager");
    v6 = objc_claimAutoreleasedReturnValue();
    -[WFCreateAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject deleteTriggerWithIdentifier:notifyDaemon:completion:](v6, "deleteTriggerWithIdentifier:notifyDaemon:completion:", v7, 1, &__block_literal_global_164);

  }
  else
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[WFCreateAutomationCoordinator triggerComposeViewControllerDidCancel:]";
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_ERROR, "%s No triggerIdentifier to delete for trigger configuration cancellation", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)automationSummaryViewController:(id)a3 didFinishWithTrigger:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  getWFTriggersLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[WFCreateAutomationCoordinator automationSummaryViewController:didFinishWithTrigger:]";
    _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_DEBUG, "%s summary VC did finish", (uint8_t *)&v7, 0xCu);
  }

  -[WFCreateAutomationCoordinator trackAddAutomationWithRecord:](self, "trackAddAutomationWithRecord:", v5);
  -[WFCreateAutomationCoordinator trackAddAutomationActions](self, "trackAddAutomationActions");
  -[WFCreateAutomationCoordinator finishWithTriggerRecord:](self, "finishWithTriggerRecord:", v5);

}

- (void)trackAddAutomationWithRecord:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x24BEC3A80];
  v5 = a3;
  v15 = objc_alloc_init(v4);
  -[WFCreateAutomationCoordinator workflowReference](self, "workflowReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActionCount:", objc_msgSend(v6, "actionCount"));

  objc_msgSend(v15, "setSource:", CFSTR("AutomationTab"));
  v7 = (void *)MEMORY[0x24BEC4100];
  objc_msgSend(v5, "triggerData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerWithSerializedData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTriggerType:", v11);

  -[WFCreateAutomationCoordinator workflowReference](self, "workflowReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShortcutIdentifier:", v13);

  objc_msgSend(v15, "setShowsNotification:", objc_msgSend(v5, "shouldNotify"));
  v14 = objc_msgSend(v5, "shouldPrompt");

  objc_msgSend(v15, "setRequiresRuntimeConfirmation:", v14);
  objc_msgSend(v15, "track");

}

- (void)trackAddAutomationActions
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[WFCreateAutomationCoordinator workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__WFCreateAutomationCoordinator_trackAddAutomationActions__block_invoke;
  v5[3] = &unk_24E604B38;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (WFCreateAutomationCoordinatorDelegate)delegate
{
  return (WFCreateAutomationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_triggerManager, a3);
}

- (NSString)triggerIdentifier
{
  return self->_triggerIdentifier;
}

- (void)setTriggerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_triggerIdentifier, a3);
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (WFConfiguredTriggerRecord)triggerRecord
{
  return self->_triggerRecord;
}

- (void)setTriggerRecord:(id)a3
{
  objc_storeStrong((id *)&self->_triggerRecord, a3);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_workflow, a3);
}

- (WFWorkflowReference)workflowReference
{
  return self->_workflowReference;
}

- (void)setWorkflowReference:(id)a3
{
  objc_storeStrong((id *)&self->_workflowReference, a3);
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_workflowReference, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_triggerIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __58__WFCreateAutomationCoordinator_trackAddAutomationActions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x24BEC3A78];
  v6 = a2;
  v10 = objc_alloc_init(v5);
  objc_msgSend(*(id *)(a1 + 32), "workflowReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShortcutIdentifier:", v8);

  objc_msgSend(v6, "metricsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setActionIdentifier:", v9);
  objc_msgSend(v10, "setActionIndex:", a3);
  objc_msgSend(v10, "track");

}

void __71__WFCreateAutomationCoordinator_triggerComposeViewControllerDidCancel___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFCreateAutomationCoordinator triggerComposeViewControllerDidCancel:]_block_invoke";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_22007E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to delete configured trigger: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTriggerIdentifier:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "triggerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "triggerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke_2;
  v8[3] = &unk_24E604AC8;
  v9 = v7;
  v10 = WeakRetained;
  objc_msgSend(v5, "associateWorkflowToTriggerID:deletingExistingReference:notifyDaemon:workflowReference:completion:", v6, 0, 1, v9, v8);

}

void __106__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 136315650;
      v13 = "-[WFCreateAutomationCoordinator triggerSuggestionViewControllerDidFinish:reference:selectedEntryMetadata:]_block_invoke_2";
      v14 = 2112;
      v15 = v7;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to update configured trigger with reference %@: error: %{public}@", (uint8_t *)&v12, 0x20u);
    }

  }
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "triggerRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackAddAutomationWithRecord:", v9);

  objc_msgSend(*(id *)(a1 + 40), "trackAddAutomationActions");
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v10, "triggerRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishWithTriggerRecord:", v11);

}

void __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = (id *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = (void *)MEMORY[0x24BEC41B0];
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workflowWithReference:database:error:", v6, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setWorkflowReference:", v6);
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setTriggerIdentifier:", v12);
  if (*(_BYTE *)(a1 + 40))
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke_2;
    v15[3] = &unk_24E604E80;
    v16 = v11;
    v17 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], v15);

  }
  else
  {
    objc_msgSend(WeakRetained, "triggerRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "trackAddAutomationWithRecord:", v13);

    objc_msgSend(WeakRetained, "trackAddAutomationActions");
    objc_msgSend(WeakRetained, "triggerRecord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "finishWithTriggerRecord:", v14);

  }
}

void __113__WFCreateAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke_2(uint64_t a1)
{
  WFTriggerComposeViewController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFTriggerComposeViewController *v13;

  v2 = [WFTriggerComposeViewController alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFTriggerComposeViewController initWithWorkflow:mode:database:](v2, "initWithWorkflow:mode:database:", v3, 0, v4);

  -[WFTriggerComposeViewController setDelegate:](v13, "setDelegate:", *(_QWORD *)(a1 + 40));
  -[WFTriggerComposeViewController navigationItem](v13, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 1);

  -[WFTriggerComposeViewController navigationItem](v13, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setSupportsTwoLineLargeTitles:", 1);

  v7 = (void *)MEMORY[0x24BEC4100];
  objc_msgSend(*(id *)(a1 + 40), "triggerRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggerData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerWithSerializedData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedDescriptionWithConfigurationSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerComposeViewController setTitle:](v13, "setTitle:", v11);

  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pushViewController:animated:", v13, 1);

}

void __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_accentColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v4);

  objc_msgSend(WeakRetained, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v3, 1);

}

void __82__WFCreateAutomationCoordinator_selectTypeViewController_didChooseAutomationType___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v4);

  objc_msgSend(WeakRetained, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v3, 1);

}

void __44__WFCreateAutomationCoordinator_openHomeApp__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFCreateAutomationCoordinator openHomeApp]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_22007E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to open Home app with error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __39__WFCreateAutomationCoordinator_cancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __39__WFCreateAutomationCoordinator_cancel__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFCreateAutomationCoordinator cancel]_block_invoke_2";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete configured trigger: %{public}@", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WFCreateAutomationCoordinator_cancel__block_invoke_146;
  block[3] = &unk_24E604D60;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v8);

}

void __39__WFCreateAutomationCoordinator_cancel__block_invoke_146(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "createAutomationCoordinatorDidCancel:", WeakRetained);

}

void __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "triggerManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "triggerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "workflowReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_2;
  v5[3] = &unk_24E6049E8;
  v5[4] = WeakRetained;
  objc_msgSend(v2, "associateWorkflowToTriggerID:deletingExistingReference:notifyDaemon:workflowReference:completion:", v3, 0, 1, v4, v5);

}

void __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFCreateAutomationCoordinator finishWithTriggerRecord:]_block_invoke_2";
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save configured trigger: %{public}@", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_143;
  block[3] = &unk_24E604D88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __57__WFCreateAutomationCoordinator_finishWithTriggerRecord___block_invoke_143(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createAutomationCoordinatorDidFinish:", *(_QWORD *)(a1 + 32));

}

id __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[5], a1[4], CFSTR("WFCreateAutomationCoordinator.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  -[objc_class sharedDispatcher](getHFHomeKitDispatcherClass(), "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedHome:userInitiated:", v3, 0);
  v5 = (void *)objc_msgSend(objc_alloc(getHUTriggerTypePickerViewControllerClass()), "initWithActionSetBuilder:delegate:", 0, a1[4]);
  v6 = v5;
  v7 = a1[6];
  if (v7 == 1)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, a1[4], sel_cancel);
    objc_msgSend(v6, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

    goto LABEL_7;
  }
  if (!v7)
  {
    objc_msgSend(v5, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItem:", 0);
LABEL_7:

  }
  return v6;
}

void __131__WFCreateAutomationCoordinator_buildViewControllerForHomeTriggerChooserStepWithBackButtonAction_hostingViewController_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __78__WFCreateAutomationCoordinator_startAtStep_hostingViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (v13)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v13);
    objc_msgSend(*(id *)(a1 + 32), "setNavigationController:", v3);

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersLargeTitles:", 1);

    v6 = *(_QWORD *)(a1 + 48);
    if (v6 >= 2)
    {
      if (v6 != 2)
      {
LABEL_8:
        v11 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "navigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BEBD4B8], "wf_homeTintColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "wf_accentColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v8);

    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_9:

}

@end
