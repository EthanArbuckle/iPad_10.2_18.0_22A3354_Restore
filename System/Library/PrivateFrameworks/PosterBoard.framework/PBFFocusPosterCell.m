@implementation PBFFocusPosterCell

+ (double)cornerRadius
{
  return 16.0;
}

+ (CGSize)estimatedCellSizeForItemWidth:(double)a3 screen:(id)a4 hasAccessory:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGSize result;

  v5 = a5;
  v9 = a4;
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "bounds");
    if (v5)
      v13 = v12 / v11 * a3 + 54.0;
    else
      v13 = v12 / v11 * a3;

    v14 = a3;
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("screen != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFFocusPosterCell estimatedCellSizeForItemWidth:screen:hasAccessory:].cold.1(a2, (uint64_t)a1, (uint64_t)v16);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  result.height = v15;
  result.width = v14;
  return result;
}

- (PBFFocusPosterCell)initWithFrame:(CGRect)a3
{
  PBFFocusPosterCell *v3;
  PBFFocusPosterCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFFocusPosterCell;
  v3 = -[PBFFocusPosterCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBFFocusPosterCell createShadowView](v3, "createShadowView");
    -[PBFFocusPosterCell createPosterView](v4, "createPosterView");
    -[PBFFocusPosterCell createPreviewComplicationContentView](v4, "createPreviewComplicationContentView");
    -[PBFFocusPosterCell createConstraints](v4, "createConstraints");
  }
  return v4;
}

- (PBFFocusPosterCell)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PBFFocusPosterCell *v8;
  objc_super v10;

  v4 = (void *)MEMORY[0x1E0CB3488];
  v5 = a3;
  objc_msgSend(v4, "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFFocusPosterCell initWithCoder:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PBFFocusPosterCell.m"), 72, CFSTR("%s: not supported"), "-[PBFFocusPosterCell initWithCoder:]");

  v10.receiver = self;
  v10.super_class = (Class)PBFFocusPosterCell;
  v8 = -[PBFFocusPosterCell initWithCoder:](&v10, sel_initWithCoder_, v5);

  return v8;
}

