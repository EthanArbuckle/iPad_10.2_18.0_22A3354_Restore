@implementation PXProtoFeatureView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
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
  void *v15;
  objc_class *v16;
  void *v17;
  CGSize result;

  if (!-[PXProtoFeatureView wantsContentView](self, "wantsContentView"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXProtoFeatureView.m"), 43, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXProtoFeatureView intrinsicContentSize]", v17);

    abort();
  }
  if (-[PXProtoFeatureView isSelected](self, "isSelected"))
    -[PXProtoFeatureView compactContentSize](self, "compactContentSize");
  else
    -[PXProtoFeatureView regularContentSize](self, "regularContentSize");
  v6 = v4;
  v7 = v5;
  -[PXProtoFeatureView _contentInsets](self, "_contentInsets");
  v10 = v6 + v8 + v9;
  v13 = v7 + v11 + v12;
  v14 = v10;
  result.height = v13;
  result.width = v14;
  return result;
}

- (double)recommendedCompactContentHeight
{
  return 22.0;
}

- (CGSize)regularContentSize
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXProtoFeatureView.m"), 53, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXProtoFeatureView regularContentSize]", v6);

  abort();
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MinX;
  double v12;
  double MidY;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22.receiver = self;
  v22.super_class = (Class)PXProtoFeatureView;
  -[PXProtoFeatureView layoutSubviews](&v22, sel_layoutSubviews);
  if (-[PXProtoFeatureView wantsContentView](self, "wantsContentView"))
  {
    -[PXProtoFeatureView _contentViewFrame](self, "_contentViewFrame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PXProtoFeatureView bounds](self, "bounds");
    MinX = CGRectGetMinX(v23);
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    v12 = (MinX + CGRectGetMinX(v24)) * 0.5;
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    MidY = CGRectGetMidY(v25);
    -[PXProtoFeatureView contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;

    -[PXProtoFeatureView contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v4, v6, v8, v10);

    -[PXProtoFeatureView _removeIconView](self, "_removeIconView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCenter:", v12, MidY);

    if (v8 != v16 || v10 != v18)
    {
      if (-[PXProtoFeatureView shouldUpdateContentOnResize](self, "shouldUpdateContentOnResize"))
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __36__PXProtoFeatureView_layoutSubviews__block_invoke;
        v21[3] = &unk_1E5148528;
        v21[4] = self;
        -[PXProtoFeatureView performChanges:](self, "performChanges:", v21);
      }
    }
  }
}

- (void)prepareForReuse
{
  -[PXProtoFeatureView performChanges:](self, "performChanges:", &__block_literal_global_299196);
}

- (UIColor)preferredBackgroundColor
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[PXProtoFeatureView isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v7 = (void *)v3;
    return (UIColor *)v7;
  }
  v4 = -[PXProtoFeatureView isSelected](self, "isSelected");
  -[PXProtoFeatureView feature](self, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PXProtoFeatureView feature](self, "feature");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "featureTintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        return (UIColor *)v7;
    }
    else
    {

    }
    -[PXProtoFeatureView tintColor](self, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.200000003);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (UIColor *)v7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_11:
    -[PXProtoFeatureView tintColor](self, "tintColor");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[PXProtoFeatureView feature](self, "feature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureSelectedTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_11;
  return (UIColor *)v7;
}

- (BOOL)wantsContentView
{
  return 1;
}

