@implementation PUImportAddToAlbumsToolbarView

- (PUImportAddToAlbumsToolbarView)initWithFrame:(CGRect)a3 photoLibrary:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PUImportAddToAlbumsToolbarView *v11;
  PUImportAddToAlbumsToolbarView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUImportAddToAlbumsToolbarView;
  v11 = -[PUImportAddToAlbumsToolbarView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
    -[PUImportAddToAlbumsToolbarView _setupSubviews](v12, "_setupSubviews");
  }

  return v12;
}

- (PUImportAddToAlbumsToolbarView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportAddToAlbumsToolbarView.m"), 34, CFSTR("%s is not available as initializer"), "-[PUImportAddToAlbumsToolbarView initWithFrame:]");

  abort();
}

- (void)_setupSubviews
{
  uint64_t v3;
  id v4;
  UILabel *v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *destinationButton;
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
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DC4B10];
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

  PLLocalizedFrameworkString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v8);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 0);
  -[PUImportAddToAlbumsToolbarView addSubview:](self, "addSubview:", self->_titleLabel);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  destinationButton = self->_destinationButton;
  self->_destinationButton = v9;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_destinationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUImportAddToAlbumsToolbarView _setupButton](self, "_setupButton");
  -[UIButton addTarget:action:forControlEvents:](self->_destinationButton, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);
  -[UIButton addTarget:action:forControlEvents:](self->_destinationButton, "addTarget:action:forControlEvents:", self, sel_buttonTouchDown_, 1);
  -[UIButton addTarget:action:forControlEvents:](self->_destinationButton, "addTarget:action:forControlEvents:", self, sel_buttonTouchDragInside_, 4);
  -[UIButton addTarget:action:forControlEvents:](self->_destinationButton, "addTarget:action:forControlEvents:", self, sel_buttonTouchDragOutside_, 8);
  -[PUImportAddToAlbumsToolbarView addSubview:](self, "addSubview:", self->_destinationButton);
  v21 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsToolbarView leadingAnchor](self, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v25;
  -[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsToolbarView centerYAnchor](self, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  -[UIButton leadingAnchor](self->_destinationButton, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 2.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v13;
  -[UIButton trailingAnchor](self->_destinationButton, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsToolbarView trailingAnchor](self, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v16;
  -[UIButton centerYAnchor](self->_destinationButton, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsToolbarView centerYAnchor](self, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v20);

}

- (id)_destinationDescription
{
  void *v2;
  void *v3;

  -[PUImportAddToAlbumsToolbarView photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXTargetLibraryTitleForDefaultType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setupButton
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *destinationLabel;
  void *v11;
  UILabel *v12;
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
  _QWORD v34[6];

  v34[5] = *MEMORY[0x1E0C80C00];
  if (self->_destinationButton)
  {
    -[PUImportAddToAlbumsToolbarView _destinationDescription](self, "_destinationDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportAddToAlbumsToolbarView setDestinationDescriptionTitle:](self, "setDestinationDescriptionTitle:", v3);

    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    destinationLabel = self->_destinationLabel;
    self->_destinationLabel = v9;

    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_destinationLabel, "setFont:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_destinationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = self->_destinationLabel;
    -[PUImportAddToAlbumsToolbarView tintColor](self, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setNumberOfLines:](self->_destinationLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](self->_destinationLabel, "setTextAlignment:", 4);
    -[UIButton addSubview:](self->_destinationButton, "addSubview:", self->_destinationLabel);
    -[PUImportAddToAlbumsToolbarView _updateButtonText](self, "_updateButtonText");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    objc_msgSend(v14, "setText:", CFSTR("⌄"));
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUImportAddToAlbumsToolbarView tintColor](self, "tintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v16);

    objc_msgSend(v14, "setNumberOfLines:", 0);
    objc_msgSend(v14, "setTextAlignment:", 4);
    -[UIButton addSubview:](self->_destinationButton, "addSubview:", v14);
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](self->_destinationLabel, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_destinationButton, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v31;
    -[UILabel centerYAnchor](self->_destinationLabel, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](self->_destinationButton, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v28;
    -[UILabel trailingAnchor](self->_destinationLabel, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v18;
    objc_msgSend(v14, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](self->_destinationButton, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v21;
    objc_msgSend(v14, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_destinationLabel, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v25);

  }
}

- (void)_updateButtonText
{
  void *v3;
  id v4;

  -[PUImportAddToAlbumsToolbarView destinationDescriptionTitle](self, "destinationDescriptionTitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsToolbarView destinationLabel](self, "destinationLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[PUImportAddToAlbumsToolbarView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[PUImportAddToAlbumsToolbarView destinationButton](self, "destinationButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  -[PUImportAddToAlbumsToolbarView destinationButton](self, "destinationButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[PUImportAddToAlbumsToolbarView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v7 + v9;
  -[PUImportAddToAlbumsToolbarView destinationButton](self, "destinationButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  -[PUImportAddToAlbumsToolbarView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v13 + v15;

  v17 = v10;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)setDestinationDescriptionTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *destinationDescriptionTitle;
  NSString *v7;

  v4 = (NSString *)a3;
  if (self->_destinationDescriptionTitle != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      -[PUImportAddToAlbumsToolbarView _destinationDescription](self, "_destinationDescription");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    destinationDescriptionTitle = self->_destinationDescriptionTitle;
    self->_destinationDescriptionTitle = v5;

    -[PUImportAddToAlbumsToolbarView _updateButtonText](self, "_updateButtonText");
    v4 = v7;
  }

}

- (void)buttonTouchDown:(id)a3
{
  objc_msgSend(a3, "setAlpha:", 0.2);
}

- (void)_animateButtonAlpha:(double)a3
{
  void *v5;
  double v6;
  double v7;
  _QWORD v8[6];

  -[PUImportAddToAlbumsToolbarView destinationButton](self, "destinationButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  if (vabdd_f64(v7, a3) > 0.000001)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PUImportAddToAlbumsToolbarView__animateButtonAlpha___block_invoke;
    v8[3] = &unk_1E58AACF0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 4, v8, 0, 0.25, 0.0);
  }
}

- (void)buttonTouchDragInside:(id)a3
{
  -[PUImportAddToAlbumsToolbarView _animateButtonAlpha:](self, "_animateButtonAlpha:", a3, 0.2);
}

- (void)buttonTouchDragOutside:(id)a3
{
  -[PUImportAddToAlbumsToolbarView _animateButtonAlpha:](self, "_animateButtonAlpha:", a3, 1.0);
}

- (void)buttonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a3, "setAlpha:", 1.0);
  -[PUImportAddToAlbumsToolbarView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[PUImportAddToAlbumsToolbarView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didTapAddToAlbumsView:", self);

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PUImportAddToAlbumsToolbarView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportAddToAlbumsToolbarView destinationDescriptionTitle](self, "destinationDescriptionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0DC4660];
}

- (CGRect)accessibilityFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PUImportAddToAlbumsToolbarView destinationButton](self, "destinationButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[PUImportAddToAlbumsToolbarView convertRect:toView:](self, "convertRect:toView:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (NSString)destinationDescriptionTitle
{
  return self->_destinationDescriptionTitle;
}

- (UIButton)destinationButton
{
  return self->_destinationButton;
}

- (PUImportAddToAlbumsToolbarViewDelegate)delegate
{
  return (PUImportAddToAlbumsToolbarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)destinationLabel
{
  return self->_destinationLabel;
}

- (void)setDestinationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_destinationLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_destinationButton, 0);
  objc_storeStrong((id *)&self->_destinationDescriptionTitle, 0);
}

void __54__PUImportAddToAlbumsToolbarView__animateButtonAlpha___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "destinationButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

@end
