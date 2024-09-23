@implementation UIInterfaceActionGroupView

- (void)setFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double MinX;
  void *v24;
  void *v25;
  double MinY;
  void *v27;
  CGFloat v28;
  CGFloat rect;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v30.receiver = self;
  v30.super_class = (Class)UIInterfaceActionGroupView;
  -[UIView setFrame:](&v30, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && dyld_program_sdk_at_least()
    && -[UIView _usesAutoresizingConstraints]((uint64_t)self))
  {
    -[UIView _autoresizingConstraints](self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 4)
    {
      objc_msgSend(v4, "bounds");
      -[UIView _alignmentRectForBounds:](self, "_alignmentRectForBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      rect = v12;
      -[UIView _alignmentFrame](self, "_alignmentFrame");
      v15 = v14;
      v28 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31.origin.x = v15;
      v31.origin.y = v17;
      v31.size.width = v19;
      v31.size.height = v21;
      MinX = CGRectGetMinX(v31);
      v32.origin.x = v7;
      v32.origin.y = v9;
      v32.size.width = v11;
      v32.size.height = v13;
      objc_msgSend(v22, "setConstant:", MinX - CGRectGetMinX(v32));

      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33.origin.x = v28;
      v33.origin.y = v17;
      v33.size.width = v19;
      v33.size.height = v21;
      objc_msgSend(v24, "setConstant:", CGRectGetWidth(v33));

      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34.origin.x = v28;
      v34.origin.y = v17;
      v34.size.width = v19;
      v34.size.height = v21;
      MinY = CGRectGetMinY(v34);
      v35.origin.x = v7;
      v35.origin.y = v9;
      v35.size.width = v11;
      v35.size.height = rect;
      objc_msgSend(v25, "setConstant:", MinY - CGRectGetMinY(v35));

      objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36.origin.x = v28;
      v36.origin.y = v17;
      v36.size.width = v19;
      v36.size.height = v21;
      objc_msgSend(v27, "setConstant:", CGRectGetHeight(v36));

    }
    else
    {
      -[UIView _invalidateAutoresizingConstraints]((uint64_t)self);
    }

  }
}

- (void)_commonInitWithActionGroup:(id)a3 visualStyleProvider:(id)a4 actionHandlerInvocationDelegate:(id)a5
{
  id v9;
  id v10;
  NSMutableArray *v11;
  NSMutableArray *arrangedScrollableHeaderViews;
  NSArray *allowedActionLayoutAxisByPriority;
  _UIContentConstraintsLayoutGuide *v14;
  _UIContentConstraintsLayoutGuide *contentGuide;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  objc_storeStrong((id *)&self->_actionGroup, a3);
  v10 = a5;
  -[UIInterfaceActionGroup _addActionGroupDisplayPropertyObserver:](self->_actionGroup, "_addActionGroupDisplayPropertyObserver:", self);
  -[UIInterfaceActionGroupView _setUsAsThePresentingViewControllerForAllActions](self, "_setUsAsThePresentingViewControllerForAllActions");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  arrangedScrollableHeaderViews = self->_arrangedScrollableHeaderViews;
  self->_arrangedScrollableHeaderViews = v11;

  objc_storeWeak((id *)&self->_actionHandlerInvocationDelegate, v10);
  self->_presentationStyle = 0;
  self->_actionLayoutAxis = -1;
  allowedActionLayoutAxisByPriority = self->_allowedActionLayoutAxisByPriority;
  self->_allowedActionLayoutAxisByPriority = (NSArray *)&unk_1E1A92990;

  self->_focusAvoidsNonDefaultActionsIfPossible = 0;
  self->_drawsBackground = 1;
  self->_needsUpdateTopLevelViewsArrangement = 1;
  self->_needsUpdateActionSequenceViewArrangement = 1;
  self->_needsInitialViewLoading = 1;
  objc_storeStrong((id *)&self->_cachedSizeCategory, CFSTR("_UICTContentSizeCategoryUnspecified"));
  self->_scrubbingEnabled = 1;
  v14 = objc_alloc_init(_UIContentConstraintsLayoutGuide);
  contentGuide = self->_contentGuide;
  self->_contentGuide = v14;

  -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_contentGuide);
  -[UIInterfaceActionGroupView _installContentGuideConstraints](self, "_installContentGuideConstraints");
  -[UIView setOpaque:](self, "setOpaque:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v16);

  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[UIInterfaceActionGroupView _loadTopLevelItemsView](self, "_loadTopLevelItemsView");
  -[UIInterfaceActionGroupView _loadActionSequenceView](self, "_loadActionSequenceView");
  if (v9)
    -[UIInterfaceActionGroupView setVisualStyleProvider:](self, "setVisualStyleProvider:", v9);
  else
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");

}

- (UIInterfaceActionGroupView)initWithActionGroup:(id)a3 actionHandlerInvocationDelegate:(id)a4
{
  id v6;
  id v7;
  UIInterfaceActionGroupView *v8;
  UIInterfaceActionGroupView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIInterfaceActionGroupView;
  v8 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
    -[UIInterfaceActionGroupView _commonInitWithActionGroup:visualStyleProvider:actionHandlerInvocationDelegate:](v8, "_commonInitWithActionGroup:visualStyleProvider:actionHandlerInvocationDelegate:", v6, 0, v7);

  return v9;
}

- (id)_initWithActionGroup:(id)a3 visualStyleProvider:(id)a4 actionHandlerInvocationDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIInterfaceActionGroupView *v11;
  UIInterfaceActionGroupView *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIInterfaceActionGroupView;
  v11 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
    -[UIInterfaceActionGroupView _commonInitWithActionGroup:visualStyleProvider:actionHandlerInvocationDelegate:](v11, "_commonInitWithActionGroup:visualStyleProvider:actionHandlerInvocationDelegate:", v8, v9, v10);

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[UIInterfaceActionGroupView _removeUsAsThePresentingViewControllerForAllActions](self, "_removeUsAsThePresentingViewControllerForAllActions");
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionGroupView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setActionGroup:(id)a3
{
  UIInterfaceActionGroup **p_actionGroup;
  void *v6;
  void *v7;
  id v8;

  p_actionGroup = &self->_actionGroup;
  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", *p_actionGroup) & 1) == 0)
  {
    -[UIInterfaceActionGroupView _removeUsAsThePresentingViewControllerForAllActions](self, "_removeUsAsThePresentingViewControllerForAllActions");
    objc_msgSend(v8, "_visualStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[UIInterfaceActionGroup _visualStyle](*p_actionGroup, "_visualStyle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setVisualStyle:", v7);

    }
    -[UIInterfaceActionGroup _removeActionGroupDisplayPropertyObserver:](*p_actionGroup, "_removeActionGroupDisplayPropertyObserver:", self);
    objc_storeStrong((id *)&self->_actionGroup, a3);
    -[UIInterfaceActionGroup _addActionGroupDisplayPropertyObserver:](*p_actionGroup, "_addActionGroupDisplayPropertyObserver:", self);
    -[UIInterfaceActionGroupView _setUsAsThePresentingViewControllerForAllActions](self, "_setUsAsThePresentingViewControllerForAllActions");
    -[UIInterfaceActionGroupView _setNeedsUpdateTopLevelViewsArrangement](self, "_setNeedsUpdateTopLevelViewsArrangement");
    -[UIInterfaceActionGroupView _setNeedsUpdateActionSequenceViewArrangement](self, "_setNeedsUpdateActionSequenceViewArrangement");
  }

}

