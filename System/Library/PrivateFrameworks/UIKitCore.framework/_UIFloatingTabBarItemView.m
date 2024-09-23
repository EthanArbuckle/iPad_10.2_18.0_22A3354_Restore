@implementation _UIFloatingTabBarItemView

+ (id)dragPreviewForItem:(id)a3 userInterfaceStyle:(int64_t)a4
{
  id v5;
  _UIFloatingTabBarItemView *v6;
  void *v7;
  UIDragPreviewParameters *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  UIDragPreview *v22;

  v5 = a3;
  v6 = objc_alloc_init(_UIFloatingTabBarItemView);
  -[UIView traitOverrides](v6, "traitOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInterfaceStyle:", a4);

  -[_UIFloatingTabBarItemView setDragged:](v6, "setDragged:", 1);
  -[_UIFloatingTabBarItemView setEditing:](v6, "setEditing:", 1);
  -[_UIFloatingTabBarItemView setItem:](v6, "setItem:", v5);

  -[UIView sizeToFit](v6, "sizeToFit");
  -[UIView updateTraitsIfNeeded](v6, "updateTraitsIfNeeded");
  v8 = objc_alloc_init(UIDragPreviewParameters);
  +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](v6, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvedColorWithTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewParameters setBackgroundColor:](v8, "setBackgroundColor:", v11);

  -[UIView bounds](v6, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[UIView bounds](v6, "bounds");
  +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", v13, v15, v17, v19, v20 * 0.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewParameters setVisiblePath:](v8, "setVisiblePath:", v21);

  v22 = -[UIDragPreview initWithView:parameters:]([UIDragPreview alloc], "initWithView:parameters:", v6, v8);
  return v22;
}

- (_UIFloatingTabBarItemView)initWithFrame:(CGRect)a3
{
  _UIFloatingTabBarItemView *v3;
  _UIFloatingTabBarItemView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIFloatingTabBarItemView _createViewHierarchy](v3, "_createViewHierarchy");
  return v4;
}

- (_UIFloatingTabBarItemView)initWithCoder:(id)a3
{
  _UIFloatingTabBarItemView *v3;
  _UIFloatingTabBarItemView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarItemView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIFloatingTabBarItemView _createViewHierarchy](v3, "_createViewHierarchy");
  return v4;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
  -[_UIFloatingTabBarItemView reloadItemView](self, "reloadItemView");
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[_UIFloatingTabBarItemView _updateFontAndColors](self, "_updateFontAndColors");
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    -[_UIFloatingTabBarItemView _updateFontAndColors](self, "_updateFontAndColors");
  }
}

- (void)setSuppressJiggleAnimation:(BOOL)a3
{
  if (self->_suppressJiggleAnimation != a3)
  {
    self->_suppressJiggleAnimation = a3;
    -[_UIFloatingTabBarItemView _updateJigglingState](self, "_updateJigglingState");
  }
}

- (void)setDragged:(BOOL)a3
{
  if (self->_dragged != a3)
  {
    self->_dragged = a3;
    -[_UIFloatingTabBarItemView _updateJigglingState](self, "_updateJigglingState");
  }
}

