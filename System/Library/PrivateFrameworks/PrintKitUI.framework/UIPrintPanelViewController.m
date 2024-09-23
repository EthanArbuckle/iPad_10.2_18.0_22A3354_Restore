@implementation UIPrintPanelViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (UIPrintPanelViewController)initWithPrintInterationController:(id)a3 inParentController:(id)a4
{
  id v7;
  id v8;
  UIPrintPanelViewController *v9;
  UIPrintPanelViewController *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *lookupPrinterQueue;
  UIPrintPanelNavigationController *v13;
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
  uint64_t v24;
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
  objc_super v42;

  v7 = a3;
  v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)UIPrintPanelViewController;
  v9 = -[UIPrintPanelViewController init](&v42, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_printInteractionController, a3);
    objc_storeWeak((id *)&v10->_parentController, v8);
    -[UIPrintPanelViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 2);
    v11 = dispatch_queue_create("com.apple.UIKit.UIPrintPanelViewController.printerLookup", 0);
    lookupPrinterQueue = v10->_lookupPrinterQueue;
    v10->_lookupPrinterQueue = (OS_dispatch_queue *)v11;

    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = -[UIPrintPanelNavigationController initWithPrintOptionsTableViewController:rootViewController:]([UIPrintPanelNavigationController alloc], "initWithPrintOptionsTableViewController:rootViewController:", 0, v10);
      -[UIPrintPanelViewController setPrintPanelNavigationController:](v10, "setPrintPanelNavigationController:", v13);

      -[UIPrintPanelViewController printPanelNavigationController](v10, "printPanelNavigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAppearanceDelegate:", v10);

      -[UIPrintPanelViewController printPanelNavigationController](v10, "printPanelNavigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDelegate:", v10);

      -[UIPrintPanelViewController printPanelNavigationController](v10, "printPanelNavigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIsAccessibilityElement:", 0);

    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Options"), CFSTR("Options"), CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController setTitle:](v10, "setTitle:", v18);

    objc_msgSend(v7, "_currentPrintInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController setPrintInfo:](v10, "setPrintInfo:", v19);

    -[UIPrintPanelViewController printInteractionController](v10, "printInteractionController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "paper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController printInfo](v10, "printInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPrintPaper:", v21);

    -[UIPrintPanelViewController printInteractionController](v10, "printInteractionController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "_canShowAnnotations");
    -[UIPrintPanelViewController printInfo](v10, "printInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPdfAnnotationsAvailable:", v24);

    -[UIPrintPanelViewController printInteractionController](v10, "printInteractionController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShowsPaperSelectionForLoadedPapers:", 1);

    -[UIPrintPanelViewController printInfo](v10, "printInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:forKeyPath:options:context:", v10, 0x1E9D986F8, 0, 0);

    -[UIPrintPanelViewController printInfo](v10, "printInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:forKeyPath:options:context:", v10, 0x1E9D98678, 0, 0);

    -[UIPrintPanelViewController printInfo](v10, "printInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:forKeyPath:options:context:", v10, 0x1E9D98758, 0, 0);

    -[UIPrintPanelViewController printInfo](v10, "printInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:forKeyPath:options:context:", v10, 0x1E9D98898, 0, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v10, sel_applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

    _UIPrinterInfoCancelRequests();
    -[UIPrintPanelViewController printInteractionController](v10, "printInteractionController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_currentPrintInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "printerID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[UIPrintPanelViewController printInfo](v10, "printInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "currentPrinter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0D80A68];
      objc_msgSend(v7, "_currentPrintInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "printerID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "printerWithName:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "set_internalPrinter:", v40);

    }
    else
    {
      -[UIPrintPanelViewController lookupLastUsedPrinter](v10, "lookupLastUsedPrinter");
    }
  }

  return v10;
}

- (void)dealloc
{
  OS_dispatch_queue *lookupPrinterQueue;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  lookupPrinterQueue = self->_lookupPrinterQueue;
  self->_lookupPrinterQueue = 0;

  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, 0x1E9D98678);

  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, 0x1E9D98758);

  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forKeyPath:", self, 0x1E9D98898);

  -[UIPrintPanelViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:forKeyPath:", self, CFSTR("frame"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  -[UIPrintPanelViewController removeShareablePDFFiles](self, "removeShareablePDFFiles");
  v10.receiver = self;
  v10.super_class = (Class)UIPrintPanelViewController;
  -[UIPrintPanelViewController dealloc](&v10, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v7 = a3;
  if (objc_msgSend(v7, "isEqualToString:", 0x1E9D986F8))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v14[3] = &unk_1E9D96D90;
    v14[4] = self;
    v8 = MEMORY[0x1E0C80D38];
    v9 = v14;
LABEL_9:
    dispatch_async(v8, v9);
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", 0x1E9D98898))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v13[3] = &unk_1E9D96D90;
    v13[4] = self;
    v8 = MEMORY[0x1E0C80D38];
    v9 = v13;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", 0x1E9D98758))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v12[3] = &unk_1E9D96D90;
    v12[4] = self;
    v8 = MEMORY[0x1E0C80D38];
    v9 = v12;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", 0x1E9D98678))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
    v11[3] = &unk_1E9D96D90;
    v11[4] = self;
    v8 = MEMORY[0x1E0C80D38];
    v9 = v11;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("frame")))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("UIPrintPanelDidChangeSizeNotification"), self, 0);

  }
LABEL_10:

}

void __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "printInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPrinter:", v2);

}

uint64_t __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePreviewLayoutConstraints");
}

uint64_t __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePageRange");
}

