@implementation UIDimmingView

- (void)setDimmingColor:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIColor isEqual:](self->_dimmingColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_dimmingColor, a3);
    -[UIDimmingView updateBackground](self, "updateBackground");
  }

}

- (void)setPercentDisplayed:(double)a3
{
  if (self->_percentDisplayed != a3)
  {
    self->_percentDisplayed = a3;
    -[UIDimmingView updateBackground](self, "updateBackground");
  }
}

- (void)setIgnoresTouches:(BOOL)a3
{
  self->_ignoresTouches = a3;
}

- (void)setPercentLightened:(double)a3
{
  if (self->_percentLightened != a3)
  {
    self->_percentLightened = a3;
    -[UIDimmingView updateBackground](self, "updateBackground");
  }
}

- (UIDimmingView)initWithFrame:(CGRect)a3
{
  UIDimmingView *v3;
  void *v4;
  void *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *singleFingerTapRecognizer;
  NSArray *lowerWindowDismissalGestureViews;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIDimmingView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend((id)objc_opt_class(), "defaultDimmingColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDimmingView setDimmingColor:](v3, "setDimmingColor:", v4);

  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v5);

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIDimmingView setHitTestsAsOpaque:](v3, "setHitTestsAsOpaque:", 1);
    if (dyld_program_sdk_at_least())
    {
      v6 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v3, sel_handleSingleTap_);
      singleFingerTapRecognizer = v3->_singleFingerTapRecognizer;
      v3->_singleFingerTapRecognizer = v6;

      -[UIGestureRecognizer setDelegate:](v3->_singleFingerTapRecognizer, "setDelegate:", v3);
      -[UIView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_singleFingerTapRecognizer);
    }
    lowerWindowDismissalGestureViews = v3->_lowerWindowDismissalGestureViews;
    v3->_lowerWindowDismissalGestureViews = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (void)setHitTestsAsOpaque:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", v3);

}

+ (id)defaultDimmingColor
{
  return +[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSuppressesBackdrops:(BOOL)a3
{
  self->_suppressesBackdrops = a3;
}

void __38__UIDimmingView_updateBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedColorWithTraitCollection:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0.0;
  v11 = 0.0;
  v9 = 0.0;
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v11, &v10, &v9, 0);
  if (v11 >= v10)
    v4 = v11;
  else
    v4 = v10;
  if (v4 < v9)
    v4 = v9;
  v5 = 1.0 / v4;
  if (v4 == 0.0)
    v5 = 0.0;
  if (v11 == v4)
    v6 = 1.0;
  else
    v6 = v11 * v5;
  if (v10 == v4)
    v7 = 1.0;
  else
    v7 = v10 * v5;
  _MergedGlobals_21_10 = *(_QWORD *)&v6;
  *(double *)algn_1ECD7C578 = v7;
  v8 = v9 * v5;
  if (v9 == v4)
    v8 = 1.0;
  qword_1ECD7C580 = *(_QWORD *)&v8;
  unk_1ECD7C588 = *(_QWORD *)&v4;

}

- (void)updateBackgroundColor
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;

  if (qword_1ECD7C590 != -1)
    dispatch_once(&qword_1ECD7C590, &__block_literal_global_660);
  v3 = *(double *)&_MergedGlobals_21_10;
  v4 = *(double *)algn_1ECD7C578;
  v5 = *(double *)&qword_1ECD7C580;
  v6 = unk_1ECD7C588;
  -[UIDimmingView percentLightened](self, "percentLightened");
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v3, v4, v5, v6 * v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0.0;
  -[UIDimmingView dimmingColor](self, "dimmingColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getRed:green:blue:alpha:", 0, 0, 0, &v15);

  -[UIDimmingView dimmingColor](self, "dimmingColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  -[UIDimmingView percentDisplayed](self, "percentDisplayed");
  objc_msgSend(v10, "colorWithAlphaComponent:", v11 * v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_colorBlendedWithColor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v14);

}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (double)percentLightened
{
  return self->_percentLightened;
}

