@implementation _UICollectionViewListCellVisualProvider_tvOS

- (int64_t)defaultFocusStyle
{
  return 1;
}

- (BOOL)canFocusProgrammatically
{
  return 1;
}

- (id)accessoryManagerContainerView
{
  void *v3;
  void *cell;
  void *v5;
  id v6;

  -[UICollectionViewCell _focusedFloatingContentView](self->super._cell, "_focusedFloatingContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  cell = (void *)objc_claimAutoreleasedReturnValue();
  v5 = cell;
  if (!cell)
    cell = self->super._cell;
  v6 = cell;

  return v6;
}

- (void)configureFocusedFloatingContentView:(id)a3
{
  -[_UICollectionViewListCellVisualProvider_tvOS configureFocusedFloatingContentView:useSidebarListStyle:](self, "configureFocusedFloatingContentView:useSidebarListStyle:", a3, 0);
}

- (void)configureFocusedFloatingContentView:(id)a3 useSidebarListStyle:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFocusAnimationConfiguration:", v6);

  objc_msgSend(v15, "setBackgroundColor:forState:", 0, 0);
  objc_msgSend(v15, "setBackgroundColor:forState:", 0, 2);
  objc_msgSend(v15, "setRoundContentWhenDeselected:", 0);
  objc_msgSend(v15, "setClipsContentToBounds:", 0);
  objc_msgSend(v15, "setUnfocusedShadowVerticalOffset:", 10.0);
  objc_msgSend(v15, "setContentMotionRotation:translation:", 0.0, 0.0, 0.0, 4.0);
  if (a4)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.95);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:forState:", v7, 8);

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.95);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:forState:", v8, 1);

    objc_msgSend(v15, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    if (v10 == 2)
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.176470588, 0.176470588, 0.176470588, 0.4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 23;
    }
    else
    {
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.850980392, 0.850980392, 0.850980392, 0.3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 24;
    }
    objc_msgSend(v15, "setBackgroundColor:forState:", v11, 4);
    objc_msgSend(v15, "setCompositingMode:", v12);
    objc_msgSend(v15, "setShadowExpansion:", 30.0, 30.0);

  }
  else
  {
    objc_msgSend(v15, "setBackgroundColor:forState:", 0, 4);
    objc_msgSend(v15, "setBackgroundColor:forState:", 0, 8);
    objc_msgSend(v15, "setBackgroundColor:forState:", 0, 1);
    objc_msgSend(v15, "setShadowExpansion:", 45.0, 25.0);
  }
  -[UICollectionViewListCell _accessoryManager](self->super._cell, "_accessoryManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICollectionViewListCellVisualProvider_tvOS accessoryManagerContainerView](self, "accessoryManagerContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateContainerView:", v14);

}

@end