void __77__UIPrintPanelViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "printOptionsTableViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updatePrintSectionList");

}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIPrintOptionsTableViewController *v13;
  void *v14;
  void *v15;
  UIPrintOptionsTableViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  UIPrintPanelNavigationController *v20;
  void *v21;
  UIPrintPanelNavigationController *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
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
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  UIPrintPreviewViewController *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  _QWORD v129[9];
  _QWORD v130[9];
  _QWORD v131[5];

  v131[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[UIPrintPanelViewController setView:](self, "setView:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 2, v4, v5, v6, v7);
  -[UIPrintPanelViewController setPrintOptionsTableView:](self, "setPrintOptionsTableView:", v10);

  -[UIPrintPanelViewController printOptionsTableView](self, "printOptionsTableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIPrintPanelViewController printOptionsTableView](self, "printOptionsTableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEstimatedSectionHeaderHeight:", 8.0);

  v13 = [UIPrintOptionsTableViewController alloc];
  -[UIPrintPanelViewController printOptionsTableView](self, "printOptionsTableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UIPrintOptionsTableViewController initWithTableView:printInfo:printPanelViewController:](v13, "initWithTableView:printInfo:printPanelViewController:", v14, v15, self);
  -[UIPrintPanelViewController setPrintOptionsTableViewController:](self, "setPrintOptionsTableViewController:", v16);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Options"), CFSTR("Options"), CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v18);

  v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F20]), "initWithNibName:bundle:", 0, 0);
  v20 = [UIPrintPanelNavigationController alloc];
  -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[UIPrintPanelNavigationController initWithPrintOptionsTableViewController:rootViewController:](v20, "initWithPrintOptionsTableViewController:rootViewController:", v21, v126);
  -[UIPrintPanelViewController setPrintOptionsNavController:](self, "setPrintOptionsNavController:", v22);

  v23 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v23, "configureWithTransparentBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v24);

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v23;
  objc_msgSend(v23, "setShadowColor:", v25);

  -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "navigationBar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setStandardAppearance:", v23);

  v28 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setShadowColor:", v29);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = v28;
  objc_msgSend(v28, "setBackgroundColor:", v30);

  -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "navigationBar");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setScrollEdgeAppearance:", v28);

  -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIPrintPanelViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  objc_msgSend(v35, "addSubview:", v34);

  -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController addChildViewController:](self, "addChildViewController:", v37);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "scale");
  v40 = v39;

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v40, v40);
  -[UIPrintPanelViewController setPreviewSeparatorView:](self, "setPreviewSeparatorView:", v41);

  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBackgroundColor:", v43);

  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v45);

  v46 = -[UIPrintPreviewViewController initWithScrollDirection:printPanelViewController:]([UIPrintPreviewViewController alloc], "initWithScrollDirection:printPanelViewController:", -[UIPrintPanelViewController showingVerticalPreview](self, "showingVerticalPreview") ^ 1, self);
  -[UIPrintPanelViewController setPreviewViewController:](self, "setPreviewViewController:", v46);

  -[UIPrintPanelViewController previewViewController](self, "previewViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController setPreviewPanelView:](self, "setPreviewPanelView:", v48);

  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setBackgroundColor:", v50);

  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v52);

  -[UIPrintPanelViewController previewViewController](self, "previewViewController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController addChildViewController:](self, "addChildViewController:", v53);

  v54 = (void *)MEMORY[0x1E0CB3718];
  v127 = v36;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 3, 0, v8, 3, 1.0, 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v55;
  v128 = v8;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v36, 6, 0, v8, 6, 1.0, 0.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v131[1] = v56;
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v131[2] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "activateConstraints:", v62);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v127, 7, 0, 0, 0, 1.0, 333.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController setPrintOptionsWidthConstraint:](self, "setPrintOptionsWidthConstraint:", v63);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v127, 4, 0, v128, 4, 1.0, 0.0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v122;
  v64 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v120, 4, 0, v128, 4, 1.0, 0.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v130[1] = v118;
  v65 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v116, 3, 0, v128, 3, 1.0, 0.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v130[2] = v114;
  v66 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v112, 6, 0, v127, 5, 1.0, 0.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v130[3] = v110;
  v67 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v108, 3, 0, v106, 3, 1.0, 0.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v130[4] = v104;
  v68 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v102, 4, 0, v69, 4, 1.0, 0.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v130[5] = v70;
  v71 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v72, 5, 0, v73, 6, 1.0, 0.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v130[6] = v74;
  v75 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v76, 7, 0, 0, 0, 1.0, 1.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v130[7] = v77;
  -[UIPrintPanelViewController printOptionsWidthConstraint](self, "printOptionsWidthConstraint");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v130[8] = v78;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 9);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController setVertScrollPrintPanelConstraints:](self, "setVertScrollPrintPanelConstraints:", v79);

  v80 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v81, 8, 0, 0, 0, 1.0, 250.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController setPreviewHeightConstraint:](self, "setPreviewHeightConstraint:", v82);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v127, 5, 0, v128, 5, 1.0, 0.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v123;
  v83 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v121, 4, 0, v128, 16, 1.0, 0.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v119;
  v84 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v127, 4, 0, v117, 3, 1.0, 0.0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v129[2] = v115;
  v85 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v113, 6, 0, v128, 6, 1.0, 0.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v129[3] = v111;
  v86 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v109, 5, 0, v107, 5, 1.0, 0.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v129[4] = v105;
  v87 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v103, 6, 0, v88, 6, 1.0, 0.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v129[5] = v89;
  v90 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController previewPanelView](self, "previewPanelView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 4, 0, v92, 3, 1.0, 0.0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v129[6] = v93;
  v94 = (void *)MEMORY[0x1E0CB3718];
  -[UIPrintPanelViewController previewSeparatorView](self, "previewSeparatorView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v95, 8, 0, 0, 0, 1.0, 1.0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v129[7] = v96;
  -[UIPrintPanelViewController previewHeightConstraint](self, "previewHeightConstraint");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v129[8] = v97;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 9);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController setHorizScrollPrintPanelConstraints:](self, "setHorizScrollPrintPanelConstraints:", v98);

  -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "pushViewController:animated:", v100, 0);

  -[UIPrintPanelViewController view](self, "view");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "addObserver:forKeyPath:options:context:", self, CFSTR("frame"), 0, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPrintPanelViewController;
  -[UIPrintPanelViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[UIPrintPanelViewController parentController](self, "parentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "setNavigationBarHidden:", 1);
  }
  else
  {
    -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNavigationBarHidden:", 1);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIPrintPanelViewController;
  -[UIPrintPanelViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[UIPrintPanelViewController parentController](self, "parentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setNavigationBarHidden:", 0);
  }
  -[UIPrintPanelViewController previewViewController](self, "previewViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[UIPrintPanelViewController previewViewController](self, "previewViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "presentingDocumentInteractionController"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    -[UIPrintPanelViewController printPanelDidDisappear](self, "printPanelDidDisappear");
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3;

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updatePageCount");

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[UIPrintPanelViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1 << objc_msgSend(v5, "interfaceOrientation");

  return v6;
}

- (BOOL)showingVerticalPreview
{
  void *v2;
  double v3;
  BOOL v4;

  -[UIPrintPanelViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3 > 500.0;

  return v4;
}

- (void)updatePreviewLayoutConstraints
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v3 = -[UIPrintPanelViewController showingVerticalPreview](self, "showingVerticalPreview");
  -[UIPrintPanelViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  if (v3)
  {
    v7 = v5 * 0.6667;

    v8 = 333.0;
    if (v7 >= 333.0)
      v8 = v7;
    v9 = v8;
    v10 = floorf(v9);
    -[UIPrintPanelViewController printOptionsWidthConstraint](self, "printOptionsWidthConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstant:", v10);
  }
  else
  {
    v11 = v6 * 0.3333;
    v12 = floorf(v11);
    -[UIPrintPanelViewController previewViewController](self, "previewViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "headerHeight");
    v15 = v14 + v12;
    -[UIPrintPanelViewController previewHeightConstraint](self, "previewHeightConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", v15);

  }
  if (-[UIPrintPanelViewController showingVerticalPreview](self, "showingVerticalPreview"))
  {
    -[UIPrintPanelViewController vertScrollPrintPanelConstraints](self, "vertScrollPrintPanelConstraints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isActive");

    if ((v19 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrintPanelViewController horizScrollPrintPanelConstraints](self, "horizScrollPrintPanelConstraints");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deactivateConstraints:", v24);

      v25 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrintPanelViewController vertScrollPrintPanelConstraints](self, "vertScrollPrintPanelConstraints");
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v29 = (id)v26;
      objc_msgSend(v25, "activateConstraints:");

      return;
    }
  }
  if (!-[UIPrintPanelViewController showingVerticalPreview](self, "showingVerticalPreview"))
  {
    -[UIPrintPanelViewController horizScrollPrintPanelConstraints](self, "horizScrollPrintPanelConstraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isActive");

    if ((v22 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrintPanelViewController vertScrollPrintPanelConstraints](self, "vertScrollPrintPanelConstraints");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deactivateConstraints:", v28);

      v25 = (void *)MEMORY[0x1E0CB3718];
      -[UIPrintPanelViewController horizScrollPrintPanelConstraints](self, "horizScrollPrintPanelConstraints");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrintPanelViewController;
  -[UIPrintPanelViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[UIPrintPanelViewController updatePreviewLayoutConstraints](self, "updatePreviewLayoutConstraints");
}

- (void)viewWillLayoutSubviews
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPrintPanelViewController;
  -[UIPrintPanelViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  v3 = -[UIPrintPanelViewController showingVerticalPreview](self, "showingVerticalPreview");
  -[UIPrintPanelViewController previewViewController](self, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollDirection:", !v3);

  -[UIPrintPanelViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)updatePageRange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[UIPrintPanelViewController shouldShowPageRange](self, "shouldShowPageRange"))
  {
    -[UIPrintPanelViewController printInfo](self, "printInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageRanges");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");
    -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPageRanges:", v4);

  }
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_cancelButtonPressed_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("."), 0x100000, sel_cancelButtonPressed_, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_printButtonPressed_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)backButtonPressed:(id)a3
{
  id v3;
  id v4;

  -[UIPrintPanelViewController parentController](self, "parentController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);
  }

}

- (void)printButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[UIPrintPanelViewController printInfo](self, "printInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canDismissPrintOptions");

    if (v7)
      -[UIPrintPanelViewController startPrinting](self, "startPrinting");
  }
}

- (void)dismissKeyboard
{
  id v2;

  -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissKeyboard");

}

- (void)resetPreviewPages
{
  id v2;

  -[UIPrintPanelViewController previewViewController](self, "previewViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAllPages");

}

- (void)showGeneratingPDFProgressPanel
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
  _QWORD v18[5];

  if (-[UIPrintPanelViewController quickLookPDFGenerationInProgress](self, "quickLookPDFGenerationInProgress"))
  {
    if (!-[UIPrintPanelViewController quickLookPDFGenerationCancelled](self, "quickLookPDFGenerationCancelled"))
    {
      v3 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Creating PDF"), CFSTR("Creating PDF"), CFSTR("Localizable"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, CFSTR("\n"), 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPanelViewController setPdfCreationProgressController:](self, "setPdfCreationProgressController:", v6);

      -[UIPrintPanelViewController pdfCreationProgressController](self, "pdfCreationProgressController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PRINT_INTERACTION_CANCEL_BUTTON"), CFSTR("Cancel"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __60__UIPrintPanelViewController_showGeneratingPDFProgressPanel__block_invoke;
      v18[3] = &unk_1E9D97920;
      v18[4] = self;
      objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 1, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAction:", v11);

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v12, "startAnimating");
      -[UIPrintPanelViewController pdfCreationProgressController](self, "pdfCreationProgressController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "addSubview:", v12);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 9, 0, v14, 9, 1.0, 0.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addConstraint:", v15);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 10, 0, v14, 10, 1.0, 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addConstraint:", v16);

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[UIPrintPanelViewController setProgressPresentationTime:](self, "setProgressPresentationTime:");
      -[UIPrintPanelViewController pdfCreationProgressController](self, "pdfCreationProgressController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPanelViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

    }
  }
}

uint64_t __60__UIPrintPanelViewController_showGeneratingPDFProgressPanel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelQuickLookPDFGeneration");
}

- (void)showSharePanelForPDFURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, int);
  void *v29;
  id v30;
  id location[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIPrintPanelViewController createShareablePDFFileURL:](self, "createShareablePDFFileURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2050000000;
    v6 = (void *)getUIActivityViewControllerClass_softClass;
    v35 = getUIActivityViewControllerClass_softClass;
    v7 = MEMORY[0x1E0C809B0];
    if (!getUIActivityViewControllerClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getUIActivityViewControllerClass_block_invoke;
      location[3] = &unk_1E9D97240;
      location[4] = &v32;
      __getUIActivityViewControllerClass_block_invoke((uint64_t)location);
      v6 = (void *)v33[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v32, 8);
    v9 = [v8 alloc];
    v36[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithActivityItems:applicationActivities:", v10, 0);
    -[UIPrintPanelViewController setActivityViewController:](self, "setActivityViewController:", v11);

    -[UIPrintPanelViewController activityViewController](self, "activityViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController printInfo](self, "printInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "jobName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v14, CFSTR("subject"));

    -[UIPrintPanelViewController activityViewController](self, "activityViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExcludedActivityTypes:", &unk_1E9DB0840);

    -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isContentManaged");
    -[UIPrintPanelViewController activityViewController](self, "activityViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIsContentManaged:", v17);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v19, "userInterfaceIdiom") == 0;

    if ((v17 & 1) == 0)
    {
      -[UIPrintPanelViewController activityViewController](self, "activityViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setModalPresentationStyle:", 7);

      -[UIPrintPanelViewController activityViewController](self, "activityViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "popoverPresentationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPrintPanelViewController shareButton](self, "shareButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBarButtonItem:", v23);

      objc_msgSend(v22, "setPermittedArrowDirections:", 1);
    }
    objc_initWeak(location, self);
    -[UIPrintPanelViewController activityViewController](self, "activityViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    v27 = 3221225472;
    v28 = __54__UIPrintPanelViewController_showSharePanelForPDFURL___block_invoke;
    v29 = &unk_1E9D97730;
    objc_copyWeak(&v30, location);
    objc_msgSend(v24, "setCompletionWithItemsHandler:", &v26);

    -[UIPrintPanelViewController activityViewController](self, "activityViewController", v26, v27, v28, v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);

    objc_destroyWeak(&v30);
    objc_destroyWeak(location);
  }

}

void __54__UIPrintPanelViewController_showSharePanelForPDFURL___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setActivityViewController:", 0);
  if (a3)
    objc_msgSend(WeakRetained, "dismissPrintPanelWithAction:animated:completionHandler:", 2, 1, 0);

}

- (void)shareButtonPress:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  v4 = a3;
  -[UIPrintPanelViewController dismissKeyboard](self, "dismissKeyboard");
  -[UIPrintPanelViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showGeneratingPDFProgressPanel, 0, 0.5);
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__UIPrintPanelViewController_shareButtonPress___block_invoke;
  v5[3] = &unk_1E9D97708;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  -[UIPrintPanelViewController generateQuickLookPDFWithCompletionHandler:](self, "generateQuickLookPDFWithCompletionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __47__UIPrintPanelViewController_shareButtonPress___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a2;
  v6 = v5;
  if (a3)
  {

    v6 = 0;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__UIPrintPanelViewController_shareButtonPress___block_invoke_2;
  v8[3] = &unk_1E9D97948;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v11 = a3;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v10);
}

void __47__UIPrintPanelViewController_shareButtonPress___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pdfCreationProgressController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "progressPresentationTime");
    v6 = v4 - v5;
    if (v6 >= 1.0)
      objc_msgSend(WeakRetained, "hideGeneratingPDFProgress:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", sel_hideGeneratingPDFProgress_, *(_QWORD *)(a1 + 40), 1.0 - v6);
    goto LABEL_8;
  }
  v7 = WeakRetained;
  if (*(_QWORD *)(a1 + 40) && !*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "showSharePanelForPDFURL:");
LABEL_8:
    v7 = WeakRetained;
  }

}

