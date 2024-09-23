@implementation PXExtendedTraitCollection

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)layoutSizeSubclass
{
  return self->_layoutSizeSubclass;
}

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
}

- (int64_t)userInterfaceLevel
{
  return self->_userInterfaceLevel;
}

- (int64_t)userInterfaceFeature
{
  return self->_userInterfaceFeature;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)layoutMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_layoutMargins.top;
  left = self->_layoutMargins.left;
  bottom = self->_layoutMargins.bottom;
  right = self->_layoutMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)_setNeedsUpdate
{
  -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 0);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXExtendedTraitCollection;
  -[PXExtendedTraitCollection didPerformChanges](&v3, sel_didPerformChanges);
  -[PXExtendedTraitCollection _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateWindowOrientationIfNeeded
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  if (self->_needsUpdateFlags.windowOrientation)
  {
    self->_needsUpdateFlags.windowOrientation = 0;
    -[PXExtendedTraitCollection windowReferenceSize](self, "windowReferenceSize");
    if ((PXSizeIsEmpty() & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      PXSizeGetAspectRatio();
      v5 = 2;
      if (v4 <= 1.0)
        v5 = 0;
      if (v4 >= 1.0)
        v3 = v5;
      else
        v3 = 1;
    }
    -[PXExtendedTraitCollection _setWindowOrientation:](self, "_setWindowOrientation:", v3);
  }
}

uint64_t __52__PXExtendedTraitCollection_initWithViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateUserInterfaceIdiom");
}

- (void)_invalidateLayoutDirection
{
  self->_needsUpdateFlags.layoutDirection = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

uint64_t __70__PXExtendedTraitCollection_viewControllerViewSafeAreaInsetsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateSafeAreaInsets");
}

uint64_t __69__PXExtendedTraitCollection_viewControllerViewLayoutMarginsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutMargins");
}

uint64_t __58__PXExtendedTraitCollection_viewControllerViewIsAppearing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllAppearingProperties");
}

uint64_t __57__PXExtendedTraitCollection_viewControllerViewWillAppear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllAppearingProperties");
}

uint64_t __55__PXExtendedTraitCollection_peripheryInsetsNeedsUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidatePeripheryInsets");
}

- (CGSize)windowReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_windowReferenceSize.width;
  height = self->_windowReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setWindowOrientation:(int64_t)a3
{
  if (self->_windowOrientation != a3)
  {
    self->_windowOrientation = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 0x40000);
  }
}

uint64_t __73__PXExtendedTraitCollection_viewControllerDidMoveToParentViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWindowReferenceSize");
  objc_msgSend(*(id *)(a1 + 32), "invalidateSafeAreaInsets");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutMargins");
}

uint64_t __54__PXExtendedTraitCollection_viewControllerViewDidLoad__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateViewSize");
  objc_msgSend(*(id *)(a1 + 32), "invalidateTraitCollection");
  objc_msgSend(*(id *)(a1 + 32), "invalidateSafeAreaInsets");
  objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutMargins");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayoutDirection");
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (PXExtendedTraitCollection)rootExtendedTraitCollection
{
  PXExtendedTraitCollection *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXExtendedTraitCollection *v7;

  v2 = self;
  -[PXExtendedTraitCollection viewController](v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    PXViewControllerRootViewController(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 != v4)
    {
      objc_msgSend(v5, "px_extendedTraitCollection");
      v7 = (PXExtendedTraitCollection *)objc_claimAutoreleasedReturnValue();

      if (-[PXExtendedTraitCollection isEnabled](v7, "isEnabled"))
      {
        v2 = v7;
      }
      else
      {
        v2 = v2;

      }
    }

  }
  return v2;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)getLayoutDirection:(int64_t *)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  id v7;

  -[PXExtendedTraitCollection viewController](self, "viewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layoutDirection");
  if (a3)
  {
    v6 = 2 * (v5 == 1);
    if (!v5)
      v6 = 1;
    *a3 = v6;
  }

}

