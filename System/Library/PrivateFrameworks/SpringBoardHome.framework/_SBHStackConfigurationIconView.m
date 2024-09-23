@implementation _SBHStackConfigurationIconView

+ (id)groupNameBaseForComponentBackgroundViewOfType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if ((unint64_t)a3 > 6)
    return 0;
  if (((1 << a3) & 0x4D) != 0)
  {
    v7 = v3;
    v8 = v4;
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____SBHStackConfigurationIconView;
    objc_msgSendSuper2(&v6, sel_groupNameBaseForComponentBackgroundViewOfType_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (((1 << a3) & 0x22) != 0)
  {
    return CFSTR("SBHStackConfigurationCloseBox");
  }
  else
  {
    return CFSTR("SBHStackConfigurationWidget");
  }
}

- (unint64_t)customIconImageViewControllerPriority
{
  return 1;
}

- (BOOL)shouldTapGestureRecognizeAlongsideDragInteractionGestures
{
  return 0;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v5;

  v5 = a3;
  if (-[_SBHStackConfigurationIconView _cannotRemoveLastWidgetInWidgetSheet](self, "_cannotRemoveLastWidgetInWidgetSheet")&& objc_msgSend(v5, "numberOfDisplayedIconViews") == 2)
  {
    -[_SBHStackConfigurationIconView _updateCloseBoxForAllIconsInListView:animated:](self, "_updateCloseBoxForAllIconsInListView:animated:", v5, 1);
  }

}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v5;

  v5 = a3;
  if (-[_SBHStackConfigurationIconView _cannotRemoveLastWidgetInWidgetSheet](self, "_cannotRemoveLastWidgetInWidgetSheet")&& objc_msgSend(v5, "numberOfDisplayedIconViews") == 1)
  {
    -[_SBHStackConfigurationIconView _updateCloseBoxForAllIconsInListView:animated:](self, "_updateCloseBoxForAllIconsInListView:animated:", v5, 1);
  }

}

- (BOOL)shouldShowCloseBox
{
  BOOL v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SBHStackConfigurationIconView;
  v3 = -[SBIconView shouldShowCloseBox](&v13, sel_shouldShowCloseBox);
  -[_SBHStackConfigurationIconView _iconListView](self, "_iconListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (objc_msgSend(v5, "numberOfIcons") == 1)
  {
    -[_SBHStackConfigurationIconView _iconListView](self, "_iconListView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView icon](self, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    v6 = v3 & ~v11;
  }

  if (-[_SBHStackConfigurationIconView _cannotRemoveLastWidgetInWidgetSheet](self, "_cannotRemoveLastWidgetInWidgetSheet"))
  {
    return v6;
  }
  else
  {
    return v3;
  }
}

- (id)_stackConfigurationViewController
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[SBIconView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)_iconListView
{
  void *v2;
  void *v3;

  -[_SBHStackConfigurationIconView _stackConfigurationViewController](self, "_stackConfigurationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_cannotRemoveLastWidgetInWidgetSheet
{
  void *v2;
  void *v3;
  char v4;

  -[_SBHStackConfigurationIconView _stackConfigurationViewController](self, "_stackConfigurationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "cannotRemoveLastWidgetInWidgetSheet");
  else
    v4 = 0;

  return v4;
}

- (void)_updateCloseBoxForAllIconsInListView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
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
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "icons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(v5, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_updateCloseBoxAnimated:", v4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

@end