- (void)createShadowView
{
  UIView *v3;
  UIView *shadowView;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  v3 = (UIView *)objc_opt_new();
  shadowView = self->_shadowView;
  self->_shadowView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_shadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView _setContinuousCornerRadius:](self->_shadowView, "_setContinuousCornerRadius:", 16.0);
  -[UIView layer](self->_shadowView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowPathIsBounds:", 1);

  -[UIView layer](self->_shadowView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

  -[UIView layer](self->_shadowView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShadowOffset:", 0.0, 4.0);

  -[UIView layer](self->_shadowView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShadowRadius:", 10.0);

  -[UIView layer](self->_shadowView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1036831949;
  objc_msgSend(v10, "setShadowOpacity:", v11);

  -[PBFFocusPosterCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_shadowView);

  -[PBFFocusPosterCell contentView](self, "contentView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendSubviewToBack:", self->_shadowView);

}

- (void)createPosterView
{
  UIImageView *v3;
  UIImageView *posterView;
  UIImageView *v5;
  void *v6;
  id v7;

  v3 = (UIImageView *)objc_opt_new();
  posterView = self->_posterView;
  self->_posterView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_posterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_posterView;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UIImageView setClipsToBounds:](self->_posterView, "setClipsToBounds:", 1);
  -[UIImageView _setContinuousCornerRadius:](self->_posterView, "_setContinuousCornerRadius:", 16.0);
  -[PBFFocusPosterCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_posterView);

}

- (void)createPreviewComplicationContentView
{
  PBFPosterGalleryPreviewComplicationContentView *v3;
  PBFPosterGalleryPreviewComplicationContentView *v4;
  PBFPosterGalleryPreviewComplicationContentView *posterPreviewComplicationContentView;
  id v6;

  v3 = [PBFPosterGalleryPreviewComplicationContentView alloc];
  v4 = -[PBFPosterGalleryPreviewComplicationContentView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  posterPreviewComplicationContentView = self->_posterPreviewComplicationContentView;
  self->_posterPreviewComplicationContentView = v4;

  -[PBFPosterGalleryPreviewComplicationContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_posterPreviewComplicationContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PBFPosterGalleryPreviewComplicationContentView setPreferredCornerRadius:](self->_posterPreviewComplicationContentView, "setPreferredCornerRadius:", 1);
  -[PBFPosterGalleryPreviewComplicationContentView setLayoutOrientation:](self->_posterPreviewComplicationContentView, "setLayoutOrientation:", -[PBFFocusPosterCell layoutOrientation](self, "layoutOrientation"));
  -[PBFFocusPosterCell contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_posterPreviewComplicationContentView);

}

- (void)createCheckboxViewIfNecessary
{
  PBFFocusCheckboxView *v3;
  PBFFocusCheckboxView *checkboxView;
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
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (!self->_checkboxView)
  {
    v3 = (PBFFocusCheckboxView *)objc_opt_new();
    checkboxView = self->_checkboxView;
    self->_checkboxView = v3;

    -[PBFFocusCheckboxView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkboxView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PBFFocusCheckboxView setOn:](self->_checkboxView, "setOn:", self->_checkboxOn);
    -[PBFFocusPosterCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_checkboxView);

    v16 = (void *)MEMORY[0x1E0CB3718];
    -[PBFFocusCheckboxView centerXAnchor](self->_checkboxView, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerXAnchor](self->_posterView, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    -[PBFFocusCheckboxView topAnchor](self->_checkboxView, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](self->_posterView, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v10;
    -[PBFFocusCheckboxView bottomAnchor](self->_checkboxView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusPosterCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v15);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PBFFocusPosterCell;
  -[PBFFocusPosterCell setUserInteractionEnabled:](&v8, sel_setUserInteractionEnabled_);
  -[PBFFocusPosterCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.5;
  if (v3)
    v7 = 1.0;
  objc_msgSend(v5, "setAlpha:", v7);

}

- (void)createFocusSymbolViewIfNecessary
{
  UIImageView *v3;
  UIImageView *focusSymbolView;
  UIImageView *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!self->_focusSymbolView)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    focusSymbolView = self->_focusSymbolView;
    self->_focusSymbolView = v3;

    v5 = self->_focusSymbolView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v5, "setTintColor:", v6);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_focusSymbolView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView layer](self->_focusSymbolView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    -[UIImageView layer](self->_focusSymbolView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowOffset:", 0.0, 1.0);

    -[UIImageView layer](self->_focusSymbolView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowRadius:", 4.0);

    -[UIImageView layer](self->_focusSymbolView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1045220557;
    objc_msgSend(v11, "setShadowOpacity:", v12);

    -[PBFFocusPosterCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_focusSymbolView);

    v14 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView centerXAnchor](self->_focusSymbolView, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerXAnchor](self->_posterView, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    -[UIImageView bottomAnchor](self->_focusSymbolView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](self->_posterView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -12.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateConstraints:", v21);

  }
}

- (void)createConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[14];

  v47[12] = *MEMORY[0x1E0C80C00];
  -[UIImageView bottomAnchor](self->_posterView, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = 1144733696;
  v40 = v6;
  objc_msgSend(v6, "setPriority:", v7);
  v30 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView leadingAnchor](self->_posterView, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v43;
  -[UIImageView topAnchor](self->_posterView, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterCell contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v38;
  -[UIImageView trailingAnchor](self->_posterView, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFFocusPosterCell contentView](self, "contentView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v34;
  v47[3] = v6;
  -[UIView leadingAnchor](self->_shadowView, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_posterView, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v31;
  -[UIView topAnchor](self->_shadowView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView topAnchor](self->_posterView, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v27;
  -[UIView trailingAnchor](self->_shadowView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_posterView, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v24;
  -[UIView bottomAnchor](self->_shadowView, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_posterView, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v21;
  -[PBFPosterGalleryPreviewComplicationContentView leadingAnchor](self->_posterPreviewComplicationContentView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_posterView, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v18;
  -[PBFPosterGalleryPreviewComplicationContentView topAnchor](self->_posterPreviewComplicationContentView, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView topAnchor](self->_posterView, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v10;
  -[PBFPosterGalleryPreviewComplicationContentView trailingAnchor](self->_posterPreviewComplicationContentView, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_posterView, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v13;
  -[PBFPosterGalleryPreviewComplicationContentView bottomAnchor](self->_posterPreviewComplicationContentView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_posterView, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v17);

}

- (void)setActionType:(int64_t)a3
{
  PBFFocusCheckboxView *checkboxView;

  if (self->_actionType != a3)
  {
    self->_actionType = a3;
    if (a3 == 1)
    {
      -[PBFFocusPosterCell createCheckboxViewIfNecessary](self, "createCheckboxViewIfNecessary");
    }
    else if (!a3)
    {
      -[PBFFocusCheckboxView removeFromSuperview](self->_checkboxView, "removeFromSuperview");
      checkboxView = self->_checkboxView;
      self->_checkboxView = 0;

    }
  }
}

- (void)setPosterPreview:(id)a3
{
  PBFPosterGalleryPreviewComplicationContentView *posterPreviewComplicationContentView;
  void *v6;
  PBFPosterPreview *v7;

  v7 = (PBFPosterPreview *)a3;
  if (self->_posterPreview != v7)
  {
    objc_storeStrong((id *)&self->_posterPreview, a3);
    -[PBFPosterGalleryPreviewComplicationContentView setLayoutOrientation:](self->_posterPreviewComplicationContentView, "setLayoutOrientation:", -[PBFFocusPosterCell layoutOrientation](self, "layoutOrientation"));
    -[PBFPosterGalleryPreviewComplicationContentView setPosterPreview:](self->_posterPreviewComplicationContentView, "setPosterPreview:", v7);
    posterPreviewComplicationContentView = self->_posterPreviewComplicationContentView;
    -[PBFFocusPosterCell posterPreviewGenerator](self, "posterPreviewGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterGalleryPreviewComplicationContentView prepareComplicationPreviewWithGenerator:](posterPreviewComplicationContentView, "prepareComplicationPreviewWithGenerator:", v6);

  }
}

- (void)setPosterImage:(id)a3
{
  UIImage *v5;
  NSLayoutConstraint *posterViewHeightConstraint;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *v13;
  UIImage *v14;

  v5 = (UIImage *)a3;
  if (self->_posterImage != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_posterImage, a3);
    -[UIImageView setImage:](self->_posterView, "setImage:", v14);
    -[NSLayoutConstraint setActive:](self->_posterViewHeightConstraint, "setActive:", 0);
    posterViewHeightConstraint = self->_posterViewHeightConstraint;
    self->_posterViewHeightConstraint = 0;

    if (v14)
    {
      -[UIImage size](v14, "size");
      v9 = v8 / v7;
      -[UIImageView heightAnchor](self->_posterView, "heightAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView widthAnchor](self->_posterView, "widthAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:multiplier:constant:", v11, v9, 0.0);
      v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v13 = self->_posterViewHeightConstraint;
      self->_posterViewHeightConstraint = v12;

      -[NSLayoutConstraint setActive:](self->_posterViewHeightConstraint, "setActive:", 1);
    }
    -[PBFFocusPosterCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v14;
  }

}

- (void)setFocusSymbolImageName:(id)a3
{
  NSString *v4;
  NSString *focusSymbolImageName;
  void *v6;
  UIImageView *focusSymbolView;
  void *v8;
  id v9;

  v9 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    focusSymbolImageName = self->_focusSymbolImageName;
    self->_focusSymbolImageName = v4;

    if (v9)
    {
      -[PBFFocusPosterCell createFocusSymbolViewIfNecessary](self, "createFocusSymbolViewIfNecessary");
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      focusSymbolView = self->_focusSymbolView;
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v9, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](focusSymbolView, "setImage:", v8);

    }
    else
    {
      -[UIImageView removeFromSuperview](self->_focusSymbolView, "removeFromSuperview");
      v6 = self->_focusSymbolView;
      self->_focusSymbolView = 0;
    }

  }
}

- (void)setCheckboxAssociatedPosterIdentifier:(id)a3
{
  -[PBFFocusCheckboxView setAssociatedPosterIdentifier:](self->_checkboxView, "setAssociatedPosterIdentifier:", a3);
}

- (void)setCheckboxOn:(BOOL)a3
{
  if (self->_checkboxOn != a3)
  {
    self->_checkboxOn = a3;
    -[PBFFocusCheckboxView setOn:](self->_checkboxView, "setOn:");
  }
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    -[PBFPosterGalleryPreviewComplicationContentView setLayoutOrientation:](self->_posterPreviewComplicationContentView, "setLayoutOrientation:");
  }
}

- (CGRect)posterPreviewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIImageView frame](self->_posterView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)makeComplicationsPortalView
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42D8]), "initWithSourceView:", self->_posterPreviewComplicationContentView);
  objc_msgSend(v2, "setHidesSourceView:", 0);
  objc_msgSend(v2, "setMatchesPosition:", 0);
  objc_msgSend(v2, "setMatchesTransform:", 0);
  objc_msgSend(v2, "setAllowsBackdropGroups:", 1);
  return v2;
}

- (PBFPosterPreviewGenerator)posterPreviewGenerator
{
  return (PBFPosterPreviewGenerator *)objc_loadWeakRetained((id *)&self->_posterPreviewGenerator);
}

- (void)setPosterPreviewGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_posterPreviewGenerator, a3);
}

- (PBFPosterPreview)posterPreview
{
  return self->_posterPreview;
}

- (UIImage)posterImage
{
  return self->_posterImage;
}

- (UIImageView)posterView
{
  return self->_posterView;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (BOOL)isCheckboxOn
{
  return self->_checkboxOn;
}

- (NSString)focusSymbolImageName
{
  return self->_focusSymbolImageName;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusSymbolImageName, 0);
  objc_storeStrong((id *)&self->_posterImage, 0);
  objc_storeStrong((id *)&self->_posterPreview, 0);
  objc_destroyWeak((id *)&self->_posterPreviewGenerator);
  objc_storeStrong((id *)&self->_posterViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_focusSymbolView, 0);
  objc_storeStrong((id *)&self->_checkboxView, 0);
  objc_storeStrong((id *)&self->_posterPreviewComplicationContentView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

+ (void)estimatedCellSizeForItemWidth:(const char *)a1 screen:(uint64_t)a2 hasAccessory:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PBFFocusPosterCell.m");
  v16 = 1024;
  v17 = 46;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