- (void)setActionLayoutAxis:(int64_t)a3
{
  int64_t actionLayoutAxis;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_actionLayoutAxis != a3)
  {
    self->_actionLayoutAxis = a3;
    -[UIInterfaceActionGroupView _updateActionSequenceViewActionLayoutAxis](self, "_updateActionSequenceViewActionLayoutAxis");
    actionLayoutAxis = self->_actionLayoutAxis;
    -[UIInterfaceActionGroupView _allActionViews](self, "_allActionViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 == 1)
      v7 = -1;
    else
      v7 = actionLayoutAxis;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIInterfaceActionGroupView _allActionViews](self, "_allActionViews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "actionViewStateContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_respondsToSelector();

          if ((v15 & 1) != 0)
          {
            objc_msgSend(v13, "actionViewStateContext");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setActionLayoutAxis:", v7);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

- (void)setAllowedActionLayoutAxisByPriority:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_allowedActionLayoutAxisByPriority) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_allowedActionLayoutAxisByPriority, a3);
    -[UIInterfaceActionGroupView setActionLayoutAxis:](self, "setActionLayoutAxis:", -1);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)insertArrangedHeaderView:(id)a3 atIndex:(unint64_t)a4 scrollable:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  _UIInterfaceActionGroupHeaderScrollView *v8;

  v5 = a5;
  v7 = a3;
  v8 = -[_UIInterfaceActionGroupHeaderScrollView initWithContentView:]([_UIInterfaceActionGroupHeaderScrollView alloc], "initWithContentView:", v7);

  -[UIScrollView setScrollEnabled:](v8, "setScrollEnabled:", v5);
  -[NSMutableArray addObject:](self->_arrangedScrollableHeaderViews, "addObject:", v8);
  -[UIInterfaceActionGroupView _arrangeTopLevelViews](self, "_arrangeTopLevelViews");

}

- (void)removeArrangedHeaderView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[UIInterfaceActionGroupView arrangedHeaderViews](self, "arrangedHeaderViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_arrangedScrollableHeaderViews, "removeObjectAtIndex:", v6);
    -[UIInterfaceActionGroupView _arrangeTopLevelViews](self, "_arrangeTopLevelViews");
  }
}

- (NSArray)arrangedHeaderViews
{
  void *v3;
  NSMutableArray *arrangedScrollableHeaderViews;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  arrangedScrollableHeaderViews = self->_arrangedScrollableHeaderViews;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__UIInterfaceActionGroupView_arrangedHeaderViews__block_invoke;
  v7[3] = &unk_1E16B1FF0;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](arrangedScrollableHeaderViews, "enumerateObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

void __49__UIInterfaceActionGroupView_arrangedHeaderViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3)
  {
    self->_presentationStyle = a3;
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
  }
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  if (self->_scrubbingEnabled != a3)
  {
    self->_scrubbingEnabled = a3;
    -[UIInterfaceActionSelectionTrackingController setScrubbingEnabled:](self->_actionSelectionController, "setScrubbingEnabled:");
  }
}

- (void)scrollToCenterForInterfaceAction:(id)a3
{
  id v4;

  v4 = a3;
  -[UIInterfaceActionGroupView _scrollActionRepresentationViewToVisibleForAction:animated:](self, "_scrollActionRepresentationViewToVisibleForAction:animated:", v4, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

}

- (void)configureForPresentAlongsideTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];

  v4 = a3;
  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureForPresentingGroupView:alongsideTransitionCoordinator:", self, v4);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = v7;
  if (v4)
  {
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke_2;
    v9[3] = &unk_1E16B1CC8;
    v10 = v7;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v9, 0);

  }
  else
  {
    v7[2](v7);
  }

}

uint64_t __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollPreferredActionRepresentationViewToVisibleAnimated:", 0);
}

uint64_t __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)configureForDismissAlongsideTransitionCoordinator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureForDismissingGroupView:alongsideTransitionCoordinator:", self, v4);

}

- (void)setRequiredActionRepresentationWidth:(double)a3
{
  if (self->_requiredActionRepresentationWidth != a3)
  {
    self->_requiredActionRepresentationWidth = a3;
    -[UIInterfaceActionGroupView _updateRequiredActionRepresentationSizeConstraints](self, "_updateRequiredActionRepresentationSizeConstraints");
  }
}

- (UIEdgeInsets)_buttonEdgeInsetsFromGroupViewEdge
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
  void *v12;
  double v13;
  double v14;
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
  UIEdgeInsets result;

  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionSequenceEdgeInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIInterfaceActionGroupView actionSequenceView](self, "actionSequenceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMargins");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v5 + v14;
  v22 = v7 + v16;
  v23 = v9 + v18;
  v24 = v11 + v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)_updateRequiredActionRepresentationSizeConstraints
{
  double v3;
  double v4;

  if (self->_requiredActionRepresentationWidth <= 0.0)
  {
    -[UIInterfaceActionGroupView _removeConstraintToActiveTopLevelViewArrangementConstraints:](self, "_removeConstraintToActiveTopLevelViewArrangementConstraints:", self->_actionSequenceViewWidthAnchoredToConstantConstraint);
    -[UIInterfaceActionGroupView _addConstraintToActiveTopLevelViewArrangementConstraints:](self, "_addConstraintToActiveTopLevelViewArrangementConstraints:", self->_actionSequenceViewWidthAnchoredToContentGuideConstraint);
  }
  else
  {
    -[UIInterfaceActionGroupView _buttonEdgeInsetsFromGroupViewEdge](self, "_buttonEdgeInsetsFromGroupViewEdge");
    -[NSLayoutConstraint setConstant:](self->_actionSequenceViewWidthAnchoredToConstantConstraint, "setConstant:", v4 + self->_requiredActionRepresentationWidth + v3);
    -[UIInterfaceActionGroupView _addConstraintToActiveTopLevelViewArrangementConstraints:](self, "_addConstraintToActiveTopLevelViewArrangementConstraints:", self->_actionSequenceViewWidthAnchoredToConstantConstraint);
    -[UIInterfaceActionGroupView _removeConstraintToActiveTopLevelViewArrangementConstraints:](self, "_removeConstraintToActiveTopLevelViewArrangementConstraints:", self->_actionSequenceViewWidthAnchoredToContentGuideConstraint);
  }
}

- (void)_addConstraintToActiveTopLevelViewArrangementConstraints:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *topLevelViewArrangementConstraints;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setActive:", 1);
  v7 = (id)-[NSArray mutableCopy](self->_topLevelViewArrangementConstraints, "mutableCopy");
  objc_msgSend(v7, "addObject:", v4);

  objc_msgSend(v7, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  topLevelViewArrangementConstraints = self->_topLevelViewArrangementConstraints;
  self->_topLevelViewArrangementConstraints = v5;

}

- (void)_removeConstraintToActiveTopLevelViewArrangementConstraints:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *topLevelViewArrangementConstraints;

  v4 = a3;
  objc_msgSend(v4, "setActive:", 0);
  v5 = (NSArray *)-[NSArray mutableCopy](self->_topLevelViewArrangementConstraints, "mutableCopy");
  -[NSArray removeObject:](v5, "removeObject:", v4);

  topLevelViewArrangementConstraints = self->_topLevelViewArrangementConstraints;
  self->_topLevelViewArrangementConstraints = v5;

}

- (id)_currentlyFocusedActionView
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self->_actionSequenceView, "arrangedActionRepresentationViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isFocused") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (UIInterfaceActionRepresentationView)preferredActionRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[UIInterfaceActionGroupView _currentlyFocusedActionView](self, "_currentlyFocusedActionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v26 = 0;
    v27 = (id *)&v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__5;
    v30 = __Block_byref_object_dispose__5;
    v31 = 0;
    -[UIInterfaceActionGroupView actionGroup](self, "actionGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEnabled"))
    {
      v8 = v27;
      v9 = v7;
      v10 = v8[5];
      v8[5] = v9;
    }
    else if (-[UIInterfaceActionGroupView focusAvoidsNonDefaultActionsIfPossible](self, "focusAvoidsNonDefaultActionsIfPossible"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[UIInterfaceActionGroupView actionGroup](self, "actionGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v13)
      {
        v10 = 0;
        v14 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v16, "isEnabled"))
            {
              if (objc_msgSend(v16, "type") != 2 && objc_msgSend(v16, "type") != 1)
              {
                -[UIInterfaceActionGroupView _actionRepresentationViewForAction:](self, "_actionRepresentationViewForAction:", v16);
                v5 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_24;
              }
              if (!v10)
              {
                if (objc_msgSend(v16, "type") == 1)
                  v10 = v16;
                else
                  v10 = 0;
              }
            }
          }
          v13 = (void *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
          if (v13)
            continue;
          break;
        }

        if (v10)
        {
          v17 = 0;
          v18 = v10;
          goto LABEL_29;
        }
      }
      else
      {

      }
      -[UIInterfaceActionGroupView actionGroup](self, "actionGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v17 = 1;
LABEL_29:
      objc_storeStrong(v27 + 5, v18);
      if (v17)
      {

      }
    }
    else
    {
      -[UIInterfaceActionGroupView actionGroup](self, "actionGroup");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __59__UIInterfaceActionGroupView_preferredActionRepresentation__block_invoke;
      v21[3] = &unk_1E16B2018;
      v21[4] = &v26;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v21);

    }
    -[UIInterfaceActionGroupView _actionRepresentationViewForAction:](self, "_actionRepresentationViewForAction:", v27[5]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    _Block_object_dispose(&v26, 8);
  }

  return (UIInterfaceActionRepresentationView *)v5;
}

