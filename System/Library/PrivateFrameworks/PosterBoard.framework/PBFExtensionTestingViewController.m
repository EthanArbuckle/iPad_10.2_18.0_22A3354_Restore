@implementation PBFExtensionTestingViewController

- (PBFExtensionTestingViewController)init
{
  PBFExtensionTestingViewController *v2;
  ExtensionListViewController *v3;
  ExtensionListViewController *renderingController;
  ExtensionListViewController *v5;
  ExtensionListViewController *editingController;
  PBFGalleryViewController *v7;
  PBFGalleryViewController *galleryController;
  PBFConfigViewController *v9;
  PBFConfigViewController *configController;
  PBFClientTesterViewController *v11;
  PBFClientTesterViewController *clientTesterController;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PBFExtensionTestingViewController;
  v2 = -[PBFExtensionTestingViewController init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ExtensionListViewController);
    renderingController = v2->_renderingController;
    v2->_renderingController = v3;

    -[ExtensionListViewController setTitle:](v2->_renderingController, "setTitle:", CFSTR("Rendering"));
    -[ExtensionListViewController setExtensionItemActivationStyle:](v2->_renderingController, "setExtensionItemActivationStyle:", 0);
    v5 = objc_alloc_init(ExtensionListViewController);
    editingController = v2->_editingController;
    v2->_editingController = v5;

    -[ExtensionListViewController setTitle:](v2->_editingController, "setTitle:", CFSTR("Editing"));
    -[ExtensionListViewController setExtensionItemActivationStyle:](v2->_editingController, "setExtensionItemActivationStyle:", 1);
    v7 = objc_alloc_init(PBFGalleryViewController);
    galleryController = v2->_galleryController;
    v2->_galleryController = v7;

    -[PBFGalleryViewController setTitle:](v2->_galleryController, "setTitle:", CFSTR("Gallery"));
    v9 = objc_alloc_init(PBFConfigViewController);
    configController = v2->_configController;
    v2->_configController = v9;

    -[PBFConfigViewController setTitle:](v2->_configController, "setTitle:", CFSTR("Configurations"));
    v11 = objc_alloc_init(PBFClientTesterViewController);
    clientTesterController = v2->_clientTesterController;
    v2->_clientTesterController = v11;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UISegmentedControl *v5;
  UISegmentedControl *variantSelector;
  UINavigationBar *v7;
  UINavigationBar *barView;
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
  objc_super v35;
  _QWORD v36[9];

  v36[7] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PBFExtensionTestingViewController;
  -[PBFExtensionTestingViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[PBFExtensionTestingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D17A3148]("-[PBFExtensionTestingViewController viewDidLoad]"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

    v5 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E8741AD8);
    variantSelector = self->_variantSelector;
    self->_variantSelector = v5;

    -[UISegmentedControl addTarget:action:forControlEvents:](self->_variantSelector, "addTarget:action:forControlEvents:", self, sel__variantSelectorValueChanged_, 4096);
    -[UISegmentedControl setSelectedSegmentIndex:](self->_variantSelector, "setSelectedSegmentIndex:", 0);
    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_variantSelector, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (UINavigationBar *)objc_alloc_init(MEMORY[0x1E0DC3A28]);
    barView = self->_barView;
    self->_barView = v7;

    -[UINavigationBar setTranslucent:](self->_barView, "setTranslucent:", 0);
    -[UINavigationBar setTranslatesAutoresizingMaskIntoConstraints:](self->_barView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", self->_variantSelector);
    objc_msgSend(v3, "addSubview:", self->_barView);
    v25 = (void *)MEMORY[0x1E0CB3718];
    -[UINavigationBar centerXAnchor](self->_barView, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v32;
    -[UINavigationBar widthAnchor](self->_barView, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v29;
    -[UISegmentedControl centerXAnchor](self->_variantSelector, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v26;
    -[UISegmentedControl leadingAnchor](self->_variantSelector, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v23, 10.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v22;
    -[UISegmentedControl trailingAnchor](self->_variantSelector, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:constant:", v20, -10.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v19;
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl bottomAnchor](self->_variantSelector, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v10, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v11;
    objc_msgSend(v3, "safeAreaLayoutGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar topAnchor](self->_barView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v14, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[6] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v16);

    -[PBFExtensionTestingViewController presentPage:](self, "presentPage:", self->_renderingController);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v17);

  }
}

- (void)presentPage:(id)a3
{
  UIViewController *v5;
  UIViewController **p_presentedViewController;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  UINavigationBar *barView;
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
  _QWORD v32[4];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v5 = (UIViewController *)a3;
  p_presentedViewController = &self->_presentedViewController;
  if (self->_presentedViewController != v5
    && MEMORY[0x1D17A3148]("-[PBFExtensionTestingViewController presentPage:]"))
  {
    -[PBFExtensionTestingViewController bs_removeChildViewController:animated:transitionBlock:](self, "bs_removeChildViewController:animated:transitionBlock:", *p_presentedViewController, 1, 0);
    -[PBFExtensionTestingViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v5, 1, 0);
    objc_storeStrong((id *)&self->_presentedViewController, a3);
    -[UIViewController navigationItem](v5, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0DC3A48]);
      -[UIViewController title](v5, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v10, "initWithTitle:", v11);

    }
    v31 = v9;

    barView = self->_barView;
    v33[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar setItems:](barView, "setItems:", v13);

    -[PBFExtensionTestingViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](*p_presentedViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v15, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationBar bottomAnchor](self->_barView, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v28;
    objc_msgSend(v15, "leftAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v14;
    objc_msgSend(v14, "leftAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    objc_msgSend(v15, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl topAnchor](self->_variantSelector, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v19;
    objc_msgSend(v15, "rightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v23);

  }
}

- (void)_variantSelectorValueChanged:(id)a3
{
  unint64_t v4;
  id v5;
  id v6;

  v4 = objc_msgSend(a3, "selectedSegmentIndex");
  if (v4 > 4)
    v5 = 0;
  else
    v5 = *(id *)((char *)&self->super.super.super.isa + *off_1E86F3D60[v4]);
  v6 = v5;
  -[PBFExtensionTestingViewController presentPage:](self, "presentPage:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_clientTesterController, 0);
  objc_storeStrong((id *)&self->_configController, 0);
  objc_storeStrong((id *)&self->_galleryController, 0);
  objc_storeStrong((id *)&self->_editingController, 0);
  objc_storeStrong((id *)&self->_renderingController, 0);
  objc_storeStrong((id *)&self->_variantSelector, 0);
  objc_storeStrong((id *)&self->_barView, 0);
}

@end
