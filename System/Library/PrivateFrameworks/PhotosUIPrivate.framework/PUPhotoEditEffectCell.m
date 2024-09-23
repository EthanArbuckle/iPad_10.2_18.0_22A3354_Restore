@implementation PUPhotoEditEffectCell

- (PUPhotoEditEffectCell)initWithFrame:(CGRect)a3
{
  PUPhotoEditEffectCell *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PUPhotoEditEffectCell;
  v3 = -[PUPhotoEditEffectCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditEffectCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    -[PUPhotoEditEffectCell setImageView:](v3, "setImageView:", v5);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v7, "setNumberOfLines:", 2);
    objc_msgSend(v7, "setTextAlignment:", 1);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPhotoEditEffectCell _colorForIsSelected:](v3, "_colorForIsSelected:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoEditingFilterTitleFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v10);

    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v7, "setLineBreakMode:", 0);
    -[PUPhotoEditEffectCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v7);

    -[PUPhotoEditEffectCell setNameLabel:](v3, "setNameLabel:", v7);
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v5, "bounds");
    v13 = (void *)objc_msgSend(v12, "initWithFrame:");
    objc_msgSend(v13, "setAutoresizingMask:", 18);
    objc_msgSend(v4, "photoEditingEffectCellHighlightBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(v5, "addSubview:", v13);
    -[PUPhotoEditEffectCell setHighlightView:](v3, "setHighlightView:", v13);
    v15 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v5, "bounds");
    v16 = (void *)objc_msgSend(v15, "initWithFrame:");
    objc_msgSend(v16, "setAutoresizingMask:", 18);
    objc_msgSend((id)objc_opt_class(), "selectionOutlineImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v17);

    -[PUPhotoEditEffectCell _colorForIsSelected:](v3, "_colorForIsSelected:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v18);

    objc_msgSend(v5, "addSubview:", v16);
    -[PUPhotoEditEffectCell setSelectionView:](v3, "setSelectionView:", v16);
    -[PUPhotoEditEffectCell _setSubview:visible:animated:](v3, "_setSubview:visible:animated:", v13, 0, 0);
    -[PUPhotoEditEffectCell _setSubview:visible:animated:](v3, "_setSubview:visible:animated:", v16, 0, 0);
    -[PUPhotoEditEffectCell setNeedsUpdateConstraints](v3, "setNeedsUpdateConstraints");

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[PUPhotoEditEffectCell setSelected:animated:](self, "setSelected:animated:", 0, 0);
  -[PUPhotoEditEffectCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditEffectCell;
  -[PUPhotoEditEffectCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *constraints;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *gapConstraint;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *bottomLabelConstraint;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PUPhotoEditEffectCell;
  -[PUPhotoEditEffectCell updateConstraints](&v37, sel_updateConstraints);
  if (!self->_constraints)
  {
    -[PUPhotoEditEffectCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditEffectCell imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v3, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditEffectCell nameLabel](self, "nameLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v3;
    objc_msgSend(v3, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:multiplier:constant:", v9, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSArray *)objc_msgSend(v30, "initWithObjects:", v28, v5, v7, v10, 0);
    constraints = self->_constraints;
    self->_constraints = v11;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  }
  if (!self->_gapConstraint)
  {
    -[PUPhotoEditEffectCell nameLabel](self, "nameLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditEffectCell imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 0.0);
    v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    gapConstraint = self->_gapConstraint;
    self->_gapConstraint = v17;

    -[NSLayoutConstraint setActive:](self->_gapConstraint, "setActive:", 1);
  }
  if (!self->_bottomLabelConstraint)
  {
    -[PUPhotoEditEffectCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditEffectCell nameLabel](self, "nameLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    bottomLabelConstraint = self->_bottomLabelConstraint;
    self->_bottomLabelConstraint = v23;

  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "orientation");

  if ((unint64_t)(v26 - 3) >= 2)
    v27 = 5.0;
  else
    v27 = 0.0;
  -[NSLayoutConstraint setActive:](self->_bottomLabelConstraint, "setActive:", (unint64_t)(v26 - 3) < 2);
  -[NSLayoutConstraint setConstant:](self->_gapConstraint, "setConstant:", v27);
}

- (void)setImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[PUPhotoEditEffectCell imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)setName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  id v7;

  if (self->_name != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    name = self->_name;
    self->_name = v5;

    -[PUPhotoEditEffectCell nameLabel](self, "nameLabel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v4);

  }
}

- (void)setSelected:(BOOL)a3
{
  -[PUPhotoEditEffectCell setSelected:animated:](self, "setSelected:animated:", a3, 1);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  if (-[PUPhotoEditEffectCell isSelected](self, "isSelected") != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PUPhotoEditEffectCell;
    -[PUPhotoEditEffectCell setSelected:](&v10, sel_setSelected_, v5);
    -[PUPhotoEditEffectCell _colorForIsSelected:](self, "_colorForIsSelected:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditEffectCell nameLabel](self, "nameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[PUPhotoEditEffectCell selectionView](self, "selectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditEffectCell _setSubview:visible:animated:](self, "_setSubview:visible:animated:", v9, v5, v4);

  }
}

- (id)_colorForIsSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "photoEditingActiveFilterTitleColor");
  else
    objc_msgSend(v4, "photoEditingInactiveFilterTitleColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[PUPhotoEditEffectCell isHighlighted](self, "isHighlighted") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PUPhotoEditEffectCell;
    -[PUPhotoEditEffectCell setHighlighted:](&v6, sel_setHighlighted_, v3);
    -[PUPhotoEditEffectCell highlightView](self, "highlightView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditEffectCell _setSubview:visible:animated:](self, "_setSubview:visible:animated:", v5, v3, 1);

  }
}

- (void)_setSubview:(id)a3 visible:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  double v14;

  v6 = a4;
  v7 = a3;
  v8 = v7;
  if (v6)
    v9 = 1.0;
  else
    v9 = 0.0;
  if (a5)
  {
    if (v6)
      v10 = 131078;
    else
      v10 = 65542;
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PUPhotoEditEffectCell__setSubview_visible_animated___block_invoke;
    v12[3] = &unk_1E58AACF0;
    v13 = v7;
    v14 = v9;
    objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v10, v12, 0, 0.3, 0.0, 1.0, v9);

  }
  else
  {
    objc_msgSend(v7, "setAlpha:", v9);
  }

}

- (UIImage)image
{
  return self->_image;
}

- (NSString)name
{
  return self->_name;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (UIImageView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_gapConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLabelConstraint, 0);
}

uint64_t __54__PUPhotoEditEffectCell__setSubview_visible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

+ (id)selectionOutlineImage
{
  id v2;
  void *v3;
  double v4;
  CGFloat v5;
  CGContext *CurrentContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGSize v14;
  CGRect v15;
  CGRect v16;

  if (PUFiltersCellSelectionOutlineImage)
  {
    v2 = (id)PUFiltersCellSelectionOutlineImage;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;
    v14.width = 7.0;
    v14.height = 7.0;
    UIGraphicsBeginImageContextWithOptions(v14, 0, v5);

    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStroke");

    CGContextSetLineWidth(CurrentContext, 3.0);
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    v15.size.width = 7.0;
    v15.size.height = 7.0;
    v16 = CGRectInset(v15, 1.5, 1.5);
    CGContextStrokeRectWithWidth(CurrentContext, v16, 3.0);
    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(v8, "resizableImageWithCapInsets:", 3.0, 3.0, 3.0, 3.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)PUFiltersCellSelectionOutlineImage;
    PUFiltersCellSelectionOutlineImage = (uint64_t)v10;
    v12 = v10;

    v2 = (id)PUFiltersCellSelectionOutlineImage;
  }
  return v2;
}

@end
