@implementation UISwipeActionPullView

- (UISwipeActionPullView)initWithFrame:(CGRect)a3 cellEdge:(unint64_t)a4 style:(unint64_t)a5
{
  UISwipeActionPullView *v7;
  UISwipeActionPullView *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UISwipeActionPullView;
  v7 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_cellEdge = a4;
    v7->_style = a5;
    -[UIView traitCollection](v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", objc_msgSend(v9, "userInterfaceIdiom"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwipeActionPullView setVisualStyle:](v8, "setVisualStyle:", v10);

    -[UIView layer](v8, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anchorPoint");
    v13 = v12;

    if (v8->_cellEdge == 2)
      v14 = 4;
    else
      v14 = 1;
    if (v8->_cellEdge == 2)
      v15 = 0.0;
    else
      v15 = 1.0;
    -[UIView layer](v8, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchorPoint:", v15, v13);

    -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", v14);
    -[UIView _setOverrideUserInterfaceRenderingMode:](v8, "_setOverrideUserInterfaceRenderingMode:", 1);
  }
  return v8;
}

- (UIContextualAction)primarySwipeAction
{
  char *v3;

  v3 = -[UISwipeActionPullView _swipeActionCount](self, "_swipeActionCount");
  if (v3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", v3 - 1);
    v3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return (UIContextualAction *)v3;
}

- (BOOL)primaryActionIsDestructive
{
  void *v2;
  char v3;

  -[UISwipeActionPullView primarySwipeAction](self, "primarySwipeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDestructive");

  return v3;
}

- (BOOL)hasActions
{
  return -[UISwipeActionPullView _swipeActionCount](self, "_swipeActionCount") != 0;
}

- (UIColor)primaryActionColor
{
  void *v2;
  void *v3;

  -[UISwipeActionPullView primarySwipeAction](self, "primarySwipeAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setButtonsUnderlapSwipedView:(BOOL)a3
{
  void *v4;
  double v5;

  self->_buttonsUnderlapSwipedView = a3;
  if (a3)
  {
    -[UISwipeActionPullView visualStyle](self, "visualStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultButtonWidth");
    self->_minimumOffset = v5;

  }
  else
  {
    self->_minimumOffset = 0.0;
  }
  -[UIView setClipsToBounds:](self, "setClipsToBounds:");
}

- (double)openThreshold
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  result = self->_openThreshold;
  if (result == 0.0)
  {
    if (-[UISwipeActionPullView hasActions](self, "hasActions"))
    {
      -[UISwipeActionPullView contentInsets](self, "contentInsets");
      v5 = v4;
      -[UISwipeActionPullView contentInsets](self, "contentInsets");
      v7 = v5 + v6;
      -[UISwipeActionPullView _paddingToSwipedView](self, "_paddingToSwipedView");
      v9 = v8 + v7;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = self->_buttons;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "buttonWidth", (_QWORD)v19);
            v9 = v9 + v15;
            ++v14;
          }
          while (v12 != v14);
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

      -[UISwipeActionPullView _totalInterButtonPadding](self, "_totalInterButtonPadding");
      v17 = v9 + v16;
      -[UISwipeActionPullView _directionalMultiplier](self, "_directionalMultiplier");
      result = v17 * v18;
      self->_openThreshold = result;
    }
    else
    {
      return self->_openThreshold;
    }
  }
  return result;
}

- (double)confirmationThreshold
{
  double v3;
  double v4;
  id WeakRetained;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double confirmationThreshold;
  double openThreshold;
  double v12;

  if (self->_confirmationThreshold == 0.0 && -[UISwipeActionPullView hasActions](self, "hasActions"))
  {
    -[UISwipeActionPullView _directionalMultiplier](self, "_directionalMultiplier");
    v4 = v3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "confirmationDistanceForPrimaryActionInSwipeActionPullView:", self);
    UIRoundToViewScale(0);
    self->_confirmationThreshold = v4 * v6;

  }
  -[UIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 6)
    return self->_confirmationThreshold;
  -[UISwipeActionPullView _directionalMultiplier](self, "_directionalMultiplier");
  confirmationThreshold = self->_confirmationThreshold;
  if (confirmationThreshold < 0.0)
    confirmationThreshold = -confirmationThreshold;
  openThreshold = self->_openThreshold;
  if (openThreshold < 0.0)
    openThreshold = -openThreshold;
  v12 = openThreshold + 24.0;
  if (confirmationThreshold < v12)
    confirmationThreshold = v12;
  return v9 * confirmationThreshold;
}

- (double)_directionalMultiplier
{
  unint64_t v2;
  double result;

  v2 = -[UISwipeActionPullView cellEdge](self, "cellEdge");
  result = 1.0;
  if (v2 == 8)
    return -1.0;
  return result;
}

- (unint64_t)_swipeActionCount
{
  return -[NSArray count](self->_actions, "count");
}

- (Class)_buttonClass
{
  void *v2;

  if (self->_style > 2)
    v2 = 0;
  else
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

- (double)_paddingToSwipedView
{
  void *v3;
  double v4;
  double v5;

  -[UISwipeActionPullView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paddingToSwipeViewForStyle:", self->_style);
  v5 = v4;

  return v5;
}

- (double)_interButtonPadding
{
  void *v3;
  double v4;
  double v5;

  -[UISwipeActionPullView visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interButtonPaddingForStyle:", self->_style);
  v5 = v4;

  return v5;
}

- (double)_totalInterButtonPadding
{
  uint64_t v3;
  double result;
  uint64_t v5;
  double v6;

  v3 = -[NSMutableArray count](self->_buttons, "count");
  result = 0.0;
  if (v3 >= 2)
  {
    v5 = v3;
    -[UISwipeActionPullView _interButtonPadding](self, "_interButtonPadding", 0.0);
    return v6 * (double)(v5 - 1);
  }
  return result;
}

- (void)_setupClippingViewIfNeeded
{
  unint64_t style;
  UIView *clippingView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  UIView *v9;
  UIView *v10;

  style = self->_style;
  clippingView = self->_clippingView;
  if (style == 2)
  {
    if (!clippingView)
    {
      v5 = [UIView alloc];
      -[UIView bounds](self, "bounds");
      v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
      v7 = self->_clippingView;
      self->_clippingView = v6;

      -[UIView layer](self->_clippingView, "layer");
      v10 = (UIView *)objc_claimAutoreleasedReturnValue();
      -[UIView setMasksToBounds:](v10, "setMasksToBounds:", 1);
      -[UIView setMaskedCorners:](v10, "setMaskedCorners:", 15);
      -[UIView setCornerCurve:](v10, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
      if (self->_roundedStyleCornerRadius > 0.0)
      {
        -[UIView setCornerRadius:](v10, "setCornerRadius:");
      }
      else
      {
        -[UISwipeActionPullView visualStyle](self, "visualStyle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "buttonCornerRadiusForStyle:view:", self->_style, self);
        -[UIView setCornerRadius:](v10, "setCornerRadius:");

      }
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_clippingView, 0);
      v9 = v10;
      goto LABEL_10;
    }
  }
  else if (clippingView)
  {
    -[UIView removeFromSuperview](clippingView, "removeFromSuperview");
    v9 = self->_clippingView;
    self->_clippingView = 0;
LABEL_10:

  }
}

- (void)_rebuildButtons
{
  unint64_t v3;
  uint64_t v4;
  NSMutableArray *buttons;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  UISwipeActionPullView *clippingView;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double minimumOffset;
  double v14;
  double v15;
  double Height;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  UISwipeActionPullView *v40;
  CGRect v41;

  v3 = -[UISwipeActionPullView _swipeActionCount](self, "_swipeActionCount");
  v4 = 424;
  buttons = self->_buttons;
  if (!buttons)
    goto LABEL_5;
  if (v3 == -[NSMutableArray count](buttons, "count"))
    return;
  v6 = self->_buttons;
  if (v6)
  {
    -[NSMutableArray makeObjectsPerformSelector:](v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);
    -[NSMutableArray removeAllObjects](self->_buttons, "removeAllObjects");
  }
  else
  {
LABEL_5:
    v7 = (NSMutableArray *)objc_opt_new();
    v8 = self->_buttons;
    self->_buttons = v7;

  }
  -[UISwipeActionPullView _setupClippingViewIfNeeded](self, "_setupClippingViewIfNeeded");
  clippingView = (UISwipeActionPullView *)self->_clippingView;
  if (!clippingView)
    clippingView = self;
  v40 = clippingView;
  v10 = -[UISwipeActionPullView cellEdge](self, "cellEdge");
  v11 = 1;
  if (v10 != 8)
    v11 = 2;
  v38 = v11;
  if (v10 == 8)
    v12 = 0.0;
  else
    v12 = 1.0;
  minimumOffset = self->_minimumOffset;
  -[UISwipeActionPullView confirmationThreshold](self, "confirmationThreshold");
  if (v14 >= 0.0)
    v15 = v14;
  else
    v15 = -v14;
  -[UIView bounds](v40, "bounds");
  Height = CGRectGetHeight(v41);
  if (self->_style)
    v17 = 0;
  else
    v17 = v3 == 1;
  if (v17)
  {
    -[NSArray firstObject](self->_actions, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "forcesFallbackBackgroundColor"))
    {
      -[UISwipeActionPullView visualStyle](self, "visualStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "defaultButtonBackgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v18, "backgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", v20);

  }
  else
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  -[UIView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "defaultImageSymbolConfigurationForTraitCollection:", v23);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v24 = v15 * 3.0;
    v37 = *MEMORY[0x1E0CD2A68];
    do
    {
      v25 = v4;
      v26 = (void *)objc_msgSend(objc_alloc(-[UISwipeActionPullView _buttonClass](self, "_buttonClass", v37)), "initWithFrame:", minimumOffset, 0.0, v24, Height);
      -[UISwipeActionPullView visualStyle](self, "visualStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setVisualStyle:", v27);

      if (self->_style == 2)
      {
        objc_msgSend(v26, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setMasksToBounds:", 1);

        objc_msgSend(v26, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setCornerCurve:", v37);

        -[UISwipeActionPullView visualStyle](self, "visualStyle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "interitemButtonCornerRadiusForStyle:", self->_style);
        v32 = v31;
        objc_msgSend(v26, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setCornerRadius:", v32);

        v4 = v25;
      }
      else
      {
        objc_opt_class();
        v4 = v25;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UISwipeActionPullView confirmationThreshold](self, "confirmationThreshold");
          if (v34 < 0.0)
            v34 = -v34;
          objc_msgSend(v26, "setExtensionLength:", v34 * 3.0);
        }
      }
      objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__tappedButton_, 64);
      objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__pressedButton_, 1);
      objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__unpressedButton_, 384);
      objc_msgSend(v26, "setPreferredSymbolConfiguration:forImageInState:", v39, 0);
      objc_msgSend(v26, "setContentHorizontalAlignment:", v38);
      objc_msgSend(v26, "titleLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTextAlignment:", 1);

      objc_msgSend(v26, "_outermostLayer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAnchorPoint:", v12, 0.5);

      objc_msgSend(v26, "setFrame:", minimumOffset, 0.0, v24, Height);
      objc_msgSend(v26, "setAutosizes:", -[UISwipeActionPullView autosizesButtons](self, "autosizesButtons"));
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v4), "addObject:", v26);
      -[UIView addSubview:](v40, "addSubview:", v26);

      --v3;
    }
    while (v3);
  }

}

- (void)layoutSubviews
{
  NSMutableArray *buttons;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISwipeActionPullView;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  if (self->_swipeActionsDidChange)
  {
    self->_swipeActionsDidChange = 0;
    self->_openThreshold = 0.0;
    self->_confirmationThreshold = 0.0;
    -[UISwipeActionPullView _rebuildButtons](self, "_rebuildButtons");
    buttons = self->_buttons;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __39__UISwipeActionPullView_layoutSubviews__block_invoke;
    v4[3] = &unk_1E16E3410;
    v4[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v4);
  }
}

void __39__UISwipeActionPullView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(v5, "setImage:forState:", v7, 0);
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v9, 0);

  objc_msgSend(v6, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __39__UISwipeActionPullView_layoutSubviews__block_invoke_2;
  v21[3] = &unk_1E16B1DC8;
  v11 = v10;
  v22 = v11;
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultBackgroundColor:", v11);
  objc_msgSend(v5, "setHighlightedBackgroundColor:", v12);
  objc_msgSend(v6, "_menu");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v5, "setMenu:", v13);
    objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v5, "setSwipeActionButtonDelegate:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v5, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v5, "buttonWidth");
  objc_msgSend(v5, "setFrame:", v15, v17, v20, v19);

}