void __59__UIInterfaceActionGroupView_preferredActionRepresentation__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isEnabled"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

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
    _UIFocusGroupIdentifierForInstance(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInterfaceActionGroupView;
    -[UIView _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)interfaceActionGroup:(id)a3 reloadDisplayedContentActionGroupProperties:(id)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;

  v8 = a4;
  if (+[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:"))
  {
    -[UIView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }
  if (+[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v8, &unk_1E1A929C0))
  {
    -[UIInterfaceActionGroupView _setNeedsUpdateActionSequenceViewArrangement](self, "_setNeedsUpdateActionSequenceViewArrangement");
  }
  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionGroupPropertiesAffectingActionsScrollViewStyling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UIInterfaceActionGroup changedProperties:containsAny:](UIInterfaceActionGroup, "changedProperties:containsAny:", v8, v6);

  if (v7)
    -[UIInterfaceActionGroupView _applyVisualStyleToActionsViewScrollView](self, "_applyVisualStyleToActionsViewScrollView");

}

- (void)interfaceActionGroup:(id)a3 reloadDisplayedContentVisualStyle:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[UIView traitCollection](self, "traitCollection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView _visualStyleByApplyingOurTraitsToVisualStyle:traitCollection:](self, "_visualStyleByApplyingOurTraitsToVisualStyle:traitCollection:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIInterfaceActionGroupView _setAndApplyVisualStyle:](self, "_setAndApplyVisualStyle:", v6);
}

- (void)setActiveTestingVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_activeTestingVisualStyle, a3);
  -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
}

- (void)setVisualStyleProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_visualStyleProvider, obj);
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
    v5 = obj;
  }

}

- (UIInterfaceActionVisualStyle)visualStyle
{
  return -[UIInterfaceActionGroup _visualStyle](self->_actionGroup, "_visualStyle");
}

- (void)_setAndApplyVisualStyle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  if (!self->_isSettingVisualStyle)
  {
    self->_isSettingVisualStyle = 1;
    v7 = v4;
    -[UIInterfaceActionGroup _visualStyle](self->_actionGroup, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", v7);

    if ((v6 & 1) == 0)
    {
      -[UIInterfaceActionGroup _setVisualStyle:](self->_actionGroup, "_setVisualStyle:", v7);
      -[UIInterfaceActionGroupView _applyVisualStyle](self, "_applyVisualStyle");
    }
    self->_isSettingVisualStyle = 0;
    v4 = v7;
  }

}

- (void)reloadVisualStyle
{
  -[UIView _performSelectorTrackingTraitUsage:withInvalidationSelector:](self, "_performSelectorTrackingTraitUsage:withInvalidationSelector:", sel__reloadVisualStyleTrackingTraitUsage, sel_reloadVisualStyle);
}

- (void)_reloadVisualStyleTrackingTraitUsage
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView _loadVisualStyleForTraitCollection:](self, "_loadVisualStyleForTraitCollection:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[UIInterfaceActionGroup _visualStyle](self->_actionGroup, "_visualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
    -[UIInterfaceActionGroupView _setAndApplyVisualStyle:](self, "_setAndApplyVisualStyle:", v6);

}

- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  return +[UIInterfaceActionVisualStyle idiomSpecificStyleForTraitCollection:presentationStyle:](UIInterfaceActionVisualStyle, "idiomSpecificStyleForTraitCollection:presentationStyle:", a3, a4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGSize result;

  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  if (self->_presentationStyle == 2)
  {
    -[UIView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded", a3.width, a3.height);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UIView subviews](self->_topLevelItemsView, "subviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "systemLayoutSizeFittingSize:", width, v9);
          v9 = v9 + v11;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "maximumActionGroupContentSize");
    v16 = v15;

    if (v9 >= v16)
      v12 = v16;
    else
      v12 = v9;
  }
  else
  {
    -[UIView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a3.width, a3.height);
    width = v13;
  }
  v17 = width;
  result.height = v12;
  result.width = v17;
  return result;
}

- (void)updateConstraints
{
  objc_super v3;

  -[UIInterfaceActionGroupView _reloadStackViewContentsIfNeeded](self, "_reloadStackViewContentsIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionGroupView;
  -[UIView updateConstraints](&v3, sel_updateConstraints);
}

- (void)layoutSubviews
{
  UIView *backgroundView;
  objc_super v4;

  -[UIInterfaceActionGroupView _reloadStackViewContentsIfNeeded](self, "_reloadStackViewContentsIfNeeded");
  -[UIInterfaceActionGroupView _determineActualLayoutAxis](self, "_determineActualLayoutAxis");
  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionGroupView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  backgroundView = self->_backgroundView;
  -[UIInterfaceActionGroupView _contentEdgeFrame](self, "_contentEdgeFrame");
  -[UIView setFrame:](backgroundView, "setFrame:");
}

- (BOOL)_shouldAllowPassthroughToLayersBehindUsForTouches:(id)a3
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__UIInterfaceActionGroupView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke;
  v6[3] = &unk_1E16B2040;
  v6[4] = self;
  objc_msgSend(a3, "objectsPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

uint64_t __80__UIInterfaceActionGroupView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(a2, "locationInView:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 32), "pointInside:withEvent:", 0);
  *a3 = result;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UIInterfaceActionGroupView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    -[UIResponder touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UIInterfaceActionGroupView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    -[UIResponder touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v6, v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UIInterfaceActionGroupView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    -[UIResponder touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, v6, v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UIInterfaceActionGroupView _shouldAllowPassthroughToLayersBehindUsForTouches:](self, "_shouldAllowPassthroughToLayersBehindUsForTouches:", v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    -[UIResponder touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v6, v7);
  }

}

- (void)setSpringLoaded:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->_springLoaded = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self->_actionSequenceView, "arrangedActionRepresentationViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setSpringLoaded:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id, _BYTE *);
  void (**v10)(_QWORD);
  id WeakRetained;
  void *v12;
  char v13;

  v8 = a3;
  v9 = (void (**)(id, id, _BYTE *))a4;
  v10 = (void (**)(_QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandlerInvocationDelegate);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "interfaceAction:invokeActionHandler:completion:", v8, v9, v10);
  }
  else
  {
    if (v8)
    {
      v13 = 0;
      v9[2](v9, v8, &v13);
    }
    if (v10)
      v10[2](v10);
  }

}

- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3
{
  -[UIInterfaceActionSelectionTrackingController beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:](self->_actionSelectionController, "beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:", a3);
}

- (void)setSimultaneouslyPresentedGroupViews:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addPointer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[UIInterfaceActionGroupView _associateWeakSimultaneouslyPresentedGroupViews:bidirectional:](self, "_associateWeakSimultaneouslyPresentedGroupViews:bidirectional:", v5, 1);
}

- (void)_associateWeakSimultaneouslyPresentedGroupViews:(id)a3 bidirectional:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  UIInterfaceActionGroupView *v15;

  v4 = a4;
  v12 = a3;
  objc_msgSend(v12, "compact");
  if ((-[NSPointerArray isEqual:](self->_weakSimultaneouslyPresentedGroupViews, "isEqual:", v12) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_weakSimultaneouslyPresentedGroupViews, a3);
    v7 = v12;
    objc_msgSend(v7, "compact");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend((id)objc_msgSend(v7, "pointerAtIndex:", v9), "actionSelectionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v8, "addObject:", v10);

        ++v9;
      }
      while (v9 < objc_msgSend(v7, "count"));
    }

    -[UIInterfaceActionSelectionTrackingController setCooperatingSelectionTrackingControllers:](self->_actionSelectionController, "setCooperatingSelectionTrackingControllers:", v8);
    if (v4)
    {
      -[NSPointerArray allObjects](self->_weakSimultaneouslyPresentedGroupViews, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __92__UIInterfaceActionGroupView__associateWeakSimultaneouslyPresentedGroupViews_bidirectional___block_invoke;
      v13[3] = &unk_1E16B2068;
      v14 = v7;
      v15 = self;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

    }
  }

}

