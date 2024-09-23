@implementation UITabBarItem

- (int64_t)_imageStyle
{
  return self->__imageStyle;
}

- (int64_t)_barMetrics
{
  return self->__barMetrics;
}

- (UITabBarAppearance)scrollEdgeAppearance
{
  return self->_scrollEdgeAppearance;
}

- (id)_internalTitleForTabBarDisplayStyle:(int64_t)a3
{
  return self->_title;
}

- (int64_t)systemItem
{
  return ((unint64_t)*(_WORD *)&self->_tabBarItemFlags >> 6) & 0xF;
}

- (id)image
{
  return self->_templateImage;
}

- (BOOL)isSystemItem
{
  return (*(_WORD *)&self->_tabBarItemFlags >> 5) & 1;
}

- (id)unselectedImage
{
  UIImage *unselectedImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  unselectedImage = self->_unselectedImage;
  if (!unselectedImage)
  {
    -[UITabBarItem _internalTemplateImages](self, "_internalTemplateImages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();

    v6 = self->_unselectedImage;
    self->_unselectedImage = v5;

    unselectedImage = self->_unselectedImage;
  }
  return unselectedImage;
}

- (UIImage)selectedImage
{
  UIImage *selectedImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  selectedImage = self->_selectedImage;
  if (!selectedImage)
  {
    -[UITabBarItem _internalTemplateImages](self, "_internalTemplateImages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_selectedImage;
    self->_selectedImage = v5;

    selectedImage = self->_selectedImage;
  }
  return selectedImage;
}

- (id)_internalTemplateImages
{
  return -[UITabBarItem _internalTemplateImagesForTabBarDisplayStyle:](self, "_internalTemplateImagesForTabBarDisplayStyle:", 0);
}

- (id)_internalTemplateImagesForTabBarDisplayStyle:(int64_t)a3
{
  UIImage *v4;
  void *v5;

  v4 = self->_templateImage;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, self->_selectedTemplateImage, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)title
{
  return self->_title;
}

- (BOOL)isEnabled
{
  return *(_WORD *)&self->_tabBarItemFlags & 1;
}

- (id)_internalLandscapeTemplateImage
{
  void *v2;
  void *v3;

  -[UITabBarItem _internalLandscapeTemplateImages](self, "_internalLandscapeTemplateImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIImage)_internalLandscapeSelectedImagePhone
{
  UIImage *landscapeSelectedImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  landscapeSelectedImage = self->_landscapeSelectedImage;
  if (!landscapeSelectedImage)
  {
    -[UITabBarItem _internalLandscapeTemplateImages](self, "_internalLandscapeTemplateImages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_landscapeSelectedImage;
    self->_landscapeSelectedImage = v5;

    landscapeSelectedImage = self->_landscapeSelectedImage;
  }
  return landscapeSelectedImage;
}

- (id)_internalLandscapeTemplateImages
{
  UIImage *v3;
  void *v4;

  v3 = self->_landscapeTemplateImage;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v3, self->_landscapeSelectedTemplateImage, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isSpringLoaded
{
  return (*(_WORD *)&self->_tabBarItemFlags >> 1) & 1;
}

- (UIOffset)badgeOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_badgeOffset.horizontal;
  vertical = self->_badgeOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (id)_internalTitle
{
  return -[UITabBarItem _internalTitleForTabBarDisplayStyle:](self, "_internalTitleForTabBarDisplayStyle:", 0);
}

- (NSString)badgeValue
{
  return self->_badgeValue;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _QWORD v11[5];

  v4 = badgeValue;
  v5 = self->_badgeValue;
  v10 = v4;
  v6 = v5;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqual:](v10, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy", v10);
    v9 = self->_badgeValue;
    self->_badgeValue = v8;

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __30__UITabBarItem_setBadgeValue___block_invoke;
    v11[3] = &unk_1E16B1B28;
    v11[4] = self;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v11);
  }
LABEL_9:

}

- (UITabBarItem)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
  NSString *v8;
  UIImage *v9;
  UIImage *v10;
  UITabBarItem *v11;
  UITabBarItem *v12;

  v8 = title;
  v9 = image;
  v10 = selectedImage;
  v11 = -[UITabBarItem init](self, "init");
  v12 = v11;
  if (v11)
  {
    -[UITabBarItem setTitle:](v11, "setTitle:", v8);
    -[UITabBarItem setImage:](v12, "setImage:", v9);
    -[UITabBarItem setSelectedImage:](v12, "setSelectedImage:", v10);
  }

  return v12;
}

- (UITabBarItem)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag
{
  NSString *v8;
  UIImage *v9;
  UITabBarItem *v10;
  UITabBarItem *v11;

  v8 = title;
  v9 = image;
  v10 = -[UITabBarItem init](self, "init");
  v11 = v10;
  if (v10)
  {
    -[UITabBarItem setTitle:](v10, "setTitle:", v8);
    -[UITabBarItem setImage:](v11, "setImage:", v9);
    -[UIBarItem setTag:](v11, "setTag:", tag);
  }

  return v11;
}

- (void)_setInternalTemplateImage:(id)a3
{
  UIImage *v5;
  __int16 tabBarItemFlags;
  UIImage *selectedImage;
  UIImage *unselectedImage;
  UIImage *v9;

  v5 = (UIImage *)a3;
  if (self->_templateImage != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_templateImage, a3);
    tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    if ((tabBarItemFlags & 0x800) == 0)
    {
      selectedImage = self->_selectedImage;
      self->_selectedImage = 0;

      tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    }
    if ((tabBarItemFlags & 0x1000) == 0)
    {
      unselectedImage = self->_unselectedImage;
      self->_unselectedImage = 0;

    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    v5 = v9;
  }

}

- (void)_setInternalTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *title;
  NSString *v10;

  v4 = a3;
  v5 = self->_title;
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
    title = self->_title;
    self->_title = v8;

    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
LABEL_9:

}

- (void)_itemViewNeedsUpdate:(uint64_t)a1
{
  void (**v3)(void);
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void (**aBlock)(void);

  v3 = a2;
  if (a1)
  {
    aBlock = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 280));
    v5 = _Block_copy(aBlock);
    v6 = *(void **)(a1 + 256);
    *(_QWORD *)(a1 + 256) = v5;

    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_tabDataProviderContentDidChange:", a1);
    }
    else if (aBlock)
    {
      aBlock[2]();
    }
    else
    {
      objc_msgSend((id)a1, "_updateView");
    }
    v7 = *(void **)(a1 + 256);
    *(_QWORD *)(a1 + 256) = 0;

    v3 = aBlock;
  }

}

