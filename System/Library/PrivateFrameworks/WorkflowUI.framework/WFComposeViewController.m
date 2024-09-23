@implementation WFComposeViewController

- (WFComposeViewController)initWithWorkflow:(id)a3 database:(id)a4
{
  return -[WFComposeViewController initWithWorkflow:database:home:shouldShowShareButton:](self, "initWithWorkflow:database:home:shouldShowShareButton:", a3, a4, 0, 1);
}

- (WFComposeViewController)initWithWorkflow:(id)a3 database:(id)a4 home:(id)a5 shouldShowShareButton:(BOOL)a6
{
  id v12;
  id v13;
  id v14;
  WFComposeViewController *v15;
  WFComposeViewController *v16;
  WFComposeViewController *v17;
  uint64_t v18;
  NSUndoManager *undoManager;
  WFMoveToFolderCoordinator *v20;
  void *v21;
  uint64_t v22;
  WFMoveToFolderCoordinator *moveCoordinator;
  uint64_t v24;
  WFEditorViewController *editorViewController;
  void *v26;
  _TtC10WorkflowUI24WFUIKitDrawerCoordinator *v27;
  void *v28;
  uint64_t v29;
  WFSwiftUIActionDrawerCoordinator *v30;
  WFActionDrawerCoordinator *drawerCoordinator;
  WFComposeUserActivityManager *v32;
  WFComposeUserActivityManager *userActivityManager;
  uint64_t v34;
  NSHashTable *movedDragControllers;
  uint64_t v36;
  NSMutableArray *editingStates;
  uint64_t v38;
  UIButton *iconView;
  WFComposeViewController *v40;
  void *v42;
  objc_super v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFComposeViewController.mm"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  v43.receiver = self;
  v43.super_class = (Class)WFComposeViewController;
  v15 = -[WFComposeViewController init](&v43, sel_init);
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workflow, a3);
    objc_storeStrong((id *)&v16->_database, a4);
    objc_storeStrong((id *)&v16->_home, a5);
    v17->_shouldAnchorIconViewToRenameTextField = 0;
    v17->_suppressDocumentMenuUpdates = 0;
    v17->_shouldShowShareButton = a6;
    v18 = objc_opt_new();
    undoManager = v17->_undoManager;
    v17->_undoManager = (NSUndoManager *)v18;

    v20 = [WFMoveToFolderCoordinator alloc];
    -[WFComposeViewController database](v17, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[WFMoveToFolderCoordinator initWithDatabase:](v20, "initWithDatabase:", v21);
    moveCoordinator = v17->_moveCoordinator;
    v17->_moveCoordinator = (WFMoveToFolderCoordinator *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BEC2EF0]), "initWithWorkflow:", v12);
    editorViewController = v17->_editorViewController;
    v17->_editorViewController = (WFEditorViewController *)v24;

    -[WFEditorViewController setDelegate:](v17->_editorViewController, "setDelegate:", v17);
    -[WFEditorViewController setAuxiliaryViewPresenter:](v17->_editorViewController, "setAuxiliaryViewPresenter:", v17);
    -[WFEditorViewController setCanShowEmptyState:](v17->_editorViewController, "setCanShowEmptyState:", 1);
    -[WFEditorViewController setCanShowInputAction:](v17->_editorViewController, "setCanShowInputAction:", objc_msgSend((id)objc_opt_class(), "canShowInputAction"));
    -[WFEditorViewController setTriggerInputType:](v17->_editorViewController, "setTriggerInputType:", -[WFComposeViewController triggerInputType](v17, "triggerInputType"));
    -[WFEditorViewController setHome:](v17->_editorViewController, "setHome:", v14);
    objc_msgSend(MEMORY[0x24BDBCF50], "systemShortcutsUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v26, "BOOLForKey:", CFSTR("UIKitDrawer"));

    if ((_DWORD)v20)
    {
      v27 = [_TtC10WorkflowUI24WFUIKitDrawerCoordinator alloc];
      -[WFEditorViewController actionSuggester](v17->_editorViewController, "actionSuggester");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[WFUIKitDrawerCoordinator initWithWorkflow:home:actionSuggester:](v27, "initWithWorkflow:home:actionSuggester:", v12, v14, v28);
    }
    else
    {
      v30 = [WFSwiftUIActionDrawerCoordinator alloc];
      -[WFEditorViewController actionSuggester](v17->_editorViewController, "actionSuggester");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[WFSwiftUIActionDrawerCoordinator initWithHome:workflow:actionSuggester:](v30, "initWithHome:workflow:actionSuggester:", v14, v12, v28);
    }
    drawerCoordinator = v17->_drawerCoordinator;
    v17->_drawerCoordinator = (WFActionDrawerCoordinator *)v29;

    -[WFActionDrawerCoordinator setDelegate:](v17->_drawerCoordinator, "setDelegate:", v17);
    v32 = -[WFComposeUserActivityManager initWithWorkflow:targetResponder:]([WFComposeUserActivityManager alloc], "initWithWorkflow:targetResponder:", v12, v17);
    userActivityManager = v17->_userActivityManager;
    v17->_userActivityManager = v32;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v34 = objc_claimAutoreleasedReturnValue();
    movedDragControllers = v17->_movedDragControllers;
    v17->_movedDragControllers = (NSHashTable *)v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", &unk_24E6312F0, 0);
    editingStates = v17->_editingStates;
    v17->_editingStates = (NSMutableArray *)v36;

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v38 = objc_claimAutoreleasedReturnValue();
    iconView = v17->_iconView;
    v17->_iconView = (UIButton *)v38;

    v40 = v17;
  }

  return v17;
}

- (void)updateUserActivityState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFComposeViewController userActivityManager](self, "userActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUserActivityState:", v5);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *flowController;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  WFComposeFlowController *v15;
  void *v16;
  void *v17;
  WFComposeFlowController *v18;
  void *v19;
  void *v20;
  WFComposeNavigationController *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)WFComposeViewController;
  -[WFComposeViewController loadView](&v35, sel_loadView);
  -[WFComposeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadViewIfNeeded");

  -[WFComposeViewController database](self, "database");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  v8 = (void *)v7;
  -[WFComposeViewController workflow](self, "workflow");
  flowController = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(flowController, "isUntitled"))
  {
    v10 = -[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader");

    if (v10)
      goto LABEL_9;
    -[WFComposeViewController presenter](self, "presenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentingViewControllerForComposeViewController:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[WFComposeViewController editorViewController](self, "editorViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "navigationController");
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v14;
    }
    else
    {
      -[WFComposeViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = [WFComposeFlowController alloc];
    -[WFComposeViewController database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController workflow](self, "workflow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WFComposeFlowController initWithPresenter:navigationController:database:workflow:](v15, "initWithPresenter:navigationController:database:workflow:", self, v8, v16, v17);

    -[WFComposeFlowController setDelegate:](v18, "setDelegate:", self);
    flowController = self->_flowController;
    self->_flowController = v18;
  }

LABEL_9:
  -[WFComposeViewController presenter](self, "presenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentingViewControllerForComposeViewController:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = -[WFComposeNavigationController initWithRootViewController:]([WFComposeNavigationController alloc], "initWithRootViewController:", self->_editorViewController);
  else
    v21 = self->_editorViewController;
  -[WFComposeNavigationController view](v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("editor"));

  -[WFComposeViewController addChildViewController:](self, "addChildViewController:", v21);
  -[WFComposeViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeNavigationController view](v21, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

  -[WFComposeNavigationController didMoveToParentViewController:](v21, "didMoveToParentViewController:", self);
  v25 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v26);

  -[WFComposeViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v25);

  objc_storeWeak((id *)&self->_separatorView, v25);
  -[WFComposeViewController updateTitleItemIfNeeded](self, "updateTitleItemIfNeeded");
  -[WFComposeViewController presenter](self, "presenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "presentingViewControllerForComposeViewController:", self);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    -[WFComposeViewController setUpToolbar](self, "setUpToolbar");
    -[WFComposeViewController setupDrawerIfNeeded](self, "setupDrawerIfNeeded");
  }
  -[WFComposeViewController workflow](self, "workflow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:forKeyPath:options:context:", self, CFSTR("name"), 4, WFWorkflowNameContext);

  -[WFComposeViewController workflow](self, "workflow");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:forKeyPath:options:context:", self, CFSTR("reference"), 4, WFWorkflowReferenceContext);

  -[WFComposeViewController workflow](self, "workflow");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObserver:forKeyPath:options:context:", self, CFSTR("actions"), 0, WFWorkflowActionsContext);

  -[WFComposeViewController workflow](self, "workflow");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObserver:forKeyPath:options:context:", self, CFSTR("deleted"), 0, WFWorkflowDeletedContext);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground, *MEMORY[0x24BEBE008], 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (-[WFComposeViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WFComposeViewController workflow](self, "workflow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("name"), WFWorkflowNameContext);

    -[WFComposeViewController workflow](self, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("reference"), WFWorkflowReferenceContext);

    -[WFComposeViewController workflow](self, "workflow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("actions"), WFWorkflowActionsContext);

    -[WFComposeViewController workflow](self, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("deleted"), WFWorkflowDeletedContext);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self);

  }
  v8.receiver = self;
  v8.super_class = (Class)WFComposeViewController;
  -[WFComposeViewController dealloc](&v8, sel_dealloc);
}

- (BOOL)showsDetailsButton
{
  void *v2;
  BOOL v3;

  -[WFComposeViewController home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)setUpToolbar
{
  unint64_t v3;
  void *v4;
  WFRunWorkflowToolbar *v5;
  WFRunWorkflowToolbar *toolbar;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v24;
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
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[4];

  v57[3] = *MEMORY[0x24BDAC8D0];
  v3 = -[WFComposeViewController visibleToolbarPlacement](self, "visibleToolbarPlacement");
  if (v3 == 1)
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItems:", 0);

    if ((-[WFComposeViewController navigationUpdateBehavior](self, "navigationUpdateBehavior") & 1) != 0)
    {
      -[WFComposeViewController editorViewController](self, "editorViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "navigationItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitleView:", 0);

      -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitleView:", 0);

      -[WFComposeViewController editorViewController](self, "editorViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "navigationBar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setPrefersLargeTitles:", 1);

    }
    -[WFComposeViewController toolbar](self, "toolbar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeFromSuperview");

    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2F40]), "initShowingDetailsButton:", -[WFComposeViewController showsDetailsButton](self, "showsDetailsButton"));
    objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&self->_toolbar, v48);
    -[WFComposeViewController presenter](self, "presenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "presentingViewControllerForComposeViewController:", self);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = v24;
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v53 = v25;
    }
    else
    {
      -[WFComposeViewController view](self, "view");
      v53 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[WFComposeViewController toolbar](self, "toolbar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addSubview:", v27);

    if (v53)
    {
      v56 = v53;
    }
    else
    {
      -[WFComposeViewController editorViewController](self, "editorViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "view");
      v56 = (id)objc_claimAutoreleasedReturnValue();

    }
    v29 = (void *)MEMORY[0x24BDD1628];
    -[WFComposeViewController toolbar](self, "toolbar");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v51;
    -[WFComposeViewController toolbar](self, "toolbar");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v32;
    -[WFComposeViewController toolbar](self, "toolbar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v36;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v37);

    objc_msgSend(v55, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setNeedsLayout");

    objc_msgSend(v55, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutIfNeeded");

    objc_msgSend(MEMORY[0x24BDBCF50], "systemShortcutsUserDefaults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = objc_msgSend(v40, "BOOLForKey:", CFSTR("UIKitDrawer"));

    -[WFComposeViewController toolbar](self, "toolbar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "frame");
    v43 = v42;
    if ((_DWORD)v32)
    {
      -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setBottomInset:", v43);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "scale");
      v46 = v45;
      -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setBottomInset:", v43 + -1.0 / v46);

    }
  }
  else if (v3 == 2)
  {
    -[WFComposeViewController toolbar](self, "toolbar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    v5 = (WFRunWorkflowToolbar *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2F40]), "initShowingDetailsButton:", -[WFComposeViewController showsDetailsButton](self, "showsDetailsButton"));
    toolbar = self->_toolbar;
    self->_toolbar = v5;

    if ((-[WFComposeViewController navigationUpdateBehavior](self, "navigationUpdateBehavior") & 1) != 0)
    {
      -[WFComposeViewController editorViewController](self, "editorViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navigationBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPrefersLargeTitles:", 0);

      -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPrefersLargeTitles:", 0);

    }
  }
  -[WFComposeViewController updateShareButtonVisibility](self, "updateShareButtonVisibility");
  -[WFComposeViewController resetToolbar](self, "resetToolbar");
}

- (id)settingsButtonWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle.fill"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);

  WFLocalizedString(CFSTR("Details"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("shortcut_details_button"));
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_presentSettingsViewController, 64);

  return v5;
}

- (unint64_t)navigationUpdateBehavior
{
  return 11;
}

- (void)updateTitleView:(id)a3
{
  id v4;
  double *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *titleViewLabel;
  UILabel *v18;
  UIButton *titleViewSettingsButton;
  id v20;

  v20 = a3;
  v4 = objc_alloc(MEMORY[0x24BEBD708]);
  v5 = (double *)MEMORY[0x24BDBF090];
  v6 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[UILabel setText:](v6, "setText:", v20);
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_defaultTitleFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](v6, "setFont:", v10);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v6, "setTextColor:", v11);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 20.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController settingsButtonWithConfiguration:](self, "settingsButtonWithConfiguration:", v12);
  v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", *v5, v5[1], v5[2], v5[3]);
  objc_msgSend(v14, "addSubview:", v6);
  objc_msgSend(v14, "addSubview:", v13);
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitleView:", v14);

  titleViewLabel = self->_titleViewLabel;
  self->_titleViewLabel = v6;
  v18 = v6;

  titleViewSettingsButton = self->_titleViewSettingsButton;
  self->_titleViewSettingsButton = v13;

}

- (void)layoutTitleView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  -[WFComposeViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "topItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFComposeViewController titleViewLabel](self, "titleViewLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController titleViewSettingsButton](self, "titleViewSettingsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v22, "sizeToFit");
  objc_msgSend(v6, "sizeToFit");
  objc_msgSend(v22, "frame");
  v9 = v8;
  objc_msgSend(v6, "frame");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v7, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "frame");
  objc_msgSend(v7, "setFrame:", v16 + 8.0, v11, v13, v15);
  objc_msgSend(v7, "center");
  v18 = v17;
  objc_msgSend(v6, "center");
  objc_msgSend(v7, "setCenter:", v18);
  objc_msgSend(v6, "frame");
  v20 = v19;
  objc_msgSend(v7, "frame");
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v20 + 8.0 + v21, v9);

}

- (UIButton)titleAccessorySettingsButton
{
  UIButton *titleAccessorySettingsButton;
  UIButton *v3;
  void *v5;
  UIButton *v6;
  UIButton *v7;
  UIButton *v8;

  titleAccessorySettingsButton = self->_titleAccessorySettingsButton;
  if (titleAccessorySettingsButton)
  {
    v3 = titleAccessorySettingsButton;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 30.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController settingsButtonWithConfiguration:](self, "settingsButtonWithConfiguration:", v5);
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v7 = self->_titleAccessorySettingsButton;
    self->_titleAccessorySettingsButton = v6;
    v8 = v6;

    v3 = self->_titleAccessorySettingsButton;
  }
  return v3;
}

