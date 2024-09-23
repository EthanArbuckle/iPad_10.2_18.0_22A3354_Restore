@implementation PXStoryRelatedOverlayLayout

- (PXStoryRelatedOverlayLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 103, CFSTR("%s is not available as initializer"), "-[PXStoryRelatedOverlayLayout init]");

  abort();
}

- (PXStoryRelatedOverlayLayout)initWithViewModel:(id)a3
{
  id v5;
  PXStoryRelatedOverlayLayout *v6;
  PXStoryRelatedOverlayLayout *v7;
  id *p_viewModel;
  PXStoryRelatedLayoutGenerator *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PXStoryRelatedLayoutGenerator *layoutGenerator;
  uint64_t v14;
  PXNumberAnimator *countDownAlphaAnimator;
  uint64_t v16;
  PXNumberAnimator *navigationButtonAlphaAnimator;
  uint64_t v18;
  PXNumberAnimator *navigationButtonScrollAnimator;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryRelatedOverlayLayout;
  v6 = -[PXGAbsoluteCompositeLayout init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    p_viewModel = (id *)&v6->_viewModel;
    objc_storeStrong((id *)&v6->_viewModel, a3);
    objc_msgSend(*p_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_284613);
    v9 = [PXStoryRelatedLayoutGenerator alloc];
    objc_msgSend(*p_viewModel, "viewLayoutSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relatedLayoutMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXStoryRelatedLayoutGenerator initWithMetrics:](v9, "initWithMetrics:", v11);
    layoutGenerator = v7->_layoutGenerator;
    v7->_layoutGenerator = (PXStoryRelatedLayoutGenerator *)v12;

    v14 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    countDownAlphaAnimator = v7->_countDownAlphaAnimator;
    v7->_countDownAlphaAnimator = (PXNumberAnimator *)v14;

    -[PXNumberAnimator registerChangeObserver:context:](v7->_countDownAlphaAnimator, "registerChangeObserver:context:", v7, CountDownAlphaAnimatorObservationContext);
    v16 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    navigationButtonAlphaAnimator = v7->_navigationButtonAlphaAnimator;
    v7->_navigationButtonAlphaAnimator = (PXNumberAnimator *)v16;

    -[PXNumberAnimator registerChangeObserver:context:](v7->_navigationButtonAlphaAnimator, "registerChangeObserver:context:", v7, NavigationButtonAlphaAnimatorObservationContext);
    v18 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    navigationButtonScrollAnimator = v7->_navigationButtonScrollAnimator;
    v7->_navigationButtonScrollAnimator = (PXNumberAnimator *)v18;

    -[PXNumberAnimator registerChangeObserver:context:](v7->_navigationButtonScrollAnimator, "registerChangeObserver:context:", v7, NavigationButtonScrollAnimatorObservationContext);
    v7->_navigationButtonScrollAnimatorTarget = 0.0;
    v7->_scrollSublayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
    v7->_titleSpriteIndex = 0;
    v7->_countDownSpriteIndex = 1;
    v7->_countDownDecorationSpriteIndex = 2;
    v7->_navigationButtonSpriteIndex = 3;
    v7->_navigationHitTestVisabilitySpriteIndex = 4;
    v7->_relatedSelectionSpriteIndexRange = (_PXGSpriteIndexRange)5;
    v7->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[PXGLayout addSpriteCount:withInitialState:](v7, "addSpriteCount:withInitialState:", 5, 0);
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    -[PXStoryRelatedOverlayLayout _invalidateRelatedSpritesAndSublayouts](v7, "_invalidateRelatedSpritesAndSublayouts");
    -[PXStoryRelatedOverlayLayout _invalidateScrollSpritesAndSublayouts](v7, "_invalidateScrollSpritesAndSublayouts");
    -[PXStoryRelatedOverlayLayout _invalidateNavigationButton](v7, "_invalidateNavigationButton");
    -[PXStoryRelatedOverlayLayout _invalidateAXGroupRole](v7, "_invalidateAXGroupRole");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_relatedDefaultFrames);
  -[NSTimer invalidate](self->_countDownTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  -[PXGCompositeLayout dealloc](&v3, sel_dealloc);
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  -[PXGCompositeLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:");
  -[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
  -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  -[PXGCompositeLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  -[PXGCompositeLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryRelatedOverlayLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  _PXGSpriteIndexRange relatedSelectionSpriteIndexRange;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  PXStoryHitTestResult *v10;
  void *v11;
  _QWORD v12[6];

  relatedSelectionSpriteIndexRange = self->_relatedSelectionSpriteIndexRange;
  v5 = a3 >= relatedSelectionSpriteIndexRange.location;
  v6 = a3 - relatedSelectionSpriteIndexRange.location;
  v7 = relatedSelectionSpriteIndexRange.length + relatedSelectionSpriteIndexRange.location;
  if (!v5 || v7 <= a3)
    return -[PXStoryHitTestResult initWithSpriteIndex:layout:identifier:]([PXStoryHitTestResult alloc], "initWithSpriteIndex:layout:identifier:", *(_QWORD *)&a3, self, CFSTR("PXStoryHitTestIdentifierRelated"));
  v10 = -[PXStoryHitTestResult initWithSpriteIndex:layout:identifier:]([PXStoryHitTestResult alloc], "initWithSpriteIndex:layout:identifier:", *(_QWORD *)&a3, self, CFSTR("PXStoryHitTestIdentifierRelated"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PXStoryRelatedOverlayLayout_hitTestResultForSpriteIndex___block_invoke;
  v12[3] = &unk_1E5145388;
  v12[4] = self;
  v12[5] = v6;
  -[PXFeedHitTestResult primaryAction:](v10, "primaryAction:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_selectRelatedMemoryAtIndex:(int64_t)a3
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PXStoryRelatedOverlayLayout *v10;
  int64_t v11;
  SEL v12;

  self->_selectedIndex = a3;
  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PXStoryRelatedOverlayLayout__selectRelatedMemoryAtIndex___block_invoke;
  v8[3] = &unk_1E51453B0;
  v11 = a3;
  v12 = a2;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v7, "performChanges:", v8);

}

- (void)setIsRelatedOverlayScrolledIntoView:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_isRelatedOverlayScrolledIntoView != a3)
  {
    self->_isRelatedOverlayScrolledIntoView = a3;
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PXStoryRelatedOverlayLayout_setIsRelatedOverlayScrolledIntoView___block_invoke;
    v5[3] = &unk_1E5146E78;
    v5[4] = self;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

- (void)setShouldCountDown:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  if (self->_shouldCountDown != a3)
  {
    self->_shouldCountDown = a3;
    -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
    if (self->_shouldCountDown)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "px_timerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__handleCountDownTimer_, 0, 1, 1.0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addTimer:forMode:", v20, *MEMORY[0x1E0C99860]);

      -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewLayoutSpec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "upNextCountDownAppearDelay");
      v9 = v8;
      objc_msgSend(v7, "upNextCountDownInitialVisibleValue");
      -[PXStoryRelatedOverlayLayout setCountDownValue:](self, "setCountDownValue:", (uint64_t)(v9 + v10));

    }
    else
    {
      -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "viewLayoutSpec");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "upNextCountdownPlacement");

      switch(v13)
      {
        case 1:
          -[PXStoryRelatedOverlayLayout countDownAlphaAnimator](self, "countDownAlphaAnimator");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "viewLayoutSpec");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "upNextCountDownFadeOutDuration");
          v19 = v18;

          objc_msgSend(v15, "performChangesWithDuration:curve:changes:", 1, &__block_literal_global_284661, v19);
          break;
        case 2:
          -[PXStoryRelatedOverlayLayout _setFirstRelatedLayoutCountdownValue:](self, "_setFirstRelatedLayoutCountdownValue:", 0x7FFFFFFFFFFFFFFFLL);
          break;
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 243, CFSTR("Code which should be unreachable has been reached"));

          abort();
      }
      v20 = 0;
    }
    -[PXStoryRelatedOverlayLayout setCountDownTimer:](self, "setCountDownTimer:", v20);

  }
}