- (double)percentDisplayed
{
  return self->_percentDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerWindowDismissalGestureViews, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalEventGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_observedEventForAdditionalGestures, 0);
  objc_storeStrong((id *)&self->_singleFingerTapRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
  objc_storeStrong((id *)&self->_backgroundGlow, 0);
  objc_storeStrong((id *)&self->_highlightedImageView, 0);
  objc_storeStrong((id *)&self->_highlightedBarButtonItem, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIGestureRecognizer setDelegate:](self->_singleFingerTapRecognizer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIDimmingView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDimmingView;
  -[UIView willMoveToWindow:](&v4, sel_willMoveToWindow_, a3);
  -[UIDimmingView _clearAdditionalEventGestures](self, "_clearAdditionalEventGestures");
}

- (void)_clearAdditionalEventGestures
{
  UIEvent *observedEventForAdditionalGestures;
  UIEvent *v4;

  observedEventForAdditionalGestures = self->_observedEventForAdditionalGestures;
  if (observedEventForAdditionalGestures)
  {
    -[NSMutableSet removeObject:](observedEventForAdditionalGestures->_eventObservers, "removeObject:", self);
    v4 = self->_observedEventForAdditionalGestures;
    self->_observedEventForAdditionalGestures = 0;

  }
  -[NSMutableSet removeAllObjects](self->_additionalEventGestureRecognizers, "removeAllObjects");
}

- (int)textEffectsVisibilityLevel
{
  return 190;
}

- (void)setHighlightedBarButtonItem:(id)a3
{
  void *v5;
  CGFloat v6;
  CGFloat v7;
  _QWORD *ContextStack;
  CGContext *v9;
  double v10;
  CGFloat v11;
  double v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  UIImageView *highlightedImageView;
  void *v20;
  UIImageView *v21;
  void *v22;
  UIImageView *v23;
  UIImageView *backgroundGlow;
  id v25;

  v25 = a3;
  objc_storeStrong((id *)&self->_highlightedBarButtonItem, a3);
  if (self->_highlightedBarButtonItem)
  {
    objc_msgSend(v25, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v7, 0.0);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v9 = 0;
    else
      v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    objc_msgSend(v5, "bounds");
    v11 = -v10;
    objc_msgSend(v5, "bounds");
    CGContextTranslateCTM(v9, v11, -v12);
    objc_msgSend(v5, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = GetContextStack(0);
    if (*(int *)v14 < 1)
      v15 = 0;
    else
      v15 = v14[3 * (*(_DWORD *)v14 - 1) + 1];
    objc_msgSend(v13, "renderInContext:", v15);

    _UIGraphicsGetImageFromCurrentImageContext(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    if (!self->_highlightedImageView)
    {
      v17 = [UIImageView alloc];
      v18 = -[UIImageView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      highlightedImageView = self->_highlightedImageView;
      self->_highlightedImageView = v18;

      -[UIView setUserInteractionEnabled:](self->_highlightedImageView, "setUserInteractionEnabled:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_highlightedImageView);
    }
    objc_msgSend(v5, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v20, "convertRect:toView:", self);
    -[UIImageView setFrame:](self->_highlightedImageView, "setFrame:");

    -[UIImageView setImage:](self->_highlightedImageView, "setImage:", v16);
    if (!self->_backgroundGlow)
    {
      v21 = [UIImageView alloc];
      _UIImageWithName(CFSTR("UIButtonBarPressedIndicator.png"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[UIImageView initWithImage:](v21, "initWithImage:", v22);
      backgroundGlow = self->_backgroundGlow;
      self->_backgroundGlow = v23;

      -[UIView setUserInteractionEnabled:](self->_backgroundGlow, "setUserInteractionEnabled:", 0);
      -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_backgroundGlow, self->_highlightedImageView);
    }
    -[UIView center](self->_highlightedImageView, "center");
    -[UIImageView setCenter:](self->_backgroundGlow, "setCenter:");
    -[UIView setAlpha:](self->_backgroundGlow, "setAlpha:", 0.2);

  }
  else
  {
    -[UIView removeFromSuperview](self->_backgroundGlow, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_highlightedImageView, "removeFromSuperview");
  }

}

- (UIBarButtonItem)highlightedBarButtonItem
{
  return self->_highlightedBarButtonItem;
}

- (id)_backdropViewsToAnimate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[_UIBackdropView allBackdropViews](_UIBackdropView, "allBackdropViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (self)
        {
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (-[UIView _viewOrderRelativeToView:requireIntersection:](self, v9, 1) == -2)
            objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)displayed
{
  return self->_percentDisplayed > 0.0;
}

- (void)setBlurEffect:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIBlurEffect isEqual:](self->_blurEffect, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_blurEffect, a3);
    -[UIDimmingView updateBackground](self, "updateBackground");
  }

}

- (BOOL)hitTestsAsOpaque
{
  void *v2;
  char v3;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hitTestsAsOpaque");

  return v3;
}

- (void)display:(BOOL)a3
{
  double v4;
  _QWORD v5[5];
  BOOL v6;

  v4 = 0.0;
  if (a3)
    v4 = 1.0;
  self->_percentDisplayed = v4;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__UIDimmingView_display___block_invoke;
  v5[3] = &unk_1E16B1B78;
  v5[4] = self;
  v6 = a3;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  -[UIDimmingView updateBackground](self, "updateBackground");
}

void __25__UIDimmingView_display___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "suppressesBackdrops"))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_backdropViewsToAnimate", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setShouldRasterizeEffectsView:", *(unsigned __int8 *)(a1 + 40));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

  }
}

