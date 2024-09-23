@implementation WFEditAutomationCoordinator

- (WFEditAutomationCoordinator)initWithDatabase:(id)a3 triggerRecord:(id)a4 triggerIdentifier:(id)a5 workflowReference:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  WFEditAutomationCoordinator *v16;
  WFEditAutomationCoordinator *v17;
  uint64_t v18;
  WFTriggerManager *triggerManager;
  uint64_t v20;
  NSString *triggerIdentifier;
  WFEditAutomationCoordinator *v22;
  void *v24;
  void *v25;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEditAutomationCoordinator.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEditAutomationCoordinator.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerRecord"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)WFEditAutomationCoordinator;
  v16 = -[WFEditAutomationCoordinator init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_database, a3);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BEC4108]), "initWithDatabase:", v12);
    triggerManager = v17->_triggerManager;
    v17->_triggerManager = (WFTriggerManager *)v18;

    objc_storeStrong((id *)&v17->_triggerRecord, a4);
    v20 = objc_msgSend(v14, "copy");
    triggerIdentifier = v17->_triggerIdentifier;
    v17->_triggerIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v17->_workflowReference, a6);
    v22 = v17;
  }

  return v17;
}

- (id)start
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  WFAutomationSummaryViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  WFAutomationSummaryViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[WFEditAutomationCoordinator start]";
    _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator is starting", buf, 0xCu);
  }

  -[WFEditAutomationCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEditAutomationCoordinator.m"), 64, CFSTR("Delegate must be set before starting this coordinator"));

  }
  -[WFEditAutomationCoordinator database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator workflowReference](self, "workflowReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v6, "recordWithDescriptor:error:", v7, &v44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v44;

  if (v8)
  {
    v10 = (void *)MEMORY[0x24BEC41B0];
    -[WFEditAutomationCoordinator workflowReference](self, "workflowReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v9;
    objc_msgSend(v10, "workflowWithReference:database:error:", v11, v12, &v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v43;

    -[WFEditAutomationCoordinator setEditingWorkflow:](self, "setEditingWorkflow:", v13);
    -[WFEditAutomationCoordinator editingWorkflow](self, "editingWorkflow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      getWFTriggersLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[WFEditAutomationCoordinator database](self, "database");
        v17 = objc_claimAutoreleasedReturnValue();
        -[WFEditAutomationCoordinator workflowReference](self, "workflowReference");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v46 = "-[WFEditAutomationCoordinator start]";
        v47 = 2112;
        v48 = v17;
        v49 = 2112;
        v50 = (uint64_t)v18;
        v51 = 2114;
        v52 = v14;
        _os_log_impl(&dword_22007E000, v16, OS_LOG_TYPE_ERROR, "%s Failed to get workflow from database (%@) for reference (%@): %{public}@", buf, 0x2Au);

      }
      v19 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v14 = v9;
  }
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "triggerData");
  v16 = objc_claimAutoreleasedReturnValue();

  if (-[NSObject length](v16, "length")
    && (objc_msgSend(MEMORY[0x24BEC4100], "triggerWithSerializedData:", v16),
        (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = v21;
    -[WFEditAutomationCoordinator setTrigger:](self, "setTrigger:", v21);
    v23 = [WFAutomationSummaryViewController alloc];
    -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator editingWorkflow](self, "editingWorkflow");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[WFAutomationSummaryViewController initWithTrigger:triggerIdentifier:workflow:mode:](v23, "initWithTrigger:triggerIdentifier:workflow:mode:", v24, v25, v26, 1);
    -[WFEditAutomationCoordinator setAutomationSummaryViewController:](self, "setAutomationSummaryViewController:", v27);

    -[WFEditAutomationCoordinator automationSummaryViewController](self, "automationSummaryViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegate:", self);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    -[WFEditAutomationCoordinator automationSummaryViewController](self, "automationSummaryViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "navigationItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLeftBarButtonItem:", v29);

    -[WFEditAutomationCoordinator automationSummaryViewController](self, "automationSummaryViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setLargeTitleDisplayMode:", 2);

    v34 = objc_alloc(MEMORY[0x24BEBD7A0]);
    -[WFEditAutomationCoordinator automationSummaryViewController](self, "automationSummaryViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithRootViewController:", v35);
    -[WFEditAutomationCoordinator setNavigationController:](self, "setNavigationController:", v36);

    -[WFEditAutomationCoordinator navigationController](self, "navigationController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDelegate:", self);

    -[WFEditAutomationCoordinator navigationController](self, "navigationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "navigationBar");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setPrefersLargeTitles:", 1);

    -[WFEditAutomationCoordinator navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFTriggersLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v40 = -[NSObject length](v16, "length");
      *(_DWORD *)buf = 136315650;
      v46 = "-[WFEditAutomationCoordinator start]";
      v47 = 2112;
      v48 = v16;
      v49 = 2050;
      v50 = v40;
      _os_log_impl(&dword_22007E000, v22, OS_LOG_TYPE_ERROR, "%s Failed to deserialize WFTrigger from data (%@) (length=%{public}lu)", buf, 0x20u);
    }
    v19 = 0;
  }

LABEL_18:
  return v19;
}

- (void)finish
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  getWFTriggersLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[WFEditAutomationCoordinator finish]";
    _os_log_impl(&dword_22007E000, v3, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator is finishing", buf, 0xCu);
  }

  -[WFEditAutomationCoordinator setEditingWorkflow:](self, "setEditingWorkflow:", 0);
  -[WFEditAutomationCoordinator triggerManager](self, "triggerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__WFEditAutomationCoordinator_finish__block_invoke;
  v7[3] = &unk_24E6049E8;
  v7[4] = self;
  objc_msgSend(v4, "updateConfiguredTrigger:triggerID:notifyDaemon:completion:", v5, v6, 1, v7);

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  getWFTriggersLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[WFEditAutomationCoordinator cancel]";
    _os_log_impl(&dword_22007E000, v3, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator is cancelling", (uint8_t *)&v5, 0xCu);
  }

  -[WFEditAutomationCoordinator delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editAutomationCoordinatorDidCancel:", self);

}

- (void)automationSummaryViewController:(id)a3 editTrigger:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEditAutomationCoordinator.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerRecord"));

  }
  getWFTriggersLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[WFEditAutomationCoordinator automationSummaryViewController:editTrigger:]";
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_DEBUG, "%s WFEditAutomationCoordinator will edit trigger: %@", buf, 0x16u);
  }

  -[WFEditAutomationCoordinator trigger](self, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[WFTriggerConfigurationViewController viewControllerClassForTriggerClass:](WFTriggerConfigurationViewController, "viewControllerClassForTriggerClass:", objc_opt_class());

  v12 = [v11 alloc];
  -[WFEditAutomationCoordinator trigger](self, "trigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTrigger:mode:", v13, 1);

  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setRunImmediately:", objc_msgSend(v8, "shouldPrompt") ^ 1);
  objc_msgSend(v14, "setShouldNotify:", objc_msgSend(v8, "shouldNotify"));
  objc_msgSend(v14, "setShouldRecur:", objc_msgSend(v8, "shouldRecur"));
  objc_msgSend(v14, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLargeTitleDisplayMode:", 2);

  objc_msgSend(v14, "setRunImmediately:", objc_msgSend(v8, "shouldPrompt") ^ 1);
  -[WFEditAutomationCoordinator navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushViewController:animated:", v14, 1);

}

- (void)automationSummaryViewController:(id)a3 editWorkflow:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  WFTriggerComposeViewController *v12;
  void *v13;
  WFTriggerComposeViewController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  WFTriggerSuggestionViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEditAutomationCoordinator.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  getWFTriggersLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[WFEditAutomationCoordinator automationSummaryViewController:editWorkflow:]";
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_DEBUG, "%s will edit workflow: %@", buf, 0x16u);
  }

  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "editableShortcut");

  if (v11)
  {
    v12 = [WFTriggerComposeViewController alloc];
    -[WFEditAutomationCoordinator database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFTriggerComposeViewController initWithWorkflow:mode:database:](v12, "initWithWorkflow:mode:database:", v8, 1, v13);

    -[WFTriggerComposeViewController navigationItem](v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 2;
  }
  else
  {
    v18 = [WFTriggerSuggestionViewController alloc];
    -[WFEditAutomationCoordinator trigger](self, "trigger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectedEntryMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator workflowReference](self, "workflowReference");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFTriggerSuggestionViewController initWithTrigger:selectedEntryMetadataData:selectedReference:](v18, "initWithTrigger:selectedEntryMetadataData:selectedReference:", v19, v21, v22);

    -[WFTriggerComposeViewController navigationItem](v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1;
  }
  objc_msgSend(v15, "setLargeTitleDisplayMode:", v17);

  -[WFTriggerComposeViewController setDelegate:](v14, "setDelegate:", self);
  -[WFEditAutomationCoordinator navigationController](self, "navigationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pushViewController:animated:", v14, 1);

}

- (void)automationSummaryViewControllerChooseShortcut:(id)a3
{
  WFTriggerSuggestionViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  WFTriggerSuggestionViewController *v8;

  v4 = [WFTriggerSuggestionViewController alloc];
  -[WFEditAutomationCoordinator trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFTriggerSuggestionViewController initWithTrigger:selectedEntryMetadataData:selectedReference:](v4, "initWithTrigger:selectedEntryMetadataData:selectedReference:", v5, 0, 0);

  -[WFTriggerSuggestionViewController navigationItem](v8, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLargeTitleDisplayMode:", 1);

  -[WFTriggerSuggestionViewController setDelegate:](v8, "setDelegate:", self);
  -[WFEditAutomationCoordinator navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)triggerConfigurationViewController:(id)a3 didFinishWithTrigger:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  objc_msgSend(a4, "serializedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTriggerData:", v7);

  v9 = objc_msgSend(v6, "runImmediately") ^ 1;
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShouldPrompt:", v9);

  v11 = objc_msgSend(v6, "shouldNotify");
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldNotify:", v11);

  v13 = objc_msgSend(v6, "shouldRecur");
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldRecur:", v13);

  -[WFEditAutomationCoordinator finish](self, "finish");
}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 actions:(id)a4 editable:(BOOL)a5 selectedEntryMetadata:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  WFTriggerComposeViewController *v29;
  void *v30;
  WFTriggerComposeViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  -[WFEditAutomationCoordinator editingWorkflow](self, "editingWorkflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hiddenFromLibraryAndSync");

  v13 = objc_alloc_init(MEMORY[0x24BEC41B0]);
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Automation %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", v17);

  objc_msgSend(v13, "record");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHiddenFromLibraryAndSync:", 1);

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertActions:atIndexes:", v9, v19);

  }
  v20 = objc_alloc(MEMORY[0x24BEC41B8]);
  objc_msgSend(v13, "record");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithRecord:", v21);

  -[WFEditAutomationCoordinator database](self, "database");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v23, "createWorkflowWithOptions:error:", v22, &v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v38;

  if (!v24)
  {
    getWFTriggersLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[WFEditAutomationCoordinator triggerSuggestionViewControllerDidFinish:actions:editable:selectedEntryMetadata:]";
      v41 = 2114;
      v42 = v25;
      _os_log_impl(&dword_22007E000, v26, OS_LOG_TYPE_FAULT, "%s Failed to create reference: %{public}@", buf, 0x16u);
    }

  }
  -[WFEditAutomationCoordinator setWorkflowReference:](self, "setWorkflowReference:", v24);
  -[WFEditAutomationCoordinator setEditingWorkflow:](self, "setEditingWorkflow:", v13);
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSelectedEntryMetadata:", v10);

  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEditableShortcut:", v7);

  if (v7)
  {
    v29 = [WFTriggerComposeViewController alloc];
    -[WFEditAutomationCoordinator database](self, "database");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[WFTriggerComposeViewController initWithWorkflow:mode:database:](v29, "initWithWorkflow:mode:database:", v13, 1, v30);

    -[WFTriggerComposeViewController setDelegate:](v31, "setDelegate:", self);
    -[WFTriggerComposeViewController navigationItem](v31, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLargeTitleDisplayMode:", 2);

    -[WFEditAutomationCoordinator navigationController](self, "navigationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pushViewController:animated:", v31, 1);

  }
  else
  {
    -[WFEditAutomationCoordinator triggerManager](self, "triggerManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator workflowReference](self, "workflowReference");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __111__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke;
    v37[3] = &unk_24E6049E8;
    v37[4] = self;
    objc_msgSend(v34, "associateWorkflowToTriggerID:deletingExistingReference:notifyDaemon:workflowReference:completion:", v35, v12, 1, v36, v37);

  }
}

- (void)triggerSuggestionViewControllerDidFinish:(id)a3 reference:(id)a4 selectedEntryMetadata:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  WFEditAutomationCoordinator *v18;

  v7 = a4;
  v8 = a5;
  -[WFEditAutomationCoordinator setWorkflowReference:](self, "setWorkflowReference:", v7);
  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEditableShortcut:", 0);

  -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectedEntryMetadata:", v8);

  -[WFEditAutomationCoordinator triggerManager](self, "triggerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator editingWorkflow](self, "editingWorkflow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hiddenFromLibraryAndSync");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke;
  v16[3] = &unk_24E604AC8;
  v17 = v7;
  v18 = self;
  v15 = v7;
  objc_msgSend(v11, "associateWorkflowToTriggerID:deletingExistingReference:notifyDaemon:workflowReference:completion:", v12, v14, 1, v15, v16);

}

- (void)triggerComposeViewController:(id)a3 didFinishWithWorkflow:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[WFEditAutomationCoordinator triggerManager](self, "triggerManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator triggerIdentifier](self, "triggerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEditAutomationCoordinator workflowReference](self, "workflowReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__WFEditAutomationCoordinator_triggerComposeViewController_didFinishWithWorkflow___block_invoke;
  v8[3] = &unk_24E6049E8;
  v8[4] = self;
  objc_msgSend(v5, "associateWorkflowToTriggerID:deletingExistingReference:notifyDaemon:workflowReference:completion:", v6, 0, 1, v7, v8);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  -[WFEditAutomationCoordinator updateUIForShowingViewController:](self, "updateUIForShowingViewController:", a4);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  -[WFEditAutomationCoordinator updateUIForShowingViewController:](self, "updateUIForShowingViewController:", a4);
}

- (void)updateUIForShowingViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[WFEditAutomationCoordinator automationSummaryViewController](self, "automationSummaryViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[WFEditAutomationCoordinator trigger](self, "trigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serializedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEditAutomationCoordinator triggerRecord](self, "triggerRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTriggerData:", v7);

    -[WFEditAutomationCoordinator automationSummaryViewController](self, "automationSummaryViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateUI");

  }
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (WFEditAutomationCoordinatorDelegate)delegate
{
  return (WFEditAutomationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_triggerManager, a3);
}

- (WFConfiguredTriggerRecord)triggerRecord
{
  return self->_triggerRecord;
}

- (NSString)triggerIdentifier
{
  return self->_triggerIdentifier;
}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_trigger, a3);
}

