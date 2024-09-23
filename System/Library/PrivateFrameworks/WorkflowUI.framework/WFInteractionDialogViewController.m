@implementation WFInteractionDialogViewController

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  WFInteractionCardViewController *v17;
  WFInteractionCardViewController *cardViewController;
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
  void *v29;
  void *v30;
  WFInteractionCardProgressViewController *progressViewController;
  void *v32;
  void *v33;
  WFInteractionCardViewController *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  WFInteractionCardProgressViewController *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  objc_super v51;
  _QWORD v52[4];
  void *v53;
  id location[2];
  _QWORD v55[4];

  v55[2] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)WFInteractionDialogViewController;
  -[WFCompactDialogViewController loadView](&v51, sel_loadView);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("junior_interaction_platter_view"));

  -[WFCompactDialogViewController request](self, "request");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v44, "interaction");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      objc_msgSend(v44, "cancelButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = MEMORY[0x24BDAC760];
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __45__WFInteractionDialogViewController_loadView__block_invoke;
      v49[3] = &unk_24E604D60;
      objc_copyWeak(&v50, location);
      +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v4, v49);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "confirmButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v5;
      v47[1] = 3221225472;
      v47[2] = __45__WFInteractionDialogViewController_loadView__block_invoke_49;
      v47[3] = &unk_24E604D60;
      objc_copyWeak(&v48, location);
      +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v7, v47);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setEnabled:", 0);
      -[WFInteractionDialogViewController setConfirmAction:](self, "setConfirmAction:", v8);
      v55[0] = v6;
      v55[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v9);

      objc_destroyWeak(&v48);
      objc_destroyWeak(&v50);
      objc_destroyWeak(location);
      v33 = v44;
      goto LABEL_11;
    }

    v11 = v44;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v11;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v12 = v10;

  objc_msgSend(v12, "interaction");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  getWFDialogLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 136315138;
    *(id *)((char *)location + 4) = "-[WFInteractionDialogViewController loadView]";
    _os_log_impl(&dword_22007E000, v13, OS_LOG_TYPE_DEFAULT, "%s Handling interaction", (uint8_t *)location, 0xCu);
  }

  objc_initWeak(location, self);
  objc_msgSend(v12, "doneButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __45__WFInteractionDialogViewController_loadView__block_invoke_52;
  v45[3] = &unk_24E604D60;
  objc_copyWeak(&v46, location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v14, v45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v16);

  objc_destroyWeak(&v46);
  objc_destroyWeak(location);

  v33 = 0;
LABEL_11:
  v17 = -[WFInteractionCardViewController initWithInteraction:]([WFInteractionCardViewController alloc], "initWithInteraction:", v42);
  -[WFInteractionCardViewController setDelegate:](v17, "setDelegate:", self);
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v17);
  cardViewController = self->_cardViewController;
  self->_cardViewController = v17;
  v34 = v17;

  v43 = (WFInteractionCardProgressViewController *)objc_opt_new();
  -[WFInteractionDialogViewController addChildViewController:](self, "addChildViewController:", v43);
  -[WFInteractionCardProgressViewController view](v43, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray5Color");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "colorWithAlphaComponent:", 0.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v21);

  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "footerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setClipsToBounds:", 1);
  objc_msgSend(v23, "addSubview:", v19);
  v35 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v19, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v39;
  objc_msgSend(v19, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v36;
  objc_msgSend(v19, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v26;
  objc_msgSend(v19, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v30);

  -[WFInteractionDialogViewController didMoveToParentViewController:](self, "didMoveToParentViewController:", self);
  progressViewController = self->_progressViewController;
  self->_progressViewController = v43;

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFooterViewHeight:", 40.0);

  if (-[WFInteractionDialogViewController showCheckmarkOnAppear](self, "showCheckmarkOnAppear"))
    -[WFInteractionDialogViewController showProgressWithEvent:](self, "showProgressWithEvent:", 0, v33);

}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  void *v5;
  double v6;
  double v7;

  -[WFInteractionDialogViewController cardViewController](self, "cardViewController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentHeightForWidth:", a3);
  v7 = v6;

  return v7;
}

