@implementation UITab

- (UITab)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 viewControllerProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UITab *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  UIImage *image;
  void *v21;
  id viewControllerProvider;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)UITab;
  v14 = -[UITab init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v10, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v17;

    v19 = objc_msgSend(v11, "copy");
    image = v14->_image;
    v14->_image = (UIImage *)v19;

    v21 = _Block_copy(v13);
    viewControllerProvider = v14->_viewControllerProvider;
    v14->_viewControllerProvider = v21;

    v14->_springLoaded = 1;
    v14->_preferredPlacement = 0;
  }

  return v14;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *title;
  void *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_title;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v11, "copy");
    title = self->_title;
    self->_title = v8;

    -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v11);

    -[UITab _contentDidChange](self, "_contentDidChange");
  }
LABEL_9:

}

- (void)setImage:(id)a3
{
  id v4;
  UIImage *v5;
  UIImage *v6;
  BOOL v7;
  UIImage *v8;
  UIImage *image;
  void *v10;
  void *v11;
  UIImage *v12;

  v4 = a3;
  v5 = self->_image;
  v6 = (UIImage *)v4;
  v12 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIImage isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (UIImage *)-[UIImage copy](v12, "copy");
    image = self->_image;
    self->_image = v8;

    -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITab _filledVariantImage](self, "_filledVariantImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v11);

    -[UITab _contentDidChange](self, "_contentDidChange");
  }
LABEL_9:

}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *subtitle;
  NSString *v10;

  v4 = a3;
  v5 = self->_subtitle;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    subtitle = self->_subtitle;
    self->_subtitle = v8;

    -[UITab _contentDidChange](self, "_contentDidChange");
  }
LABEL_9:

}

- (void)setBadgeValue:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *badgeValue;
  void *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_badgeValue;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v11, "copy");
    badgeValue = self->_badgeValue;
    self->_badgeValue = v8;

    -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBadgeValue:", v11);

    -[UITab _contentDidChange](self, "_contentDidChange");
  }
LABEL_9:

}

- (void)setPreferredPlacement:(int64_t)a3
{
  if (self->_preferredPlacement != a3)
  {
    self->_preferredPlacement = a3;
    -[UITab _customizabilityDidChange](self, "_customizabilityDidChange");
    -[UITab _contentDidChange](self, "_contentDidChange");
  }
}

