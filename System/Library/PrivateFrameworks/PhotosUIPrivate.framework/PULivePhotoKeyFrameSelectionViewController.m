@implementation PULivePhotoKeyFrameSelectionViewController

- (PULivePhotoKeyFrameSelectionViewController)initWithCoder:(id)a3
{
  PULivePhotoKeyFrameSelectionViewController *v3;
  PULivePhotoKeyFrameSelectionViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PULivePhotoKeyFrameSelectionViewController;
  v3 = -[PULivePhotoKeyFrameSelectionViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit_45493(v3);
  return v4;
}

- (PULivePhotoKeyFrameSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PULivePhotoKeyFrameSelectionViewController *v4;
  PULivePhotoKeyFrameSelectionViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PULivePhotoKeyFrameSelectionViewController;
  v4 = -[PULivePhotoKeyFrameSelectionViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    commonInit_45493(v4);
  return v5;
}

- (void)viewDidLoad
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PULivePhotoKeyFrameSelectionViewController;
  -[PULivePhotoKeyFrameSelectionViewController viewDidLoad](&v26, sel_viewDidLoad);
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_tapMakeKeyPhoto_, 64);
  objc_msgSend(v3, "photoEditingKeyPhotoSelectionNormalColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v5, 0);

  objc_msgSend(v3, "photoEditingToolbarButtonNormalFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(v4, "setContentEdgeInsets:", 12.0, 12.0, 12.0, 12.0);
  -[PULivePhotoKeyFrameSelectionViewController setMakeKeyPhotoBtn:](self, "setMakeKeyPhotoBtn:", v4);
  -[PULivePhotoKeyFrameSelectionViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoEditingPopoverBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v8, "addSubview:", v4);
  objc_msgSend(v4, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v4, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v4, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(v4, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[PULivePhotoKeyFrameSelectionViewController _updateButtonTitle](self, "_updateButtonTitle");
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PULivePhotoKeyFrameSelectionViewController makeKeyPhotoBtn](self, "makeKeyPhotoBtn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)preferredUserInterfaceStyle
{
  void *v2;
  int64_t v3;

  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "lightModeEditor"))
    v3 = 0;
  else
    v3 = 2;

  return v3;
}

- (void)setSelectionTitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *selectionTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_selectionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      selectionTitle = self->_selectionTitle;
      self->_selectionTitle = v6;

      -[PULivePhotoKeyFrameSelectionViewController _updateButtonTitle](self, "_updateButtonTitle");
    }
  }

}

- (void)tapMakeKeyPhoto:(id)a3
{
  id v4;

  -[PULivePhotoKeyFrameSelectionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidRequestToMakeKeyPhoto:", self);

}

- (void)_updateButtonTitle
{
  void *v3;
  id v4;

  -[PULivePhotoKeyFrameSelectionViewController makeKeyPhotoBtn](self, "makeKeyPhotoBtn");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PULivePhotoKeyFrameSelectionViewController selectionTitle](self, "selectionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v3, 0);

}

- (PULivePhotoKeyFrameSelectionViewControllerDelegate)delegate
{
  return (PULivePhotoKeyFrameSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)selectionTitle
{
  return self->_selectionTitle;
}

- (UIButton)makeKeyPhotoBtn
{
  return self->_makeKeyPhotoBtn;
}

- (void)setMakeKeyPhotoBtn:(id)a3
{
  objc_storeStrong((id *)&self->_makeKeyPhotoBtn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_makeKeyPhotoBtn, 0);
  objc_storeStrong((id *)&self->_selectionTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
