@implementation SUUIAppearance

+ (id)defaultAppearance
{
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (!_UIApplicationUsesLegacyUI())
    return 0;
  v3 = objc_alloc_init((Class)objc_opt_class());
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDefaultBackground"), v4);
  v6 = *MEMORY[0x24BDF7718];
  v7 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v8 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v9 = *(double *)(MEMORY[0x24BDF7718] + 24);
  v10 = objc_msgSend(v5, "resizableImageWithCapInsets:", *MEMORY[0x24BDF7718], v7, v8, v9);
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDefaultBackground"), v4), "resizableImageWithCapInsets:", v6, v7, v8, v9);
  objc_msgSend(v3, "setNavigationBarBackgroundImage:forBarMetrics:", v10, 0);
  objc_msgSend(v3, "setNavigationBarBackgroundImage:forBarMetrics:", v11, 1);
  objc_msgSend(v3, "setTabBarAppearance:", objc_msgSend(a1, "_defaultTabBarAppearance"));
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.784313725, 1.0);
  objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x24BDF6600]);
  v14 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0.0, -1.0);
  objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x24BDF6640]);
  objc_msgSend(v3, "setNavigationBarTitleTextAttributes:", v12);

  v3[48] = 1;
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIAppearance;
  -[SUUIAppearance dealloc](&v3, sel_dealloc);
}

- (SUControlAppearance)backButtonAppearance
{
  SUControlAppearance *backButtonAppearance;

  backButtonAppearance = self->_backButtonAppearance;
  if (!backButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      backButtonAppearance = (SUControlAppearance *)(id)objc_msgSend((id)objc_opt_class(), "_defaultBackButtonAppearance");
      self->_backButtonAppearance = backButtonAppearance;
    }
    else
    {
      backButtonAppearance = 0;
    }
  }
  return (SUControlAppearance *)(id)-[SUControlAppearance copy](backButtonAppearance, "copy");
}

- (SUControlAppearance)confirmationButtonAppearance
{
  SUControlAppearance *confirmationButtonAppearance;

  confirmationButtonAppearance = self->_confirmationButtonAppearance;
  if (!confirmationButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      confirmationButtonAppearance = (SUControlAppearance *)(id)objc_msgSend((id)objc_opt_class(), "_defaultConfirmationButtonAppearance");
      self->_confirmationButtonAppearance = confirmationButtonAppearance;
    }
    else
    {
      confirmationButtonAppearance = 0;
    }
  }
  return (SUControlAppearance *)(id)-[SUControlAppearance copy](confirmationButtonAppearance, "copy");
}

- (SUControlAppearance)destructiveButtonAppearance
{
  SUControlAppearance *destructiveButtonAppearance;

  destructiveButtonAppearance = self->_destructiveButtonAppearance;
  if (!destructiveButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      destructiveButtonAppearance = (SUControlAppearance *)(id)objc_msgSend((id)objc_opt_class(), "_defaultDestructiveButtonAppearance");
      self->_destructiveButtonAppearance = destructiveButtonAppearance;
    }
    else
    {
      destructiveButtonAppearance = 0;
    }
  }
  return (SUControlAppearance *)(id)-[SUControlAppearance copy](destructiveButtonAppearance, "copy");
}

- (SUControlAppearance)exitStoreButtonAppearance
{
  SUControlAppearance *exitStoreButtonAppearance;
  uint64_t v4;
  SUControlAppearance *v5;

  exitStoreButtonAppearance = self->_exitStoreButtonAppearance;
  if (!exitStoreButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = objc_alloc_init(SUControlAppearance);
      self->_exitStoreButtonAppearance = v5;
      -[SUControlAppearance setImage:forState:barMetrics:](v5, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarCircularButton"), v4), 0, 0);
      -[SUControlAppearance setImage:forState:barMetrics:](self->_exitStoreButtonAppearance, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarCircularButtonPressed"), v4), 1, 0);
      exitStoreButtonAppearance = self->_exitStoreButtonAppearance;
    }
    else
    {
      exitStoreButtonAppearance = 0;
    }
  }
  return (SUControlAppearance *)(id)-[SUControlAppearance copy](exitStoreButtonAppearance, "copy");
}

- (SUControlAppearance)forwardButtonAppearance
{
  SUControlAppearance *forwardButtonAppearance;

  forwardButtonAppearance = self->_forwardButtonAppearance;
  if (!forwardButtonAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      forwardButtonAppearance = (SUControlAppearance *)(id)objc_msgSend((id)objc_opt_class(), "_defaultForwardButtonAppearance");
      self->_forwardButtonAppearance = forwardButtonAppearance;
    }
    else
    {
      forwardButtonAppearance = 0;
    }
  }
  return (SUControlAppearance *)(id)-[SUControlAppearance copy](forwardButtonAppearance, "copy");
}

