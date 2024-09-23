@implementation ShortcutsRowCollectionViewCell

+ (NSString)cellReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "maximumContentSizeCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, v5));

  return v6;
}

+ (CGSize)cellSizeWithTraitCollection:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_effectiveTraitCollectionWithTraitCollection:", a3));
  objc_msgSend(v4, "_maps_displayScaleOrMainScreenScale");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "titleFontWithTraitCollection:", v4));
  +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v7, 1, v6);
  v9 = v8;
  if (objc_msgSend(a1, "isSubtitleHidden"))
  {
    v10 = v9 + 0.0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "subtitleFontWithTraitCollection:", v4));
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v11, 1, v6);
    v10 = v9 + v12;

  }
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

  if (IsAccessibilityCategory)
  {
    +[UIFont _maps_bodyScaledValueForValue:compatibleWithTraitCollection:](UIFont, "_maps_bodyScaledValueForValue:compatibleWithTraitCollection:", v4, 142.350006);
    v16 = v15;
    v17 = v10 + 20.0;
  }
  else
  {
    objc_msgSend(a1, "imageSize");
    +[UIFont _maps_bodyScaledValueForValue:compatibleWithTraitCollection:](UIFont, "_maps_bodyScaledValueForValue:compatibleWithTraitCollection:", v4, v18 + 26.0);
    v16 = v19;
    objc_msgSend(a1, "imageTopMargin");
    v21 = v20;
    objc_msgSend(a1, "imageSize");
    v23 = v21 + v22;
    objc_msgSend(a1, "titleTopMargin");
    v25 = v10 + v23 + v24;
    objc_msgSend(a1, "bottomMargin");
    v17 = v26 + v25;
  }

  v27 = v16;
  v28 = v17;
  result.height = v28;
  result.width = v27;
  return result;
}

+ (NSString)maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityExtraLarge;
}

+ (double)imageTopMargin
{
  return 16.0;
}

+ (double)imageSize
{
  return 60.0;
}

+ (id)titleFontWithTraitCollection:(id)a3
{
  return +[UIFont system15CompatibleWithTraitCollection:](UIFont, "system15CompatibleWithTraitCollection:", a3);
}

+ (id)subtitleFontWithTraitCollection:(id)a3
{
  return +[UIFont system13AdaptiveCompatibleWithTraitCollection:](UIFont, "system13AdaptiveCompatibleWithTraitCollection:", a3);
}

+ (BOOL)isSubtitleHidden
{
  return 0;
}

+ (double)titleTopMargin
{
  return 7.0;
}

+ (double)textHorizontalMargin
{
  return 4.0;
}

+ (double)bottomMargin
{
  return 14.0;
}