- (id)workflowView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFComposeViewController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForComposeViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)updateTitleItemIfNeeded
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  WFDrawerNavigationBarTitleView *v27;
  id v28;

  v3 = -[WFComposeViewController navigationUpdateBehavior](self, "navigationUpdateBehavior");
  if ((v3 & 1) != 0 && -[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader"))
  {
    -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v27 = -[WFDrawerNavigationBarTitleView initWithDelegate:showsDetailsButton:]([WFDrawerNavigationBarTitleView alloc], "initWithDelegate:showsDetailsButton:", self, -[WFComposeViewController showsDetailsButton](self, "showsDetailsButton"));
      -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitleView:", v27);

    }
    v28 = (id)objc_opt_new();
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScrollEdgeAppearance:", v28);

    -[WFComposeViewController editorViewController](self, "editorViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompactScrollEdgeAppearance:", v28);
    goto LABEL_11;
  }
  v12 = -[WFComposeViewController visibleToolbarPlacement](self, "visibleToolbarPlacement");
  if (v12 == 1)
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController titleAccessorySettingsButton](self, "titleAccessorySettingsButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setLargeTitleAccessoryView:alignToBaseline:", v11, 0);
LABEL_11:

    goto LABEL_12;
  }
  if (v12 == 2 && (v3 & 1) != 0)
  {
    -[WFComposeViewController workflow](self, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v28 = (id)objc_claimAutoreleasedReturnValue();

    -[WFComposeViewController titleViewLabel](self, "titleViewLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v28, "isEqualToString:", v15);

    if (v16)
    {
      -[WFComposeViewController editorViewController](self, "editorViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "titleView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[WFComposeViewController editorViewController](self, "editorViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "navigationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "navigationBar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_defaultTitleFont");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFComposeViewController titleViewLabel](self, "titleViewLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "font");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 == v25)
          goto LABEL_12;
      }
      else
      {

      }
    }
    -[WFComposeViewController updateTitleView:](self, "updateTitleView:", v28);
    -[WFComposeViewController layoutTitleView](self, "layoutTitleView");
LABEL_12:

  }
}

- (unint64_t)visibleToolbarPlacement
{
  void *v2;
  uint64_t v3;

  -[WFComposeViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass");

  if (v3 == 2)
    return 2;
  else
    return 1;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double Height;
  double v47;
  double v48;
  double v49;
  CGRect rect;
  CGRect v51;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = WFComposeViewController;
  -[CGFloat viewWillLayoutSubviews]((objc_super *)&rect.origin.y, sel_viewWillLayoutSubviews);
  -[WFComposeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController separatorView](self, "separatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController workflowView](self, "workflowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  rect.origin.x = v7;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v14, v11, v13);
  v16 = v15;
  v18 = v17;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v21 = v20;

  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldReverseLayoutDirection");

  -[WFComposeViewController setupDrawerIfNeeded](self, "setupDrawerIfNeeded");
  if (-[WFComposeViewController visibleToolbarPlacement](self, "visibleToolbarPlacement") == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "systemShortcutsUserDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("UIKitDrawer"));

    -[WFComposeViewController toolbar](self, "toolbar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v26, "bounds");
      v28 = v27;
      -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBottomInset:", v28);
    }
    else
    {
      objc_msgSend(v26, "frame");
      v31 = v30;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "scale");
      v33 = v32;
      -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setBottomInset:", v31 + -1.0 / v33);

    }
  }
  v35 = -[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader");
  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  v38 = 20.0;
  if (v35)
    v38 = 4.0;
  objc_msgSend(v36, "setTopInset:", v38);

  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 0);
  -[WFComposeViewController updateBottomContentInset](self, "updateBottomContentInset");
  if (objc_msgSend(v6, "horizontalSizeClass") == 2)
  {
    -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "navigationController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFComposeViewController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v39, v11, v13);
    v43 = v42;
    v45 = v44;
    v51.origin.x = rect.origin.x;
    v51.origin.y = v9;
    v51.size.width = v11;
    v51.size.height = v13;
    Height = CGRectGetHeight(v51);
    if (v23)
      v47 = v43;
    else
      v47 = v16;
    objc_msgSend(v4, "setFrame:", v47, 0.0, 1.0 / v21, Height);
    v48 = v16 + 1.0 / v21;
    if (v23)
      v48 = 0.0;
    objc_msgSend(v41, "setFrame:", v48, 0.0, v43, v45);
    v49 = 1.0 / v21 + v43;
    if (!v23)
      v49 = 0.0;
    objc_msgSend(v5, "setFrame:", v49, 0.0, v16, v18);
    objc_msgSend(v4, "setHidden:", 0);
    -[WFComposeViewController layoutTitleView](self, "layoutTitleView");

  }
  else
  {
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, v16, v18);
    objc_msgSend(v4, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v4, "setHidden:", 1);
  }

}