- (BOOL)hasVisiblePlacement
{
  void *v3;
  unint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  char v8;

  if (-[UITab isHidden](self, "isHidden")
    || (-[UITab _tabModel](self, "_tabModel"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = -[UITab _tabPlacement](self, "_tabPlacement") - 3;
    if (v4 >= 4)
    {
      -[UITab _tabModel](self, "_tabModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "customizationStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "favoriteOrderContainsTab:", self);

      LOBYTE(v5) = v8;
    }
    else
    {
      return (7u >> (v4 & 0xF)) & 1;
    }
  }
  return v5;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    -[UITab _visibilityDidChange](self, "_visibilityDidChange");
  }
}

- (void)setAllowsHiding:(BOOL)a3
{
  if (self->_allowsHiding != a3)
  {
    self->_allowsHiding = a3;
    -[UITab _customizabilityDidChange](self, "_customizabilityDidChange");
  }
}

- (UITabBarController)tabBarController
{
  void *v2;
  void *v3;

  -[UITab _tabModel](self, "_tabModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITabBarController *)v3;
}

- (UIViewController)viewController
{
  void (**viewControllerProvider)(id, UITab *);
  UIViewController *v5;
  UIViewController *viewController;
  void *v7;
  id v8;
  void *v10;

  viewControllerProvider = (void (**)(id, UITab *))self->_viewControllerProvider;
  if (viewControllerProvider)
  {
    viewControllerProvider[2](viewControllerProvider, self);
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    viewController = self->_viewController;
    self->_viewController = v5;

    -[UIViewController tab](self->_viewController, "tab");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITab.m"), 173, CFSTR("UIViewController cannot be shared between multiple UITab."));

    }
    -[UIViewController _attachTab:]((uint64_t)self->_viewController, self);
    v8 = self->_viewControllerProvider;
    self->_viewControllerProvider = 0;

    -[UITab _updateLinkedTabBarItem](self, "_updateLinkedTabBarItem");
  }
  return self->_viewController;
}

- (UITabGroup)managingTabGroup
{
  void *v2;
  void *v3;

  -[UITab parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managingTabGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITabGroup *)v3;
}

- (NSArray)_displayedViewControllers
{
  NSArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = self->_displayedViewControllers;
  if (!-[NSArray count](v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    -[UITab viewController](self, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithObjects:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (NSArray *)v6;
  }
  return v3;
}

- (void)_setDisplayedViewControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *displayedViewControllers;
  NSArray *v8;
  NSArray *v9;
  char v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;

  v4 = a3;
  if (!objc_msgSend(v4, "count")
    || objc_msgSend(v4, "count") == 1
    && (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[UITab viewController](self, "viewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {

    v4 = 0;
  }
  displayedViewControllers = self->_displayedViewControllers;
  v14 = (NSArray *)v4;
  v8 = displayedViewControllers;
  if (v14 == v8)
  {

    v12 = v14;
  }
  else
  {
    v9 = v8;
    if (v14 && v8)
    {
      v10 = -[NSArray isEqual:](v14, "isEqual:", v8);

      v11 = v14;
      if ((v10 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

      v11 = v14;
    }
    v13 = v11;
    v12 = self->_displayedViewControllers;
    self->_displayedViewControllers = v13;
  }

  v11 = v14;
LABEL_14:

}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  UITab *v4;
  int64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  char v8;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;

  v4 = (UITab *)a3;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[UITab preferredPlacement](self, "preferredPlacement");
    if (v5 == -[UITab preferredPlacement](v4, "preferredPlacement"))
    {
      v6 = -[UITab isHidden](self, "isHidden");
      if (v6 == -[UITab isHidden](v4, "isHidden"))
      {
        v7 = -[UITab allowsHiding](self, "allowsHiding");
        if (v7 == -[UITab allowsHiding](v4, "allowsHiding"))
        {
          -[UITab identifier](self, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITab identifier](v4, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v10;
          v13 = v11;
          if (v12 == v13)
          {

          }
          else
          {
            v14 = v13;
            if (!v12 || !v13)
              goto LABEL_20;
            v15 = objc_msgSend(v12, "isEqual:", v13);

            if ((v15 & 1) == 0)
              goto LABEL_6;
          }
          -[UITab title](self, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITab title](v4, "title");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v16;
          v18 = v17;
          if (v12 == v18)
          {

LABEL_23:
            -[UITab image](self, "image");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITab image](v4, "image");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = UIEqual(v20, v21);

            if (!v22)
              goto LABEL_6;
            -[UITab subtitle](self, "subtitle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITab subtitle](v4, "subtitle");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = UIEqual(v23, v24);

            if (!v25)
              goto LABEL_6;
            -[UITab badgeValue](self, "badgeValue");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            -[UITab badgeValue](v4, "badgeValue");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = UIEqual(v12, v14);
LABEL_21:

            goto LABEL_8;
          }
          v14 = v18;
          if (v12 && v18)
          {
            v19 = objc_msgSend(v12, "isEqual:", v18);

            if ((v19 & 1) == 0)
              goto LABEL_6;
            goto LABEL_23;
          }
LABEL_20:

          v8 = 0;
          goto LABEL_21;
        }
      }
    }
  }
LABEL_6:
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)_setCompactRepresentation:(id)a3
{
  id v5;
  _UITabAlternateRepresentation *v6;
  _UITabAlternateRepresentation *v7;
  char v8;
  _UITabAlternateRepresentation *v9;

  v5 = a3;
  v6 = self->__compactRepresentation;
  v7 = (_UITabAlternateRepresentation *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[_UITabAlternateRepresentation isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->__compactRepresentation, a3);
    -[UITab _contentDidChange](self, "_contentDidChange");
  }
LABEL_9:

}

- (void)setSpringLoaded:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_springLoaded != a3)
  {
    v3 = a3;
    self->_springLoaded = a3;
    -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSpringLoaded:", v3);

  }
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *accessibilityIdentifier;
  void *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_accessibilityIdentifier;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v11, "copy");
    accessibilityIdentifier = self->_accessibilityIdentifier;
    self->_accessibilityIdentifier = v8;

    -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v11);

    -[UITab _contentDidChange](self, "_contentDidChange");
  }
LABEL_9:

}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[NSObject accessibilityLabel](self, "accessibilityLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v6 && v5)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  -[NSObject setAccessibilityLabel:](&v10, sel_setAccessibilityLabel_, v7);
  -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v7);

  if ((v8 & 1) == 0)
    -[UITab _contentDidChange](self, "_contentDidChange");

}