id __39__UISwipeActionPullView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  v5 = *(_QWORD *)(a1 + 32);
  if (v4 == 2)
    +[UIColor _accessibilityLightenedColorForColor:](UIColor, "_accessibilityLightenedColorForColor:", v5);
  else
    +[UIColor _accessibilityDarkenedColorForColor:](UIColor, "_accessibilityDarkenedColorForColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISwipeActionPullView _setWidth:](self, "_setWidth:", CGRectGetWidth(a3));
  v8.receiver = self;
  v8.super_class = (Class)UISwipeActionPullView;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  objc_super v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)UISwipeActionPullView;
  -[UIView setBounds:](&v8, sel_setBounds_, x, y);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  -[UISwipeActionPullView _setWidth:](self, "_setWidth:", CGRectGetWidth(v9));
}

- (void)_setWidth:(double)a3
{
  double v5;

  -[UISwipeActionPullView _directionalMultiplier](self, "_directionalMultiplier");
  -[UISwipeActionPullView moveToOffset:extraOffset:animator:usingSpringWithStiffness:initialVelocity:](self, "moveToOffset:extraOffset:animator:usingSpringWithStiffness:initialVelocity:", 0, v5 * a3, 0.0, 0.0, 0.0);
}

- (void)_setLayerBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30 = *MEMORY[0x1E0C80C00];
  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBounds:", x, y, width, height);

  -[UISwipeActionPullView _layoutClippingLayer](self, "_layoutClippingLayer");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_buttons;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "bounds", (_QWORD)v25);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v14, "superview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bounds");
        v22 = CGRectGetHeight(v31);

        objc_msgSend(v14, "setBounds:", v16, v18, v20, v22);
        objc_msgSend(v14, "center");
        v24 = v23;
        v32.origin.x = v16;
        v32.origin.y = v18;
        v32.size.width = v20;
        v32.size.height = v22;
        objc_msgSend(v14, "setCenter:", v24, CGRectGetMidY(v32));
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

}

