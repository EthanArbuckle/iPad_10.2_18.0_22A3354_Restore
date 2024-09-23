@implementation _UICursorAccessoryViewController

- (void)viewDidLoad
{
  -[_UICursorAccessoryHostView setHidden:](self->_hostView, "setHidden:", !self->_visible);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setVisible:(BOOL)a3
{
  -[_UICursorAccessoryViewController setVisible:animationStyle:](self, "setVisible:animationStyle:", a3, 0);
}

- (void)_updateSelectionRectAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _UICursorAccessoryViewController *v23;
  _BOOL8 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = self->_selectionRects;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "rect", (_QWORD)v26);
        if (CGRectGetWidth(v32) >= 2.22044605e-16)
        {
          objc_msgSend(v14, "rect");
          v36.origin.x = v15;
          v36.origin.y = v16;
          v36.size.width = v17;
          v36.size.height = v18;
          v33.origin.x = x;
          v33.origin.y = y;
          v33.size.width = width;
          v33.size.height = height;
          v34 = CGRectUnion(v33, v36);
          x = v34.origin.x;
          y = v34.origin.y;
          width = v34.size.width;
          height = v34.size.height;
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  if (CGRectIsNull(v35))
  {
    v19 = self->_cursorRect.origin.x;
    v20 = self->_cursorRect.origin.y;
    v21 = self->_cursorRect.size.width;
    v22 = self->_cursorRect.size.height;
    v23 = self;
    v24 = v3;
    v25 = 4;
  }
  else
  {
    v23 = self;
    v19 = x;
    v20 = y;
    v21 = width;
    v22 = height;
    v24 = v3;
    v25 = 1;
  }
  -[_UICursorAccessoryViewController _setSelectionRect:preferredPlacement:animated:](v23, "_setSelectionRect:preferredPlacement:animated:", v25, v24, v19, v20, v21, v22, (_QWORD)v26);
}

- (void)setSelectionRects:(id)a3
{
  objc_storeStrong((id *)&self->_selectionRects, a3);
  -[_UICursorAccessoryViewController _updateSelectionRectAnimated:](self, "_updateSelectionRectAnimated:", self->_visible);
}

- (void)setSelectedRange:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRange, a3);
}

- (void)setCursorRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = self->_visible && !CGRectEqualToRect(self->_cursorRect, a3);
  self->_cursorRect.origin.x = x;
  self->_cursorRect.origin.y = y;
  self->_cursorRect.size.width = width;
  self->_cursorRect.size.height = height;
  -[_UICursorAccessoryViewController _updateSelectionRectAnimated:](self, "_updateSelectionRectAnimated:", v8);
}

- (void)_setSelectionRect:(CGRect)a3 preferredPlacement:(unint64_t)a4 animated:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  BOOL v11;
  void *v12;
  _QWORD v13[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a5 && self->_visible)
  {
    v11 = CGRectEqualToRect(a3, *MEMORY[0x1E0C9D648]);
    -[_UICursorAccessoryHostView setSelectionRect:](self->_hostView, "setSelectionRect:", x, y, width, height);
    -[_UICursorAccessoryHostView setPreferredPlacementEdge:](self->_hostView, "setPreferredPlacementEdge:", a4);
    if (!v11)
    {
      +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __82___UICursorAccessoryViewController__setSelectionRect_preferredPlacement_animated___block_invoke;
      v13[3] = &unk_1E16B1B28;
      v13[4] = self;
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v12, 0, v13, 0);

    }
  }
  else
  {
    -[_UICursorAccessoryHostView setSelectionRect:](self->_hostView, "setSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[_UICursorAccessoryHostView setPreferredPlacementEdge:](self->_hostView, "setPreferredPlacementEdge:", a4);
  }
}