- (void)showProgressWithEvent:(unint64_t)a3
{
  void *v5;
  void *v6;
  _QWORD block[5];

  -[WFCompactPlatterViewController setPlatterHeightAnimationsDisabled:](self, "setPlatterHeightAnimationsDisabled:", 1);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFooterViewHidden:", 0);

  -[WFInteractionDialogViewController progressViewController](self, "progressViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleEvent:", a3);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__WFInteractionDialogViewController_showProgressWithEvent___block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (BOOL)showCheckmarkOnAppear
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v7;

  -[WFCompactDialogViewController request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "interaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_intentCategory");

    v7 = objc_msgSend(v3, "intentHandlingStatus") == 3 && v5 != 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFInteractionDialogViewController;
  -[WFInteractionDialogViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (-[WFInteractionDialogViewController showCheckmarkOnAppear](self, "showCheckmarkOnAppear"))
    -[WFInteractionDialogViewController showProgressWithEvent:](self, "showProgressWithEvent:", 1);
}

- (BOOL)canHandleFollowUpRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)handleFollowUpRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFInteractionDialogViewController;
  -[WFCompactDialogViewController handleFollowUpRequest:](&v18, sel_handleFollowUpRequest_, v4);
  -[WFInteractionDialogViewController setFollowUpRequest:](self, "setFollowUpRequest:", v4);
  objc_msgSend(v4, "promptForDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryText:", v5);

  objc_msgSend(v4, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInteractionDialogViewController cardViewController](self, "cardViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithInteraction:", v7);

  if (objc_msgSend(v7, "intentHandlingStatus") == 3)
    -[WFInteractionDialogViewController showProgressWithEvent:](self, "showProgressWithEvent:", 1);
  objc_initWeak(&location, self);
  objc_msgSend(v4, "doneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __59__WFInteractionDialogViewController_handleFollowUpRequest___block_invoke;
  v15 = &unk_24E604D60;
  objc_copyWeak(&v16, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v9, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)interactionCardViewControllerDidLoad:(id)a3
{
  void *v4;

  -[WFInteractionDialogViewController confirmAction](self, "confirmAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  -[WFCompactPlatterViewController scrollToTopAnimated:](self, "scrollToTopAnimated:", 0);
}

- (void)interactionCardViewControllerDidRequestPunchout:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  Class *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[WFInteractionDialogViewController followUpRequest](self, "followUpRequest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFCompactDialogViewController request](self, "request");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (Class *)0x24BEC13E8;
    v8 = 2;
LABEL_8:
    v9 = (void *)objc_msgSend(objc_alloc(*v7), "initWithInteractionResponseCode:", v8);
    -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v9);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (Class *)0x24BEC14C0;
    v8 = 1;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)interactionCardViewControllerDidRequestCancel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  Class *v7;
  void *v8;
  id v9;

  -[WFInteractionDialogViewController followUpRequest](self, "followUpRequest", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[WFCompactDialogViewController request](self, "request");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (Class *)0x24BEC13E8;
LABEL_8:
    v8 = (void *)objc_msgSend(objc_alloc(*v7), "initWithInteractionResponseCode:", 0);
    -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v8);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (Class *)0x24BEC14C0;
    goto LABEL_8;
  }
LABEL_9:

}

- (WFInteractionCardViewController)cardViewController
{
  return self->_cardViewController;
}

- (void)setCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardViewController, a3);
}

- (WFInteractionCardProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setProgressViewController:(id)a3
{
  objc_storeStrong((id *)&self->_progressViewController, a3);
}

- (WFCompactDialogAction)confirmAction
{
  return self->_confirmAction;
}

- (void)setConfirmAction:(id)a3
{
  objc_storeStrong((id *)&self->_confirmAction, a3);
}

- (WFDialogRequest)followUpRequest
{
  return self->_followUpRequest;
}

- (void)setFollowUpRequest:(id)a3
{
  objc_storeStrong((id *)&self->_followUpRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpRequest, 0);
  objc_storeStrong((id *)&self->_confirmAction, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
}

void __59__WFInteractionDialogViewController_handleFollowUpRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFInteractionDialogViewController handleFollowUpRequest:]_block_invoke";
    _os_log_impl(&dword_22007E000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished interaction", (uint8_t *)&v4, 0xCu);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14C0]), "initWithInteractionResponseCode:", 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v3);

}

uint64_t __59__WFInteractionDialogViewController_showProgressWithEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlatterHeightAnimationsDisabled:", 0);
}

void __45__WFInteractionDialogViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFInteractionDialogViewController loadView]_block_invoke";
    _os_log_impl(&dword_22007E000, v2, OS_LOG_TYPE_DEFAULT, "%s Cancelled interaction", (uint8_t *)&v4, 0xCu);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC13E8]), "initWithInteractionResponseCode:", 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v3);

}

void __45__WFInteractionDialogViewController_loadView__block_invoke_49(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFInteractionDialogViewController loadView]_block_invoke";
    _os_log_impl(&dword_22007E000, v2, OS_LOG_TYPE_DEFAULT, "%s Confirmed interaction", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "confirmAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  objc_msgSend(WeakRetained, "showProgressWithEvent:", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC13E8]), "initWithInteractionResponseCode:", 1);
  objc_msgSend(WeakRetained, "finishWithResponse:waitForFollowUpRequest:", v4, 1);

}

void __45__WFInteractionDialogViewController_loadView__block_invoke_52(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFInteractionDialogViewController loadView]_block_invoke";
    _os_log_impl(&dword_22007E000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished interaction", (uint8_t *)&v4, 0xCu);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14C0]), "initWithInteractionResponseCode:", 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v3);

}

@end
