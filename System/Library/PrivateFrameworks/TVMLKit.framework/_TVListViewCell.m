@implementation _TVListViewCell

- (_TVListViewCell)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVListViewCell;
  return -[_TVListViewCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setVisualEffectViewBackgroundEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *backgroundVisualEffectView;
  UIVisualEffectView *v10;
  void *v11;
  UIVisualEffectView *v12;

  if (self->_visualEffectViewBackgroundEnabled != a3)
  {
    self->_visualEffectViewBackgroundEnabled = a3;
    if (a3)
    {
      -[_TVListViewCell traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "userInterfaceStyle") == 2)
        v5 = 4015;
      else
        v5 = 4014;

      v6 = objc_alloc(MEMORY[0x24BDF6FC8]);
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (UIVisualEffectView *)objc_msgSend(v6, "initWithEffect:", v7);
      backgroundVisualEffectView = self->_backgroundVisualEffectView;
      self->_backgroundVisualEffectView = v8;

      v10 = self->_backgroundVisualEffectView;
      -[_UIFloatingContentView cornerRadius](self->_floatingView, "cornerRadius");
      -[UIVisualEffectView _setCornerRadius:](v10, "_setCornerRadius:");
      -[_UIFloatingContentView visualEffectContainerView](self->_floatingView, "visualEffectContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_backgroundVisualEffectView);

      -[_TVListViewCell setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UIVisualEffectView removeFromSuperview](self->_backgroundVisualEffectView, "removeFromSuperview");
      v12 = self->_backgroundVisualEffectView;
      self->_backgroundVisualEffectView = 0;

    }
  }
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (void)setShouldAppearSelected:(BOOL)a3
{
  _UIFloatingContentView *floatingView;
  unint64_t v5;
  id v6;

  if (self->_shouldAppearSelected != a3)
  {
    self->_shouldAppearSelected = a3;
    floatingView = self->_floatingView;
    v5 = -[_TVListViewCell _floatingViewControlState](self, "_floatingViewControlState");
    -[_TVListViewCell _currentFocusAnimationCoordinator](self, "_currentFocusAnimationCoordinator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setControlState:withAnimationCoordinator:](floatingView, "setControlState:withAnimationCoordinator:", v5, v6);

  }
}

- (void)setBackgroundColor:(id)a3
{
  -[_TVListViewCell setBackgroundColor:forState:](self, "setBackgroundColor:forState:", a3, 0);
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (a4 == 1)
  {
    objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
    -[_TVListViewCell selectedBackgroundView](self, "selectedBackgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)objc_opt_new();
      -[_TVListViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v11);

    }
    -[_TVListViewCell selectedBackgroundView](self, "selectedBackgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!a4)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[_TVListViewCell backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      -[_TVListViewCell setBackgroundView:](self, "setBackgroundView:", v8);

    }
    -[_TVListViewCell backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = v9;
    objc_msgSend(v9, "setBackgroundColor:", v13);

  }
}

- (BOOL)canBecomeFocused
{
  return !-[_TVListViewCell isDisabled](self, "isDisabled");
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  void *v4;
  objc_super v6;

  if (self->_floatingView)
  {
    -[_UIFloatingContentView _preferredConfigurationForFocusAnimation:inContext:](self->_floatingView, "_preferredConfigurationForFocusAnimation:inContext:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_TVListViewCell;
    -[_TVListViewCell _preferredConfigurationForFocusAnimation:inContext:](&v6, sel__preferredConfigurationForFocusAnimation_inContext_, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)updateFloatingViewControlStateForPreviouslyFocusedView:(id)a3
{
  id WeakRetained;
  id v5;
  _UIFloatingContentView *floatingView;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_shouldAppearSelected = objc_msgSend(v5, "listCell:shouldAppearSelectedForPreviouslyFocusedView:", self, v9);

  }
  floatingView = self->_floatingView;
  v7 = -[_TVListViewCell _floatingViewControlState](self, "_floatingViewControlState");
  -[_TVListViewCell _currentFocusAnimationCoordinator](self, "_currentFocusAnimationCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](floatingView, "setControlState:withAnimationCoordinator:", v7, v8);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[_TVListViewCell isFocused](self, "isFocused");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_TVListViewCell contentView](self, "contentView", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "setSelected:animated:withAnimationCoordinator:", v8, 1, v7);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  objc_msgSend(v6, "previouslyFocusedView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVListViewCell updateFloatingViewControlStateForPreviouslyFocusedView:](self, "updateFloatingViewControlStateForPreviouslyFocusedView:", v15);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)_TVListViewCell;
  -[UIView setHighlighted:](&v16, sel_setHighlighted_);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_TVListViewCell contentView](self, "contentView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "setHighlighted:", v3);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (void)setSelected:(BOOL)a3
{
  -[_TVListViewCell setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)_TVListViewCell;
  -[_TVListViewCell setSelected:](&v17, sel_setSelected_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_TVListViewCell contentView](self, "contentView", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setSelected:animated:", v5, v4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (objc_msgSend(v6, "count") == 1
    && (v9 & 0xFFFFFFFFFFFFFFFDLL) == 4
    && -[_TVListViewCell isFocused](self, "isFocused"))
  {
    -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", -[_TVListViewCell _floatingViewControlState](self, "_floatingViewControlState") | 1, 1);
  }
  v10.receiver = self;
  v10.super_class = (Class)_TVListViewCell;
  -[_TVListViewCell pressesBegan:withEvent:](&v10, sel_pressesBegan_withEvent_, v6, v7);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVListViewCell;
  v6 = a3;
  -[_TVListViewCell pressesCancelled:withEvent:](&v10, sel_pressesCancelled_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  v9 = objc_msgSend(v6, "count");
  if (v9 == 1 && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", -[_TVListViewCell _floatingViewControlState](self, "_floatingViewControlState"), 1);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TVListViewCell;
  v6 = a3;
  -[_TVListViewCell pressesEnded:withEvent:](&v10, sel_pressesEnded_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  v9 = objc_msgSend(v6, "count");
  if (v9 == 1 && (v8 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", -[_TVListViewCell _floatingViewControlState](self, "_floatingViewControlState"), 1);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  -[_TVListViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle"))
  {
    v6 = objc_msgSend(v4, "userInterfaceStyle");
    -[_TVListViewCell traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v6 != v8)
      -[_TVListViewCell _updateSelectedBackgroundColor](self, "_updateSelectedBackgroundColor");
  }
  else
  {

  }
  v9.receiver = self;
  v9.super_class = (Class)_TVListViewCell;
  -[_TVListViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);

}

- (void)layoutSubviews
{
  _UIFloatingContentView *floatingView;
  UIVisualEffectView *backgroundVisualEffectView;
  UIVisualEffectView *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVListViewCell;
  -[_TVListViewCell layoutSubviews](&v6, sel_layoutSubviews);
  floatingView = self->_floatingView;
  -[_TVListViewCell bounds](self, "bounds");
  -[_UIFloatingContentView setFrame:](floatingView, "setFrame:");
  -[_UIFloatingContentView layoutIfNeeded](self->_floatingView, "layoutIfNeeded");
  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  if (backgroundVisualEffectView)
  {
    -[_UIFloatingContentView bounds](self->_floatingView, "bounds");
    -[UIVisualEffectView setFrame:](backgroundVisualEffectView, "setFrame:");
    v5 = self->_backgroundVisualEffectView;
    -[_UIFloatingContentView cornerRadius](self->_floatingView, "cornerRadius");
    -[UIVisualEffectView _setCornerRadius:](v5, "_setCornerRadius:");
  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVListViewCell;
  -[_TVListViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[_TVListViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVMLUtilities disassociateIKViewElementsRecursivelyFromView:](TVMLUtilities, "disassociateIKViewElementsRecursivelyFromView:", v3);

  self->_shouldAppearSelected = 0;
  -[_UIFloatingContentView setControlState:animated:](self->_floatingView, "setControlState:animated:", 0, 0);
}

- (unint64_t)_floatingViewControlState
{
  int v3;
  unint64_t v4;

  v3 = -[_TVListViewCell isFocused](self, "isFocused");
  v4 = 8;
  if (!v3)
    v4 = 0;
  if (self->_shouldAppearSelected)
    return v4 | 4;
  else
    return v4;
}

- (void)_updateSelectedBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *backgroundVisualEffectView;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDF6950];
  -[_TVListViewCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithWhite:alpha:", 0.0, dbl_222E771D0[objc_msgSend(v4, "userInterfaceStyle") == 2]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIFloatingContentView setBackgroundColor:forState:](self->_floatingView, "setBackgroundColor:forState:", v9, 4);
  -[_TVListViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle") == 2)
    v6 = 4015;
  else
    v6 = 4014;

  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](backgroundVisualEffectView, "setEffect:", v8);

}

- (BOOL)visualEffectViewBackgroundEnabled
{
  return self->_visualEffectViewBackgroundEnabled;
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingView, a3);
}

- (_TVListViewCellDelegate)delegate
{
  return (_TVListViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)shouldAppearSelected
{
  return self->_shouldAppearSelected;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
