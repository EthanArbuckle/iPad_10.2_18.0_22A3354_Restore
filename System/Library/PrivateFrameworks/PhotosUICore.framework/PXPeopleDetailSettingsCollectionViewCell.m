@implementation PXPeopleDetailSettingsCollectionViewCell

- (PXPeopleDetailSettingsCollectionViewCell)initWithFrame:(CGRect)a3
{
  PXPeopleDetailSettingsCollectionViewCell *v3;
  PXPeopleDetailSettingsCollectionViewCell *v4;
  void *v10;
  NSNumberFormatter *v11;
  NSNumberFormatter *quantityNumberFormatter;
  void *v13;
  UIImageView *v14;
  UIImageView *avatarView;
  UIImageView *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *nameLabel;
  UILabel *v21;
  NSString *name;
  UILabel *v23;
  void *v24;
  void *v25;
  UILabel *quantityLabel;
  UILabel *v27;
  UIView *v28;
  UIView *actionIndicatorView;
  void *v30;
  id v31;
  UIView *v32;
  UIView *selectionView;
  void *v34;
  id v35;
  void *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  v3 = -[PXPeopleDetailSettingsCollectionViewCell initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_unitRect.origin.x = 0.0;
    v3->_unitRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v3->_unitRect.size = _Q0;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    quantityNumberFormatter = v4->_quantityNumberFormatter;
    v4->_quantityNumberFormatter = v11;

    -[NSNumberFormatter setLocale:](v4->_quantityNumberFormatter, "setLocale:", v10);
    -[NSNumberFormatter setFormatterBehavior:](v4->_quantityNumberFormatter, "setFormatterBehavior:", 1040);
    -[NSNumberFormatter setNumberStyle:](v4->_quantityNumberFormatter, "setNumberStyle:", 1);
    -[PXPeopleDetailSettingsCollectionViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    avatarView = v4->_avatarView;
    v4->_avatarView = v14;

    -[UIImageView setContentMode:](v4->_avatarView, "setContentMode:", 1);
    v16 = v4->_avatarView;
    -[PXPeopleDetailSettingsCollectionViewCell _placeHolderColor](v4, "_placeHolderColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    objc_msgSend(v13, "addSubview:", v4->_avatarView);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTextAlignment:](v18, "setTextAlignment:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    -[UILabel setHidden:](v18, "setHidden:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v18, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setText:](v18, "setText:", &stru_1E5149688);
    -[UILabel setAdjustsFontSizeToFitWidth:](v18, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v13, "addSubview:", v18);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v18;
    v21 = v18;

    name = v4->_name;
    v4->_name = (NSString *)&stru_1E5149688;

    v23 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[NSNumberFormatter stringFromNumber:](v4->_quantityNumberFormatter, "stringFromNumber:", &unk_1E53EAD10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v23, "setText:", v24);

    -[UILabel setTextAlignment:](v23, "setTextAlignment:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v23, "setTextColor:", v25);

    -[UILabel setAdjustsFontForContentSizeCategory:](v23, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v13, "addSubview:", v23);
    quantityLabel = v4->_quantityLabel;
    v4->_quantityLabel = v23;
    v27 = v23;

    v28 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    actionIndicatorView = v4->_actionIndicatorView;
    v4->_actionIndicatorView = v28;

    -[UIView setHidden:](v4->_actionIndicatorView, "setHidden:", 1);
    -[UIView layer](v4->_actionIndicatorView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDetailSettingsCollectionViewCell tintColor](v4, "tintColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v30, "setBackgroundColor:", objc_msgSend(v31, "CGColor"));

    objc_msgSend(v13, "addSubview:", v4->_actionIndicatorView);
    v32 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    selectionView = v4->_selectionView;
    v4->_selectionView = v32;

    -[UIView setHidden:](v4->_selectionView, "setHidden:", 1);
    -[UIView layer](v4->_selectionView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleDetailSettingsCollectionViewCell tintColor](v4, "tintColor");
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v34, "setBorderColor:", objc_msgSend(v35, "CGColor"));

    objc_msgSend(v34, "setBorderWidth:", 2.0);
    objc_msgSend(v13, "addSubview:", v4->_selectionView);
    -[PXPeopleDetailSettingsCollectionViewCell _updateType](v4, "_updateType");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  -[PXPeopleDetailSettingsCollectionViewCell dealloc](&v4, sel_dealloc);
}

- (void)setIsFavorite:(BOOL)a3
{
  if (self->_isFavorite != a3)
  {
    self->_isFavorite = a3;
    -[PXPeopleDetailSettingsCollectionViewCell _updateType](self, "_updateType");
    -[PXPeopleDetailSettingsCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int v16;
  void *v17;
  void *v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double Width;
  double Height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  CGFloat v40;
  double MinX;
  double v42;
  float v43;
  float v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  float v55;
  float v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v63.receiver = self;
  v63.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  -[PXPeopleDetailSettingsCollectionViewCell layoutSubviews](&v63, sel_layoutSubviews);
  -[PXPeopleDetailSettingsCollectionViewCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsCollectionViewCell quantityLabel](self, "quantityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsCollectionViewCell nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsCollectionViewCell actionIndicatorView](self, "actionIndicatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsCollectionViewCell selectionView](self, "selectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsCollectionViewCell bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = objc_msgSend(v5, "isHidden");
  objc_msgSend(v5, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v17);
  objc_msgSend(v4, "setFont:", v18);
  v19 = -[PXPeopleDetailSettingsCollectionViewCell _preferredSizeClass](self, "_preferredSizeClass");
  if (v19 == 1)
    v20 = 20.0;
  else
    v20 = 30.0;
  if (v19 == 1)
    v21 = 16.0;
  else
    v21 = 20.0;
  objc_msgSend(v17, "_scaledValueForValue:", v20);
  v23 = v22;
  objc_msgSend(v18, "_scaledValueForValue:", v20);
  v58 = v24;
  objc_msgSend(v18, "_scaledValueForValue:", v21);
  v26 = v25;
  v64.origin.x = v9;
  v64.origin.y = v11;
  v64.size.width = v13;
  v64.size.height = v15;
  Width = CGRectGetWidth(v64);
  v65.origin.x = v9;
  v65.origin.y = v11;
  v65.size.width = v13;
  v65.size.height = v15;
  Height = CGRectGetHeight(v65);
  objc_msgSend(v4, "sizeThatFits:", Width, 1.79769313e308);
  v30 = v29;
  objc_msgSend(v4, "sizeThatFits:", 1.79769313e308);
  v59 = v31;
  *(float *)&v31 = v30 * 0.5;
  v62 = floorf(*(float *)&v31);
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  v33 = v32;
  objc_msgSend(v5, "sizeThatFits:", 1.79769313e308);
  v60 = v34;
  v61 = v26;
  if (Height - (v23 + v26) >= Width)
    v35 = Width;
  else
    v35 = Height - (v23 + v26);
  objc_msgSend(v3, "setFrame:", (Width - v35) * 0.5, 0.0, v35, v35);
  objc_msgSend(v3, "layer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCornerRadius:", v35 * 0.5);

  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_msgSend(v3, "frame");
  v67 = CGRectInset(v66, -2.0, -2.0);
  v37 = v67.size.width;
  objc_msgSend(v7, "setFrame:", v67.origin.x, v67.origin.y);
  objc_msgSend(v7, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCornerRadius:", v37 * 0.5);

  if (v16)
  {
    objc_msgSend(v18, "ascender");
    *(float *)&v39 = v58 + v35 - v39;
    v40 = floorf(*(float *)&v39);
    objc_msgSend(v3, "frame");
    MinX = CGRectGetMinX(v68);
    objc_msgSend(v4, "setFrame:", MinX, v40, Width, v30);
    v69.origin.x = MinX;
    v69.origin.y = v40;
    v69.size.width = Width;
    v69.size.height = v30;
    v42 = v62;
    v43 = CGRectGetMidX(v69) - v59 * 0.5 - v62 + -5.0;
    v44 = floorf(v43);
    v45 = MinX;
    v46 = v40;
    v47 = Width;
    v48 = v30;
  }
  else
  {
    v49 = v23 + v35;
    objc_msgSend(v17, "ascender");
    *(float *)&v50 = v49 - v50;
    v51 = floorf(*(float *)&v50);
    objc_msgSend(v3, "frame");
    v52 = CGRectGetMinX(v70);
    objc_msgSend(v5, "setFrame:", v52, v51, Width, v33);
    objc_msgSend(v18, "ascender");
    *(float *)&v53 = v61 + v49 - v53;
    v54 = floorf(*(float *)&v53);
    objc_msgSend(v3, "frame");
    objc_msgSend(v4, "setFrame:", CGRectGetMinX(v71), v54, Width, v30);
    v72.origin.x = v52;
    v72.origin.y = v51;
    v72.size.width = Width;
    v72.size.height = v33;
    v42 = v62;
    v55 = CGRectGetMidX(v72) - v60 * 0.5 - v62 + -5.0;
    v44 = floorf(v55);
    v45 = v52;
    v46 = v51;
    v47 = Width;
    v48 = v33;
  }
  v56 = CGRectGetMidY(*(CGRect *)&v45) - v62 * 0.5;
  objc_msgSend(v6, "setFrame:", v44, floorf(v56), v42, v42);
  objc_msgSend(v6, "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setCornerRadius:", v62 * 0.5);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  -[PXPeopleDetailSettingsCollectionViewCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXPeopleDetailSettingsCollectionViewCell _updateType](self, "_updateType");
}

- (void)prepareForReuse
{
  NSString *name;
  UILabel *quantityLabel;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  -[PXPeopleDetailSettingsCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[UIImageView setImage:](self->_avatarView, "setImage:", 0);
  name = self->_name;
  self->_name = (NSString *)&stru_1E5149688;

  -[UILabel setText:](self->_nameLabel, "setText:", &stru_1E5149688);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 1);
  self->_photoQuantity = 0;
  quantityLabel = self->_quantityLabel;
  -[NSNumberFormatter stringFromNumber:](self->_quantityNumberFormatter, "stringFromNumber:", &unk_1E53EAD10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](quantityLabel, "setText:", v5);

  -[PXPeopleDetailSettingsCollectionViewCell setHidden:](self, "setHidden:", 0);
}

- (void)setName:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSString *v10;

  v5 = (NSString *)a3;
  v10 = v5;
  if (self->_name != v5 || (v6 = -[NSString isEqualToString:](v5, "isEqualToString:", v5), v7 = v10, !v6))
  {
    objc_storeStrong((id *)&self->_name, a3);
    -[PXPeopleDetailSettingsCollectionViewCell nameLabel](self, "nameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSString length](v10, "length");
    if (v9)
      objc_msgSend(v8, "setText:", v10);
    objc_msgSend(v8, "setHidden:", v9 == 0);
    -[PXPeopleDetailSettingsCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

    v7 = v10;
  }

}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXPeopleDetailSettingsCollectionViewCell avatarView](self, "avatarView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v4);

  objc_msgSend(v6, "setContentMode:", 1);
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsRect:", self->_unitRect.origin.x, self->_unitRect.origin.y, self->_unitRect.size.width, self->_unitRect.size.height);

}

- (void)setImage:(id)a3 normalizedFaceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PXPeopleDetailSettingsCollectionViewCell avatarView](self, "avatarView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v9);

  objc_msgSend(v11, "setContentMode:", 2);
  objc_msgSend(v10, "setContentsRect:", x, y, width, height);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[PXPeopleDetailSettingsCollectionViewCell avatarView](self, "avatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setPhotoQuantity:(unint64_t)a3
{
  NSNumberFormatter *quantityNumberFormatter;
  void *v5;
  void *v6;
  id v7;

  self->_photoQuantity = a3;
  quantityNumberFormatter = self->_quantityNumberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](quantityNumberFormatter, "stringFromNumber:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPeopleDetailSettingsCollectionViewCell quantityLabel](self, "quantityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

}

- (void)setActionIndicatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXPeopleDetailSettingsCollectionViewCell actionIndicatorView](self, "actionIndicatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isActionIndicatorHidden
{
  void *v2;
  char v3;

  -[PXPeopleDetailSettingsCollectionViewCell actionIndicatorView](self, "actionIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setTextAlpha:(double)a3
{
  void *v4;
  id v5;

  self->_textAlpha = a3;
  -[PXPeopleDetailSettingsCollectionViewCell nameLabel](self, "nameLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", self->_textAlpha);

  -[PXPeopleDetailSettingsCollectionViewCell quantityLabel](self, "quantityLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", self->_textAlpha);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleDetailSettingsCollectionViewCell;
  -[PXPeopleDetailSettingsCollectionViewCell setSelected:](&v6, sel_setSelected_);
  -[PXPeopleDetailSettingsCollectionViewCell selectionView](self, "selectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v3);

}

- (double)avatarCenterYOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PXPeopleDetailSettingsCollectionViewCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v5 = v4;
  -[PXPeopleDetailSettingsCollectionViewCell bounds](self, "bounds");
  v7 = v5 + v6 * -0.5;

  return v7;
}

- (int64_t)_preferredSizeClass
{
  void *v2;
  int64_t v3;

  -[PXPeopleDetailSettingsCollectionViewCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "horizontalSizeClass") == 2)
  {
    if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
      v3 = 2;
    else
      v3 = 1;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)_updateType
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[PXPeopleDetailSettingsCollectionViewCell _preferredSizeClass](self, "_preferredSizeClass") == 1)
  {
    v3 = (_QWORD *)MEMORY[0x1E0DC4AB8];
    if (self->_isFavorite)
      v4 = (_QWORD *)MEMORY[0x1E0DC4B10];
    else
      v4 = (_QWORD *)MEMORY[0x1E0DC4AB8];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (self->_isFavorite)
      v5 = v3;
    else
      v5 = (_QWORD *)MEMORY[0x1E0DC4A98];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (_QWORD *)MEMORY[0x1E0DC4B10];
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleDetailSettingsCollectionViewCell nameLabel](self, "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);

  -[PXPeopleDetailSettingsCollectionViewCell quantityLabel](self, "quantityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

}

- (id)_placeHolderColor
{
  if (_placeHolderColor_token != -1)
    dispatch_once(&_placeHolderColor_token, &__block_literal_global_357);
  return (id)_placeHolderColor_placeHolderColor;
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)photoQuantity
{
  return self->_photoQuantity;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (UILabel)quantityLabel
{
  return self->_quantityLabel;
}

- (void)setQuantityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_quantityLabel, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UIView)actionIndicatorView
{
  return self->_actionIndicatorView;
}

- (void)setActionIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_actionIndicatorView, a3);
}

- (UIView)selectionView
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
  objc_storeStrong((id *)&self->_actionIndicatorView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_quantityLabel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_quantityNumberFormatter, 0);
}

void __61__PXPeopleDetailSettingsCollectionViewCell__placeHolderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.899999976, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_placeHolderColor_placeHolderColor;
  _placeHolderColor_placeHolderColor = v0;

}

+ (double)preferredHeightForWidth:(double)a3 forAvatarPercentage:(double)a4 withSizeClass:(int64_t)a5 isFavorite:(BOOL)a6
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;

  v8 = (_QWORD *)MEMORY[0x1E0DC4A88];
  v9 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  if (a6)
    v10 = (_QWORD *)MEMORY[0x1E0DC4B10];
  else
    v10 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  if (!a6)
    v9 = (_QWORD *)MEMORY[0x1E0DC4A98];
  if (a5 == 1)
  {
    v8 = v10;
    v11 = v9;
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x1E0DC4B10];
  }
  if (a5 == 1)
    v12 = 36.0;
  else
    v12 = 50.0;
  if (a5 == 1)
    v13 = 16.0;
  else
    v13 = 20.0;
  if (a5 == 1)
    v14 = 20.0;
  else
    v14 = 30.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v8, 30.0, 20.0, 50.0, 16.0, 36.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 > 0.0 && a4 < 1.0)
    v18 = a4;
  else
    v18 = 0.65;
  objc_msgSend(v15, "_scaledValueForValue:", v14);
  v20 = v19;
  objc_msgSend(v16, "_scaledValueForValue:", v13);
  v22 = v18 / (1.0 - v18) * v12 + v20 - v14 + v21 - v13;
  if (v22 >= a3)
    v22 = a3;
  v23 = v12 + v22;
  v24 = ceilf(v23);

  return v24;
}

@end