- (void)setAccessoryTintColor:(id)a3
{
  _UICursorAccessoryHostView *hostView;
  id v5;
  id v6;

  hostView = self->_hostView;
  v5 = a3;
  -[UIView setTintColor:](hostView, "setTintColor:", v5);
  -[_UICursorAccessoryHostView cursorAccessoryView](self->_hostView, "cursorAccessoryView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (void)loadView
{
  _UICursorAccessoryHostView *v3;
  _UICursorAccessoryHostView *hostView;

  v3 = -[_UICursorAccessoryHostView initWithCursorItemDataSource:]([_UICursorAccessoryHostView alloc], "initWithCursorItemDataSource:", self);
  hostView = self->_hostView;
  self->_hostView = v3;

  -[UIViewController setView:](self, "setView:", self->_hostView);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UICursorAccessoryViewController)init
{
  _UICursorAccessoryViewController *v2;
  _UICursorAccessoryViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICursorAccessoryViewController;
  v2 = -[UIViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
    -[_UICursorAccessoryViewController setVisible:animationStyle:](v2, "setVisible:animationStyle:", 0, 0);
  return v3;
}

- (void)setVisible:(BOOL)a3 animationStyle:(int64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void (**v12)(void *, uint64_t);
  void *v13;
  _QWORD *v14;
  void *v15;
  double v16;
  double v17;
  _UICursorAccessoryHostView *hostView;
  uint64_t *v19;
  _UICursorAccessoryHostView *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  _UICursorAccessoryViewController *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  _UICursorAccessoryViewController *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  _QWORD aBlock[4];
  id v36;

  v6 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke;
  aBlock[3] = &unk_1E16C0E38;
  v10 = v8;
  v36 = v10;
  v33[0] = v9;
  v33[1] = 3221225472;
  v33[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_2;
  v33[3] = &unk_1E16B1BA0;
  v11 = _Block_copy(aBlock);
  v34 = v11;
  v12 = (void (**)(void *, uint64_t))_Block_copy(v33);
  if (self->_visible == v6)
    goto LABEL_2;
  self->_visible = v6;
  if (a4 == 2)
  {
    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "revealFadeTime");
    v17 = v16;

    hostView = self->_hostView;
    if (v6)
    {
      -[_UICursorAccessoryHostView setHidden:](hostView, "setHidden:", 0);
      -[_UICursorAccessoryHostView setCollapsed:](self->_hostView, "setCollapsed:", 0);
      -[UIView setAlpha:](self->_hostView, "setAlpha:", 0.0);
      -[_UICursorAccessoryHostView layoutSubviews](self->_hostView, "layoutSubviews");
      v26 = v9;
      v27 = 3221225472;
      v28 = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_5;
      v29 = &unk_1E16B1B28;
      v30 = self;
      v19 = &v26;
    }
    else
    {
      -[UIView setAlpha:](hostView, "setAlpha:", 1.0);
      -[_UICursorAccessoryHostView setHidden:](self->_hostView, "setHidden:", 0);
      v21 = v9;
      v22 = 3221225472;
      v23 = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_6;
      v24 = &unk_1E16B1B28;
      v25 = self;
      v19 = &v21;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v19, v12, v17, 0.0, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    if (a4 != 1)
    {
      v20 = self->_hostView;
      if (v6)
      {
        -[_UICursorAccessoryHostView setHidden:](v20, "setHidden:", 0);
        -[_UICursorAccessoryHostView setCollapsed:](self->_hostView, "setCollapsed:", 0);
        -[UIView setAlpha:](self->_hostView, "setAlpha:", 1.0);
      }
      else
      {
        -[_UICursorAccessoryHostView setHidden:](v20, "setHidden:", 1);
        -[_UICursorAccessoryHostView setCollapsed:](self->_hostView, "setCollapsed:", 1);
      }
LABEL_2:
      v12[2](v12, 1);
      goto LABEL_15;
    }
    if (v6)
    {
      -[_UICursorAccessoryHostView setHidden:](self->_hostView, "setHidden:", 0);
      -[_UICursorAccessoryHostView setCollapsed:](self->_hostView, "setCollapsed:", 1);
      -[UIView setAlpha:](self->_hostView, "setAlpha:", 1.0);
      -[_UICursorAccessoryHostView layoutSubviews](self->_hostView, "layoutSubviews");
      +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.8, 0.2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v9;
      v32[1] = 3221225472;
      v32[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_3;
      v32[3] = &unk_1E16B1B28;
      v32[4] = self;
      v14 = v32;
    }
    else
    {
      +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v9;
      v31[1] = 3221225472;
      v31[2] = __73___UICursorAccessoryViewController_setVisible_animationStyle_completion___block_invoke_4;
      v31[3] = &unk_1E16B1B28;
      v31[4] = self;
      v14 = v31;
    }
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v13, 0, v14, v11);

  }
LABEL_15:

}

- (void)setVisible:(BOOL)a3 animationStyle:(int64_t)a4
{
  -[_UICursorAccessoryViewController setVisible:animationStyle:completion:](self, "setVisible:animationStyle:completion:", a3, a4, 0);
}

- (void)setAccessories:(id)a3
{
  -[_UICursorAccessoryViewController setAccessories:animated:](self, "setAccessories:animated:", a3, 0);
}

- (void)setAccessories:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  _UICursorAccessoryViewController *v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v4 && -[NSArray count](self->_accessories, "count") != 0;
  if (!-[NSArray isEqualToArray:](self->_accessories, "isEqualToArray:", v7))
  {
    v24 = v8;
    v25 = self;
    objc_storeStrong((id *)&self->_accessories, a3);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v19 = v17;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "UUIDString");
            v19 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v10, "setObject:forKey:", v16, v19);
          objc_msgSend(v9, "addObject:", v19);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    objc_storeStrong((id *)&v25->_accessoriesByIdentifier, v10);
    -[_UICursorAccessoryHostView cursorAccessoryView](v25->_hostView, "cursorAccessoryView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccessoryIdentifiers:animated:", v22, v24);

    -[UIView setNeedsLayout](v25->_hostView, "setNeedsLayout");
    if (v24)
    {
      +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.9, 0.2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __60___UICursorAccessoryViewController_setAccessories_animated___block_invoke;
      v27[3] = &unk_1E16B1B28;
      v27[4] = v25;
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v23, 0, v27, 0);

    }
    v7 = v26;
  }

}

