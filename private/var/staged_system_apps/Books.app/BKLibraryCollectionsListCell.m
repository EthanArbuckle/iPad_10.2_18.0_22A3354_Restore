@implementation BKLibraryCollectionsListCell

- (void)dealloc
{
  objc_super v3;

  -[UITextField setDelegate:](self->_textEntryField, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryCollectionsListCell;
  -[BKLibraryCollectionsListCell dealloc](&v3, "dealloc");
}

- (void)p_buildSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UIImageView *v7;
  UILabel *v8;
  double v9;
  double v10;
  UILabel *v11;
  UIImageView *v12;
  UIImageView *imageView;
  UIImageView *v14;
  UILabel *textLabel;
  UILabel *v16;
  UILabel *detailTextLabel;
  UILabel *v18;
  UIImageView *chevron;
  UIImageView *v20;
  void *v21;
  NSDictionary *v22;
  void *v23;
  NSDictionary *v24;
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
  id v35;

  if (!self->_imageView)
  {
    v35 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell contentView](self, "contentView"));
    v3 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v7 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 1131413504;
    -[UILabel setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 0, v9);
    LODWORD(v10) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    -[UILabel setNumberOfLines:](v8, "setNumberOfLines:", 3);
    -[UILabel setLineBreakMode:](v8, "setLineBreakMode:", 5);
    -[UILabel setTextAlignment:](v8, "setTextAlignment:", 4);
    -[UILabel setAdjustsFontSizeToFitWidth:](v8, "setAdjustsFontSizeToFitWidth:", 0);
    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v11, "setTextAlignment:", 2);
    v12 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    imageView = self->_imageView;
    self->_imageView = v7;
    v14 = v7;

    textLabel = self->_textLabel;
    self->_textLabel = v8;
    v16 = v8;

    detailTextLabel = self->_detailTextLabel;
    self->_detailTextLabel = v11;
    v18 = v11;

    chevron = self->_chevron;
    self->_chevron = v12;
    v20 = v12;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell metrics](self, "metrics"));
    -[BKLibraryCollectionsListCell p_updateCellFromMetrics:](self, "p_updateCellFromMetrics:", v21);

    objc_msgSend(v35, "addSubview:", v14);
    objc_msgSend(v35, "addSubview:", v16);
    objc_msgSend(v35, "addSubview:", v18);
    objc_msgSend(v35, "addSubview:", v20);
    v22 = _NSDictionaryOfVariableBindings(CFSTR("contentsImageViewHorizontalInset, contentsVerticalInset, contentsChevronHorizontalInset"), &off_10092F708, &off_10092F718, &off_10092F708, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = _NSDictionaryOfVariableBindings(CFSTR("imageView, textLabel, detailTextLabel, chevron"), v14, v16, v18, v20, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(contentsImageViewHorizontalInset)-[imageView]-[textLabel]-[detailTextLabel]-[chevron]-(contentsChevronHorizontalInset)-|"), 0, v23, v25));
    objc_msgSend(v35, "addConstraints:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=contentsVerticalInset)-[imageView]-(>=contentsVerticalInset)-|"), 0, v23, v25));
    objc_msgSend(v35, "addConstraints:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 10, 0, v35, 10, 1.0, 0.0));
    objc_msgSend(v35, "addConstraint:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=contentsVerticalInset)-[textLabel]-(>=contentsVerticalInset)-|"), 0, v23, v25));
    objc_msgSend(v35, "addConstraints:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 10, 0, v35, 10, 1.0, 0.0));
    objc_msgSend(v35, "addConstraint:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=contentsVerticalInset)-[detailTextLabel]-(>=contentsVerticalInset)-|"), 0, v23, v25));
    objc_msgSend(v35, "addConstraints:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 10, 0, v35, 10, 1.0, 0.0));
    objc_msgSend(v35, "addConstraint:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=contentsVerticalInset)-[chevron]-(>=contentsVerticalInset)-|"), 0, v23, v25));
    objc_msgSend(v35, "addConstraints:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 10, 0, v35, 10, 1.0, 0.0));
    objc_msgSend(v35, "addConstraint:", v34);

  }
}

- (UIImageView)imageView
{
  -[BKLibraryCollectionsListCell p_buildSubviews](self, "p_buildSubviews");
  return self->_imageView;
}

- (UILabel)textLabel
{
  -[BKLibraryCollectionsListCell p_buildSubviews](self, "p_buildSubviews");
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  -[BKLibraryCollectionsListCell p_buildSubviews](self, "p_buildSubviews");
  return self->_detailTextLabel;
}