- (void)setAccessibilityAttributedLabel:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[NSObject accessibilityAttributedLabel](self, "accessibilityAttributedLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v6 && v5)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  -[NSObject setAccessibilityAttributedLabel:](&v10, sel_setAccessibilityAttributedLabel_, v7);
  -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityAttributedLabel:", v7);

  if ((v8 & 1) == 0)
    -[UITab _contentDidChange](self, "_contentDidChange");

}

- (void)setAccessibilityValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[NSObject accessibilityValue](self, "accessibilityValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v6 && v5)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  -[NSObject setAccessibilityValue:](&v10, sel_setAccessibilityValue_, v7);
  -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityValue:", v7);

  if ((v8 & 1) == 0)
    -[UITab _contentDidChange](self, "_contentDidChange");

}

- (void)setAccessibilityAttributedValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[NSObject accessibilityAttributedValue](self, "accessibilityAttributedValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v6 && v5)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  -[NSObject setAccessibilityAttributedValue:](&v10, sel_setAccessibilityAttributedValue_, v7);
  -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityAttributedValue:", v7);

  if ((v8 & 1) == 0)
    -[UITab _contentDidChange](self, "_contentDidChange");

}

- (void)setAccessibilityHint:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[NSObject accessibilityHint](self, "accessibilityHint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v6 && v5)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  -[NSObject setAccessibilityHint:](&v10, sel_setAccessibilityHint_, v7);
  -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityHint:", v7);

  if ((v8 & 1) == 0)
    -[UITab _contentDidChange](self, "_contentDidChange");

}

- (void)setAccessibilityAttributedHint:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[NSObject accessibilityAttributedHint](self, "accessibilityAttributedHint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v6 && v5)
      v8 = objc_msgSend(v5, "isEqual:", v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)UITab;
  -[NSObject setAccessibilityAttributedHint:](&v10, sel_setAccessibilityAttributedHint_, v7);
  -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityAttributedHint:", v7);

  if ((v8 & 1) == 0)
    -[UITab _contentDidChange](self, "_contentDidChange");

}

- (NSString)description
{
  return (NSString *)-[UITab _descriptionWithRecursion:](self, "_descriptionWithRecursion:", 0);
}

- (id)_descriptionWithRecursion:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITab _updateDescriptionWithBuilder:recursive:](self, "_updateDescriptionWithBuilder:recursive:", v5, v3);
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateDescriptionWithBuilder:(id)a3 recursive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  UIImage *image;
  id v10;
  id v11;
  unint64_t v12;
  const __CFString *v13;
  id v14;
  id v15;
  id v16;
  UIViewController *viewController;
  void *v18;
  id v19;
  id v20;
  id v21;

  v4 = a4;
  v21 = a3;
  v6 = (id)objc_msgSend(v21, "appendName:object:", CFSTR("identifier"), self->_identifier);
  v7 = (id)objc_msgSend(v21, "appendName:object:", CFSTR("title"), self->_title);
  if (self->_subtitle)
    v8 = (id)objc_msgSend(v21, "appendName:object:", CFSTR("subtitle"));
  image = self->_image;
  if (image)
    v10 = (id)objc_msgSend(v21, "appendName:object:usingLightweightDescription:", CFSTR("image"), image, 1);
  if (self->_badgeValue)
    v11 = (id)objc_msgSend(v21, "appendName:object:", CFSTR("badgeValue"));
  v12 = -[UITab preferredPlacement](self, "preferredPlacement");
  if (v12 > 6)
    v13 = CFSTR("<unknown>");
  else
    v13 = off_1E16BDD58[v12];
  v14 = (id)objc_msgSend(v21, "appendName:object:", CFSTR("placement"), v13);
  if (self->_hidden)
    v15 = (id)objc_msgSend(v21, "appendName:BOOLValue:", CFSTR("hidden"), 1);
  if (self->_allowsHiding)
    v16 = (id)objc_msgSend(v21, "appendName:BOOLValue:", CFSTR("allowsHiding"), 1);
  viewController = self->_viewController;
  v18 = v21;
  if (viewController)
  {
    v19 = (id)objc_msgSend(v21, "appendName:object:usingLightweightDescription:", CFSTR("viewController"), viewController, 1);
    v18 = v21;
  }
  if (self->_parent && v4)
  {
    v20 = (id)objc_msgSend(v21, "appendName:object:usingLightweightDescription:", CFSTR("parent"));
    v18 = v21;
  }

}