- (id)navigationBarBackgroundImageForBarMetrics:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_navigationBarBackgroundImages, "objectForKey:", v4);

  return v5;
}

- (id)navigationButtonAppearanceForStyle:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v6 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_navigationButtonAppearance, "objectForKey:", v5), "copy");
  if (!v6)
  {
    if (self->_isDefaultAppearance)
    {
      if (a3 == 2)
      {
        v7 = (void *)objc_msgSend((id)objc_opt_class(), "_defaultDoneButtonAppearance");
      }
      else
      {
        if (a3)
          goto LABEL_9;
        v7 = (void *)objc_msgSend((id)objc_opt_class(), "_defaultButtonAppearance");
      }
      v8 = v7;
      if (v7)
      {
        v6 = (id)objc_msgSend(v7, "copy");
        -[SUUIAppearance setNavigationButtonAppearance:forStyle:](self, "setNavigationButtonAppearance:forStyle:", v8, a3);
        goto LABEL_10;
      }
    }
LABEL_9:
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (id)segmentedControlAppearanceForStyle:(int64_t)a3 tintStyle:(int64_t)a4
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = -[SUUIAppearance _copySegmentedControlKeyWithStyle:tintStyle:](self, "_copySegmentedControlKeyWithStyle:tintStyle:");
  v8 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_segmentedControlAppearance, "objectForKey:", v7), "copy");
  if (!v8)
  {
    if (self->_isDefaultAppearance)
    {
      if (a3 == 7)
      {
        v9 = +[SUSegmentedControlAppearance defaultOptionsAppearanceForTintStyle:](SUSegmentedControlAppearance, "defaultOptionsAppearanceForTintStyle:", a4);
      }
      else
      {
        if (a3 != 2)
          goto LABEL_9;
        v9 = +[SUSegmentedControlAppearance defaultBarAppearance](SUSegmentedControlAppearance, "defaultBarAppearance");
      }
      v10 = v9;
      if (v9)
      {
        v8 = (id)objc_msgSend(v9, "copy");
        -[SUUIAppearance setSegmentedControlAppearance:forStyle:tintStyle:](self, "setSegmentedControlAppearance:forStyle:tintStyle:", v10, a3, a4);
        goto LABEL_10;
      }
    }
LABEL_9:
    v8 = 0;
  }
LABEL_10:

  return v8;
}

- (void)setNavigationBarBackgroundImage:(id)a3 forBarMetrics:(int64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *navigationBarBackgroundImages;
  id v8;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  navigationBarBackgroundImages = self->_navigationBarBackgroundImages;
  v8 = (id)v6;
  if (a3)
  {
    if (!navigationBarBackgroundImages)
    {
      navigationBarBackgroundImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_navigationBarBackgroundImages = navigationBarBackgroundImages;
    }
    -[NSMutableDictionary setObject:forKey:](navigationBarBackgroundImages, "setObject:forKey:", a3, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](navigationBarBackgroundImages, "removeObjectForKey:");
  }

}

- (void)setNavigationButtonAppearance:(id)a3 forStyle:(int64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *navigationButtonAppearance;
  void *v8;
  id v9;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  navigationButtonAppearance = self->_navigationButtonAppearance;
  v9 = (id)v6;
  if (a3)
  {
    if (!navigationButtonAppearance)
      self->_navigationButtonAppearance = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend(a3, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_navigationButtonAppearance, "setObject:forKey:", v8, v9);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](navigationButtonAppearance, "removeObjectForKey:");
  }

}

