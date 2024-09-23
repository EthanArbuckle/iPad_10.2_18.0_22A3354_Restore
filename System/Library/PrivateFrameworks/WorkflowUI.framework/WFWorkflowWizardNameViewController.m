@implementation WFWorkflowWizardNameViewController

- (WFWorkflowWizardNameViewController)initWithWorkflow:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  WFWorkflowWizardNameViewController *v9;
  WFWorkflowWizardNameViewController *v10;
  WFWorkflowWizardNameViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFWorkflowWizardNameViewController;
  v9 = -[WFWorkflowWizardNameViewController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workflow, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = v10;
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  CGRect v30;

  v29.receiver = self;
  v29.super_class = (Class)WFWorkflowWizardNameViewController;
  -[WFWorkflowWizardNameViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[WFWorkflowWizardNameViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameViewController setTitle:](self, "setTitle:", v4);

  -[WFWorkflowWizardNameViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLargeTitleDisplayMode:", 2);

  v6 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(v3, "doneBarButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, sel_didTapDone);
  -[WFWorkflowWizardNameViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v11, v13);

  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", v15, v17);

  v18 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[WFWorkflowWizardNameViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v20 = (void *)objc_msgSend(v18, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v30), 13.0);
  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTableHeaderView:", v20);

  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSeparatorStyle:", 0);

  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAllowsSelection:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_wizardBackgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_wizardBackgroundColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSectionIndexColor:", v26);

  -[WFWorkflowWizardNameViewController workflowName](self, "workflowName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameViewController updateDoneButtonForName:](self, "updateDoneButtonForName:", v28);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardNameViewController;
  -[WFWorkflowWizardNameViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[WFWorkflowWizardNameViewController nameCell](self, "nameCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  if (v6 == 1)
  {
    -[WFWorkflowWizardNameViewController dequeueNameSuggestionCellAtIndexPath:](self, "dequeueNameSuggestionCellAtIndexPath:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Invalid section %li for WFWorkflowWizardNameViewController"), objc_msgSend(v5, "section"));
      v8 = 0;
      goto LABEL_7;
    }
    -[WFWorkflowWizardNameViewController dequeueNameCellAtIndexPath:](self, "dequeueNameCellAtIndexPath:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  if (objc_msgSend(a4, "row", a3))
    return *MEMORY[0x24BEBE770];
  +[WFWorkflowWizardNameCell defaultRowHeight](WFWorkflowWizardNameCell, "defaultRowHeight");
  return result;
}

- (void)workflowWizardNameCell:(id)a3 didUpdateName:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];

  v5 = a4;
  -[WFWorkflowWizardNameViewController setUpdatedName:](self, "setUpdatedName:", v5);
  -[WFWorkflowWizardNameViewController updateDoneButtonForName:](self, "updateDoneButtonForName:", v5);

  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__WFWorkflowWizardNameViewController_workflowWizardNameCell_didUpdateName___block_invoke;
  v7[3] = &unk_24E604D88;
  v7[4] = self;
  objc_msgSend(v6, "performBatchUpdates:completion:", v7, 0);

}

- (void)workflowWizardNameCellDidSelectEditIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFIconComposeViewController *v8;

  v8 = objc_alloc_init(WFIconComposeViewController);
  -[WFWorkflowWizardNameViewController workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIconComposeViewController setWorkflow:](v8, "setWorkflow:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_iconComposeViewControllerDidTapDone);
  -[WFIconComposeViewController navigationItem](v8, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[WFWorkflowWizardNameViewController setIconComposeViewController:](self, "setIconComposeViewController:", v8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  -[WFWorkflowWizardNameViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)workflowWizardNameSuggestionCellDidSelectSuggestedPhrase:(id)a3
{
  id v4;

  -[WFWorkflowWizardNameViewController nameCell](self, "nameCell", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameViewController updateNameCell:](self, "updateNameCell:", v4);

}

- (id)infoText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFWorkflowWizardNameViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "showsHeySiri") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[WFWorkflowWizardNameViewController updatedName](self, "updatedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
LABEL_5:
    -[WFWorkflowWizardNameViewController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "footerText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Just say “Hey Siri, %@” to run this shortcut."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameViewController updatedName](self, "updatedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (void)updateDoneButtonForName:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "length") != 0;
  -[WFWorkflowWizardNameViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)didTapDone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WFWorkflowWizardNameViewController nameCell](self, "nameCell");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[WFWorkflowWizardNameViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workflowWizardNameViewController:didFinishWithName:", self, v5);

    -[WFWorkflowWizardNameViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

  }
}

- (void)iconComposeViewControllerDidTapDone
{
  void *v3;
  id v4;

  -[WFWorkflowWizardNameViewController iconComposeViewController](self, "iconComposeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFWorkflowWizardNameViewController nameCell](self, "nameCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardNameViewController updateNameCell:](self, "updateNameCell:", v4);

}

- (id)workflowName
{
  void *v3;
  void *v4;
  void *v5;

  -[WFWorkflowWizardNameViewController workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isUntitled") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[WFWorkflowWizardNameViewController workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)suggestedPhrases
{
  void *v2;

  -[WFWorkflowWizardNameViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showsSuggestions");

  return (id)MEMORY[0x24BDBD1A8];
}

- (id)nameCell
{
  void *v2;
  void *v3;
  void *v4;

  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nameSuggestionCell
{
  void *v2;
  void *v3;
  void *v4;

  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateNameCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFWorkflowWizardNameViewController updatedName](self, "updatedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[WFWorkflowWizardNameViewController updatedName](self, "updatedName");
  else
    -[WFWorkflowWizardNameViewController workflowName](self, "workflowName");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[WFWorkflowWizardNameViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsHeySiri");
  -[WFWorkflowWizardNameViewController workflow](self, "workflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureWithName:showsHeySiri:icon:", v10, v7, v9);

}

- (id)dequeueNameCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setShowsHeySiri:", 1);
  objc_msgSend(v8, "setUseDoneButtonOnKeyboard:", 1);
  -[WFWorkflowWizardNameViewController updateNameCell:](self, "updateNameCell:", v8);
  return v8;
}

- (id)dequeueNameSuggestionCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[WFWorkflowWizardNameViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFWorkflowWizardNameViewController infoText](self, "infoText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInfoText:", v9);

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_wizardBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v10);

  return v8;
}

- (WFWorkflowWizardNameViewControllerDelegate)delegate
{
  return (WFWorkflowWizardNameViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFWorkflowWizardNameConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (void)setUpdatedName:(id)a3
{
  objc_storeStrong((id *)&self->_updatedName, a3);
}

- (WFIconComposeViewController)iconComposeViewController
{
  return (WFIconComposeViewController *)objc_loadWeakRetained((id *)&self->_iconComposeViewController);
}

- (void)setIconComposeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_iconComposeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconComposeViewController);
  objc_storeStrong((id *)&self->_updatedName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __75__WFWorkflowWizardNameViewController_workflowWizardNameCell_didUpdateName___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "infoText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nameSuggestionCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInfoText:", v3);

}

@end