- (void)viewDidLayoutSubviews
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFComposeViewController;
  -[WFComposeViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__WFComposeViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFComposeViewController;
  -[WFComposeViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[WFComposeViewController userActivityManager](self, "userActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 1);

  -[WFComposeViewController updateShareButtonVisibility](self, "updateShareButtonVisibility");
}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[WFComposeViewController presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerForComposeViewController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFComposeViewController setUpToolbar](self, "setUpToolbar");
    -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", v3);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFComposeViewController;
  -[WFComposeViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[WFComposeViewController userActivityManager](self, "userActivityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFComposeViewController;
  -[WFComposeViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[WFComposeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFComposeViewController;
  -[WFComposeViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 0);
  v5 = objc_msgSend(v4, "horizontalSizeClass");
  -[WFComposeViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  if (v5 != v7)
  {
    if (-[WFComposeViewController isRenameSessionActive](self, "isRenameSessionActive"))
    {
      -[WFComposeViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endEditing:", 1);

    }
    -[WFComposeViewController layoutDocumentMenuControl](self, "layoutDocumentMenuControl");
    -[WFComposeViewController setUpToolbar](self, "setUpToolbar");
  }
  -[WFComposeViewController updateToolbarVisibility](self, "updateToolbarVisibility");

}

- (BOOL)shouldUseOverlaidDrawer
{
  void *v2;
  BOOL v3;

  -[WFComposeViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass") != 2;

  return v3;
}

- (void)updateBottomContentInset
{
  uint64_t v3;
  double height;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v21, "presentationMode");

  height = 0.0;
  if (v3 == 1)
  {
    -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "collapsedDrawerRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[WFComposeViewController editorViewController](self, "editorViewController");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v27.origin.x = v14;
    v27.origin.y = v15;
    v27.size.width = v16;
    v27.size.height = v17;
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    v26 = CGRectIntersection(v25, v27);
    height = v26.size.height;

  }
  -[WFComposeViewController view](self, "view");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeAreaInsets");
  v19 = v18;
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAdditionalSafeAreaInsets:", 0.0, 0.0, height - v19, 0.0);

}

- (void)updateToolbarVisibility
{
  void *v2;
  _BOOL4 v4;
  _BOOL4 v5;
  double v6;
  uint64_t v7;
  _QWORD v8[5];
  BOOL v9;

  if (-[WFComposeViewController visibleToolbarPlacement](self, "visibleToolbarPlacement") != 1)
    return;
  v4 = -[WFComposeViewController shouldUseOverlaidDrawer](self, "shouldUseOverlaidDrawer");
  if (v4)
  {
    -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "visibility") == 3)
    {
      v5 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v5 = -[WFComposeViewController visibleToolbarPlacement](self, "visibleToolbarPlacement") == 2;
  if (v4)
    goto LABEL_6;
LABEL_7:
  v6 = 0.15;
  if (v5)
  {
    v6 = 0.1;
    v7 = 0x10000;
  }
  else
  {
    v7 = 0x20000;
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__WFComposeViewController_updateToolbarVisibility__block_invoke;
  v8[3] = &unk_24E604718;
  v8[4] = self;
  v9 = v5;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v7, v8, 0, v6, 0.0);
}

- (void)updateShareButtonVisibility
{
  uint64_t v3;
  id v4;

  v3 = -[WFComposeViewController shouldShowShareButton](self, "shouldShowShareButton") ^ 1;
  -[WFComposeViewController toolbar](self, "toolbar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShareHidden:", v3);

}

- (void)setupDrawerIfNeeded
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  WFComposeViewController *v8;
  WFComposeViewController *v9;
  void *v10;
  id v11;

  v3 = -[WFComposeViewController shouldUseOverlaidDrawer](self, "shouldUseOverlaidDrawer");
  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  if (v3)
  {
    if (objc_msgSend(v4, "presentationMode") != 1)
    {
      -[WFComposeViewController presenter](self, "presenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentingViewControllerForComposeViewController:", self);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = (WFComposeViewController *)v6;
      else
        v8 = self;
      v9 = v8;

      -[WFComposeViewController toolbar](self, "toolbar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configureAsBottomSheetInParentViewController:belowSubview:", v9, v10);

    }
  }
  else if (objc_msgSend(v4, "presentationMode") != 2)
  {
    objc_msgSend(v11, "configureAsNavigationStackInParentViewController:", self);
  }
  -[WFComposeViewController updateToolbarVisibility](self, "updateToolbarVisibility");
  -[WFComposeViewController updateShareButtonVisibility](self, "updateShareButtonVisibility");
  -[WFComposeViewController resetToolbar](self, "resetToolbar");

}

- (id)drawerViewController
{
  void *v2;
  void *v3;

  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)drawerHostingViewController
{
  void *v2;
  void *v3;

  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inspectorPaneContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didTapNext
{
  id v3;
  id v4;

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[WFComposeViewController flowController](self, "flowController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startSaveFlow");

}

- (BOOL)workflowHasContent
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[WFComposeViewController workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    -[WFComposeViewController workflow](self, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (BOOL)willDeleteWhenClosed
{
  void *v3;
  _BOOL4 v4;

  if (-[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader"))
  {
    -[WFComposeViewController workflow](self, "workflow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isUntitled"))
      v4 = !-[WFComposeViewController workflowHasContent](self, "workflowHasContent");
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)didTapDone
{
  -[WFComposeViewController didTapDone:](self, "didTapDone:", 0);
}

- (void)didTapDone:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[WFComposeViewController setSuppressDocumentMenuUpdates:](self, "setSuppressDocumentMenuUpdates:", 1);
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  if (!-[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader"))
    goto LABEL_15;
  if (!-[WFComposeViewController willDeleteWhenClosed](self, "willDeleteWhenClosed"))
  {
LABEL_6:
    -[WFComposeViewController placeholderName](self, "placeholderName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController workflow](self, "workflow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isUntitled");
    if (v8)
      v20 = v19;
    else
      v20 = 0;

    if (v20)
    {
      -[WFComposeViewController database](self, "database");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "suggestedWorkflowNameForName:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[WFComposeViewController database](self, "database");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFComposeViewController workflow](self, "workflow");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reference");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v22, "renameReference:to:error:", v24, v9, &v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v33;

      if (!v25)
      {
        getWFEditorLogObject();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[WFComposeViewController didTapDone:]";
          v38 = 2112;
          v39 = v9;
          v40 = 2112;
          v41 = v26;
          _os_log_impl(&dword_22007E000, v32, OS_LOG_TYPE_ERROR, "%s Unable to save placeholder name %@ in editor: %@", buf, 0x20u);
        }

        goto LABEL_19;
      }
      -[WFComposeViewController workflow](self, "workflow");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setName:", v9);

      -[WFComposeViewController workflow](self, "workflow");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "save");

    }
    if (-[WFComposeViewController isEditingNewWorkflow](self, "isEditingNewWorkflow"))
    {
      -[WFComposeViewController workflow](self, "workflow");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "record");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addWatchWorkflowTypeIfEligible");

      -[WFComposeViewController setIsEditingNewWorkflow:](self, "setIsEditingNewWorkflow:", 0);
    }

LABEL_15:
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "reportSuggestionSessionEnded");

    -[WFComposeViewController finishEditing](self, "finishEditing");
    return;
  }
  -[WFComposeViewController database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v5, "deleteReference:error:", v7, &v35);
  v8 = v35;

  v9 = objc_alloc_init(MEMORY[0x24BEC3C68]);
  -[WFComposeViewController workflow](self, "workflow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "associatedAppBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAddToSiriBundleIdentifier:", v11);

  -[WFComposeViewController workflow](self, "workflow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "galleryIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGalleryIdentifier:", v13);

  -[WFComposeViewController workflow](self, "workflow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShortcutSource:", v15);

  objc_msgSend(v9, "track");
  if (!v8)
  {

    goto LABEL_6;
  }
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __38__WFComposeViewController_didTapDone___block_invoke;
  v34[3] = &unk_24E604D88;
  v34[4] = self;
  objc_msgSend(MEMORY[0x24BE19370], "alertWithError:confirmationHandler:", v8, v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WFUserInterfaceFromViewController();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentAlert:", v16);

LABEL_19:
}

- (void)beginEditing
{
  -[WFComposeViewController setEditingState:animated:completionHandler:](self, "setEditingState:animated:completionHandler:", 1, 1, 0);
}

- (void)finishEditing
{
  -[WFComposeViewController finishEditingAndDismissForTutorial:completionHandler:](self, "finishEditingAndDismissForTutorial:completionHandler:", 0, 0);
}

- (void)finishEditingAndDismissForTutorial:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[WFComposeViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 1);

  -[WFComposeViewController dismissForTutorial:completionHandler:](self, "dismissForTutorial:completionHandler:", v4, v7);
}

- (void)dismissForTutorial:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if ((-[WFComposeViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    -[WFComposeViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "composeViewControllerRequestsDismissal:forTutorial:withCompletionHandler:", self, v4, v7);
    else
      -[WFComposeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

  }
}

- (void)didTapCancel:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[WFComposeViewController workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUntitled");

  if (v6)
  {
    -[WFComposeViewController flowController](self, "flowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startCancelFlowWithButton:", v8);

  }
  else
  {
    -[WFComposeViewController finishEditing](self, "finishEditing");
  }

}

- (unint64_t)editingState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WFComposeViewController editingStates](self, "editingStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)pushEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v5 = a4;
  v13 = a5;
  -[WFComposeViewController editingStates](self, "editingStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

    -[WFComposeViewController updateEditingStateAnimated:completionHandler:](self, "updateEditingStateAnimated:completionHandler:", v5, v13);
  }

}

- (void)popEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v5 = a4;
  v12 = a5;
  -[WFComposeViewController editingStates](self, "editingStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v8, "removeLastObject");
    -[WFComposeViewController updateEditingStateAnimated:completionHandler:](self, "updateEditingStateAnimated:completionHandler:", v5, v12);
  }

}

- (void)updateEditingStateAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  -[WFComposeViewController setEditingState:animated:completionHandler:](self, "setEditingState:animated:completionHandler:", -[WFComposeViewController editingState](self, "editingState"), v4, v6);

}

- (void)setEditingState:(unint64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);

  v5 = a4;
  v19 = (void (**)(void))a5;
  -[WFComposeViewController editingStates](self, "editingStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v9 - 1, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);
  }

  if (a3 != 2)
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stop");

  }
  -[WFComposeViewController titleViewSettingsButton](self, "titleViewSettingsButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", a3 == 1);

  -[WFComposeViewController titleAccessorySettingsButton](self, "titleAccessorySettingsButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", a3 == 1);

  -[WFComposeViewController toolbar](self, "toolbar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRunning:", a3 == 2);

  -[WFComposeViewController drawerViewController](self, "drawerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFComposeViewController drawerViewController](self, "drawerViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserInteractionEnabled:", a3 == 1);

  }
  if (a3 != 1)
  {
    -[WFComposeViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endEditing:", 1);

  }
  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", v5);
  if (v19)
    v19[2]();

}

- (void)updateNavigationBarStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  BOOL v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];

  v3 = a3;
  v52[1] = *MEMORY[0x24BDAC8D0];
  -[WFComposeViewController updateBackActionForDocumentMenu](self, "updateBackActionForDocumentMenu");
  if (-[WFComposeViewController isRenameSessionActive](self, "isRenameSessionActive")
    || -[WFComposeViewController suppressDocumentMenuUpdates](self, "suppressDocumentMenuUpdates"))
  {
    return;
  }
  -[WFComposeViewController workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFComposeViewController visibleToolbarPlacement](self, "visibleToolbarPlacement") == 2)
  {
    v49 = v6;
    -[WFComposeViewController toolbar](self, "toolbar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(v7, "runItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reverseObjectEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    if ((-[WFComposeViewController navigationUpdateBehavior](self, "navigationUpdateBehavior") & 4) != 0)
    {
      objc_msgSend(v12, "addObject:", v8);
      objc_msgSend(v12, "addObject:", v8);
      objc_msgSend(v12, "addObject:", v8);
      objc_msgSend(v7, "undoRedoItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v23);

      -[WFComposeViewController doneBarButtonItem](self, "doneBarButtonItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v13, "addObject:", v16);
      objc_msgSend(v13, "addObjectsFromArray:", v11);
      v17 = v12;
    }
    else
    {
      objc_msgSend(v13, "addObject:", v8);
      objc_msgSend(v13, "addObjectsFromArray:", v11);
      if (!-[WFComposeViewController needsAdditionalSpaceInNavBar](self, "needsAdditionalSpaceInNavBar"))
      {
        objc_msgSend(v13, "addObject:", v8);
        objc_msgSend(v13, "addObject:", v8);
        objc_msgSend(v13, "addObject:", v8);
      }
      objc_msgSend(v7, "undoRedoItemsWithSpacer:", -[WFComposeViewController needsAdditionalSpaceInNavBar](self, "needsAdditionalSpaceInNavBar") ^ 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reverseObjectEnumerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addObjectsFromArray:", v16);
      v17 = 0;
    }

    v6 = v49;
    goto LABEL_33;
  }
  v18 = -[WFComposeViewController editingState](self, "editingState");
  switch(v18)
  {
    case 2uLL:
      -[WFComposeViewController doneBarButtonItem](self, "doneBarButtonItem");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
      {
        v50 = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      break;
    case 1uLL:
      -[WFComposeViewController doneBarButtonItem](self, "doneBarButtonItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_opt_new();
      v13 = v25;
      if (v24)
        objc_msgSend(v25, "addObject:", v24);
      if (-[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader"))
      {
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
        v51 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[WFComposeViewController workflow](self, "workflow");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isUntitled");

        if (v30)
        {
          v31 = (void *)MEMORY[0x24BDBCE30];
          -[WFComposeViewController cancelBarButtonItem](self, "cancelBarButtonItem");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "arrayWithObject:", v32);
          v17 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = 0;
        }
      }

      goto LABEL_33;
    case 0uLL:
      v19 = (void *)MEMORY[0x24BDBCE30];
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_beginEditing);
      objc_msgSend(v19, "arrayWithObject:", v20);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      -[WFComposeViewController doneBarButtonItem](self, "doneBarButtonItem");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
      {
        v52[0] = v21;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      goto LABEL_33;
    default:
      v13 = 0;
      break;
  }
  v17 = 0;
LABEL_33:
  -[WFComposeViewController presenter](self, "presenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "presentingViewControllerForComposeViewController:", self);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (v35)
  {
    -[WFComposeViewController navigationItem](self, "navigationItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "navigationItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "navigationItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[WFComposeViewController navigationUpdateBehavior](self, "navigationUpdateBehavior") & 1) != 0)
  {
    if (-[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader"))
      v40 = 2;
    else
      v40 = 0;
    if (-[WFComposeViewController visibleToolbarPlacement](self, "visibleToolbarPlacement") == 1)
      v41 = v6;
    else
      v41 = 0;
    objc_msgSend(v37, "setTitle:", v41);
    -[WFComposeViewController updateTitleItemIfNeeded](self, "updateTitleItemIfNeeded");
    objc_msgSend(v37, "setLargeTitleDisplayMode:", v40);
    objc_msgSend(v39, "setLargeTitleDisplayMode:", v40);
    -[WFComposeViewController adjustLargeTitleSize](self, "adjustLargeTitleSize");
  }
  objc_msgSend(v37, "setLeftItemsSupplementBackButton:", 1);
  objc_msgSend(v37, "leftBarButtonItems");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = WFUIBarButtonItemsEqualToItems(v42, v17);

  if (!v43)
    objc_msgSend(v37, "setLeftBarButtonItems:animated:", v17, v3);
  objc_msgSend(v37, "rightBarButtonItems");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = WFUIBarButtonItemsEqualToItems(v44, v13);

  if (!v45)
    objc_msgSend(v37, "setRightBarButtonItems:", v13);
  v46 = objc_alloc(MEMORY[0x24BEBD410]);
  WFLocalizedString(CFSTR("Back"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v46, "initWithTitle:style:target:action:", v47, 0, 0, 0);

  objc_msgSend(v37, "setBackBarButtonItem:", v48);
  -[WFComposeViewController updateDocumentMenuWithTitle:navigationItem:](self, "updateDocumentMenuWithTitle:navigationItem:", v6, v37);

}

- (void)adjustLargeTitleSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  id v33;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE210]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBB520];
  v33 = v3;
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v4, "systemFontOfSize:weight:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_largeTitleAccessoryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;

  objc_msgSend(v8, "frame");
  v21 = v20;
  objc_msgSend(v8, "largeTitleTextAttributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  v24 = v23;
  if (v23)
    v25 = v23;
  else
    v25 = (id)objc_opt_new();
  v26 = v25;

  v27 = *MEMORY[0x24BEBB360];
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BEBB360]);
  objc_msgSend(v14, "sizeWithAttributes:", v26);
  v29 = v21 - v19;
  while (v28 > v29)
  {
    objc_msgSend(v5, "pointSize");
    if (v30 <= 18.0)
      break;
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v5, "fontWithSize:", v31 + -4.0);
    v32 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, v27);
    objc_msgSend(v14, "sizeWithAttributes:", v26);
    v5 = (void *)v32;
  }
  objc_msgSend(v8, "setLargeTitleTextAttributes:", v26);
  objc_msgSend(v11, "setLargeTitleTextAttributes:", v26);

}

- (id)doneBarButtonItem
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = -[WFComposeViewController isNewShortcutFlow](self, "isNewShortcutFlow");
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD410]);
    WFLocalizedString(CFSTR("Next"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel_didTapNext);

    WFLocalizedString(CFSTR("Goes to shortcut name set up step"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v7);

    -[WFComposeViewController flowController](self, "flowController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "workflowHasContent");
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone_);
    WFLocalizedString(CFSTR("Closes the shortcut"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityHint:", v10);

    v9 = 1;
    v6 = v8;
  }
  objc_msgSend(v6, "setEnabled:", v9);
  if (v3)

  objc_msgSend(v6, "setSpringLoaded:", 1);
  return v6;
}

- (id)placeholderName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFComposeViewController workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFComposeViewController workflow](self, "workflow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsGroupedWithAction:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0;
  if (v5 && v7 && v8)
  {
    objc_msgSend(v8, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)isNewShortcutFlow
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFComposeViewController workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUntitled"))
  {
    -[WFComposeViewController flowController](self, "flowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)displaysInlineRenameInHeader
{
  return (-[WFComposeViewController navigationUpdateBehavior](self, "navigationUpdateBehavior") >> 3) & 1;
}

- (BOOL)usesDocumentMenu
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[WFComposeViewController displaysInlineRenameInHeader](self, "displaysInlineRenameInHeader"))
    return 0;
  -[WFComposeViewController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForComposeViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)needsAdditionalSpaceInNavBar
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  BOOL v7;

  -[WFComposeViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v4 != 2)
    return 0;
  -[WFComposeViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6 < 1100.0;

  return v7;
}

- (id)cancelBarButtonItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didTapCancel_);
  WFLocalizedString(CFSTR("Cancels editing the shortcut"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityHint:", v3);

  return v2;
}

- (void)presentSettingsViewController
{
  void *v3;
  id v4;

  -[WFComposeViewController workflow](self, "workflow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFPresentWorkflowSettingsViewController(v4, v3, self, self);

}

- (WFWorkflowSettingsViewController)settingsViewController
{
  WFWorkflowSettingsViewController **p_settingsViewController;
  WFWorkflowSettingsViewController *v4;
  WFWorkflowSettingsViewController *v5;
  void *v6;
  void *v7;

  p_settingsViewController = &self->_settingsViewController;
  v4 = self->_settingsViewController;
  if (!v4)
  {
    v5 = [WFWorkflowSettingsViewController alloc];
    -[WFComposeViewController workflow](self, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController database](self, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[WFWorkflowSettingsViewController initWithWorkflow:database:hideNavigationBar:](v5, "initWithWorkflow:database:hideNavigationBar:", v6, v7, 1);

    -[WFWorkflowSettingsViewController setDelegate:](v4, "setDelegate:", self);
    objc_storeStrong((id *)p_settingsViewController, v4);
  }
  return v4;
}

- (void)shareWorkflowWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[WFComposeViewController activityControllerWithFileActivity:sender:](self, "activityControllerWithFileActivity:sender:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarButtonItem:", v4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__WFComposeViewController_shareWorkflowWithSender___block_invoke;
  v8[3] = &unk_24E604E80;
  v9 = 0;
  v7 = v5;
  v10 = v7;
  -[WFComposeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v8);

}

- (Class)triggerInputType
{
  return 0;
}

- (id)activityControllerWithFileActivity:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WFAddToHomeScreenActivity *v11;
  void *v12;
  void *v13;
  WFAddToHomeScreenActivity *v14;
  WFWorkflowFileActivity *v15;
  uint64_t v16;
  WFWorkflowActivityViewController *v17;
  void *v18;
  WFWorkflowActivityViewController *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[WFComposeViewController workflow](self, "workflow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [WFAddToHomeScreenActivity alloc];
    -[WFComposeViewController workflow](self, "workflow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFAddToHomeScreenActivity initWithReference:](v11, "initWithReference:", v13);

    objc_msgSend(v8, "addObject:", v14);
  }
  if (objc_msgSend(MEMORY[0x24BEC4038], "shortcutFileSharingEnabled"))
  {
    v15 = [WFWorkflowFileActivity alloc];
    v16 = -[WFWorkflowFileActivity initWithSourceView:sourceRect:barButtonItem:](v15, "initWithSourceView:sourceRect:barButtonItem:", 0, v7, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));

    v6 = (id)v16;
    objc_msgSend(v8, "addObject:", v16);
  }
  v17 = [WFWorkflowActivityViewController alloc];
  -[WFComposeViewController workflow](self, "workflow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[WFWorkflowActivityViewController initWithWorkflow:applicationActivities:](v17, "initWithWorkflow:applicationActivities:", v18, v8);

  return v19;
}

- (void)updateDocumentMenuWithTitle:(id)a3 navigationItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  if (!-[WFComposeViewController usesDocumentMenu](self, "usesDocumentMenu")
    || -[WFComposeViewController suppressDocumentMenuUpdates](self, "suppressDocumentMenuUpdates"))
  {
    goto LABEL_29;
  }
  -[WFComposeViewController findViewInNavigationBarWithName:](self, "findViewInNavigationBarWithName:", CFSTR("_UINavigationBarTitleControl"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[WFComposeViewController findViewInView:withName:](self, "findViewInView:withName:", v8, CFSTR("UILabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v11, "text");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  -[WFComposeViewController workflow](self, "workflow", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isUntitled") & 1) == 0)
  {

    LODWORD(v13) = 0;
    goto LABEL_15;
  }
  -[WFComposeViewController placeholderName](self, "placeholderName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_15:
    v14 = v6;
    goto LABEL_16;
  }
  -[WFComposeViewController placeholderName](self, "placeholderName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1;
LABEL_16:
  objc_msgSend(CFSTR("‌        ‌"), "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v13)

  objc_msgSend(v7, "setTitle:", v15);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStandardAppearance:", v16);
  objc_msgSend(v7, "setScrollEdgeAppearance:", v16);
  objc_initWeak(&location, self);
  v17 = objc_initWeak(&from, v7);
  -[WFComposeViewController setDocumentMenuControlWithTitle:navigationItem:](self, "setDocumentMenuControlWithTitle:navigationItem:", v6, v7);

  objc_msgSend(v7, "setRenameDelegate:", self);
  v18 = objc_loadWeakRetained(&location);
  objc_msgSend(v18, "findViewInNavigationBarWithName:", CFSTR("_UINavigationBarTitleRenameTextField"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;

  objc_msgSend(v21, "setClearButtonMode:", 3);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke;
  v29[3] = &unk_24E603F58;
  objc_copyWeak(&v30, &location);
  objc_copyWeak(&v31, &from);
  objc_msgSend(v7, "setTitleMenuProvider:", v29);
  v22 = objc_msgSend(v28, "isEqualToString:", v15);
  if (v27)
    v23 = v22;
  else
    v23 = 1;
  if ((v23 & 1) == 0)
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "navigationBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "setNeedsLayout");
    objc_msgSend(v26, "layoutIfNeeded");
    -[WFComposeViewController layoutIconView](self, "layoutIconView");

  }
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_29:
}

- (void)layoutIconView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  UIButton *v22;
  void *v23;
  UIButton *iconView;
  UIButton *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  NSObject *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  CGFloat MaxX;
  CGFloat v56;
  double v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  uint64_t v61;
  void *v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  void *v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t);
  void *v76;
  UIButton *v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id location[4];
  CGRect v85;
  CGRect v86;
  CGRect v87;

  location[2] = *(id *)MEMORY[0x24BDAC8D0];
  -[WFComposeViewController findViewInNavigationBarWithName:](self, "findViewInNavigationBarWithName:", CFSTR("_UINavigationBarTitleControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (!v3)
    {
      getWFEditorLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 136315138;
        *(id *)((char *)location + 4) = "-[WFComposeViewController layoutIconView]";
        _os_log_impl(&dword_22007E000, v34, OS_LOG_TYPE_ERROR, "%s Failed to prepare icon view. Could not find title control in view hierarchy.", (uint8_t *)location, 0xCu);
      }
      goto LABEL_17;
    }
    objc_msgSend(v3, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController iconView](self, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsImageWhenHighlighted:", 0);
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowRadius:", 8.0);

    objc_msgSend(v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1036831949;
    objc_msgSend(v9, "setShadowOpacity:", v10);

    objc_msgSend(v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowOffset:", 0.0, 1.0);

    objc_initWeak(location, self);
    v12 = (void *)MEMORY[0x24BEBD388];
    v13 = MEMORY[0x24BDAC760];
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __41__WFComposeViewController_layoutIconView__block_invoke;
    v82[3] = &unk_24E603EE0;
    objc_copyWeak(&v83, location);
    objc_msgSend(v12, "actionWithHandler:", v82);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:forControlEvents:", v14, 64);

    v15 = (void *)MEMORY[0x24BEBD388];
    v80[0] = v13;
    v80[1] = 3221225472;
    v80[2] = __41__WFComposeViewController_layoutIconView__block_invoke_2;
    v80[3] = &unk_24E604660;
    v16 = v7;
    v81 = v16;
    objc_msgSend(v15, "actionWithHandler:", v80);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:forControlEvents:", v17, 1);

    v18 = (void *)MEMORY[0x24BEBD388];
    v78[0] = v13;
    v78[1] = 3221225472;
    v78[2] = __41__WFComposeViewController_layoutIconView__block_invoke_4;
    v78[3] = &unk_24E604660;
    v19 = v16;
    v79 = v19;
    objc_msgSend(v18, "actionWithHandler:", v78);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addAction:forControlEvents:", v20, 16);

    v21 = (void *)MEMORY[0x24BEBD388];
    v73 = v13;
    v74 = 3221225472;
    v75 = __41__WFComposeViewController_layoutIconView__block_invoke_6;
    v76 = &unk_24E604660;
    v22 = (UIButton *)v19;
    v77 = v22;
    objc_msgSend(v21, "actionWithHandler:", &v73);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v22, "addAction:forControlEvents:", v23, 352, v73, v74, v75, v76);

    objc_msgSend(v6, "addSubview:", v22);
    iconView = self->_iconView;
    self->_iconView = v22;
    v25 = v22;

    objc_destroyWeak(&v83);
    objc_destroyWeak(location);

  }
  objc_msgSend(v3, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  if (!-[WFComposeViewController shouldAnchorIconViewToRenameTextField](self, "shouldAnchorIconViewToRenameTextField"))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "traitCollection");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "layoutDirection") == 0;

    objc_msgSend(v3, "frame");
    if (!v60)
      CGRectGetMaxX(*(CGRect *)&v61);
    -[WFComposeViewController traitCollection](self, "traitCollection");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "displayScale");
    BSFloatRoundForScale();
    v57 = v66;

    v86.origin.x = v27;
    v86.origin.y = v29;
    v86.size.width = v31;
    v86.size.height = v33;
    CGRectGetMidY(v86);
    -[WFComposeViewController traitCollection](self, "traitCollection");
    v34 = objc_claimAutoreleasedReturnValue();
    -[NSObject displayScale](v34, "displayScale");
    BSFloatRoundForScale();
    goto LABEL_16;
  }
  -[WFComposeViewController findViewInNavigationBarWithName:](self, "findViewInNavigationBarWithName:", CFSTR("_UINavigationBarTitleRenameTextField"));
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSObject bounds](v34, "bounds");
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      objc_msgSend(v3, "superview");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject convertRect:toView:](v34, "convertRect:toView:", v43, v36, v38, v40, v42);
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;

      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "traitCollection");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "layoutDirection") == 0;

      if (v54)
      {
        v56 = v51;
        v57 = v45 + 5.0;
      }
      else
      {
        v85.origin.x = v45;
        v85.origin.y = v47;
        v85.size.width = v49;
        v85.size.height = v51;
        MaxX = CGRectGetMaxX(v85);
        v56 = v51;
        v57 = MaxX + -24.0 + -5.0;
      }
      v67 = v45;
      v68 = v47;
      v69 = v49;
      CGRectGetMidY(*(CGRect *)(&v56 - 3));
      -[WFComposeViewController traitCollection](self, "traitCollection");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "displayScale");
      BSFloatRoundForScale();

LABEL_16:
      -[WFComposeViewController iconView](self, "iconView");
      v34 = objc_claimAutoreleasedReturnValue();
      v87.origin.x = v27;
      v87.origin.y = v29;
      v87.size.width = v31;
      v87.size.height = v33;
      CGRectGetMidY(v87);
      -[WFComposeViewController traitCollection](self, "traitCollection");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "displayScale");
      BSFloatRoundForScale();
      -[NSObject setFrame:](v34, "setFrame:", v57, v72, 24.0, 24.0);

    }
  }
LABEL_17:

}

- (void)setDocumentMenuControlWithTitle:(id)a3 navigationItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void (**v18)(void *, void *);
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  void (**v36)(_QWORD, _QWORD);
  void (**v37)(void *, void *);
  _QWORD v38[5];
  _QWORD aBlock[4];
  id v40;
  id v41;
  id v42;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[WFComposeViewController workflow](self, "workflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedAssociatedAppBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (-[WFComposeViewController workflow](self, "workflow"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "shouldAutoUpdateAssociatedAppBundleIdentifier"),
        v10,
        v11))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1338]), "initWithBundleIdentifier:", v9);
  }
  else
  {
    -[WFComposeViewController workflow](self, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_initWeak(location, self);
  v15 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke;
  aBlock[3] = &unk_24E603FD0;
  v16 = v6;
  v40 = v16;
  v17 = v7;
  v41 = v17;
  objc_copyWeak(&v42, location);
  v18 = (void (**)(void *, void *))_Block_copy(aBlock);
  v38[0] = v15;
  v38[1] = 3221225472;
  v38[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_4;
  v38[3] = &unk_24E603FF8;
  v38[4] = self;
  v19 = _Block_copy(v38);
  v20 = (void (**)(_QWORD, _QWORD))v19;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "applicationState");

    if (!v22)
    {
      objc_msgSend(MEMORY[0x24BEC54D0], "loadIcon:size:style:", v12, 4, 52.0, 52.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC54D0], "loadIcon:size:style:", v12, 5, 52.0, 52.0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v23 && v24)
      {
        ((void (**)(_QWORD, void *))v20)[2](v20, v23);
        v18[2](v18, v25);
      }
      else
      {
        v33 = (void *)v24;
        v34 = v23;
        v26 = v12;
        objc_opt_class();
        v27 = objc_opt_isKindOfClass() & 1;
        if (v27)
          v28 = v26;
        else
          v28 = 0;
        v32 = v28;

        if (v27)
        {
          v30 = (void *)MEMORY[0x24BEC14E0];
          v29 = v26;
          v25 = v33;
          v23 = v34;
          objc_msgSend(v29, "bundleIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = v15;
          v35[1] = 3221225472;
          v35[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_6;
          v35[3] = &unk_24E604020;
          v36 = v20;
          v37 = v18;
          objc_msgSend(v30, "applicationIconImageForBundleIdentifier:length:scale:completionHandler:", v31, v35, 52.0, 3.0);

        }
        else
        {
          v25 = v33;
          v23 = v34;
          v20[2](v20, 0);
          v18[2](v18, 0);
        }

      }
    }
  }
  else
  {
    (*((void (**)(void *, _QWORD))v19 + 2))(v19, 0);
    v18[2](v18, 0);
  }

  objc_destroyWeak(&v42);
  objc_destroyWeak(location);

}

- (void)layoutDocumentMenuControl
{
  void *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  id v6;

  -[WFComposeViewController findViewInNavigationBarWithName:](self, "findViewInNavigationBarWithName:", CFSTR("_UIDocumentPropertiesIconView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_time(0, 150000000);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__WFComposeViewController_layoutDocumentMenuControl__block_invoke;
    v5[3] = &unk_24E604E80;
    v5[4] = self;
    v6 = v3;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], v5);

  }
}

- (void)updateBackActionForDocumentMenu
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  if (-[WFComposeViewController usesDocumentMenu](self, "usesDocumentMenu")
    && !-[WFComposeViewController backActionTapped](self, "backActionTapped"))
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[WFComposeViewController needsAdditionalSpaceInNavBar](self, "needsAdditionalSpaceInNavBar"))
    {
      v5 = &stru_24E605650;
    }
    else
    {
      WFLocalizedString(CFSTR("Shortcuts"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[WFComposeViewController backAction](self, "backAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x24BEBD388];
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __58__WFComposeViewController_updateBackActionForDocumentMenu__block_invoke;
      v17 = &unk_24E603EE0;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v5, 0, 0, &v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Closes the shortcut"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityHint:", v9, v14, v15, v16, v17);

      -[WFComposeViewController setBackAction:](self, "setBackAction:", v8);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v4, "setBackAction:", 0);
    -[WFComposeViewController traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "horizontalSizeClass");

    if (v11 == 2)
    {
      -[WFComposeViewController backAction](self, "backAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v5);

      objc_msgSend(v4, "setStyle:", 1);
      -[WFComposeViewController backAction](self, "backAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBackAction:", v13);

    }
    else
    {
      objc_msgSend(v4, "setStyle:", 0);
    }

  }
}

- (void)applicationWillEnterForeground
{
  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 0);
  -[WFComposeViewController layoutDocumentMenuControl](self, "layoutDocumentMenuControl");
}

- (void)presentIconPickerWithSourceItem:(id)a3
{
  WFShortcutIconEditorViewController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  WFShortcutIconEditorViewController *v20;

  v4 = [WFShortcutIconEditorViewController alloc];
  -[WFComposeViewController workflow](self, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[WFShortcutIconEditorViewController initWithWorkflow:](v4, "initWithWorkflow:", v5);

  -[WFShortcutIconEditorViewController setDelegate:](v20, "setDelegate:", self);
  -[WFComposeViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  if (v7 == 2)
  {
    -[WFShortcutIconEditorViewController setShowsDoneButton:](v20, "setShowsDoneButton:", 0);
    -[WFShortcutIconEditorViewController setPreferredContentSize:](v20, "setPreferredContentSize:", 390.0, 700.0);
    -[WFShortcutIconEditorViewController setModalPresentationStyle:](v20, "setModalPresentationStyle:", 7);
    -[WFShortcutIconEditorViewController popoverPresentationController](v20, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "setPermittedArrowDirections:", 1);
    -[WFComposeViewController findViewInNavigationBarWithName:](self, "findViewInNavigationBarWithName:", CFSTR("LPLinkView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    if (v9)
    {
      v14 = v10;
      v15 = v11;
      v16 = v12;
      v17 = v13;
    }
    else
    {
      -[WFComposeViewController editorViewController](self, "editorViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "navigationBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[WFComposeViewController needsAdditionalSpaceInNavBar](self, "needsAdditionalSpaceInNavBar"))
        v14 = 60.0;
      else
        v14 = 130.0;
      v16 = 0.0;
      v15 = 44.0;
      v17 = 0.0;
    }
    objc_msgSend(v8, "setSourceView:", v9);
    objc_msgSend(v8, "setSourceRect:", v14, v15, v16, v17);

  }
  -[WFComposeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

}

- (void)presentAddToHomeScreen
{
  void *v3;
  void *v4;
  WFAddToHomeScreenActivity *v5;
  void *v6;
  void *v7;
  WFAddToHomeScreenActivity *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[WFComposeViewController workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [WFAddToHomeScreenActivity alloc];
    -[WFComposeViewController workflow](self, "workflow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFAddToHomeScreenActivity initWithReference:](v5, "initWithReference:", v7);

    -[WFComposeViewController workflow](self, "workflow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddToHomeScreenActivity prepareWithActivityItems:](v8, "prepareWithActivityItems:", v11);

    -[WFComposeViewController setAddToHomeScreenActivity:](self, "setAddToHomeScreenActivity:", v8);
    -[WFAddToHomeScreenActivity activityViewController](v8, "activityViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

  }
}

- (id)findViewInNavigationBarWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFComposeViewController findViewInView:withName:](self, "findViewInView:withName:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)findViewInView:(id)a3 withName:(id)a4
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (NSString *)a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLastObject");
    NSClassFromString(v6);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v8, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (id)navigationItem:(id)a3 willBeginRenamingWithSuggestedTitle:(id)a4 selectedRange:(_NSRange *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSUInteger v13;
  dispatch_time_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  -[WFComposeViewController setRenameSessionActive:](self, "setRenameSessionActive:", 1);
  objc_msgSend(v8, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("workflow.editor.navigationbar"));

  v11 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("‌        ‌"), &stru_24E605650);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  a5->location = 0;
  a5->length = v13;
  v14 = dispatch_time(0, 100000000);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_5;
  v17[3] = &unk_24E604D88;
  v17[4] = self;
  v15 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_after(v14, MEMORY[0x24BDAC9B8], v17);

  return v12;
}

- (void)navigationItem:(id)a3 didEndRenamingWithTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  -[WFComposeViewController setRenameSessionActive:](self, "setRenameSessionActive:", 0);
  objc_msgSend(v6, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", 0);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke;
  block[3] = &unk_24E604D88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[WFComposeViewController workflow](self, "workflow");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v7)
  {
    v15 = v7;
    goto LABEL_9;
  }
  v11 = objc_msgSend(v7, "wf_isEmpty");

  if ((v11 & 1) == 0)
  {
    -[WFComposeViewController database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController workflow](self, "workflow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v12, "renameReference:to:error:", v14, v7, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;

    if (v15)
    {
      -[WFComposeViewController workflow](self, "workflow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setName:", v7);

      -[WFComposeViewController workflow](self, "workflow");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "save");

      v18 = objc_alloc_init(MEMORY[0x24BEC3FE8]);
      objc_msgSend(v18, "setKey:", CFSTR("RenameShortcutEvent"));
      objc_msgSend(v18, "setSource:", CFSTR("ShortcutSourceEditorDocumentMenu"));
      objc_msgSend(v18, "track");
    }
    else
    {
      if (!v9)
      {
        v15 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x24BE19370], "alertWithError:", v9);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      WFUserInterfaceFromViewController();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentAlert:", v18);

    }
LABEL_9:

  }
  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 1);
  -[WFComposeViewController layoutDocumentMenuControl](self, "layoutDocumentMenuControl");

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 0);
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[WFComposeViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[WFComposeViewController drawerHostingViewController](self, "drawerHostingViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v7)
  {
    objc_msgSend(MEMORY[0x24BEC2ED8], "drawerSizeFromParentSize:safeAreaInsets:traitCollection:", v8, width, height, v11, v13, v15, v17);
  }
  else
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 == v7)
    {
      objc_msgSend(MEMORY[0x24BEC2ED8], "workflowViewSizeFromParentSize:safeAreaInsets:traitCollection:", v8, width, height, v11, v13, v15, v17);
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)WFComposeViewController;
      -[WFComposeViewController sizeForChildContentContainer:withParentContainerSize:](&v26, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    }
  }
  v22 = v20;
  v23 = v21;

  v24 = v22;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)WFWorkflowNameContext == a6 || WFWorkflowReferenceContext == (_QWORD)a6)
  {
    -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 1);
  }
  else if ((void *)WFWorkflowActionsContext == a6)
  {
    -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateDrawerSheetBottomInset:", 1);

    -[WFComposeViewController editorViewController](self, "editorViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[WFComposeViewController resetToolbar](self, "resetToolbar");
  }
  else if ((void *)WFWorkflowDeletedContext == a6)
  {
    -[WFComposeViewController workflow](self, "workflow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isDeleted");

    if (v17)
      -[WFComposeViewController finishEditing](self, "finishEditing");
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WFComposeViewController;
    -[WFComposeViewController observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)expandDrawer
{
  id v3;
  id v4;

  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expandDrawer");

  -[WFComposeViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)resetToolbar
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  -[WFComposeViewController toolbar](self, "toolbar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[WFComposeViewController toolbar](self, "toolbar");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEditing:", 1);

  -[WFComposeViewController undoManager](self, "undoManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WFComposeViewController toolbar](self, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWorkflowUndoManager:", v10);

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v11, "isRunning");
  -[WFComposeViewController toolbar](self, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRunning:", v4);

  -[WFComposeViewController workflow](self, "workflow");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  -[WFComposeViewController toolbar](self, "toolbar");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlayEnabled:", v7);

  -[WFComposeViewController toolbar](self, "toolbar");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShareEnabled:", v7);

}

- (void)runToolbarPlayTapped:(id)a3
{
  id v4;
  id v5;

  -[WFComposeViewController editorViewController](self, "editorViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runWithSource:", *MEMORY[0x24BEC1D20]);

  -[WFComposeViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEditing:", 1);

}

- (void)runToolbarStopTapped:(id)a3
{
  id v3;

  -[WFComposeViewController editorViewController](self, "editorViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

}

- (void)runToolbarShareTapped:(id)a3 sender:(id)a4
{
  -[WFComposeViewController shareWorkflowWithSender:](self, "shareWorkflowWithSender:", a4);
}

- (void)runToolbarUndoTapped:(id)a3
{
  id v3;

  -[WFComposeViewController undoManager](self, "undoManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undo");

}

- (void)runToolbarRedoTapped:(id)a3
{
  id v3;

  -[WFComposeViewController undoManager](self, "undoManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "redo");

}

- (void)editorViewController:(id)a3 didChangeRunningState:(BOOL)a4 fractionCompleted:(double)a5 isWaiting:(BOOL)a6
{
  if (a4)
    -[WFComposeViewController pushEditingState:animated:completionHandler:](self, "pushEditingState:animated:completionHandler:", 2, 1, 0, a5);
}

- (void)editorViewControllerDidFinishRunning:(id)a3 cancelled:(BOOL)a4
{
  -[WFComposeViewController popEditingState:animated:completionHandler:](self, "popEditingState:animated:completionHandler:", 2, 1, 0);
}

- (void)actionsDidChangeInEditorViewController:(id)a3
{
  void *v4;

  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSearchBar");

  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 0);
}

- (void)appendAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFComposeViewController editorViewController](self, "editorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendAction:", v5);

}

- (void)actionDrawerCoordinator:(id)a3 didAppendAction:(id)a4
{
  -[WFComposeViewController appendAction:](self, "appendAction:", a4);
}

- (double)actionCanvasWidthForActionDrawerCoordinator:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[WFComposeViewController editorViewController](self, "editorViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionCanvasWidth");
  v5 = v4;

  return v5;
}

- (BOOL)actionCanvasIsEmpty
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WFComposeViewController workflow](self, "workflow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (void)inspectorPaneSegmentedControl:(id)a3 didSelectPane:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4 == 1)
  {
    -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController settingsViewController](self, "settingsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInspectorPaneViewController:", v7);
    goto LABEL_5;
  }
  if (!a4)
  {
    -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeViewController drawerViewController](self, "drawerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInspectorPaneViewController:", v7);
LABEL_5:

  }
}

- (BOOL)accessibilityPerformMagicTap
{
  unint64_t v3;
  void *v4;

  v3 = -[WFComposeViewController editingState](self, "editingState");
  if (v3 < 2)
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "runWithSource:", *MEMORY[0x24BEC1CE8]);
LABEL_5:

    return 1;
  }
  if (v3 == 2)
  {
    -[WFComposeViewController editorViewController](self, "editorViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");
    goto LABEL_5;
  }
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  unint64_t v3;
  void *v4;

  v3 = -[WFComposeViewController editingState](self, "editingState");
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      -[WFComposeViewController editorViewController](self, "editorViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stop");

    }
  }
  else
  {
    -[WFComposeViewController didTapDone](self, "didTapDone");
  }
  return 1;
}

