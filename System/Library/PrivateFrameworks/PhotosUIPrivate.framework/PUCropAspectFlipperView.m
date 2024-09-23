@implementation PUCropAspectFlipperView

- (PUCropAspectFlipperView)initWithLayoutOrientation:(int64_t)a3
{
  PUCropAspectFlipperView *v4;
  PUCropAspectFlipperView *v5;
  PUCropAspectFlipperView *v6;
  void *v7;
  PUCropAspectFlipperView *v8;
  void (**v9)(void *, _QWORD);
  uint64_t v10;
  UIButton *horizontalAspectButton;
  uint64_t v12;
  UIButton *verticalAspectButton;
  PUCropAspectFlipperView *v14;
  _QWORD aBlock[4];
  PUCropAspectFlipperView *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PUCropAspectFlipperView;
  v4 = -[PUCropAspectFlipperView init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    -[PUCropAspectFlipperView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUCropAspectFlipperView layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 3.0);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__PUCropAspectFlipperView_initWithLayoutOrientation___block_invoke;
    aBlock[3] = &unk_1E589DE58;
    v8 = v6;
    v17 = v8;
    v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    v9[2](v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    horizontalAspectButton = v8->_horizontalAspectButton;
    v8->_horizontalAspectButton = (UIButton *)v10;

    v9[2](v9, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    verticalAspectButton = v8->_verticalAspectButton;
    v8->_verticalAspectButton = (UIButton *)v12;

    -[PUCropAspectFlipperView addSubview:](v8, "addSubview:", v8->_horizontalAspectButton);
    -[PUCropAspectFlipperView addSubview:](v8, "addSubview:", v8->_verticalAspectButton);
    v8->_layoutOrientation = -1;
    -[PUCropAspectFlipperView setLayoutOrientation:](v8, "setLayoutOrientation:", a3);
    v14 = v8;

  }
  return v5;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  NSArray *layoutConstraints;
  NSArray *v6;
  UIButton *verticalAspectButton;
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
  NSArray *v41;
  PUCropAspectFlipperView *v42;

  if (self->_layoutOrientation != a3)
  {
    if (self->_layoutConstraints)
    {
      -[PUCropAspectFlipperView removeConstraints:](self, "removeConstraints:");
      layoutConstraints = self->_layoutConstraints;
      self->_layoutConstraints = 0;

    }
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = self;
    verticalAspectButton = v42->_verticalAspectButton;
    if (a3)
    {
      -[UIButton topAnchor](verticalAspectButton, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView topAnchor](v42, "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 10.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v10);

      -[UIButton topAnchor](v42->_horizontalAspectButton, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton bottomAnchor](v42->_verticalAspectButton, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 10.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v13);

      -[UIButton bottomAnchor](v42->_horizontalAspectButton, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView bottomAnchor](v42, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -10.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v16);

      -[UIButton leftAnchor](v42->_verticalAspectButton, "leftAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView leftAnchor](v42, "leftAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 10.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v19);

      -[UIButton rightAnchor](v42->_verticalAspectButton, "rightAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView rightAnchor](v42, "rightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -10.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v22);

      -[UIButton centerXAnchor](v42->_horizontalAspectButton, "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton centerXAnchor](v42->_verticalAspectButton, "centerXAnchor");
    }
    else
    {
      -[UIButton leftAnchor](verticalAspectButton, "leftAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView leftAnchor](v42, "leftAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 10.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v26);

      -[UIButton leftAnchor](v42->_horizontalAspectButton, "leftAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton rightAnchor](v42->_verticalAspectButton, "rightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 10.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v29);

      -[UIButton rightAnchor](v42->_horizontalAspectButton, "rightAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView rightAnchor](v42, "rightAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -10.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v32);

      -[UIButton topAnchor](v42->_verticalAspectButton, "topAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView topAnchor](v42, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 10.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v35);

      -[UIButton bottomAnchor](v42->_verticalAspectButton, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUCropAspectFlipperView bottomAnchor](v42, "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, -10.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v6, "addObject:", v38);

      -[UIButton centerYAnchor](v42->_horizontalAspectButton, "centerYAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton centerYAnchor](v42->_verticalAspectButton, "centerYAnchor");
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v6, "addObject:", v40);

    -[PUCropAspectFlipperView addConstraints:](v42, "addConstraints:", v6);
    v41 = self->_layoutConstraints;
    self->_layoutConstraints = v6;

    self->_layoutOrientation = a3;
  }
}

- (void)setAspectRatioOrientation:(int64_t)a3
{
  self->_aspectRatioOrientation = a3;
  -[UIButton setSelected:](self->_verticalAspectButton, "setSelected:", a3 == 1);
  -[UIButton setSelected:](self->_horizontalAspectButton, "setSelected:", a3 == 0);
}

- (void)aspectRatioButtonPressed:(id)a3
{
  void *v4;
  UIButton *v5;

  v5 = (UIButton *)a3;
  if ((-[UIButton isSelected](v5, "isSelected") & 1) == 0)
  {
    -[PUCropAspectFlipperView setAspectRatioOrientation:](self, "setAspectRatioOrientation:", self->_horizontalAspectButton != v5);
    -[PUCropAspectFlipperView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cropAspectFlipperView:cropOrientationSelected:", self, -[PUCropAspectFlipperView aspectRatioOrientation](self, "aspectRatioOrientation"));

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_enabled = a3;
  -[UIButton setEnabled:](self->_verticalAspectButton, "setEnabled:");
  -[UIButton setEnabled:](self->_horizontalAspectButton, "setEnabled:", v3);
}

- (PUCropAspectViewControllerDelegate)delegate
{
  return (PUCropAspectViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)aspectRatioOrientation
{
  return self->_aspectRatioOrientation;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_verticalAspectButton, 0);
  objc_storeStrong((id *)&self->_horizontalAspectButton, 0);
}

PUCropAspectFlipperButton *__53__PUCropAspectFlipperView_initWithLayoutOrientation___block_invoke(uint64_t a1, uint64_t a2)
{
  PUCropAspectFlipperButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(PUCropAspectFlipperButton);
  -[PUCropAspectFlipperButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUCropAspectFlipperButton widthAnchor](v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 31.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[PUCropAspectFlipperButton heightAnchor](v4, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 31.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[PUCropAspectFlipperButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_aspectRatioButtonPressed_, 1);
  -[PUCropAspectFlipperButton setOrientation:](v4, "setOrientation:", a2);
  return v4;
}

@end
