@implementation SBIconListPageControl

- (void)setTouchIgnoreRects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBIconListPageControl legibilitySettingsDidChange](self, "legibilitySettingsDidChange");
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)legibilitySettingsDidChange
{
  void *v3;
  void *v4;
  id v5;

  -[SBIconListPageControl legibilitySettings](self, "legibilitySettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListPageControl setCurrentPageIndicatorTintColor:](self, "setCurrentPageIndicatorTintColor:", v3);

  objc_msgSend(v5, "secondaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListPageControl setPageIndicatorTintColor:](self, "setPageIndicatorTintColor:", v4);

}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBIconListPageControl)initWithFrame:(CGRect)a3
{
  SBIconListPageControl *v3;
  uint64_t v4;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconListPageControl;
  v3 = -[SBIconListPageControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel_tapGestureDidUpdate_);
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    -[UITapGestureRecognizer setDelegate:](v3->_tapGestureRecognizer, "setDelegate:", v3);
    -[SBIconListPageControl addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGestureRecognizer);
    -[SBIconListPageControl _setAllowsDiscreteInteraction:](v3, "_setAllowsDiscreteInteraction:", 0);
    -[SBIconListPageControl addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel_pageControlCurrentPageDidChange_, 4096);
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  CGFloat v12;
  CGFloat v13;
  CGFloat width;
  CGFloat height;
  uint64_t v16;
  void *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGPoint v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SBIconListPageControl touchIgnoreRects](self, "touchIgnoreRects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "CGRectValue");
        v12 = v27.origin.x;
        v13 = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        if (!CGRectIsInfinite(v27))
        {
          v28.origin.x = v12;
          v28.origin.y = v13;
          v28.size.width = width;
          v28.size.height = height;
          if (!CGRectIsEmpty(v28))
          {
            v29.origin.x = v12;
            v29.origin.y = v13;
            v29.size.width = width;
            v29.size.height = height;
            v26.x = x;
            v26.y = y;
            if (CGRectContainsPoint(v29, v26))
            {
              LOBYTE(v9) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  v16 = objc_msgSend(v7, "type");
  v17 = 0;
  if ((v9 & 1) == 0 && v16 != 9)
  {
    v19.receiver = self;
    v19.super_class = (Class)SBIconListPageControl;
    -[SBIconListPageControl hitTest:withEvent:](&v19, sel_hitTest_withEvent_, v7, x, y);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (NSArray)touchIgnoreRects
{
  return self->_touchIgnoreRects;
}

- (double)defaultHeight
{
  double result;
  double v4;

  result = self->_cachedDefaultHeight;
  if (result <= 0.0)
  {
    -[SBIconListPageControl sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    result = v4;
    self->_cachedDefaultHeight = v4;
  }
  return result;
}

- (void)setActsAsButton:(BOOL)a3
{
  if (self->_actsAsButton != a3)
  {
    self->_actsAsButton = a3;
    -[SBIconListPageControl setBackgroundStyle:](self, "setBackgroundStyle:", a3);
  }
}

- (void)setButtonHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  SBIconListPageControl *v8;
  SBIconListPageControl *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[3];

  v3 = a3;
  v21[2] = *MEMORY[0x1E0C80C00];
  if (-[SBIconListPageControl actsAsButton](self, "actsAsButton"))
  {
    -[SBIconListPageControl delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightingViewForPageControl:", self);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (SBIconListPageControl *)v6;
    else
      v8 = self;
    v9 = v8;

    -[SBIconListPageControl layer](v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v3)
    {
      objc_msgSend(v10, "filters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BB8]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setName:", CFSTR("highlightBrightness"));
        objc_msgSend(v13, "setValue:forKey:", &unk_1E8E16E40, CFSTR("inputAmount"));
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setName:", CFSTR("highlightSaturation"));
        objc_msgSend(v14, "setValue:forKey:", &unk_1E8E16E50, CFSTR("inputAmount"));
        v21[0] = v13;
        v21[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFilters:", v15);

      }
      objc_msgSend(v11, "setValue:forKeyPath:", &unk_1E8E16E60, CFSTR("filters.highlightBrightness.inputAmount"));
      -[SBIconListPageControl traitCollection](self, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "userInterfaceStyle");

      if (v17 == 2)
        objc_msgSend(v11, "setValue:forKeyPath:", &unk_1E8E16E70, CFSTR("filters.highlightSaturation.inputAmount"));
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0DC3F10];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __46__SBIconListPageControl_setButtonHighlighted___block_invoke;
      v19[3] = &unk_1E8D84C50;
      v20 = v10;
      objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 2, v19, 0, 0.3, 0.0);

    }
  }
}

uint64_t __46__SBIconListPageControl_setButtonHighlighted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E8E16E40, CFSTR("filters.highlightBrightness.inputAmount"));
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", &unk_1E8E16E50, CFSTR("filters.highlightSaturation.inputAmount"));
}

- (void)cancelTapGesture
{
  id v2;

  -[SBIconListPageControl tapGestureRecognizer](self, "tapGestureRecognizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 0);
  objc_msgSend(v2, "setEnabled:", 1);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.highlightBrightness.inputAmount")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.highlightSaturation.inputAmount")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBIconListPageControl;
    v5 = -[SBIconListPageControl _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)tapGestureDidUpdate:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[SBIconListPageControl delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pageControlDidReceiveButtonTap:", self);

  }
}

- (void)pageControlCurrentPageDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[SBIconListPageControl delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SBIconListPageControl interactionState](self, "interactionState");
  if (v5 == 2 && !-[SBIconListPageControl isScrubbing](self, "isScrubbing"))
  {
    -[SBIconListPageControl setScrubbing:](self, "setScrubbing:", 1);
    objc_msgSend(v6, "pageControlDidBeginScrubbing:", self);
  }
  objc_msgSend(v6, "pageControl:didMoveCurrentPageToPage:withScrubbing:", v4, objc_msgSend(v4, "currentPage"), v5 == 2);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconListPageControl;
  -[SBIconListPageControl touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[SBIconListPageControl setButtonHighlighted:](self, "setButtonHighlighted:", 1);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconListPageControl;
  -[SBIconListPageControl touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[SBIconListPageControl setButtonHighlighted:](self, "setButtonHighlighted:", 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBIconListPageControl;
  -[SBIconListPageControl touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  if (-[SBIconListPageControl isScrubbing](self, "isScrubbing"))
  {
    -[SBIconListPageControl setScrubbing:](self, "setScrubbing:", 0);
    -[SBIconListPageControl delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageControlDidEndScrubbing:", self);

  }
  -[SBIconListPageControl setButtonHighlighted:](self, "setButtonHighlighted:", 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5;
  id v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  v5 = a3;
  -[SBIconListPageControl tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v7 = -[SBIconListPageControl actsAsButton](self, "actsAsButton");
  }
  else
  {
    if (!objc_msgSend((id)+[SBIconListPageControl superclass](SBIconListPageControl, "superclass"), "instancesRespondToSelector:", a2))
    {
      v8 = 1;
      goto LABEL_7;
    }
    v10.receiver = self;
    v10.super_class = (Class)SBIconListPageControl;
    v7 = -[SBIconListPageControl gestureRecognizerShouldBegin:](&v10, sel_gestureRecognizerShouldBegin_, v5);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)isEffectivelyVisible
{
  if ((-[SBIconListPageControl isHidden](self, "isHidden") & 1) != 0)
    return 0;
  -[SBIconListPageControl alpha](self, "alpha");
  return BSFloatIsZero() ^ 1;
}

- (SBIconListPageControlDelegate)delegate
{
  return (SBIconListPageControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)actsAsButton
{
  return self->_actsAsButton;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchIgnoreRects, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