- (void)_handleCountDownTimer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  if (-[PXStoryRelatedOverlayLayout countDownValue](self, "countDownValue", a3) < 1)
  {
    -[PXStoryRelatedOverlayLayout _autoplayUpNext](self, "_autoplayUpNext");
  }
  else
  {
    -[PXStoryRelatedOverlayLayout setCountDownValue:](self, "setCountDownValue:", -[PXStoryRelatedOverlayLayout countDownValue](self, "countDownValue") - 1);
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewLayoutSpec");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (double)-[PXStoryRelatedOverlayLayout countDownValue](self, "countDownValue");
    objc_msgSend(v10, "upNextCountDownInitialVisibleValue");
    if (v6 == v5 && objc_msgSend(v10, "upNextCountdownPlacement") == 1)
    {
      -[PXStoryRelatedOverlayLayout countDownAlphaAnimator](self, "countDownAlphaAnimator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", &__block_literal_global_153_284657, 0.0);

    }
    v8 = (double)-[PXStoryRelatedOverlayLayout countDownValue](self, "countDownValue");
    objc_msgSend(v10, "upNextCountDownInitialVisibleValue");
    if (v9 >= v8 && objc_msgSend(v10, "upNextCountdownPlacement") == 2)
      -[PXStoryRelatedOverlayLayout _setFirstRelatedLayoutCountdownValue:](self, "_setFirstRelatedLayoutCountdownValue:", -[PXStoryRelatedOverlayLayout countDownValue](self, "countDownValue"));

  }
}

- (void)setCountDownTimer:(id)a3
{
  NSTimer *v5;
  NSTimer **p_countDownTimer;
  NSTimer *v7;

  v5 = (NSTimer *)a3;
  p_countDownTimer = &self->_countDownTimer;
  if (*p_countDownTimer != v5)
  {
    v7 = v5;
    -[NSTimer invalidate](*p_countDownTimer, "invalidate");
    objc_storeStrong((id *)p_countDownTimer, a3);
    v5 = v7;
  }

}

- (void)setCountDownValue:(int64_t)a3
{
  if (self->_countDownValue != a3)
  {
    self->_countDownValue = a3;
    -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)_handleNavigationButton:(id)a3
{
  -[PXStoryRelatedOverlayLayout showOrHideFullRelated:](self, "showOrHideFullRelated:", -[PXStoryRelatedOverlayLayout navigationButtonDirection](self, "navigationButtonDirection", a3) == 2);
}

- (void)showOrHideFullRelated:(BOOL)a3
{
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = 0.0;
  if (a3)
  {
    -[PXStoryRelatedOverlayLayout scrollContentLayout](self, "scrollContentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollableOutsets");
    v4 = v6;

  }
  -[PXStoryRelatedOverlayLayout navigationButtonScrollAnimatorTarget](self, "navigationButtonScrollAnimatorTarget");
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    -[PXStoryRelatedOverlayLayout setNavigationButtonScrollAnimatorTarget:](self, "setNavigationButtonScrollAnimatorTarget:", v4);
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performChanges:", &__block_literal_global_154_284656);

    -[PXStoryRelatedOverlayLayout navigationButtonScrollAnimator](self, "navigationButtonScrollAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke_2;
    v11[3] = &unk_1E5145840;
    v11[4] = self;
    objc_msgSend(v8, "performChangesWithoutAnimation:", v11);
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke_3;
    v10[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v10[4] = v4;
    objc_msgSend(v8, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v10, 0.0);

  }
}

- (void)setNavigationButtonDirection:(int64_t)a3
{
  void *v5;
  PXStoryChromeButtonConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  if (self->_navigationButtonDirection != a3)
  {
    self->_navigationButtonDirection = a3;
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewLayoutSpec");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    -[PXStoryChromeButtonConfiguration setBackgroundStyle:](v6, "setBackgroundStyle:", 3);
    -[PXStoryChromeButtonConfiguration setTarget:](v6, "setTarget:", self);
    objc_msgSend(v12, "relatedNavigationButtonSystemImagePointSize");
    -[PXStoryChromeButtonConfiguration setPreferredSystemImagePointSize:](v6, "setPreferredSystemImagePointSize:");
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setTintColor:](v6, "setTintColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.75, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setSolidBackgroundColor:](v6, "setSolidBackgroundColor:", v8);

    -[PXStoryChromeButtonConfiguration setPreferredSystemImageWeight:](v6, "setPreferredSystemImageWeight:", (uint64_t)*MEMORY[0x1E0DC1420]);
    -[PXStoryChromeButtonConfiguration setAction:](v6, "setAction:", sel__handleNavigationButton_);
    objc_msgSend(v12, "relatedNavigationChromeButtonSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setSpec:](v6, "setSpec:", v9);

    if (a3 == 1)
      v10 = CFSTR("chevron.left");
    else
      v10 = CFSTR("chevron.right");
    -[PXStoryChromeButtonConfiguration setSystemImageName:](v6, "setSystemImageName:", v10);
    -[PXStoryChromeButtonConfiguration setBackgroundColorAdaptsToHoveredState:](v6, "setBackgroundColorAdaptsToHoveredState:", 0);
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryButtonAccessibilityLabelRelatedNavigation"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeButtonConfiguration setAxLabel:](v6, "setAxLabel:", v11);

    -[PXStoryRelatedOverlayLayout setNavigationButtonConfiguration:](self, "setNavigationButtonConfiguration:", v6);
    -[PXStoryRelatedOverlayLayout setNavigationButtonVersion:](self, "setNavigationButtonVersion:", -[PXStoryRelatedOverlayLayout navigationButtonVersion](self, "navigationButtonVersion") + 1);
    -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");

  }
}

- (void)setWantsNavigationButton:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  BOOL v11;

  if (self->_wantsNavigationButton != a3)
  {
    self->_wantsNavigationButton = a3;
    -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewLayoutSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relatedNavigationButtonFadeDuration");
    v8 = v7;

    -[PXStoryRelatedOverlayLayout navigationButtonAlphaAnimator](self, "navigationButtonAlphaAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__PXStoryRelatedOverlayLayout_setWantsNavigationButton___block_invoke;
    v10[3] = &__block_descriptor_33_e35_v16__0___PXMutableNumberAnimator__8l;
    v11 = a3;
    objc_msgSend(v9, "performChangesWithDuration:curve:changes:", 1, v10, v8);

  }
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (void)_createRelatedAnimationIfNeeded
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewLayoutSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "upNextAnimationStyle") != 1)
  {
LABEL_7:

    v6 = v11;
    goto LABEL_8;
  }
  v5 = objc_msgSend(v11, "shouldSimplifyUIForAccessibility");

  v6 = v11;
  if ((v5 & 1) == 0)
  {
    v7 = objc_msgSend(v11, "selectedRelatedIndex");
    v6 = v11;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", -[PXStoryRelatedOverlayLayout _sublayoutIndexForRelatedIndex:](self, "_sublayoutIndexForRelatedIndex:"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v8;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sublayout != nil"));

        v8 = 0;
      }
      v9 = PXStoryRelatedAnimationCreate(v8);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)_considerChangingToSelectedRelatedMemory
{
  void *v3;
  void *v4;
  int64_t selectedIndex;
  int64_t v6;
  _QWORD v7[5];

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewLayoutSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "upNextAnimationStyle") == 2
    && (objc_msgSend(v3, "isPerformingCrossfadeTransitionToRelated") & 1) == 0)
  {
    selectedIndex = self->_selectedIndex;

    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = self->_selectedIndex;
      self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __71__PXStoryRelatedOverlayLayout__considerChangingToSelectedRelatedMemory__block_invoke;
      v7[3] = &__block_descriptor_40_e35_v16__0___PXStoryMutableViewModel__8l;
      v7[4] = v6;
      objc_msgSend(v3, "performChanges:", v7);
    }
  }
  else
  {

  }
}

