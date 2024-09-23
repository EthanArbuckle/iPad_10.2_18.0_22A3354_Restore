@implementation _UIInterfaceActionRepresentationsSequenceView

- (_UIInterfaceActionRepresentationsSequenceView)initWithVisualStyle:(id)a3
{
  id v5;
  _UIInterfaceActionRepresentationsSequenceView *v6;
  _UIInterfaceActionRepresentationsSequenceView *v7;
  NSArray *arrangedActionRepresentationViews;
  _UIInterfaceActionSeparatableSequenceView *v9;
  void *v10;
  uint64_t v11;
  _UIInterfaceActionSeparatableSequenceView *separatedContentSequenceView;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  v6 = -[UIScrollView initWithFrame:](&v14, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  v7 = v6;
  if (v6)
  {
    -[UIScrollView setContentInsetAdjustmentBehavior:](v6, "setContentInsetAdjustmentBehavior:", 2);
    -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](v7, "setEdgesInsettingLayoutMarginsFromSafeArea:", 0);
    v7->_sizingSeparatedContentSequenceViewToFitDisabledCount = 0;
    objc_storeStrong((id *)&v7->_visualStyle, a3);
    v7->_actionLayoutAxis = 1;
    arrangedActionRepresentationViews = v7->_arrangedActionRepresentationViews;
    v7->_arrangedActionRepresentationViews = (NSArray *)MEMORY[0x1E0C9AA60];

    -[UIView setLayoutMargins:](v7, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v9 = [_UIInterfaceActionSeparatableSequenceView alloc];
    -[_UIInterfaceActionRepresentationsSequenceView visualStyle](v7, "visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIInterfaceActionSeparatableSequenceView initWithVisualStyle:](v9, "initWithVisualStyle:", v10);
    separatedContentSequenceView = v7->_separatedContentSequenceView;
    v7->_separatedContentSequenceView = (_UIInterfaceActionSeparatableSequenceView *)v11;

    -[_UIInterfaceActionSeparatableSequenceView _setLayoutDebuggingIdentifier:](v7->_separatedContentSequenceView, "_setLayoutDebuggingIdentifier:", CFSTR("actions-separatableSequenceView"));
    -[_UIInterfaceActionSeparatableSequenceView setDistribution:](v7->_separatedContentSequenceView, "setDistribution:", 1);
    -[_UIInterfaceActionSeparatableSequenceView setAxis:](v7->_separatedContentSequenceView, "setAxis:", 1);
    -[UIView addSubview:](v7, "addSubview:", v7->_separatedContentSequenceView);
    -[_UIInterfaceActionRepresentationsSequenceView _loadDefaultSizingConstraints](v7, "_loadDefaultSizingConstraints");
    -[_UIInterfaceActionRepresentationsSequenceView reloadDisplayedContentVisualStyle](v7, "reloadDisplayedContentVisualStyle");
  }

  return v7;
}

- (void)setVisualStyle:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_visualStyle) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualStyle, a3);
    -[_UIInterfaceActionRepresentationsSequenceView reloadDisplayedContentVisualStyle](self, "reloadDisplayedContentVisualStyle");
  }

}

- (void)setActionLayoutAxis:(int64_t)a3
{
  if (self->_actionLayoutAxis != a3)
  {
    self->_actionLayoutAxis = a3;
    -[_UIInterfaceActionSeparatableSequenceView setAxis:](self->_separatedContentSequenceView, "setAxis:");
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setVisualCornerPosition:(unint64_t)a3
{
  if (self->_visualCornerPosition != a3)
  {
    self->_visualCornerPosition = a3;
    -[_UIInterfaceActionSeparatableSequenceView setVisualCornerPosition:](self->_separatedContentSequenceView, "setVisualCornerPosition:");
  }
}

- (void)setVisualCornerForcedOverride:(BOOL)a3
{
  if (self->_visualCornerForcedOverride != a3)
  {
    self->_visualCornerForcedOverride = a3;
    -[_UIInterfaceActionSeparatableSequenceView setVisualCornerForcedOverride:](self->_separatedContentSequenceView, "setVisualCornerForcedOverride:");
  }
}

- (void)setArrangedActionRepresentationViews:(id)a3
{
  NSArray **p_arrangedActionRepresentationViews;
  id v6;

  p_arrangedActionRepresentationViews = &self->_arrangedActionRepresentationViews;
  v6 = a3;
  if ((-[NSArray isEqual:](*p_arrangedActionRepresentationViews, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_arrangedActionRepresentationViews, a3);
    -[_UIInterfaceActionSeparatableSequenceView setArrangedContentViews:](self->_separatedContentSequenceView, "setArrangedContentViews:", *p_arrangedActionRepresentationViews);
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (double)fittingWidthForLayoutAxis:(int64_t)a3
{
  double result;

  -[_UIInterfaceActionSeparatableSequenceView fittingWidthForLayoutAxis:](self->_separatedContentSequenceView, "fittingWidthForLayoutAxis:", a3);
  return result;
}

- (double)_contentFitCanScrollThreshold
{
  return 0.5;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x10) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  -[UIScrollView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIInterfaceActionRepresentationsSequenceView _updateBackgroundView](self, "_updateBackgroundView");
  -[_UIInterfaceActionRepresentationsSequenceView _updateSeparatedContentSequenceViewToFitSizeIfPossible](self, "_updateSeparatedContentSequenceViewToFitSizeIfPossible");
}

- (void)_notifyDidScroll
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  -[UIScrollView _notifyDidScroll](&v3, sel__notifyDidScroll);
  -[_UIInterfaceActionRepresentationsSequenceView _temporarilySkipSizingSeparatedContentSequenceViewToFit](self, "_temporarilySkipSizingSeparatedContentSequenceViewToFit");
}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionRepresentationsSequenceView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UIInterfaceActionRepresentationsSequenceView _updateMinimumHeightConstraint](self, "_updateMinimumHeightConstraint");
}

- (void)_loadDefaultSizingConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *minimumHeightConstraint;

  -[UIView heightAnchor](self, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v4;

  -[NSLayoutConstraint setActive:](self->_minimumHeightConstraint, "setActive:", 1);
}

- (void)_updateMinimumHeightConstraint
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self, "arrangedActionRepresentationViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[_UIInterfaceActionRepresentationsSequenceView visualStyle](self, "visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minimumActionContentSize");
    v7 = v6;

    if (v7 <= 0.0)
    {
      -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self, "arrangedActionRepresentationViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v7 = v10;

    }
    -[_UIInterfaceActionRepresentationsSequenceView _minimumNumberOfRowsRequiredVisible](self, "_minimumNumberOfRowsRequiredVisible");
    v12 = v7 * v11;
  }
  else
  {
    v12 = 0.0;
  }
  -[NSLayoutConstraint setConstant:](self->_minimumHeightConstraint, "setConstant:", v12);
}