- (UIColor)accessoryTintColor
{
  return -[UIView tintColor](self->_hostView, "tintColor");
}

- (void)setTouchFallbackEnabled:(BOOL)a3
{
  -[_UICursorAccessoryHostView setTouchFallbackEnabled:](self->_hostView, "setTouchFallbackEnabled:", a3);
}

- (BOOL)touchFallbackEnabled
{
  return -[_UICursorAccessoryHostView touchFallbackEnabled](self->_hostView, "touchFallbackEnabled");
}

- ($90CBC7AD7F202ACD7E5E12C06C780520)_contentForAccessory:(SEL)a3
{
  void *v7;
  const __CFString *v8;
  void *v9;
  $90CBC7AD7F202ACD7E5E12C06C780520 *result;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  Class v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a4;
  objc_msgSend(v39, "_dictationCursorAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    retstr->var0 = 0;
    v8 = CFSTR("mic");
  }
  else
  {
    objc_msgSend(v39, "_deleteCursorAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v39, "_inputModeCursorAccessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v39, "_inputModeCursorAccessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dictationLanguage");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13
          && (v14 = (void *)v13,
              v15 = NSClassFromString(CFSTR("TUIKeyboardInputModeIconRenderer")),
              v14,
              v15))
        {
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "enabledDictationLanguages");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "dictationLanguage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "indexOfObject:", v18);

          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
            v19 = 0;
          objc_msgSend(MEMORY[0x1E0C99DC8], "abbreviationsForLanguages:minimizeVariants:", v17, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "componentsSeparatedByString:", CFSTR(" "));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          if (objc_msgSend(v21, "count") == 2)
          {
            objc_msgSend(v21, "lastObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v37 = v21;
          v24 = objc_alloc_init(NSClassFromString(CFSTR("TUIKeyboardInputModeIconRenderer")));
          v25 = objc_alloc_init(NSClassFromString(CFSTR("TUIKeyboardInputModeIconRendererConfiguration")));
          +[UIColor whiteColor](UIColor, "whiteColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setTintColor:", v26);

          if (objc_msgSend(v12, "isLarge"))
            +[_UICursorAccessoryView largeItemSize](_UICursorAccessoryView, "largeItemSize");
          else
            +[_UICursorAccessoryView defaultItemSize](_UICursorAccessoryView, "defaultItemSize");
          objc_msgSend(v25, "setSize:", v27 + -6.0);
          +[_UICursorAccessoryView baseFontSize](_UICursorAccessoryView, "baseFontSize");
          objc_msgSend(v25, "setBaseFontSize:");
          objc_msgSend(v25, "setStyle:", 0);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v12, "dictationLanguage");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setLanguage:", v34);

          }
          objc_msgSend(v24, "imageForPrimaryLabel:secondaryLabel:withConfiguration:", v22, v23, v25);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "imageWithRenderingMode:", 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          retstr->var0 = 0;
          retstr->var1 = v36;
          retstr->var2 = 3;

        }
        else
        {
          objc_msgSend(v12, "inputModeIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "inputModeIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v12, "isLarge") & 1) != 0)
            objc_msgSend(v20, "largeCursorAccessoryIcon");
          else
            objc_msgSend(v20, "cursorAccessoryIcon");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          retstr->var0 = 0;
          retstr->var1 = v32;
          retstr->var2 = 3;
        }

      }
      else
      {
        objc_msgSend(v39, "_modifierKeyCursorAccessory");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("_UICursorAccessoryViewController.m"), 332, CFSTR("Unsupported accessory type."));

          retstr->var0 = 0;
          retstr->var1 = 0;
          retstr->var2 = 0;
          goto LABEL_6;
        }
        objc_msgSend(v39, "_modifierKeyCursorAccessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v12, "modifierType");
        if ((unint64_t)(v29 - 1) > 2)
          v30 = CFSTR("question");
        else
          v30 = off_1E16C95D0[v29 - 1];
        retstr->var0 = 0;
        +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v30);
        retstr->var1 = (id)objc_claimAutoreleasedReturnValue();
        retstr->var2 = 2;
      }

      goto LABEL_6;
    }
    retstr->var0 = 0;
    v8 = CFSTR("delete.left");
  }
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v8);
  retstr->var1 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var2 = 2;