- (void)_updateView
{
  void (**alternateUpdateHandler)(id);

  alternateUpdateHandler = (void (**)(id))self->_alternateUpdateHandler;
  if (alternateUpdateHandler)
    alternateUpdateHandler[2](self->_alternateUpdateHandler);
  else
    -[UITabBarItem _updateViewAndPositionItems:](self, "_updateViewAndPositionItems:", 1);
}

- (void)_updateViewAndPositionItems:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  UITabBarItem *v8;
  id v9;

  v3 = a3;
  -[UITabBarButton tabBar](self->_view, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    -[UIView alpha](self->_view, "alpha");
    v7 = v6;
    objc_msgSend(v9, "_updateTabBarItemView:", self);
    if (v3)
      objc_msgSend(v9, "_positionAllItems");
    -[UIView setAlpha:](self->_view, "setAlpha:", v7);
    objc_msgSend(v9, "selectedItem");
    v8 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UITabBarButton _showSelectedIndicator:changeSelection:](self->_view, "_showSelectedIndicator:changeSelection:", 1, 1);
    -[UITabBarItem _updateViewBadge](self, "_updateViewBadge");
    v5 = v9;
  }

}

- (UITabBarItem)init
{
  UITabBarItem *v2;
  UITabBarItem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITabBarItem;
  v2 = -[UIBarItem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UITabBarItem setEnabled:](v2, "setEnabled:", 1);
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v3[5];

  *(_WORD *)&self->_tabBarItemFlags = *(_WORD *)&self->_tabBarItemFlags & 0xFFFE | a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__UITabBarItem_setEnabled___block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v3);
}

- (void)_updateViewBadge
{
  if (self->_badgeValue)
    -[UITabBarButton _setBadgeValue:](self->_view, "_setBadgeValue:");
}

- (void)_setImageStyle:(int64_t)a3
{
  self->__imageStyle = a3;
}

- (void)_setBarMetrics:(int64_t)a3
{
  self->__barMetrics = a3;
}

- (void)setView:(id)a3
{
  -[UITabBarItem _setTabBarButton:]((uint64_t)self, a3);
}

uint64_t __30__UITabBarItem_setBadgeValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "_setBadgeValue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

uint64_t __32__UITabBarItem_setSpringLoaded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setSpringLoaded:", *(unsigned __int8 *)(a1 + 40));
}

- (UITabBarAppearance)standardAppearance
{
  return self->_standardAppearance;
}

- (BOOL)_usesModernAppearance
{
  return self->__usesModernAppearance;
}

- (void)setSpringLoaded:(BOOL)a3
{
  __int16 tabBarItemFlags;
  __int16 v4;
  _QWORD v5[5];
  BOOL v6;

  tabBarItemFlags = (__int16)self->_tabBarItemFlags;
  if (((((tabBarItemFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *(_WORD *)&self->_tabBarItemFlags = tabBarItemFlags & 0xFFFD | v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__UITabBarItem_setSpringLoaded___block_invoke;
    v5[3] = &unk_1E16B1B78;
    v5[4] = self;
    v6 = a3;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v5);
  }
}

- (void)setStandardAppearance:(UITabBarAppearance *)standardAppearance
{
  UITabBarAppearance *v4;
  UITabBarAppearance *v5;
  UITabBarAppearance *v6;
  BOOL v7;
  UITabBarAppearance *v8;
  UITabBarAppearance *v9;
  UITabBarAppearance *v10;
  UITabBarAppearance *v11;
  UITabBarAppearance *v12;

  v4 = standardAppearance;
  v5 = self->_standardAppearance;
  v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_12;
    }
    else
    {

    }
    v8 = self->_standardAppearance;
    if (v8)
      objc_storeWeak((id *)&v8->super._changeObserver, 0);
    v9 = -[UIBarAppearance copy](v12, "copy");
    v10 = self->_standardAppearance;
    self->_standardAppearance = v9;

    -[UITabBarItem _itemBarAppearanceNeedsUpdate:]((id *)&self->super.super.isa, self->_standardAppearance);
    v11 = self->_standardAppearance;
    if (v11)
      objc_storeWeak((id *)&v11->super._changeObserver, self);
  }
LABEL_12:

}

- (void)setScrollEdgeAppearance:(UITabBarAppearance *)scrollEdgeAppearance
{
  UITabBarAppearance *v4;
  UITabBarAppearance *v5;
  UITabBarAppearance *v6;
  BOOL v7;
  UITabBarAppearance *v8;
  UITabBarAppearance *v9;
  UITabBarAppearance *v10;
  UITabBarAppearance *v11;
  UITabBarAppearance *v12;

  v4 = scrollEdgeAppearance;
  v5 = self->_scrollEdgeAppearance;
  v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[UIBarAppearance isEqual:](v5, "isEqual:", v6);

      if (v7)
        goto LABEL_12;
    }
    else
    {

    }
    v8 = self->_scrollEdgeAppearance;
    if (v8)
      objc_storeWeak((id *)&v8->super._changeObserver, 0);
    v9 = -[UIBarAppearance copy](v12, "copy");
    v10 = self->_scrollEdgeAppearance;
    self->_scrollEdgeAppearance = v9;

    -[UITabBarItem _itemBarAppearanceNeedsUpdate:]((id *)&self->super.super.isa, self->_scrollEdgeAppearance);
    v11 = self->_scrollEdgeAppearance;
    if (v11)
      objc_storeWeak((id *)&v11->super._changeObserver, self);
  }
LABEL_12:

}

