@implementation _UIEditMenuListViewCell

+ (CGSize)layoutSizeForItem:(id)a3 traitCollection:(id)a4 containerSize:(CGSize)a5
{
  double width;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  uint64_t v84;
  _QWORD v85[2];
  CGSize result;

  width = a5.width;
  v85[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "customView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

  objc_msgSend(v9, "menuItemMargins");
  v18 = v17;
  v19 = v15;
  v21 = v20;
  v22 = v16;
  if (IsAccessibilityCategory)
    v23 = width - v15 - v16;
  else
    v23 = 1.79769313e308;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v12, "traitCollection");
    v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (v25 && v8[13] == v25[13])
      {
        v26 = v8[15];
        v27 = v25[15];

        if (v26 == v27)
        {
LABEL_9:
          objc_msgSend(v12, "systemLayoutSizeFittingSize:", v23, 1.79769313e308);
          v29 = v28;
          v31 = v30;
LABEL_12:
          objc_msgSend(v8, "displayScale");
          v41 = v40;
          goto LABEL_33;
        }
      }
      else
      {

      }
      objc_msgSend(v8, "preferredContentSizeCategory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _internalTraitOverrides](v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setPreferredContentSizeCategory:", v32);

      v34 = objc_msgSend(v8, "legibilityWeight");
      -[UIView _internalTraitOverrides](v12);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setLegibilityWeight:", v34);

      objc_msgSend(v12, "setNeedsLayout");
      objc_msgSend(v12, "layoutIfNeeded");
      objc_msgSend(v12, "systemLayoutSizeFittingSize:", v23, 1.79769313e308);
      v29 = v36;
      v31 = v37;
      -[UIView _internalTraitOverrides](v12);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeTrait:", objc_opt_class());

      -[UIView _internalTraitOverrides](v12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeTrait:", objc_opt_class());

      goto LABEL_12;
    }

    goto LABEL_9;
  }
  v82 = v18;
  v43 = *MEMORY[0x1E0C9D820];
  v42 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v83 = v42;
  v44 = *MEMORY[0x1E0C9D820];
  if ((objc_msgSend(v7, "hidesTitleForTraitCollection:", v8) & 1) == 0)
  {
    v84 = *(_QWORD *)off_1E1678D90;
    v85[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v45, 0, v23, 1.79769313e308);
    v44 = v46;
    v83 = v47;

  }
  if ((objc_msgSend(v7, "hidesImageForTraitCollection:", v8) & 1) == 0)
  {
    +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v24);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "configurationWithTraitCollection:", v8);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = (void *)_layoutImageView;
    if (!_layoutImageView)
    {
      v51 = objc_opt_new();
      v52 = (void *)_layoutImageView;
      _layoutImageView = v51;

      objc_msgSend((id)_layoutImageView, "setPreferredSymbolConfiguration:", v49);
      v50 = (void *)_layoutImageView;
    }
    objc_msgSend(v50, "traitCollection");
    v53 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v80 = v10;
    if (v8)
    {
      if (v53 && v8[13] == v53[13])
      {
        v54 = v8[15];
        v55 = v49;
        v56 = v53[15];

        v57 = v54 == v56;
        v49 = v55;
        if (v57)
          goto LABEL_26;
      }
      else
      {

      }
      objc_msgSend(v8, "preferredContentSizeCategory", v80);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_layoutImageView, "traitOverrides");
      v59 = v49;
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setPreferredContentSizeCategory:", v58);

      v61 = objc_msgSend(v8, "legibilityWeight");
      objc_msgSend((id)_layoutImageView, "traitOverrides");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setLegibilityWeight:", v61);

      v49 = v59;
      objc_msgSend((id)_layoutImageView, "setPreferredSymbolConfiguration:", v59);
    }
    else
    {

    }
LABEL_26:
    objc_msgSend((id)_layoutImageView, "setImage:", v11, v80);
    objc_msgSend((id)_layoutImageView, "sizeToFit");
    objc_msgSend((id)_layoutImageView, "bounds");
    v64 = v63;
    v66 = v65;
    objc_msgSend((id)_layoutImageView, "alignmentRectInsets");
    v43 = v64 - (v67 + v68);
    v42 = v66 - (v69 + v70);

    v10 = v81;
  }
  objc_msgSend(v8, "displayScale");
  v41 = v71;
  v72 = 0.0;
  if (v44 > 0.0 && v43 > 0.0)
    v72 = 6.0;
  v29 = v19 + v22 + v43 + v44 + v72;
  v31 = fmax(v83, v42) - (-v21 - v82);