- (id)createTraitCollection
{
  void *v2;
  void *v3;

  -[PXExtendedTraitCollection viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIEdgeInsets)platformSpecificPeripheryInsets
{
  void *v2;
  void *v3;
  double v4;
  double v5;
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
  UIEdgeInsets result;

  -[PXExtendedTraitCollection viewController](self, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "px_peripheryInsets");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *(double *)off_1E50B8020;
    v7 = *((double *)off_1E50B8020 + 1);
    v9 = *((double *)off_1E50B8020 + 2);
    v11 = *((double *)off_1E50B8020 + 3);
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)_updateIfNeeded
{
  if (-[PXExtendedTraitCollection _needsUpdate](self, "_needsUpdate"))
  {
    -[PXExtendedTraitCollection _updateViewSizeIfNeeded](self, "_updateViewSizeIfNeeded");
    -[PXExtendedTraitCollection _updateLayoutReferenceSizeIfNeeded](self, "_updateLayoutReferenceSizeIfNeeded");
    -[PXExtendedTraitCollection _updateTraitCollectionIfNeeded](self, "_updateTraitCollectionIfNeeded");
    -[PXExtendedTraitCollection _updateLayoutSizeClassIfNeeded](self, "_updateLayoutSizeClassIfNeeded");
    -[PXExtendedTraitCollection _updateLayoutDirectionIfNeeded](self, "_updateLayoutDirectionIfNeeded");
    -[PXExtendedTraitCollection _updateLayoutOrientationIfNeeded](self, "_updateLayoutOrientationIfNeeded");
    -[PXExtendedTraitCollection _updateContentSizeCategoryIfNeeded](self, "_updateContentSizeCategoryIfNeeded");
    -[PXExtendedTraitCollection _updateDisplayScaleIfNeeded](self, "_updateDisplayScaleIfNeeded");
    -[PXExtendedTraitCollection _updateSafeAreaInsetsIfNeeded](self, "_updateSafeAreaInsetsIfNeeded");
    -[PXExtendedTraitCollection _updatePeripheryInsetsIfNeeded](self, "_updatePeripheryInsetsIfNeeded");
    -[PXExtendedTraitCollection _updateLayoutMarginsIfNeeded](self, "_updateLayoutMarginsIfNeeded");
    -[PXExtendedTraitCollection _updateUserInterfaceIdiomIfNeeded](self, "_updateUserInterfaceIdiomIfNeeded");
    -[PXExtendedTraitCollection _updateUserInterfaceFeatureIfNeeded](self, "_updateUserInterfaceFeatureIfNeeded");
    -[PXExtendedTraitCollection _updateUserInterfaceStyleIfNeeded](self, "_updateUserInterfaceStyleIfNeeded");
    -[PXExtendedTraitCollection _updateUserInterfaceLevelIfNeeded](self, "_updateUserInterfaceLevelIfNeeded");
    -[PXExtendedTraitCollection _updateWindowReferenceSizeIfNeeded](self, "_updateWindowReferenceSizeIfNeeded");
    -[PXExtendedTraitCollection _updateWindowOrientationIfNeeded](self, "_updateWindowOrientationIfNeeded");
  }
}

- (void)_updateWindowReferenceSizeIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.windowReferenceSize)
  {
    self->_needsUpdateFlags.windowReferenceSize = 0;
    -[PXExtendedTraitCollection viewController](self, "viewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_windowReferenceSize");
    -[PXExtendedTraitCollection _setWindowReferenceSize:](self, "_setWindowReferenceSize:");

  }
}

- (void)_updateViewSizeIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (self->_needsUpdateFlags.viewSize)
  {
    self->_needsUpdateFlags.viewSize = 0;
    -[PXExtendedTraitCollection viewController](self, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_referenceSize");
    v5 = v4;
    v7 = v6;

    -[PXExtendedTraitCollection _setViewSize:](self, "_setViewSize:", v5, v7);
  }
}

- (void)_updateUserInterfaceStyleIfNeeded
{
  uint64_t v3;

  if (self->_needsUpdateFlags.userInterfaceStyle)
  {
    self->_needsUpdateFlags.userInterfaceStyle = 0;
    v3 = 0;
    -[PXExtendedTraitCollection getUserInterfaceStyle:](self, "getUserInterfaceStyle:", &v3);
    -[PXExtendedTraitCollection _setUserInterfaceStyle:](self, "_setUserInterfaceStyle:", v3);
  }
}

- (void)_updateUserInterfaceLevelIfNeeded
{
  uint64_t v3;

  if (self->_needsUpdateFlags.userInterfaceLevel)
  {
    self->_needsUpdateFlags.userInterfaceLevel = 0;
    v3 = -1;
    -[PXExtendedTraitCollection getUserInterfaceLevel:](self, "getUserInterfaceLevel:", &v3);
    -[PXExtendedTraitCollection _setUserInterfaceLevel:](self, "_setUserInterfaceLevel:", v3);
  }
}