- (void)setSelectedImage:(UIImage *)selectedImage
{
  UIImage *v4;
  UIImage *selectedTemplateImage;
  UIImage *v6;

  if (self->_selectedTemplateImage != selectedImage)
  {
    -[UIImage _imageThatSuppressesAccessibilityHairlineThickening](selectedImage, "_imageThatSuppressesAccessibilityHairlineThickening");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    selectedTemplateImage = self->_selectedTemplateImage;
    self->_selectedTemplateImage = v4;

    if ((*(_WORD *)&self->_tabBarItemFlags & 0x800) == 0)
    {
      v6 = self->_selectedImage;
      self->_selectedImage = 0;

    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fallbackSourceItem, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong((id *)&self->_standardAppearance, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
  objc_storeStrong((id *)&self->_scrollEdgeAppearance, 0);
  objc_storeStrong(&self->_alternateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_badgeValue, 0);
  objc_storeStrong((id *)&self->_landscapeSelectedImage, 0);
  objc_storeStrong((id *)&self->_landscapeSelectedTemplateImage, 0);
  objc_storeStrong((id *)&self->_landscapeTemplateImage, 0);
  objc_storeStrong((id *)&self->_unselectedImage, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_selectedTemplateImage, 0);
  objc_storeStrong((id *)&self->_templateImage, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_title, 0);
}

- (UITabBarItem)initWithTabBarSystemItem:(UITabBarSystemItem)systemItem tag:(NSInteger)tag
{
  char v5;
  UITabBarItem *v6;
  uint64_t v7;

  v5 = systemItem;
  v6 = -[UITabBarItem init](self, "init");
  v7 = (uint64_t)v6;
  if (v6)
  {
    -[UIBarItem setTag:](v6, "setTag:", tag);
    *(_WORD *)(v7 + 248) = ((v5 & 0xF) << 6) | *(_WORD *)(v7 + 248) & 0xFC3F | 0x20;
    -[UITabBarItem _resolveSystemItem](v7);
  }
  return (UITabBarItem *)v7;
}

- (void)appearance:(id)a3 categoriesChanged:(int64_t)a4
{
  id v5;

  -[UITabBarButton tabBar](self->_view, "tabBar", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_useModernAppearance");
  -[UITabBarItem _setUsesModernAppearance:](self, "_setUsesModernAppearance:", 1);
  if (-[UITabBarItem _isSelected](self, "_isSelected"))
    objc_msgSend(v5, "setNeedsLayout");

}

- (NSString)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITabBarItem;
  -[UITabBarItem description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[UITabBarItem isSystemItem](self, "isSystemItem"))
  {
    switch(-[UITabBarItem systemItem](self, "systemItem"))
    {
      case 0:
        v5 = CFSTR(" systemItem=More");
        goto LABEL_20;
      case 1:
        v5 = CFSTR(" systemItem=Favorites");
        goto LABEL_20;
      case 2:
        v5 = CFSTR(" systemItem=Featured");
        goto LABEL_20;
      case 3:
        v5 = CFSTR(" systemItem=TopRated");
        goto LABEL_20;
      case 4:
        v5 = CFSTR(" systemItem=Recents");
        goto LABEL_20;
      case 5:
        v5 = CFSTR(" systemItem=Contacts");
        goto LABEL_20;
      case 6:
        v5 = CFSTR(" systemItem=History");
        goto LABEL_20;
      case 7:
        v5 = CFSTR(" systemItem=Bookmarks");
        goto LABEL_20;
      case 8:
        v5 = CFSTR(" systemItem=Search");
        goto LABEL_20;
      case 9:
        v5 = CFSTR(" systemItem=Downloads");
        goto LABEL_20;
      case 10:
        v5 = CFSTR(" systemItem=MostRecent");
        goto LABEL_20;
      case 11:
        v5 = CFSTR(" systemItem=MostViewed");
LABEL_20:
        objc_msgSend(v4, "appendString:", v5);
        break;
      default:
        break;
    }
  }
  else
  {
    if (self->_title)
      objc_msgSend(v4, "appendFormat:", CFSTR(" title='%@'"), self->_title);
    if (self->_templateImage)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" image=%@"), self->_templateImage);
      if (self->_landscapeTemplateImage)
        objc_msgSend(v4, "appendFormat:", CFSTR(" landscapeImagePhone=%@"), self->_landscapeTemplateImage);
    }
  }
  if (self->_standardAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" standardAppearance=%p"), self->_standardAppearance);
  if (self->_scrollEdgeAppearance)
    objc_msgSend(v4, "appendFormat:", CFSTR(" scrollEdgeAppearance=%p"), self->_scrollEdgeAppearance);
  if (-[UITabBarItem _isSelected](self, "_isSelected"))
    objc_msgSend(v4, "appendString:", CFSTR(" selected"));
  if ((*(_WORD *)&self->_tabBarItemFlags & 1) == 0)
    objc_msgSend(v4, "appendString:", CFSTR(" disabled"));
  return (NSString *)v4;
}

- (BOOL)_isSelected
{
  UITabBarButton *view;
  _BOOL4 v4;
  __int16 v5;

  view = self->_view;
  if (view)
  {
    v4 = -[UITabBarButton _isSelected](view, "_isSelected");
    if (v4)
      v5 = 1024;
    else
      v5 = 0;
    *(_WORD *)&self->_tabBarItemFlags = *(_WORD *)&self->_tabBarItemFlags & 0xFBFF | v5;
  }
  else
  {
    return (*(_WORD *)&self->_tabBarItemFlags >> 10) & 1;
  }
  return v4;
}

- (void)_setUsesModernAppearance:(BOOL)a3
{
  self->__usesModernAppearance = a3;
}

- (void)_setSelected:(BOOL)a3
{
  __int16 v3;
  _QWORD v4[5];

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_tabBarItemFlags = *(_WORD *)&self->_tabBarItemFlags & 0xFBFF | v3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__UITabBarItem__setSelected___block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v4);
}

uint64_t __29__UITabBarItem__setSelected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "_setSelected:", (*(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 248) >> 10) & 1);
}