- (void)setHasSelectionHighlight:(BOOL)a3
{
  if (self->_hasSelectionHighlight != a3)
  {
    self->_hasSelectionHighlight = a3;
    -[_UIFloatingTabBarItemView _updateFontAndColors](self, "_updateFontAndColors");
  }
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  if (self->_preferredDisplayMode != a3)
  {
    self->_preferredDisplayMode = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)titleOpacity
{
  void *v2;
  double v3;
  double v4;

  -[_UIFloatingTabBarItemView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3;

  return v4;
}

- (void)setTitleOpacity:(double)a3
{
  id v4;

  -[_UIFloatingTabBarItemView titleLabel](self, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (double)baselineOffsetFromTop
{
  double result;

  -[UILabel _firstBaselineOffsetFromTop](self->_titleLabel, "_firstBaselineOffsetFromTop");
  return result;
}

- (void)reloadItemView
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel **p_titleLabel;
  void *v10;
  void *v11;
  void *v12;
  UIImageView **p_imageView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _UIFloatingTabBarItemBadgeView *badgeView;
  _UIFloatingTabBarItemBadgeView *v24;
  _UIFloatingTabBarItemBadgeView *v25;
  _UIFloatingTabBarItemBadgeView *v26;
  id v27;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 0);

  v4 = -[_UIFloatingTabBarItemView _hasValidCompactRepresentation](self, "_hasValidCompactRepresentation");
  -[_UIFloatingTabBarItemView item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "_compactRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    p_titleLabel = &self->_titleLabel;
    -[UILabel setText:](self->_titleLabel, "setText:", v8);

    -[_UIFloatingTabBarItemView item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_compactRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    p_imageView = &self->_imageView;
    -[UIImageView setImage:](self->_imageView, "setImage:", v12);

  }
  else
  {
    objc_msgSend(v5, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    p_titleLabel = &self->_titleLabel;
    -[UILabel setText:](self->_titleLabel, "setText:", v14);

    -[_UIFloatingTabBarItemView item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    p_imageView = &self->_imageView;
    -[UIImageView setImage:](self->_imageView, "setImage:", v11);
  }

  -[_UIFloatingTabBarItemView item](self, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_clusterIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    +[UIColor tintColor](UIColor, "tintColor");
  else
    +[UIColor clearColor](UIColor, "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setBackgroundColor:](*p_imageView, "setBackgroundColor:", v17);

  LODWORD(v17) = -[_UIFloatingTabBarItemView _showsTitleLabel](self, "_showsTitleLabel");
  v18 = -[_UIFloatingTabBarItemView _showsImageView](self, "_showsImageView");
  -[UIView superview](*p_titleLabel, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v17)
  {
    if (!v19)
      -[UIView addSubview:](self, "addSubview:", *p_titleLabel);
  }
  else if (v19)
  {
    -[UIView removeFromSuperview](*p_titleLabel, "removeFromSuperview");
  }
  -[UIView superview](*p_imageView, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if (!v20)
      -[UIView addSubview:](self, "addSubview:", *p_imageView);
  }
  else if (v20)
  {
    -[UIView removeFromSuperview](*p_imageView, "removeFromSuperview");
  }
  -[_UIFloatingTabBarItemView item](self, "item");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "badgeValue");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v27, "length");
  badgeView = self->_badgeView;
  if (v22)
  {
    if (!badgeView)
    {
      v24 = (_UIFloatingTabBarItemBadgeView *)objc_opt_new();
      v25 = self->_badgeView;
      self->_badgeView = v24;

      -[UIView addSubview:](self, "addSubview:", self->_badgeView);
      badgeView = self->_badgeView;
    }
    -[_UIFloatingTabBarItemBadgeView setText:](badgeView, "setText:", v27);
  }
  else if (badgeView)
  {
    -[UIView removeFromSuperview](badgeView, "removeFromSuperview");
    v26 = self->_badgeView;
    self->_badgeView = 0;

  }
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[_UIFloatingTabBarItemView _updateFontAndColors](self, "_updateFontAndColors");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  _QWORD v51[2];
  CGSize result;

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = -[_UIFloatingTabBarItemView _showsTitleLabel](self, "_showsTitleLabel", a3.width, a3.height);
  v5 = -[_UIFloatingTabBarItemView _showsImageView](self, "_showsImageView");
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarItemView _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageMargins");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "titleMargins");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v7, "contentFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIFloatingTabBarItemView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {
    -[_UIFloatingTabBarItemView titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "text");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = CFSTR(" ");
  }

  v26 = objc_alloc(MEMORY[0x1E0CB3498]);
  v50 = *(_QWORD *)off_1E1678D90;
  v51[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithString:attributes:", v25, v27);

  objc_msgSend(v28, "boundingRectWithSize:options:context:", 1, 0, 1.79769313e308, 1.79769313e308);
  v30 = v29;
  v32 = v31 - (-v19 - v15);
  if (v5)
  {
    -[_UIFloatingTabBarItemView _imageFittingSize](self, "_imageFittingSize");
    v34 = v33 - (-v11 - v9);
    if (v4)
    {
      v35 = v34 - v11;
      objc_msgSend(v7, "imageAndTitleSpacing");
      v37 = v32 - v15 + v35 + v36;
      goto LABEL_13;
    }
  }
  else
  {
    v34 = *MEMORY[0x1E0C9D820];
  }
  v38 = 0.0;
  if (v4)
    v38 = v32;
  if (v5)
    v37 = v34;
  else
    v37 = v38;
LABEL_13:
  objc_msgSend(v7, "maximumContentWidth");
  if (v37 > v39)
  {
    objc_msgSend(v7, "maximumContentWidth");
    v37 = v40;
  }
  v41 = v30 - (-v17 - v13);
  objc_msgSend(v6, "displayScale");
  v43 = v42;
  UICeilToScale(v37, v42);
  v45 = v44;
  UICeilToScale(v41, v43);
  v47 = v46;

  v48 = v45;
  v49 = v47;
  result.height = v49;
  result.width = v48;
  return result;
}

- (void)layoutSubviews
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
  void *v14;
  UILabel *titleLabel;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  UIImageView *imageView;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double width;
  double v41;
  double v42;
  double v43;
  double height;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  void *v56;
  void *v57;
  double MaxX;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  int v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  BOOL v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double rect;
  objc_super v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  v102.receiver = self;
  v102.super_class = (Class)_UIFloatingTabBarItemView;
  -[UIView layoutSubviews](&v102, sel_layoutSubviews);
  -[_UIFloatingTabBarItemView _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageMargins");
  v5 = v4;
  objc_msgSend(v3, "titleMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView superview](self->_titleLabel, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    titleLabel = self->_titleLabel;
    -[UIView bounds](self, "bounds");
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v16, v17);
    v94 = v18;
    v95 = v19;
  }
  else
  {
    v94 = *MEMORY[0x1E0C9D820];
    v95 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  -[UIView superview](self->_imageView, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    imageView = self->_imageView;
    -[UIView bounds](self, "bounds");
    -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", v22, v23);
    v99 = v25;
    v100 = v24;
  }
  else
  {
    v99 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v100 = *MEMORY[0x1E0C9D820];
  }

  -[_UIFloatingTabBarItemView imageView](self, "imageView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "image");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "_isSymbolImage");

  -[UIView superview](self->_imageView, "superview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[_UIFloatingTabBarItemView _imageFittingSize](self, "_imageFittingSize");
    rect = v30;
    v32 = v31;
  }
  else
  {
    v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    rect = *MEMORY[0x1E0C9D820];
  }

  -[UIView bounds](self, "bounds");
  v35 = round(v34 + (v33 - v32) * 0.5);
  v98 = v35;
  if ((v28 & 1) != 0)
  {
    -[_UIFloatingTabBarItemView imageView](self, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_setCornerRadius:", 0.0);
  }
  else
  {
    v37 = v5;
    v38 = rect;
    v39 = v32;
    v103 = CGRectInset(*(CGRect *)(&v35 - 1), -2.0, -2.0);
    v96 = v5;
    width = v103.size.width;
    v92 = v13;
    v41 = v9;
    v42 = v11;
    v43 = v7;
    height = v103.size.height;
    if (v99 < v32 && v100 < rect)
      v46 = 4;
    else
      v46 = 1;
    -[_UIFloatingTabBarItemView imageView](self, "imageView", v100, v103.origin.y, *(_QWORD *)&v92);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setContentMode:", v46);

    -[_UIFloatingTabBarItemView imageView](self, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_setCornerRadius:", fmin(width, height) * 0.5);
    v99 = height;
    v100 = width;
    v7 = v43;
    v11 = v42;
    v9 = v41;
    v13 = v93;
    v5 = v96;
  }

  -[UIView bounds](self, "bounds");
  v49 = v9 + v48;
  v97 = v7 + v50;
  v52 = v51 - (v9 + v13);
  v54 = v53 - (v7 + v11);
  -[UIView superview](self->_imageView, "superview");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[UIView superview](self->_titleLabel, "superview");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      v104.origin.x = v5;
      v104.origin.y = v98;
      v104.size.width = rect;
      v104.size.height = v32;
      MaxX = CGRectGetMaxX(v104);
      objc_msgSend(v3, "imageAndTitleSpacing");
      v59 = v5;
      v61 = MaxX + v60;
      v105.origin.x = v49;
      v105.origin.y = v97;
      v105.size.width = v52;
      v105.size.height = v54;
      v52 = CGRectGetMaxX(v105) - v61;
      v49 = v61;
      v5 = v59;
    }
  }
  if (v94 <= v52 + 8.0)
    v62 = v94;
  else
    v62 = v52 + 8.0;
  -[_UIFloatingTabBarItemView imageView](self, "imageView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "_hasBaseline");

  -[_UIFloatingTabBarItemView imageView](self, "imageView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    objc_msgSend(v65, "frameForAlignmentRect:", v5, v98, rect, v32);
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    -[_UIFloatingTabBarItemView imageView](self, "imageView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFrame:", v67, v69, v71, v73);

  }
  else
  {
    objc_msgSend(v65, "setFrame:", v5 + (rect - v100) * 0.5, v98 + (v32 - v99) * 0.5, v100, v99);
  }

  -[_UIFloatingTabBarItemView titleLabel](self, "titleLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setFrame:", v49 + (v52 - v62) * 0.5, v97 + (v54 - v95) * 0.5, v62, v95);

  -[UIView bounds](self, "bounds");
  v77 = v76;
  -[UIView bounds](self, "bounds");
  -[UIView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", fmin(v77, v78) * 0.5);
  -[_UIFloatingTabBarItemView badgeView](self, "badgeView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (v79)
  {
    objc_msgSend(v79, "sizeToFit");
    v81 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v3, "badgeOffset");
    v83 = v82;
    v85 = v84;
    objc_msgSend(v80, "bounds");
    v87 = v86;
    v89 = v88;
    if (v81)
    {
      v90 = -v83;
    }
    else
    {
      -[UIView bounds](self, "bounds");
      v91 = CGRectGetWidth(v106);
      v107.origin.x = 0.0;
      v107.origin.y = 0.0;
      v107.size.width = v87;
      v107.size.height = v89;
      v90 = v83 + v91 - CGRectGetWidth(v107);
    }
    objc_msgSend(v80, "setFrame:", v90, v85, v87, v89);
  }

}

- (BOOL)_hasValidCompactRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[_UIFloatingTabBarItemView item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_compactRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (BOOL)_showsTitleLabel
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = -[_UIFloatingTabBarItemView _hasValidCompactRepresentation](self, "_hasValidCompactRepresentation");
  -[_UIFloatingTabBarItemView item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_compactRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v8 = -[_UIFloatingTabBarItemView preferredDisplayMode](self, "preferredDisplayMode") != 2
    && objc_msgSend(v7, "length") != 0;

  return v8;
}

- (BOOL)_showsImageView
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[_UIFloatingTabBarItemView _showsTitleLabel](self, "_showsTitleLabel"))
    return 1;
  -[_UIFloatingTabBarItemView item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_clusterIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (CGSize)_imageFittingSize
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  -[_UIFloatingTabBarItemView _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingTabBarItemView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isSymbolImage");

  if (v6)
  {
    -[_UIFloatingTabBarItemView imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intrinsicContentSize");
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scaledImageSizeForTraitCollection:", v7);
  }
  v10 = v8;
  v11 = v9;

  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v13 = UISizeRoundToScale(v10, v11, v12);
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_createViewHierarchy
{
  UILabel *v3;
  UILabel *titleLabel;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (UILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v5 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v5;

  -[UIView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_imageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  -[_UIFloatingTabBarItemView _updateFontAndColors](self, "_updateFontAndColors");
  v9[0] = 0x1E1A994B0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIView _registerForTraitTokenChanges:withHandler:](self, "_registerForTraitTokenChanges:withHandler:", v7, &__block_literal_global_621);

}

- (BOOL)_isEffectivelyEditing
{
  _BOOL4 v3;

  v3 = -[_UIFloatingTabBarItemView isEditing](self, "isEditing");
  if (v3)
    LOBYTE(v3) = !-[_UIFloatingTabBarItemView suppressEditing](self, "suppressEditing");
  return v3;
}

- (BOOL)isCustomizableItem
{
  void *v2;
  char v3;

  -[_UIFloatingTabBarItemView item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasCustomizablePlacement");

  return v3;
}

- (BOOL)_wantsBackground
{
  _BOOL4 v3;

  v3 = -[_UIFloatingTabBarItemView _isEffectivelyEditing](self, "_isEffectivelyEditing");
  if (v3)
    LOBYTE(v3) = -[_UIFloatingTabBarItemView isCustomizableItem](self, "isCustomizableItem");
  return v3;
}

- (void)_updateFontAndColors
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;

  -[_UIFloatingTabBarItemView _currentPlatformMetrics](self, "_currentPlatformMetrics");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentPaletteProvider");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, objc_msgSend(v4, "userInterfaceStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resolvedColorFromProvider:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIFloatingTabBarItemView _isEffectivelyEditing](self, "_isEffectivelyEditing")
    || !-[_UIFloatingTabBarItemView hasSelectionHighlight](self, "hasSelectionHighlight"))
  {
    objc_msgSend(v24, "contentFont");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v24, "selectedContentFont");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  if (-[_UIFloatingTabBarItemView _isEffectivelyEditing](self, "_isEffectivelyEditing")
    || !-[_UIFloatingTabBarItemView hasSelectionHighlight](self, "hasSelectionHighlight"))
  {
    objc_msgSend(v24, "symbolConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v24, "selectedSymbolConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if (-[_UIFloatingTabBarItemView _wantsBackground](self, "_wantsBackground"))
  {
    objc_msgSend(v24, "selectionBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v11);

    objc_msgSend(v24, "selectionShadow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "applyToView:", self);
  }
  else
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v13);

    -[UIView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0;
    objc_msgSend(v12, "setShadowOpacity:", v14);
  }

  -[_UIFloatingTabBarItemView _updateJigglingState](self, "_updateJigglingState");
  v15 = -[_UIFloatingTabBarItemView _isEffectivelyEditing](self, "_isEffectivelyEditing");
  -[_UIFloatingTabBarItemView badgeView](self, "badgeView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v15);

  -[_UIFloatingTabBarItemView imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqual:", v6) & 1) != 0)
  {
    -[_UIFloatingTabBarItemView titleLabel](self, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "font");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqual:", v8);

    if ((v21 & 1) != 0)
      goto LABEL_17;
  }
  else
  {

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __49___UIFloatingTabBarItemView__updateFontAndColors__block_invoke;
  v25[3] = &unk_1E16B1B50;
  v25[4] = self;
  v26 = v6;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);
  -[_UIFloatingTabBarItemView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v8);

  -[_UIFloatingTabBarItemView imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPreferredSymbolConfiguration:", v10);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
LABEL_17:

}

- (id)_currentPlatformMetrics
{
  void *v2;
  void *v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFloatingTabBarGetPlatformMetrics(objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateJigglingState
{
  void *v3;
  BOOL v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;

  if (!-[_UIFloatingTabBarItemView _wantsBackground](self, "_wantsBackground")
    || -[_UIFloatingTabBarItemView isDragged](self, "isDragged"))
  {
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v12 = v3;
    objc_msgSend(v3, "removeAllAnimations");
    goto LABEL_5;
  }
  v4 = -[_UIFloatingTabBarItemView suppressJiggleAnimation](self, "suppressJiggleAnimation");
  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  v12 = v3;
  objc_msgSend(v3, "animationKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("RotationJitterAnimation"));

  if ((v6 & 1) == 0)
  {
    -[UIView bounds](self, "bounds");
    v7 = 80.0 / CGRectGetWidth(v13);
    if (v7 <= 1.0)
      v8 = v7;
    else
      v8 = 1.0;
    objc_msgSend((id)objc_opt_class(), "_jitterRotationAnimationWithStrength:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_jitterXTranslationAnimationWithStrength:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_jitterYTranslationAnimationWithStrength:", 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAnimation:forKey:", v9, CFSTR("RotationJitterAnimation"));
    objc_msgSend(v12, "addAnimation:forKey:", v10, CFSTR("XTranslationJitterAnimation"));
    objc_msgSend(v12, "addAnimation:forKey:", v11, CFSTR("YTranslationJitterAnimation"));

  }
LABEL_5:

}

+ (id)_jitterXTranslationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterXTranslationAnimationWithAmount:", a3 * 0.4);
}

+ (id)_jitterXTranslationAnimationWithAmount:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.134);
  objc_msgSend(v4, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v6);

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v11);

  LODWORD(v12) = 2139095040;
  objc_msgSend(v4, "setRepeatCount:", v12);
  objc_msgSend(v4, "setAutoreverses:", 1);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  return v4;
}

+ (id)_jitterYTranslationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterYTranslationAnimationWithAmount:", a3 * 0.4);
}

+ (id)_jitterYTranslationAnimationWithAmount:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.142);
  objc_msgSend(v4, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v6);

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v11);

  LODWORD(v12) = 2139095040;
  objc_msgSend(v4, "setRepeatCount:", v12);
  objc_msgSend(v4, "setAutoreverses:", 1);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  return v4;
}

+ (id)_jitterRotationAnimationWithStrength:(double)a3
{
  return (id)objc_msgSend(a1, "_jitterRotationAnimationWithAmount:", a3 * 0.03);
}

+ (id)_jitterRotationAnimationWithAmount:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.128);
  objc_msgSend(v4, "setBeginTime:", (double)arc4random_uniform(0x64u) / 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v6);

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v7, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v11);

  LODWORD(v12) = 2139095040;
  objc_msgSend(v4, "setRepeatCount:", v12);
  objc_msgSend(v4, "setAutoreverses:", 1);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  return v4;
}

- (id)accessibilityIdentifier
{
  return -[UITab accessibilityIdentifier](self->_item, "accessibilityIdentifier");
}

- (id)accessibilityLabel
{
  return -[NSObject accessibilityLabel](self->_item, "accessibilityLabel");
}

- (id)accessibilityAttributedLabel
{
  return -[NSObject accessibilityAttributedLabel](self->_item, "accessibilityAttributedLabel");
}

- (id)accessibilityValue
{
  return -[NSObject accessibilityValue](self->_item, "accessibilityValue");
}

- (id)accessibilityAttributedValue
{
  return -[NSObject accessibilityAttributedValue](self->_item, "accessibilityAttributedValue");
}

- (id)accessibilityHint
{
  return -[NSObject accessibilityHint](self->_item, "accessibilityHint");
}

- (id)accessibilityAttributedHint
{
  return -[NSObject accessibilityAttributedHint](self->_item, "accessibilityAttributedHint");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFloatingTabBarItemView;
  v3 = -[NSObject accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[_UIFloatingTabBarItemView isHighlighted](self, "isHighlighted");
  v5 = 8;
  if (!v4)
    v5 = 0;
  return v3 | v5 | 1;
}

- (UITab)item
{
  return self->_item;
}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)hasSelectionHighlight
{
  return self->_hasSelectionHighlight;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)suppressEditing
{
  return self->_suppressEditing;
}

- (void)setSuppressEditing:(BOOL)a3
{
  self->_suppressEditing = a3;
}

- (BOOL)suppressJiggleAnimation
{
  return self->_suppressJiggleAnimation;
}

- (BOOL)isDragged
{
  return self->_dragged;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (_UIFloatingTabBarItemBadgeView)badgeView
{
  return self->_badgeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