- (void)_autoplayUpNext
{
  id v2;

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_171_284642);

}

- (int64_t)relatedCardOverlayStartIndex
{
  return self->_relatedSelectionSpriteIndexRange.location;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXStoryRelatedOverlayLayout.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryRelatedOverlayLayout _updateRelatedSpritesAndSublayouts](self, "_updateRelatedSpritesAndSublayouts");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXStoryRelatedOverlayLayout.m"), 416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryRelatedOverlayLayout _updateScrollSpritesAndSublayouts](self, "_updateScrollSpritesAndSublayouts");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryRelatedOverlayLayout.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryRelatedOverlayLayout _updateSublayoutPositions](self, "_updateSublayoutPositions");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXStoryRelatedOverlayLayout.m"), 422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryRelatedOverlayLayout _updateShouldCountDown](self, "_updateShouldCountDown");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXStoryRelatedOverlayLayout.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryRelatedOverlayLayout _updateNavigationButton](self, "_updateNavigationButton");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXStoryRelatedOverlayLayout.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v9 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXStoryRelatedOverlayLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXStoryRelatedOverlayLayout.m"), 431, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v10 & 0x40) != 0)
    {
      p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXStoryRelatedOverlayLayout _updateAXGroupRole](self, "_updateAXGroupRole");
      v10 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout update]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXStoryRelatedOverlayLayout.m"), 434, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v27.receiver = self;
  v27.super_class = (Class)PXStoryRelatedOverlayLayout;
  -[PXGCompositeLayout update](&v27, sel_update);
}

- (void)_invalidateRelatedSpritesAndSublayouts
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout _invalidateRelatedSpritesAndSublayouts]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryRelatedOverlayLayout.m"), 439, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateRelatedSpritesAndSublayouts
{
  void *v3;
  void *v4;
  uint64_t v5;
  _PXGSpriteIndexRange relatedSelectionSpriteIndexRange;
  NSUInteger location;
  NSUInteger length;
  int64_t scrollSublayoutIndex;

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relatedModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  relatedSelectionSpriteIndexRange = self->_relatedSelectionSpriteIndexRange;
  self->_relatedSelectionSpriteIndexRange.length = v5;
  -[PXGLayout removeSpritesInRange:](self, "removeSpritesInRange:", relatedSelectionSpriteIndexRange);
  -[PXGLayout addSpritesInRange:initialState:](self, "addSpritesInRange:initialState:", *(_QWORD *)&self->_relatedSelectionSpriteIndexRange, 0);
  location = self->_relatedSublayoutIndexRange.location;
  length = self->_relatedSublayoutIndexRange.length;
  self->_relatedSublayoutIndexRange.length = v5;
  -[PXGAbsoluteCompositeLayout removeSublayoutsInRange:](self, "removeSublayoutsInRange:", location, length);
  -[PXGAbsoluteCompositeLayout insertSublayoutProvider:inRange:](self, "insertSublayoutProvider:inRange:", self, self->_relatedSublayoutIndexRange.location, self->_relatedSublayoutIndexRange.length);
  scrollSublayoutIndex = self->_scrollSublayoutIndex;
  if (scrollSublayoutIndex != 0x7FFFFFFFFFFFFFFFLL)
    self->_scrollSublayoutIndex = scrollSublayoutIndex - length + self->_relatedSublayoutIndexRange.length;
  -[PXStoryRelatedOverlayLayout _invalidateScrollSpritesAndSublayouts](self, "_invalidateScrollSpritesAndSublayouts");
  -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
  -[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
  -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
}

- (void)_invalidateScrollSpritesAndSublayouts
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout _invalidateScrollSpritesAndSublayouts]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryRelatedOverlayLayout.m"), 465, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateScrollSpritesAndSublayouts
{
  void *v3;
  int v4;
  int64_t scrollSublayoutIndex;
  PXStoryScrollContentLayout *v6;
  PXStoryScrollContentLayout *scrollContentLayout;
  PXGScrollLayout *v8;
  PXGScrollLayout *scrollLayout;

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsRelatedOverlayScrollable");

  scrollSublayoutIndex = self->_scrollSublayoutIndex;
  if (v4)
  {
    if (scrollSublayoutIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_scrollSublayoutIndex = self->_relatedSublayoutIndexRange.length
                                  + self->_relatedSublayoutIndexRange.location;
      v6 = objc_alloc_init(PXStoryScrollContentLayout);
      scrollContentLayout = self->_scrollContentLayout;
      self->_scrollContentLayout = v6;

      -[PXStoryScrollContentLayout setDelegate:](self->_scrollContentLayout, "setDelegate:", self);
      v8 = -[PXGScrollLayout initWithContentLayout:]([PXGScrollLayout alloc], "initWithContentLayout:", self->_scrollContentLayout);
      scrollLayout = self->_scrollLayout;
      self->_scrollLayout = v8;

      -[PXGScrollLayout setDelegate:](self->_scrollLayout, "setDelegate:", self);
      -[PXGScrollLayout setScrollDecelerationRate:](self->_scrollLayout, "setScrollDecelerationRate:", 1);
      -[PXGAbsoluteCompositeLayout insertSublayoutProvider:inRange:](self, "insertSublayoutProvider:inRange:", self, self->_scrollSublayoutIndex, 1);
    }
  }
  else if (scrollSublayoutIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXGLayout removeSublayoutAtIndex:](self, "removeSublayoutAtIndex:");
    self->_scrollSublayoutIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
}