- (void)setBadgeOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_badgeOffset.horizontal || a3.vertical != self->_badgeOffset.vertical)
  {
    self->_badgeOffset = a3;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (UIOffset)landscapePhoneBadgeOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_badgeOffset.horizontal;
  vertical = self->_badgeOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)_resolveSystemItem
{
  void *v2;
  const __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if ((*(_WORD *)(a1 + 248) & 0x20) != 0)
  {
    switch(objc_msgSend((id)a1, "systemItem"))
    {
      case 0:
        _UINSLocalizedStringWithDefaultValue(CFSTR("More"), CFSTR("More"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("ellipsis");
        break;
      case 1:
        v4 = CFSTR("Favorites");
        goto LABEL_8;
      case 2:
        v4 = CFSTR("Featured");
        goto LABEL_8;
      case 3:
        v4 = CFSTR("Top Rated");
LABEL_8:
        _UINSLocalizedStringWithDefaultValue(v4, v4);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("star.fill");
        break;
      case 4:
        v5 = CFSTR("Recents");
        goto LABEL_16;
      case 5:
        _UINSLocalizedStringWithDefaultValue(CFSTR("Contacts"), CFSTR("Contacts"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("person.crop.circle.fill");
        break;
      case 6:
        v5 = CFSTR("History");
        goto LABEL_16;
      case 7:
        _UINSLocalizedStringWithDefaultValue(CFSTR("Bookmarks"), CFSTR("Bookmarks"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("book.fill");
        break;
      case 8:
        _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("magnifyingglass");
        break;
      case 9:
        _UINSLocalizedStringWithDefaultValue(CFSTR("Downloads"), CFSTR("Downloads"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("square.and.arrow.down.fill");
        break;
      case 10:
        v5 = CFSTR("Most Recent");
LABEL_16:
        _UINSLocalizedStringWithDefaultValue(v5, v5);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("clock.fill");
        break;
      case 11:
        _UINSLocalizedStringWithDefaultValue(CFSTR("Most Viewed"), CFSTR("Most Viewed"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = CFSTR("list.number");
        break;
      default:
        v3 = 0;
        v2 = 0;
        break;
    }
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v2;
    v9 = v2;

    objc_storeStrong((id *)(a1 + 88), v6);
    v10 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    v11 = *(void **)(a1 + 152);
    *(_QWORD *)(a1 + 152) = v7;
    v13 = v7;

    v12 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;

  }
}

- (UITabBarItem)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UITabBarItem *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *badgeValue;
  void *v10;
  uint64_t v11;
  UIImage *templateImage;
  uint64_t v13;
  UIImage *selectedTemplateImage;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  UIImage *landscapeTemplateImage;
  uint64_t v21;
  UIImage *landscapeSelectedTemplateImage;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  objc_super v28;

  v4 = coder;
  v28.receiver = self;
  v28.super_class = (Class)UITabBarItem;
  v5 = -[UIBarItem initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISystemItem")))
    {
      *(_WORD *)&v5->_tabBarItemFlags |= 0x20u;
      *(_WORD *)&v5->_tabBarItemFlags = ((-[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISystemItem")) & 0xF) << 6) | *(_WORD *)&v5->_tabBarItemFlags & 0xFC3F;
    }
    -[UIBarItem setTag:](v5, "setTag:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITag")));
    *(_WORD *)&v5->_tabBarItemFlags = *(_WORD *)&v5->_tabBarItemFlags & 0xFFFE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIEnabled"));
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UITitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBadgeValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    badgeValue = v5->_badgeValue;
    v5->_badgeValue = (NSString *)v8;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBadgeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITabBarItem setBadgeColor:](v5, "setBadgeColor:", v10);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIImage"));
    v11 = objc_claimAutoreleasedReturnValue();
    templateImage = v5->_templateImage;
    v5->_templateImage = (UIImage *)v11;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISelectedTemplateImage"));
    v13 = objc_claimAutoreleasedReturnValue();
    selectedTemplateImage = v5->_selectedTemplateImage;
    v5->_selectedTemplateImage = (UIImage *)v13;

    -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIImageInsets"));
    v5->_imageInsets.top = v15;
    v5->_imageInsets.left = v16;
    v5->_imageInsets.bottom = v17;
    v5->_imageInsets.right = v18;
    if (dyld_program_sdk_at_least())
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIImageLandscape"));
      v19 = objc_claimAutoreleasedReturnValue();
      landscapeTemplateImage = v5->_landscapeTemplateImage;
      v5->_landscapeTemplateImage = (UIImage *)v19;

      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISelectedTemplateImageLandscape"));
      v21 = objc_claimAutoreleasedReturnValue();
      landscapeSelectedTemplateImage = v5->_landscapeSelectedTemplateImage;
      v5->_landscapeSelectedTemplateImage = (UIImage *)v21;

      -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("UIImageInsetsLandscape"));
      v5->_landscapeImageInsets.top = v23;
      v5->_landscapeImageInsets.left = v24;
      v5->_landscapeImageInsets.bottom = v25;
      v5->_landscapeImageInsets.right = v26;
    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITitlePositionAdjustment")))
    {
      -[NSCoder decodeUIOffsetForKey:](v4, "decodeUIOffsetForKey:", CFSTR("UITitlePositionAdjustment"));
      -[UITabBarItem setTitlePositionAdjustment:](v5, "setTitlePositionAdjustment:");
    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISpringLoaded")))
      -[UITabBarItem setSpringLoaded:](v5, "setSpringLoaded:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISpringLoaded")));
    -[UITabBarItem _resolveSystemItem]((uint64_t)v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t tabBarItemFlags;
  __int16 v6;
  NSString *title;
  NSString *badgeValue;
  void *v9;
  void *v10;
  UIImage *templateImage;
  UIImage *selectedTemplateImage;
  UIImage *landscapeTemplateImage;
  UIImage *landscapeSelectedTemplateImage;
  double v15;
  double v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITabBarItem;
  -[UIBarItem encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  tabBarItemFlags = (unint64_t)self->_tabBarItemFlags;
  LOBYTE(v6) = self->_tabBarItemFlags;
  if ((tabBarItemFlags & 0x20) != 0)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", (tabBarItemFlags >> 6) & 0xF, CFSTR("UISystemItem"));
    v6 = (__int16)self->_tabBarItemFlags;
  }
  if ((v6 & 1) != 0)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UIEnabled"));
  if (-[UIBarItem tag](self, "tag"))
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIBarItem tag](self, "tag"), CFSTR("UITag"));
  if ((tabBarItemFlags & 0x20) == 0)
  {
    title = self->_title;
    if (title)
      objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("UITitle"));
  }
  badgeValue = self->_badgeValue;
  if (badgeValue)
    objc_msgSend(v4, "encodeObject:forKey:", badgeValue, CFSTR("UIBadgeValue"));
  -[UITabBarItem badgeColor](self, "badgeColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UITabBarItem badgeColor](self, "badgeColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UIBadgeColor"));

  }
  if ((tabBarItemFlags & 0x20) == 0)
  {
    templateImage = self->_templateImage;
    if (templateImage)
      objc_msgSend(v4, "encodeObject:forKey:", templateImage, CFSTR("UIImage"));
    selectedTemplateImage = self->_selectedTemplateImage;
    if (selectedTemplateImage)
      objc_msgSend(v4, "encodeObject:forKey:", selectedTemplateImage, CFSTR("UISelectedTemplateImage"));
  }
  if (self->_imageInsets.top != 0.0
    || self->_imageInsets.bottom != 0.0
    || self->_imageInsets.left != 0.0
    || self->_imageInsets.right != 0.0)
  {
    objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIImageInsets"));
  }
  if (dyld_program_sdk_at_least())
  {
    if ((tabBarItemFlags & 0x20) == 0)
    {
      landscapeTemplateImage = self->_landscapeTemplateImage;
      if (landscapeTemplateImage)
        objc_msgSend(v4, "encodeObject:forKey:", landscapeTemplateImage, CFSTR("UIImageLandscape"));
      landscapeSelectedTemplateImage = self->_landscapeSelectedTemplateImage;
      if (landscapeSelectedTemplateImage)
        objc_msgSend(v4, "encodeObject:forKey:", landscapeSelectedTemplateImage, CFSTR("UISelectedTemplateImageLandscape"));
    }
    if (self->_landscapeImageInsets.top != 0.0
      || self->_landscapeImageInsets.bottom != 0.0
      || self->_landscapeImageInsets.left != 0.0
      || self->_landscapeImageInsets.right != 0.0)
    {
      objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UIImageInsetsLandscape"));
    }
  }
  -[UITabBarItem titlePositionAdjustment](self, "titlePositionAdjustment");
  if (v16 != 0.0 || v15 != 0.0)
    objc_msgSend(v4, "encodeUIOffset:forKey:", CFSTR("UITitlePositionAdjustment"));
  if (-[UITabBarItem isSpringLoaded](self, "isSpringLoaded"))
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("UISpringLoaded"));

}

- (void)_itemBarAppearanceNeedsUpdate:(id *)a1
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 35);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "_tab:appearanceNeedsUpdate:", a1, v4);
    else
      objc_msgSend(a1, "appearance:categoriesChanged:", v4, -1);

  }
}

uint64_t __27__UITabBarItem_setEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "setEnabled:", *(_WORD *)(*(_QWORD *)(a1 + 32) + 248) & 1);
}

