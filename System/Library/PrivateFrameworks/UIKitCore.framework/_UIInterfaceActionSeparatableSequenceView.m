@implementation _UIInterfaceActionSeparatableSequenceView

- (_UIInterfaceActionSeparatableSequenceView)initWithVisualStyle:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _UIInterfaceActionSeparatableSequenceView *v15;
  _UIInterfaceActionSeparatableSequenceView *v16;
  NSArray *arrangedContentViews;
  NSArray *v18;
  NSArray *arrangedContentSeparatorViews;
  NSArray *arrangedContentViewsDistributionConstraints;
  UIStackView *v21;
  uint64_t v22;
  UIStackView *stackView;
  objc_super v25;

  v5 = a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v25.receiver = self;
  v25.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  v15 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, v8, v10, v12, v14);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_visualStyle, a3);
    arrangedContentViews = v16->_arrangedContentViews;
    v18 = (NSArray *)MEMORY[0x1E0C9AA60];
    v16->_arrangedContentViews = (NSArray *)MEMORY[0x1E0C9AA60];

    arrangedContentSeparatorViews = v16->_arrangedContentSeparatorViews;
    v16->_arrangedContentSeparatorViews = v18;

    arrangedContentViewsDistributionConstraints = v16->_arrangedContentViewsDistributionConstraints;
    v16->_arrangedContentViewsDistributionConstraints = v18;

    v16->_axis = 1;
    v21 = [UIStackView alloc];
    -[UIView bounds](v16, "bounds");
    v22 = -[UIStackView initWithFrame:](v21, "initWithFrame:");
    stackView = v16->_stackView;
    v16->_stackView = (UIStackView *)v22;

    -[UIStackView setAxis:](v16->_stackView, "setAxis:", v16->_axis);
    -[UIStackView setDistribution:](v16->_stackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v16->_stackView, "setAlignment:", 0);
    -[UIView addSubview:](v16, "addSubview:", v16->_stackView);
    -[_UIInterfaceActionSeparatableSequenceView reloadDisplayedContentVisualStyle](v16, "reloadDisplayedContentVisualStyle");
  }

  return v16;
}