- (void)_invalidateSublayoutPositions
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXStoryRelatedOverlayLayout.m"), 495, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_7:
  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSublayoutPositions
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  NSUInteger length;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  float v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double v32;
  BOOL shouldIgnoreContentScrollOffsetChanges;
  void *v34;
  double v35;
  int64_t capacity;
  uint64_t v37;

  v37 = 0;
  -[PXGLayout contentSize](self, "contentSize");
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v35 = *MEMORY[0x1E0C9D538];
  PXRectWithOriginAndSize();
  -[PXStoryRelatedOverlayLayout _arrangeSublayoutAtIndex:frame:zIndex:](self, "_arrangeSublayoutAtIndex:frame:zIndex:", self->_scrollSublayoutIndex, &v37);
  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relatedOverlayVisibilityFraction");
  v6 = v5;
  -[PXStoryRelatedOverlayLayout scrollContentLayout](self, "scrollContentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollOffset");
  v9 = v8;
  v11 = v10;
  -[PXStoryRelatedOverlayLayout navigationButtonScrollAnimator](self, "navigationButtonScrollAnimator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isAnimating");

  if ((v13 & 1) != 0
    || -[PXStoryRelatedOverlayLayout wasAnimatingScrollOffsetForNavigation](self, "wasAnimatingScrollOffsetForNavigation"))
  {
    -[PXStoryRelatedOverlayLayout navigationButtonScrollAnimator](self, "navigationButtonScrollAnimator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationValue");
    v9 = v15;

  }
  length = self->_relatedSublayoutIndexRange.length;
  capacity = self->_capacity;
  _PXGArrayCapacityResizeToCount();
  self->_capacity = capacity;
  objc_msgSend(v4, "viewLayoutSpec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "relatedLayoutMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  -[PXGLayout referenceSize](self, "referenceSize");
  objc_msgSend(v19, "setReferenceSize:");
  objc_msgSend(v19, "setScrollOffset:", v9, v11);
  objc_msgSend(v19, "setOffscreenFraction:", 1.0 - v6);
  objc_msgSend(v19, "setUserInterfaceDirection:", -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection"));
  -[PXStoryRelatedOverlayLayout layoutGenerator](self, "layoutGenerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMetrics:", v19);
  objc_msgSend(v20, "setItemCount:", length);
  objc_msgSend(v20, "getFrames:forItemsInRange:", self->_relatedDefaultFrames, 0, length);
  if (self->_relatedSublayoutIndexRange.length)
  {
    v21 = 0;
    v22 = 0;
    do
    {
      -[PXStoryRelatedOverlayLayout _arrangeSublayoutAtIndex:frame:zIndex:](self, "_arrangeSublayoutAtIndex:frame:zIndex:", v22 + self->_relatedSublayoutIndexRange.location, &v37, self->_relatedDefaultFrames[v21].origin.x, self->_relatedDefaultFrames[v21].origin.y, self->_relatedDefaultFrames[v21].size.width, self->_relatedDefaultFrames[v21].size.height);
      ++v22;
      ++v21;
    }
    while (v22 < self->_relatedSublayoutIndexRange.length);
  }
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v24 = v23 * 0.5;
  -[PXStoryRelatedOverlayLayout scrollLayout](self, "scrollLayout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v26 = v24;
  objc_msgSend(v25, "setScrollViewSpriteZPosition:", v26);

  -[PXStoryRelatedOverlayLayout setIsRelatedOverlayScrolledIntoView:](self, "setIsRelatedOverlayScrolledIntoView:", objc_msgSend(v20, "isContentScrolledIntoView"));
  objc_msgSend(v20, "scrollableOutsets");
  v28 = v27;
  v30 = v29;
  if ((v13 & 1) != 0
    || -[PXStoryRelatedOverlayLayout wasAnimatingScrollOffsetForNavigation](self, "wasAnimatingScrollOffsetForNavigation"))
  {
    v31 = v13 ^ 1;
    -[PXStoryRelatedOverlayLayout setWasAnimatingScrollOffsetForNavigation:](self, "setWasAnimatingScrollOffsetForNavigation:", v13);
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v7, "scrollableOutsets");
  if (PXEdgeInsetsEqualToEdgeInsets())
  {
    if (v6 != 0.0)
    {
      if (!v31)
        goto LABEL_19;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  objc_msgSend(v20, "scrollableOutsets");
  objc_msgSend(v7, "setScrollableOutsets:");
  if (v6 == 0.0)
  {
LABEL_16:
    v9 = v35;
    v11 = v3;
    if (-[PXStoryRelatedOverlayLayout _needsRTLFlip](self, "_needsRTLFlip"))
    {
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
      v9 = v28 + v30 + v32;
      v11 = 0.0;
    }
  }
LABEL_18:
  shouldIgnoreContentScrollOffsetChanges = self->_shouldIgnoreContentScrollOffsetChanges;
  self->_shouldIgnoreContentScrollOffsetChanges = 1;
  objc_msgSend(v7, "setScrollOffset:", v9, v11);
  self->_shouldIgnoreContentScrollOffsetChanges = shouldIgnoreContentScrollOffsetChanges;
LABEL_19:
  -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
  -[PXGLayout axGroup](self, "axGroup");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "invalidateVisibility");

}

- (void)_arrangeSublayoutAtIndex:(int64_t)a3 frame:(CGRect)a4 zIndex:(int64_t *)a5
{
  double height;
  double width;
  double y;
  double x;
  int64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v11 = (*a5)++;
    v12 = -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts");
    -[PXGLayout referenceDepth](self, "referenceDepth");
    v14 = v13 / (double)v12;
    -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", a3, x, y, width, height);
    -[PXGAbsoluteCompositeLayout setZPosition:forSublayoutAtIndex:](self, "setZPosition:forSublayoutAtIndex:", a3, v14 * (double)-v11);
    -[PXGAbsoluteCompositeLayout setReferenceDepth:forSublayoutAtIndex:](self, "setReferenceDepth:forSublayoutAtIndex:", a3, v14);
  }
}

- (void)_invalidateShouldCountDown
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout _invalidateShouldCountDown]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXStoryRelatedOverlayLayout.m"), 586, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_7:
  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateShouldCountDown
{
  void *v3;
  id v4;

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldCountDownToUpNext") && (objc_msgSend(v4, "isActive") & 1) != 0)
  {
    objc_msgSend(v4, "relatedConfigurations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRelatedOverlayLayout setShouldCountDown:](self, "setShouldCountDown:", objc_msgSend(v3, "count") != 0);

  }
  else
  {
    -[PXStoryRelatedOverlayLayout setShouldCountDown:](self, "setShouldCountDown:", 0);
  }

}

- (void)_invalidateNavigationButton
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout _invalidateNavigationButton]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryRelatedOverlayLayout.m"), 598, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateNavigationButton
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canShowRelatedNavigationButton");
  v5 = v4;

  if (v5 != 0.0)
  {
    if (objc_msgSend(v8, "wantsRelatedOverlayNavigationButtonsVisible")
      && (objc_msgSend(v8, "isActive") & 1) != 0)
    {
      objc_msgSend(v8, "relatedConfigurations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryRelatedOverlayLayout setWantsNavigationButton:](self, "setWantsNavigationButton:", objc_msgSend(v6, "count") != 0);

    }
    else
    {
      -[PXStoryRelatedOverlayLayout setWantsNavigationButton:](self, "setWantsNavigationButton:", 0);
    }
    if (objc_msgSend(v8, "isRelatedOverlayScrolledIntoView"))
      v7 = 1;
    else
      v7 = 2;
    -[PXStoryRelatedOverlayLayout setNavigationButtonDirection:](self, "setNavigationButtonDirection:", v7);
  }

}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout _invalidateContent]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXStoryRelatedOverlayLayout.m"), 611, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 16;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_7:
  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateTitleContent
{
  ++self->_titleVersion;
  -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
}

- (BOOL)_needsRTLFlip
{
  return 0;
}

- (void)_updateContent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[11];
  float v22;

  -[PXGLayout contentSize](self, "contentSize");
  PXRectWithOriginAndSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGLayout alpha](self, "alpha");
  v12 = v11;
  -[PXGLayout displayScale](self, "displayScale");
  v14 = v13;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v16 = v15;
  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "wantsRelatedOverlayVisible"))
    v12 = 0.0;

  v18 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __45__PXStoryRelatedOverlayLayout__updateContent__block_invoke;
  v21[3] = &unk_1E51454B8;
  v21[4] = self;
  v21[5] = v4;
  v21[6] = v6;
  v21[7] = v8;
  v21[8] = v10;
  v22 = v14;
  v21[9] = v16;
  *(double *)&v21[10] = v12;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v18 << 32, v21);
  -[PXStoryRelatedOverlayLayout scrollLayout](self, "scrollLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", v12);

  -[PXGLayout axGroup](self, "axGroup");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateIfNeeded");

}

