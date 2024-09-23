@implementation LTUIErrorViewController

- (LTUIErrorViewController)initWithError:(id)a3
{
  LTUIErrorViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
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
  LTUIErrorViewController *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  LTUIErrorViewController *v35;
  objc_super v36;
  void *v37;
  _QWORD v38[4];

  v38[3] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)LTUIErrorViewController;
  v3 = -[LTUIErrorViewController initWithNibName:bundle:](&v36, sel_initWithNibName_bundle_, 0, 0);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LTUIErrorViewController view](v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F98]), "initWithNibName:bundle:", 0, 0);
    v7 = objc_alloc(MEMORY[0x24BDF6B68]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(v8, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v10);

    objc_msgSend(v8, "setMaximumContentSizeCategory:", *MEMORY[0x24BDF7680]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("UNAVAILABLE_ERROR"), &stru_24C74F730, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v11);

    objc_msgSend(v6, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v8);

    v27 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "safeAreaLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v30, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v29;
    v13 = v6;
    v26 = v6;
    objc_msgSend(v6, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "safeAreaLayoutGuide");
    v35 = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v16, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v17;
    objc_msgSend(v8, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v22);

    v3 = v35;
    v37 = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[LTUIErrorViewController setViewControllers:](v35, "setViewControllers:", v23);

    -[LTUIErrorViewController _updateBackground](v35, "_updateBackground");
    v24 = v35;

  }
  return v3;
}

- (void)_updateBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  -[LTUIErrorViewController viewControllers](self, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((-[LTUIErrorViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0
      || (isKindOfClass & 1) != 0)
    {
      if ((isKindOfClass & 1) != 0
        && -[LTUIErrorViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
      {
        objc_msgSend(v7, "removeFromSuperview");
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v29);
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v4, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:atIndex:", v9, 0);

      v21 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v9, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v25;
      objc_msgSend(v9, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v20;
      objc_msgSend(v9, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v12;
      objc_msgSend(v9, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activateConstraints:", v17);

    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LTUIErrorViewController;
  -[LTUIErrorViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__LTUIErrorViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_24C74F460;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v4);
}

uint64_t __42__LTUIErrorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackground");
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__LTUIErrorViewController_viewDidAppear___block_invoke;
  v3[3] = &unk_24C74F460;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v3);
}

uint64_t __41__LTUIErrorViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawCloseButton");
}

- (void)drawCloseButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  if ((-[LTUIErrorViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0)
  {
    -[LTUIErrorViewController viewControllers](self, "viewControllers");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", 0);

  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__LTUIErrorViewController_drawCloseButton__block_invoke;
    v11[3] = &unk_24C74F488;
    v11[4] = self;
    objc_msgSend(MEMORY[0x24BDF67B8], "actionWithHandler:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:primaryAction:", 24, v5);
    -[LTUIErrorViewController viewControllers](self, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v6);

  }
}

void __42__LTUIErrorViewController_drawCloseButton__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LTUIErrorViewController;
  -[LTUIErrorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __78__LTUIErrorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v5[3] = &unk_24C74F460;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v5);
}

uint64_t __78__LTUIErrorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawCloseButton");
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackground");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