- (void)setLandscapeImagePhone:(id)a3
{
  id v4;

  v4 = a3;
  if (dyld_program_sdk_at_least())
    -[UITabBarItem _setInternalLandscapeTemplateImage:](self, "_setInternalLandscapeTemplateImage:", v4);

}

- (id)landscapeImagePhone
{
  return self->_landscapeTemplateImage;
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_imageInsets.left
    || a3.top != self->_imageInsets.top
    || a3.right != self->_imageInsets.right
    || a3.bottom != self->_imageInsets.bottom)
  {
    self->_imageInsets = a3;
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (UIEdgeInsets)imageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageInsets.top;
  left = self->_imageInsets.left;
  bottom = self->_imageInsets.bottom;
  right = self->_imageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLandscapeImagePhoneInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (dyld_program_sdk_at_least())
  {
    if (left != self->_landscapeImageInsets.left
      || top != self->_landscapeImageInsets.top
      || right != self->_landscapeImageInsets.right
      || bottom != self->_landscapeImageInsets.bottom)
    {
      self->_landscapeImageInsets.top = top;
      self->_landscapeImageInsets.left = left;
      self->_landscapeImageInsets.bottom = bottom;
      self->_landscapeImageInsets.right = right;
      -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    }
  }
}

- (UIEdgeInsets)landscapeImagePhoneInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_landscapeImageInsets.top;
  left = self->_landscapeImageInsets.left;
  bottom = self->_landscapeImageInsets.bottom;
  right = self->_landscapeImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)largeContentSizeImage
{
  void *v2;
  objc_super v4;

  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) != 0)
  {
    v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UITabBarItem;
    -[UIBarItem largeContentSizeImage](&v4, sel_largeContentSizeImage);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLargeContentSizeImage:(id)a3
{
  objc_super v3;

  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UITabBarItem;
    -[UIBarItem setLargeContentSizeImage:](&v3, sel_setLargeContentSizeImage_, a3);
  }
}

- (UIEdgeInsets)largeContentSizeImageInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)UITabBarItem;
    -[UIBarItem largeContentSizeImageInsets](&v6, sel_largeContentSizeImageInsets, 0.0, 0.0, 0.0, 0.0);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  if ((*(_WORD *)&self->_tabBarItemFlags & 0x20) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)UITabBarItem;
    -[UIBarItem setLargeContentSizeImageInsets:](&v3, sel_setLargeContentSizeImageInsets_, a3.top, a3.left, a3.bottom, a3.right);
  }
}