- (BOOL)canExpandDrawerAsAuxiliaryViewPresenter
{
  return 1;
}

- (void)collapseDrawerAsAuxiliaryViewPresenter
{
  id v2;

  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapseDrawer");

}

- (void)presentDrawerViewControllerAsAuxiliaryViewPresenter:(id)a3 inPopover:(BOOL)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v9;
  void *v11;
  id v12;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v12 = a3;
  -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentDrawerViewController:inPopover:withSourceRect:", v12, v9, x, y, width, height);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v24;
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

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BEBD6B8];
  WFLocalizedString(CFSTR("Run Shortcut"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, sel_runWorkflowFromKeyPress, CFSTR("r"), 0x100000, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BEBD6B8];
  WFLocalizedString(CFSTR("Stop Shortcut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v8, 0, sel_stopWorkflow, *MEMORY[0x24BEBE3E0], 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BEBD6B8];
  WFLocalizedString(CFSTR("Rename Shortcut"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v11, 0, sel_renameWorkflow, CFSTR("r"), 1310720, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  if (-[WFComposeViewController editingState](self, "editingState") == 1)
  {
    v13 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Search Actions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v14, 0, sel_searchActions, CFSTR("f"), 0x100000, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    v16 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Undo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v17, 0, sel_undoLastWorkflowEdit, CFSTR("z"), 0x100000, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

    v19 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Redo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v20, 0, sel_redoLastWorkflowEdit, CFSTR("z"), 1179648, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

    v22 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Comment"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v23, 0, sel_addCommentActionFromKeyPress, CFSTR("c"), 1179648, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

    v25 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Set Variable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v26, 0, sel_addSetVariableActionFromKeyPress, CFSTR("v"), 1179648, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

    v28 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Ask For Input"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v29, 0, sel_addAskForInputActionFromKeyPress, CFSTR("a"), 1179648, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

    v31 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Show Result"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v32, 0, sel_addShowResultActionFromKeyPress, CFSTR("s"), 1179648, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v33);

    v34 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Choose From Menu"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v35, 0, sel_addChooseFromMenuActionFromKeyPress, CFSTR("m"), 1179648, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v36);

    v37 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("If"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v38, 0, sel_addConditionalActionFromKeyPress, CFSTR("i"), 1179648, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v39);

    v40 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Repeat Count"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v41, 0, sel_addRepeatCountActionFromKeyPress, CFSTR("r"), 1179648, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v42);

    v43 = (void *)MEMORY[0x24BEBD6B8];
    WFLocalizedString(CFSTR("Repeat Each"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v44, 0, sel_addRepeatEachActionFromKeyPress, CFSTR("e"), 1179648, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v45);

  }
  v46 = (void *)MEMORY[0x24BEBD6B8];
  WFLocalizedString(CFSTR("Close Shortcut"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v47, 0, sel_didTapDone, CFSTR("w"), 0x100000, 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v48);

  return v3;
}

- (void)renameWorkflow
{
  void *v2;
  id v3;

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "rename:", 0);

}

- (void)runWorkflowFromKeyPress
{
  id v2;

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runWithSource:", *MEMORY[0x24BEC1D10]);

}

- (void)stopWorkflow
{
  id v2;

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)searchActions
{
  id v3;

  if (-[WFComposeViewController editingState](self, "editingState") == 1)
  {
    -[WFComposeViewController drawerCoordinator](self, "drawerCoordinator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusSearchBar");

  }
}

- (void)undoLastWorkflowEdit
{
  id v3;

  if (-[WFComposeViewController editingState](self, "editingState") == 1)
  {
    -[WFComposeViewController undoManager](self, "undoManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "undo");

  }
}

- (void)redoLastWorkflowEdit
{
  id v3;

  if (-[WFComposeViewController editingState](self, "editingState") == 1)
  {
    -[WFComposeViewController undoManager](self, "undoManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "redo");

  }
}

- (void)addCommentActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.comment"));
}

- (void)addSetVariableActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.setvariable"));
}

- (void)addAskForInputActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.ask"));
}

- (void)addShowResultActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.showresult"));
}

- (void)addChooseFromMenuActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.choosefrommenu"));
}

- (void)addConditionalActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.conditional"));
}

- (void)addRepeatCountActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.repeat.count"));
}