- (void)setVisualStyle:(id)a3
{
  UIInterfaceActionVisualStyle **p_visualStyle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  p_visualStyle = &self->_visualStyle;
  v12 = a3;
  if ((objc_msgSend(v12, "isEqual:", *p_visualStyle) & 1) == 0)
  {
    -[UIInterfaceActionVisualStyle visualStyleOverride](*p_visualStyle, "visualStyleOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customSeparatorAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_visualStyle, a3);
    -[_UIInterfaceActionSeparatableSequenceView reloadDisplayedContentVisualStyle](self, "reloadDisplayedContentVisualStyle");
    -[UIInterfaceActionVisualStyle visualStyleOverride](*p_visualStyle, "visualStyleOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customSeparatorAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIInterfaceActionSeparatableSequenceView arrangedContentViews](self, "arrangedContentViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count") || v7 == v9)
    {

    }
    else
    {
      v11 = objc_msgSend(v7, "isEqual:", v9);

      if ((v11 & 1) == 0)
        -[_UIInterfaceActionSeparatableSequenceView _reloadStackViewArrangement](self, "_reloadStackViewArrangement");
    }

  }
}

- (void)setAxis:(int64_t)a3
{
  if (-[_UIInterfaceActionSeparatableSequenceView axis](self, "axis") != a3)
  {
    self->_axis = a3;
    -[UIStackView setAxis:](self->_stackView, "setAxis:", a3);
    -[_UIInterfaceActionSeparatableSequenceView _updateActionSpacing](self, "_updateActionSpacing");
    -[_UIInterfaceActionSeparatableSequenceView _updateSeparatorConstantSizedAxis](self, "_updateSeparatorConstantSizedAxis");
    -[_UIInterfaceActionSeparatableSequenceView _reloadStackViewArrangement](self, "_reloadStackViewArrangement");
  }
}

- (void)setDistribution:(int64_t)a3
{
  if (self->_distribution != a3)
  {
    self->_distribution = a3;
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setVisualCornerPosition:(unint64_t)a3
{
  if (self->_visualCornerPosition != a3)
  {
    self->_visualCornerPosition = a3;
    -[_UIInterfaceActionSeparatableSequenceView _updateRoundedCornerPositionForActionRepViews](self, "_updateRoundedCornerPositionForActionRepViews");
  }
}

- (void)setVisualCornerForcedOverride:(BOOL)a3
{
  if (self->_visualCornerForcedOverride != a3)
  {
    self->_visualCornerForcedOverride = a3;
    -[_UIInterfaceActionSeparatableSequenceView _updateRoundedCornerPositionForActionRepViews](self, "_updateRoundedCornerPositionForActionRepViews");
  }
}

- (void)setArrangedContentViews:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSArray isEqual:](self->_arrangedContentViews, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_arrangedContentViews, a3);
    -[_UIInterfaceActionSeparatableSequenceView _updateActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisibleSetting](self, "_updateActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisibleSetting");
    -[_UIInterfaceActionSeparatableSequenceView _reloadStackViewArrangement](self, "_reloadStackViewArrangement");
  }

}

- (void)_updateActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisibleSetting
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  if (-[_UIInterfaceActionSeparatableSequenceView _isVerticalLayout](self, "_isVerticalLayout"))
  {
    -[_UIInterfaceActionSeparatableSequenceView arrangedContentViews](self, "arrangedContentViews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 < 6)
    {
      v6 = 0;
    }
    else
    {
      -[NSArray firstObject](self->_arrangedContentViews, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray count](self->_arrangedContentViews, "count") >= 2)
      {
        v7 = 1;
        do
        {
          -[NSArray objectAtIndexedSubscript:](self->_arrangedContentViews, "objectAtIndexedSubscript:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "hasLayoutHeightConstraintsIdenticalToRepresentationView:", v8);

          if ((v6 & 1) == 0)
            break;
          ++v7;
        }
        while (v7 < -[NSArray count](self->_arrangedContentViews, "count"));
      }
      else
      {
        v6 = 1;
      }

    }
  }
  else
  {
    v6 = 0;
  }
  -[NSArray firstObject](self->_arrangedContentViews, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCanRemoveContentFromHierarchyWhenNotVisible:", 0);

  if (-[NSArray count](self->_arrangedContentViews, "count") >= 2)
  {
    v10 = 1;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_arrangedContentViews, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCanRemoveContentFromHierarchyWhenNotVisible:", v6);

      ++v10;
    }
    while (v10 < -[NSArray count](self->_arrangedContentViews, "count"));
  }
}

- (double)fittingWidthForLayoutAxis:(int64_t)a3
{
  double v5;
  double v6;
  NSArray *v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = self->_arrangedContentViews;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  v9 = v6;
  v10 = v5;
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v30;
    v9 = v6;
    v10 = v5;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "systemLayoutSizeFittingSize:", v5, v6, (_QWORD)v29);
        if (v10 < v14)
          v10 = v14;
        if (v9 < v15)
          v9 = v15;
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  if (-[NSArray count](self->_arrangedContentSeparatorViews, "count"))
  {
    -[_UIInterfaceActionSeparatableSequenceView visualStyle](self, "visualStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "groupViewState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "newActionSeparatorViewForGroupViewState:", v17);
    objc_msgSend(v18, "setConstantSizedAxis:", -[_UIInterfaceActionSeparatableSequenceView _separatorConstantSizedAxis](self, "_separatorConstantSizedAxis"));
    objc_msgSend(v18, "setNeedsUpdateConstraints");
    objc_msgSend(v18, "updateConstraintsIfNeeded");
    objc_msgSend(v18, "systemLayoutSizeFittingSize:", v5, v6);
    v20 = v19;
    v22 = v21;
    v23 = -[NSArray count](self->_arrangedContentSeparatorViews, "count");
    if (a3)
      v24 = v22;
    else
      v24 = v20;
    v25 = v24 * (double)v23;

  }
  else
  {
    v25 = 0.0;
  }
  v26 = -[NSArray count](self->_arrangedContentViews, "count", (_QWORD)v29);
  if (a3)
    v27 = v9;
  else
    v27 = v10;
  return v25 + v27 * (double)v26;
}