- (void)hideGeneratingPDFProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UIPrintPanelViewController pdfCreationProgressController](self, "pdfCreationProgressController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__UIPrintPanelViewController_hideGeneratingPDFProgress___block_invoke;
  v7[3] = &unk_1E9D96E78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

uint64_t __56__UIPrintPanelViewController_hideGeneratingPDFProgress___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setPdfCreationProgressController:", 0);
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "showSharePanelForPDFURL:");
  return result;
}

- (void)addPrintShareButtonsToNavItem:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (objc_class *)MEMORY[0x1E0DC34F0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Print[Button]"), CFSTR("Print"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 2, self, sel_printButtonPressed_);

  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentPrinter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", v10 != 0);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_shareButtonPress_);
  -[UIPrintPanelViewController setShareButton:](self, "setShareButton:", v11);

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "preventPDFCreation") ^ 1;
  -[UIPrintPanelViewController shareButton](self, "shareButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEnabled:", v13);

  v15 = (void *)MEMORY[0x1E0C99D20];
  -[UIPrintPanelViewController shareButton](self, "shareButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithObjects:", v18, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItems:", v17);

}

- (void)addCanelButtonToNavItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[UIPrintPanelViewController parentController](self, "parentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "viewControllers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v5, "count") < 2)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v5, "count") - 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[UIPrintPanelViewController printOptionsWidthConstraint](self, "printOptionsWidthConstraint");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "constant");
          v10 = v9;

          v11 = v7;
          if (v10 > 433.0)
            goto LABEL_10;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("Back"), CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v11, 0, self, sel_backButtonPressed_);
      objc_msgSend(v15, "setLeftBarButtonItem:", v13);

      objc_msgSend(v15, "leftBarButtonItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_setShowsBackButtonIndicator:", 1);

      goto LABEL_11;
    }
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed_);
  objc_msgSend(v15, "setLeftBarButtonItem:", v11);