void __92__UIInterfaceActionGroupView__associateWeakSimultaneouslyPresentedGroupViews_bidirectional___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a2;
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "compact");
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      if ((id)objc_msgSend(v3, "pointerAtIndex:", v5) == v7)
        objc_msgSend(v4, "addIndex:", v5);
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___pointerArrayRemovePointer_block_invoke;
  v8[3] = &unk_1E16B2100;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "enumerateIndexesWithOptions:usingBlock:", 2, v8);

  objc_msgSend(v6, "addPointer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "_associateWeakSimultaneouslyPresentedGroupViews:bidirectional:", v6, 0);

}

- (id)_newActionGroupBackgroundView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupViewState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "newGroupBackgroundViewWithGroupViewState:", v5);

  return v6;
}

- (id)_interfaceActionOfFocusedRepresentationView
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIInterfaceActionGroupView _allActionViews](self, "_allActionViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isFocused") & 1) != 0)
        {
          objc_msgSend(v6, "action");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_installContentGuideConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[UIInterfaceActionGroupView _topLevelItemsMargin](self, "_topLevelItemsMargin");
  v4 = v3;
  if (-[UIInterfaceActionGroupView _shouldInstallContentGuideConstraints](self, "_shouldInstallContentGuideConstraints"))
  {
    -[UIView topAnchor](self, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentGuide, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    -[UIView bottomAnchor](self, "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentGuide, "bottomAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v7;
    -[UIView leadingAnchor](self, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_contentGuide, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v10;
    -[UIView trailingAnchor](self, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_contentGuide, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v14);
  }
  else
  {
    -[_UIContentConstraintsLayoutGuide setEdgeInsets:](self->_contentGuide, "setEdgeInsets:", v4, v4, v4, v4);
  }
}

- (BOOL)_shouldInstallContentGuideConstraints
{
  return 1;
}

- (void)_reloadStackViewContentsIfNeeded
{
  void *v3;

  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInterfaceActionGroupView _loadViewsIfNeeded](self, "_loadViewsIfNeeded");
    -[UIInterfaceActionGroupView _reloadTopSeparatorView](self, "_reloadTopSeparatorView");
    if (self->_needsUpdateTopLevelViewsArrangement)
      -[UIInterfaceActionGroupView _arrangeTopLevelViews](self, "_arrangeTopLevelViews");
    if (self->_needsUpdateActionSequenceViewArrangement)
      -[UIInterfaceActionGroupView _arrangeActionViewsInActionSequenceView](self, "_arrangeActionViewsInActionSequenceView");
    -[UIInterfaceActionGroupView _updateRoundedCornerPositionForSubviews](self, "_updateRoundedCornerPositionForSubviews");
  }
}

- (void)_updateRoundedCornerPositionForSubviews
{
  uint64_t v3;

  if (-[UIInterfaceActionGroupView _shouldShowSeparatorAboveActionsSequenceView](self, "_shouldShowSeparatorAboveActionsSequenceView"))
  {
    v3 = 12;
  }
  else
  {
    v3 = 15;
  }
  -[_UIInterfaceActionRepresentationsSequenceView setVisualCornerPosition:](self->_actionSequenceView, "setVisualCornerPosition:", v3);
}

- (double)_topLevelItemsMargin
{
  return 0.0;
}

- (void)_loadTopLevelItemsView
{
  UIView *v3;
  UIView *topLevelItemsView;
  void *v5;
  id v6;

  v3 = (UIView *)objc_opt_new();
  topLevelItemsView = self->_topLevelItemsView;
  self->_topLevelItemsView = v3;

  -[UIView setClipsToBounds:](self->_topLevelItemsView, "setClipsToBounds:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_topLevelItemsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", self->_topLevelItemsView);
  v5 = (void *)MEMORY[0x1E0D156E0];
  -[UIInterfaceActionGroupView _constraintsToPinView:toObject:identifier:](self, "_constraintsToPinView:toObject:identifier:", self->_topLevelItemsView, self->_contentGuide, CFSTR("topLevelItemsFrame"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v6);

}

- (void)_loadActionSequenceView
{
  _UIInterfaceActionRepresentationsSequenceView *v3;
  void *v4;
  _UIInterfaceActionRepresentationsSequenceView *v5;
  _UIInterfaceActionRepresentationsSequenceView *actionSequenceView;
  double v7;
  double v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *actionSequenceViewWidthAnchoredToConstantConstraint;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *actionSequenceViewWidthAnchoredToContentGuideConstraint;
  id v15;

  v3 = [_UIInterfaceActionRepresentationsSequenceView alloc];
  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIInterfaceActionRepresentationsSequenceView initWithVisualStyle:](v3, "initWithVisualStyle:", v4);
  actionSequenceView = self->_actionSequenceView;
  self->_actionSequenceView = v5;

  -[UIInterfaceActionGroupView _updateActionSequenceViewDebugLayoutIdentifier](self, "_updateActionSequenceViewDebugLayoutIdentifier");
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionSequenceView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1144733696;
  -[UIView setContentCompressionResistancePriority:forAxis:](self->_actionSequenceView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  LODWORD(v8) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self->_actionSequenceView, "setContentHuggingPriority:forAxis:", 1, v8);
  -[UIView widthAnchor](self->_actionSequenceView, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  actionSequenceViewWidthAnchoredToConstantConstraint = self->_actionSequenceViewWidthAnchoredToConstantConstraint;
  self->_actionSequenceViewWidthAnchoredToConstantConstraint = v10;

  -[UIView widthAnchor](self->_actionSequenceView, "widthAnchor");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide widthAnchor](self->_contentGuide, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  actionSequenceViewWidthAnchoredToContentGuideConstraint = self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
  self->_actionSequenceViewWidthAnchoredToContentGuideConstraint = v13;

}

- (void)_setLayoutDebuggingIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionGroupView;
  -[UIView _setLayoutDebuggingIdentifier:](&v4, sel__setLayoutDebuggingIdentifier_, a3);
  -[UIInterfaceActionGroupView _updateActionSequenceViewDebugLayoutIdentifier](self, "_updateActionSequenceViewDebugLayoutIdentifier");
}

- (void)_updateActionSequenceViewDebugLayoutIdentifier
{
  _UIInterfaceActionRepresentationsSequenceView *actionSequenceView;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  id v7;

  actionSequenceView = self->_actionSequenceView;
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIView _layoutDebuggingIdentifier](self, "_layoutDebuggingIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("groupView");
  if (v4)
    v5 = (const __CFString *)v4;
  v7 = (id)v4;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.actionsSequenceView"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _setLayoutDebuggingIdentifier:](actionSequenceView, "_setLayoutDebuggingIdentifier:", v6);

}

- (void)_loadViewsIfNeeded
{
  UIInterfaceActionSelectionTrackingController *v3;
  UIInterfaceActionSelectionTrackingController *actionSelectionController;

  if (self->_needsInitialViewLoading)
  {
    self->_needsInitialViewLoading = 0;
    v3 = -[UIInterfaceActionSelectionTrackingController initWithTrackableContainerView:actionsScrollView:]([UIInterfaceActionSelectionTrackingController alloc], "initWithTrackableContainerView:actionsScrollView:", self, self->_actionSequenceView);
    actionSelectionController = self->_actionSelectionController;
    self->_actionSelectionController = v3;

    -[UIInterfaceActionSelectionTrackingController setScrubbingEnabled:](self->_actionSelectionController, "setScrubbingEnabled:", -[UIInterfaceActionGroupView scrubbingEnabled](self, "scrubbingEnabled"));
    -[UIInterfaceActionGroupView _arrangeTopLevelViews](self, "_arrangeTopLevelViews");
    -[UIInterfaceActionGroupView _applyVisualStyle](self, "_applyVisualStyle");
  }
}

- (UIInterfaceActionSelectionTrackingController)actionSelectionController
{
  -[UIInterfaceActionGroupView _loadViewsIfNeeded](self, "_loadViewsIfNeeded");
  return self->_actionSelectionController;
}

- (void)_arrangeTopLevelViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  NSArray *v50;
  NSArray *topLevelViewArrangementConstraints;
  NSString *v52;
  void *v53;
  void *v54;
  id obj;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  self->_needsUpdateTopLevelViewsArrangement = 0;
  -[UIInterfaceActionGroupView _loadViewsIfNeeded](self, "_loadViewsIfNeeded");
  -[UIInterfaceActionGroupView _viewContainingTopLevelItems](self, "_viewContainingTopLevelItems");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[UIInterfaceActionGroupView _orderedTopLevelViews](self, "_orderedTopLevelViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "isEqual:", v6) || v8 != self->_cachedSizeCategory)
  {
    objc_storeStrong((id *)&self->_cachedSizeCategory, v8);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v66 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
            objc_msgSend(v14, "removeFromSuperview");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v6, "count"))
    {
      v52 = v8;
      v54 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v53 = v6;
      obj = v6;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v62;
        do
        {
          v20 = 0;
          v21 = v18;
          do
          {
            if (*(_QWORD *)v62 != v19)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v20);
            objc_msgSend(v56, "addSubview:", v22);
            if (v21)
            {
              objc_msgSend(v22, "topAnchor");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "bottomAnchor");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "constraintEqualToAnchor:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v25);

            }
            objc_msgSend(v22, "centerXAnchor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILayoutGuide centerXAnchor](self->_contentGuide, "centerXAnchor");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "constraintEqualToAnchor:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v28);

            -[UIInterfaceActionGroupView _widthAnchoredToContentGuideConstraintForTopLevelView:](self, "_widthAnchoredToContentGuideConstraintForTopLevelView:", v22);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v29);

            v18 = v22;
            ++v20;
            v21 = v18;
          }
          while (v17 != v20);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        }
        while (v17);
      }
      else
      {
        v18 = 0;
      }

      objc_msgSend(obj, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_contentGuide, "topAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v33);

      objc_msgSend(obj, "lastObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_contentGuide, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v37);

      if (UIContentSizeCategoryIsAccessibilityCategory(self->_cachedSizeCategory))
      {
        -[UIView heightAnchor](self->_actionSequenceView, "heightAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide heightAnchor](self->_contentGuide, "heightAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintEqualToAnchor:multiplier:", v39, 0.5);
        v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

        LODWORD(v41) = 1132003328;
        -[NSMutableArray setPriority:](v40, "setPriority:", v41);
        objc_msgSend(v15, "addObject:", v40);
      }
      else
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v40 = self->_arrangedScrollableHeaderViews;
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v58 != v44)
                objc_enumerationMutation(v40);
              objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "heightAnchor");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIView heightAnchor](self->_actionSequenceView, "heightAnchor");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:multiplier:", v47, 1.5);
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              LODWORD(v49) = 1132003328;
              objc_msgSend(v48, "setPriority:", v49);
              objc_msgSend(v15, "addObject:", v48);

            }
            v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
          }
          while (v43);
        }
      }

      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_topLevelViewArrangementConstraints);
      objc_msgSend(v15, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
      v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
      topLevelViewArrangementConstraints = self->_topLevelViewArrangementConstraints;
      self->_topLevelViewArrangementConstraints = v50;

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v15);
      -[UIView setNeedsLayout](self, "setNeedsLayout");

      v6 = v53;
      v4 = v54;
      v8 = v52;
    }
  }

}