- (void)display:(BOOL)a3 withAnimationDuration:(double)a4 afterDelay:(double)a5
{
  _BOOL8 v7;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  BOOL v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v7 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = 0.0;
  if (a3)
    v9 = 1.0;
  self->_percentDisplayed = v9;
  if (-[UIDimmingView suppressesBackdrops](self, "suppressesBackdrops"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UIDimmingView _backdropViewsToAnimate](self, "_backdropViewsToAnimate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14++), "setShouldRasterizeEffectsView:", v7);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke;
  v17[3] = &unk_1E16B1B28;
  v17[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke_2;
  v15[3] = &unk_1E16B7F38;
  v16 = v7;
  v15[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v17, v15, a4, a5);
}

uint64_t __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBackground");
}

uint64_t __58__UIDimmingView_display_withAnimationDuration_afterDelay___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
  {
    result = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(result + 448))
      return objc_msgSend((id)result, "dimmingRemovalAnimationDidStop");
  }
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDimmingView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[UIDimmingView updateBackground](self, "updateBackground");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UIDimmingView *v8;
  UIDimmingView *v9;
  UIDimmingView *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  void *v38;
  uint64_t v39;
  _BOOL4 v40;
  UIDimmingView *v42;
  NSArray *obj;
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;
  CGPoint v59;
  CGRect v60;

  y = a3.y;
  x = a3.x;
  v58 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (self->_inPassthroughHitTest)
  {
    v8 = 0;
    goto LABEL_44;
  }
  v55.receiver = self;
  v55.super_class = (Class)UIDimmingView;
  -[UIView hitTest:withEvent:](&v55, sel_hitTest_withEvent_, v7, x, y);
  v9 = (UIDimmingView *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 != self)
    goto LABEL_42;
  v42 = v9;
  v44 = v7;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v11 = self->_passthroughViews;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v16, "window", v42);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v16, "window");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView window](self, "window");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 == v20)
          {
            objc_msgSend(v16, "bounds");
            objc_msgSend(v16, "convertRect:toView:", self);
            v59.x = x;
            v59.y = y;
            v21 = CGRectContainsPoint(v60, v59);

            if (v21)
            {
              self->_inPassthroughHitTest = 1;
              -[UIView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
              objc_msgSend(v16, "hitTest:withEvent:", v44);
              v22 = objc_claimAutoreleasedReturnValue();
              self->_inPassthroughHitTest = 0;
              if (v22)
              {
                v8 = (UIDimmingView *)v22;

                v7 = v44;
                v10 = v42;
                goto LABEL_43;
              }
            }
          }
          else
          {

          }
        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v13);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_lowerWindowDismissalGestureViews;
  v7 = v44;
  v46 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (!v46)
    goto LABEL_41;
  v45 = *(_QWORD *)v48;
  do
  {
    for (j = 0; j != v46; ++j)
    {
      if (*(_QWORD *)v48 != v45)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
      -[UIView window](self, "window", v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v27 = v25;
      v28 = v7;
      v29 = v28;
      if (v7)
        v30 = objc_msgSend(v28, "type") == 0;
      else
        v30 = 0;
      objc_msgSend(v26, "window");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend(v26, "window");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        if (v32 == v27)
        {
          v37 = 0;
        }
        else
        {
          objc_msgSend(v26, "window");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "level");
          v35 = v34;
          objc_msgSend(v27, "level");
          v37 = v35 <= v36;

        }
        v7 = v44;
      }
      else
      {
        v37 = 0;
      }

      objc_msgSend(v26, "gestureRecognizers");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "count");

      if (!v30)
      {

LABEL_38:
        continue;
      }
      if (v39)
        v40 = v37;
      else
        v40 = 0;

      if (v40)
      {
        self->_inPassthroughHitTest = 1;
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v26, x, y);
        objc_msgSend(v26, "hitTest:withEvent:", v29);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        self->_inPassthroughHitTest = 0;
        if (v27)
          -[UIDimmingView _queueAdditionalEventGesturesFromView:](self, "_queueAdditionalEventGesturesFromView:", v26);
        goto LABEL_38;
      }
    }
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  }
  while (v46);
LABEL_41:

  v10 = v42;
LABEL_42:
  v8 = v10;
LABEL_43:

