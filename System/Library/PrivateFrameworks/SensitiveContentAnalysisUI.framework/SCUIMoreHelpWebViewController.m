@implementation SCUIMoreHelpWebViewController

- (SCUIMoreHelpWebViewController)init
{
  return -[SCUIMoreHelpWebViewController initWithType:](self, "initWithType:", SCUICurrentInterventionType());
}

- (SCUIMoreHelpWebViewController)initWithType:(int64_t)a3
{
  void *v4;
  SCUIMoreHelpWebViewController *v5;

  +[SCUIMoreHelpWebResources waysToGetHelpURLForInterventionType:](SCUIMoreHelpWebResources, "waysToGetHelpURLForInterventionType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCUIMoreHelpWebViewController initWithURL:](self, "initWithURL:", v4);

  return v5;
}

- (SCUIMoreHelpWebViewController)initWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
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
  void *v22;
  SCUIMoreHelpWebViewController *v23;
  SCUIMoreHelpWebViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[6];

  v49[4] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDFA920];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWebsiteDataStore:");
  v7 = objc_alloc(MEMORY[0x24BDFA918]);
  v47 = v6;
  v8 = (void *)objc_msgSend(v7, "initWithFrame:configuration:", v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setNavigationDelegate:", self);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1840]), "initWithURL:", v5);

  v45 = (void *)v9;
  v10 = (id)objc_msgSend(v8, "loadRequest:", v9);
  v11 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  objc_msgSend(v11, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v8);

  v36 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v40;
  objc_msgSend(v8, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v35;
  objc_msgSend(v8, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v17;
  objc_msgSend(v8, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v22);

  objc_msgSend(v8, "setHidden:", 1);
  objc_msgSend(v11, "setEdgesForExtendedLayout:", 0);
  v48.receiver = self;
  v48.super_class = (Class)SCUIMoreHelpWebViewController;
  v23 = -[SCUIMoreHelpWebViewController initWithRootViewController:](&v48, sel_initWithRootViewController_, v11);
  v24 = v23;
  if (v23)
  {
    -[SCUIMoreHelpWebViewController navigationBar](v23, "navigationBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "standardAppearance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");

    objc_msgSend(v27, "configureWithOpaqueBackground");
    -[SCUIMoreHelpWebViewController navigationBar](v24, "navigationBar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setScrollEdgeAppearance:", v27);

    -[SCUIMoreHelpWebViewController navigationBar](v24, "navigationBar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setStandardAppearance:", v27);

    -[SCUIMoreHelpWebViewController navigationBar](v24, "navigationBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCompactAppearance:", v27);

    -[SCUIMoreHelpWebViewController setModalPresentationStyle:](v24, "setModalPresentationStyle:", 2);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v24, sel_dismissMoreHelpView);
    objc_msgSend(v11, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setRightBarButtonItem:", v31);

  }
  return v24;
}

- (void)dismissMoreHelpView
{
  -[SCUIMoreHelpWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  objc_msgSend(a3, "setHidden:", 0, a4);
}

@end