- (void)_invalidateAXGroupRole
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryRelatedOverlayLayout _invalidateAXGroupRole]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryRelatedOverlayLayout.m"), 736, CFSTR("invalidating %lu after it already has been updated"), 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 64;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (id)axLocalizedLabel
{
  return PXLocalizedStringFromTable(CFSTR("InteractiveMemoryUpNextTitle"), CFSTR("PhotosUICore"));
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_titleSpriteIndex == a3)
  {
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewLayoutSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relatedAttributedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (self->_countDownSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 771, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v10 = 0;
  }

  return v10;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  int64_t v8;
  void *v10;

  v7 = a4;
  if (self->_titleSpriteIndex == a3)
  {
    v8 = 1;
  }
  else
  {
    if (self->_countDownSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 781, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v8 = 0;
  }

  return v8;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a4;
  if (self->_countDownSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 789, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewLayoutSpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "upNextCountDownFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXStoryRelatedOverlayLayout countDownValue](self, "countDownValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a4;
  if (self->_countDownSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 797, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewLayoutSpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "upNextCountDownAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a4;
  if (self->_countDownDecorationSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 807, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewLayoutSpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "upNextCountDownDecorationImageConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_navigationButtonSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 817, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_navigationButtonSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 824, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXStoryRelatedOverlayLayout navigationButtonConfiguration](self, "navigationButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  int64_t v11;
  void *v12;
  CGRect *v13;
  double v14;
  double v15;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = -[PXStoryRelatedOverlayLayout _relatedIndexForSublayoutIndex:](self, "_relatedIndexForSublayoutIndex:", a4);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_scrollSublayoutIndex != a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 836, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  else
  {
    v13 = &self->_relatedDefaultFrames[v11];
    width = v13->size.width;
    height = v13->size.height;
  }

  v14 = width;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  id v7;
  int64_t v8;
  PXStoryLayout *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = -[PXStoryRelatedOverlayLayout _relatedIndexForSublayoutIndex:](self, "_relatedIndexForSublayoutIndex:", a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_scrollSublayoutIndex != a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 852, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXStoryRelatedOverlayLayout scrollLayout](self, "scrollLayout");
    v9 = (PXStoryLayout *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "relatedModels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[PXStoryLayout initWithModel:]([PXStoryLayout alloc], "initWithModel:", v13);
  }

  return v9;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (int64_t)_relatedIndexForSublayoutIndex:(int64_t)a3
{
  NSUInteger location;

  location = self->_relatedSublayoutIndexRange.location;
  if (a3 - location < self->_relatedSublayoutIndexRange.length && a3 >= location)
    return a3 - location;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_sublayoutIndexForRelatedIndex:(int64_t)a3
{
  void *v7;

  if (a3 < 0 || self->_relatedSublayoutIndexRange.length <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relatedIndex >= 0 && relatedIndex < _relatedSublayoutIndexRange.length"));

  }
  return self->_relatedSublayoutIndexRange.location + a3;
}

- (int64_t)_sublayoutIndexForFirstRelated
{
  if (self->_relatedSublayoutIndexRange.length)
    return -[PXStoryRelatedOverlayLayout _sublayoutIndexForRelatedIndex:](self, "_sublayoutIndexForRelatedIndex:", 0);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_firstRelatedSublayout
{
  int64_t v3;
  void *v4;

  v3 = -[PXStoryRelatedOverlayLayout _sublayoutIndexForFirstRelated](self, "_sublayoutIndexForFirstRelated");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v10;
  id v11;

  v11 = a3;
  if ((void *)ViewModelObservationContext_284613 == a5)
  {
    if ((a4 & 0x100) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateRelatedSpritesAndSublayouts](self, "_invalidateRelatedSpritesAndSublayouts");
    if ((a4 & 0x8100) != 0)
    {
      -[PXStoryRelatedOverlayLayout _invalidateScrollSpritesAndSublayouts](self, "_invalidateScrollSpritesAndSublayouts");
      -[PXStoryRelatedOverlayLayout _invalidateAXGroupRole](self, "_invalidateAXGroupRole");
    }
    if ((a4 & 0x8000) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
    if ((a4 & 0x20) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateTitleContent](self, "_invalidateTitleContent");
    if ((a4 & 0x10020) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
    if ((a4 & 0x10000201) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateShouldCountDown](self, "_invalidateShouldCountDown");
    if ((a4 & 0x20000000000000) != 0)
      -[PXStoryRelatedOverlayLayout _considerChangingToSelectedRelatedMemory](self, "_considerChangingToSelectedRelatedMemory");
    if ((a4 & 0x20000000000) != 0)
      -[PXStoryRelatedOverlayLayout _createRelatedAnimationIfNeeded](self, "_createRelatedAnimationIfNeeded");
    if ((a4 & 0x40000008000201) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateNavigationButton](self, "_invalidateNavigationButton");
  }
  else if ((void *)CountDownAlphaAnimatorObservationContext == a5
         || NavigationButtonAlphaAnimatorObservationContext == (_QWORD)a5)
  {
    if ((a4 & 2) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateContent](self, "_invalidateContent");
  }
  else
  {
    if ((void *)NavigationButtonScrollAnimatorObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRelatedOverlayLayout.m"), 932, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 6) != 0)
      -[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions");
  }

}

- (void)scrollContentLayoutScrollOffsetDidChange:(id)a3
{
  if (!self->_shouldIgnoreContentScrollOffsetChanges)
    -[PXStoryRelatedOverlayLayout _invalidateSublayoutPositions](self, "_invalidateSublayoutPositions", a3);
}

- (void)scrollLayoutWillBeginScrolling:(id)a3
{
  id v3;

  -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_193_284612);

}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y;
  double x;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  char v19;
  double v20;
  double v21;

  y = a4.y;
  x = a4.x;
  -[PXStoryRelatedOverlayLayout scrollContentLayout](self, "scrollContentLayout", a3, a4.x, a4.y, a6.x, a6.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollOffsetForScrollViewContentOffset:", a5->x, a5->y);
  v20 = v11;
  v21 = v12;
  v19 = 0;
  -[PXStoryRelatedOverlayLayout layoutGenerator](self, "layoutGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollOffset");
  objc_msgSend(v13, "adjustTargetScrollOffset:forVelocity:currentScrollOffset:shouldHideContent:", &v20, &v19, x, y, v14, v15);

  if (v19)
  {
    -[PXStoryRelatedOverlayLayout viewModel](self, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "performChanges:", &__block_literal_global_194_284611);

  }
  objc_msgSend(v10, "scrollViewContentOffsetForScrollOffset:", v20, v21);
  a5->x = v17;
  a5->y = v18;
  -[PXStoryRelatedOverlayLayout setNavigationButtonScrollAnimatorTarget:](self, "setNavigationButtonScrollAnimatorTarget:", v20);

}

- (id)axSpriteIndexes
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v3, "addIndex:", self->_titleSpriteIndex);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)preferredFocusLayouts
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXStoryRelatedOverlayLayout _firstRelatedSublayout](self, "_firstRelatedSublayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 != 1)
    goto LABEL_5;
  PXGAXGetElementForUserInfo(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    -[PXGLayout axNextResponder](self, "axNextResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "axGroup:didRequestToPerformAction:userInfo:", v8, a4, v10);
    goto LABEL_6;
  }
  -[PXStoryRelatedOverlayLayout _selectRelatedMemoryAtIndex:](self, "_selectRelatedMemoryAtIndex:", objc_msgSend(v11, "spriteIndex") - self->_relatedSelectionSpriteIndexRange.location);
  v12 = 1;
LABEL_6:

  return v12;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (_PXGSpriteIndexRange)relatedSelectionSpriteIndexRange
{
  return self->_relatedSelectionSpriteIndexRange;
}

- (PXStoryRelatedLayoutGenerator)layoutGenerator
{
  return self->_layoutGenerator;
}

- (PXStoryScrollContentLayout)scrollContentLayout
{
  return self->_scrollContentLayout;
}

- (PXGScrollLayout)scrollLayout
{
  return self->_scrollLayout;
}

- (PXNumberAnimator)countDownAlphaAnimator
{
  return self->_countDownAlphaAnimator;
}

- (BOOL)isRelatedOverlayScrolledIntoView
{
  return self->_isRelatedOverlayScrolledIntoView;
}

- (BOOL)shouldCountDown
{
  return self->_shouldCountDown;
}

- (NSTimer)countDownTimer
{
  return self->_countDownTimer;
}

- (int64_t)countDownValue
{
  return self->_countDownValue;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (PXNumberAnimator)navigationButtonAlphaAnimator
{
  return self->_navigationButtonAlphaAnimator;
}

- (BOOL)wantsNavigationButton
{
  return self->_wantsNavigationButton;
}

- (int64_t)navigationButtonDirection
{
  return self->_navigationButtonDirection;
}

- (PXStoryChromeButtonConfiguration)navigationButtonConfiguration
{
  return self->_navigationButtonConfiguration;
}

- (void)setNavigationButtonConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (int64_t)navigationButtonVersion
{
  return self->_navigationButtonVersion;
}

- (void)setNavigationButtonVersion:(int64_t)a3
{
  self->_navigationButtonVersion = a3;
}

- (BOOL)wasAnimatingScrollOffsetForNavigation
{
  return self->_wasAnimatingScrollOffsetForNavigation;
}

- (void)setWasAnimatingScrollOffsetForNavigation:(BOOL)a3
{
  self->_wasAnimatingScrollOffsetForNavigation = a3;
}

- (PXNumberAnimator)navigationButtonScrollAnimator
{
  return self->_navigationButtonScrollAnimator;
}

- (double)navigationButtonScrollAnimatorTarget
{
  return self->_navigationButtonScrollAnimatorTarget;
}

- (void)setNavigationButtonScrollAnimatorTarget:(double)a3
{
  self->_navigationButtonScrollAnimatorTarget = a3;
}

- (PXStoryRelatedOverlayItemDecorationSource)decorationSource
{
  return self->_decorationSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationSource, 0);
  objc_storeStrong((id *)&self->_navigationButtonScrollAnimator, 0);
  objc_storeStrong((id *)&self->_navigationButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_navigationButtonAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_countDownTimer, 0);
  objc_storeStrong((id *)&self->_countDownAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_scrollLayout, 0);
  objc_storeStrong((id *)&self->_scrollContentLayout, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __114__PXStoryRelatedOverlayLayout_scrollLayoutWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsRelatedOverlayVisible:", 0);
}

uint64_t __62__PXStoryRelatedOverlayLayout_scrollLayoutWillBeginScrolling___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldCountDownToUpNext:", 0);
}

void __45__PXStoryRelatedOverlayLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double MinX;
  double v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  double MaxX;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double MinY;
  double v35;
  CGFloat v36;
  float32x2_t *v37;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v41;
  _OWORD *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  uint64_t v64;
  CGFloat v65;
  CGFloat v66;
  uint64_t v67;
  float v68;
  float v69;
  CGFloat v70;
  CGFloat v71;
  __int128 v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  float64x2_t v77;
  _OWORD *v78;
  void *v79;
  double v80;
  uint64_t v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  float32x2_t *v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  float64x2_t v89;
  _OWORD *v90;
  uint64_t v91;
  double v92;
  CGFloat v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  float32x2_t *v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  float64x2_t v106;
  _OWORD *v107;
  void *v108;
  double v109;
  uint64_t v110;
  float32x2_t *v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  float64x2_t v115;
  _OWORD *v116;
  uint64_t v117;
  _DWORD *v118;
  int *v119;
  uint64_t v120;
  unint64_t v121;
  float v122;
  double v123;
  void *v124;
  void *v125;
  int *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  int32x2_t v133;
  uint64_t v134;
  uint64_t v135;
  CGFloat *v136;
  CGFloat v137;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  float64x2_t v144;
  uint64_t v145;
  uint64_t v146;
  __int128 v147;
  CGFloat v148;
  CGFloat v149;
  double v150;
  CGFloat v151;
  CGFloat v152;
  CGFloat rect;
  CGFloat v154;
  CGFloat v155;
  id v156;
  CGFloat v157;
  int v158;
  double v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat v173;
  CGFloat Width;
  CGFloat v175;
  CGFloat v176;
  CGFloat v177;
  int32x2_t v178;
  CGFloat v179;
  CGFloat v180;
  CGFloat v181;
  uint64_t v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;

  v8 = a1;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewLayoutSpec");
  v156 = (id)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(v8 + 32);
  v11 = 1112;
  if (*(_DWORD *)(v10 + 1116))
    v12 = *(CGFloat **)(v10 + 1088);
  else
    v12 = (CGFloat *)off_1E50B86D0;
  v14 = *v12;
  v13 = v12[1];
  v15 = v12[2];
  v16 = v12[3];
  objc_msgSend(v156, "relatedTitleSize");
  v179 = v17;
  v19 = v18;
  v183.origin.x = v14;
  v183.origin.y = v13;
  v20 = v15;
  v183.size.width = v15;
  v183.size.height = v16;
  MinX = CGRectGetMinX(v183);
  v22 = CGRectGetMinX(*(CGRect *)(v8 + 40));
  objc_msgSend(v156, "relatedLayoutMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "margins");
  v25 = v22 + v24;

  if (MinX >= v25)
    v26 = MinX;
  else
    v26 = v25;
  if (objc_msgSend(*(id *)(v8 + 32), "_needsRTLFlip"))
  {
    v184.origin.x = v14;
    v184.origin.y = v13;
    v184.size.width = v20;
    v184.size.height = v16;
    MaxX = CGRectGetMaxX(v184);
    v185.origin.x = v26;
    v185.origin.y = v13;
    v185.size.width = v179;
    v185.size.height = v19;
    v28 = MaxX - CGRectGetWidth(v185);
    v29 = CGRectGetMaxX(*(CGRect *)(v8 + 40));
    v186.origin.x = v26;
    v186.origin.y = v13;
    v186.size.width = v179;
    v186.size.height = v19;
    v30 = v29 - CGRectGetWidth(v186);
    objc_msgSend(v156, "relatedLayoutMetrics");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "margins");
    v33 = v30 - v32;

    if (v28 >= v33)
      v26 = v33;
    else
      v26 = v28;
  }
  v171 = v14;
  v187.origin.x = v14;
  v187.origin.y = v13;
  v187.size.width = v20;
  v187.size.height = v16;
  MinY = CGRectGetMinY(v187);
  objc_msgSend(v156, "spacingBetweenRelatedTitleAndMainRelated");
  v36 = MinY - v35 - v19;
  v37 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1028));
  v188.origin.x = v26;
  v188.origin.y = v36;
  v188.size.width = v179;
  v188.size.height = v19;
  MidX = CGRectGetMidX(v188);
  v189.origin.x = v26;
  v189.origin.y = v36;
  v189.size.width = v179;
  v189.size.height = v19;
  v177 = v13;
  MidY = CGRectGetMidY(v189);
  v190.origin.x = v26;
  v190.origin.y = v36;
  v190.size.width = v179;
  v190.size.height = v19;
  Width = CGRectGetWidth(v190);
  v191.origin.x = v26;
  v155 = v36;
  v191.origin.y = v36;
  v191.size.width = v179;
  v157 = v19;
  v191.size.height = v19;
  Height = CGRectGetHeight(v191);
  v41.f64[0] = Width;
  v41.f64[1] = Height;
  *(CGFloat *)v37 = MidX;
  *(CGFloat *)&v37[1] = MidY;
  v37[2] = 0;
  v37[3] = vcvt_f32_f64(v41);
  v42 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1028));
  v43 = *((_OWORD *)off_1E50B83A0 + 1);
  v170 = *(_OWORD *)off_1E50B83A0;
  *v42 = *(_OWORD *)off_1E50B83A0;
  v42[1] = v43;
  v168 = *((_OWORD *)off_1E50B83A0 + 5);
  v169 = v43;
  v44 = *((_OWORD *)off_1E50B83A0 + 4);
  v42[4] = v44;
  v42[5] = v168;
  v166 = *((_OWORD *)off_1E50B83A0 + 3);
  v167 = v44;
  v45 = *((_OWORD *)off_1E50B83A0 + 2);
  v42[2] = v45;
  v42[3] = v166;
  v164 = *((_OWORD *)off_1E50B83A0 + 9);
  v165 = v45;
  v46 = *((_OWORD *)off_1E50B83A0 + 8);
  v42[8] = v46;
  v42[9] = v164;
  v162 = *((_OWORD *)off_1E50B83A0 + 7);
  v163 = v46;
  v161 = *((_OWORD *)off_1E50B83A0 + 6);
  v42[6] = v161;
  v42[7] = v162;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1028) + 1) = 3;
  v47 = *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1028);
  *(float32x2_t *)(a5 + 40 * v47 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v47 + 24), *(float *)(v8 + 88));
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1028) + 32) = *(_WORD *)(*(_QWORD *)(v8 + 32)
                                                                                           + 1032);
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1028) + 24) = 0x20000;
  objc_msgSend(v156, "canShowRelatedNavigationButton");
  if (v48 == 0.0)
  {
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044) + 1) = 0;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1048) + 1) = 0;
  }
  else
  {
    objc_msgSend(v156, "spacingBetweenRelatedNavigationButtonAndRelated");
    v150 = v49;
    objc_msgSend(v156, "relatedNavigationButtonSize");
    v51 = v50;
    v154 = v16;
    PXRectGetCenter();
    v159 = v26;
    PXRectWithCenterAndSize();
    v53 = v52;
    v149 = v52;
    v148 = v54;
    v175 = v55;
    v192.origin.x = v171;
    v192.origin.y = v177;
    v192.size.width = v20;
    v192.size.height = v16;
    v56 = CGRectGetMinX(v192) - v150 - v51;
    PXRectWithCenterAndSize();
    v58 = v57;
    v172 = v57;
    v60 = v59;
    v152 = v61;
    rect = v59;
    v62 = v61;
    v63 = CGRectGetMaxX(*(CGRect *)(v8 + 40)) - v150 - v51;
    v151 = v63;
    v64 = objc_msgSend(*(id *)(v8 + 32), "navigationButtonDirection");
    if (v64 == 1)
    {
      v63 = v56;
      v65 = v53;
    }
    else
    {
      v65 = v58;
    }
    if (v64 == 1)
      v66 = v148;
    else
      v66 = v60;
    if (v64 == 1)
      v62 = v175;
    v67 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044);
    v68 = *(double *)(v8 + 72);
    v69 = -v68;
    v193.origin.x = v63;
    v193.origin.y = v65;
    v193.size.width = v66;
    v193.size.height = v62;
    v70 = CGRectGetMidX(v193);
    v194.origin.x = v63;
    v194.origin.y = v65;
    v194.size.width = v66;
    v194.size.height = v62;
    v71 = CGRectGetMidY(v194);
    v195.origin.x = v63;
    v195.origin.y = v65;
    v195.size.width = v66;
    v195.size.height = v62;
    *(double *)&v72 = CGRectGetWidth(v195);
    v147 = v72;
    *(double *)&v72 = v63;
    v73 = v65;
    v74 = v66;
    v75 = v62;
    v76 = CGRectGetHeight(*(CGRect *)&v72);
    *(_QWORD *)&v77.f64[0] = v147;
    v77.f64[1] = v76;
    *(CGFloat *)v67 = v70;
    *(CGFloat *)(v67 + 8) = v71;
    *(double *)(v67 + 16) = v69;
    *(float32x2_t *)(v67 + 24) = vcvt_f32_f64(v77);
    v78 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044));
    v78[6] = v161;
    v78[7] = v162;
    v78[8] = v163;
    v78[9] = v164;
    v78[2] = v165;
    v78[3] = v166;
    v78[4] = v167;
    v78[5] = v168;
    *v78 = v170;
    v78[1] = v169;
    objc_msgSend(*(id *)(v8 + 32), "navigationButtonAlphaAnimator");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "presentationValue");
    *(float *)&v80 = v80 * *(double *)(v8 + 80);
    *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044)) = LODWORD(v80);

    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044) + 1) = 10;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044)) = 1;
    v81 = *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044);
    *(float32x2_t *)(a5 + 40 * v81 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v81 + 24), *(float *)(v8 + 88));
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044) + 32) = objc_msgSend(*(id *)(v8 + 32), "navigationButtonVersion");
    *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1044) + 24) = 0x20000;
    v196.origin.x = v56;
    v196.origin.y = v149;
    v196.size.width = v148;
    v196.size.height = v175;
    v82 = CGRectGetMinX(v196);
    v197.origin.x = v151;
    v197.size.height = v152;
    v197.origin.y = v172;
    v197.size.width = rect;
    v83 = CGRectGetMaxX(v197);
    v198.origin.x = v56;
    v198.origin.y = v149;
    v198.size.width = v148;
    v198.size.height = v175;
    v84 = v83 - CGRectGetMinX(v198);
    v85 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1048));
    v199.origin.x = v82;
    v199.origin.y = v177;
    v199.size.width = v84;
    v199.size.height = v154;
    v86 = CGRectGetMidX(v199);
    v200.origin.x = v82;
    v200.origin.y = v177;
    v200.size.width = v84;
    v200.size.height = v154;
    v87 = CGRectGetMidY(v200);
    v201.origin.x = v82;
    v201.origin.y = v177;
    v201.size.width = v84;
    v201.size.height = v154;
    v176 = CGRectGetWidth(v201);
    v202.origin.x = v82;
    v202.origin.y = v177;
    v202.size.width = v84;
    v202.size.height = v154;
    v88 = CGRectGetHeight(v202);
    v89.f64[0] = v176;
    v89.f64[1] = v88;
    *(CGFloat *)v85 = v86;
    *(CGFloat *)&v85[1] = v87;
    v26 = v159;
    v85[2] = 0;
    v85[3] = vcvt_f32_f64(v89);
    v90 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1048));
    v90[6] = v161;
    v90[7] = v162;
    v90[8] = v163;
    v90[9] = v164;
    v90[2] = v165;
    v90[3] = v166;
    v90[4] = v167;
    v90[5] = v168;
    *v90 = v170;
    v90[1] = v169;
    *(float *)&v88 = *(double *)(v8 + 80);
    *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1048)) = LODWORD(v88);
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1048) + 1) = 0;
    v91 = *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1048);
    *(float32x2_t *)(a5 + 40 * v91 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v91 + 24), *(float *)(v8 + 88));
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1048)) = 0;
  }
  v160 = v8;
  if (objc_msgSend(v156, "upNextCountdownPlacement", v147) == 1)
  {
    objc_msgSend(v156, "upNextCountDownSize");
    v93 = v92;
    v95 = v94;
    v203.origin.x = v26;
    v203.origin.y = v155;
    v203.size.width = v179;
    v203.size.height = v157;
    v96 = CGRectGetMaxX(v203);
    objc_msgSend(v156, "spacingBetweenRelatedTitleAndUpNextCountDown");
    v204.size.width = v179;
    v98 = v96 + v97;
    v204.origin.x = v26;
    v204.origin.y = v155;
    v204.size.height = v157;
    v99 = CGRectGetMidY(v204) + v95 * -0.5;
    objc_msgSend(v156, "upNextCountDownVerticalOffset");
    v101 = v99 + v100;
    v102 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036));
    v205.origin.x = v98;
    v205.origin.y = v101;
    v205.size.width = v93;
    v205.size.height = v95;
    v103 = CGRectGetMidX(v205);
    v206.origin.x = v98;
    v206.origin.y = v101;
    v206.size.width = v93;
    v206.size.height = v95;
    v104 = CGRectGetMidY(v206);
    v207.origin.x = v98;
    v207.origin.y = v101;
    v207.size.width = v93;
    v207.size.height = v95;
    v180 = CGRectGetWidth(v207);
    v208.origin.x = v98;
    v208.origin.y = v101;
    v208.size.width = v93;
    v208.size.height = v95;
    v105 = CGRectGetHeight(v208);
    v106.f64[0] = v180;
    v106.f64[1] = v105;
    *(CGFloat *)v102 = v103;
    *(CGFloat *)&v102[1] = v104;
    v102[2] = 0;
    v102[3] = vcvt_f32_f64(v106);
    v107 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036));
    v107[6] = v161;
    v107[7] = v162;
    v107[8] = v163;
    v107[9] = v164;
    v107[2] = v165;
    v107[3] = v166;
    v107[4] = v167;
    v107[5] = v168;
    *v107 = v170;
    v107[1] = v169;
    objc_msgSend(*(id *)(v8 + 32), "countDownAlphaAnimator");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "presentationValue");
    *(float *)&v109 = v109;
    *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036)) = LODWORD(v109);

    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036) + 1) = 3;
    v110 = *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036);
    *(float32x2_t *)(a5 + 40 * v110 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v110 + 24), *(float *)(v8 + 88));
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036) + 32) = objc_msgSend(*(id *)(v8 + 32), "countDownValue");
    *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036) + 24) = 0x20000;
    v111 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1040));
    v209.origin.x = v98;
    v209.origin.y = v101;
    v209.size.width = v93;
    v209.size.height = v95;
    v112 = CGRectGetMidX(v209);
    v210.origin.x = v98;
    v210.origin.y = v101;
    v210.size.width = v93;
    v210.size.height = v95;
    v113 = CGRectGetMidY(v210);
    v211.origin.x = v98;
    v211.origin.y = v101;
    v211.size.width = v93;
    v211.size.height = v95;
    v181 = CGRectGetWidth(v211);
    v212.origin.x = v98;
    v212.origin.y = v101;
    v212.size.width = v93;
    v212.size.height = v95;
    v114 = CGRectGetHeight(v212);
    v115.f64[0] = v181;
    v115.f64[1] = v114;
    *(CGFloat *)v111 = v112;
    *(CGFloat *)&v111[1] = v113;
    v111[2] = 0;
    v111[3] = vcvt_f32_f64(v115);
    v8 = v160;
    v116 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v160 + 32) + 1040));
    v116[6] = v161;
    v116[7] = v162;
    v116[8] = v163;
    v116[9] = v164;
    v116[2] = v165;
    v116[3] = v166;
    v116[4] = v167;
    v116[5] = v168;
    *v116 = v170;
    v116[1] = v169;
    *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(v160 + 32) + 1040)) = *(_DWORD *)(a4
                                                                                             + 160
                                                                                             * *(unsigned int *)(*(_QWORD *)(v160 + 32) + 1036));
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v160 + 32) + 1040) + 1) = 1;
    v117 = *(unsigned int *)(*(_QWORD *)(v160 + 32) + 1040);
    *(float32x2_t *)(a5 + 40 * v117 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v117 + 24), *(float *)(v160 + 88));
    *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v160 + 32) + 1040) + 24) = 0x20000;
    v11 = 1112;
  }
  else
  {
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1036) + 1) = 0;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(v8 + 32) + 1040) + 1) = 0;
  }
  v118 = *(_DWORD **)(v8 + 32);
  v119 = &OBJC_IVAR___PXDemoDynamicViewWidget___view;
  if (v118[279])
  {
    v120 = 0;
    v121 = 0;
    v158 = v118[278];
    v122 = *(double *)(v8 + 72);
    v123 = (float)-v122;
    do
    {
      v182 = v120;
      objc_msgSend(v118, "viewModel");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "relatedModels");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "objectAtIndexedSubscript:", v121);
      v126 = v119;
      v127 = v11;
      v128 = a5;
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "layoutSpec");
      v130 = a3;
      v131 = a4;
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "thumbnailCornerRadius");
      *(float *)v133.i32 = *(double *)v133.i32;
      v178 = v133;

      a4 = v131;
      a3 = v130;

      a5 = v128;
      v11 = v127;
      v119 = v126;

      v134 = (v158 + v121);
      v135 = v130 + 32 * v134;
      v136 = (CGFloat *)(*(_QWORD *)(*(_QWORD *)(v160 + 32) + v126[522]) + v182);
      v137 = *v136;
      v138 = v136[1];
      v139 = v136[2];
      v140 = v136[3];
      v213.origin.x = *v136;
      v213.origin.y = v138;
      v213.size.width = v139;
      v213.size.height = v140;
      v141 = CGRectGetMidX(v213);
      v214.origin.x = v137;
      v214.origin.y = v138;
      v214.size.width = v139;
      v214.size.height = v140;
      v142 = CGRectGetMidY(v214);
      v215.origin.x = v137;
      v215.origin.y = v138;
      v215.size.width = v139;
      v215.size.height = v140;
      v173 = CGRectGetWidth(v215);
      v216.origin.x = v137;
      v216.origin.y = v138;
      v216.size.width = v139;
      v216.size.height = v140;
      v143 = CGRectGetHeight(v216);
      v144.f64[0] = v173;
      v144.f64[1] = v143;
      *(CGFloat *)v135 = v141;
      *(CGFloat *)(v135 + 8) = v142;
      *(double *)(v135 + 16) = v123;
      *(float32x2_t *)(v135 + 24) = vcvt_f32_f64(v144);
      v145 = a4 + 160 * v134;
      *(_OWORD *)v145 = v170;
      *(_OWORD *)(v145 + 16) = v169;
      *(_OWORD *)(v145 + 64) = v167;
      *(_OWORD *)(v145 + 80) = v168;
      *(_OWORD *)(v145 + 32) = v165;
      *(_OWORD *)(v145 + 48) = v166;
      *(_OWORD *)(v145 + 128) = v163;
      *(_OWORD *)(v145 + 144) = v164;
      *(_OWORD *)(v145 + 96) = v161;
      *(_OWORD *)(v145 + 112) = v162;
      *(float *)&v143 = *(double *)(v160 + 80);
      *(_DWORD *)v145 = LODWORD(v143);
      *(int32x4_t *)(v145 + 36) = vdupq_lane_s32(v178, 0);
      v146 = a5 + 40 * v134;
      *(_BYTE *)(v146 + 1) = 0;
      *(_BYTE *)(v146 + 34) = 4;
      ++v121;
      v118 = *(_DWORD **)(v160 + 32);
      v120 = v182 + 32;
    }
    while (v121 < *(unsigned int *)((char *)v118 + v11 + 4));
  }

}