- (void)_updateUserInterfaceIdiomIfNeeded
{
  uint64_t v3;

  if (self->_needsUpdateFlags.userInterfaceIdiom)
  {
    self->_needsUpdateFlags.userInterfaceIdiom = 0;
    v3 = 0;
    -[PXExtendedTraitCollection getUserInterfaceIdiom:](self, "getUserInterfaceIdiom:", &v3);
    -[PXExtendedTraitCollection _setUserInterfaceIdiom:](self, "_setUserInterfaceIdiom:", v3);
  }
}

- (void)_updateUserInterfaceFeatureIfNeeded
{
  void *v3;
  int64_t v4;

  if (self->_needsUpdateFlags.userInterfaceFeature)
  {
    self->_needsUpdateFlags.userInterfaceFeature = 0;
    -[PXExtendedTraitCollection viewController](self, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXExtendedTraitCollection userInterfaceFeatureForViewController:](self, "userInterfaceFeatureForViewController:", v3);

    -[PXExtendedTraitCollection _setUserInterfaceFeature:](self, "_setUserInterfaceFeature:", v4);
  }
}

- (void)_updateTraitCollectionIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.traitCollection)
  {
    self->_needsUpdateFlags.traitCollection = 0;
    -[PXExtendedTraitCollection createTraitCollection](self, "createTraitCollection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXExtendedTraitCollection _setTraitCollection:](self, "_setTraitCollection:", v3);

  }
}

- (void)_updateSafeAreaInsetsIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.safeAreaInsets)
  {
    self->_needsUpdateFlags.safeAreaInsets = 0;
    -[PXExtendedTraitCollection viewController](self, "viewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_safeAreaInsets");
    -[PXExtendedTraitCollection setSafeAreaInsets:](self, "setSafeAreaInsets:");

  }
}

- (void)_updatePeripheryInsetsIfNeeded
{
  double v3;
  double v4;
  double v5;
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
  id v18;

  if (self->_needsUpdateFlags.peripheryInsets)
  {
    self->_needsUpdateFlags.peripheryInsets = 0;
    -[PXExtendedTraitCollection platformSpecificPeripheryInsets](self, "platformSpecificPeripheryInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "simulatedPeripheryExtraTopInset");
    v12 = v4 + v11;
    objc_msgSend(v18, "simulatedPeripheryExtraLeftInset");
    v14 = v6 + v13;
    objc_msgSend(v18, "simulatedPeripheryExtraBottomInset");
    v16 = v8 + v15;
    objc_msgSend(v18, "simulatedPeripheryExtraRightInset");
    -[PXExtendedTraitCollection setPeripheryInsets:](self, "setPeripheryInsets:", v12, v14, v16, v10 + v17);

  }
}

- (void)_updateLayoutSizeClassIfNeeded
{
  uint64_t v3;
  uint64_t v4;

  if (self->_needsUpdateFlags.layoutSizeClass)
  {
    self->_needsUpdateFlags.layoutSizeClass = 0;
    v3 = 0;
    v4 = 0;
    -[PXExtendedTraitCollection getSizeClass:sizeSubclass:](self, "getSizeClass:sizeSubclass:", &v4, &v3);
    -[PXExtendedTraitCollection _setLayoutSizeClass:](self, "_setLayoutSizeClass:", v4);
    -[PXExtendedTraitCollection _setLayoutSizeSubclass:](self, "_setLayoutSizeSubclass:", v3);
  }
}

- (void)_updateLayoutReferenceSizeIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (self->_needsUpdateFlags.layoutReferenceSize)
  {
    self->_needsUpdateFlags.layoutReferenceSize = 0;
    -[PXExtendedTraitCollection _pendingViewTransitionSize](self, "_pendingViewTransitionSize");
    v4 = v3;
    v6 = v5;
    if (PXSizeIsNull())
    {
      -[PXExtendedTraitCollection _viewSize](self, "_viewSize");
      v4 = v7;
      v6 = v8;
    }
    -[PXExtendedTraitCollection setLayoutReferenceSize:](self, "setLayoutReferenceSize:", v4, v6);
  }
}