- (UIImage)landscapeSelectedImagePhone
{
  UIImage *landscapeSelectedImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  landscapeSelectedImage = self->_landscapeSelectedImage;
  if (!landscapeSelectedImage)
  {
    -[UITabBarItem _internalLandscapeTemplateImages](self, "_internalLandscapeTemplateImages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_landscapeSelectedImage;
    self->_landscapeSelectedImage = v5;

    landscapeSelectedImage = self->_landscapeSelectedImage;
  }
  return landscapeSelectedImage;
}

- (void)setLandscapeSelectedImagePhone:(id)a3
{
  UIImage *v4;
  UIImage *landscapeSelectedTemplateImage;
  UIImage *landscapeSelectedImage;

  if (self->_landscapeSelectedTemplateImage != a3)
  {
    objc_msgSend(a3, "_imageThatSuppressesAccessibilityHairlineThickening");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    landscapeSelectedTemplateImage = self->_landscapeSelectedTemplateImage;
    self->_landscapeSelectedTemplateImage = v4;

    if ((*(_WORD *)&self->_tabBarItemFlags & 0x800) == 0)
    {
      landscapeSelectedImage = self->_landscapeSelectedImage;
      self->_landscapeSelectedImage = 0;

    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (void)setFinishedSelectedImage:(UIImage *)selectedImage withFinishedUnselectedImage:(UIImage *)unselectedImage
{
  UIImage *v7;
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  UIImage *v11;

  v11 = selectedImage;
  v7 = unselectedImage;
  v8 = v7;
  if (v7)
  {
    -[UIImage _setRenderingMode:](v7, "_setRenderingMode:", 1);
    *(_WORD *)&self->_tabBarItemFlags |= 0x1000u;
  }
  v9 = self->_unselectedImage;
  if (v9 != v8)
    objc_storeStrong((id *)&self->_unselectedImage, unselectedImage);
  v10 = v11;
  if (v11)
  {
    -[UIImage _setRenderingMode:](v11, "_setRenderingMode:", 1);
    v10 = v11;
    *(_WORD *)&self->_tabBarItemFlags |= 0x800u;
  }
  if (self->_selectedImage != v10)
  {
    objc_storeStrong((id *)&self->_selectedImage, selectedImage);
LABEL_10:
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    goto LABEL_11;
  }
  if (v9 != v8)
    goto LABEL_10;
LABEL_11:

}

- (UIImage)finishedSelectedImage
{
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x800) != 0)
    return self->_selectedImage;
  else
    return (UIImage *)0;
}

- (UIImage)finishedUnselectedImage
{
  if ((*(_WORD *)&self->_tabBarItemFlags & 0x1000) != 0)
    return self->_unselectedImage;
  else
    return (UIImage *)0;
}

- (BOOL)hasTitle
{
  void *v2;
  BOOL v3;

  -[UITabBarItem resolvedTitle](self, "resolvedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_resolvedSourceItem
{
  id *v1;
  void *v2;
  int *v3;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[29], "_window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = &OBJC_IVAR___UITabBarItem___fallbackSourceItem;
    if (v2)
      v3 = &OBJC_IVAR___UITabBarItem__view;
    a1 = (id *)*(id *)((char *)v1 + *v3);
  }
  return a1;
}

- (id)_tabBarButton
{
  if (a1)
    a1 = (id *)a1[29];
  return a1;
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v7;
  _UITabBarItemAppearanceStorage *v8;
  _UITabBarItemAppearanceStorage *appearanceStorage;
  uint64_t v10;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!self->_appearanceStorage)
  {
    v8 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;

  }
  objc_msgSend(v7, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  v10 = objc_claimAutoreleasedReturnValue();

  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a4 != 8)
    a4 = 4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAppearanceTagObjectForSelector(self, a2, v13);

  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a4);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v10 | v14 && (objc_msgSend((id)v10, "isEqualToDictionary:", v14) & 1) == 0)
  {
    -[_UIBarItemAppearanceStorage setTextAttributes:forState:](self->_appearanceStorage, "setTextAttributes:forState:", v10, a4);
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }

}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a3 != 8)
    a3 = 4;
  return -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a3);
}

- (void)setTitlePositionAdjustment:(UIOffset)titlePositionAdjustment
{
  double vertical;
  double horizontal;
  _UITabBarItemAppearanceStorage *appearanceStorage;
  _UITabBarItemAppearanceStorage *v7;
  _UITabBarItemAppearanceStorage *v8;
  double v9;
  double v10;

  vertical = titlePositionAdjustment.vertical;
  horizontal = titlePositionAdjustment.horizontal;
  _UIAppearanceTagObjectForSelector(self, a2, 0);
  appearanceStorage = self->_appearanceStorage;
  if (!appearanceStorage)
  {
    v7 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    v8 = self->_appearanceStorage;
    self->_appearanceStorage = v7;

    appearanceStorage = self->_appearanceStorage;
  }
  -[_UITabBarItemAppearanceStorage titleOffset](appearanceStorage, "titleOffset");
  if (v10 != horizontal || v9 != vertical)
  {
    -[_UITabBarItemAppearanceStorage setTitleOffset:](self->_appearanceStorage, "setTitleOffset:", horizontal, vertical);
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
  }
}

- (UIOffset)titlePositionAdjustment
{
  double v2;
  double v3;
  UIOffset result;

  -[_UITabBarItemAppearanceStorage titleOffset](self->_appearanceStorage, "titleOffset");
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (void)setBadgeColor:(UIColor *)badgeColor
{
  UIColor *v4;
  _UITabBarItemAppearanceStorage *appearanceStorage;
  _UITabBarItemAppearanceStorage *v6;
  _UITabBarItemAppearanceStorage *v7;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;
  _QWORD v11[5];

  v4 = badgeColor;
  appearanceStorage = self->_appearanceStorage;
  v10 = v4;
  if (v4)
  {
    if (!appearanceStorage)
    {
      v6 = objc_alloc_init(_UITabBarItemAppearanceStorage);
      v7 = self->_appearanceStorage;
      self->_appearanceStorage = v6;

      appearanceStorage = self->_appearanceStorage;
    }
  }
  else if (!appearanceStorage)
  {
    goto LABEL_9;
  }
  -[_UITabBarItemAppearanceStorage badgeColor](appearanceStorage, "badgeColor", v10);
  v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 != v10 && !-[UIColor isEqual:](v8, "isEqual:", v10))
    -[_UITabBarItemAppearanceStorage setBadgeColor:](self->_appearanceStorage, "setBadgeColor:", v10);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__UITabBarItem_setBadgeColor___block_invoke;
  v11[3] = &unk_1E16B1B28;
  v11[4] = self;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v11);