- (id)_widthAnchoredToContentGuideConstraintForTopLevelView:(id)a3
{
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;

  if (self->_actionSequenceView == a3)
  {
    v6 = self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
  }
  else
  {
    objc_msgSend(a3, "widthAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](self->_contentGuide, "widthAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_orderedTopLevelViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[UIInterfaceActionGroupView arrangedScrollableHeaderViews](self, "arrangedScrollableHeaderViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_actionSequenceView)
  {
    if (self->_actionSequenceTopSeparatorView)
    {
      -[UIInterfaceActionGroup actions](self->_actionGroup, "actions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
        objc_msgSend(v5, "addObject:", self->_actionSequenceTopSeparatorView);
    }
    objc_msgSend(v5, "addObject:", self->_actionSequenceView);
  }
  return v5;
}

- (BOOL)_hasLoadedStackViewContents
{
  void *v2;
  BOOL v3;

  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self->_actionSequenceView, "arrangedActionRepresentationViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_arrangeActionViewsInActionSequenceView
{
  void *v3;
  void *v4;
  UIInterfaceActionGroupView *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char v28;
  UIInterfaceActionSelectionTrackingController *actionSelectionController;
  void *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  self->_needsUpdateActionSequenceViewArrangement = 0;
  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self->_actionSequenceView, "arrangedActionRepresentationViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = self;
  -[UIInterfaceActionGroup actionsBySection](self->_actionGroup, "actionsBySection");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v47;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(obj);
        v34 = v6;
        v7 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v6);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v7, "actions");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v43;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v43 != v10)
                objc_enumerationMutation(v36);
              v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              v13 = v4;
              v14 = v12;
              v50[0] = MEMORY[0x1E0C809B0];
              v50[1] = 3221225472;
              v50[2] = ___dequeueRepresentationViewWithIdenticalAction_block_invoke;
              v50[3] = &unk_1E16B2128;
              v51 = v14;
              v15 = v14;
              v16 = objc_msgSend(v13, "indexOfObjectPassingTest:", v50);
              if (v16 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v17 = 0;
              }
              else
              {
                v18 = v16;
                objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "removeObjectAtIndex:", v18);
              }

              if (!v17)
              {
                objc_msgSend(v35, "concreteVisualStyle");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = (void *)objc_msgSend(v19, "newRepresentationViewForAction:", v15);

              }
              objc_msgSend(v17, "setOwnsActionContent:", 1);
              objc_msgSend(v17, "setSpringLoaded:", -[UIInterfaceActionGroupView isSpringLoaded](v5, "isSpringLoaded"));
              objc_msgSend(v37, "addObject:", v17);
              objc_msgSend(v7, "sectionID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setSectionID:", v20);

            }
            v9 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
          }
          while (v9);
        }

        v6 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v33);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = v4;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "setOwnsActionContent:", 0);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v23);
  }

  -[UIInterfaceActionGroupView _defaultOrderingForActionRepresentationViews:](v5, "_defaultOrderingForActionRepresentationViews:", v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](v5->_actionSequenceView, "arrangedActionRepresentationViews");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqual:", v26);

  if ((v28 & 1) == 0)
  {
    -[_UIInterfaceActionRepresentationsSequenceView setArrangedActionRepresentationViews:](v5->_actionSequenceView, "setArrangedActionRepresentationViews:", v26);
    actionSelectionController = v5->_actionSelectionController;
    -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](v5->_actionSequenceView, "arrangedActionRepresentationViews");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterfaceActionSelectionTrackingController setRepresentationViews:](actionSelectionController, "setRepresentationViews:", v30);

    -[UIInterfaceActionGroupView _actionSequenceViewContentSizeDidChange](v5, "_actionSequenceViewContentSizeDidChange");
  }
  -[UIInterfaceActionGroupView _updateActionSequenceScrollability](v5, "_updateActionSequenceScrollability");

}

- (void)_updateActionSequenceScrollability
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  -[UIInterfaceActionGroupView actionGroup](self, "actionGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") >= 2
    && -[UIInterfaceActionGroupView _actionLayoutAxisUnknownDisallowedIsVertical](self, "_actionLayoutAxisUnknownDisallowedIsVertical");

  -[UIScrollView setScrollEnabled:](self->_actionSequenceView, "setScrollEnabled:", v5);
}

- (void)_determineActualLayoutAxis
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  double v20;
  void *v21;
  _UIInterfaceActionRepresentationsSequenceView *actionSequenceView;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[UIInterfaceActionGroupView _loadViewsIfNeeded](self, "_loadViewsIfNeeded");
  -[UIInterfaceActionGroupView _reloadStackViewContentsIfNeeded](self, "_reloadStackViewContentsIfNeeded");
  v3 = -[UIInterfaceActionGroupView actionLayoutAxis](self, "actionLayoutAxis");
  -[UIInterfaceActionGroupView allowedActionLayoutAxisByPriority](self, "allowedActionLayoutAxisByPriority");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    -[UIInterfaceActionGroupView allowedActionLayoutAxisByPriority](self, "allowedActionLayoutAxisByPriority");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray firstObject](v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maximumActionGroupContentSize");
    v10 = v9;

    -[UIView window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[UIView window](self, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;

      if (v10 >= v14)
        v10 = v14;
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = self->_allowedActionLayoutAxisByPriority;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v6);
          v19 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "integerValue", (_QWORD)v24);
          -[_UIInterfaceActionRepresentationsSequenceView fittingWidthForLayoutAxis:](self->_actionSequenceView, "fittingWidthForLayoutAxis:", v19);
          if (v20 < v10)
          {
            v3 = v19;
            goto LABEL_16;
          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v16)
          continue;
        break;
      }
    }
  }