- (ShortcutsRowCollectionViewCell)initWithFrame:(CGRect)a3
{
  ShortcutsRowCollectionViewCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CAShapeLayer *highlightLayer;
  id v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  UILabel *v23;
  UILabel *titleLabel;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *subtitleLabel;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ShortcutsRowCollectionViewCell;
  v3 = -[ShortcutsRowCollectionViewCell initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 25.0));
    -[UIImageView setPreferredSymbolConfiguration:](v3->_imageView, "setPreferredSymbolConfiguration:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](v3->_imageView, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell theme](v3, "theme"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyColor"));
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v9);

    objc_msgSend((id)objc_opt_class(v3), "imageSize");
    v11 = v10 * 0.5;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v3->_imageView, "layer"));
    objc_msgSend(v12, "setCornerRadius:", v11);

    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[UIImageView setAccessibilityIdentifier:](v3->_imageView, "setAccessibilityIdentifier:", CFSTR("ShortcutImage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v13, "addSubview:", v3->_imageView);

    v14 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    highlightLayer = v3->_highlightLayer;
    v3->_highlightLayer = (CAShapeLayer *)v14;

    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.1)));
    -[CAShapeLayer setFillColor:](v3->_highlightLayer, "setFillColor:", objc_msgSend(v16, "CGColor"));

    objc_msgSend((id)objc_opt_class(v3), "imageSize");
    v18 = v17;
    objc_msgSend((id)objc_opt_class(v3), "imageSize");
    -[CAShapeLayer setFrame:](v3->_highlightLayer, "setFrame:", 0.0, 0.0, v18, v19);
    -[CAShapeLayer bounds](v3->_highlightLayer, "bounds");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:")));
    -[CAShapeLayer setPath:](v3->_highlightLayer, "setPath:", objc_msgSend(v20, "CGPath"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](v3, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
    objc_msgSend(v22, "addSublayer:", v3->_highlightLayer);

    v23 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v25);

    -[UILabel setAllowsDefaultTighteningForTruncation:](v3->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", CFSTR("ShortcutTitle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v26, "addSubview:", v3->_titleLabel);

    if ((objc_msgSend((id)objc_opt_class(v3), "isSubtitleHidden") & 1) == 0)
    {
      v27 = (UILabel *)objc_alloc_init((Class)UILabel);
      subtitleLabel = v3->_subtitleLabel;
      v3->_subtitleLabel = v27;

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v29);

      -[UILabel setAdjustsFontSizeToFitWidth:](v3->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
      -[UILabel setMinimumScaleFactor:](v3->_subtitleLabel, "setMinimumScaleFactor:", 0.7);
      -[UILabel setAccessibilityIdentifier:](v3->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("ShortcutSubtitle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](v3, "contentView"));
      objc_msgSend(v30, "addSubview:", v3->_subtitleLabel);

    }
    -[ShortcutsRowCollectionViewCell _updateConstraints](v3, "_updateConstraints");
    -[ShortcutsRowCollectionViewCell _updateTextAlignment](v3, "_updateTextAlignment");
    -[ShortcutsRowCollectionViewCell _updateFonts](v3, "_updateFonts");
    -[ShortcutsRowCollectionViewCell _updateHighlight](v3, "_updateHighlight");
  }
  return v3;
}

- (void)setModel:(id)a3
{
  ShortcutsRowCellModel *v5;
  ShortcutsRowCellModel *v6;
  ShortcutsRowCellModel **p_model;
  unsigned __int8 v8;
  ShortcutsRowCellModel *v9;

  v5 = (ShortcutsRowCellModel *)a3;
  v6 = v5;
  p_model = &self->_model;
  if (self->_model != v5)
  {
    v9 = v5;
    v8 = -[ShortcutsRowCellModel isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      -[ShortcutsRowCellModel removeObserver:](*p_model, "removeObserver:", self);
      objc_storeStrong((id *)&self->_model, a3);
      -[ShortcutsRowCellModel addObserver:](*p_model, "addObserver:", self);
      -[ShortcutsRowCollectionViewCell _updateFromModel](self, "_updateFromModel");
      v6 = v9;
    }
  }

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  -[ShortcutsRowCellModel fetchImage](self->_model, "fetchImage");
}

- (void)_updateFromModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel title](self->_model, "title"));
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel subtitle](self->_model, "subtitle"));
  -[UILabel setText:](self->_subtitleLabel, "setText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel subtitleColor](self->_model, "subtitleColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v5);

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", -[ShortcutsRowCellModel contentMode](self->_model, "contentMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellModel image](self->_model, "image"));
  -[UIImageView setImage:](self->_imageView, "setImage:", v6);

  -[ShortcutsRowCollectionViewCell setVibrant:](self, "setVibrant:", -[ShortcutsRowCellModel vibrantBackground](self->_model, "vibrantBackground"));
}

- (void)_updateHighlight
{
  -[CAShapeLayer setHidden:](self->_highlightLayer, "setHidden:", -[ShortcutsRowCollectionViewCell isHighlighted](self, "isHighlighted") ^ 1);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ShortcutsRowCollectionViewCell;
  -[ShortcutsRowCollectionViewCell setHighlighted:](&v4, "setHighlighted:", a3);
  -[ShortcutsRowCollectionViewCell _updateHighlight](self, "_updateHighlight");
}