- (void)addRepeatEachActionFromKeyPress
{
  -[WFComposeViewController appendActionWithIdentifier:](self, "appendActionWithIdentifier:", CFSTR("is.workflow.actions.repeat.each"));
}

- (void)appendActionWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BEC3A60], "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createActionWithIdentifier:serializedParameters:", v7, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFComposeViewController editorViewController](self, "editorViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendAction:", v5);

}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)iconEditorWillDisappear:(id)a3
{
  -[WFComposeViewController updateNavigationBarStateAnimated:](self, "updateNavigationBarStateAnimated:", 0);
}

- (void)performScrollingTest:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id *v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("shortcutsEditor")))
  {
    v5 = dispatch_time(0, 1000000000);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __48__WFComposeViewController_performScrollingTest___block_invoke;
    v11[3] = &unk_24E604E80;
    v11[4] = self;
    v6 = &v12;
    v12 = v4;
    v7 = MEMORY[0x24BDAC9B8];
    v8 = v11;
LABEL_5:
    dispatch_after(v5, v7, v8);

    goto LABEL_6;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("shortcutsDrawer")))
  {
    v5 = dispatch_time(0, 2000000000);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__WFComposeViewController_performScrollingTest___block_invoke_2;
    v9[3] = &unk_24E604E80;
    v9[4] = self;
    v6 = &v10;
    v10 = v4;
    v7 = MEMORY[0x24BDAC9B8];
    v8 = v9;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFEditorViewController)editorViewController
{
  return self->_editorViewController;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (WFComposeViewControllerPresenter)presenter
{
  return (WFComposeViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (WFComposeViewControllerDelegate)delegate
{
  return (WFComposeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFEditorDocumentMenuDelegate)editorDocumentMenuDelegate
{
  return (WFEditorDocumentMenuDelegate *)objc_loadWeakRetained((id *)&self->_editorDocumentMenuDelegate);
}

- (void)setEditorDocumentMenuDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editorDocumentMenuDelegate, a3);
}

- (BOOL)isEditingNewWorkflow
{
  return self->_isEditingNewWorkflow;
}

- (void)setIsEditingNewWorkflow:(BOOL)a3
{
  self->_isEditingNewWorkflow = a3;
}

- (UIButton)settingsButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_settingsButton);
}

