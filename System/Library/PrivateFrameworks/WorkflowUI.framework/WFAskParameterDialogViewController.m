@implementation WFAskParameterDialogViewController

- (WFAskParameterDialogViewController)initWithRequest:(id)a3
{
  id v4;
  WFAskParameterDialogViewController *v5;
  void *v6;
  void *v7;
  WFWorkflow *v8;
  WFWorkflow *fakeWorkflow;
  WFWorkflow *v10;
  void *v11;
  void *v12;
  void *v13;
  WFAction *fakeAction;
  id v15;
  uint64_t v16;
  WFCompactUnlockService *unlockService;
  WFAskParameterDialogViewController *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFAskParameterDialogViewController;
  v5 = -[WFCompactDialogViewController initWithRequest:](&v20, sel_initWithRequest_, v4);
  if (v5)
  {
    objc_msgSend(v4, "actionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serializedParameterStates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (WFWorkflow *)objc_alloc_init(MEMORY[0x24BEC41B0]);
    fakeWorkflow = v5->_fakeWorkflow;
    v5->_fakeWorkflow = v8;
    v10 = v8;

    objc_msgSend(MEMORY[0x24BEC3A60], "sharedRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createActionWithIdentifier:serializedParameters:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v12, "copyForProcessing");
    objc_msgSend(v13, "willBeAddedToWorkflow:", v5->_fakeWorkflow);
    objc_msgSend(v13, "wasAddedToWorkflow:", v5->_fakeWorkflow);
    fakeAction = v5->_fakeAction;
    v5->_fakeAction = (WFAction *)v13;
    v15 = v13;

    v16 = objc_opt_new();
    unlockService = v5->_unlockService;
    v5->_unlockService = (WFCompactUnlockService *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id location;
  objc_super v55;
  _QWORD v56[7];

  v56[5] = *MEMORY[0x24BDAC8D0];
  v55.receiver = self;
  v55.super_class = (Class)WFAskParameterDialogViewController;
  -[WFCompactDialogViewController loadView](&v55, sel_loadView);
  v49 = (void *)objc_opt_new();
  objc_msgSend(v49, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v49);
  -[WFCompactDialogViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogViewController fakeAction](self, "fakeAction");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterKey");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "parameterForKey:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "cancelButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __46__WFAskParameterDialogViewController_loadView__block_invoke;
  v52[3] = &unk_24E604D60;
  objc_copyWeak(&v53, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v5, v52);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  if (objc_msgSend(v3, "style") != 1)
  {
    objc_msgSend(v3, "doneButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v6;
    v50[1] = 3221225472;
    v50[2] = __46__WFAskParameterDialogViewController_loadView__block_invoke_2;
    v50[3] = &unk_24E604D60;
    objc_copyWeak(&v51, &location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v8, v50);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    objc_destroyWeak(&v51);
  }
  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v4);
  if (objc_msgSend(v3, "style") != 1 || !objc_msgSend(v45, "conformsToProtocol:", &unk_2556554C8))
    goto LABEL_9;
  v10 = v45;
  v11 = (void *)objc_opt_class();
  objc_msgSend(v10, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "parameterStateForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "singleButtonSlotForParameter:state:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {

LABEL_9:
    v24 = objc_alloc(MEMORY[0x24BEC2F20]);
    objc_msgSend(v47, "parameterStateForKey:", v46);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v24, "initWithParameter:state:", v45, v25);

    objc_msgSend(v10, "setBecomeFirstResponder:", objc_msgSend(v3, "focusImmediatelyWhenPresented"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2F18]), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(v48, "bounds");
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v14, "setAutoresizingMask:", 18);
    objc_msgSend(v14, "setDelegate:", self);
    objc_msgSend(v14, "setContainingViewController:", v49);
    objc_msgSend(v14, "updateModel:", v10);
    objc_msgSend(v48, "addSubview:", v14);
    -[WFAskParameterDialogViewController setHostingCell:](self, "setHostingCell:", v14);
    goto LABEL_10;
  }
  -[WFAskParameterDialogViewController setSummarySlot:](self, "setSummarySlot:", v14);
  +[WFMultilineBackgroundFadingButton buttonWithType:](WFMultilineBackgroundFadingButton, "buttonWithType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDerivesTitleColorFromTintColor:", 1);
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerRadius:", 10.0);

  objc_msgSend(v15, "setContentEdgeInsets:", 8.0, 8.0, 8.0, 8.0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  objc_msgSend(v15, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "localizedName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Choose %@"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedString(CFSTR("Choose"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v23;
  }
  objc_msgSend(v15, "setTitle:forState:", v23, 0);
  if (v20)
  {

  }
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_modalButtonTapped_, 64);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.0500000007);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:forState:", v26, 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.100000001);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:forState:", v27, 1);

  objc_msgSend(v48, "addSubview:", v15);
  -[WFAskParameterDialogViewController setModalButton:](self, "setModalButton:", v15);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidesContentViewTopSeparator:", 1);

  v34 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v15, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v42;
  objc_msgSend(v15, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 16.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v39;
  objc_msgSend(v15, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -16.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v36;
  objc_msgSend(v15, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v29, -16.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v30;
  objc_msgSend(v15, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintGreaterThanOrEqualToConstant:", 47.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v33);

LABEL_10:
  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);

}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  -[WFAskParameterDialogViewController hostingCell](self, "hostingCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFAskParameterDialogViewController hostingCell](self, "hostingCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeThatFits:", a3, 1.79769313e308);
    v10 = v9;

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAskParameterDialogViewController;
    -[WFCompactPlatterViewController contentHeightForWidth:withMaximumVisibleHeight:](&v13, sel_contentHeightForWidth_withMaximumVisibleHeight_, a3, a4);
    return v11;
  }
  return v10;
}

- (void)done
{
  void *v3;
  _QWORD block[5];

  if (!-[WFAskParameterDialogViewController isFinished](self, "isFinished"))
  {
    -[WFAskParameterDialogViewController setFinished:](self, "setFinished:", 1);
    -[WFAskParameterDialogViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endEditing:", 1);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__WFAskParameterDialogViewController_done__block_invoke;
    block[3] = &unk_24E604D88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

- (void)parameterEditorCell:(id)a3 didUpdateParameterState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameter");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[WFAskParameterDialogViewController fakeAction](self, "fakeAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParameterState:forKey:", v6, v10);

  v11 = objc_alloc(MEMORY[0x24BEC2F20]);
  -[WFAskParameterDialogViewController fakeAction](self, "fakeAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "key");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parameterStateForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithParameter:state:", v16, v14);
  objc_msgSend(v7, "updateModel:", v15);

}

- (void)modalButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  -[WFAskParameterDialogViewController fakeAction](self, "fakeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parameterKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "parameterForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = (objc_class *)WFModuleSummaryEditorClassForParameterClass();
  -[WFAskParameterDialogViewController summarySlot](self, "summarySlot");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v12 = (void *)objc_msgSend([v9 alloc], "initWithParameter:arrayIndex:processing:", v8, 0x7FFFFFFFFFFFFFFFLL, 1);
    objc_msgSend(v12, "setDelegate:", self);
    -[WFAskParameterDialogViewController fakeAction](self, "fakeAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVariableProvider:", v13);

    objc_storeStrong((id *)&self->_summaryEditor, v12);
    -[WFAskParameterDialogViewController unlockService](self, "unlockService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __56__WFAskParameterDialogViewController_modalButtonTapped___block_invoke;
    v16[3] = &unk_24E603BC0;
    v16[4] = self;
    v17 = v4;
    v18 = v12;
    v19 = v11;
    v15 = v12;
    objc_msgSend(v14, "requestUnlockIfNeeded:", v16);

  }
}

- (id)initialStateForSummaryEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFAskParameterDialogViewController fakeAction](self, "fakeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parameterStateForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[WFAskParameterDialogViewController fakeAction](self, "fakeAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setParameterState:forKey:", v6, v10);

  -[WFAskParameterDialogViewController done](self, "done");
}

- (void)summaryEditorDidRequestTextEntry:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  getWFDialogLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[WFAskParameterDialogViewController summaryEditorDidRequestTextEntry:]";
    _os_log_impl(&dword_22007E000, v3, OS_LOG_TYPE_FAULT, "%s Text entry isn't supported in old-UI parameters represented as buttons", (uint8_t *)&v4, 0xCu);
  }

}

- (void)summaryEditor:(id)a3 didRequestEditingSlotWithIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x24BEC2F08];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  -[WFAskParameterDialogViewController modalButton](self, "modalButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskParameterDialogViewController modalButton](self, "modalButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = (id)objc_msgSend(v9, "initWithSourceViewController:sourceView:sourceRect:", self, v10);

  objc_msgSend(v8, "beginEditingSlotWithIdentifier:presentationAnchor:", v7, v12);
}

- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5
{
  -[WFAskParameterDialogViewController setSummaryEditor:](self, "setSummaryEditor:", 0, a4, a5);
}

- (WFWorkflow)fakeWorkflow
{
  return self->_fakeWorkflow;
}

- (void)setFakeWorkflow:(id)a3
{
  objc_storeStrong((id *)&self->_fakeWorkflow, a3);
}

- (WFAction)fakeAction
{
  return self->_fakeAction;
}

- (void)setFakeAction:(id)a3
{
  objc_storeStrong((id *)&self->_fakeAction, a3);
}

- (WFParameterEditorHostingCell)hostingCell
{
  return self->_hostingCell;
}

- (void)setHostingCell:(id)a3
{
  objc_storeStrong((id *)&self->_hostingCell, a3);
}

- (WFModuleSummaryEditor)summaryEditor
{
  return self->_summaryEditor;
}

- (void)setSummaryEditor:(id)a3
{
  objc_storeStrong((id *)&self->_summaryEditor, a3);
}

- (WFSlotTemplateSlot)summarySlot
{
  return self->_summarySlot;
}

- (void)setSummarySlot:(id)a3
{
  objc_storeStrong((id *)&self->_summarySlot, a3);
}

- (UIButton)modalButton
{
  return self->_modalButton;
}

- (void)setModalButton:(id)a3
{
  objc_storeStrong((id *)&self->_modalButton, a3);
}

- (WFCompactUnlockService)unlockService
{
  return self->_unlockService;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockService, 0);
  objc_storeStrong((id *)&self->_modalButton, 0);
  objc_storeStrong((id *)&self->_summarySlot, 0);
  objc_storeStrong((id *)&self->_summaryEditor, 0);
  objc_storeStrong((id *)&self->_hostingCell, 0);
  objc_storeStrong((id *)&self->_fakeAction, 0);
  objc_storeStrong((id *)&self->_fakeWorkflow, 0);
}

void __56__WFAskParameterDialogViewController_modalButtonTapped___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if ((a2 & 1) != 0)
  {
    v3 = objc_alloc(MEMORY[0x24BEC2F08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "bounds");
    v9 = (id)objc_msgSend(v3, "initWithSourceViewController:sourceView:sourceRect:", v4, v5);
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginEditingSlotWithIdentifier:presentationAnchor:", v7, v9);

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC1370]), "initWithSerializedParameterState:cancelled:", 0, 1);
    objc_msgSend(v8, "finishWithResponse:");
  }

}

void __42__WFAskParameterDialogViewController_done__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "fakeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameterStateForKey:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v6 = objc_alloc(MEMORY[0x24BEC1370]);
  objc_msgSend(v9, "serializedRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSerializedParameterState:cancelled:", v7, 0);
  objc_msgSend(v5, "finishWithResponse:", v8);

}

void __46__WFAskParameterDialogViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1370]), "initWithSerializedParameterState:cancelled:", 0, 1);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __46__WFAskParameterDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "done");

}

+ (id)singleButtonSlotForParameter:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "moduleSummarySlotsForState:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count") == 1)
      {
        objc_msgSend(v8, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }

    }
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "moduleSummarySlotForState:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

@end