LABEL_9:
}

void __30__UITabBarItem_setBadgeColor___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 232);
  objc_msgSend(*(id *)(v1 + 240), "badgeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setBadgeColor:", v3);

}

- (UIColor)badgeColor
{
  return -[_UITabBarItemAppearanceStorage badgeColor](self->_appearanceStorage, "badgeColor");
}

- (void)setBadgeTextAttributes:(NSDictionary *)textAttributes forState:(UIControlState)state
{
  NSDictionary *v7;
  _UITabBarItemAppearanceStorage *v8;
  _UITabBarItemAppearanceStorage *appearanceStorage;
  void *v10;
  void *v11;
  NSDictionary *v12;
  _QWORD v13[6];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = textAttributes;
  if (!self->_appearanceStorage)
  {
    v8 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    appearanceStorage = self->_appearanceStorage;
    self->_appearanceStorage = v8;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAppearanceTagObjectForSelector(self, a2, v11);

  -[_UITabBarItemAppearanceStorage badgeTextAttributesForState:](self->_appearanceStorage, "badgeTextAttributesForState:", state);
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (v12 != v7 && !-[NSDictionary isEqualToDictionary:](v7, "isEqualToDictionary:", v12))
    -[_UITabBarItemAppearanceStorage setBadgeTextAttributes:forState:](self->_appearanceStorage, "setBadgeTextAttributes:forState:", v7, state);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__UITabBarItem_setBadgeTextAttributes_forState___block_invoke;
  v13[3] = &unk_1E16B1888;
  v13[4] = self;
  v13[5] = state;
  -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, v13);

}

void __48__UITabBarItem_setBadgeTextAttributes_forState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 232);
  objc_msgSend(*(id *)(v2 + 240), "badgeTextAttributesForState:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBadgeTextAttributes:forState:", v4, *(_QWORD *)(a1 + 40));

}

- (NSDictionary)badgeTextAttributesForState:(UIControlState)state
{
  return (NSDictionary *)-[_UITabBarItemAppearanceStorage badgeTextAttributesForState:](self->_appearanceStorage, "badgeTextAttributesForState:", state);
}

- (void)_setTabBarButton:(uint64_t)a1
{
  uint64_t v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    v4 = objc_msgSend((id)a1, "_isSelected");
    objc_storeStrong((id *)(a1 + 232), a2);
    objc_msgSend(*(id *)(a1 + 232), "_setSelected:", v4);
    objc_msgSend(*(id *)(a1 + 232), "setSpringLoaded:", (*(unsigned __int16 *)(a1 + 248) >> 1) & 1);
    objc_msgSend(*(id *)(a1 + 232), "setEnabled:", *(_WORD *)(a1 + 248) & 1);
  }

}

- (BOOL)animatedBadge
{
  return 0;
}

- (void)setUnselectedImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    -[UIImage _setRenderingMode:](v5, "_setRenderingMode:", 1);
    v6 = v7;
    *(_WORD *)&self->_tabBarItemFlags |= 0x1000u;
  }
  if (self->_unselectedImage != v6)
  {
    objc_storeStrong((id *)&self->_unselectedImage, a3);
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    v6 = v7;
  }

}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (id)_internalTemplateImage
{
  void *v2;
  void *v3;

  -[UITabBarItem _internalTemplateImages](self, "_internalTemplateImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setInternalLandscapeTemplateImage:(id)a3
{
  UIImage *v5;
  __int16 tabBarItemFlags;
  UIImage *selectedImage;
  UIImage *unselectedImage;
  UIImage *v9;

  v5 = (UIImage *)a3;
  if (self->_landscapeTemplateImage != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_landscapeTemplateImage, a3);
    tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    if ((tabBarItemFlags & 0x800) == 0)
    {
      selectedImage = self->_selectedImage;
      self->_selectedImage = 0;

      tabBarItemFlags = (__int16)self->_tabBarItemFlags;
    }
    if ((tabBarItemFlags & 0x1000) == 0)
    {
      unselectedImage = self->_unselectedImage;
      self->_unselectedImage = 0;

    }
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
    v5 = v9;
  }

}

- (void)_setTitleTextAttributeValue:(id)a3 forAttributeKey:(id)a4 state:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;

  v12 = (unint64_t)a3;
  v8 = a4;
  -[_UIBarItemAppearanceStorage textAttributesForState:](self->_appearanceStorage, "textAttributesForState:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "objectForKey:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v12 && !v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if ((objc_msgSend((id)v12, "isEqual:", v11) & 1) != 0)
      goto LABEL_11;
LABEL_8:
    objc_msgSend(v10, "setObject:forKey:", v12, v8);
    goto LABEL_9;
  }
  if (!(v12 | v11) || (objc_msgSend((id)v12, "isEqual:", v11) & 1) != 0)
    goto LABEL_11;
  if (v12)
    goto LABEL_8;
  objc_msgSend(v10, "removeObjectForKey:", v8);
LABEL_9:
  -[UITabBarItem setTitleTextAttributes:forState:](self, "setTitleTextAttributes:forState:", v10, a5);
  if (self->_view)
    -[UITabBarItem _itemViewNeedsUpdate:]((uint64_t)self, 0);
LABEL_11:

}

+ (id)_appearanceBlindViewClasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)_appearanceBlindViewClasses_classList_0;
  if (!_appearanceBlindViewClasses_classList_0)
  {
    v6[0] = objc_opt_class();
    v6[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_appearanceBlindViewClasses_classList_0;
    _appearanceBlindViewClasses_classList_0 = v3;

    v2 = (void *)_appearanceBlindViewClasses_classList_0;
  }
  return v2;
}