- (UIView)separatorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_separatorView);
}

- (NSHashTable)movedDragControllers
{
  return self->_movedDragControllers;
}

- (WFComposeUserActivityManager)userActivityManager
{
  return self->_userActivityManager;
}

- (void)setUserActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityManager, a3);
}

- (NSMutableArray)editingStates
{
  return self->_editingStates;
}

- (WFRunWorkflowToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_toolbar, a3);
}

- (BOOL)isRenameSessionActive
{
  return self->_renameSessionActive;
}

- (void)setRenameSessionActive:(BOOL)a3
{
  self->_renameSessionActive = a3;
}

- (BOOL)shouldShowShareButton
{
  return self->_shouldShowShareButton;
}

- (void)setShouldShowShareButton:(BOOL)a3
{
  self->_shouldShowShareButton = a3;
}

- (BOOL)observingSharingEnabledUserDefault
{
  return self->_observingSharingEnabledUserDefault;
}

- (void)setObservingSharingEnabledUserDefault:(BOOL)a3
{
  self->_observingSharingEnabledUserDefault = a3;
}

- (UILabel)titleViewLabel
{
  return self->_titleViewLabel;
}

- (void)setTitleViewLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewLabel, a3);
}

- (UIButton)titleViewSettingsButton
{
  return self->_titleViewSettingsButton;
}

