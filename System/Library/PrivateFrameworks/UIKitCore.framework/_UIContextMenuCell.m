@implementation _UIContextMenuCell

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_isInternalCell
{
  return 1;
}

- (_UIContextMenuCell)initWithFrame:(CGRect)a3
{
  _UIContextMenuCell *v3;
  _UIContextMenuCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setFocusEffect:](v3, "setFocusEffect:", 0);
    -[UIView traitCollection](v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICollectionViewCell _setFocusStyle:](v4, "_setFocusStyle:", objc_msgSend(v6, "enableFloatingFocusStyle"));
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuCell;
  -[UICollectionViewCell setSelected:](&v14, sel_setSelected_);
  -[_UIContextMenuCell _updateStateWithAnimationCoordinator:animated:](self, "_updateStateWithAnimationCoordinator:animated:", 0, +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
  if (v3)
  {
    -[UICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
    v5 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(UIVisualEffectView);
      -[UICollectionViewCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v5);
    }
    -[_UIContextMenuCell actionView](self, "actionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentShape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      +[UIShape rectShape](UIShape, "rectShape");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    -[_UIContextMenuCell _backgroundShape](self, "_backgroundShape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v10) ^ 1;

    if (-[_UIContextMenuCell _selectedBackgroundViewNeedsUpdate](self, "_selectedBackgroundViewNeedsUpdate")
      || (_DWORD)v12)
    {
      -[_UIContextMenuCell set_backgroundShape:](self, "set_backgroundShape:", v10);
      -[_UIContextMenuCell _configureBackgroundView:withContentShape:](self, "_configureBackgroundView:withContentShape:", v5, v10);
      -[_UIContextMenuCell set_highlightBackgroundViewNeedsUpdate:](self, "set_highlightBackgroundViewNeedsUpdate:", v12);
      -[_UIContextMenuCell set_selectedBackgroundViewNeedsUpdate:](self, "set_selectedBackgroundViewNeedsUpdate:", 0);
    }

  }
  -[UICollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", !v3);

}

- (void)setHighlighted:(BOOL)a3 forHover:(BOOL)a4
{
  int v4;
  _BOOL4 v5;
  void *v7;
  int v8;

  v4 = a4;
  v5 = a3;
  -[_UIContextMenuCell actionView](self, "actionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldHighlightOnHover");

  -[_UIContextMenuCell setHighlighted:](self, "setHighlighted:", (v8 | ~v4) & v5);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuCell;
  -[UICollectionViewCell setHighlighted:](&v14, sel_setHighlighted_);
  -[_UIContextMenuCell _updateStateWithAnimationCoordinator:animated:](self, "_updateStateWithAnimationCoordinator:animated:", 0, +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
  if (v3)
  {
    -[UICollectionViewCell backgroundView](self, "backgroundView");
    v5 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(UIVisualEffectView);
      -[UICollectionViewCell setBackgroundView:](self, "setBackgroundView:", v5);
    }
    -[_UIContextMenuCell actionView](self, "actionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentShape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      +[UIShape rectShape](UIShape, "rectShape");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    -[_UIContextMenuCell _backgroundShape](self, "_backgroundShape");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v10) ^ 1;

    if (-[_UIContextMenuCell _highlightBackgroundViewNeedsUpdate](self, "_highlightBackgroundViewNeedsUpdate")
      || (_DWORD)v12)
    {
      -[_UIContextMenuCell set_backgroundShape:](self, "set_backgroundShape:", v10);
      -[_UIContextMenuCell _configureBackgroundView:withContentShape:](self, "_configureBackgroundView:withContentShape:", v5, v10);
      -[_UIContextMenuCell set_highlightBackgroundViewNeedsUpdate:](self, "set_highlightBackgroundViewNeedsUpdate:", 0);
      -[_UIContextMenuCell set_selectedBackgroundViewNeedsUpdate:](self, "set_selectedBackgroundViewNeedsUpdate:", v12);
    }

  }
  -[UICollectionViewCell backgroundView](self, "backgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", !v3);

}

- (void)_configureBackgroundView:(id)a3 withContentShape:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");
  v18 = v6;
  _UIContextMenuGetPlatformMetrics(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuHighlightBackgroundDescriptorProvider");
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v11)[2](v11, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](self, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v12, "effect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEffect:", v13);

  objc_msgSend(v12, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v14);

  objc_msgSend(v12, "contentBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  objc_msgSend(v12, "backgroundShape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_applyShape:", v17);

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
  v9.super_class = (Class)_UIContextMenuCell;
  -[UIView setDirectionalLayoutMargins:](&v9, sel_setDirectionalLayoutMargins_);
  -[UICollectionViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDirectionalLayoutMargins:", top, leading, bottom, trailing);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[_UIContextMenuCell actionView](self, "actionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuCell;
  -[UICollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

+ (BOOL)_wantsLegacyMenuGesture
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuCell;
  v6 = a4;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v7, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, v6);
  -[_UIContextMenuCell _updateStateWithAnimationCoordinator:animated:](self, "_updateStateWithAnimationCoordinator:animated:", v6, 1, v7.receiver, v7.super_class);

}

- (int64_t)focusItemDeferralMode
{
  if (-[UICollectionViewCell isHighlighted](self, "isHighlighted"))
    return 2;
  else
    return 0;
}

- (BOOL)_wantsKeyCommandsWhenDeferred
{
  return 1;
}

- (BOOL)_allowsHorizontalFocusMovement
{
  void *v2;
  unint64_t v3;

  -[_UIContextMenuCell actionView](self, "actionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "options") >> 7) & 1;

  return v3;
}

- (void)_updateStateWithAnimationCoordinator:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (-[UICollectionViewCell isFocused](self, "isFocused"))
    v6 = 8;
  else
    v6 = 0;
  if (-[UICollectionViewCell isSelected](self, "isSelected"))
    v6 |= 4uLL;
  v7 = v6 | -[UICollectionViewCell isHighlighted](self, "isHighlighted");
  -[_UIContextMenuCell actionView](self, "actionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setControlState:withAnimationCoordinator:", v7, v11);

  -[UICollectionViewCell _focusedFloatingContentView](self, "_focusedFloatingContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v11)
    objc_msgSend(v9, "setControlState:withAnimationCoordinator:", v7, v11);
  else
    objc_msgSend(v9, "setControlState:animated:", v7, v4);

}

- (void)_configureFocusedFloatingContentView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFocusAnimationConfiguration:", v4);

  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 0);
  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 8);
  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 1);
  objc_msgSend(v3, "setBackgroundColor:forState:", 0, 4);
  objc_msgSend(v3, "setRoundContentWhenDeselected:", 1);
  objc_msgSend(v3, "setClipsContentToBounds:", 1);
  objc_msgSend(v3, "setFocusedSizeIncrease:", 20.0);
  objc_msgSend(v3, "setShadowExpansion:", 45.0, 25.0);
  objc_msgSend(v3, "setUnfocusedShadowVerticalOffset:", 10.0);
  objc_msgSend(v3, "setContentMotionRotation:translation:", 0.0, 0.0, 0.0, 4.0);
  objc_msgSend(v3, "setCornerRadius:", 16.0);
  objc_msgSend(v3, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v3, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupBlending:", 0);

}

- (UIShape)_backgroundShape
{
  return self->__backgroundShape;
}

- (void)set_backgroundShape:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (BOOL)_highlightBackgroundViewNeedsUpdate
{
  return *(&self->__selectedBackgroundViewNeedsUpdate + 3);
}

- (void)set_highlightBackgroundViewNeedsUpdate:(BOOL)a3
{
  *(&self->__selectedBackgroundViewNeedsUpdate + 3) = a3;
}

- (BOOL)_selectedBackgroundViewNeedsUpdate
{
  return *(&self->__selectedBackgroundViewNeedsUpdate + 4);
}

- (void)set_selectedBackgroundViewNeedsUpdate:(BOOL)a3
{
  *(&self->__selectedBackgroundViewNeedsUpdate + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundShape, 0);
}

@end