- (id)_recursiveDescription
{
  return _UIRecursiveDescription(self, (uint64_t)&__block_literal_global_110, (uint64_t)&__block_literal_global_40);
}

id __30__UITab__recursiveDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "_isGroup"))
  {
    objc_msgSend(v2, "children");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __30__UITab__recursiveDescription__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_descriptionWithRecursion:", 1);
}

- (UITabBarItem)_linkedTabBarItem
{
  void *v2;
  void *v3;

  -[UITab _displayedViewController](self, "_displayedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITabBarItem *)v3;
}

- (void)_updateLinkedTabBarItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[UITab _linkedTabBarItem](self, "_linkedTabBarItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[UITab title](self, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v3);

    -[UITab _filledVariantImage](self, "_filledVariantImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:", v4);

    -[UITab badgeValue](self, "badgeValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBadgeValue:", v5);

    -[UITab accessibilityIdentifier](self, "accessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityIdentifier:", v6);

    -[NSObject accessibilityLabel](self, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityLabel:", v7);

    -[NSObject accessibilityAttributedLabel](self, "accessibilityAttributedLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityAttributedLabel:", v8);

    -[NSObject accessibilityValue](self, "accessibilityValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityValue:", v9);

    -[NSObject accessibilityAttributedValue](self, "accessibilityAttributedValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityAttributedValue:", v10);

    -[NSObject accessibilityHint](self, "accessibilityHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityHint:", v11);

    -[NSObject accessibilityAttributedHint](self, "accessibilityAttributedHint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityAttributedHint:", v12);

    objc_msgSend(v13, "setSpringLoaded:", -[UITab isSpringLoaded](self, "isSpringLoaded"));
  }

}

- (void)_setParent:(id)a3
{
  UITabGroup *v4;
  UITabGroup *parent;
  id v6;
  id v7;

  v4 = (UITabGroup *)a3;
  -[UITab _tabModel](self, "_tabModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  parent = self->_parent;
  self->_parent = v4;

  -[UITab _tabModel](self, "_tabModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6)
    -[UITab _didChangeTabModel:](self, "_didChangeTabModel:", v6);

}

- (int64_t)_tabPlacement
{
  int64_t v3;
  void *v4;
  void *v6;
  char v7;

  v3 = -[UITab preferredPlacement](self, "preferredPlacement");
  if (os_variant_has_internal_diagnostics()
    && (-[UITab identifier](self, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = _UITabOverridesDefaultPlacement(v6),
        v6,
        (v7 & 1) != 0)
    || !v3)
  {
    -[UITab _parentGroup](self, "_parentGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return 2;
    else
      return 1;
  }
  return v3;
}

- (BOOL)_hasCustomizablePlacement
{
  return (unint64_t)(-[UITab _tabPlacement](self, "_tabPlacement") - 1) < 3;
}

- (_UITabModel)_tabModel
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabModel);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    -[UITab _parentGroup](self, "_parentGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_tabModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (_UITabModel *)v5;
}

- (void)_setTabModel:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabModel);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabModel, obj);
    -[UITab _didChangeTabModel:](self, "_didChangeTabModel:", obj);
  }

}