- (void)_updateLayoutOrientationIfNeeded
{
  uint64_t v3;
  double v4;
  uint64_t v5;

  if (self->_needsUpdateFlags.layoutOrientation)
  {
    self->_needsUpdateFlags.layoutOrientation = 0;
    -[PXExtendedTraitCollection layoutReferenceSize](self, "layoutReferenceSize");
    if ((PXSizeIsEmpty() & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      PXSizeGetAspectRatio();
      v5 = 2;
      if (v4 <= 1.0)
        v5 = 0;
      if (v4 >= 1.0)
        v3 = v5;
      else
        v3 = 1;
    }
    -[PXExtendedTraitCollection _setLayoutOrientation:](self, "_setLayoutOrientation:", v3);
  }
}

- (void)_updateLayoutMarginsIfNeeded
{
  id v3;

  if (self->_needsUpdateFlags.layoutMargins)
  {
    self->_needsUpdateFlags.layoutMargins = 0;
    -[PXExtendedTraitCollection viewController](self, "viewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_layoutMargins");
    -[PXExtendedTraitCollection setLayoutMargins:](self, "setLayoutMargins:");

  }
}

- (PXAnonymousViewController)viewController
{
  return (PXAnonymousViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)_updateLayoutDirectionIfNeeded
{
  uint64_t v3;

  if (self->_needsUpdateFlags.layoutDirection)
  {
    self->_needsUpdateFlags.layoutDirection = 0;
    v3 = 0;
    -[PXExtendedTraitCollection getLayoutDirection:](self, "getLayoutDirection:", &v3);
    -[PXExtendedTraitCollection setLayoutDirection:](self, "setLayoutDirection:", v3);
  }
}

- (void)_updateDisplayScaleIfNeeded
{
  void *v3;
  double v4;
  double v5;

  if (self->_needsUpdateFlags.displayScale)
  {
    self->_needsUpdateFlags.displayScale = 0;
    -[PXExtendedTraitCollection traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXExtendedTraitCollection displayScaleFromTraitCollection:](self, "displayScaleFromTraitCollection:", v3);
    v5 = v4;

    -[PXExtendedTraitCollection setDisplayScale:](self, "setDisplayScale:", v5);
  }
}

- (void)_updateContentSizeCategoryIfNeeded
{
  uint64_t v3;

  if (self->_needsUpdateFlags.contentSizeCategory)
  {
    self->_needsUpdateFlags.contentSizeCategory = 0;
    v3 = 0;
    -[PXExtendedTraitCollection getContentSizeCategory:](self, "getContentSizeCategory:", &v3);
    -[PXExtendedTraitCollection setContentSizeCategory:](self, "setContentSizeCategory:", v3);
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.viewSize
      || self->_needsUpdateFlags.layoutReferenceSize
      || self->_needsUpdateFlags.traitCollection
      || self->_needsUpdateFlags.layoutSizeClass
      || self->_needsUpdateFlags.layoutDirection
      || self->_needsUpdateFlags.layoutOrientation
      || self->_needsUpdateFlags.contentSizeCategory
      || self->_needsUpdateFlags.displayScale
      || self->_needsUpdateFlags.safeAreaInsets
      || self->_needsUpdateFlags.peripheryInsets
      || self->_needsUpdateFlags.layoutMargins
      || self->_needsUpdateFlags.userInterfaceIdiom
      || self->_needsUpdateFlags.userInterfaceStyle
      || self->_needsUpdateFlags.userInterfaceLevel
      || self->_needsUpdateFlags.userInterfaceFeature
      || self->_needsUpdateFlags.windowReferenceSize
      || self->_needsUpdateFlags.windowOrientation;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_safeAreaInsets;
  uint64_t v9;
  int v10;
  uint64_t v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_safeAreaInsets = &self->_safeAreaInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    if (PXEdgeInsetsEqualToEdgeInsetsForEdges())
      v9 = 256;
    else
      v9 = 8448;
    v10 = PXEdgeInsetsEqualToEdgeInsetsForEdges();
    p_safeAreaInsets->top = top;
    p_safeAreaInsets->left = left;
    if (v10)
      v11 = v9;
    else
      v11 = v9 | 0x4000;
    p_safeAreaInsets->bottom = bottom;
    p_safeAreaInsets->right = right;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", v11);
  }
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_layoutMargins;
  uint64_t v9;
  int v10;
  uint64_t v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_layoutMargins = &self->_layoutMargins;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    if (PXEdgeInsetsEqualToEdgeInsetsForEdges())
      v9 = 512;
    else
      v9 = 33280;
    v10 = PXEdgeInsetsEqualToEdgeInsetsForEdges();
    p_layoutMargins->top = top;
    p_layoutMargins->left = left;
    if (v10)
      v11 = v9;
    else
      v11 = v9 | 0x10000;
    p_layoutMargins->bottom = bottom;
    p_layoutMargins->right = right;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", v11);
  }
}

- (void)setPeripheryInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_peripheryInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_peripheryInsets = &self->_peripheryInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_peripheryInsets->top = top;
    p_peripheryInsets->left = left;
    p_peripheryInsets->bottom = bottom;
    p_peripheryInsets->right = right;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 0x80000);
  }
}

