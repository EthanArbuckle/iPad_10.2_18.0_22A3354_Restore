@implementation BKFontTableViewCell

- (BKFontTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  BKFontTableViewCell *v4;
  BKFontTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *buttonContainerWidthConstraint;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[10];

  v52.receiver = self;
  v52.super_class = (Class)BKFontTableViewCell;
  v4 = -[BKFontTableViewCell initWithStyle:reuseIdentifier:](&v52, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell label](v5, "label"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell selectionView](v5, "selectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell buttonContainerView](v5, "buttonContainerView"));
    objc_msgSend(v6, "addSubview:", v7);
    objc_msgSend(v6, "addSubview:", v8);
    objc_msgSend(v6, "addSubview:", v9);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = v7;
    objc_msgSend(v7, "setNumberOfLines:", 0);
    v11 = objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 7, 0, 0, 0, 1.0, 0.0));
    buttonContainerWidthConstraint = v5->_buttonContainerWidthConstraint;
    v5->_buttonContainerWidthConstraint = (NSLayoutConstraint *)v11;

    +[IMRadialProgressButton minimumBoundingBox](IMRadialProgressButton, "minimumBoundingBox");
    v14 = v13;
    v15 = _BKFontCellAppearanceFontHeight() * 0.55;
    if (v14 < v15)
      v14 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    objc_msgSend(v16, "size");
    v18 = v17;

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToConstant:", v18));
    v53[0] = v50;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v46));
    v53[1] = v45;
    v47 = v8;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v53[2] = v41;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 8.0));
    v53[3] = v37;
    v44 = v10;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
    v53[4] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -8.0));
    v53[5] = v29;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", v14));
    v53[6] = v20;
    v35 = v9;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
    v36 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v53[7] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutMarginsGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
    v53[8] = v27;
    v53[9] = v5->_buttonContainerWidthConstraint;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 10));

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BKFontTableViewCell setFont:](self, "setFont:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKFontTableViewCell;
  -[BKFontTableViewCell dealloc](&v3, "dealloc");
}

- (NSString)labelText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setLabelText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell label](self, "label"));
  objc_msgSend(v5, "setText:", v4);

  -[BKFontTableViewCell _setEffectiveLabelFont](self, "_setEffectiveLabelFont");
}

- (void)setLabelFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_labelFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_labelFont, a3);
    -[BKFontTableViewCell _setEffectiveLabelFont](self, "_setEffectiveLabelFont");
    v5 = v6;
  }

}

- (void)_setEffectiveLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell labelFont](self, "labelFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell labelText](self, "labelText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bkEffectiveFontForText:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell label](self, "label"));
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setFont:(id)a3
{
  BKFont *v5;
  BKFont *font;
  void *v7;
  void *v8;
  BKFont *v9;

  v5 = (BKFont *)a3;
  font = self->_font;
  if (font != v5)
  {
    v9 = v5;
    -[BKFont removeObserver:forKeyPath:context:](font, "removeObserver:forKeyPath:context:", self, CFSTR("displayName"), off_20E6D0);
    objc_storeStrong((id *)&self->_font, a3);
    -[BKFont addObserver:forKeyPath:options:context:](self->_font, "addObserver:forKeyPath:options:context:", self, CFSTR("displayName"), 0, off_20E6D0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell font](self, "font"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
    -[BKFontTableViewCell setLabelText:](self, "setLabelText:", v8);

    v5 = v9;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;
  objc_super v9;

  if (off_20E6D0 == a6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell font](self, "font", a3, a4, a5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
    -[BKFontTableViewCell setLabelText:](self, "setLabelText:", v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BKFontTableViewCell;
    -[BKFontTableViewCell observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (UILabel)label
{
  UILabel *label;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;

  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc((Class)UILabel);
    -[BKFontTableViewCell frame](self, "frame");
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_label;
    self->_label = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v7);

    -[UILabel setHighlightedTextColor:](self->_label, "setHighlightedTextColor:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumFontSize:](self->_label, "setMinimumFontSize:", 14.0);
    label = self->_label;
  }
  return label;
}

- (UIImageView)selectionView
{
  UIImageView *selectionView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *v9;

  selectionView = self->_selectionView;
  if (!selectionView)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleBody));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bc_imageWithConfiguration:limitedToContentSizeCategory:", v4, UIContentSizeCategoryAccessibilityExtraLarge));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:", 2));
    v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
    v9 = self->_selectionView;
    self->_selectionView = v8;

    selectionView = self->_selectionView;
  }
  return selectionView;
}

- (UIView)buttonContainerView
{
  UIView *buttonContainerView;
  UIView *v4;
  UIView *v5;

  buttonContainerView = self->_buttonContainerView;
  if (!buttonContainerView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_buttonContainerView;
    self->_buttonContainerView = v4;

    buttonContainerView = self->_buttonContainerView;
  }
  return buttonContainerView;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKFontTableViewCell;
  -[BKFontTableViewCell prepareForReuse](&v6, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell label](self, "label"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKFontTableViewCell buttonContainerView](self, "buttonContainerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));
  objc_msgSend(v5, "makeObjectsPerformSelector:", "removeFromSuperview");

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKFontTableViewCell;
  v3 = -[BKFontTableViewCell accessibilityTraits](&v5, "accessibilityTraits");
  if (-[UIImageView isHidden](self->_selectionView, "isHidden"))
    return v3 & ~UIAccessibilityTraitSelected;
  else
    return UIAccessibilityTraitSelected | v3;
}

- (void)setSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionView, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainerView, a3);
}

- (BKFont)font
{
  return self->_font;
}

- (NSLayoutConstraint)buttonContainerWidthConstraint
{
  return self->_buttonContainerWidthConstraint;
}

- (void)setButtonContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainerWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
}

@end
