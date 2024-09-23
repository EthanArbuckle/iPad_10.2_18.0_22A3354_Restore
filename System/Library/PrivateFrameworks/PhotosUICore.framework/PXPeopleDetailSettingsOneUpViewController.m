@implementation PXPeopleDetailSettingsOneUpViewController

- (PXPeopleDetailSettingsOneUpViewController)initWithAsset:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
  {
    -[PXPeopleDetailSettingsOneUpViewController superclass](self, "superclass");
    objc_storeStrong((id *)&self->_asset, a3);
  }

  return self;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsOneUpViewController;
  -[PXPeopleDetailSettingsOneUpViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PXPeopleDetailSettingsOneUpViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[PXPeopleDetailSettingsOneUpViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, v5, v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setContentMode:", 1);
  objc_msgSend(v9, "setClipsToBounds:", 0);
  objc_msgSend(v9, "setTag:", 1);
  -[PXPeopleDetailSettingsOneUpViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v9);

}

- (void)setAsset:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0DC3890];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithImage:", v5);

  objc_msgSend(v7, "setContentMode:", 1);
  -[PXPeopleDetailSettingsOneUpViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96__PXPeopleDetailSettingsOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E51479C8;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, &__block_literal_global_271675);
}

- (UIImage)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

void __96__PXPeopleDetailSettingsOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewWithTag:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v5, "setBounds:");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  objc_msgSend(v5, "setCenter:");

}

@end