- (void)_setViewSize:(CGSize)a3
{
  if (a3.width != self->__viewSize.width || a3.height != self->__viewSize.height)
  {
    self->__viewSize = a3;
    -[PXExtendedTraitCollection _invalidateLayoutReferenceSize](self, "_invalidateLayoutReferenceSize");
  }
}

- (void)getUserInterfaceIdiom:(int64_t *)a3
{
  void *v4;
  unint64_t v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 > 6)
    v6 = 0;
  else
    v6 = qword_1A7C09B68[v5];
  *a3 = v6;
}

- (void)_setUserInterfaceIdiom:(int64_t)a3
{
  if (self->_userInterfaceIdiom != a3)
  {
    self->_userInterfaceIdiom = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 64);
  }
}

- (void)_setTraitCollection:(id)a3
{
  PXAnonymousTraitCollection *v5;
  PXAnonymousTraitCollection *v6;
  char v7;
  PXAnonymousTraitCollection *v8;

  v5 = (PXAnonymousTraitCollection *)a3;
  v6 = v5;
  if (self->_traitCollection != v5)
  {
    v8 = v5;
    v7 = -[PXAnonymousTraitCollection isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_traitCollection, a3);
      -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 1);
      -[PXExtendedTraitCollection _invalidateLayoutSizeClass](self, "_invalidateLayoutSizeClass");
      -[PXExtendedTraitCollection _invalidateUserInterfaceIdiom](self, "_invalidateUserInterfaceIdiom");
      -[PXExtendedTraitCollection _invalidateUserInterfaceStyle](self, "_invalidateUserInterfaceStyle");
      -[PXExtendedTraitCollection _invalidateUserInterfaceLevel](self, "_invalidateUserInterfaceLevel");
      -[PXExtendedTraitCollection _invalidateContentSizeCategory](self, "_invalidateContentSizeCategory");
      -[PXExtendedTraitCollection invalidateDisplayScale](self, "invalidateDisplayScale");
      v6 = v8;
    }
  }

}

- (void)_invalidateUserInterfaceIdiom
{
  self->_needsUpdateFlags.userInterfaceIdiom = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_setWindowReferenceSize:(CGSize)a3
{
  if (a3.width != self->_windowReferenceSize.width || a3.height != self->_windowReferenceSize.height)
  {
    self->_windowReferenceSize = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 0x20000);
    -[PXExtendedTraitCollection _invalidateWindowOrientation](self, "_invalidateWindowOrientation");
  }
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (PXExtendedTraitCollection)initWithViewController:(id)a3
{
  id v4;
  PXExtendedTraitCollection *v5;
  PXExtendedTraitCollection *v6;
  CGSize v7;
  PXExtendedTraitCollection *v8;
  _QWORD v10[4];
  PXExtendedTraitCollection *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXExtendedTraitCollection;
  v5 = -[PXExtendedTraitCollection init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = *(CGSize *)off_1E50B8810;
    v6->_layoutReferenceSize = *(CGSize *)off_1E50B8810;
    v6->_layoutDirection = 0;
    v6->_layoutOrientation = 0;
    v6->_windowReferenceSize = v7;
    v6->_windowOrientation = 0;
    v6->_contentSizeCategory = 0;
    v6->_displayScale = 1.0;
    v6->__viewSize = v7;
    v6->__pendingViewTransitionSize = v7;
    v6->_userInterfaceFeature = -[PXExtendedTraitCollection userInterfaceFeatureForViewController:](v6, "userInterfaceFeatureForViewController:", v4);
    v6->_userInterfaceStyle = 0;
    v6->_userInterfaceLevel = -1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__PXExtendedTraitCollection_initWithViewController___block_invoke;
    v10[3] = &unk_1E51479C8;
    v8 = v6;
    v11 = v8;
    -[PXExtendedTraitCollection performChanges:](v8, "performChanges:", v10);
    -[PXExtendedTraitCollection registerObservations](v8, "registerObservations");

  }
  return v6;
}

- (int64_t)userInterfaceFeatureForViewController:(id)a3
{
  void *v4;
  int64_t v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  -[PXExtendedTraitCollection viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceFeature");

  return v5;
}

- (double)displayScaleFromTraitCollection:(id)a3
{
  double result;

  objc_msgSend(a3, "displayScale");
  return result;
}

- (PXAnonymousTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 32);
  }
}