LABEL_11:

}

- (void)setPrinter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int State;
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
  _QWORD v26[5];
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  objc_msgSend(v4, "_internalPrinter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIPrinterInfoCancelRequest(v5);
  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrinter:", v5);

  -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentPrinter:", v4);

  -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    objc_msgSend(v8, "setShowContactingPrinter:", 1);

    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v33 = v5;
    v10 = (void *)v29[5];
    v11 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __41__UIPrintPanelViewController_setPrinter___block_invoke;
    v27[3] = &unk_1E9D97970;
    v27[4] = self;
    v27[5] = &v28;
    _UIPrintInfoPrinterLookup(v10, v27);
    -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowingGatheringPrinterInfo:", 1);

    objc_msgSend(v4, "_internalPrinter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __41__UIPrintPanelViewController_setPrinter___block_invoke_2;
    v26[3] = &unk_1E9D96F90;
    v26[4] = self;
    State = _UIPrinterInfoGetState(v13, v26);

    if (State)
    {
      -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShowingGatheringPrinterInfo:", 0);
      if (State == 1)
      {

        objc_msgSend(v4, "_internalPrinter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "printInfoSupported");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintPanelViewController printInfo](self, "printInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "currentPrinter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPrinterInfoDict:", v17);

        -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "paper");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintPanelViewController printInfo](self, "printInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setPrintPaper:", v20);

      }
    }
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    objc_msgSend(v8, "setShowContactingPrinter:", 0);

  }
  -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rightBarButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setEnabled:", v4 != 0);

}

void __41__UIPrintPanelViewController_setPrinter___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPrinter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_internalPrinter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    v8 = *(void **)(a1 + 32);
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "printOptionsTableViewController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShowContactingPrinter:", 0);

    }
    else
    {
      objc_msgSend(v8, "printInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCurrentPrinter:", 0);

      objc_msgSend(*(id *)(a1 + 32), "setLastUsedPrinterIndex:", 0);
      objc_msgSend(*(id *)(a1 + 32), "lookupLastUsedPrinter");
    }
  }
}