- (void)_layoutClippingLayer
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
  double left;
  CGFloat v13;
  void *v14;
  double MidX;
  double MidY;
  id v17;
  CGRect v18;
  CGRect v19;

  if (self->_clippingView)
  {
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    if (-[UISwipeActionPullView cellEdge](self, "cellEdge") == 2)
    {
      left = self->_contentInsets.left;
      v5 = v5 + left;
    }
    else
    {
      left = self->_contentInsets.right;
    }
    v13 = fmax(v9 - left, 0.0);
    -[UIView layer](self->_clippingView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBounds:", v5, v7, v13, v11);

    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v13;
    v18.size.height = v11;
    MidX = CGRectGetMidX(v18);
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v13;
    v19.size.height = v11;
    MidY = CGRectGetMidY(v19);
    -[UIView layer](self->_clippingView, "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPosition:", MidX, MidY);

  }
}

- (void)resetView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__UISwipeActionPullView_resetView__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

uint64_t __34__UISwipeActionPullView_resetView__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  double v9;
  double *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 424);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "_outermostLayer", (_QWORD)v18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeAllAnimations");

        v9 = 0.0;
        if (objc_msgSend(*(id *)(a1 + 32), "buttonsUnderlapSwipedView"))
        {
          v10 = *(double **)(a1 + 32);
          v11 = fmax(v10[59], 0.0);
          objc_msgSend(v10, "_directionalMultiplier");
          v9 = v12 * v11;
        }
        objc_msgSend(v7, "_outermostLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "position");
        v15 = v14;
        objc_msgSend(v7, "_outermostLayer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPosition:", v9, v15);

        objc_msgSend(v7, "setMenu:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 449) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
}

- (void)freeze
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double Width;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = self->_buttons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v7), "_outermostLayer", (_QWORD)v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "position");
        v10 = v9;
        objc_msgSend(v8, "presentationLayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "position");
        v13 = v12;

        objc_msgSend(v8, "setPosition:", v13, v10);
        objc_msgSend(v8, "removeAllAnimations");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  -[UIView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[UIView layer](self, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentationLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  Width = CGRectGetWidth(v31);

  -[UISwipeActionPullView _setLayerBounds:](self, "_setLayerBounds:", v16, v18, Width, v20);
  -[UIView layer](self, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllAnimations");

}

- (void)configureWithSwipeActions:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *actions;

  objc_msgSend(a3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actions = self->_actions;
  self->_actions = v5;

  -[UISwipeActionPullView setState:](self, "setState:", 0);
  self->_swipeActionsDidChange = 1;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)moveToOffset:(double)a3 extraOffset:(double)a4 animator:(id)a5 usingSpringWithStiffness:(double)a6 initialVelocity:(double)a7
{
  id v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat *p_right;
  double v20;
  double v21;
  unint64_t v22;
  NSMutableArray *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double *v35;
  _BOOL4 v36;
  double v37;
  uint64_t v38;
  double v39;
  void *v40;
  double v41;
  uint64_t i;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  unint64_t v49;
  unint64_t v50;
  uint64x2_t v51;
  int64x2_t v52;
  double *v53;
  int64x2_t v54;
  int32x2_t v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  unint64_t v63;
  void *v64;
  double v65;
  unint64_t v66;
  unint64_t v67;
  _BOOL4 v69;
  _BOOL4 v71;
  uint64_t v72;
  int v74;
  void *v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  double minimumOffset;
  double v87;
  double v88;
  double v89;
  double v90;
  unint64_t v91;
  double v92;
  double v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  UISpringTimingParameters *v101;
  id v102;
  UIViewPropertyAnimator *v103;
  double Height;
  void *v105;
  _QWORD v106[2];
  double v107;
  double v108;
  double v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  NSMutableArray *v114;
  double v115;
  int v116;
  uint64_t v117;
  unint64_t v118;
  _QWORD v119[9];
  _QWORD aBlock[4];
  id v121;
  id v122;
  double v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  uint64_t v127;
  uint64_t v128;
  CGRect v129;

  v115 = a6;
  v128 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  -[UISwipeActionPullView _paddingToSwipedView](self, "_paddingToSwipedView");
  v12 = v11;
  v13 = -[UISwipeActionPullView cellEdge](self, "cellEdge");
  v14 = 0.0;
  if (a3 >= 0.0)
    v15 = a3;
  else
    v15 = 0.0;
  v16 = v15 - v12;
  if (v15 - v12 < 0.0)
    v16 = 0.0;
  v17 = fmin(a3, 0.0);
  v18 = fmin(v17 + v12, 0.0);
  p_right = &self->_contentInsets.right;
  if (v13 == 8)
  {
    v20 = v18;
  }
  else
  {
    p_right = &self->_contentInsets.left;
    v20 = v16;
  }
  if (v13 == 8)
    v15 = v17;
  v108 = v15;
  v21 = *p_right;
  v22 = -[UISwipeActionPullView _swipeActionCount](self, "_swipeActionCount");
  v23 = self->_buttons;
  if (v22 != -[NSMutableArray count](v23, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeActionPullView.m"), 514, CFSTR("The swipe action count does not match the number of swipe action buttons."));

  }
  if (v20 >= 0.0)
    v24 = v20;
  else
    v24 = -v20;
  -[UISwipeActionPullView confirmationThreshold](self, "confirmationThreshold");
  if (v25 < 0.0)
    v25 = -v25;
  v26 = v25 * 3.0;
  v107 = v24;
  if (v24 >= v26)
    v27 = v26;
  else
    v27 = v24;
  if (self->_style == 2)
  {
    -[UISwipeActionPullView openThreshold](self, "openThreshold");
    if (v28 < 0.0)
      v28 = -v28;
    v29 = v28 - v12;
    if (v27 < v29)
      v27 = v29;
    v14 = (v27 - v29) / (double)v22;
  }
  v30 = -[UISwipeActionPullView _interButtonPadding](self, "_interButtonPadding");
  v32 = v31;
  v106[1] = v106;
  *(_QWORD *)&v33 = MEMORY[0x1E0C80A78](v30).n128_u64[0];
  v35 = (double *)((char *)v106 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = -[UISwipeActionPullView autosizesButtons](self, "autosizesButtons", v33);
  v111 = 480;
  if (!v36)
  {
    v47 = v27 / (double)(v22 + 1);
    if (v47 <= v21)
    {
      v48 = v27 / (double)(v22 + 1);
      if (!v22)
        goto LABEL_106;
    }
    else
    {
      v48 = v47 + (v47 - v21) / (double)v22;
      v47 = v21;
      if (!v22)
        goto LABEL_106;
    }
    v49 = v22 - 1;
    v50 = (v22 + 1) & 0xFFFFFFFFFFFFFFFELL;
    v51 = (uint64x2_t)vdupq_n_s64(v22 - 1);
    v52 = (int64x2_t)xmmword_1866794A0;
    v53 = v35 + 1;
    v54 = vdupq_n_s64(2uLL);
    do
    {
      v55 = vmovn_s64((int64x2_t)vcgeq_u64(v51, (uint64x2_t)v52));
      if ((v55.i8[0] & 1) != 0)
      {
        v56 = -0.0;
        if (!v49)
          v56 = v47;
        *(v53 - 1) = v48 + v56;
      }
      if ((v55.i8[4] & 1) != 0)
      {
        v57 = -0.0;
        if (v49 == 1)
          v57 = v47;
        *v53 = v48 + v57;
      }
      v52 = vaddq_s64(v52, v54);
      v49 -= 2;
      v53 += 2;
      v50 -= 2;
    }
    while (v50);
    goto LABEL_51;
  }
  -[UISwipeActionPullView _totalInterButtonPadding](self, "_totalInterButtonPadding");
  if (v22)
  {
    v38 = 0;
    v39 = v21 + v37;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "buttonWidth");
      v39 = v39 + v14 + v41;

      ++v38;
    }
    while (v22 != v38);
    for (i = 0; i != v22; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", i);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "buttonWidth");
      v45 = v14 + v44;
      if (v22 - 1 == i)
        v46 = v21;
      else
        v46 = v32;
      v35[i] = v27 * (v46 + v45) / v39;

    }
LABEL_51:
    v58 = v111;
    v118 = v22 - 1;
    if (v22 == 1)
    {
      -[NSMutableArray firstObject](v23, "firstObject");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "buttonWidth");
      v61 = v14 + v60;

      v62 = v21 + v61;
      if (v27 <= v21 + v61)
        v62 = v27;
      *v35 = v62;
    }
    v63 = 0;
    v113 = fabs(v108);
    v109 = v115 + v115;
    v112 = 3221225472;
    v114 = v23;
    v110 = v14;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](v23, "objectAtIndexedSubscript:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0.0;
      v66 = v63;
      do
        v65 = v65 + v35[v66++];
      while (v66 < v22);
      v67 = -[UISwipeActionPullView state](self, "state");
      v69 = v113 >= 2.22044605e-16 && v67 != 0;
      v71 = v115 > 0.0 && self->_isTentative != v69;
      v72 = *(uint64_t *)((char *)&self->super.super.super.isa + v58);
      v117 = 449;
      if (v72)
      {
        if (v72 == 1)
        {
          if (v22 != 1 && v69)
          {
            if (!v63)
              v71 = 0;
            goto LABEL_85;
          }
LABEL_84:
          if (!v69)
            goto LABEL_86;
          goto LABEL_85;
        }
        if (v72 != 2)
          goto LABEL_84;
      }
      if (v63 != v118)
      {
        LOBYTE(v69) = 0;
        v71 = 0;
      }
      if (!v69)
      {
LABEL_86:
        v74 = 0;
        goto LABEL_87;
      }
LABEL_85:
      v74 = 1;
      v65 = v27;
LABEL_87:
      objc_msgSend(v64, "_outermostLayer", v115, v113);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "bounds");
      v78 = v77;
      v80 = v79;
      v82 = v81;
      v83 = *(uint64_t *)((char *)&self->super.super.super.isa + v58);
      if (v83 == 2)
        v84 = v27;
      else
        v84 = v76;
      v116 = v74;
      if ((v74 & 1) == 0 && v83 == 2)
      {
        objc_msgSend(v64, "buttonWidth");
        v84 = v110 + v85;
      }
      minimumOffset = self->_minimumOffset;
      -[UISwipeActionPullView contentInsets](self, "contentInsets");
      if (v65 >= minimumOffset - v87)
        v88 = v65;
      else
        v88 = minimumOffset - v87;
      -[UISwipeActionPullView _directionalMultiplier](self, "_directionalMultiplier");
      v90 = v89 * v88;
      v91 = -[UISwipeActionPullView cellEdge](self, "cellEdge");
      v92 = 0.0;
      if (v91 == 8)
        v92 = v20;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = v112;
      v93 = v90 - v92;
      aBlock[2] = __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke;
      aBlock[3] = &unk_1E16BF770;
      v94 = v75;
      v121 = v94;
      v123 = v93;
      v95 = v64;
      v122 = v95;
      v124 = v78;
      v125 = v80;
      v126 = v84;
      v127 = v82;
      v96 = _Block_copy(aBlock);
      v97 = v96;
      if (v71)
      {
        +[_UISwipeActionSpringAnimationParameters defaultStiffness](_UISwipeActionSpringAnimationParameters, "defaultStiffness");
        v99 = v109 * v98;
        +[_UISwipeActionSpringAnimationParameters defaultDamping](_UISwipeActionSpringAnimationParameters, "defaultDamping");
        v101 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, v99, v100, 0.0, 0.0);
        v102 = v10;
        v103 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v101, 0.0);
        -[UIViewPropertyAnimator addAnimations:](v103, "addAnimations:", v97);
        -[UIViewPropertyAnimator startAnimation](v103, "startAnimation");

        v10 = v102;
        v58 = v111;

      }
      else if (v10)
      {
        objc_msgSend(v10, "addAnimations:", v96);
      }
      else
      {
        (*((void (**)(void *))v96 + 2))(v96);
      }
      if (v63 == v118)
        *((_BYTE *)&self->super.super.super.isa + v117) = v116;

      ++v63;
      v23 = v114;
    }
    while (v63 != v22);
  }