- (UIImageView)chevron
{
  -[BKLibraryCollectionsListCell p_buildSubviews](self, "p_buildSubviews");
  return self->_chevron;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v3 = objc_autoreleasePoolPush();
  -[BKLibraryCollectionsListCell removeTextEntryField](self, "removeTextEntryField");
  -[BKLibraryCollectionsListCell setMetrics:](self, "setMetrics:", 0);
  -[BKLibraryCollectionsListCell setEditing:](self, "setEditing:", 0);
  -[BKLibraryCollectionsListCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BKLibraryCollectionsListCell;
  -[BKLibraryCollectionsListCell prepareForReuse](&v4, "prepareForReuse");
  objc_autoreleasePoolPop(v3);
}

- (void)removeTextEntryField
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell textEntryField](self, "textEntryField"));
  if (v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell textEntryFieldConstraints](self, "textEntryFieldConstraints"));
    objc_msgSend(v3, "removeConstraints:", v4);

    -[BKLibraryCollectionsListCell setTextEntryFieldConstraints:](self, "setTextEntryFieldConstraints:", 0);
    objc_msgSend(v5, "removeFromSuperview");
    objc_msgSend(v5, "setDelegate:", 0);
    -[BKLibraryCollectionsListCell setTextEntryField:](self, "setTextEntryField:", 0);
  }

}

- (void)setDimmed:(BOOL)a3
{
  id v4;

  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell metrics](self, "metrics"));
    -[BKLibraryCollectionsListCell p_updateCellFromMetrics:](self, "p_updateCellFromMetrics:", v4);

  }
}

- (void)willTransitionToState:(unint64_t)a3
{
  char v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryCollectionsListCell;
  -[BKLibraryCollectionsListCell willTransitionToState:](&v6, "willTransitionToState:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell chevron](self, "chevron"));
  objc_msgSend(v5, "setHidden:", (v3 & 3) != 0);

}

- (void)setupTextEntryField:(id)a3
{
  id v4;
  id v5;
  double v6;
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
  _QWORD v17[4];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell textEntryField](self, "textEntryField"));
  if (!v5)
  {
    v5 = objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[BKLibraryCollectionsListCell setTextEntryField:](self, "setTextEntryField:", v5);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v6) = 1131413504;
    objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1132068864;
    objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    objc_msgSend(v5, "setKeyboardType:", 0);
    objc_msgSend(v5, "setReturnKeyType:", 9);
    objc_msgSend(v5, "setAutocapitalizationType:", 1);
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v5, "setTextAlignment:", 4);
    objc_msgSend(v5, "setContentVerticalAlignment:", 0);
    objc_msgSend(v5, "setOpaque:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v5, "setBackgroundColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell contentView](self, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell textLabel](self, "textLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell metrics](self, "metrics"));
    -[BKLibraryCollectionsListCell p_updateTextEntryFromMetrics:](self, "p_updateTextEntryFromMetrics:", v11);

    objc_msgSend(v9, "addSubview:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, v10, 3, 1.0, 0.0));
    v17[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 4, 0, v10, 4, 1.0, 0.0));
    v17[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 5, 0, v10, 5, 1.0, 0.0));
    v17[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 6, 0, v10, 6, 1.0, 0.0));
    v17[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));

    objc_msgSend(v9, "addConstraints:", v16);
    -[BKLibraryCollectionsListCell setTextEntryFieldConstraints:](self, "setTextEntryFieldConstraints:", v16);

  }
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)p_updateCellFromMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
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
  id v30;

  v4 = a3;
  if (v4)
  {
    v30 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableBackgroundColor"));
    -[BKLibraryCollectionsListCell setBackgroundColor:](self, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellSelectedBackgroundColor"));
    if (v6)
    {
      v7 = objc_alloc_init((Class)UIView);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellSelectedBackgroundColor"));
      objc_msgSend(v7, "setBackgroundColor:", v8);

      -[BKLibraryCollectionsListCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v7);
    }
    if (self->_textLabel || self->_detailTextLabel)
    {
      if (-[BKLibraryCollectionsListCell dimmed](self, "dimmed"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellDimmedTextFontAttributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellDimmedTextFontAttributes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "foregroundColor"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellDetailDimmedTextFontAttributes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "font"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellDetailDimmedTextFontAttributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "foregroundColor"));

        objc_msgSend(v30, "collectionIconDimmedAlpha");
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellNormalTextFontAttributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellNormalTextFontAttributes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "foregroundColor"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellDetailNormalTextFontAttributes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "font"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "tableCellDetailNormalTextFontAttributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "foregroundColor"));

        v17 = 1.0;
      }
      -[UIImageView setAlpha:](self->_imageView, "setAlpha:", v17);
      -[UILabel setFont:](self->_textLabel, "setFont:", v10);
      -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v12);
      -[UILabel setFont:](self->_detailTextLabel, "setFont:", v14);
      -[UILabel setTextColor:](self->_detailTextLabel, "setTextColor:", v16);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "chevronFontAttributes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "font"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v23, 1));

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "chevronName"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageWithConfiguration:", v24));

    -[UIImageView setImage:](self->_chevron, "setImage:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "chevronFontAttributes"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "foregroundColor"));
    -[UIImageView setTintColor:](self->_chevron, "setTintColor:", v29);

    v4 = v30;
  }

}