uint64_t __56__PXExtendedTraitCollection_viewControllerViewDidAppear__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWindowReferenceSize");
  objc_msgSend(*(id *)(a1 + 32), "invalidateDisplayScale");
  objc_msgSend(*(id *)(a1 + 32), "invalidateTraitCollection");
  objc_msgSend(*(id *)(a1 + 32), "invalidateSafeAreaInsets");
  objc_msgSend(*(id *)(a1 + 32), "invalidatePeripheryInsets");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutMargins");
}

- (void)_invalidateAllAppearingProperties
{
  -[PXExtendedTraitCollection _invalidateViewSize](self, "_invalidateViewSize");
  -[PXExtendedTraitCollection invalidateTraitCollection](self, "invalidateTraitCollection");
  -[PXExtendedTraitCollection invalidateSafeAreaInsets](self, "invalidateSafeAreaInsets");
  -[PXExtendedTraitCollection invalidatePeripheryInsets](self, "invalidatePeripheryInsets");
  -[PXExtendedTraitCollection invalidateLayoutMargins](self, "invalidateLayoutMargins");
  -[PXExtendedTraitCollection _invalidateLayoutDirection](self, "_invalidateLayoutDirection");
}

- (void)invalidateLayoutMargins
{
  self->_needsUpdateFlags.layoutMargins = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)invalidateSafeAreaInsets
{
  self->_needsUpdateFlags.safeAreaInsets = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)invalidatePeripheryInsets
{
  self->_needsUpdateFlags.peripheryInsets = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateViewSize
{
  self->_needsUpdateFlags.viewSize = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)invalidateTraitCollection
{
  self->_needsUpdateFlags.traitCollection = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)invalidateDisplayScale
{
  self->_needsUpdateFlags.displayScale = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

uint64_t __52__PXExtendedTraitCollection__viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setPendingViewTransitionSize:", *(double *)off_1E50B8810, *((double *)off_1E50B8810 + 1));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateViewSize");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateWindowReferenceSize");
  objc_msgSend(*(id *)(a1 + 32), "invalidateSafeAreaInsets");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutMargins");
}

- (void)_invalidateWindowReferenceSize
{
  self->_needsUpdateFlags.windowReferenceSize = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_setPendingViewTransitionSize:(CGSize)a3
{
  if (a3.width != self->__pendingViewTransitionSize.width || a3.height != self->__pendingViewTransitionSize.height)
  {
    self->__pendingViewTransitionSize = a3;
    -[PXExtendedTraitCollection _invalidateLayoutReferenceSize](self, "_invalidateLayoutReferenceSize");
  }
}

- (void)getUserInterfaceStyle:(int64_t *)a3
{
  void *v4;
  int64_t v5;
  id v6;

  -[PXExtendedTraitCollection viewController](self, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PXUserInterfaceStyleFromUITraitCollection();
  if (a3)
    *a3 = v5;

}

- (void)getUserInterfaceLevel:(int64_t *)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  id v7;

  -[PXExtendedTraitCollection viewController](self, "viewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceLevel");
  if (a3)
  {
    v6 = v5 == 1;
    if (v5 == -1)
      v6 = -1;
    *a3 = v6;
  }

}

- (void)getSizeClass:(int64_t *)a3 sizeSubclass:(int64_t *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  double v14;
  id v15;

  -[PXExtendedTraitCollection layoutReferenceSize](self, "layoutReferenceSize");
  v8 = v7;
  v10 = v9;
  -[PXExtendedTraitCollection viewController](self, "viewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PXUserInterfaceSizeClassFromUITraitCollection(v11);
  v13 = v12;
  if (v12 == 2)
    goto LABEL_7;
  if (v12 == 1)
  {
    v14 = fmin(v10, v8);
    v13 = 2;
    if (v14 <= 350.0)
      v13 = 1;
    if (v14 > 400.0)
      v13 = 3;
LABEL_7:
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v13 = 0;
  if (a3)
LABEL_8:
    *a3 = v12;
LABEL_9:
  if (a4)
    *a4 = v13;

}

- (void)getContentSizeCategory:(int64_t *)a3
{
  void *v4;
  int64_t v5;
  id v6;

  -[PXExtendedTraitCollection viewController](self, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PXPreferredContentSizeCategoryFromUITraitCollection(v4);
  if (a3)
    *a3 = v5;

}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  if (a3.width != self->_layoutReferenceSize.width || a3.height != self->_layoutReferenceSize.height)
  {
    self->_layoutReferenceSize = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 16);
    -[PXExtendedTraitCollection _invalidateLayoutSizeClass](self, "_invalidateLayoutSizeClass");
    -[PXExtendedTraitCollection _invalidateLayoutOrientation](self, "_invalidateLayoutOrientation");
  }
}

- (void)_invalidateLayoutSizeClass
{
  self->_needsUpdateFlags.layoutSizeClass = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)setContentSizeCategory:(int64_t)a3
{
  if (self->_contentSizeCategory != a3)
  {
    self->_contentSizeCategory = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 2048);
  }
}

- (CGSize)_viewSize
{
  double width;
  double height;
  CGSize result;

  width = self->__viewSize.width;
  height = self->__viewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 1024);
  }
}