void __41__UIPrintPanelViewController_setPrinter___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "printOptionsTableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowingGatheringPrinterInfo:", 0);

  objc_msgSend(*(id *)(a1 + 32), "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2 == 2)
  {
    objc_msgSend(v6, "setCurrentPrinter:", 0);
  }
  else
  {
    objc_msgSend(v6, "currentPrinter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrinterInfoDict:", v11);

    objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updatePrintPaper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrintPaper:", v9);

  }
}

- (void)lookupLastUsedPrinter
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *lookupPrinterQueue;
  _QWORD block[5];

  -[UIPrintPanelViewController lastUsedPrinterArray](self, "lastUsedPrinterArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D80A50], "lastUsedPrinters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController setLastUsedPrinterArray:](self, "setLastUsedPrinterArray:", v4);

  }
  if (-[UIPrintPanelViewController lastUsedPrinterIndex](self, "lastUsedPrinterIndex") <= 2)
  {
    -[UIPrintPanelViewController lastUsedPrinterArray](self, "lastUsedPrinterArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = -[UIPrintPanelViewController lastUsedPrinterIndex](self, "lastUsedPrinterIndex");

    if (v6 > v7)
    {
      lookupPrinterQueue = self->_lookupPrinterQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke;
      block[3] = &unk_1E9D96D90;
      block[4] = self;
      dispatch_async(lookupPrinterQueue, block);
    }
  }
}

void __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "lastUsedPrinterArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "lastUsedPrinterIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D80BD8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D80A98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80A68], "printerWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_2;
    v9[3] = &unk_1E9D979C0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    v11 = v4;
    v12 = v5;
    _UIPrintInfoPrinterLookup(v8, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastUsedPrinterIndex:", objc_msgSend(*(id *)(a1 + 32), "lastUsedPrinterIndex") + 1);
    objc_msgSend(*(id *)(a1 + 32), "lookupLastUsedPrinter");
  }

}

void __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "printInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentPrinter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = -[UIPrinter _initWithPrinter:]([UIPrinter alloc], "_initWithPrinter:", *(_QWORD *)(a1 + 40));
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_3;
      v7[3] = &unk_1E9D97998;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v5;
      v9 = *(id *)(a1 + 48);
      v10 = *(id *)(a1 + 56);
      v6 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLastUsedPrinterIndex:", objc_msgSend(*(id *)(a1 + 32), "lastUsedPrinterIndex") + 1);
    objc_msgSend(*(id *)(a1 + 32), "lookupLastUsedPrinter");
  }
}

void __51__UIPrintPanelViewController_lookupLastUsedPrinter__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentPrinter:", v2);

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrinterID:", v4);

  v6 = *(void **)(a1 + 56);
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D80AA0]) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", *MEMORY[0x1E0D80AB0]))
    {
      objc_msgSend(*(id *)(a1 + 32), "printInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "duplex");

      if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "printInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9;
        v10 = 1;
        goto LABEL_9;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", *MEMORY[0x1E0D80AA8]))
    {
      objc_msgSend(*(id *)(a1 + 32), "printInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v10 = 0;
LABEL_9:
      objc_msgSend(v9, "setDuplex:", v10);

    }
  }
}

- (void)printNavigationConrollerDidDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (!-[UIPrintPanelViewController dismissed](self, "dismissed"))
  {
    -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_printPanelWillDismissWithAction:", 0);

    -[UIPrintPanelViewController setDismissed:](self, "setDismissed:", 1);
    _UIPrinterInfoCancelRequests();
    -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      -[UIPrintPanelViewController printOptionsNavController](self, "printOptionsNavController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintPanelViewController printOptionsTableViewController](self, "printOptionsTableViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v7, "popToViewController:animated:", v8, 0);

    }
    -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

    }
    -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_printPanelDidDismissWithAction:", 0);

    -[UIPrintPanelViewController setPrintPanelNavigationController:](self, "setPrintPanelNavigationController:", 0);
  }
}

- (void)printPanelDidDisappear
{
  void *v3;
  void *v4;
  id v5;
  UIPrintPanelViewController *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  if (!-[UIPrintPanelViewController dismissed](self, "dismissed"))
  {
    -[UIPrintPanelViewController parentController](self, "parentController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v10 = v3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v10;
      else
        v4 = 0;
      v5 = v4;
      objc_msgSend(v5, "topViewController");
      v6 = (UIPrintPanelViewController *)objc_claimAutoreleasedReturnValue();

      if (v6 == self)
      {
        -[UIPrintPanelViewController dismissPrintPanelWithAction:animated:completionHandler:](self, "dismissPrintPanelWithAction:animated:completionHandler:", 0, 0, 0);
      }
      else
      {
        objc_msgSend(v5, "viewControllers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "containsObject:", v8);

        if ((v9 & 1) == 0)
          -[UIPrintPanelViewController printNavigationConrollerDidDismiss](self, "printNavigationConrollerDidDismiss");
      }

      v3 = v10;
    }

  }
}

- (BOOL)shouldShowPageRange
{
  void *v2;
  char v3;

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canShowPageRange");

  return v3;
}

- (BOOL)shouldShowDuplex
{
  void *v2;
  char v3;

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canShowDuplex");

  return v3;
}

- (BOOL)shouldShowOrientation
{
  void *v2;
  char v3;

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canShowOrientation");

  return v3;
}

- (BOOL)shouldShowScaling
{
  void *v2;
  char v3;

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canShowScaling");

  return v3;
}

- (BOOL)shouldShowLayout
{
  void *v2;
  char v3;

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canShowLayout");

  return v3;
}

- (void)startPrinting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentPrinter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_printerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_currentPrintInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrinterID:", v5);

  -[UIPrintPanelViewController dismissPrintPanelWithAction:animated:completionHandler:](self, "dismissPrintPanelWithAction:animated:completionHandler:", 1, 1, 0);
}

- (void)cancelPrinting
{
  -[UIPrintPanelViewController dismissPrintPanelWithAction:animated:completionHandler:](self, "dismissPrintPanelWithAction:animated:completionHandler:", 0, 1, 0);
}