- (void)setVibrant:(BOOL)a3
{
  id v4;
  void *v5;
  MKVibrantView *vibrantView;
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
  MKVibrantView *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];

  if (self->_vibrant != a3)
  {
    self->_vibrant = a3;
    if (a3)
    {
      v4 = objc_msgSend(objc_alloc((Class)MKVibrantView), "initWithFrame:", 0.0, 0.0, 60.0, 60.0);
      objc_msgSend(v4, "_setCornerRadius:", 30.0);
      objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](self, "contentView"));
      objc_msgSend(v5, "insertSubview:belowSubview:", v4, self->_imageView);

      vibrantView = self->_vibrantView;
      self->_vibrantView = (MKVibrantView *)v4;
      v7 = v4;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_imageView, "centerXAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
      v21[0] = v18;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_imageView, "centerYAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v21[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widthAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 60.0));
      v21[2] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "heightAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "widthAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
      v21[3] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    }
    else
    {
      -[MKVibrantView removeFromSuperview](self->_vibrantView, "removeFromSuperview");
      v17 = self->_vibrantView;
      self->_vibrantView = 0;

    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  NSString *v5;
  int IsAccessibilityCategory;
  void *v7;
  NSString *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ShortcutsRowCollectionViewCell;
  -[ShortcutsRowCollectionViewCell traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell traitCollection](self, "traitCollection"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
  v9 = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory != v9)
  {
    -[ShortcutsRowCollectionViewCell _updateConstraints](self, "_updateConstraints");
    -[ShortcutsRowCollectionViewCell _updateTextAlignment](self, "_updateTextAlignment");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell traitCollection](self, "traitCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "preferredContentSizeCategory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v13 = sub_1002A8950(v11, v12);

  if (v13)
    -[ShortcutsRowCollectionViewCell _updateFonts](self, "_updateFonts");

}

- (void)_updateTextAlignment
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    v6 = 4;
  else
    v6 = 1;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v6);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", v6);
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell traitCollection](self, "traitCollection"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_effectiveTraitCollectionWithTraitCollection:", v4));

  v5 = objc_msgSend((id)objc_opt_class(self), "titleFontWithTraitCollection:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  v7 = objc_msgSend((id)objc_opt_class(self), "subtitleFontWithTraitCollection:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v8);

}

- (void)layoutSubviews
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  CAShapeLayer *highlightLayer;
  void *v7;
  double MidY;
  CAShapeLayer *v9;
  double v10;
  CGFloat MidX;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)ShortcutsRowCollectionViewCell;
  -[ShortcutsRowCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  highlightLayer = self->_highlightLayer;
  if (IsAccessibilityCategory)
  {
    -[CAShapeLayer setAnchorPoint:](highlightLayer, "setAnchorPoint:", 0.0, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](self, "contentView"));
    objc_msgSend(v7, "bounds");
    MidY = CGRectGetMidY(v14);
    v9 = self->_highlightLayer;
    v10 = 0.0;
  }
  else
  {
    -[CAShapeLayer setAnchorPoint:](highlightLayer, "setAnchorPoint:", 0.5, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](self, "contentView"));
    objc_msgSend(v7, "bounds");
    MidX = CGRectGetMidX(v15);
    objc_msgSend((id)objc_opt_class(self), "imageTopMargin");
    MidY = v12;
    v9 = self->_highlightLayer;
    v10 = MidX;
  }
  -[CAShapeLayer setPosition:](v9, "setPosition:", v10, MidY);

}