LABEL_6:

  return result;
}

- (void)configureItemView:(id)a3 forAccessoryIdentifier:(id)a4
{
  id v6;
  NSDictionary *accessoriesByIdentifier;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  accessoriesByIdentifier = self->_accessoriesByIdentifier;
  v8 = a4;
  -[NSDictionary objectForKey:](accessoriesByIdentifier, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICursorAccessoryViewController _contentForAccessory:](self, "_contentForAccessory:", v9);
  v10 = v16;
  v13 = v10;
  v11 = v17;
  v14 = v11;
  v15 = v18;
  if (v6)
  {
    objc_msgSend(v6, "setContent:", &v13);
  }
  else
  {
    v12 = v11;

  }
  objc_msgSend(v6, "setStyle:", objc_msgSend(v9, "style", v13, v14, v15));
  objc_msgSend(v6, "setAccessibilityIdentifier:", v8);
  objc_msgSend(v6, "setAccessibilityLabel:", v8);

  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", 1);

}

- (void)didTapToActivateAccessoryWithIdentifier:(id)a3
{
  id WeakRetained;
  id v5;

  -[NSDictionary objectForKey:](self->_accessoriesByIdentifier, "objectForKey:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cursorAccessoryViewController:didActivateCursorAccessory:", self, v5);

}

- (_UICursorAccessoryViewControllerDelegate)delegate
{
  return (_UICursorAccessoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGRect)cursorRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cursorRect.origin.x;
  y = self->_cursorRect.origin.y;
  width = self->_cursorRect.size.width;
  height = self->_cursorRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (UITextRange)selectedRange
{
  return self->_selectedRange;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (_UICursorAccessoryHostView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
  objc_storeStrong((id *)&self->_hostView, a3);
}

- (NSDictionary)accessoriesByIdentifier
{
  return self->_accessoriesByIdentifier;
}

- (void)setAccessoriesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_selectedRange, 0);
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