- (void)reloadDisplayedContentVisualStyle
{
  -[_UIInterfaceActionSeparatableSequenceView _updateActionSpacing](self, "_updateActionSpacing");
  -[_UIInterfaceActionSeparatableSequenceView _updateLayoutWithStackFrameForActionSequenceEdgeInsets](self, "_updateLayoutWithStackFrameForActionSequenceEdgeInsets");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateLayoutWithStackFrameForActionSequenceEdgeInsets
{
  -[UIView bounds](self, "bounds");
  -[_UIInterfaceActionSeparatableSequenceView _stackViewFrameForViewBounds:](self, "_stackViewFrameForViewBounds:");
  -[UIView setFrame:](self->_stackView, "setFrame:");
}

- (CGRect)_viewBoundsForStackViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIInterfaceActionSeparatableSequenceView visualStyle](self, "visualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSequenceEdgeInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = x - v11;
  v17 = width - (-v11 - v15);
  v18 = y - v9;
  v19 = height - (-v13 - v9);
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (CGRect)_stackViewFrameForViewBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIInterfaceActionSeparatableSequenceView visualStyle](self, "visualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSequenceEdgeInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = x + v11;
  v17 = width - (v15 + v11);
  v18 = y + v9;
  v19 = height - (v9 + v13);
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (void)_setLayoutDebuggingIdentifier:(id)a3
{
  UIStackView *stackView;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  -[UIView _setLayoutDebuggingIdentifier:](&v7, sel__setLayoutDebuggingIdentifier_, a3);
  stackView = self->_stackView;
  -[UIView _layoutDebuggingIdentifier](self, "_layoutDebuggingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".stack"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _setLayoutDebuggingIdentifier:](stackView, "_setLayoutDebuggingIdentifier:", v6);

}

- (void)_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  _UIInterfaceActionSeparatableSequenceView *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __113___UIInterfaceActionSeparatableSequenceView__withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists___block_invoke;
  v5[3] = &unk_1E16B1D18;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[UIView _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:](&v4, sel__withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists_, v5);

}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
  -[_UIInterfaceActionSeparatableSequenceView _reloadContentDistributionConstraintsForArrangedContentViews](self, "_reloadContentDistributionConstraintsForArrangedContentViews");
}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_super v5;

  -[_UIInterfaceActionSeparatableSequenceView _updateLayoutWithStackFrameForActionSequenceEdgeInsets](self, "_updateLayoutWithStackFrameForActionSequenceEdgeInsets");
  v5.receiver = self;
  v5.super_class = (Class)_UIInterfaceActionSeparatableSequenceView;
  -[UIView layoutSublayersOfLayer:](&v5, sel_layoutSublayersOfLayer_, a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[_UIInterfaceActionSeparatableSequenceView _systemLayoutSizeFittingStackView:](self, "_systemLayoutSizeFittingStackView:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_systemLayoutSizeFittingStackView:(CGSize)a3
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
  CGSize result;

  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_stackView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  v5 = v4;
  v7 = v6;
  if (v6 <= 0.0)
  {
    -[UIStackView _calculatedIntrinsicHeight](self->_stackView, "_calculatedIntrinsicHeight");
    v7 = v8;
  }
  -[_UIInterfaceActionSeparatableSequenceView _viewBoundsForStackViewFrame:](self, "_viewBoundsForStackViewFrame:", 0.0, 0.0, v5, v7);
  v10 = v9;
  v12 = v11;
  result.height = v12;
  result.width = v10;
  return result;
}

- (void)_reloadContentDistributionConstraintsForArrangedContentViews
{
  NSArray *arrangedContentViewsDistributionConstraints;
  int64_t v4;
  int64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_arrangedContentViewsDistributionConstraints);
  arrangedContentViewsDistributionConstraints = self->_arrangedContentViewsDistributionConstraints;
  self->_arrangedContentViewsDistributionConstraints = (NSArray *)MEMORY[0x1E0C9AA60];

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIInterfaceActionSeparatableSequenceView _dimensionAttributeToConstrainEqual](self, "_dimensionAttributeToConstrainEqual");
  if (v4)
  {
    v5 = v4;
    -[NSArray firstObject](self->_arrangedContentViews, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_arrangedContentViews, "count") >= 2)
    {
      v7 = 1;
      do
      {
        v8 = (void *)MEMORY[0x1E0D156E0];
        -[NSArray objectAtIndexedSubscript:](self->_arrangedContentViews, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:", v9, v5, 0, v6, v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v10);

        ++v7;
      }
      while (v7 < -[NSArray count](self->_arrangedContentViews, "count"));
    }

  }
  objc_msgSend(v13, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v12 = self->_arrangedContentViewsDistributionConstraints;
  self->_arrangedContentViewsDistributionConstraints = v11;

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_arrangedContentViewsDistributionConstraints);
}

