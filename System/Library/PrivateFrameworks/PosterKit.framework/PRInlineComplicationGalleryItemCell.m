@implementation PRInlineComplicationGalleryItemCell

+ (double)suggestionInset
{
  return 52.0;
}

+ (double)checkmarkInset
{
  return 48.0;
}

- (PRInlineComplicationGalleryItemCell)initWithFrame:(CGRect)a3
{
  PRInlineComplicationGalleryItemCell *v3;
  UIView *v4;
  UIView *widgetContainerView;
  UILabel *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *iconImageView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSLayoutConstraint *leadingConstraint;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UICellAccessory *v41;
  UICellAccessory *checkmarkAccessory;
  UICellAccessory *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
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
  objc_super v60;
  _QWORD v61[5];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)PRInlineComplicationGalleryItemCell;
  v3 = -[PRInlineComplicationGalleryItemCell initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    widgetContainerView = v3->_widgetContainerView;
    v3->_widgetContainerView = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v6;

    v8 = v3->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = v3->_label;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAlpha:](v3->_label, "setAlpha:", 0.6);
    v12 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v64[0] = v3->_widgetContainerView;
    v64[1] = v3->_label;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithArrangedSubviews:", v13);

    objc_msgSend(v14, "setAxis:", 1);
    v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v3->_iconImageView, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 40.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v19;
    -[UIImageView heightAnchor](v3->_iconImageView, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 40.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v22);

    v23 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v62[0] = v3->_iconImageView;
    v62[1] = v14;
    v24 = v14;
    v59 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithArrangedSubviews:", v25);

    objc_msgSend(v26, "setSpacing:", 12.0);
    objc_msgSend(v26, "setAlignment:", 3);
    objc_msgSend(v26, "setUserInteractionEnabled:", 0);
    -[PRInlineComplicationGalleryItemCell contentView](v3, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v26);

    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v26, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryItemCell contentView](v3, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 8.0);
    v31 = objc_claimAutoreleasedReturnValue();
    leadingConstraint = v3->_leadingConstraint;
    v3->_leadingConstraint = (NSLayoutConstraint *)v31;

    v52 = (void *)MEMORY[0x1E0CB3718];
    v61[0] = v3->_leadingConstraint;
    objc_msgSend(v26, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryItemCell contentView](v3, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintLessThanOrEqualToAnchor:constant:", v56, -8.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v55;
    objc_msgSend(v26, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryItemCell contentView](v3, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v51, 8.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v50;
    objc_msgSend(v26, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryItemCell contentView](v3, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v34, -8.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v35;
    -[PRInlineComplicationGalleryItemCell separatorLayoutGuide](v3, "separatorLayoutGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v40);

    v41 = (UICellAccessory *)objc_alloc_init(MEMORY[0x1E0DC3548]);
    checkmarkAccessory = v3->_checkmarkAccessory;
    v3->_checkmarkAccessory = v41;

    v43 = v3->_checkmarkAccessory;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICellAccessory setTintColor:](v43, "setTintColor:", v44);

    objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "colorWithAlphaComponent:", 0.3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setBackgroundColor:", v47);

    -[PRInlineComplicationGalleryItemCell setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v45);
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRInlineComplicationGalleryItemCell;
  -[PRInlineComplicationGalleryItemCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PRInlineComplicationGalleryItemCell setContentViewController:](self, "setContentViewController:", 0);
}

- (void)setIconImage:(id)a3
{
  double v5;

  -[UIImageView setImage:](self->_iconImageView, "setImage:");
  if (a3)
    v5 = 8.0;
  else
    v5 = 16.0;
  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", a3 == 0);
  -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:", v5);
}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_iconImageView, "image");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_label, "text");
}

- (void)setContentViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_contentViewController;
  UIViewController *contentViewController;
  void *v8;
  void *v9;
  int v10;
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
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  if (contentViewController != v5)
  {
    -[UIViewController view](contentViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryItemCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isDescendantOfView:", v9);

    if (v10)
    {
      -[UIViewController parentViewController](*p_contentViewController, "parentViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bs_removeChildViewController:", *p_contentViewController);

    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      -[UIViewController view](*p_contentViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_widgetContainerView, "addSubview:", v12);
      v23 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v12, "heightAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToConstant:", 26.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v27;
      objc_msgSend(v12, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_widgetContainerView, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v24;
      objc_msgSend(v12, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_widgetContainerView, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29[2] = v13;
      objc_msgSend(v12, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_widgetContainerView, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[3] = v16;
      objc_msgSend(v12, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_widgetContainerView, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[4] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateConstraints:", v20);

    }
  }

}

- (BOOL)showsCheckmark
{
  PRInlineComplicationGalleryItemCell *v2;
  void *v3;

  v2 = self;
  -[PRInlineComplicationGalleryItemCell accessories](self, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", v2->_checkmarkAccessory);

  return (char)v2;
}

- (void)setShowsCheckmark:(BOOL)a3
{
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5[0] = self->_checkmarkAccessory;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRInlineComplicationGalleryItemCell setAccessories:](self, "setAccessories:", v4);

  }
  else
  {
    -[PRInlineComplicationGalleryItemCell setAccessories:](self, "setAccessories:", MEMORY[0x1E0C9AA60]);
  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (void)setSeparatorVisible:(BOOL)a3
{
  self->_separatorVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkAccessory, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_widgetContainerView, 0);
}

@end
