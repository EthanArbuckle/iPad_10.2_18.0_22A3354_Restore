@implementation _UIContextMenuSubmenuTitleView

- (_UIContextMenuSubmenuTitleView)initWithFrame:(CGRect)a3
{
  _UIContextMenuSubmenuTitleView *v3;
  _UIContextMenuSubmenuTitleView *v4;
  void *v5;
  void *v6;
  UIVisualEffectView *v7;
  void *v8;
  UIVisualEffectView *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _UIContextMenuCellContentView *contentView;
  _UIContextMenuCellContentView *v14;
  _UIContextMenuSeparatorView *v15;
  _UIContextMenuSeparatorView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)_UIContextMenuSubmenuTitleView;
  v3 = -[UICollectionReusableView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setFocusEffect:](v3, "setFocusEffect:", 0);
    -[UIView traitCollection](v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [UIVisualEffectView alloc];
    objc_msgSend(v6, "menuBackgroundEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIVisualEffectView initWithEffect:](v7, "initWithEffect:", v8);

    objc_msgSend(v6, "menuBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[_UIContextMenuSubmenuTitleView setBgView:](v4, "setBgView:", v9);
    -[_UIContextMenuSubmenuTitleView bgView](v4, "bgView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v11);
    -[UIView _addBoundsMatchingConstraintsForView:](v4, "_addBoundsMatchingConstraintsForView:", v11);

    v12 = objc_opt_new();
    contentView = v4->_contentView;
    v4->_contentView = (_UIContextMenuCellContentView *)v12;

    -[_UIContextMenuCellContentView setLayoutClass:](v4->_contentView, "setLayoutClass:", objc_opt_class());
    v14 = v4->_contentView;
    -[UIView addSubview:](v4, "addSubview:", v14);
    -[UIView _addBoundsMatchingConstraintsForView:](v4, "_addBoundsMatchingConstraintsForView:", v14);
    v15 = [_UIContextMenuSeparatorView alloc];
    v16 = -[_UIContextMenuSeparatorView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", v16);
    -[_UIContextMenuSubmenuTitleView setSeparator:](v4, "setSeparator:", v16);
    -[UIView leadingAnchor](v16, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v17;
    -[UIView trailingAnchor](v16, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v20;
    -[UIView topAnchor](v16, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v24);
  }
  return v4;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuSubmenuTitleView;
  -[UIView didMoveToWindow](&v8, sel_didMoveToWindow);
  -[_UIContextMenuSubmenuTitleView separator](self, "separator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "constraintEqualToConstant:", 1.0 / v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

}

- (void)setBackgroundMaterialGroupName:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIContextMenuSubmenuTitleView bgView](self, "bgView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_UIContextMenuSubmenuTitleView bgView](self, "bgView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setGroupName:", v7);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  UIVisualEffectView *v12;
  void *v13;
  UIVisualEffectView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (self->_highlighted != a3)
  {
    v3 = a3;
    self->_highlighted = a3;
    if (a3)
    {
      -[_UIContextMenuSubmenuTitleView highlightedBgView](self, "highlightedBgView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        -[UIView traitCollection](self, "traitCollection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "userInterfaceIdiom");
        +[UIShape rectShape](UIShape, "rectShape");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        _UIContextMenuGetPlatformMetrics(v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "menuHighlightBackgroundDescriptorProvider");
        v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v10)[2](v10, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = [UIVisualEffectView alloc];
        objc_msgSend(v11, "effect");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[UIVisualEffectView initWithEffect:](v12, "initWithEffect:", v13);

        -[UIView bounds](self, "bounds");
        -[UIView setFrame:](v14, "setFrame:");
        objc_msgSend(v11, "backgroundColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v14, "setBackgroundColor:", v15);

        objc_msgSend(v11, "contentBackgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView contentView](v14, "contentView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBackgroundColor:", v16);

        objc_msgSend(v11, "backgroundShape");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView _applyShape:](v14, "_applyShape:", v18);

        -[_UIContextMenuSubmenuTitleView bgView](self, "bgView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v14, v19);
        -[UIView _addBoundsMatchingConstraintsForView:](self, "_addBoundsMatchingConstraintsForView:", v14);

        -[_UIContextMenuSubmenuTitleView setHighlightedBgView:](self, "setHighlightedBgView:", v14);
      }
    }
    -[_UIContextMenuSubmenuTitleView highlightedBgView](self, "highlightedBgView");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", !v3);

  }
}

- (void)addObscuringMaterialViewWithGroupName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIVisualEffectView *v8;
  void *v9;
  UIVisualEffectView *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[_UIContextMenuSubmenuTitleView obscuringMaterialView](self, "obscuringMaterialView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v6, "userInterfaceIdiom"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [UIVisualEffectView alloc];
    objc_msgSend(v7, "menuBackgroundEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIVisualEffectView initWithEffect:](v8, "initWithEffect:", v9);

    objc_msgSend(v7, "menuBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[_UIContextMenuSubmenuTitleView bgView](self, "bgView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10, v12);
      -[UIView _addBoundsMatchingConstraintsForView:](self, "_addBoundsMatchingConstraintsForView:", v10);
    }

    -[_UIContextMenuSubmenuTitleView setObscuringMaterialView:](self, "setObscuringMaterialView:", v10);
  }
  -[_UIContextMenuSubmenuTitleView obscuringMaterialView](self, "obscuringMaterialView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setGroupName:", v4);

}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double leading;
  double top;
  void *v8;
  objc_super v9;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSubmenuTitleView;
  -[UIView setDirectionalLayoutMargins:](&v9, sel_setDirectionalLayoutMargins_);
  -[_UIContextMenuSubmenuTitleView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  _UIContextMenuSubmenuTitleView *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuSubmenuTitleView;
  v6 = a3;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem", v8.receiver, v8.super_class);
  v7 = (_UIContextMenuSubmenuTitleView *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuSubmenuTitleView setHighlighted:](self, "setHighlighted:", v7 == self);
}

- (int64_t)focusItemDeferralMode
{
  if (-[_UIContextMenuSubmenuTitleView highlighted](self, "highlighted"))
    return 2;
  else
    return 0;
}

- (BOOL)_wantsKeyCommandsWhenDeferred
{
  return 1;
}

- (_UIContextMenuCellContentView)contentView
{
  return self->_contentView;
}

- (UIVisualEffectView)obscuringMaterialView
{
  return self->_obscuringMaterialView;
}

- (void)setObscuringMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_obscuringMaterialView, a3);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (UIView)bgView
{
  return self->_bgView;
}

- (void)setBgView:(id)a3
{
  objc_storeStrong((id *)&self->_bgView, a3);
}

- (UIView)highlightedBgView
{
  return self->_highlightedBgView;
}

- (void)setHighlightedBgView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBgView, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_highlightedBgView, 0);
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_obscuringMaterialView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