LABEL_16:

  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self->_actionSequenceView, "arrangedActionRepresentationViews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  actionSequenceView = self->_actionSequenceView;
  -[UIInterfaceActionGroupView _defaultOrderingForActionRepresentationViews:](self, "_defaultOrderingForActionRepresentationViews:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInterfaceActionRepresentationsSequenceView setArrangedActionRepresentationViews:](actionSequenceView, "setArrangedActionRepresentationViews:", v23);

  -[UIInterfaceActionGroupView setActionLayoutAxis:](self, "setActionLayoutAxis:", v3);
}

- (void)_reloadTopSeparatorView
{
  uint64_t v3;
  id obj;

  obj = -[UIInterfaceActionGroupView _newSeparatorViewForSeparatingTitleAndButtons](self, "_newSeparatorViewForSeparatingTitleAndButtons");
  v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    objc_storeStrong((id *)&self->_actionSequenceTopSeparatorView, obj);
    -[UISeparatorDisplaying setConstantSizedAxis:](self->_actionSequenceTopSeparatorView, "setConstantSizedAxis:", 1);
    -[UIInterfaceActionGroupView _arrangeTopLevelViews](self, "_arrangeTopLevelViews");
  }

}

- (id)_newSeparatorViewForSeparatingTitleAndButtons
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[UIInterfaceActionGroupView _shouldShowSeparatorAboveActionsSequenceView](self, "_shouldShowSeparatorAboveActionsSequenceView"))return 0;
  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView _interfaceActionGroupViewState](self, "_interfaceActionGroupViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "newActionSeparatorViewForGroupViewState:", v4);

  return v5;
}

- (id)_interfaceActionGroupViewState
{
  void *v2;
  void *v3;

  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupViewState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_loadVisualStyleForTraitCollection:(id)a3
{
  id v4;
  UIInterfaceActionVisualStyle *activeTestingVisualStyle;
  UIInterfaceActionVisualStyle *v6;
  id WeakRetained;
  id v8;
  void *v9;

  v4 = a3;
  activeTestingVisualStyle = self->_activeTestingVisualStyle;
  if (activeTestingVisualStyle)
  {
    v6 = activeTestingVisualStyle;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);

    if (!WeakRetained
      || (v8 = objc_loadWeakRetained((id *)&self->_visualStyleProvider),
          objc_msgSend(v8, "visualStyleForTraitCollection:", v4),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      -[UIInterfaceActionGroupView defaultVisualStyleForTraitCollection:presentationStyle:](self, "defaultVisualStyleForTraitCollection:presentationStyle:", v4, self->_presentationStyle);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIInterfaceActionGroupView _visualStyleByApplyingOurTraitsToVisualStyle:traitCollection:](self, "_visualStyleByApplyingOurTraitsToVisualStyle:traitCollection:", v9, v4);
    v6 = (UIInterfaceActionVisualStyle *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_visualStyleByApplyingOurTraitsToVisualStyle:(id)a3 traitCollection:(id)a4
{
  id v6;
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
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  +[UIInterfaceActionOverrideVisualStyle styleOverride](UIInterfaceActionOverrideVisualStyle, "styleOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView _visualStyleOverrideSeparatorAttributes](self, "_visualStyleOverrideSeparatorAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomSeparatorAttributes:", v9);

  -[UIInterfaceActionGroupView visualStyleOverrideActionHighlightAttributes](self, "visualStyleOverrideActionHighlightAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomActionHighlightAttributes:", v10);

  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __91__UIInterfaceActionGroupView__visualStyleByApplyingOurTraitsToVisualStyle_traitCollection___block_invoke;
  v23 = &unk_1E16B2090;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v8, "setCustomTitleLabelFontProviderForViewState:", &v20);
  -[UIInterfaceActionGroupView _selectionHighlightContinuousCornerRadius](self, "_selectionHighlightContinuousCornerRadius", v20, v21, v22, v23);
  objc_msgSend(v8, "setCustomSelectionHighlightContinuousCornerRadius:");
  objc_msgSend(v8, "setAlignActionSeparatorLeadingEdgeWithContent:", -[UIInterfaceActionGroupView _alignActionSeparatorLeadingEdgeWithContent](self, "_alignActionSeparatorLeadingEdgeWithContent"));
  objc_msgSend(v6, "groupViewState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithTraitCollection:", v7);

  -[UIView window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "copyWithScreen:", v14);

  v16 = (void *)objc_msgSend(v15, "copyWithVerticalLayoutAxis:", -[UIInterfaceActionGroupView _actionLayoutAxisUnknownDisallowedIsVertical](self, "_actionLayoutAxisUnknownDisallowedIsVertical"));
  v17 = (void *)objc_msgSend(v16, "copyWithResolvedPresentationStyle:", self->_presentationStyle);

  v18 = (void *)objc_msgSend(v6, "copyWithGroupViewState:", v17);
  objc_msgSend(v18, "setVisualStyleOverride:", v8);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

id __91__UIInterfaceActionGroupView__visualStyleByApplyingOurTraitsToVisualStyle_traitCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_visualStyleOverrideTitleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_applyVisualStyle
{
  double v3;
  id obj;

  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!-[UIInterfaceActionVisualStyle isEqual:](self->_appliedVisualStyle, "isEqual:"))
  {
    objc_msgSend(obj, "maximumActionGroupContentSize");
    -[_UIContentConstraintsLayoutGuide setMaximumSize:](self->_contentGuide, "setMaximumSize:");
    objc_msgSend(obj, "contentCornerRadius");
    -[_UIContentConstraintsLayoutGuide setMinimumSize:](self->_contentGuide, "setMinimumSize:", v3 * 3.0, 0.0);
    -[UIInterfaceActionGroupView _applyVisualStyleToActionsViewScrollView](self, "_applyVisualStyleToActionsViewScrollView");
    -[UIInterfaceActionGroupView _applyVisualStyleToBackgroundViewDisplay](self, "_applyVisualStyleToBackgroundViewDisplay");
    -[UIInterfaceActionSelectionTrackingController setSelectByPressGestureEnabled:](self->_actionSelectionController, "setSelectByPressGestureEnabled:", objc_msgSend(obj, "selectByPressGestureRequired"));
    -[UIInterfaceActionSelectionTrackingController setSelectionFeedbackEnabled:](self->_actionSelectionController, "setSelectionFeedbackEnabled:", objc_msgSend(obj, "selectionFeedbackEnabled"));
    -[UIInterfaceActionSelectionTrackingController setSelectByIndirectPointerTouchEnabled:](self->_actionSelectionController, "setSelectByIndirectPointerTouchEnabled:", objc_msgSend(obj, "selectByIndirectPointerTouchRequired"));
    objc_storeStrong((id *)&self->_appliedVisualStyle, obj);
  }

}

- (void)_applyVisualStyleToActionsViewScrollView
{
  _UIInterfaceActionRepresentationsSequenceView *actionSequenceView;
  void *v4;
  id v5;

  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIInterfaceActionRepresentationsSequenceView setVisualStyle:](self->_actionSequenceView, "setVisualStyle:", v5);
  actionSequenceView = self->_actionSequenceView;
  -[UIInterfaceActionGroupView _interfaceActionGroupViewState](self, "_interfaceActionGroupViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureAttributesForActionScrollView:groupViewState:", actionSequenceView, v4);

}

- (void)_applyVisualStyleToBackgroundViewDisplay
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView _interfaceActionGroupViewState](self, "_interfaceActionGroupViewState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIInterfaceActionGroupView _drawsBackground](self, "_drawsBackground")
    || (v5 = objc_msgSend(v3, "newGroupBackgroundViewWithGroupViewState:", v4)) == 0)
  {
    v5 = objc_opt_new();
  }
  v7 = (id)v5;
  v6 = objc_opt_class();
  if (v6 != objc_opt_class())
    -[UIInterfaceActionGroupView _addBackgroudViewToViewHierarchy:](self, "_addBackgroudViewToViewHierarchy:", v7);
  -[UIInterfaceActionGroupView _applyVisualStyleCornerRadius](self, "_applyVisualStyleCornerRadius");
  -[UIView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
  -[UIInterfaceActionGroupView _arrangeTopLevelViews](self, "_arrangeTopLevelViews");

}

- (void)_applyVisualStyleCornerRadius
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  UIView *backgroundView;

  v3 = 0.0;
  if (-[UIInterfaceActionGroupView _isCornerRadiusDisplayEnabled](self, "_isCornerRadiusDisplayEnabled"))
  {
    -[UIInterfaceActionGroupView visualStyle](self, "visualStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentCornerRadius");
    v3 = v5;

  }
  -[UIInterfaceActionGroupView _topLevelItemsMargin](self, "_topLevelItemsMargin");
  if (v6 == 0.0)
  {
    -[UIInterfaceActionGroupView _viewContainingTopLevelItems](self, "_viewContainingTopLevelItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setContinuousCornerRadius:", v3);

  }
  v8 = -[UIView conformsToProtocol:](self->_backgroundView, "conformsToProtocol:", &unk_1EDE20938);
  backgroundView = self->_backgroundView;
  if (v8)
    -[UIView setCornerRadius:](backgroundView, "setCornerRadius:", v3);
  else
    -[UIView _setContinuousCornerRadius:](backgroundView, "_setContinuousCornerRadius:", v3);
}

- (void)_addBackgroudViewToViewHierarchy:(id)a3
{
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;
  void *v7;
  id v8;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;
  v6 = v4;

  -[UIView addSubview:](self, "addSubview:", self->_backgroundView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)MEMORY[0x1E0D156E0];
  -[UIInterfaceActionGroupView _constraintsToPinView:toObject:identifier:](self, "_constraintsToPinView:toObject:identifier:", self->_backgroundView, self, CFSTR("backgroundViewFrame"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateConstraints:", v8);

}

- (BOOL)_actionLayoutAxisUnknownDisallowedIsVertical
{
  return -[UIInterfaceActionGroupView _actionLayoutAxisUnknowDisallowed](self, "_actionLayoutAxisUnknowDisallowed") == 1;
}

- (int64_t)_actionLayoutAxisUnknowDisallowed
{
  void *v3;
  int64_t v4;

  if (self->_actionLayoutAxis != -1)
    return self->_actionLayoutAxis;
  -[NSArray firstObject](self->_allowedActionLayoutAxisByPriority, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)_constraintsToPinView:(id)a3 toObject:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend(v7, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v16);

  objc_msgSend(v7, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v19);

  objc_msgSend(v10, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 1144750080;
  objc_msgSend(v20, "setPriority:", v21);

  objc_msgSend(v7, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v24);

  objc_msgSend(v10, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 1144750080;
  objc_msgSend(v25, "setPriority:", v26);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = v10;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v35;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v31++), "setIdentifier:", v9, (_QWORD)v34);
      }
      while (v29 != v31);
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v29);
  }

  objc_msgSend(v27, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)_updateActionSequenceViewActionLayoutAxis
{
  int64_t actionLayoutAxis;
  uint64_t v4;

  actionLayoutAxis = self->_actionLayoutAxis;
  if (actionLayoutAxis != -1)
  {
    v4 = actionLayoutAxis == 1;
    if (-[_UIInterfaceActionRepresentationsSequenceView actionLayoutAxis](self->_actionSequenceView, "actionLayoutAxis") != v4)
    {
      -[_UIInterfaceActionRepresentationsSequenceView setActionLayoutAxis:](self->_actionSequenceView, "setActionLayoutAxis:", v4);
      -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
      -[UIInterfaceActionGroupView _updateActionSequenceScrollability](self, "_updateActionSequenceScrollability");
      -[UIInterfaceActionGroupView _setNeedsUpdateActionSequenceViewArrangement](self, "_setNeedsUpdateActionSequenceViewArrangement");
      -[UIInterfaceActionGroupView _actionSequenceViewContentSizeDidChange](self, "_actionSequenceViewContentSizeDidChange");
    }
  }
}

- (id)_defaultOrderingForActionRepresentationViews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", &__block_literal_global_8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v7, "removeObjectsInArray:", v6);
  if (self->_actionLayoutAxis)
  {
    v8 = v7;
    v9 = v6;
  }
  else
  {
    v8 = v6;
    v9 = v7;
  }
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __75__UIInterfaceActionGroupView__defaultOrderingForActionRepresentationViews___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 1;

  return v3;
}

