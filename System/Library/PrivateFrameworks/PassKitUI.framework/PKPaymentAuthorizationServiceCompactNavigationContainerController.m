@implementation PKPaymentAuthorizationServiceCompactNavigationContainerController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PKPaymentAuthorizationServiceCompactNavigationContainerController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    ++self->_rotationCount;
    -[PKPaymentAuthorizationServiceCompactNavigationContainerController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __120__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E3E62F28;
    v11[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v11);
  }

}

void __120__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  --*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1304);
  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[1304])
  {
    objc_msgSend(v1, "view");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
  -[PKCompactNavigationContainerController loadView](&v3, sel_loadView);
  -[PKPaymentAuthorizationServiceCompactNavigationContainerController _createSecondaryViewsIfNecessary](self, "_createSecondaryViewsIfNecessary");
  if (self->_physicalButtonView)
    -[PKCompactNavigationContainerController insertBackgroundLevelView:](self, "insertBackgroundLevelView:");
  if (self->_cameraArrowView)
    -[PKCompactNavigationContainerController insertBackgroundLevelView:](self, "insertBackgroundLevelView:");
}

- (void)viewWillLayoutSubviews
{
  LAUIPhysicalButtonView *physicalButtonView;
  LAUIHorizontalArrowView *cameraArrowView;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
  -[PKCompactNavigationContainerController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  if (!self->_rotationCount)
  {
    physicalButtonView = self->_physicalButtonView;
    if (physicalButtonView)
      -[LAUIPhysicalButtonView updateFrame](physicalButtonView, "updateFrame");
    cameraArrowView = self->_cameraArrowView;
    if (cameraArrowView)
      self->_cameraOrientationSupported = -[LAUIHorizontalArrowView pkui_updateFrame](cameraArrowView, "pkui_updateFrame");
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke;
  v5[3] = &unk_1E3E612E8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
}

_QWORD *__91__PKPaymentAuthorizationServiceCompactNavigationContainerController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  _QWORD *result;
  void *v3;
  void *v4;

  result = *(_QWORD **)(a1 + 32);
  v3 = (void *)result[165];
  if (v3)
  {
    objc_msgSend(v3, "setAnimating:", objc_msgSend(result, "_effectiveShowPhysicalButtonIndicator"));
    result = *(_QWORD **)(a1 + 32);
  }
  v4 = (void *)result[164];
  if (v4)
    return (_QWORD *)objc_msgSend(v4, "setAnimating:", objc_msgSend(result, "_effectiveShowCameraIndicator"));
  return result;
}

- (void)_createSecondaryViewsIfNecessary
{
  LAUIPhysicalButtonView *v3;
  LAUIPhysicalButtonView *physicalButtonView;
  void *v5;
  uint64_t v6;
  LAUIHorizontalArrowView *v7;
  LAUIHorizontalArrowView *cameraArrowView;

  if (!self->_attemptedSecondaryViewCreation)
  {
    self->_attemptedSecondaryViewCreation = 1;
    if (PKUserIntentIsAvailable())
    {
      v3 = (LAUIPhysicalButtonView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44460]), "initWithStyle:", 1);
      physicalButtonView = self->_physicalButtonView;
      self->_physicalButtonView = v3;

    }
    -[PKPaymentAuthorizationServiceCompactNavigationContainerController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (PKPearlIsAvailable())
    {
      if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        -[PKCompactNavigationContainerController setDidMoveToWindowDirtiesLayout:](self, "setDidMoveToWindowDirtiesLayout:", 1);
        v7 = (LAUIHorizontalArrowView *)objc_alloc_init(MEMORY[0x1E0D44448]);
        cameraArrowView = self->_cameraArrowView;
        self->_cameraArrowView = v7;

        -[LAUIHorizontalArrowView sizeToFit](self->_cameraArrowView, "sizeToFit");
      }
    }
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  PKPaymentAuthorizationServiceCompactNavigationContainerController *v7;
  PKPaymentAuthorizationServiceCompactNavigationContainerController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = (PKPaymentAuthorizationServiceCompactNavigationContainerController *)a3;
  if (v7 != self)
  {
    -[PKCompactNavigationContainerController containedNavigationController](self, "containedNavigationController");
    v8 = (PKPaymentAuthorizationServiceCompactNavigationContainerController *)objc_claimAutoreleasedReturnValue();

    if (v8 != v7)
    {
      v13.receiver = self;
      v13.super_class = (Class)PKPaymentAuthorizationServiceCompactNavigationContainerController;
      -[PKPaymentAuthorizationServiceCompactNavigationContainerController sizeForChildContentContainer:withParentContainerSize:](&v13, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
      width = v9;
      height = v10;
    }
  }

  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int)_preferredStatusBarVisibility
{
  return 1;
}

- (LAUIPhysicalButtonView)physicalButtonView
{
  -[PKPaymentAuthorizationServiceCompactNavigationContainerController _createSecondaryViewsIfNecessary](self, "_createSecondaryViewsIfNecessary");
  return self->_physicalButtonView;
}

- (void)setShowPhysicalButtonIndicator:(BOOL)a3
{
  LAUIPhysicalButtonView *physicalButtonView;

  if (self->_showPhysicalButtonIndicator != a3)
  {
    self->_showPhysicalButtonIndicator = a3;
    physicalButtonView = self->_physicalButtonView;
    if (physicalButtonView)
      -[LAUIPhysicalButtonView setAnimating:](physicalButtonView, "setAnimating:", -[PKPaymentAuthorizationServiceCompactNavigationContainerController _effectiveShowPhysicalButtonIndicator](self, "_effectiveShowPhysicalButtonIndicator"));
  }
}

- (BOOL)_effectiveShowPhysicalButtonIndicator
{
  return !self->_rotationCount && self->_showPhysicalButtonIndicator;
}

- (void)setShowCameraIndicator:(BOOL)a3
{
  LAUIHorizontalArrowView *cameraArrowView;

  if (self->_showCameraIndicator != a3)
  {
    self->_showCameraIndicator = a3;
    cameraArrowView = self->_cameraArrowView;
    if (cameraArrowView)
      -[LAUIHorizontalArrowView setAnimating:](cameraArrowView, "setAnimating:", -[PKPaymentAuthorizationServiceCompactNavigationContainerController _effectiveShowCameraIndicator](self, "_effectiveShowCameraIndicator"));
  }
}

- (BOOL)_effectiveShowCameraIndicator
{
  return !self->_rotationCount && self->_cameraOrientationSupported && self->_showCameraIndicator;
}

- (BOOL)showPhysicalButtonIndicator
{
  return self->_showPhysicalButtonIndicator;
}

- (BOOL)showCameraIndicator
{
  return self->_showCameraIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_cameraArrowView, 0);
}

@end