- (CGSize)preferredSizeForScene:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  objc_msgSend(a3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = v6 * 0.66667;
  v10 = floorf(v9);
  -[UIPrintPanelViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  if (v13 >= v8)
    v14 = v13;
  else
    v14 = v8;
  v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)_presentInParentAnimated:(BOOL)a3 hostingScene:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[5];

  v4 = a3;
  v6 = a4;
  -[UIPrintPanelViewController parentController](self, "parentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke;
  v21[3] = &unk_1E9D96D90;
  v21[4] = self;
  v9 = (void *)MEMORY[0x1D82A9A48](v21);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIPrintPanelViewController parentController](self, "parentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:", v12, v13);

    objc_msgSend(v7, "pushViewController:animated:", self, v4);
    -[UIPrintPanelViewController transitionCoordinator](self, "transitionCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    v17 = 3221225472;
    v18 = __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke_2;
    v19 = &unk_1E9D979E8;
    v20 = v9;
    v15 = (void *)MEMORY[0x1D82A9A48](&v16);
    objc_msgSend(v14, "animateAlongsideTransition:completion:", &__block_literal_global_4, v15, v16, v17, v18, v19);

  }
  else
  {
    -[UIPrintPanelViewController preferredSizeForScene:](self, "preferredSizeForScene:", v6);
    -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v7, "presentViewController:withTransition:completion:", v14, 3, v9);
    else
      objc_msgSend(v7, "presentViewController:animated:completion:", v14, 0, v9);
  }

}

void __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_printPanelDidPresent");

}

uint64_t __68__UIPrintPanelViewController__presentInParentAnimated_hostingScene___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentPrintPanelAnimated:(BOOL)a3 hostingScene:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  UIPrintPanelWindow *v16;
  double v17;
  void *v18;
  id v19;
  id v20;
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
  _QWORD v31[5];
  _QWORD v32[5];

  v4 = a3;
  v6 = a4;
  -[UIPrintPanelViewController parentController](self, "parentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[UIPrintPanelViewController preferredSizeForScene:](self, "preferredSizeForScene:", v6);
    -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(v12, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

      if (v15)
      {
        v16 = -[UIPrintPanelWindow initWithWindowScene:]([UIPrintPanelWindow alloc], "initWithWindowScene:", v6);
        -[UIPrintPanelViewController setPrintPanelWindow:](self, "setPrintPanelWindow:", v16);

        v17 = *MEMORY[0x1E0DC49F0];
        -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setWindowLevel:", v17);

        v19 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
        v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
        -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "frame");
        v22 = (void *)objc_msgSend(v20, "initWithFrame:");

        objc_msgSend(v19, "setView:", v22);
        -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRootViewController:", v19);

        -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addSubview:", v22);

        -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "makeKeyAndVisible");

        -[UIPrintPanelViewController setAnimated:](self, "setAnimated:", v4);
        -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke;
        v32[3] = &unk_1E9D96D90;
        v32[4] = self;
        objc_msgSend(v19, "presentViewController:withTransition:completion:", v26, 3, v32);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "keyWindow");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rootViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "presentedViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      do
      {
        objc_msgSend(v28, "presentedViewController");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "presentedViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v19;
      }
      while (v30);
    }
    else
    {
      v19 = v28;
    }
    -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke_2;
    v31[3] = &unk_1E9D96D90;
    v31[4] = self;
    objc_msgSend(v19, "presentViewController:animated:completion:", v22, v4, v31);
    goto LABEL_12;
  }
  -[UIPrintPanelViewController parentController](self, "parentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  -[UIPrintPanelViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v11);

  -[UIPrintPanelViewController _presentInParentAnimated:hostingScene:](self, "_presentInParentAnimated:hostingScene:", v4, v6);
LABEL_13:

}

void __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_printPanelDidPresent");

}

void __69__UIPrintPanelViewController_presentPrintPanelAnimated_hostingScene___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_printPanelDidPresent");

}

- (void)presentPrintPanelFromRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = a4;
  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hostingWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_canPreviewContent");

  if (v14)
  {
    -[UIPrintPanelViewController presentPrintPanelAnimated:hostingScene:](self, "presentPrintPanelAnimated:hostingScene:", v5, v12);
  }
  else
  {
    -[UIPrintPanelViewController parentController](self, "parentController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[UIPrintPanelViewController _presentInParentAnimated:hostingScene:](self, "_presentInParentAnimated:hostingScene:", v5, v12);
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x1E0DC3B48]);
      -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithContentViewController:", v17);
      -[UIPrintPanelViewController setPoverController:](self, "setPoverController:", v18);

      -[UIPrintPanelViewController poverController](self, "poverController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDelegate:", self);

      -[UIPrintPanelViewController poverController](self, "poverController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v23, 15, v5, x, y, width, height);

      -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v5)
        objc_msgSend(v21, "performSelector:withObject:afterDelay:", sel__printPanelDidPresent, 0, 0.35);
      else
        objc_msgSend(v21, "_printPanelDidPresent");

    }
  }

}

- (void)presentPrintPanelFromBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v18 = a3;
  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostingWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_canPreviewContent");

  if (v9)
  {
    -[UIPrintPanelViewController presentPrintPanelAnimated:hostingScene:](self, "presentPrintPanelAnimated:hostingScene:", v4, v7);
  }
  else
  {
    -[UIPrintPanelViewController parentController](self, "parentController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIPrintPanelViewController _presentInParentAnimated:hostingScene:](self, "_presentInParentAnimated:hostingScene:", v4, v7);
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0DC3B48]);
      -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithContentViewController:", v12);
      -[UIPrintPanelViewController setPoverController:](self, "setPoverController:", v13);

      -[UIPrintPanelViewController poverController](self, "poverController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDelegate:", self);

      -[UIPrintPanelViewController poverController](self, "poverController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentPopoverFromBarButtonItem:permittedArrowDirections:animated:", v18, 15, v4);

      -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v4)
        objc_msgSend(v16, "performSelector:withObject:afterDelay:", sel__printPanelDidPresent, 0, 0.35);
      else
        objc_msgSend(v16, "_printPanelDidPresent");

    }
  }

}