- (void)setTitleViewSettingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewSettingsButton, a3);
}

- (void)setTitleAccessorySettingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_titleAccessorySettingsButton, a3);
}

- (UIButton)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (BOOL)shouldAnchorIconViewToRenameTextField
{
  return self->_shouldAnchorIconViewToRenameTextField;
}

- (void)setShouldAnchorIconViewToRenameTextField:(BOOL)a3
{
  self->_shouldAnchorIconViewToRenameTextField = a3;
}

- (BOOL)suppressDocumentMenuUpdates
{
  return self->_suppressDocumentMenuUpdates;
}

- (void)setSuppressDocumentMenuUpdates:(BOOL)a3
{
  self->_suppressDocumentMenuUpdates = a3;
}

- (UIAction)backAction
{
  return self->_backAction;
}

- (void)setBackAction:(id)a3
{
  objc_storeStrong((id *)&self->_backAction, a3);
}

- (BOOL)backActionTapped
{
  return self->_backActionTapped;
}

- (void)setBackActionTapped:(BOOL)a3
{
  self->_backActionTapped = a3;
}

- (WFActionDrawerCoordinator)drawerCoordinator
{
  return self->_drawerCoordinator;
}

- (void)setDrawerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_drawerCoordinator, a3);
}

- (WFComposeFlowController)flowController
{
  return self->_flowController;
}

- (void)setFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_flowController, a3);
}

- (WFMoveToFolderCoordinator)moveCoordinator
{
  return self->_moveCoordinator;
}

- (void)setMoveCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_moveCoordinator, a3);
}

- (WFAddToHomeScreenActivity)addToHomeScreenActivity
{
  return self->_addToHomeScreenActivity;
}

- (void)setAddToHomeScreenActivity:(id)a3
{
  objc_storeStrong((id *)&self->_addToHomeScreenActivity, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (WFDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_addToHomeScreenActivity, 0);
  objc_storeStrong((id *)&self->_moveCoordinator, 0);
  objc_storeStrong((id *)&self->_flowController, 0);
  objc_storeStrong((id *)&self->_drawerCoordinator, 0);
  objc_storeStrong((id *)&self->_backAction, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_titleAccessorySettingsButton, 0);
  objc_storeStrong((id *)&self->_titleViewSettingsButton, 0);
  objc_storeStrong((id *)&self->_titleViewLabel, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_editingStates, 0);
  objc_storeStrong((id *)&self->_userActivityManager, 0);
  objc_storeStrong((id *)&self->_movedDragControllers, 0);
  objc_destroyWeak((id *)&self->_separatorView);
  objc_destroyWeak((id *)&self->_settingsButton);
  objc_destroyWeak((id *)&self->_editorDocumentMenuDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_editorViewController, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

void __48__WFComposeViewController_performScrollingTest___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "editorViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performScrollingTest:", *(_QWORD *)(a1 + 40));

}

void __48__WFComposeViewController_performScrollingTest___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "drawerCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performScrollingTest:", *(_QWORD *)(a1 + 40));

}

uint64_t __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke(uint64_t a1)
{
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "setShouldAnchorIconViewToRenameTextField:", 0);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_2;
  v3[3] = &unk_24E604D88;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v3, 0, 1.0, 0.25, 0.0, 0.0, 0.0, 0.0);
}

uint64_t __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_3;
  v4[3] = &unk_24E604D88;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __66__WFComposeViewController_navigationItem_didEndRenamingWithTitle___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIconView");
}

void __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "findViewInNavigationBarWithName:", CFSTR("_UINavigationBarTitleRenameTextField"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "setAutocapitalizationType:", WFAutocapitalizationTypeFromLocale());
    objc_msgSend(v7, "reloadInputViews");
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "horizontalSizeClass");

    if (v4 == 2)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 28.0, 0.0);
    else
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 30.0, 0.0);
    objc_msgSend(v7, "setLeftView:", v5);
    objc_msgSend(v7, "setLeftViewMode:", 3);

    v6 = dispatch_time(0, 50000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_2;
    block[3] = &unk_24E604D88;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

  }
  else
  {

  }
}