- (int64_t)_dimensionAttributeToConstrainEqual
{
  int64_t distribution;
  _BOOL4 v4;
  void *v5;
  double v6;
  int64_t v7;

  distribution = self->_distribution;
  v4 = -[_UIInterfaceActionSeparatableSequenceView _isVerticalLayout](self, "_isVerticalLayout");
  if (distribution == 1)
  {
    if (v4)
    {
      -[_UIInterfaceActionSeparatableSequenceView visualStyle](self, "visualStyle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "minimumActionContentSize");
      v7 = 8 * (v6 <= 0.0);

    }
    else
    {
      return 7;
    }
  }
  else if (v4)
  {
    return 8;
  }
  else
  {
    return 7;
  }
  return v7;
}

- (void)_reloadStackViewArrangement
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, unint64_t);
  void *v13;
  _UIInterfaceActionSeparatableSequenceView *v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];

  v3 = (void *)-[NSArray copy](self->_arrangedContentViews, "copy");
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectsInArray:", v3);
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke;
  v21[3] = &unk_1E16B24A0;
  v21[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v21);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__7;
  v19[4] = __Block_byref_object_dispose__7;
  v20 = 0;
  v10 = v6;
  v11 = 3221225472;
  v12 = __72___UIInterfaceActionSeparatableSequenceView__reloadStackViewArrangement__block_invoke_14;
  v13 = &unk_1E16B24C8;
  v14 = self;
  v18 = objc_msgSend(v3, "count");
  v8 = v3;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v17 = v19;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 0, &v10);
  -[_UIInterfaceActionSeparatableSequenceView _updateRoundedCornerPositionForActionRepViews](self, "_updateRoundedCornerPositionForActionRepViews", v10, v11, v12, v13, v14);
  objc_storeStrong((id *)&self->_arrangedContentSeparatorViews, v7);
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

  _Block_object_dispose(v19, 8);
}

- (void)_addSeparatorToStackAndMutableArray:(id)a3 preferSectionStyle:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[_UIInterfaceActionSeparatableSequenceView visualStyle](self, "visualStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupViewState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (v8 = (void *)objc_msgSend(v6, "newSectionSeparatorViewForGroupViewState:", v7)) != 0
    || (v8 = (void *)objc_msgSend(v6, "newActionSeparatorViewForGroupViewState:", v7)) != 0)
  {
    objc_msgSend(v8, "setConstantSizedAxis:", -[_UIInterfaceActionSeparatableSequenceView _separatorConstantSizedAxis](self, "_separatorConstantSizedAxis"));
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v8);
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (void)_updateActionSpacing
{
  void *v3;
  id v4;

  -[_UIInterfaceActionSeparatableSequenceView visualStyle](self, "visualStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSpacingForGroupViewState:", v3);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:");

}

- (int64_t)_separatorConstantSizedAxis
{
  return -[_UIInterfaceActionSeparatableSequenceView _isVerticalLayout](self, "_isVerticalLayout");
}

- (void)_updateSeparatorConstantSizedAxis
{
  int64_t v3;
  NSArray *arrangedContentSeparatorViews;
  _QWORD v5[5];

  v3 = -[_UIInterfaceActionSeparatableSequenceView _separatorConstantSizedAxis](self, "_separatorConstantSizedAxis");
  arrangedContentSeparatorViews = self->_arrangedContentSeparatorViews;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78___UIInterfaceActionSeparatableSequenceView__updateSeparatorConstantSizedAxis__block_invoke;
  v5[3] = &__block_descriptor_40_e46_v32__0__UIView_UISeparatorDisplaying__8Q16_B24l;
  v5[4] = v3;
  -[NSArray enumerateObjectsUsingBlock:](arrangedContentSeparatorViews, "enumerateObjectsUsingBlock:", v5);
}