- (WFWorkflowReference)workflowReference
{
  return self->_workflowReference;
}

- (void)setWorkflowReference:(id)a3
{
  objc_storeStrong((id *)&self->_workflowReference, a3);
}

- (WFWorkflow)editingWorkflow
{
  return self->_editingWorkflow;
}

- (void)setEditingWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_editingWorkflow, a3);
}

- (WFAutomationSummaryViewController)automationSummaryViewController
{
  return self->_automationSummaryViewController;
}

- (void)setAutomationSummaryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_automationSummaryViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSummaryViewController, 0);
  objc_storeStrong((id *)&self->_editingWorkflow, 0);
  objc_storeStrong((id *)&self->_workflowReference, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_triggerIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerRecord, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

uint64_t __82__WFEditAutomationCoordinator_triggerComposeViewController_didFinishWithWorkflow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void __104__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_reference_selectedEntryMetadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315650;
      v9 = "-[WFEditAutomationCoordinator triggerSuggestionViewControllerDidFinish:reference:selectedEntryMetadata:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to update configured trigger with reference %@: error: %{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

uint64_t __111__WFEditAutomationCoordinator_triggerSuggestionViewControllerDidFinish_actions_editable_selectedEntryMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

void __37__WFEditAutomationCoordinator_finish__block_invoke(uint64_t a1, char a2, void *a3)
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
      v9 = "-[WFEditAutomationCoordinator finish]_block_invoke";
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save configured trigger: %{public}@", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WFEditAutomationCoordinator_finish__block_invoke_127;
  block[3] = &unk_24E604D88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __37__WFEditAutomationCoordinator_finish__block_invoke_127(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editAutomationCoordinatorDidFinish:", *(_QWORD *)(a1 + 32));

}

@end
