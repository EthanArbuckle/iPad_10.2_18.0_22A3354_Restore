@implementation PPKPDFIconCollectionViewCell_iOS

- (PPKPDFIconCollectionViewCell_iOS)initWithFrame:(CGRect)a3
{
  PPKPDFIconCollectionViewCell_iOS *v3;
  PPKPDFIconCollectionViewCell_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  v3 = -[PPKPDFIconCollectionViewCell_iOS initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PPKPDFIconCollectionViewCell_iOS _commonInit](v3, "_commonInit");
  return v4;
}

- (PPKPDFIconCollectionViewCell_iOS)initWithCoder:(id)a3
{
  PPKPDFIconCollectionViewCell_iOS *v3;
  PPKPDFIconCollectionViewCell_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  v3 = -[PPKPDFIconCollectionViewCell_iOS initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PPKPDFIconCollectionViewCell_iOS _commonInit](v3, "_commonInit");
  return v4;
}

- (void)setHasLargeThumbnail:(BOOL)a3
{
  if (self->_hasLargeThumbnail != a3)
  {
    self->_hasLargeThumbnail = a3;
    -[PPKPDFIconCollectionViewCell_iOS _updateMetricsIfNeeded](self, "_updateMetricsIfNeeded");
  }
}

- (void)_updateMetricsIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double ImageCornerRadius;
  void *v11;
  void *v12;
  double SelectionOverlayCornerRadius;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double CellShadowRadius;
  void *v19;
  void *v20;
  double v21;
  id v22;
  uint64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double CellCornerRadius;
  id v30;

  v3 = 0.0;
  v4 = 3.0;
  if (self->_hasLargeThumbnail)
    v5 = 0.0;
  else
    v5 = 3.0;
  v6 = 8.0;
  v7 = 2.0;
  if (self->_hasLargeThumbnail)
  {
    v7 = 8.0;
    v4 = 8.0;
  }
  else
  {
    v6 = 0.0;
  }
  v8 = 10.0;
  if (!self->_hasLargeThumbnail)
    v8 = 0.0;
  v9 = 4.0;
  if (self->_hasLargeThumbnail)
    v3 = 0.25;
  else
    v9 = 0.0;
  self->_ImageEdgesInset = v5;
  self->_ImageCornerRadius = v7;
  self->_CellCornerRadius = v4;
  self->_SelectionOverlayCornerRadius = v7;
  self->_CellVerticalEdgesInset = v6;
  self->_CellHorizontalEdgesInset = v8;
  self->_CellShadowRadius = v9;
  self->_CellShadowOpacity = v3;
  ImageCornerRadius = self->_ImageCornerRadius;
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", ImageCornerRadius);

  SelectionOverlayCornerRadius = self->_SelectionOverlayCornerRadius;
  -[UIView layer](self->_overlayView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", SelectionOverlayCornerRadius);

  -[NSLayoutConstraint setConstant:](self->_imageViewBottomConstraint, "setConstant:", -self->_ImageEdgesInset - self->_CellVerticalEdgesInset);
  -[NSLayoutConstraint setConstant:](self->_imageViewTopConstraint, "setConstant:", self->_ImageEdgesInset + self->_CellVerticalEdgesInset);
  -[NSLayoutConstraint setConstant:](self->_imageViewLeadingConstraint, "setConstant:", self->_ImageEdgesInset + self->_CellHorizontalEdgesInset);
  -[NSLayoutConstraint setConstant:](self->_imageViewTrailingConstraint, "setConstant:", -self->_ImageEdgesInset - self->_CellHorizontalEdgesInset);
  -[NSLayoutConstraint setConstant:](self->_overlayViewBottomConstraint, "setConstant:", -self->_CellVerticalEdgesInset);
  -[NSLayoutConstraint setConstant:](self->_overlayViewTopConstraint, "setConstant:", self->_CellVerticalEdgesInset);
  -[NSLayoutConstraint setConstant:](self->_overlayViewLeadingConstraint, "setConstant:", self->_CellHorizontalEdgesInset);
  -[NSLayoutConstraint setConstant:](self->_overlayViewTrailingConstraint, "setConstant:", -self->_CellHorizontalEdgesInset);
  v15 = *MEMORY[0x1E0C9D820];
  v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[PPKPDFIconCollectionViewCell_iOS layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowOffset:", v15, v16);

  CellShadowRadius = self->_CellShadowRadius;
  -[PPKPDFIconCollectionViewCell_iOS layer](self, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShadowRadius:", CellShadowRadius);

  *(float *)&CellShadowRadius = self->_CellShadowOpacity;
  -[PPKPDFIconCollectionViewCell_iOS layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = LODWORD(CellShadowRadius);
  objc_msgSend(v20, "setShadowOpacity:", v21);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend(v22, "CGColor");
  -[PPKPDFIconCollectionViewCell_iOS layer](self, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setShadowColor:", v23);

  v25 = !self->_hasLargeThumbnail;
  -[PPKPDFIconCollectionViewCell_iOS layer](self, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMasksToBounds:", v25);

  v27 = *MEMORY[0x1E0CD2A68];
  -[PPKPDFIconCollectionViewCell_iOS layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCornerCurve:", v27);

  CellCornerRadius = self->_CellCornerRadius;
  -[PPKPDFIconCollectionViewCell_iOS layer](self, "layer");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCornerRadius:", CellCornerRadius);

}

- (void)_commonInit
{
  -[PPKPDFIconCollectionViewCell_iOS setupSubviews](self, "setupSubviews");
  -[PPKPDFIconCollectionViewCell_iOS updateOverlay](self, "updateOverlay");
  -[PPKPDFIconCollectionViewCell_iOS _updateMetricsIfNeeded](self, "_updateMetricsIfNeeded");
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  -[PPKPDFIconCollectionViewCell_iOS prepareForReuse](&v5, sel_prepareForReuse);
  if (self->_ratioConstraint)
  {
    -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraint:", self->_ratioConstraint);

  }
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPKPDFIconCollectionViewCell_iOS;
  -[PPKPDFIconCollectionViewCell_iOS setSelected:](&v4, sel_setSelected_, a3);
  -[PPKPDFIconCollectionViewCell_iOS updateOverlay](self, "updateOverlay");
}

- (void)updateOverlay
{
  -[UIView setHidden:](self->_overlayView, "setHidden:", -[PPKPDFIconCollectionViewCell_iOS isSelected](self, "isSelected") ^ 1);
}

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *v18;
  UIView *overlayView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *imageViewBottomConstraint;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *imageViewTopConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *imageViewLeadingConstraint;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *imageViewTrailingConstraint;
  void *v49;
  void *v50;
  void *v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *overlayViewBottomConstraint;
  void *v54;
  void *v55;
  void *v56;
  NSLayoutConstraint *v57;
  NSLayoutConstraint *overlayViewTopConstraint;
  void *v59;
  void *v60;
  void *v61;
  NSLayoutConstraint *v62;
  NSLayoutConstraint *overlayViewLeadingConstraint;
  void *v64;
  void *v65;
  void *v66;
  NSLayoutConstraint *v67;
  NSLayoutConstraint *overlayViewTrailingConstraint;
  void *v69;
  NSLayoutConstraint *v70;
  NSLayoutConstraint *v71;
  NSLayoutConstraint *v72;
  NSLayoutConstraint *v73;
  void *v74;
  id v75;
  UIButton *v76;
  UIButton *actionsButton;
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
  _QWORD v95[4];
  _QWORD v96[10];

  v96[8] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[PPKPDFIconCollectionViewCell_iOS bounds](self, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[PPKPDFIconCollectionViewCell_iOS setImageView:](self, "setImageView:", v4);

  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 0);

  v6 = *MEMORY[0x1E0CD2A68];
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerCurve:", v6);

  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMasksToBounds:", 1);

  v11 = *MEMORY[0x1E0CD2EF8];
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMinificationFilter:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  v18 = (UIView *)objc_opt_new();
  overlayView = self->_overlayView;
  self->_overlayView = v18;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "colorWithAlphaComponent:", 0.3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_overlayView, "setBackgroundColor:", v21);

  -[UIView layer](self->_overlayView, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerCurve:", v6);

  -[UIView setHidden:](self->_overlayView, "setHidden:", 1);
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->_overlayView);

  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_overlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, 0.0);
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewBottomConstraint = self->_imageViewBottomConstraint;
  self->_imageViewBottomConstraint = v29;

  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 0.0);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewTopConstraint = self->_imageViewTopConstraint;
  self->_imageViewTopConstraint = v35;

  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 0.0);
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewLeadingConstraint = self->_imageViewLeadingConstraint;
  self->_imageViewLeadingConstraint = v41;

  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46, 0.0);
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageViewTrailingConstraint = self->_imageViewTrailingConstraint;
  self->_imageViewTrailingConstraint = v47;

  -[UIView bottomAnchor](self->_overlayView, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, 0.0);
  v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  overlayViewBottomConstraint = self->_overlayViewBottomConstraint;
  self->_overlayViewBottomConstraint = v52;

  -[UIView topAnchor](self->_overlayView, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56, 0.0);
  v57 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  overlayViewTopConstraint = self->_overlayViewTopConstraint;
  self->_overlayViewTopConstraint = v57;

  -[UIView leadingAnchor](self->_overlayView, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, 0.0);
  v62 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  overlayViewLeadingConstraint = self->_overlayViewLeadingConstraint;
  self->_overlayViewLeadingConstraint = v62;

  -[UIView trailingAnchor](self->_overlayView, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, 0.0);
  v67 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  overlayViewTrailingConstraint = self->_overlayViewTrailingConstraint;
  self->_overlayViewTrailingConstraint = v67;

  v69 = (void *)MEMORY[0x1E0CB3718];
  v70 = self->_imageViewBottomConstraint;
  v96[0] = self->_imageViewTopConstraint;
  v96[1] = v70;
  v71 = self->_imageViewTrailingConstraint;
  v96[2] = self->_imageViewLeadingConstraint;
  v96[3] = v71;
  v72 = self->_overlayViewTopConstraint;
  v96[4] = self->_overlayViewBottomConstraint;
  v96[5] = v72;
  v73 = self->_overlayViewTrailingConstraint;
  v96[6] = self->_overlayViewLeadingConstraint;
  v96[7] = v73;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 8);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "activateConstraints:", v74);

  v75 = objc_alloc(MEMORY[0x1E0DC3518]);
  v76 = (UIButton *)objc_msgSend(v75, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  actionsButton = self->_actionsButton;
  self->_actionsButton = v76;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle.fill"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setImage:", v94);
  -[UIButton setConfiguration:](self->_actionsButton, "setConfiguration:", v93);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTintColor:](self->_actionsButton, "setTintColor:", v78);

  -[UIView addSubview:](self->_overlayView, "addSubview:", self->_actionsButton);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v89 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton widthAnchor](self->_actionsButton, "widthAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView widthAnchor](self->_overlayView, "widthAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v90;
  -[UIButton heightAnchor](self->_actionsButton, "heightAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_overlayView, "heightAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v81;
  -[UIButton centerXAnchor](self->_actionsButton, "centerXAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_overlayView, "centerXAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v84;
  -[UIButton centerYAnchor](self->_actionsButton, "centerYAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self->_overlayView, "centerYAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v87;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "activateConstraints:", v88);

}

- (void)updateAspectConstraintWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *ratioConstraint;
  double v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  height = a3.height;
  width = a3.width;
  v18[1] = *MEMORY[0x1E0C80C00];
  if (self->_ratioConstraint)
  {
    -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeConstraint:", self->_ratioConstraint);

  }
  v7 = height / width;
  if (fabs(height / width) == INFINITY)
    v7 = 1.0;
  if (v7 < 0.5)
    v7 = 0.5;
  v8 = fmin(v7, 2.0);
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKPDFIconCollectionViewCell_iOS imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:multiplier:constant:", v12, v8, 0.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  ratioConstraint = self->_ratioConstraint;
  self->_ratioConstraint = v13;

  LODWORD(v15) = 1148829696;
  -[NSLayoutConstraint setPriority:](self->_ratioConstraint, "setPriority:", v15);
  v16 = (void *)MEMORY[0x1E0CB3718];
  v18[0] = self->_ratioConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v17);

}