- (void)_updateRoundedCornerPositionForActionRepViews
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v6 = self->_arrangedContentViews;
  if (-[NSArray count](v6, "count") <= 1)
  {
    -[NSArray firstObject](v6, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceActionSeparatableSequenceView _markRoundedCornerPositionOnAllCornersOfView:](self, "_markRoundedCornerPositionOnAllCornersOfView:", v3);
LABEL_6:

    goto LABEL_7;
  }
  if (!self->_visualCornerForcedOverride)
  {
    -[NSArray firstObject](v6, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceActionSeparatableSequenceView _markRoundedCornerPositionOnLeadingEdgeOfView:](self, "_markRoundedCornerPositionOnLeadingEdgeOfView:", v4);

    -[NSArray subarrayWithRange:](v6, "subarrayWithRange:", 1, -[NSArray count](v6, "count") - 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke_2;
    v7[3] = &unk_1E16B21A0;
    v7[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

    -[NSArray lastObject](v6, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceActionSeparatableSequenceView _markRoundedCornerPositionOnTrailingEdgeOfView:](self, "_markRoundedCornerPositionOnTrailingEdgeOfView:", v3);
    goto LABEL_6;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90___UIInterfaceActionSeparatableSequenceView__updateRoundedCornerPositionForActionRepViews__block_invoke;
  v8[3] = &unk_1E16B21A0;
  v8[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);
LABEL_7:

}

- (void)_markRoundedCornerPositionOnLeadingEdgeOfView:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[_UIInterfaceActionSeparatableSequenceView _isVerticalLayout](self, "_isVerticalLayout"))
    v4 = 3;
  else
    v4 = 5;
  -[_UIInterfaceActionSeparatableSequenceView _setRoundedCornersOfView:toCornerPosition:](self, "_setRoundedCornersOfView:toCornerPosition:", v5, v4);

}

- (void)_markRoundedCornerPositionOnTrailingEdgeOfView:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[_UIInterfaceActionSeparatableSequenceView _isVerticalLayout](self, "_isVerticalLayout"))
    v4 = 12;
  else
    v4 = 10;
  -[_UIInterfaceActionSeparatableSequenceView _setRoundedCornersOfView:toCornerPosition:](self, "_setRoundedCornersOfView:toCornerPosition:", v5, v4);

}

- (void)_markRoundedCornerPositionOnAllCornersOfView:(id)a3
{
  -[_UIInterfaceActionSeparatableSequenceView _setRoundedCornersOfView:toCornerPosition:](self, "_setRoundedCornersOfView:toCornerPosition:", a3, 15);
}

- (void)_markRoundedCornerPositionOnNoCornersOfView:(id)a3
{
  -[_UIInterfaceActionSeparatableSequenceView _setRoundedCornersOfView:toCornerPosition:](self, "_setRoundedCornersOfView:toCornerPosition:", a3, 0);
}

- (void)_setRoundedCornersOfView:(id)a3 toCornerPosition:(unint64_t)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setVisualCornerPosition:", -[_UIInterfaceActionSeparatableSequenceView visualCornerPosition](self, "visualCornerPosition") & a4);

}

- (BOOL)_isVerticalLayout
{
  return -[_UIInterfaceActionSeparatableSequenceView axis](self, "axis") == 1;
}

- (UIInterfaceActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (int64_t)axis
{
  return self->_axis;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (NSArray)arrangedContentViews
{
  return self->_arrangedContentViews;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (BOOL)visualCornerForcedOverride
{
  return self->_visualCornerForcedOverride;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSArray)arrangedContentSeparatorViews
{
  return self->_arrangedContentSeparatorViews;
}

- (NSArray)arrangedContentViewsDistributionConstraints
{
  return self->_arrangedContentViewsDistributionConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedContentViewsDistributionConstraints, 0);
  objc_storeStrong((id *)&self->_arrangedContentSeparatorViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_arrangedContentViews, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end