- (id)_actionRepresentationViewForAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self->_actionSequenceView, "arrangedActionRepresentationViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "action");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_scrollPreferredActionRepresentationViewToVisibleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UIInterfaceActionGroupView actionGroup](self, "actionGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionGroupView _scrollActionRepresentationViewToVisibleForAction:animated:](self, "_scrollActionRepresentationViewToVisibleForAction:animated:", v5, v3);

}

- (void)_scrollActionRepresentationViewToVisibleForAction:(id)a3 animated:(BOOL)a4
{
  id v6;
  double x;
  double y;
  double width;
  double height;
  BOOL IsEmpty;
  id v12;
  _QWORD v13[9];
  CGRect v14;

  v6 = a3;
  if (v6)
  {
    v12 = v6;
    -[UIInterfaceActionGroupView _actionSequenceVisibleRectForMakingCenteredAction:](self, "_actionSequenceVisibleRectForMakingCenteredAction:", v6);
    x = v14.origin.x;
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
    IsEmpty = CGRectIsEmpty(v14);
    v6 = v12;
    if (!IsEmpty)
    {
      if (a4)
      {
        -[UIScrollView scrollRectToVisible:animated:](self->_actionSequenceView, "scrollRectToVisible:animated:", 1, x, y, width, height);
      }
      else
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __89__UIInterfaceActionGroupView__scrollActionRepresentationViewToVisibleForAction_animated___block_invoke;
        v13[3] = &unk_1E16B20D8;
        v13[4] = self;
        *(double *)&v13[5] = x;
        *(double *)&v13[6] = y;
        *(double *)&v13[7] = width;
        *(double *)&v13[8] = height;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
      }
      v6 = v12;
    }
  }

}