- (void)setThumbnailWidth:(double)a3
{
  double v5;
  NSLayoutConstraint *imageViewWidthConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  void *v11;
  void *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSLayoutConstraint constant](self->_imageViewWidthConstraint, "constant");
  if (v5 != a3)
  {
    imageViewWidthConstraint = self->_imageViewWidthConstraint;
    if (imageViewWidthConstraint)
    {
      -[NSLayoutConstraint setConstant:](imageViewWidthConstraint, "setConstant:", a3);
    }
    else
    {
      -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "widthAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", a3);
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v10 = self->_imageViewWidthConstraint;
      self->_imageViewWidthConstraint = v9;

      v11 = (void *)MEMORY[0x1E0CB3718];
      v14[0] = self->_imageViewWidthConstraint;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activateConstraints:", v12);

      LODWORD(v13) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_imageViewWidthConstraint, "setPriority:", v13);
    }
  }
}

- (void)setThumbnailHeight:(double)a3
{
  double v5;
  NSLayoutConstraint *imageViewHeightConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  void *v11;
  void *v12;
  double v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSLayoutConstraint constant](self->_imageViewHeightConstraint, "constant");
  if (v5 != a3)
  {
    imageViewHeightConstraint = self->_imageViewHeightConstraint;
    if (imageViewHeightConstraint)
    {
      -[NSLayoutConstraint setConstant:](imageViewHeightConstraint, "setConstant:", a3);
    }
    else
    {
      -[PPKPDFIconCollectionViewCell_iOS contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "heightAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", a3);
      v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v10 = self->_imageViewHeightConstraint;
      self->_imageViewHeightConstraint = v9;

      v11 = (void *)MEMORY[0x1E0CB3718];
      v14[0] = self->_imageViewHeightConstraint;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activateConstraints:", v12);

      LODWORD(v13) = 1148829696;
      -[NSLayoutConstraint setPriority:](self->_imageViewHeightConstraint, "setPriority:", v13);
    }
  }
}

- (UIButton)actionsButton
{
  return self->_actionsButton;
}

- (void)setActionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionsButton, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (PDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
  objc_storeStrong((id *)&self->_page, a3);
}

- (BOOL)hasLargeThumbnail
{
  return self->_hasLargeThumbnail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_actionsButton, 0);
  objc_storeStrong((id *)&self->_overlayViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_overlayViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_overlayViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_overlayViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_ratioConstraint, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