uint64_t __46__PXStoryRelatedOverlayLayout__autoplayUpNext__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "autoPlayUpNext");
}

void __71__PXStoryRelatedOverlayLayout__considerChangingToSelectedRelatedMemory__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setWantsChromeVisible:", 0);
  objc_msgSend(v3, "selectRelatedAtIndex:", *(_QWORD *)(a1 + 32));

}

uint64_t __56__PXStoryRelatedOverlayLayout_setWantsNavigationButton___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 32))
    v2 = 0.0;
  return objc_msgSend(a2, "setValue:", v2);
}

void __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "scrollContentLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollOffset");
  objc_msgSend(v3, "setValue:");

}

uint64_t __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __53__PXStoryRelatedOverlayLayout_showOrHideFullRelated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldCountDownToUpNext:", 0);
}

uint64_t __53__PXStoryRelatedOverlayLayout__handleCountDownTimer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

uint64_t __50__PXStoryRelatedOverlayLayout_setShouldCountDown___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 0.0);
}

uint64_t __67__PXStoryRelatedOverlayLayout_setIsRelatedOverlayScrolledIntoView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsRelatedOverlayScrolledIntoView:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1096));
}

void __59__PXStoryRelatedOverlayLayout__selectRelatedMemoryAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "upNextAnimationStyle");

  if (v4 == 1)
  {
    objc_msgSend(v7, "selectRelatedAtIndex:", *(_QWORD *)(a1 + 48));
LABEL_7:
    v5 = v7;
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    objc_msgSend(v7, "setIsPerformingCrossfadeTransitionToRelated:", 1);
    goto LABEL_7;
  }
  v5 = v7;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PXStoryRelatedOverlayLayout.m"), 200, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:

}

uint64_t __59__PXStoryRelatedOverlayLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_selectRelatedMemoryAtIndex:", *(_QWORD *)(a1 + 40));
  return 1;
}

@end