- (id)_filledVariantImage
{
  UIImage *image;
  void *v3;
  void *v4;

  image = self->_image;
  +[_UIImageSymbolVariant filledVariant](_UIImageSymbolVariant, "filledVariant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage _imageByApplyingSymbolVariant:](image, "_imageByApplyingSymbolVariant:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_contentDidChange
{
  id v3;

  -[UITab _tabModel](self, "_tabModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabContentDidChange:", self);

}

- (void)_visibilityDidChange
{
  id v3;

  -[UITab _tabModel](self, "_tabModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibilityDidChangeForTab:editing:", self, 0);

}

- (void)_customizabilityDidChange
{
  id v3;

  -[UITab _tabModel](self, "_tabModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customizabilityDidChangeForTab:", self);

}

- (BOOL)_hasParent
{
  void *v2;
  BOOL v3;

  -[UITab _parentGroup](self, "_parentGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isGroup
{
  return 0;
}

- (BOOL)_isElement
{
  return 1;
}

- (BOOL)_isAction
{
  return 0;
}

- (BOOL)_isMoreTab
{
  return 0;
}

- (BOOL)_isUniquelySPI
{
  return 0;
}

- (BOOL)_isBridgedItem
{
  return 0;
}

- (BOOL)_isAncestorOfTab:(id)a3
{
  UITab *v4;
  UITab *v5;
  UITab *v6;
  BOOL v7;

  v4 = (UITab *)a3;
  if (!v4)
    return 0;
  v5 = v4;
  do
  {
    v6 = v5;
    -[UITab _parentGroup](v5, "_parentGroup");
    v5 = (UITab *)objc_claimAutoreleasedReturnValue();

    v7 = v5 == self;
  }
  while (v5 && v5 != self);

  return v7;
}

- (BOOL)_canBeReordered
{
  UITab *v2;
  void *v3;

  v2 = self;
  -[UITab _parentGroup](self, "_parentGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "_canReorderChild:", v2);

  return (char)v2;
}

- (id)_parentGroup
{
  return self->_parent;
}

- (void)_didChangeTabModel:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  char v7;

  if (a3)
  {
    v7 = 0;
    objc_msgSend(a3, "customizationStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITab identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isHiddenForTabIdentifier:isCustomized:", v5, &v7);

    if (v7)
      self->_hidden = v6;
  }
}

- (BOOL)_isCustomizable
{
  return -[UITab allowsHiding](self, "allowsHiding")
      || -[UITab _hasCustomizablePlacement](self, "_hasCustomizablePlacement");
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (id)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)badgeValue
{
  return self->_badgeValue;
}

- (int64_t)preferredPlacement
{
  return self->_preferredPlacement;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (UITabGroup)parent
{
  return self->_parent;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isHiddenByDefault
{
  return self->_hiddenByDefault;
}

- (void)setHiddenByDefault:(BOOL)a3
{
  self->_hiddenByDefault = a3;
}

- (BOOL)allowsHiding
{
  return self->_allowsHiding;
}

- (NSString)_clusterIdentifier
{
  return self->__clusterIdentifier;
}

- (void)_setClusterIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__clusterIdentifier, a3);
}

- (_UITabAlternateRepresentation)_compactRepresentation
{
  return self->__compactRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__compactRepresentation, 0);
  objc_storeStrong((id *)&self->__clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_tabModel);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedViewControllers, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_viewControllerProvider, 0);
}

- (CGRect)frameInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[UITab _resolvedSourceItem](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frameInView:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)_resolvedSourceItem
{
  id v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "_tabModel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resolvedPopoverPresentationControllerSourceItemForTab:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v6 = a4;
  v7 = a3;
  -[UITab _resolvedSourceItem](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_frameInCoordinateSpace:window:", v7, v6);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_nearestViewController
{
  void *v2;
  void *v3;

  -[UITab _resolvedSourceItem](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_nearestViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sourceViewForPresentationInWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITab _resolvedSourceItem](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sourceViewForPresentationInWindow:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[UITab _resolvedSourceItem](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sourceRectForPresentationInWindow:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

@end