LABEL_44:
  return v8;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  UIDimmingView *v4;
  double y;
  double x;
  UIDimmingView *v9;
  UIDimmingView *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  UIDimmingView *v24;
  __GSEvent *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;
  CGPoint v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_inPassthroughHitTest)
  {
    v4 = 0;
  }
  else
  {
    y = a3.y;
    x = a3.x;
    v30.receiver = self;
    v30.super_class = (Class)UIDimmingView;
    -[UIView hitTest:forEvent:](&v30, sel_hitTest_forEvent_);
    v9 = (UIDimmingView *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == self)
    {
      v24 = v9;
      v25 = a4;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = self->_passthroughViews;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v16, "window", v24);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = (void *)v17;
              objc_msgSend(v16, "window");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIView window](self, "window");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19 == v20)
              {
                objc_msgSend(v16, "bounds");
                objc_msgSend(v16, "convertRect:toView:", self);
                v33.x = x;
                v33.y = y;
                v21 = CGRectContainsPoint(v34, v33);

                if (v21)
                {
                  self->_inPassthroughHitTest = 1;
                  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
                  objc_msgSend(v16, "hitTest:forEvent:", v25);
                  v22 = objc_claimAutoreleasedReturnValue();
                  self->_inPassthroughHitTest = 0;
                  if (v22)
                  {
                    v4 = (UIDimmingView *)v22;

                    v10 = v24;
                    goto LABEL_18;
                  }
                }
              }
              else
              {

              }
            }
          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v13)
            continue;
          break;
        }
      }

      v10 = v24;
    }
    v4 = v10;
LABEL_18:

  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4;
  id v6;
  void *v7;
  void *v8;

  if (self->_singleFingerTapRecognizer != a3)
    return 1;
  v6 = a3;
  objc_msgSend(a4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v7 == v8;
  return v4;
}

- (void)handleSingleTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[UIDimmingView _simulateTap](self, "_simulateTap");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
    -[UIDimmingView _simulateTap](self, "_simulateTap");
}

- (void)_simulateTap
{
  if (!self->_ignoresTouches)
    -[UIDimmingView _sendDelegateDimmingViewWasTapped](self, "_sendDelegateDimmingViewWasTapped");
}

- (void)_sendDelegateDimmingViewWasTapped
{
  UIDimmingViewDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "dimmingViewWasTapped:", self);

  }
}

- (void)_queueAdditionalEventGesturesFromView:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  UIEvent *v10;
  UIEvent *observedEventForAdditionalGestures;
  NSMutableSet *additionalEventGestureRecognizers;
  NSMutableSet *v13;
  NSMutableSet *v14;
  id v15;

  objc_msgSend(a3, "gestureRecognizers");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView window](self, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v15, "count");

    if (v6)
    {
      v7 = v15;
      if (!self->_observedEventForAdditionalGestures)
      {
        v8 = (void *)UIApp;
        -[UIView window](self, "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_touchesEventForWindow:", v9);
        v10 = (UIEvent *)objc_claimAutoreleasedReturnValue();
        observedEventForAdditionalGestures = self->_observedEventForAdditionalGestures;
        self->_observedEventForAdditionalGestures = v10;

        -[UIEvent _addEventObserver:]((uint64_t)self->_observedEventForAdditionalGestures, self);
        v7 = v15;
      }
      additionalEventGestureRecognizers = self->_additionalEventGestureRecognizers;
      if (!additionalEventGestureRecognizers)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v14 = self->_additionalEventGestureRecognizers;
        self->_additionalEventGestureRecognizers = v13;

        v7 = v15;
        additionalEventGestureRecognizers = self->_additionalEventGestureRecognizers;
      }
      -[NSMutableSet addObjectsFromArray:](additionalEventGestureRecognizers, "addObjectsFromArray:", v7);
    }
  }

}

- (id)_gestureRecognizersForEvent:(id)a3
{
  NSMutableSet *additionalEventGestureRecognizers;
  void *v5;

  additionalEventGestureRecognizers = self->_additionalEventGestureRecognizers;
  if (additionalEventGestureRecognizers)
  {
    -[NSMutableSet allObjects](additionalEventGestureRecognizers, "allObjects", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeAllObjects](self->_additionalEventGestureRecognizers, "removeAllObjects");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (BOOL)isTransparentFocusItem
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  objc_super v9;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "supportsViewTransparency") & 1) != 0)
  {
    -[UIDimmingView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[UIDimmingView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_allowsFocusBehindDimmingView");

      return v7;
    }
  }
  else
  {

  }
  v9.receiver = self;
  v9.super_class = (Class)UIDimmingView;
  return -[UIView isTransparentFocusItem](&v9, sel_isTransparentFocusItem);
}

- (UIDimmingViewDelegate)delegate
{
  return (UIDimmingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (BOOL)ignoresTouches
{
  return self->_ignoresTouches;
}

- (BOOL)suppressesBackdrops
{
  return self->_suppressesBackdrops;
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (NSArray)lowerWindowDismissalGestureViews
{
  return self->_lowerWindowDismissalGestureViews;
}

- (void)setLowerWindowDismissalGestureViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

@end