- (void)updateContent
{
  id v3;
  UIView *v4;
  UIView *contentView;
  id v6;
  void *v7;
  UIImageView *v8;
  UIImageView *removeIconView;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIView *v17;

  if (-[PXProtoFeatureView wantsContentView](self, "wantsContentView"))
  {
    -[PXProtoFeatureView contentView](self, "contentView");
    v17 = (UIView *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[PXProtoFeatureView _contentViewFrame](self, "_contentViewFrame");
      v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
      contentView = self->_contentView;
      self->_contentView = v4;

      v17 = v4;
      -[PXProtoFeatureView addSubview:](self, "addSubview:", self->_contentView);
      v6 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PXProtoFeatureRemove"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v7);
      removeIconView = self->__removeIconView;
      self->__removeIconView = v8;

      -[UIImageView setHidden:](self->__removeIconView, "setHidden:", 1);
      -[PXProtoFeatureView addSubview:](self, "addSubview:", self->__removeIconView);
    }
    -[PXProtoFeatureView preferredBackgroundColor](self, "preferredBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXProtoFeatureView setBackgroundColor:](self, "setBackgroundColor:", v10);

    -[PXProtoFeatureView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 8.0);

    v12 = -[PXProtoFeatureView isDisabled](self, "isDisabled");
    v13 = 1.0;
    if (v12)
      v13 = 0.25;
    -[PXProtoFeatureView setAlpha:](self, "setAlpha:", v13);
    -[UIView layer](v17, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 4.0);

    -[UIView setClipsToBounds:](v17, "setClipsToBounds:", 1);
    v15 = -[PXProtoFeatureView isSelected](self, "isSelected") ^ 1;
    -[PXProtoFeatureView _removeIconView](self, "_removeIconView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", v15);

  }
}

- (CGRect)_contentViewFrame
{
  double v3;
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
  double v20;
  CGRect result;

  -[PXProtoFeatureView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXProtoFeatureView _contentInsets](self, "_contentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v8 - (v11 + v16);
  if (v17 < 0.0 || (v15 = v13 + v15, v18 = v10 - v15, v10 - v15 < 0.0))
  {
    -[PXProtoFeatureView bounds](self, "bounds", v15);
  }
  else
  {
    v19 = v4 + v11;
    v20 = v6 + v13;
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UIEdgeInsets)_contentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  if (-[PXProtoFeatureView isSelected](self, "isSelected"))
    v3 = 22.0;
  else
    v3 = 4.0;
  -[PXProtoFeatureView minimumMargins](self, "minimumMargins");
  if (v3 >= v5)
    v5 = v3;
  v8 = fmax(v7, 4.0);
  v9 = fmax(v4, 4.0);
  v10 = fmax(v6, 4.0);
  result.right = v8;
  result.bottom = v10;
  result.left = v5;
  result.top = v9;
  return result;
}

- (void)setFeature:(id)a3
{
  PXProtoFeature *v5;
  PXProtoFeature *v6;

  v5 = (PXProtoFeature *)a3;
  if (self->_feature != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_feature, a3);
    -[PXProtoFeatureView _invalidateContent](self, "_invalidateContent");
    v5 = v6;
  }

}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[PXProtoFeatureView _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[PXProtoFeatureView _invalidateContent](self, "_invalidateContent");
  }
}

- (void)performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  (*((void (**)(id, PXProtoFeatureView *))a3 + 2))(a3, self);
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
    -[PXProtoFeatureView _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_setNeedsUpdate
{
  id v4;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXProtoFeatureView.m"), 192, CFSTR("neither inside perform changes nor updates"));

  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.content;
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;

  if (-[PXProtoFeatureView _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PXProtoFeatureView _updateContentIfNeeded](self, "_updateContentIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_invalidateContent
{
  self->_needsUpdateFlags.content = 1;
  -[PXProtoFeatureView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateContentIfNeeded
{
  if (self->_needsUpdateFlags.content)
  {
    self->_needsUpdateFlags.content = 0;
    -[PXProtoFeatureView updateContent](self, "updateContent");
  }
}

- (PXProtoFeature)feature
{
  return self->_feature;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (UIImageView)_removeIconView
{
  return self->__removeIconView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)shouldUpdateContentOnResize
{
  return self->_shouldUpdateContentOnResize;
}

- (UIEdgeInsets)minimumMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minimumMargins.top;
  left = self->_minimumMargins.left;
  bottom = self->_minimumMargins.bottom;
  right = self->_minimumMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->__removeIconView, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

void __37__PXProtoFeatureView_prepareForReuse__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setFeature:", 0);
  objc_msgSend(v2, "setSelected:", 0);
  objc_msgSend(v2, "setDisabled:", 0);

}

uint64_t __36__PXProtoFeatureView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContent");
}

@end