void __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "findViewInNavigationBarWithName:", CFSTR("UIFieldEditor"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClipsToBounds:", 0);

}

void __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "findViewInNavigationBarWithName:", CFSTR("_UITextFieldRoundedRectBackgroundViewNeue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 10.0);

  objc_msgSend(*(id *)(a1 + 32), "setShouldAnchorIconViewToRenameTextField:", 1);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_3;
  v4[3] = &unk_24E604D88;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v4, 0, 1.0, 0.25, 0.0, 0.0, 0.0, 0.0);

}

uint64_t __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x24BEBDB00];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_4;
  v4[3] = &unk_24E604D88;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __92__WFComposeViewController_navigationItem_willBeginRenamingWithSuggestedTitle_selectedRange___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIconView");
}

void __58__WFComposeViewController_updateBackActionForDocumentMenu__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setBackActionTapped:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "didTapDone");

}

void __52__WFComposeViewController_layoutDocumentMenuControl__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "findViewInView:withName:", *(_QWORD *)(a1 + 40), CFSTR("LPImageView"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "frame");
    v3 = v2;
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    v8 = v7;

    objc_msgSend(*(id *)(a1 + 32), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale();
    v11 = v10;

    objc_msgSend(v12, "setFrame:", v8, v11, v3, v5);
  }

}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_2;
  v5[3] = &unk_24E603FA8;
  v6 = a1[4];
  v7 = v3;
  v8 = a1[5];
  v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v9);

}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_5;
  v5[3] = &unk_24E604E80;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "UIImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "iconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", *(_QWORD *)(a1 + 40), 0);

}

void __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
  objc_msgSend(v2, "setTitle:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setIconProvider:", v3);

  objc_msgSend(*(id *)(a1 + 48), "documentProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setMetadata:", v2);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD568]), "initWithMetadata:", v2);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_3;
    v8[3] = &unk_24E603F80;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    objc_msgSend(v6, "setActivityViewControllerProvider:", v8);
    objc_msgSend(*(id *)(a1 + 48), "setDocumentProperties:", v6);
    objc_destroyWeak(&v9);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "layoutDocumentMenuControl");

}

id __74__WFComposeViewController_setDocumentMenuControlWithTitle_navigationItem___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "shouldShowShareButton"))
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "activityControllerWithFileActivity:sender:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __41__WFComposeViewController_layoutIconView__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "findViewInNavigationBarWithName:", CFSTR("_UINavigationBarTitleRenameTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "resignFirstResponder");
  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "presentationSourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentIconPickerWithSourceItem:", v9);

}

void __41__WFComposeViewController_layoutIconView__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__WFComposeViewController_layoutIconView__block_invoke_3;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.07);

}

void __41__WFComposeViewController_layoutIconView__block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__WFComposeViewController_layoutIconView__block_invoke_5;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.3);

}

void __41__WFComposeViewController_layoutIconView__block_invoke_6(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__WFComposeViewController_layoutIconView__block_invoke_7;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.3);

}

uint64_t __41__WFComposeViewController_layoutIconView__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __41__WFComposeViewController_layoutIconView__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.5);
}

uint64_t __41__WFComposeViewController_layoutIconView__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.5);
}

id __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  id WeakRetained;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id *v38;
  id *v39;
  id *v40;
  id *v41;
  id *v42;
  id *v43;
  id *location;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[2];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v45 = a2;
  v3 = (void *)MEMORY[0x24BEBD388];
  WFLocalizedString(CFSTR("Duplicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("plus.rectangle.on.rectangle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2;
  v69[3] = &unk_24E603EE0;
  v38 = &v70;
  objc_copyWeak(&v70, (id *)(a1 + 32));
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, v5, 0, v69);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD388];
  WFLocalizedString(CFSTR("Choose Icon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("app.dashed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v6;
  v67[1] = 3221225472;
  v67[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_242;
  v67[3] = &unk_24E603EE0;
  v40 = &v68;
  objc_copyWeak(&v68, (id *)(a1 + 32));
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v67);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD388];
  WFLocalizedString(CFSTR("Move"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("folder"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v6;
  v65[1] = 3221225472;
  v65[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2_249;
  v65[3] = &unk_24E603EE0;
  v41 = &v66;
  objc_copyWeak(&v66, (id *)(a1 + 32));
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v65);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD388];
  WFLocalizedString(CFSTR("Add to Home Screen"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("plus.app"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v6;
  v63[1] = 3221225472;
  v63[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3_254;
  v63[3] = &unk_24E603EE0;
  v42 = &v64;
  objc_copyWeak(&v64, (id *)(a1 + 32));
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v63);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BEBD388];
  WFLocalizedString(CFSTR("Export File"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("square.and.arrow.up.on.square"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v6;
  v60[1] = 3221225472;
  v60[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_4;
  v60[3] = &unk_24E603F30;
  v43 = &v61;
  objc_copyWeak(&v61, (id *)(a1 + 32));
  location = &v62;
  objc_copyWeak(&v62, (id *)(a1 + 40));
  objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v60);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v45;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v23;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          objc_msgSend(v24, "children");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v53 != v27)
                  objc_enumerationMutation(v25);
                objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), v38);
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v72, 16);
            }
            while (v26);
          }

        }
        else
        {
          objc_msgSend(v19, "addObject:", v23, v38, v40, v41, v42, v43, location);
        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    }
    while (v20);
  }

  objc_msgSend(v19, "addObject:", v49);
  objc_msgSend(v19, "addObject:", v48);
  objc_msgSend(v19, "addObject:", v50);
  v29 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithTitle:image:identifier:options:children:", &stru_24E605650, 0, 0, 1, v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v30);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v32 = objc_msgSend(WeakRetained, "shouldShowShareButton");

  if (v32)
  {
    v33 = (void *)MEMORY[0x24BEBD748];
    v71[0] = v46;
    v71[1] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "menuWithTitle:image:identifier:options:children:", &stru_24E605650, 0, 0, 1, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "addObject:", v35);
  }
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v29, v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(location);
  objc_destroyWeak(v43);

  objc_destroyWeak(v42);
  objc_destroyWeak(v41);

  objc_destroyWeak(v40);
  objc_destroyWeak(v39);

  return v36;
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "duplicateReference:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v7)
  {
    v9 = objc_loadWeakRetained(v1);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3;
    v11[3] = &unk_24E603EB8;
    objc_copyWeak(&v13, v1);
    v12 = v7;
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v11);

    objc_destroyWeak(&v13);
  }
  else
  {
    getWFEditorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFComposeViewController updateDocumentMenuWithTitle:navigationItem:]_block_invoke_2";
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_ERROR, "%s Unable to duplicate workflow in editor: %@", buf, 0x16u);
    }

  }
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_242(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentIconPickerWithSourceItem:", 0);

}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_2_249(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "moveCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "move:presentingViewController:source:", v7, v8, 10);

}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3_254(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentAddToHomeScreen");

}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD aBlock[4];
  id v39;
  id v40[6];

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "findViewInNavigationBarWithName:", CFSTR("_UINavigationBarTitleControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  if (v4)
  {
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = v8;
  }
  else
  {
    v13 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v13, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_loadWeakRetained(v2);
    if (objc_msgSend(v14, "needsAdditionalSpaceInNavBar"))
      v9 = 100.0;
    else
      v9 = 170.0;
    v11 = 0;
    v10 = 0x4046000000000000;

    v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC5148], "sourceWithView:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPresentationSource:", v16);

  WFLocalizedString(CFSTR("Create iCloud Link"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v17);

  WFLocalizedString(CFSTR("When you export a shortcut file for anyone, Apple will validate a copy of your shortcut using iCloud."));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMessage:", v18);

  v19 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_5;
  aBlock[3] = &unk_24E603F08;
  objc_copyWeak(v40, v2);
  v20 = v4;
  v39 = v20;
  v40[1] = *(id *)&v9;
  v40[2] = (id)v10;
  v40[3] = v11;
  v40[4] = v12;
  v21 = _Block_copy(aBlock);
  v22 = (void *)MEMORY[0x24BE19378];
  v33 = v21;
  WFLocalizedString(CFSTR("Anyone"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v19;
  v36[1] = 3221225472;
  v36[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_6;
  v36[3] = &unk_24E6047E0;
  v24 = v21;
  v37 = v24;
  objc_msgSend(v22, "buttonWithTitle:style:preferred:handler:", v23, 0, 0, v36, v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BE19378];
  WFLocalizedString(CFSTR("People Who Know Me"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v19;
  v34[1] = 3221225472;
  v34[2] = __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_7;
  v34[3] = &unk_24E6047E0;
  v28 = v24;
  v35 = v28;
  objc_msgSend(v26, "buttonWithTitle:style:preferred:handler:", v27, 0, 0, v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addButton:", v25);
  objc_msgSend(v15, "addButton:", v29);
  objc_msgSend(MEMORY[0x24BE19378], "cancelButtonWithHandler:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addButton:", v30);

  v31 = objc_loadWeakRetained(v2);
  WFUserInterfaceFromViewController();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "presentAlert:", v15);

  objc_destroyWeak(v40);
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activityControllerWithFileActivity:sender:", 0, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSelectedMode:", 1);
  objc_msgSend(v8, "setSelectedDestination:", a2);
  objc_msgSend(v8, "_customizationsDidChange");
  objc_msgSend(v8, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanOverlapSourceViewRect:", 1);
  objc_msgSend(v6, "setSourceView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setSourceRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__WFComposeViewController_updateDocumentMenuWithTitle_navigationItem___block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "editorDocumentMenuDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentMenuDidDuplicateWorkflow:", *(_QWORD *)(a1 + 32));

  v8 = objc_alloc_init(MEMORY[0x24BEC3A88]);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActionCount:", objc_msgSend(v6, "count"));

  objc_msgSend(v8, "setShortcutSource:", CFSTR("ShortcutSourceEditorDocumentMenu"));
  objc_msgSend(v8, "track");

}

void __51__WFComposeViewController_shareWorkflowWithSender___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "popoverPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowDirection:", objc_msgSend(v2, "arrowDirection"));

}

uint64_t __38__WFComposeViewController_didTapDone___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishEditing");
}

void __50__WFComposeViewController_updateToolbarVisibility__block_invoke(uint64_t a1)
{
  void *v1;
  int v3;
  CGFloat Height;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;

  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "toolbar");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bounds");
    Height = CGRectGetHeight(v9);
  }
  else
  {
    Height = 0.0;
  }
  CGAffineTransformMakeTranslation(&v7, 0.0, Height);
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  objc_msgSend(v5, "setTransform:", &v6);

  if (v3)
}

uint64_t __48__WFComposeViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIconView");
}

+ (BOOL)canShowInputAction
{
  return 1;
}

@end