- (void)_setUserInterfaceLevel:(int64_t)a3
{
  if (self->_userInterfaceLevel != a3)
  {
    self->_userInterfaceLevel = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 4096);
  }
}

- (void)_setLayoutSizeSubclass:(int64_t)a3
{
  if (self->_layoutSizeSubclass != a3)
  {
    self->_layoutSizeSubclass = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 4);
  }
}

- (void)_setLayoutSizeClass:(int64_t)a3
{
  if (self->_layoutSizeClass != a3)
  {
    self->_layoutSizeClass = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 2);
  }
}

- (void)_setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 8);
  }
}

- (CGSize)_pendingViewTransitionSize
{
  double width;
  double height;
  CGSize result;

  width = self->__pendingViewTransitionSize.width;
  height = self->__pendingViewTransitionSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_invalidateWindowOrientation
{
  self->_needsUpdateFlags.windowOrientation = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateUserInterfaceStyle
{
  self->_needsUpdateFlags.userInterfaceStyle = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateUserInterfaceLevel
{
  self->_needsUpdateFlags.userInterfaceLevel = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateLayoutReferenceSize
{
  self->_needsUpdateFlags.layoutReferenceSize = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateLayoutOrientation
{
  self->_needsUpdateFlags.layoutOrientation = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateContentSizeCategory
{
  self->_needsUpdateFlags.contentSizeCategory = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)viewControllerViewWillAppear
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __57__PXExtendedTraitCollection_viewControllerViewWillAppear__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)viewControllerViewIsAppearing
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __58__PXExtendedTraitCollection_viewControllerViewIsAppearing__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)viewControllerViewDidAppear
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PXExtendedTraitCollection_viewControllerViewDidAppear__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)_viewWillLayoutSubviews
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __52__PXExtendedTraitCollection__viewWillLayoutSubviews__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)viewControllerViewSafeAreaInsetsDidChange
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __70__PXExtendedTraitCollection_viewControllerViewSafeAreaInsetsDidChange__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)peripheryInsetsNeedsUpdate
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__PXExtendedTraitCollection_peripheryInsetsNeedsUpdate__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)viewControllerViewLayoutMarginsDidChange
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __69__PXExtendedTraitCollection_viewControllerViewLayoutMarginsDidChange__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)viewControllerDidMoveToParentViewController:(id)a3
{
  _QWORD v4[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled", a3))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __73__PXExtendedTraitCollection_viewControllerDidMoveToParentViewController___block_invoke;
    v4[3] = &unk_1E51479C8;
    v4[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v4);
  }
}

- (void)viewControllerViewDidLoad
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __54__PXExtendedTraitCollection_viewControllerViewDidLoad__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (unint64_t)curatedLibraryLayoutStyle
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  PXExtendedTraitCollection *v7;
  unint64_t v8;
  _QWORD v10[2];

  v3 = sub_1A7ADF540();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  PXExtendedTraitCollection.environmentValues.getter((uint64_t)v6);
  sub_1A6A9CB38();
  sub_1A7ADF54C();
  v8 = v10[1];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v8;
}