- (void)_updateConstraints
{
  id v3;
  UIImageView *imageView;
  double v5;
  double v6;
  double v7;
  MUSizeLayout *v8;
  MUSizeLayout *imageSizeLayout;
  id v10;
  UILabel **p_titleLabel;
  uint64_t v12;
  UILabel *subtitleLabel;
  void *v14;
  void *v15;
  NSString *v16;
  _BOOL4 IsAccessibilityCategory;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  MUCompositionalStackLayout *contentStackLayout;
  id v34;
  void *v35;
  MUCompositionalStackLayout *v36;
  MUCompositionalStackLayout *v37;
  MUCompositionalStackLayout *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  UILabel *titleLabel;

  if (!self->_imageSizeLayout)
  {
    v3 = objc_alloc((Class)MUSizeLayout);
    imageView = self->_imageView;
    objc_msgSend((id)objc_opt_class(self), "imageSize");
    v6 = v5;
    objc_msgSend((id)objc_opt_class(self), "imageSize");
    v8 = (MUSizeLayout *)objc_msgSend(v3, "initWithItem:size:", imageView, v6, v7);
    imageSizeLayout = self->_imageSizeLayout;
    self->_imageSizeLayout = v8;

  }
  v10 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithIdentifier:axis:", CFSTR("labelGroup"), 1);
  if ((objc_msgSend((id)objc_opt_class(self), "isSubtitleHidden") & 1) != 0)
  {
    titleLabel = self->_titleLabel;
    p_titleLabel = &titleLabel;
    v12 = 1;
  }
  else
  {
    subtitleLabel = self->_subtitleLabel;
    v43[0] = self->_titleLabel;
    v43[1] = subtitleLabel;
    p_titleLabel = (UILabel **)v43;
    v12 = 2;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_titleLabel, v12));
  objc_msgSend(v10, "setArrangedLayoutItems:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell traitCollection](self, "traitCollection"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v16);

  v18 = objc_alloc((Class)MUCompositionalStackLayoutGroup);
  if (IsAccessibilityCategory)
  {
    v19 = objc_msgSend(v18, "initWithIdentifier:axis:", CFSTR("contentGroup"), 0);
    v42[0] = self->_imageView;
    v42[1] = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
    objc_msgSend(v19, "setArrangedLayoutItems:", v20);

    objc_msgSend(v19, "setAlignment:", 2);
    LODWORD(v21) = 1132003328;
    objc_msgSend(v19, "setAlignmentFittingSizePriority:forArrangedLayoutItem:", v10, v21);
    v22 = 0.0;
    v23 = 12.0;
    v24 = 10.0;
    v25 = v19;
  }
  else
  {
    v19 = objc_msgSend(v18, "initWithIdentifier:axis:", CFSTR("contentGroup"), 1);
    v41[0] = self->_imageView;
    v41[1] = v10;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
    objc_msgSend(v19, "setArrangedLayoutItems:", v26);

    objc_msgSend(v19, "setDistribution:", 2);
    LODWORD(v27) = 1132003328;
    objc_msgSend(v19, "setDistributionFittingSizePriority:", v27);
    objc_msgSend(v19, "setAlignment:forArrangedLayoutItem:", 2, self->_imageView);
    objc_msgSend((id)objc_opt_class(self), "imageTopMargin");
    objc_msgSend(v19, "setPadding:forArrangedLayoutItem:", self->_imageView);
    objc_msgSend((id)objc_opt_class(self), "titleTopMargin");
    v29 = v28;
    objc_msgSend((id)objc_opt_class(self), "textHorizontalMargin");
    v31 = v30;
    objc_msgSend((id)objc_opt_class(self), "textHorizontalMargin");
    v24 = v32;
    v25 = v19;
    v22 = v29;
    v23 = v31;
  }
  objc_msgSend(v25, "setPadding:forArrangedLayoutItem:", v10, v22, v23, 0.0, v24);
  contentStackLayout = self->_contentStackLayout;
  if (contentStackLayout)
  {
    -[MUCompositionalStackLayout setGroup:](contentStackLayout, "setGroup:", v19);
  }
  else
  {
    v34 = objc_alloc((Class)MUCompositionalStackLayout);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell contentView](self, "contentView"));
    v36 = (MUCompositionalStackLayout *)objc_msgSend(v34, "initWithContainer:group:", v35, v19);
    v37 = self->_contentStackLayout;
    self->_contentStackLayout = v36;

  }
  v38 = self->_contentStackLayout;
  v40[0] = self->_imageSizeLayout;
  v40[1] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v39);

}

- (BOOL)shortcutsRowCellModelShouldFetchMissingImage:(id)a3
{
  void *v4;
  ShortcutsRowCollectionViewCell *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCollectionViewCell window](self, "window", a3));

  if (v4)
  {
    v5 = self;
    if (v5)
    {
      v6 = v5;
      do
      {
        v7 = objc_msgSend(v6, "isHidden");
        if ((v7 & 1) != 0)
          break;
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

        v6 = (void *)v8;
      }
      while (v8);
      LOBYTE(v4) = v7 ^ 1;

    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

- (ShortcutsRowCellModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_contentStackLayout, 0);
  objc_storeStrong((id *)&self->_imageSizeLayout, 0);
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