- (void)setSegmentedControlAppearance:(id)a3 forStyle:(int64_t)a4 tintStyle:(int64_t)a5
{
  id v7;
  NSMutableDictionary *segmentedControlAppearance;
  void *v9;
  id v10;

  v7 = -[SUUIAppearance _copySegmentedControlKeyWithStyle:tintStyle:](self, "_copySegmentedControlKeyWithStyle:tintStyle:", a4, a5);
  segmentedControlAppearance = self->_segmentedControlAppearance;
  v10 = v7;
  if (a3)
  {
    if (!segmentedControlAppearance)
      self->_segmentedControlAppearance = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = (void *)objc_msgSend(a3, "copy");
    -[NSMutableDictionary setObject:forKey:](self->_segmentedControlAppearance, "setObject:forKey:", v9, v10);

  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](segmentedControlAppearance, "removeObjectForKey:");
  }

}

- (void)styleBarButtonItem:(id)a3
{
  objc_msgSend(-[SUUIAppearance navigationButtonAppearanceForStyle:](self, "navigationButtonAppearanceForStyle:", objc_msgSend(a3, "style")), "styleBarButtonItem:", a3);
}

- (void)styleConfirmationButtonItem:(id)a3
{
  SUControlAppearance *v5;
  SUUIAppearance *v6;

  v5 = -[SUUIAppearance confirmationButtonAppearance](self, "confirmationButtonAppearance");
  if (-[SUControlAppearance numberOfImages](v5, "numberOfImages"))
    v6 = (SUUIAppearance *)v5;
  else
    v6 = self;
  -[SUUIAppearance styleBarButtonItem:](v6, "styleBarButtonItem:", a3);
}

- (void)styleDestructiveButton:(id)a3
{
  -[SUControlAppearance styleBarButtonItem:](-[SUUIAppearance destructiveButtonAppearance](self, "destructiveButtonAppearance"), "styleBarButtonItem:", a3);
}

- (void)styleExitStoreButtonItem:(id)a3
{
  void *exitStoreButtonAppearance;

  if (-[SUControlAppearance numberOfImages](self->_exitStoreButtonAppearance, "numberOfImages"))
    exitStoreButtonAppearance = self->_exitStoreButtonAppearance;
  else
    exitStoreButtonAppearance = self;
  objc_msgSend(exitStoreButtonAppearance, "styleBarButtonItem:", a3);
}

- (void)styleForwardButtonItem:(id)a3
{
  void *forwardButtonAppearance;

  if (-[SUControlAppearance numberOfImages](self->_forwardButtonAppearance, "numberOfImages"))
    forwardButtonAppearance = self->_forwardButtonAppearance;
  else
    forwardButtonAppearance = self;
  objc_msgSend(forwardButtonAppearance, "styleBarButtonItem:", a3);
}

- (void)styleNavigationBar:(id)a3
{
  uint64_t v5;
  NSMutableDictionary *navigationBarBackgroundImages;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v5 = MEMORY[0x24BDAC760];
  navigationBarBackgroundImages = self->_navigationBarBackgroundImages;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__SUUIAppearance_styleNavigationBar___block_invoke;
  v9[3] = &unk_24DE7E168;
  v9[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](navigationBarBackgroundImages, "enumerateKeysAndObjectsUsingBlock:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __37__SUUIAppearance_styleNavigationBar___block_invoke_2;
  v8[3] = &unk_24DE7E190;
  v8[4] = a3;
  -[SUControlAppearance enumerateImagesUsingBlock:](-[SUUIAppearance backButtonAppearance](self, "backButtonAppearance"), "enumerateImagesUsingBlock:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __37__SUUIAppearance_styleNavigationBar___block_invoke_3;
  v7[3] = &unk_24DE7E1B8;
  v7[4] = a3;
  objc_msgSend(-[SUUIAppearance navigationButtonAppearanceForStyle:](self, "navigationButtonAppearanceForStyle:", 0), "enumerateTextAttributesUsingBlock:", v7);
  objc_msgSend(a3, "setTitleTextAttributes:", -[SUUIAppearance navigationBarTitleTextAttributes](self, "navigationBarTitleTextAttributes"));
}

uint64_t __37__SUUIAppearance_styleNavigationBar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundImage:forBarMetrics:", a3, objc_msgSend(a2, "integerValue"));
}

uint64_t __37__SUUIAppearance_styleNavigationBar___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBackButtonBackgroundImage:mini:forStates:", a3, a4, a2);
}