LABEL_106:
  -[UIView bounds](self, "bounds");
  Height = CGRectGetHeight(v129);
  if (v10)
  {
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke_2;
    v119[3] = &unk_1E16B20D8;
    v119[6] = 0;
    v119[4] = self;
    v119[5] = 0;
    *(double *)&v119[7] = v107;
    *(double *)&v119[8] = Height;
    objc_msgSend(v10, "addAnimations:", v119);
  }
  else
  {
    -[UISwipeActionPullView _setLayerBounds:](self, "_setLayerBounds:", 0.0, 0.0, v107, Height);
  }
  self->_currentOffset = v108;

}

uint64_t __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke(uint64_t a1)
{
  double v2;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "position");
  objc_msgSend(*(id *)(a1 + 32), "setPosition:", v2);
  return objc_msgSend(*(id *)(a1 + 40), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __100__UISwipeActionPullView_moveToOffset_extraOffset_animator_usingSpringWithStiffness_initialVelocity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLayerBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_performAction:(id)a3 offset:(double)a4 extraOffset:(double)a5
{
  id v8;
  BOOL v9;
  id v10;

  v10 = a3;
  -[UISwipeActionPullView primarySwipeAction](self, "primarySwipeAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v10)
  {
    v9 = -[UISwipeActionPullView primaryActionIsDestructive](self, "primaryActionIsDestructive");

    if (v9)
    {
      -[UISwipeActionPullView setState:](self, "setState:", 2);
      -[UISwipeActionPullView moveToOffset:extraOffset:animator:usingSpringWithStiffness:initialVelocity:](self, "moveToOffset:extraOffset:animator:usingSpringWithStiffness:initialVelocity:", 0, a4, a5, 1.0, 0.0);
    }
  }
  else
  {

  }
}

- (id)sourceViewForAction:(id)a3
{
  id v4;
  NSMutableArray *buttons;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  UISwipeActionPullView *v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__183;
  v16 = __Block_byref_object_dispose__183;
  v17 = self;
  buttons = v17->_buttons;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__UISwipeActionPullView_sourceViewForAction___block_invoke;
  v9[3] = &unk_1E16E3438;
  v9[4] = v17;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__UISwipeActionPullView_sourceViewForAction___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1[4] + 432), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)a1[5])
  {
    objc_msgSend(v11, "sourceView");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

- (void)_tappedButton:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  void *v6;
  UISwipeActionButton *pressedButton;

  if (self->_pressedButton == a3)
  {
    v4 = -[NSMutableArray indexOfObject:](self->_buttons, "indexOfObject:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "swipeActionPullView:tappedAction:", self, v6);

    pressedButton = self->_pressedButton;
    self->_pressedButton = 0;

  }
}

- (void)_pressedButton:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_pressedButton)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pressedButton, a3);
    v5 = v6;
  }

}

