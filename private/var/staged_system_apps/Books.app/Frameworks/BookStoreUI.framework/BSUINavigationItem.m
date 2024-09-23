@implementation BSUINavigationItem

- (NSArray)bsui_leftBarButtonItems
{
  return (NSArray *)-[BSUINavigationItem leftBarButtonItems](self, "leftBarButtonItems");
}

- (NSArray)bsui_rightBarButtonItems
{
  return (NSArray *)-[BSUINavigationItem rightBarButtonItems](self, "rightBarButtonItems");
}

- (void)_setManualScrollEdgeAppearanceProgress:(double)a3
{
  objc_super v5;

  if (-[BSUINavigationItem _isManualScrollEdgeAppearanceEnabled](self, "_isManualScrollEdgeAppearanceEnabled")&& -[BSUINavigationItem isUpdatingManualScrollEdgeAppearanceProgress](self, "isUpdatingManualScrollEdgeAppearanceProgress"))
  {
    -[BSUINavigationItem _setManualScrollEdgeAppearanceEnabled:](self, "_setManualScrollEdgeAppearanceEnabled:", 0);
    -[BSUINavigationItem _setManualScrollEdgeAppearanceEnabled:](self, "_setManualScrollEdgeAppearanceEnabled:", 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)BSUINavigationItem;
    -[BSUINavigationItem _setManualScrollEdgeAppearanceProgress:](&v5, "_setManualScrollEdgeAppearanceProgress:", a3);
  }
}

- (void)setLeftBarButtonItem:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setLeftBarButtonItem:](&v5, "setLeftBarButtonItem:", v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
}

- (void)setLeftBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setLeftBarButtonItem:animated:](&v7, "setLeftBarButtonItem:animated:", v6, v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
}

- (void)setLeftBarButtonItems:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setLeftBarButtonItems:](&v5, "setLeftBarButtonItems:", v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
}

- (void)setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setLeftBarButtonItems:animated:](&v7, "setLeftBarButtonItems:animated:", v6, v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
}

- (void)setRightBarButtonItem:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setRightBarButtonItem:](&v5, "setRightBarButtonItem:", v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
}

- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setRightBarButtonItem:animated:](&v7, "setRightBarButtonItem:animated:", v6, v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
}

- (void)setRightBarButtonItems:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setRightBarButtonItems:](&v5, "setRightBarButtonItems:", v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
}

- (void)setRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
  v7.receiver = self;
  v7.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setRightBarButtonItems:animated:](&v7, "setRightBarButtonItems:animated:", v6, v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
}

- (void)setLeadingItemGroups:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setLeadingItemGroups:](&v5, "setLeadingItemGroups:", v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_leftBarButtonItems"));
}

- (void)setTrailingItemGroups:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
  v5.receiver = self;
  v5.super_class = (Class)BSUINavigationItem;
  -[BSUINavigationItem setTrailingItemGroups:](&v5, "setTrailingItemGroups:", v4);

  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
}

- (void)notifyRightBarButtonItemsDidChange
{
  -[BSUINavigationItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
  -[BSUINavigationItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bsui_rightBarButtonItems"));
}

- (BOOL)isUpdatingManualScrollEdgeAppearanceProgress
{
  return self->_isUpdatingManualScrollEdgeAppearanceProgress;
}

- (void)setIsUpdatingManualScrollEdgeAppearanceProgress:(BOOL)a3
{
  self->_isUpdatingManualScrollEdgeAppearanceProgress = a3;
}

@end