- (PXStoryChromeLayoutSpec)storyChromeLayoutSpec
{
  PXExtendedTraitCollection *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v11;

  swift_getKeyPath();
  sub_1A6BF2FA4();
  sub_1A6BF2FE0();
  v3 = self;
  sub_1A7ADF390();
  swift_release();
  if (v11 == 1)
  {
    sub_1A6BF3048();
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v7 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16);
    v8 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24);
  }
  type metadata accessor for StoryChromeLayoutSpec();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v6;
  v9[3] = v7;
  v9[4] = v5;
  v9[5] = v8;

  return (PXStoryChromeLayoutSpec *)v9;
}

- (int64_t)preferredBackgroundStyle
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  PXExtendedTraitCollection *v7;
  char *v8;
  char *v9;
  int64_t v10;
  char v11;
  uint64_t v13;

  v3 = sub_1A7ADF540();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = (char *)sub_1A7011B68();
  v9 = &v8[OBJC_IVAR____TtCE12PhotosUICoreCSo25PXExtendedTraitCollectionP33_5E66913795B6B06AAAB2221F88A6AAE318EnvironmentStorage_values];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);

  v10 = sub_1A6C4EED8();
  LOBYTE(v9) = v11;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  if ((v9 & 1) != 0)
    return 0;
  else
    return v10;
}

- (PXExtendedTraitCollectionSnapshot)snapshot
{
  return (PXExtendedTraitCollectionSnapshot *)-[PXExtendedTraitCollectionSnapshot _initWithExtendedTraitCollection:]([PXExtendedTraitCollectionSnapshot alloc], "_initWithExtendedTraitCollection:", self);
}

- (CGRect)platformSpecificFullScreenReferenceRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return (PXPhotosHeaderCustomizationModel *)objc_getAssociatedObject(self, sel_headerCustomizationModel);
}

- (void)setHeaderCustomizationModel:(id)a3
{
  objc_setAssociatedObject(self, sel_headerCustomizationModel, a3, (void *)1);
}

- (PXExtendedTraitCollection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXExtendedTraitCollection.m"), 98, CFSTR("%s is not available as initializer"), "-[PXExtendedTraitCollection init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[PXExtendedTraitCollection unregisterObservations](self, "unregisterObservations");
  v3.receiver = self;
  v3.super_class = (Class)PXExtendedTraitCollection;
  -[PXExtendedTraitCollection dealloc](&v3, sel_dealloc);
}

- (void)viewControllerViewWillTransitionToSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _QWORD v6[7];

  height = a3.height;
  width = a3.width;
  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__PXExtendedTraitCollection_viewControllerViewWillTransitionToSize___block_invoke;
    v6[3] = &unk_1E51449E0;
    v6[4] = self;
    *(CGFloat *)&v6[5] = width;
    *(CGFloat *)&v6[6] = height;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v6);
  }
}

- (void)viewControllerTraitCollectionDidChange
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67__PXExtendedTraitCollection_viewControllerTraitCollectionDidChange__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)viewControllerLayoutOrientationDidChange
{
  _QWORD v3[5];

  if (-[PXExtendedTraitCollection isEnabled](self, "isEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __69__PXExtendedTraitCollection_viewControllerLayoutOrientationDidChange__block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXExtendedTraitCollection performChanges:](self, "performChanges:", v3);
  }
}

- (void)_setUserInterfaceFeature:(int64_t)a3
{
  if (self->_userInterfaceFeature != a3)
  {
    self->_userInterfaceFeature = a3;
    -[PXExtendedTraitCollection signalChange:](self, "signalChange:", 128);
  }
}

- (void)_invalidateUserInterfaceFeature
{
  self->_needsUpdateFlags.userInterfaceFeature = 1;
  -[PXExtendedTraitCollection _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (UIEdgeInsets)peripheryInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_peripheryInsets.top;
  left = self->_peripheryInsets.left;
  bottom = self->_peripheryInsets.bottom;
  right = self->_peripheryInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)swift_environmentStorage
{
  return self->_swift_environmentStorage;
}

- (void)setSwift_environmentStorage:(id)a3
{
  objc_storeStrong(&self->_swift_environmentStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_swift_environmentStorage, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

uint64_t __69__PXExtendedTraitCollection_viewControllerLayoutOrientationDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLayoutOrientation");
}

uint64_t __67__PXExtendedTraitCollection_viewControllerTraitCollectionDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateTraitCollection");
  objc_msgSend(*(id *)(a1 + 32), "invalidateSafeAreaInsets");
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayoutMargins");
}

uint64_t __68__PXExtendedTraitCollection_viewControllerViewWillTransitionToSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPendingViewTransitionSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end