- (void)p_updateTextEntryFromMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  if (a3 && self->_textEntryField)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableCellNormalTextFontAttributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
    -[UITextField setFont:](self->_textEntryField, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableCellNormalTextFontAttributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "foregroundColor"));
    -[UITextField setTextColor:](self->_textEntryField, "setTextColor:", v8);

    v9 = objc_msgSend(v4, "darkAppearance");
    if (-[UITextField keyboardAppearance](self->_textEntryField, "keyboardAppearance") != (id)v9)
    {
      -[UITextField setKeyboardAppearance:](self->_textEntryField, "setKeyboardAppearance:", v9);
      -[UITextField reloadInputViews](self->_textEntryField, "reloadInputViews");
    }
  }
}

- (void)setMetrics:(id)a3
{
  BKLibraryCollectionsListMetrics *v5;

  v5 = (BKLibraryCollectionsListMetrics *)a3;
  if (self->_metrics != v5)
  {
    objc_storeStrong((id *)&self->_metrics, a3);
    -[BKLibraryCollectionsListCell p_updateCellFromMetrics:](self, "p_updateCellFromMetrics:", v5);
    -[BKLibraryCollectionsListCell p_updateTextEntryFromMetrics:](self, "p_updateTextEntryFromMetrics:", v5);
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init((Class)NSMutableArray);
  if (-[BKLibraryCollectionsListCell isHiddenDefaultCollection](self, "isHiddenDefaultCollection"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Hidden"), &stru_10091C438, 0));
    objc_msgSend(v3, "addObject:", v5);

  }
  if (objc_msgSend(v3, "count"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  else
    v6 = 0;

  return v6;
}

- (id)accessibilityHint
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init((Class)NSMutableArray);
  if (-[BKLibraryCollectionsListCell isEditing](self, "isEditing")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate")),
        v5 = objc_msgSend(v4, "bkaxIsCustomCollectionCell:", self),
        v4,
        v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Double tap to rename");
  }
  else if (-[BKLibraryCollectionsListCell isHiddenDefaultCollection](self, "isHiddenDefaultCollection"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Double tap to show");
  }
  else
  {
    if (!-[BKLibraryCollectionsListCell isShownDefaultCollectionInEditMode](self, "isShownDefaultCollectionInEditMode"))
      goto LABEL_9;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("Double tap to hide");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10091C438, 0));
  objc_msgSend(v3, "addObject:", v9);

LABEL_9:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
  v11 = objc_msgSend(v10, "bkaxIsCustomCollectionCell:", self);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Double tap and hold, then drag to rearrange"), &stru_10091C438, 0));
    objc_msgSend(v3, "addObject:", v13);

  }
  if (objc_msgSend(v3, "count"))
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  else
    v14 = 0;

  return v14;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  UIAccessibilityTraits v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryCollectionsListCell;
  v3 = -[BKLibraryCollectionsListCell accessibilityTraits](&v6, "accessibilityTraits");
  if (-[BKLibraryCollectionsListCell dimmed](self, "dimmed")
    && (-[BKLibraryCollectionsListCell isEditing](self, "isEditing") & 1) == 0)
  {
    v4 = UIAccessibilityTraitNotEnabled | v3;
  }
  else
  {
    v4 = v3 & ~UIAccessibilityTraitNotEnabled;
  }
  if (-[BKLibraryCollectionsListCell isButton](self, "isButton"))
    return UIAccessibilityTraitButton | v4;
  else
    return v4 & ~UIAccessibilityTraitButton;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3;
  void *v4;
  objc_super v6;

  if (-[BKLibraryCollectionsListCell showsReorderControl](self, "showsReorderControl"))
  {
    v6.receiver = self;
    v6.super_class = (Class)BKLibraryCollectionsListCell;
    v3 = -[BKLibraryCollectionsListCell accessibilityDragSourceDescriptors](&v6, "accessibilityDragSourceDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return v4;
}

- (id)accessibilityDropPointDescriptors
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;
  void *v14;

  if (!-[BKLibraryCollectionsListCell showsReorderControl](self, "showsReorderControl"))
    return &__NSArray0__struct;
  v3 = objc_alloc((Class)NSMutableArray);
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryCollectionsListCell;
  v4 = -[BKLibraryCollectionsListCell accessibilityDropPointDescriptors](&v13, "accessibilityDropPointDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithArray:", v5);

  if (objc_msgSend(v6, "count") == (id)3)
  {
    objc_msgSend(v6, "sortUsingComparator:", &stru_1008ED4D0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
    v8 = objc_msgSend(v7, "bkaxIsLastCollection:", self);

    v9 = objc_msgSend(v6, "count");
    if (v8)
    {
      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
        v14 = v10;
        v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

      }
      else
      {
        v11 = &__NSArray0__struct;
      }
      goto LABEL_10;
    }
    if ((unint64_t)v9 >= 2)
      objc_msgSend(v6, "removeObjectAtIndex:", 1);
  }
  v11 = v6;
LABEL_10:

  return v11;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  unsigned int v3;
  void *v4;
  unsigned __int8 v5;

  if (-[BKLibraryCollectionsListCell isShownDefaultCollectionInEditMode](self, "isShownDefaultCollectionInEditMode")
    || -[BKLibraryCollectionsListCell isHiddenDefaultCollection](self, "isHiddenDefaultCollection"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[BKLibraryCollectionsListCell isEditing](self, "isEditing");
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
      v5 = objc_msgSend(v4, "bkaxIsCustomCollectionCell:", self);

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  BOOL v7;

  if (-[BKLibraryCollectionsListCell isShownDefaultCollectionInEditMode](self, "isShownDefaultCollectionInEditMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
    objc_msgSend(v3, "bkaxPerformHide:", self);
  }
  else if (-[BKLibraryCollectionsListCell isHiddenDefaultCollection](self, "isHiddenDefaultCollection"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
    objc_msgSend(v3, "bkaxPerformShow:", self);
  }
  else
  {
    if (!-[BKLibraryCollectionsListCell isEditing](self, "isEditing"))
      return 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
    v5 = objc_msgSend(v4, "bkaxIsCustomCollectionCell:", self);

    if (!v5)
      return 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
    objc_msgSend(v3, "bkaxPerformRename:", self);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
  v7 = v6 != 0;

  return v7;
}

- (id)editControl
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Class v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell subviews](self, "subviews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v6);
        v8 = NSClassFromString(CFSTR("UITableViewCellEditControl"));
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          v9 = v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isButton
{
  BKLibraryCollectionsListCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
  LOBYTE(v2) = objc_msgSend(v3, "bkaxIsButton:", v2);

  return (char)v2;
}

- (BOOL)isHiddenDefaultCollection
{
  unsigned int v3;

  v3 = -[BKLibraryCollectionsListCell dimmed](self, "dimmed");
  if (v3)
    LOBYTE(v3) = -[BKLibraryCollectionsListCell isEditing](self, "isEditing");
  return v3;
}

- (BOOL)isShownDefaultCollectionInEditMode
{
  unsigned int v3;

  if (-[BKLibraryCollectionsListCell dimmed](self, "dimmed"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[BKLibraryCollectionsListCell isEditing](self, "isEditing");
    if (v3)
      LOBYTE(v3) = -[BKLibraryCollectionsListCell showsReorderControl](self, "showsReorderControl") ^ 1;
  }
  return v3;
}

- (BOOL)accessibilityPerformEscape
{
  BKLibraryCollectionsListCell *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell accessibilityDelegate](self, "accessibilityDelegate"));
  LOBYTE(v2) = objc_msgSend(v3, "bkaxDidPerformEscape:", v2);

  return (char)v2;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (void)setDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabel, a3);
}

- (void)setChevron:(id)a3
{
  objc_storeStrong((id *)&self->_chevron, a3);
}

- (BKLibraryCollectionsListMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (UITextField)textEntryField
{
  return self->_textEntryField;
}

- (void)setTextEntryField:(id)a3
{
  objc_storeStrong((id *)&self->_textEntryField, a3);
}

- (NSArray)textEntryFieldConstraints
{
  return self->_textEntryFieldConstraints;
}

- (void)setTextEntryFieldConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_textEntryFieldConstraints, a3);
}

- (BKLibraryCollectionsListCellAccessibilityDelegate)accessibilityDelegate
{
  return (BKLibraryCollectionsListCellAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityDelegate);
}

- (void)setAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityDelegate);
  objc_storeStrong((id *)&self->_textEntryFieldConstraints, 0);
  objc_storeStrong((id *)&self->_textEntryField, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