uint64_t __37__SUUIAppearance_styleNavigationBar___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  uint64_t result;
  void *v8;

  v6 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF6640]);
  result = objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF6600]);
  if (a2 == 1)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_setPressedButtonItemTextColor:shadowColor:", result, objc_msgSend(v6, "shadowColor"));
    if (v6)
    {
LABEL_5:
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v6, "shadowOffset");
      return objc_msgSend(v8, "_setButtonTextShadowOffset:");
    }
  }
  else
  {
    if (!a2)
      result = objc_msgSend(*(id *)(a1 + 32), "_setButtonItemTextColor:shadowColor:", result, objc_msgSend(v6, "shadowColor"));
    if (v6)
      goto LABEL_5;
  }
  return result;
}

- (void)styleSegmentedControl:(id)a3 tintStyle:(int64_t)a4
{
  objc_msgSend(-[SUUIAppearance segmentedControlAppearanceForStyle:tintStyle:](self, "segmentedControlAppearanceForStyle:tintStyle:", objc_msgSend(a3, "segmentControlStyle"), a4), "styleSegmentedControl:", a3);
}

- (void)styleTabBar:(id)a3
{
  SUTabBarAppearance *v4;
  SUTabBarAppearance *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;

  v4 = -[SUUIAppearance tabBarAppearance](self, "tabBarAppearance");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(a3, "setBackgroundImage:", -[SUTabBarAppearance backgroundImage](v4, "backgroundImage"));
    objc_msgSend(a3, "_setSelectionIndicatorImage:", -[SUTabBarAppearance selectionIndicatorImage](v5, "selectionIndicatorImage"));
    -[SUTabBarAppearance tabBarButtonWidth](v5, "tabBarButtonWidth");
    v7 = v6;
    if (v6 > 0.00000011920929)
    {
      objc_msgSend(a3, "setItemPositioning:", 2);
      -[SUTabBarAppearance tabBarButtonSpacing](v5, "tabBarButtonSpacing");
      objc_msgSend(a3, "setItemSpacing:");
      objc_msgSend(a3, "setItemWidth:", v7);
    }
    v8 = -[SUTabBarAppearance dividerImage](v5, "dividerImage");
    v9 = -[SUTabBarAppearance selectedDividerImage](v5, "selectedDividerImage");
    objc_msgSend(a3, "_setDividerImage:forLeftButtonState:rightButtonState:", v8, 0, 0);
    objc_msgSend(a3, "_setDividerImage:forLeftButtonState:rightButtonState:", v9, 1, 0);
  }
}

- (void)styleTabBarItem:(id)a3
{
  SUTabBarAppearance *v4;
  _QWORD v5[5];

  v4 = -[SUUIAppearance tabBarAppearance](self, "tabBarAppearance");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SUUIAppearance_styleTabBarItem___block_invoke;
  v5[3] = &unk_24DE7E1B8;
  v5[4] = a3;
  -[SUTabBarAppearance enumerateTitleTextAttributesUsingBlock:](v4, "enumerateTitleTextAttributesUsingBlock:", v5);
}

uint64_t __34__SUUIAppearance_styleTabBarItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitleTextAttributes:forState:", a3, a2);
}

- (void)styleToolbar:(id)a3
{
  -[SUToolbarAppearance styleToolbar:](-[SUUIAppearance toolbarAppearance](self, "toolbarAppearance"), "styleToolbar:", a3);
}

- (SUToolbarAppearance)toolbarAppearance
{
  SUToolbarAppearance *toolbarAppearance;

  toolbarAppearance = self->_toolbarAppearance;
  if (!toolbarAppearance)
  {
    if (self->_isDefaultAppearance)
    {
      toolbarAppearance = (SUToolbarAppearance *)+[SUToolbarAppearance defaultToolbarAppearance](SUToolbarAppearance, "defaultToolbarAppearance");
      self->_toolbarAppearance = toolbarAppearance;
    }
    else
    {
      toolbarAppearance = 0;
    }
  }
  return (SUToolbarAppearance *)(id)-[SUToolbarAppearance copy](toolbarAppearance, "copy");
}

+ (id)_defaultShadowWithColor:(id)a3 offset:(CGSize)a4
{
  double height;
  double width;
  id v7;

  height = a4.height;
  width = a4.width;
  v7 = objc_alloc_init(MEMORY[0x24BDF6758]);
  objc_msgSend(v7, "setShadowBlurRadius:", 0.0);
  objc_msgSend(v7, "setShadowColor:", a3);
  objc_msgSend(v7, "setShadowOffset:", width, height);
  return v7;
}