- (void)dismissPrintPanelWithAction:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void (**v29)(_QWORD);
  id v30;
  _QWORD v31[5];
  void (**v32)(_QWORD);
  int64_t v33;
  _QWORD v34[5];
  void (**v35)(_QWORD);
  int64_t v36;
  _QWORD v37[5];
  void (**v38)(_QWORD);
  int64_t v39;

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_printPanelWillDismissWithAction:", a3);

  -[UIPrintPanelViewController setDismissed:](self, "setDismissed:", 1);
  _UIPrinterInfoCancelRequests();
  -[UIPrintPanelViewController parentController](self, "parentController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIPrintPanelViewController parentController](self, "parentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "printActivityDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "shouldDismissParentViewController:", v14);

LABEL_22:
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_3;
        v31[3] = &unk_1E9D97A30;
        v31[4] = self;
        v33 = a3;
        v32 = v8;
        v29 = (void (**)(_QWORD))MEMORY[0x1D82A9A48](v31);
        if (v15)
        {
          objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v5, v29);
        }
        else
        {
          v30 = (id)objc_msgSend(v11, "popViewControllerAnimated:", v5);
          v29[2](v29);
        }

        goto LABEL_26;
      }
      objc_msgSend(v11, "_popoverController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {

LABEL_21:
        v15 = 0;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "userInterfaceIdiom");

      if (!v28)
        goto LABEL_21;
    }
    v15 = 1;
    goto LABEL_22;
  }
  -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPrintPanelViewController printPanelWindow](self, "printPanelWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {

    if (v18)
    {
      if (v5)
        v19 = 7;
      else
        v19 = 0;
      -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentingViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke;
      v37[3] = &unk_1E9D97A30;
      v37[4] = self;
      v39 = a3;
      v38 = v8;
      objc_msgSend(v21, "dismissViewControllerWithTransition:completion:", v19, v37);

      v22 = v38;
    }
    else
    {
      -[UIPrintPanelViewController printPanelNavigationController](self, "printPanelNavigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentingViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_2;
      v34[3] = &unk_1E9D97A30;
      v34[4] = self;
      v36 = a3;
      v35 = v8;
      objc_msgSend(v26, "dismissViewControllerAnimated:completion:", v5, v34);

      v22 = v35;
    }

  }
  else
  {
    objc_msgSend(v17, "setHidden:", 1);

    -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_printPanelDidDismissWithAction:", a3);

    if (v8)
      v8[2](v8);
    -[UIPrintPanelViewController setPrintInteractionController:](self, "setPrintInteractionController:", 0);
  }
LABEL_26:

}

uint64_t __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "printPanelWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_printPanelDidDismissWithAction:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setPrintPanelNavigationController:", 0);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setPrintInteractionController:", 0);
}

uint64_t __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_printPanelDidDismissWithAction:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setPrintPanelNavigationController:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setPrintInteractionController:", 0);
}

uint64_t __85__UIPrintPanelViewController_dismissPrintPanelWithAction_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "printInteractionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_printPanelDidDismissWithAction:", *(_QWORD *)(a1 + 48));

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setPrintInteractionController:", 0);
}

- (void)dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  -[UIPrintPanelViewController dismissPrintPanelWithAction:animated:completionHandler:](self, "dismissPrintPanelWithAction:animated:completionHandler:", 0, a3, a4);
}

- (void)generateQuickLookPDFWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (!-[UIPrintPanelViewController quickLookPDFGenerationInProgress](self, "quickLookPDFGenerationInProgress"))
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E9D973A8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    v5 = (void *)MEMORY[0x1D82A9A48](v7);
    -[UIPrintPanelViewController setQuickLookPDFGenerationInProgress:](self, "setQuickLookPDFGenerationInProgress:", 1);
    -[UIPrintPanelViewController setQuickLookPDFGenerationCancelled:](self, "setQuickLookPDFGenerationCancelled:", 0);
    -[UIPrintPanelViewController previewViewController](self, "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performThumbnailDispatchBlock:", v5);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, char);
  void *v13;
  id v14;
  NSObject *v15;

  v2 = dispatch_semaphore_create(0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "quickLookPDFGenerationCancelled") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "printInteractionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cancelAllPreviewGeneration");

    objc_msgSend(WeakRetained, "printInteractionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke_2;
    v13 = &unk_1E9D97A58;
    v14 = WeakRetained;
    v6 = v2;
    v15 = v6;
    objc_msgSend(v5, "_generatePDFWithCompletionHandler:", &v10);

    v7 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v6, v7);
    objc_msgSend(WeakRetained, "setQuickLookPDFGenerationInProgress:", 0, v10, v11, v12, v13, v14);
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      objc_msgSend(WeakRetained, "quickLookPDFURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, objc_msgSend(WeakRetained, "quickLookPDFGenerationCancelled"));

    }
  }

}

void __72__UIPrintPanelViewController_generateQuickLookPDFWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a2;
  if ((a3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "printInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "nUpActive") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "printInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "borderType"))
      {
        objc_msgSend(*(id *)(a1 + 32), "printInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "bookletStyle") < 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "printInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "flipHorizontal");

          if ((v13 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "setQuickLookPDFURL:", v14);
            goto LABEL_9;
          }
          goto LABEL_8;
        }

      }
    }

LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "printInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "printPaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    redrawPDFWithNUp(v14, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setQuickLookPDFURL:", v11);

  }
LABEL_9:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)cancelQuickLookPDFGeneration
{
  void *v3;
  void *v4;
  id v5;

  -[UIPrintPanelViewController printInteractionController](self, "printInteractionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cancelAllPreviewGeneration");

  -[UIPrintPanelViewController setQuickLookPDFGenerationCancelled:](self, "setQuickLookPDFGenerationCancelled:", 1);
  -[UIPrintPanelViewController setQuickLookPDFGenerationInProgress:](self, "setQuickLookPDFGenerationInProgress:", 0);
  -[UIPrintPanelViewController pdfCreationProgressController](self, "pdfCreationProgressController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPrintPanelViewController pdfCreationProgressController](self, "pdfCreationProgressController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (id)shareableURLForPreviewing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
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
  id v23;
  uuid_string_t v24;
  uuid_t out;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[UIPrintPanelViewController printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jobName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByStandardizingPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !objc_msgSend(v5, "length"))
  {
    GetDefaultJobName();
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v8, "length") >= 0x51)
  {
    objc_msgSend(v8, "substringToIndex:", 80);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[UIPrintPanelViewController shareablePDFDirectoryPath](self, "shareablePDFDirectoryPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    uuid_unparse(out, v24);
    v16 = (void *)MEMORY[0x1E0CB3940];
    NSTemporaryDirectory();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/PrintPreviewPDF/%@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController setShareablePDFDirectoryPath:](self, "setShareablePDFDirectoryPath:", v19);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPanelViewController shareablePDFDirectoryPath](self, "shareablePDFDirectoryPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v23);
    v11 = v23;

    if (v11)
      goto LABEL_10;
  }
  -[UIPrintPanelViewController shareablePDFDirectoryPath](self, "shareablePDFDirectoryPath");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[UIPrintPanelViewController shareablePDFDirectoryPath](self, "shareablePDFDirectoryPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/%@.pdf"), v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }
  else
  {
LABEL_10:
    v15 = 0;
  }

  return v15;
}