LABEL_33:
  UICeilToScale(v29, v41);
  v75 = v74;
  UICeilToScale(v31, v41);
  v77 = v76;

  v78 = v75;
  v79 = v77;
  result.height = v79;
  result.width = v78;
  return result;
}

- (_UIEditMenuListViewCell)initWithFrame:(CGRect)a3
{
  _UIEditMenuListViewCell *v3;
  _UIEditMenuListViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIEditMenuListViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIEditMenuListViewCell _createViewHierarchy](v3, "_createViewHierarchy");
  return v4;
}

- (_UIEditMenuListViewCell)initWithCoder:(id)a3
{
  _UIEditMenuListViewCell *v3;
  _UIEditMenuListViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIEditMenuListViewCell;
  v3 = -[UICollectionViewCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIEditMenuListViewCell _createViewHierarchy](v3, "_createViewHierarchy");
  return v4;
}

- (void)setMaximumContentWidth:(double)a3
{
  NSLayoutConstraint *maximumWidthConstraint;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *v11;

  if (self->_maximumContentWidth != a3)
  {
    if (a3 == 0.0)
    {
      maximumWidthConstraint = self->_maximumWidthConstraint;
      if (maximumWidthConstraint)
      {
        -[NSLayoutConstraint setActive:](maximumWidthConstraint, "setActive:", 0);
        v6 = self->_maximumWidthConstraint;
        self->_maximumWidthConstraint = 0;

      }
    }
    self->_maximumContentWidth = a3;
    if (a3 != 0.0)
    {
      v7 = self->_maximumWidthConstraint;
      if (v7)
      {
        -[NSLayoutConstraint setConstant:](v7, "setConstant:", a3);
      }
      else
      {
        -[UICollectionViewCell contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "widthAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "constraintLessThanOrEqualToConstant:", a3);
        v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v11 = self->_maximumWidthConstraint;
        self->_maximumWidthConstraint = v10;

        -[NSLayoutConstraint setActive:](self->_maximumWidthConstraint, "setActive:", 1);
      }
    }
  }
}

- (void)setArrowEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_arrowEdgeInsets.left
    || a3.top != self->_arrowEdgeInsets.top
    || a3.right != self->_arrowEdgeInsets.right
    || a3.bottom != self->_arrowEdgeInsets.bottom)
  {
    self->_arrowEdgeInsets = a3;
    -[_UIEditMenuListViewCell _updateLayoutMargins](self, "_updateLayoutMargins");
    -[_UIEditMenuListViewCell _setupSlotView](self, "_setupSlotView");
    -[_UIEditMenuListViewCell _updateConstraints](self, "_updateConstraints");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UIVisualEffectView *v11;
  void *v12;
  UIVisualEffectView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  LODWORD(v3) = a3;
  -[_UIEditMenuListViewCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "options");

  if ((v6 & 1) != 0)
    v3 = 0;
  else
    v3 = v3;
  v30.receiver = self;
  v30.super_class = (Class)_UIEditMenuListViewCell;
  -[UICollectionViewCell setHighlighted:](&v30, sel_setHighlighted_, v3);
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((_DWORD)v3)
  {
    -[UICollectionViewCell backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      _UIEditMenuGetPlatformMetrics(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = [UIVisualEffectView alloc];
      objc_msgSend(v10, "menuHighlightBackgroundEffect");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[UIVisualEffectView initWithEffect:](v11, "initWithEffect:", v12);

      objc_msgSend(v10, "menuHighlightBackgroundColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](v13, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBackgroundColor:", v14);

      -[UICollectionViewCell setBackgroundView:](self, "setBackgroundView:", v13);
    }
  }
  -[UIView traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v16, "userInterfaceIdiom"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cellBackgroundShape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[UICollectionViewCell backgroundView](self, "backgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  -[UICollectionViewCell backgroundView](self, "backgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_applyShape:", v18);

  -[UICollectionViewCell backgroundView](self, "backgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", v3 ^ 1);

}

- (void)setItem:(id)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  UIView *v17;
  id *p_customView;
  UIView *customView;
  UIStackView *contentStackView;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  NSLayoutConstraint *minimumWidthConstraint;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_2;
  objc_msgSend(v30, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuListViewCell.m"), 194, CFSTR("One of title or image must be non-null"));
LABEL_2:

  }
  objc_storeStrong((id *)&self->_item, a3);
  objc_msgSend(v30, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v8);

  objc_msgSend(v30, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v9);

  -[UIView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_titleLabel, "setHidden:", objc_msgSend(v30, "hidesTitleForTraitCollection:", v10));

  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHidden:](self->_imageView, "setHidden:", objc_msgSend(v30, "hidesImageForTraitCollection:", v11));

  +[UIColor labelColor](UIColor, "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "options") & 1) != 0)
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(v30, "options") & 2) == 0)
      goto LABEL_9;
    _UIEditMenuGetPlatformMetrics(-[UIView _userInterfaceIdiom](self, "_userInterfaceIdiom"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "destructiveColor");
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = v13;
  }

  v12 = (void *)v14;
LABEL_9:
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);
  -[UIView setTintColor:](self->_imageView, "setTintColor:", v12);
  objc_msgSend(v30, "menuElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v16);

  objc_msgSend(v30, "customView");
  v17 = (UIView *)objc_claimAutoreleasedReturnValue();
  p_customView = (id *)&self->_customView;
  customView = self->_customView;
  self->_customView = v17;

  contentStackView = self->_contentStackView;
  if (self->_customView)
  {
    -[UIView removeFromSuperview](contentStackView, "removeFromSuperview");
    objc_msgSend(*p_customView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
LABEL_11:
    -[UICollectionViewCell contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", *p_customView);

    -[_UIEditMenuListViewCell _updateConstraints](self, "_updateConstraints");
    goto LABEL_13;
  }
  -[UIView superview](contentStackView, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    p_customView = (id *)&self->_contentStackView;
    goto LABEL_11;
  }
LABEL_13:
  objc_msgSend(v30, "overrideMinimumWidth");
  if (v23 <= 0.0)
  {
    -[_UIEditMenuListViewCell minimumWidthConstraint](self, "minimumWidthConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[NSLayoutConstraint setActive:](self->_minimumWidthConstraint, "setActive:", 0);
      minimumWidthConstraint = self->_minimumWidthConstraint;
      self->_minimumWidthConstraint = 0;

    }
  }
  else if (self->_minimumWidthConstraint)
  {
    objc_msgSend(v30, "overrideMinimumWidth");
    -[NSLayoutConstraint setConstant:](self->_minimumWidthConstraint, "setConstant:");
  }
  else
  {
    -[UICollectionViewCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "overrideMinimumWidth");
    objc_msgSend(v27, "constraintGreaterThanOrEqualToConstant:");
    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v29 = self->_minimumWidthConstraint;
    self->_minimumWidthConstraint = v28;

    -[NSLayoutConstraint setActive:](self->_minimumWidthConstraint, "setActive:", 1);
  }
  -[_UIEditMenuListViewCell _setupSlotView](self, "_setupSlotView");
  -[UIView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_createViewHierarchy
{
  void *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UIImageView *v6;
  UIImageView *imageView;
  UIStackView *v8;
  UILabel *v9;
  void *v10;
  UIStackView *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[UICollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);

  v4 = (UILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v6;

  v8 = [UIStackView alloc];
  v9 = self->_titleLabel;
  v16[0] = self->_imageView;
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIStackView initWithArrangedSubviews:](v8, "initWithArrangedSubviews:", v10);

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](v11, "setSpacing:", 6.0);
  -[UIStackView setAxis:](v11, "setAxis:", 0);
  objc_storeStrong((id *)&self->_contentStackView, v11);
  -[UICollectionViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v11);

  -[_UIEditMenuListViewCell _updateLayoutMargins](self, "_updateLayoutMargins");
  -[_UIEditMenuListViewCell _updateConstraints](self, "_updateConstraints");
  -[_UIEditMenuListViewCell _updateFont](self, "_updateFont");
  -[UIView _setDisableDictationTouchCancellation:](self, "_setDisableDictationTouchCancellation:", 1);
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v13, sel__contentSizeCategoryDidChange);

}

- (void)_contentSizeCategoryDidChange
{
  _UIEditMenuListItem *item;
  void *v4;
  _UIEditMenuListItem *v5;
  id v6;

  -[_UIEditMenuListViewCell _updateFont](self, "_updateFont");
  item = self->_item;
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_titleLabel, "setHidden:", -[_UIEditMenuListItem hidesTitleForTraitCollection:](item, "hidesTitleForTraitCollection:", v4));

  v5 = self->_item;
  -[UIView traitCollection](self, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setHidden:](self->_imageView, "setHidden:", -[_UIEditMenuListItem hidesImageForTraitCollection:](v5, "hidesImageForTraitCollection:", v6));

}

- (void)_updateConstraints
{
  unint64_t v3;
  UIView *customView;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  NSArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *contentConstraints;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0D15000uLL;
  if (self->_contentConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  customView = self->_customView;
  if (customView)
  {
    -[UIView leftAnchor](customView, "leftAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leftAnchor");
    v5 = objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    v32 = (void *)v5;
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v5, v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v31;
    -[UIView topAnchor](self->_customView, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v8 = objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    v30 = v7;
    v28 = (void *)v8;
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v27;
    -[UICollectionViewCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](self->_customView, "rightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v12;
    -[UICollectionViewCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_customView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v3 = 0x1E0D15000;
    v19 = v25;

  }
  else
  {
    -[UICollectionViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView leadingAnchor](self->_contentStackView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v21;
    objc_msgSend(v21, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v31;
    -[UIView trailingAnchor](self->_contentStackView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v22;
    objc_msgSend(v22, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v28;
    -[UIView topAnchor](self->_contentStackView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v23;
    objc_msgSend(v23, "constraintEqualToAnchor:", v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v9;
    -[UIView bottomAnchor](self->_contentStackView, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(v3 + 1760), "activateConstraints:", v18);
  contentConstraints = self->_contentConstraints;
  self->_contentConstraints = v18;

}

- (void)_updateFont
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v8;
  uint64_t v9;
  id v10;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setFont:](self->_titleLabel, "setFont:", v10);
  +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v4);

  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
    v8 = 4;
  else
    v8 = 1;
  if (IsAccessibilityCategory)
    v9 = 1;
  else
    v9 = 4;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", !IsAccessibilityCategory);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v8);
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v9);

}

- (void)_updateLayoutMargins
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "menuItemMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 + v16;
  v19 = v11 + v18;
  -[UICollectionViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLayoutMargins:", v13, v15, v17, v19);

}

- (void)setBounds:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuListViewCell;
  -[UIView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIEditMenuListViewCell securePasteButtonSlotView](self, "securePasteButtonSlotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UIEditMenuListViewCell _setupSlotView](self, "_setupSlotView");
}

- (void)_setupSlotView
{
  _UISlotView *securePasteButtonSlotView;
  _UISlotView *v4;
  void *v5;
  void *v6;
  double v7;
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
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double width;
  double height;
  double v27;
  void *v28;
  NSString *v29;
  BOOL IsAccessibilityCategory;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, void *, void *);
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  CGRect v49;
  CGRect v50;

  if (-[_UIEditMenuListViewCell _wantsPasteSlotView](self, "_wantsPasteSlotView")
    && (-[_UIEditMenuListItem options](self->_item, "options") & 1) == 0)
  {
    securePasteButtonSlotView = self->_securePasteButtonSlotView;
    if (securePasteButtonSlotView)
    {
      v4 = securePasteButtonSlotView;
    }
    else
    {
      v4 = objc_alloc_init(_UISlotView);
      objc_storeStrong((id *)&self->_securePasteButtonSlotView, v4);
    }
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIEditMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "menuItemMargins");
    v8 = v7;
    v10 = v9;
    -[UIView bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    v20 = v14 + v19;
    v23 = v16 - (v21 + v22);
    v49.size.height = v18 - (v19 + v24);
    v49.origin.x = v12 + v21;
    v49.origin.y = v20;
    v49.size.width = v23;
    v50 = CGRectInset(v49, 2.0, 0.0);
    width = v50.size.width;
    height = v50.size.height;
    v27 = v10 + -2.0;
    -[UIView traitCollection](self, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preferredContentSizeCategory");
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v29);

    if (IsAccessibilityCategory)
    {
      v31 = 0;
    }
    else
    {
      -[_UIEditMenuListViewCell item](self, "item");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v32, "displayMode");

    }
    v33 = (void *)MEMORY[0x1E0D6C0D8];
    -[_UIEditMenuListViewCell item](self, "item");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "pasteVariant");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "editMenuPasteButtonTagWithSecureName:size:contentOrigin:displayMode:", objc_msgSend(v35, "secureName"), v31, width, height, v27, v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v37 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __41___UIEditMenuListViewCell__setupSlotView__block_invoke;
    v46[3] = &unk_1E16B59B0;
    v38 = v36;
    v47 = v38;
    -[_UISlotView _setSlotStyleResolver:](v4, "_setSlotStyleResolver:", v46);
    v40 = v37;
    v41 = 3221225472;
    v42 = __41___UIEditMenuListViewCell__setupSlotView__block_invoke_2;
    v43 = &unk_1E16B5A28;
    v39 = v38;
    v44 = v39;
    objc_copyWeak(&v45, &location);
    -[_UISlotView _setSlotAnyContentProvider:](v4, "_setSlotAnyContentProvider:", &v40);
    -[_UIEditMenuListViewCell _overlaySlotView:](self, "_overlaySlotView:", v4, v40, v41, v42, v43);
    objc_destroyWeak(&v45);

    objc_destroyWeak(&location);
  }
}

- (BOOL)_wantsPasteSlotView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[_UIEditMenuListViewCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pasteVariant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIEditMenuListViewCell item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "wantsPasteSlotView");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)_secureName
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_UIEditMenuListViewCell item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pasteVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "secureName");
  else
    v4 = 0;

  return v4;
}

- (void)_overlaySlotView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *slotViewCenterXConstraint;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *slotViewCenterYConstraint;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(v4, "setUserInteractionEnabled:", 0);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4);

    objc_msgSend(v4, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    slotViewCenterXConstraint = self->_slotViewCenterXConstraint;
    self->_slotViewCenterXConstraint = v11;

    objc_msgSend(v4, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    slotViewCenterYConstraint = self->_slotViewCenterYConstraint;
    self->_slotViewCenterYConstraint = v16;

    v18 = (void *)MEMORY[0x1E0D156E0];
    -[_UIEditMenuListViewCell slotViewCenterXConstraint](self, "slotViewCenterXConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    -[_UIEditMenuListViewCell slotViewCenterYConstraint](self, "slotViewCenterYConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v21);

  }
  if (self->_slotViewCenterXConstraint)
  {
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    v23 = v22;
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    -[NSLayoutConstraint setConstant:](self->_slotViewCenterXConstraint, "setConstant:", (v23 - v24) * 0.5);
  }
  if (self->_slotViewCenterYConstraint)
  {
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    v26 = v25;
    -[_UIEditMenuListViewCell arrowEdgeInsets](self, "arrowEdgeInsets");
    -[NSLayoutConstraint setConstant:](self->_slotViewCenterYConstraint, "setConstant:", (v26 - v27) * 0.5);
  }

}

- (void)_hideContents
{
  id v2;

  -[_UIEditMenuListViewCell contentStackView](self, "contentStackView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)prepareForReuse
{
  void *v3;
  _UISlotView *securePasteButtonSlotView;
  NSLayoutConstraint *slotViewCenterYConstraint;
  void *v6;
  void *v7;
  UIView *customView;
  _UIEditMenuListItem *item;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuListViewCell;
  -[UICollectionViewCell prepareForReuse](&v10, sel_prepareForReuse);
  if (-[_UIEditMenuListViewCell _wantsPasteSlotView](self, "_wantsPasteSlotView"))
  {
    -[_UIEditMenuListViewCell contentStackView](self, "contentStackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 1.0);

    -[UIView removeFromSuperview](self->_securePasteButtonSlotView, "removeFromSuperview");
    securePasteButtonSlotView = self->_securePasteButtonSlotView;
    self->_securePasteButtonSlotView = 0;

    slotViewCenterYConstraint = self->_slotViewCenterYConstraint;
    self->_slotViewCenterYConstraint = 0;

  }
  -[UIView superview](self->_customView, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[UIView removeFromSuperview](self->_customView, "removeFromSuperview");
  customView = self->_customView;
  self->_customView = 0;

  item = self->_item;
  self->_item = 0;

}

- (_UIEditMenuListItem)item
{
  return self->_item;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (UIEdgeInsets)arrowEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_arrowEdgeInsets.top;
  left = self->_arrowEdgeInsets.left;
  bottom = self->_arrowEdgeInsets.bottom;
  right = self->_arrowEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (_UISlotView)securePasteButtonSlotView
{
  return self->_securePasteButtonSlotView;
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)customView
{
  return self->_customView;
}

- (NSArray)contentConstraints
{
  return self->_contentConstraints;
}

- (NSLayoutConstraint)minimumWidthConstraint
{
  return self->_minimumWidthConstraint;
}

- (NSLayoutConstraint)maximumWidthConstraint
{
  return self->_maximumWidthConstraint;
}

- (NSLayoutConstraint)slotViewCenterXConstraint
{
  return self->_slotViewCenterXConstraint;
}

- (NSLayoutConstraint)slotViewCenterYConstraint
{
  return self->_slotViewCenterYConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_slotViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_maximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_securePasteButtonSlotView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