- (void)_styleBackBarButtonItem:(id)a3
{
  SUUIAppearance *v4;

  v4 = self;
  if (-[SUControlAppearance numberOfImages](-[SUUIAppearance backButtonAppearance](self, "backButtonAppearance"), "numberOfImages"))
  {
    v4 = -[SUUIAppearance backButtonAppearance](v4, "backButtonAppearance");
  }
  -[SUUIAppearance styleBarButtonItem:](v4, "styleBarButtonItem:", a3);
}

+ (id)_defaultBackButtonAppearance
{
  SUControlAppearance *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_alloc_init(SUControlAppearance);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 0, 4.0, 0.0);
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 1, 2.0, 0.0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDefaultBack"), v4), "resizableImageWithCapInsets:", 0.0, 14.0, 0.0, 6.0), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDefaultBack"), v4), "resizableImageWithCapInsets:", 0.0, 10.0, 0.0, 4.0), 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDefaultBackPressed"), v4), "resizableImageWithCapInsets:", 0.0, 14.0, 0.0, 6.0), 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDefaultBackPressed"), v4), "resizableImageWithCapInsets:", 0.0, 10.0, 0.0, 4.0), 1, 1);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.784313725, 1.0);
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);
  v7 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0.0, -1.0);
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BDF6640]);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 0);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 1);

  return v3;
}

+ (id)_defaultButtonAppearance
{
  SUControlAppearance *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = objc_alloc_init(SUControlAppearance);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDefaultButton"), v4), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDefaultButton"), v4), 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDefaultButtonPressed"), v4), 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDefaultButtonPressed"), v4), 1, 1);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.784313725, 1.0);
  v7 = *MEMORY[0x24BDF6600];
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);
  v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0.0, -1.0);
  v9 = *MEMORY[0x24BDF6640];
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BDF6640]);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 0);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 1);

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.490196078, 1.0), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0.0, -1.0), v9);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v10, 2);

  return v3;
}

+ (id)_defaultConfirmationButtonAppearance
{
  SUControlAppearance *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_alloc_init(SUControlAppearance);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarGreenBuyButton"), v4), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarGreenBuyButtonPressed"), v4), 1, 0);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);
  v7 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5), 0.0, -1.0);
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BDF6640]);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 0);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 1);

  return v3;
}

+ (id)_defaultDestructiveButtonAppearance
{
  SUControlAppearance *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = objc_alloc_init(SUControlAppearance);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDestroyButton"), v4), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDestroyButton"), v4), 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDestroyButtonPressed"), v4), 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDestroyButtonPressed"), v4), 1, 1);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v7 = *MEMORY[0x24BDF6600];
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);
  v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5), 0.0, 1.0);
  v9 = *MEMORY[0x24BDF6640];
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BDF6640]);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 0);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 1);

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.784313725, 1.0), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5), 0.0, 1.0), v9);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v10, 2);

  return v3;
}

+ (id)_defaultDoneButtonAppearance
{
  SUControlAppearance *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = objc_alloc_init(SUControlAppearance);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDoneButton"), v4), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDoneButton"), v4), 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDoneButtonPressed"), v4), 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDoneButtonPressed"), v4), 1, 1);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.278431373, 1.0);
  v7 = *MEMORY[0x24BDF6600];
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);
  v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5), 0.0, 1.0);
  v9 = *MEMORY[0x24BDF6640];
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BDF6640]);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 0);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 1);

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.447058824, 1.0), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5), 0.0, 1.0), v9);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v10, 2);

  return v3;
}