- (void)_unpressedButton:(id)a3
{
  UISwipeActionButton *v4;
  UISwipeActionButton *v5;

  v4 = (UISwipeActionButton *)a3;
  if (self->_pressedButton == v4)
  {
    self->_pressedButton = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UISwipeActionPullView *v8;
  NSMutableArray *buttons;
  void *v10;
  uint64_t v11;
  void *v12;
  UISwipeActionPullView *v13;
  objc_super v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__183;
  v21 = __Block_byref_object_dispose__183;
  v22 = 0;
  if (self->_pressedButton)
  {
    v8 = self;
  }
  else
  {
    buttons = self->_buttons;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__UISwipeActionPullView_hitTest_withEvent___block_invoke;
    v16[3] = &unk_1E16E3460;
    *(double *)&v16[6] = x;
    *(double *)&v16[7] = y;
    v16[4] = self;
    v16[5] = &v17;
    -[NSMutableArray enumerateObjectsUsingBlock:](buttons, "enumerateObjectsUsingBlock:", v16);
    v10 = (void *)v18[5];
    if (!v10)
    {
      v15.receiver = self;
      v15.super_class = (Class)UISwipeActionPullView;
      -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v18[5];
      v18[5] = v11;

      v10 = (void *)v18[5];
    }
    v8 = v10;
  }
  v13 = v8;
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __43__UISwipeActionPullView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  CGPoint v26;

  v25 = a2;
  objc_msgSend(v25, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v8 = v7;
  v10 = v9;
  objc_msgSend(v25, "bounds");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v25, "buttonWidth");
  v16 = v15;
  v17 = objc_msgSend(*(id *)(a1 + 32), "cellEdge");
  v18 = 0.0;
  if (v17 == 2)
  {
    objc_msgSend(v25, "frame", 0.0);
    v20 = v19;
    objc_msgSend(v25, "buttonWidth");
    v18 = v20 - v21;
  }
  v22 = v12;
  v23 = v16;
  v24 = v14;
  v26.x = v8;
  v26.y = v10;
  if (CGRectContainsPoint(*(CGRect *)&v18, v26))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)swipeActionButton:(id)a3 willDisplayContextMenuWithAnimator:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  v5 = -[NSMutableArray indexOfObject:](self->_buttons, "indexOfObject:", a3, a4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "swipeActionPullView:tappedAction:", self, v7);

  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[UISwipeActionPullView cellEdge](self, "cellEdge") == 8)
    v5 = CFSTR("UIRectEdgeRight");
  else
    v5 = CFSTR("UIRectEdgeLeft");
  if (self->_actions)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSArray: %p>"), self->_actions);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; cellEdge = %@, actions = %@>"), v4, self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; cellEdge = %@, actions = %@>"), v4, self, v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (unint64_t)cellEdge
{
  return self->_cellEdge;
}

- (double)currentOffset
{
  return self->_currentOffset;
}

- (UISwipeActionPullViewDelegate)delegate
{
  return (UISwipeActionPullViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIColor)backgroundPullColor
{
  return self->_backgroundPullColor;
}

- (void)setBackgroundPullColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (BOOL)buttonsUnderlapSwipedView
{
  return self->_buttonsUnderlapSwipedView;
}

- (BOOL)autosizesButtons
{
  return self->_autosizesButtons;
}

- (void)setAutosizesButtons:(BOOL)a3
{
  self->_autosizesButtons = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (UISwipeActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (double)_roundedStyleCornerRadius
{
  return self->_roundedStyleCornerRadius;
}

- (void)_setRoundedStyleCornerRadius:(double)a3
{
  self->_roundedStyleCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_backgroundPullColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pressedButton, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end