- (double)_minimumNumberOfRowsRequiredVisible
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;

  v3 = -[_UIInterfaceActionRepresentationsSequenceView _isHorizontalLayout](self, "_isHorizontalLayout");
  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self, "arrangedActionRepresentationViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (v4)
      v6 = 1.0;
    else
      v6 = 0.0;

  }
  else
  {
    v7 = objc_msgSend(v4, "count");

    return fmin((double)v7, 1.5);
  }
  return v6;
}

- (CGSize)_sizeByApplyingLayoutMarginsAsOutsetToSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView layoutMargins](self, "layoutMargins");
  v7 = width + v5 + v6;
  v10 = height + v8 + v9;
  v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[_UIInterfaceActionSeparatableSequenceView systemLayoutSizeFittingSize:](self->_separatedContentSequenceView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[_UIInterfaceActionRepresentationsSequenceView _sizeByApplyingLayoutMarginsAsOutsetToSize:](self, "_sizeByApplyingLayoutMarginsAsOutsetToSize:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  -[_UIInterfaceActionSeparatableSequenceView systemLayoutSizeFittingSize:](self->_separatedContentSequenceView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  -[_UIInterfaceActionRepresentationsSequenceView _sizeByApplyingLayoutMarginsAsOutsetToSize:](self, "_sizeByApplyingLayoutMarginsAsOutsetToSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateSeparatedContentSequenceViewToFitSizeIfPossible
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;

  if (self->_sizingSeparatedContentSequenceViewToFitDisabledCount < 1
    || (-[UIScrollView contentSize](self, "contentSize"), v4 == 0.0)
    || v3 == 0.0)
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UIView layoutMargins](self, "layoutMargins");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    v19 = CGRectGetWidth(v28) - (v16 + v18);
    -[_UIInterfaceActionRepresentationsSequenceView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", v10, 0.0);
    v21 = v20;
    -[UIScrollView accessoryInsets](self, "accessoryInsets");
    v24 = v19 - (v22 + v23);
    v27 = v21 - (v25 + v26);
    -[UIView setFrame:](self->_separatedContentSequenceView, "setFrame:", v16 + v22, v14 + v25, v24, v27);
    -[UIScrollView setContentSize:](self, "setContentSize:", v24, v27);
  }
}

- (void)_temporarilySkipSizingSeparatedContentSequenceViewToFit
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[_UIInterfaceActionRepresentationsSequenceView _disableSeparatedContentSequenceViewToFit](self, "_disableSeparatedContentSequenceViewToFit");
  v3 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104___UIInterfaceActionRepresentationsSequenceView__temporarilySkipSizingSeparatedContentSequenceViewToFit__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

- (void)_disableSeparatedContentSequenceViewToFit
{
  ++self->_sizingSeparatedContentSequenceViewToFitDisabledCount;
}

- (void)_enableSeparatedContentSequenceViewToFit
{
  --self->_sizingSeparatedContentSequenceViewToFitDisabledCount;
}

- (void)_applyVisualStyleToSeparatedContentSequenceView
{
  void *v3;

  -[_UIInterfaceActionRepresentationsSequenceView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInterfaceActionSeparatableSequenceView setVisualStyle:](self->_separatedContentSequenceView, "setVisualStyle:", v3);

  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)_isHorizontalLayout
{
  return self->_actionLayoutAxis == 0;
}

- (void)_updateBackgroundView
{
  UIView *backgroundView;

  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  backgroundView = self->_backgroundView;
  if (backgroundView)
    -[UIScrollView _moveContentSubview:toBack:](self, "_moveContentSubview:toBack:", backgroundView, 1);
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  UIView *backgroundView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](*p_backgroundView, "setFrame:");
    -[UIScrollView _addContentSubview:atBack:](self, "_addContentSubview:atBack:", *p_backgroundView, 1);
    v5 = v8;
  }

}

- (UIInterfaceActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (NSArray)arrangedActionRepresentationViews
{
  return self->_arrangedActionRepresentationViews;
}

- (int64_t)actionLayoutAxis
{
  return self->_actionLayoutAxis;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (BOOL)visualCornerForcedOverride
{
  return self->_visualCornerForcedOverride;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (_UIInterfaceActionSeparatableSequenceView)separatedContentSequenceView
{
  return self->_separatedContentSequenceView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_separatedContentSequenceView, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_arrangedActionRepresentationViews, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end