- (id)_createViewForTabBar:(id)a3 asProxyView:(BOOL)a4
{
  id v6;
  void *v7;
  int64_t imageStyle;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UITabBarButton *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  UITabBarButton *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _UITabBarItemAppearanceStorage *appearanceStorage;
  void *v42;
  void *v43;
  void *v44;
  double v45;

  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    imageStyle = self->__imageStyle;
    objc_msgSend(v6, "_appearanceStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedImageTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 || (imageStyle & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v12 = v10;
    }
    else
    {
      -[UITabBarItem _tintColor](self, "_tintColor");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  -[UITabBarItem _internalTitle](self, "_internalTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem _internalLandscapeTemplateImages](self, "_internalLandscapeTemplateImages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [UITabBarButton alloc];
  -[UITabBarItem unselectedImage](self, "unselectedImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem selectedImage](self, "selectedImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem landscapeSelectedImagePhone](self, "landscapeSelectedImagePhone");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem imageInsets](self, "imageInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UITabBarItem landscapeImagePhoneInsets](self, "landscapeImagePhoneInsets");
  v33 = -[UITabBarButton initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:](v17, "initWithImage:landscapeImage:selectedImage:landscapeSelectedImage:label:withInsets:landscapeInsets:tabBar:", v18, v16, v19, v20, v14, v7, v22, v24, v26, v28, v29, v30, v31, v32);

  -[UITabBarItem badgeOffset](self, "badgeOffset");
  -[UITabBarButton _setBadgeOffset:](v33, "_setBadgeOffset:");
  if ((*(_WORD *)&self->_tabBarItemFlags & 2) != 0)
    -[UITabBarButton setSpringLoaded:](v33, "setSpringLoaded:", 1);

  -[UITabBarButton _setAppearanceGuideClass:](v33, "_setAppearanceGuideClass:", objc_opt_class());
  -[UIView frame](v33, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  objc_msgSend(v7, "_heightForCustomizingItems");
  -[UIView setFrame:](v33, "setFrame:", v35, v37, v39, v40);
  appearanceStorage = self->_appearanceStorage;
  objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarButton _applyTabBarButtonAppearanceStorage:withTaggedSelectors:](v33, "_applyTabBarButtonAppearanceStorage:withTaggedSelectors:", appearanceStorage, v42);

  objc_msgSend(v7, "_appearanceStorage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "selectionIndicatorImage");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    -[UITabBarButton _setCustomSelectedIndicatorImage:](v33, "_setCustomSelectedIndicatorImage:", v44);
  -[UIControl addTarget:action:forControlEvents:](v33, "addTarget:action:forControlEvents:", v7, sel__buttonDown_, 1);
  -[UIControl addTarget:action:forControlEvents:](v33, "addTarget:action:forControlEvents:", v7, sel__buttonUp_, 64);
  -[UIControl addTarget:action:forControlEvents:](v33, "addTarget:action:forControlEvents:", v7, sel__buttonCancel_, 256);
  -[UIControl addTarget:action:forControlEvents:](v33, "addTarget:action:forControlEvents:", v7, sel__sendAction_withEvent_, 0x40000000);
  -[UITabBarButton setEnabled:](v33, "setEnabled:", -[UITabBarItem isEnabled](self, "isEnabled"));
  -[UITabBarButton _setShowsHighlightedState:](v33, "_setShowsHighlightedState:", objc_msgSend(v7, "_showsHighlightedState"));
  if (!a4 && self->_badgeValue)
    -[UITabBarButton _setBadgeValue:](v33, "_setBadgeValue:");
  LODWORD(v45) = -1105618534;
  -[UIView setCharge:](v33, "setCharge:", v45);

  return v33;
}

- (_UITabBarItemAppearanceStorage)_appearanceStorage
{
  return self->_appearanceStorage;
}

- (int64_t)preferredPlacement
{
  if (-[UITabBarItem systemItem](self, "systemItem") == 8)
    return 4;
  if (-[UITabBarItem _isPinned](self, "_isPinned"))
    return 4;
  return 5;
}

- (id)titleForStyle:(int64_t)a3 state:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  -[UITabBarItem _internalTitle](self, "_internalTitle", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)badgeForStyle:(int64_t)a3 state:(int64_t)a4
{
  NSString *badgeValue;

  badgeValue = -[NSString length](self->_badgeValue, "length", a3, a4);
  if (badgeValue)
    badgeValue = self->_badgeValue;
  return badgeValue;
}

- (id)imageForStyle:(int64_t)a3 state:(int64_t)a4
{
  void *v6;
  void *v9;
  void *v10;

  if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarItem.m"), 1062, CFSTR("style %li currently unsupported"), a3);
      v10 = 0;
      goto LABEL_10;
    }
    -[UITabBarItem _internalLandscapeTemplateImages](self, "_internalLandscapeTemplateImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITabBarItem _internalTemplateImages](self, "_internalTemplateImages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  if (a4 == 2)
    objc_msgSend(v6, "lastObject");
  else
    objc_msgSend(v6, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

- (UIEdgeInsets)imageInsetsForStyle:(int64_t)a3 state:(int64_t)a4
{
  uint64_t v5;
  double *v6;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  if ((unint64_t)a3 < 2)
  {
    v5 = 120;
LABEL_6:
    v6 = (double *)((char *)self + v5);
    v13 = *v6;
    v12 = v6[1];
    v11 = v6[2];
    v10 = v6[3];
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    v5 = 176;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITabBarItem.m"), 1084, CFSTR("style %li currently unsupported"), a3);

  v10 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
LABEL_7:
  result.right = v10;
  result.bottom = v11;
  result.left = v12;
  result.top = v13;
  return result;
}

- (id)_changeObserver
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 35);
  return WeakRetained;
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (void)set_fallbackSourceItem:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 320), a2);
}

- (BOOL)_isPinned
{
  return self->__pinned;
}

- (void)_setPinned:(BOOL)a3
{
  self->__pinned = a3;
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
  -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
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
  -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
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

  -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
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
  -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
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
  -[UITabBarItem _resolvedSourceItem]((id *)&self->super.super.isa);
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