uint64_t __89__UIInterfaceActionGroupView__scrollActionRepresentationViewToVisibleForAction_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "scrollRectToVisible:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)_actionSequenceVisibleRectForMakingCenteredAction:(id)a3
{
  void *v4;
  void *v5;
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
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  -[UIInterfaceActionGroupView _actionRepresentationViewForAction:](self, "_actionRepresentationViewForAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIScrollView visibleBounds](self->_actionSequenceView, "visibleBounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = -[UIInterfaceActionGroupView _actionLayoutAxisUnknownDisallowedIsVertical](self, "_actionLayoutAxisUnknownDisallowedIsVertical");
    -[UIScrollView contentSize](self->_actionSequenceView, "contentSize");
    if (v22)
    {
      v25 = v9 - fmax((v21 - v13) * 0.5, 0.0);
      v26 = v24 - v21;
      if (v25 >= v26)
        v25 = v26;
      if (v25 >= 0.0)
        v17 = v25;
      else
        v17 = 0.0;
    }
    else
    {
      v27 = v7 - fmax((v19 - v11) * 0.5, 0.0);
      v28 = v23 - v19;
      if (v27 < v28)
        v28 = v27;
      if (v28 >= 0.0)
        v15 = v28;
      else
        v15 = 0.0;
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v29 = v15;
  v30 = v17;
  v31 = v19;
  v32 = v21;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_setUsAsThePresentingViewControllerForAllActions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[UIInterfaceActionGroup actions](self->_actionGroup, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_setPresentingController:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_removeUsAsThePresentingViewControllerForAllActions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  UIInterfaceActionGroupView *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIInterfaceActionGroup actions](self->_actionGroup, "actions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "_presentingController");
        v9 = (UIInterfaceActionGroupView *)objc_claimAutoreleasedReturnValue();

        if (v9 == self)
          objc_msgSend(v8, "_setPresentingController:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (id)_allActionViews
{
  return -[_UIInterfaceActionRepresentationsSequenceView arrangedActionRepresentationViews](self->_actionSequenceView, "arrangedActionRepresentationViews");
}

- (id)_viewDisplayingRoundedBackground
{
  return self->_backgroundView;
}

- (id)_viewContainingTopLevelItems
{
  return self->_topLevelItemsView;
}

- (void)_setNeedsUpdateTopLevelViewsArrangement
{
  self->_needsUpdateTopLevelViewsArrangement = 1;
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_setNeedsUpdateActionSequenceViewArrangement
{
  self->_needsUpdateActionSequenceViewArrangement = 1;
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (BOOL)_shouldShowSeparatorAboveActionsSequenceView
{
  void *v3;
  BOOL v4;

  -[UIInterfaceActionGroup actions](self->_actionGroup, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = -[NSMutableArray count](self->_arrangedScrollableHeaderViews, "count") != 0;
  else
    v4 = 0;

  return v4;
}

- (CGRect)_contentEdgeFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UILayoutGuide layoutFrame](self->_contentGuide, "layoutFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_setDrawsBackground:(BOOL)a3
{
  if (self->_drawsBackground != a3)
  {
    self->_drawsBackground = a3;
    -[UIInterfaceActionGroupView _applyVisualStyleToBackgroundViewDisplay](self, "_applyVisualStyleToBackgroundViewDisplay");
  }
}

- (void)_setSelectionHighlightContinuousCornerRadius:(double)a3
{
  if (self->_selectionHighlightContinuousCornerRadius != a3)
  {
    self->_selectionHighlightContinuousCornerRadius = a3;
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
  }
}

- (void)_setAlignActionSeparatorLeadingEdgeWithContent:(BOOL)a3
{
  if (self->_alignActionSeparatorLeadingEdgeWithContent != a3)
  {
    self->_alignActionSeparatorLeadingEdgeWithContent = a3;
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
  }
}

- (void)_setVisualStyleOverrideSeparatorAttributes:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIInterfaceActionSeparatorAttributes isEqual:](self->_visualStyleOverrideSeparatorAttributes, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_visualStyleOverrideSeparatorAttributes, a3);
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
  }

}

- (void)_setVisualStyleOverrideActionHighlightAttributes:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIInterfaceActionHighlightAttributes isEqual:](self->_visualStyleOverrideActionHighlightAttributes, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_visualStyleOverrideActionHighlightAttributes, a3);
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
  }

}

- (void)_setVisualStyleOverrideTitleLabelFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIFont isEqual:](self->_visualStyleOverrideTitleLabelFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualStyleOverrideTitleLabelFont, a3);
    -[UIInterfaceActionGroupView reloadVisualStyle](self, "reloadVisualStyle");
  }

}

- (BOOL)_isCornerRadiusDisplayEnabled
{
  return self->_drawsBackground;
}

- (id)_alertController
{
  return 0;
}

- (UIInterfaceActionVisualStyleProviding)visualStyleProvider
{
  return (UIInterfaceActionVisualStyleProviding *)objc_loadWeakRetained((id *)&self->_visualStyleProvider);
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (UIInterfaceActionGroup)actionGroup
{
  return self->_actionGroup;
}

- (UIInterfaceActionHandlerInvocationDelegate)actionHandlerInvocationDelegate
{
  return (UIInterfaceActionHandlerInvocationDelegate *)objc_loadWeakRetained((id *)&self->_actionHandlerInvocationDelegate);
}

- (void)setActionHandlerInvocationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandlerInvocationDelegate, a3);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (NSArray)allowedActionLayoutAxisByPriority
{
  return self->_allowedActionLayoutAxisByPriority;
}

- (int64_t)actionLayoutAxis
{
  return self->_actionLayoutAxis;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (UIInterfaceActionVisualStyle)appliedVisualStyle
{
  return self->_appliedVisualStyle;
}

- (void)setAppliedVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_appliedVisualStyle, a3);
}

- (_UIContentConstraintsLayoutGuide)contentGuide
{
  return self->_contentGuide;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)topLevelItemsView
{
  return self->_topLevelItemsView;
}

- (NSArray)topLevelViewArrangementConstraints
{
  return self->_topLevelViewArrangementConstraints;
}

- (NSMutableArray)arrangedScrollableHeaderViews
{
  return self->_arrangedScrollableHeaderViews;
}

- (UISeparatorDisplaying)actionSequenceTopSeparatorView
{
  return self->_actionSequenceTopSeparatorView;
}

- (NSLayoutConstraint)actionSequenceViewWidthAnchoredToConstantConstraint
{
  return self->_actionSequenceViewWidthAnchoredToConstantConstraint;
}

- (NSLayoutConstraint)actionSequenceViewWidthAnchoredToContentGuideConstraint
{
  return self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
}

- (NSPointerArray)weakSimultaneouslyPresentedGroupViews
{
  return self->_weakSimultaneouslyPresentedGroupViews;
}

- (BOOL)showsSeparatorAboveActions
{
  return self->_showsSeparatorAboveActions;
}

- (void)setShowsSeparatorAboveActions:(BOOL)a3
{
  self->_showsSeparatorAboveActions = a3;
}

- (_UIInterfaceActionRepresentationsSequenceView)actionSequenceView
{
  return self->_actionSequenceView;
}

- (UILongPressGestureRecognizer)actionSelectionGestureRecognizer
{
  return self->_actionSelectionGestureRecognizer;
}

- (void)setActionSelectionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_actionSelectionGestureRecognizer, a3);
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (double)requiredActionRepresentationWidth
{
  return self->_requiredActionRepresentationWidth;
}

- (void)setPreferredActionRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_preferredActionRepresentation, a3);
}

- (BOOL)focusAvoidsNonDefaultActionsIfPossible
{
  return self->_focusAvoidsNonDefaultActionsIfPossible;
}

- (void)setFocusAvoidsNonDefaultActionsIfPossible:(BOOL)a3
{
  self->_focusAvoidsNonDefaultActionsIfPossible = a3;
}

- (UIInterfaceActionHighlightAttributes)visualStyleOverrideActionHighlightAttributes
{
  return self->_visualStyleOverrideActionHighlightAttributes;
}

- (UIInterfaceActionSeparatorAttributes)_visualStyleOverrideSeparatorAttributes
{
  return self->_visualStyleOverrideSeparatorAttributes;
}

- (UIFont)_visualStyleOverrideTitleLabelFont
{
  return self->_visualStyleOverrideTitleLabelFont;
}

- (BOOL)_drawsBackground
{
  return self->_drawsBackground;
}

- (double)_selectionHighlightContinuousCornerRadius
{
  return self->_selectionHighlightContinuousCornerRadius;
}

- (BOOL)_alignActionSeparatorLeadingEdgeWithContent
{
  return self->_alignActionSeparatorLeadingEdgeWithContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyleOverrideTitleLabelFont, 0);
  objc_storeStrong((id *)&self->_visualStyleOverrideSeparatorAttributes, 0);
  objc_storeStrong((id *)&self->_visualStyleOverrideActionHighlightAttributes, 0);
  objc_storeStrong((id *)&self->_preferredActionRepresentation, 0);
  objc_storeStrong((id *)&self->_actionSelectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionSequenceView, 0);
  objc_storeStrong((id *)&self->_weakSimultaneouslyPresentedGroupViews, 0);
  objc_storeStrong((id *)&self->_actionSequenceViewWidthAnchoredToContentGuideConstraint, 0);
  objc_storeStrong((id *)&self->_actionSequenceViewWidthAnchoredToConstantConstraint, 0);
  objc_storeStrong((id *)&self->_actionSequenceTopSeparatorView, 0);
  objc_storeStrong((id *)&self->_arrangedScrollableHeaderViews, 0);
  objc_storeStrong((id *)&self->_topLevelViewArrangementConstraints, 0);
  objc_storeStrong((id *)&self->_topLevelItemsView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentGuide, 0);
  objc_storeStrong((id *)&self->_appliedVisualStyle, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_allowedActionLayoutAxisByPriority, 0);
  objc_destroyWeak((id *)&self->_actionHandlerInvocationDelegate);
  objc_storeStrong((id *)&self->_actionGroup, 0);
  objc_storeStrong((id *)&self->_actionSelectionController, 0);
  objc_destroyWeak((id *)&self->_visualStyleProvider);
  objc_storeStrong((id *)&self->_cachedSizeCategory, 0);
  objc_storeStrong((id *)&self->_activeTestingVisualStyle, 0);
}

@end