+ (id)_defaultForwardButtonAppearance
{
  SUControlAppearance *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_alloc_init(SUControlAppearance);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 0, -4.0, 0.0);
  -[SUControlAppearance setTitlePositionAdjustment:forBarMetrics:](v3, "setTitlePositionAdjustment:forBarMetrics:", 1, -2.0, 0.0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDefaultForward"), v4), "resizableImageWithCapInsets:", 0.0, 6.0, 0.0, 14.0), 0, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDefaultForward"), v4), "resizableImageWithCapInsets:", 0.0, 4.0, 0.0, 10.0), 0, 1);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarDefaultForwardPressed"), v4), "resizableImageWithCapInsets:", 0.0, 6.0, 0.0, 14.0), 1, 0);
  -[SUControlAppearance setImage:forState:barMetrics:](v3, "setImage:forState:barMetrics:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UINavigationBarMiniDefaultForwardPressed"), v4), "resizableImageWithCapInsets:", 0.0, 4.0, 0.0, 10.0), 1, 1);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.784313725, 1.0);
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);
  v7 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0.0, -1.0);
  objc_msgSend(v5, "setObject:forKey:", v7, *MEMORY[0x24BDF6640]);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 0);
  -[SUControlAppearance setTextAttributes:forState:](v3, "setTextAttributes:forState:", v5, 1);

  return v3;
}

+ (id)_defaultTabBarAppearance
{
  SUTabBarAppearance *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = objc_alloc_init(SUTabBarAppearance);
  v4 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUTabBarAppearance setBackgroundImage:](v3, "setBackgroundImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UITabBarBG"), v4));
  -[SUTabBarAppearance setDividerImage:](v3, "setDividerImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UITabBarSeparator"), v4));
  -[SUTabBarAppearance setSelectedDividerImage:](v3, "setSelectedDividerImage:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UITabBarSeparatorActive"), v4));
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    -[SUTabBarAppearance setTabBarButtonSpacing:](v3, "setTabBarButtonSpacing:", 0.0);
    -[SUTabBarAppearance setTabBarButtonWidth:](v3, "setTabBarButtonWidth:", 100.0);
  }
  -[SUTabBarAppearance setSelectionIndicatorImage:](v3, "setSelectionIndicatorImage:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UITabBarActiveSegment"), v4), "resizableImageWithCapInsets:", 0.0, 4.0, 0.0, 4.0));
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.784313725, 1.0);
  v7 = *MEMORY[0x24BDF6600];
  objc_msgSend(v5, "setObject:forKey:", v6, *MEMORY[0x24BDF6600]);
  v8 = objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0.0, -1.0);
  v9 = *MEMORY[0x24BDF6640];
  objc_msgSend(v5, "setObject:forKey:", v8, *MEMORY[0x24BDF6640]);
  -[SUTabBarAppearance setTitleTextAttributes:forState:](v3, "setTitleTextAttributes:forState:", v5, 0);

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), v7);
  objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a1, "_defaultShadowWithColor:offset:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.9), 0.0, 1.0), v9);
  -[SUTabBarAppearance setTitleTextAttributes:forState:](v3, "setTitleTextAttributes:forState:", v10, 4);

  return v3;
}

- (id)_copySegmentedControlKeyWithStyle:(int64_t)a3 tintStyle:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld:%ld"), a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[SUControlAppearance copyWithZone:](self->_backButtonAppearance, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[SUControlAppearance copyWithZone:](self->_confirmationButtonAppearance, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[SUControlAppearance copyWithZone:](self->_exitStoreButtonAppearance, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[SUControlAppearance copyWithZone:](self->_forwardButtonAppearance, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 48) = self->_isDefaultAppearance;
  *(_QWORD *)(v5 + 56) = -[NSMutableDictionary mutableCopyWithZone:](self->_navigationBarBackgroundImages, "mutableCopyWithZone:", a3);
  *(_QWORD *)(v5 + 64) = -[NSDictionary copyWithZone:](self->_navigationBarTitleTextAttributes, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 72) = -[NSMutableDictionary copyWithZone:](self->_navigationButtonAppearance, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 80) = -[NSMutableDictionary mutableCopyWithZone:](self->_segmentedControlAppearance, "mutableCopyWithZone:", a3);
  *(_QWORD *)(v5 + 88) = -[SUTabBarAppearance copyWithZone:](self->_tabBarAppearance, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = -[SUToolbarAppearance copyWithZone:](self->_toolbarAppearance, "copyWithZone:", a3);
  return (id)v5;
}

- (void)setBackButtonAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setConfirmationButtonAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDestructiveButtonAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setExitStoreButtonAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setForwardButtonAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)navigationBarTitleTextAttributes
{
  return self->_navigationBarTitleTextAttributes;
}

- (void)setNavigationBarTitleTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SUTabBarAppearance)tabBarAppearance
{
  return self->_tabBarAppearance;
}

- (void)setTabBarAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setToolbarAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

@end