- (id)createShareablePDFFileURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v14;
  id v15;

  v4 = a3;
  -[UIPrintPanelViewController shareableURLForPreviewing](self, "shareableURLForPreviewing");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);
    v15 = 0;
    v8 = objc_msgSend(v7, "linkItemAtURL:toURL:error:", v4, v6, &v15);
    v9 = v15;
    v10 = v9;
    if ((v8 & 1) == 0)
    {

      v14 = 0;
      v11 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v4, v6, &v14);
      v12 = v14;
      v10 = v12;
      if ((v11 & 1) == 0)
      {
        NSLog(CFSTR("UIPrintPanelViewController: Link/Copy item error: %@"), v12);

        v6 = 0;
      }
    }

  }
  return v6;
}

- (void)removeShareablePDFFiles
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  -[UIPrintPanelViewController shareablePDFDirectoryPath](self, "shareablePDFDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[UIPrintPanelViewController shareablePDFDirectoryPath](self, "shareablePDFDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      -[UIPrintPanelViewController shareablePDFDirectoryPath](self, "shareablePDFDirectoryPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v8 = objc_msgSend(v4, "removeItemAtPath:error:", v7, &v10);
      v9 = v10;

      if ((v8 & 1) == 0)
        NSLog(CFSTR("UIPrintPreviewViewController: Removing temporary preview directory failed:%@"), v9);

    }
    -[UIPrintPanelViewController setShareablePDFDirectoryPath:](self, "setShareablePDFDirectoryPath:", 0);

  }
}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (UIPrintPanelNavigationController)printOptionsNavController
{
  return self->_printOptionsNavController;
}

- (void)setPrintOptionsNavController:(id)a3
{
  objc_storeStrong((id *)&self->_printOptionsNavController, a3);
}

- (UITableView)printOptionsTableView
{
  return self->_printOptionsTableView;
}

- (void)setPrintOptionsTableView:(id)a3
{
  objc_storeStrong((id *)&self->_printOptionsTableView, a3);
}

- (UIPrintInteractionController)printInteractionController
{
  return self->_printInteractionController;
}

- (void)setPrintInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_printInteractionController, a3);
}

- (UIPrintPanelWindow)printPanelWindow
{
  return self->_printPanelWindow;
}

- (void)setPrintPanelWindow:(id)a3
{
  objc_storeStrong((id *)&self->_printPanelWindow, a3);
}

- (UIPrintPanelNavigationController)printPanelNavigationController
{
  return self->_printPanelNavigationController;
}

- (void)setPrintPanelNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_printPanelNavigationController, a3);
}

- (UIViewController)parentController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (UIView)previewSeparatorView
{
  return self->_previewSeparatorView;
}

- (void)setPreviewSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_previewSeparatorView, a3);
}

- (UIBarButtonItem)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareButton, a3);
}

- (UIPrintPreviewViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previewViewController, a3);
}

- (UIView)previewPanelView
{
  return self->_previewPanelView;
}

- (void)setPreviewPanelView:(id)a3
{
  objc_storeStrong((id *)&self->_previewPanelView, a3);
}

- (NSLayoutConstraint)previewHeightConstraint
{
  return self->_previewHeightConstraint;
}

- (void)setPreviewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_previewHeightConstraint, a3);
}

- (UIPrintOptionsTableViewController)printOptionsTableViewController
{
  return self->_printOptionsTableViewController;
}

- (void)setPrintOptionsTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_printOptionsTableViewController, a3);
}

- (NSLayoutConstraint)printOptionsWidthConstraint
{
  return self->_printOptionsWidthConstraint;
}

- (void)setPrintOptionsWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_printOptionsWidthConstraint, a3);
}

- (int64_t)lastUsedPrinterIndex
{
  return self->_lastUsedPrinterIndex;
}

- (void)setLastUsedPrinterIndex:(int64_t)a3
{
  self->_lastUsedPrinterIndex = a3;
}

- (NSArray)lastUsedPrinterArray
{
  return (NSArray *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setLastUsedPrinterArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (NSArray)vertScrollPrintPanelConstraints
{
  return self->_vertScrollPrintPanelConstraints;
}

- (void)setVertScrollPrintPanelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_vertScrollPrintPanelConstraints, a3);
}

- (NSArray)horizScrollPrintPanelConstraints
{
  return self->_horizScrollPrintPanelConstraints;
}

- (void)setHorizScrollPrintPanelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_horizScrollPrintPanelConstraints, a3);
}

- (UIPopoverController)poverController
{
  return self->_poverController;
}

- (void)setPoverController:(id)a3
{
  objc_storeStrong((id *)&self->_poverController, a3);
}

- (UIActivityViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (NSURL)quickLookPDFURL
{
  return (NSURL *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setQuickLookPDFURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (NSString)shareablePDFDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setShareablePDFDirectoryPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (UIAlertController)pdfCreationProgressController
{
  return (UIAlertController *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setPdfCreationProgressController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (BOOL)quickLookPDFGenerationInProgress
{
  return self->_quickLookPDFGenerationInProgress;
}

- (void)setQuickLookPDFGenerationInProgress:(BOOL)a3
{
  self->_quickLookPDFGenerationInProgress = a3;
}

- (BOOL)quickLookPDFGenerationCancelled
{
  return self->_quickLookPDFGenerationCancelled;
}

- (void)setQuickLookPDFGenerationCancelled:(BOOL)a3
{
  self->_quickLookPDFGenerationCancelled = a3;
}

- (double)progressPresentationTime
{
  return self->_progressPresentationTime;
}

- (void)setProgressPresentationTime:(double)a3
{
  self->_progressPresentationTime = a3;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIPrinter)observedPrinter
{
  return self->_observedPrinter;
}

- (void)setObservedPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_observedPrinter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedPrinter, 0);
  objc_storeStrong((id *)&self->_pdfCreationProgressController, 0);
  objc_storeStrong((id *)&self->_shareablePDFDirectoryPath, 0);
  objc_storeStrong((id *)&self->_quickLookPDFURL, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_poverController, 0);
  objc_storeStrong((id *)&self->_horizScrollPrintPanelConstraints, 0);
  objc_storeStrong((id *)&self->_vertScrollPrintPanelConstraints, 0);
  objc_storeStrong((id *)&self->_lastUsedPrinterArray, 0);
  objc_storeStrong((id *)&self->_printOptionsWidthConstraint, 0);
  objc_storeStrong((id *)&self->_printOptionsTableViewController, 0);
  objc_storeStrong((id *)&self->_previewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_previewPanelView, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_previewSeparatorView, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_printPanelNavigationController, 0);
  objc_storeStrong((id *)&self->_printPanelWindow, 0);
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_storeStrong((id *)&self->_printOptionsTableView, 0);
  objc_storeStrong((id *)&self->_printOptionsNavController, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
  objc_storeStrong((id *)&self->_lookupPrinterQueue, 0);
}

@end
