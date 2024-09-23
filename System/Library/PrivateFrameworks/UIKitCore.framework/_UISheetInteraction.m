@implementation _UISheetInteraction

- (CGPoint)currentOffset
{
  void *v2;
  double *v3;
  double v4;
  double v5;
  CGPoint result;

  -[_UISheetInteraction interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double *)objc_msgSend(v2, "_presentationPoint");

  v4 = *v3;
  v5 = v3[1];
  result.y = v5;
  result.x = v4;
  return result;
}

- (_UIHyperInteractor)interactor
{
  return self->_interactor;
}

- (id)indexOfCurrentDetentGetter
{
  return self->_indexOfCurrentDetentGetter;
}

- (id)detentGetter
{
  return self->_detentGetter;
}

- (_UIHyperregionUnion)detentUnion
{
  return self->_detentUnion;
}

- (id)numberOfDetentsGetter
{
  return self->_numberOfDetentsGetter;
}

- (BOOL)isDragging
{
  void *v2;
  BOOL v3;

  -[_UISheetInteraction dragSource](self, "dragSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSObject)dragSource
{
  return self->_dragSource;
}

- (NSMutableArray)detentPoints
{
  return self->_detentPoints;
}

- (_UIHyperrectangle)detentContinuum
{
  return self->_detentContinuum;
}

- (void)setRubberBandExtentBeyondMinimumOffsetGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setRubberBandExtentBeyondMaximumOffsetGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setNumberOfDetentsGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setIndexOfCurrentDetentGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setDetentGetter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

  }
}

- (void)setCurrentOffsetWasInvalidated:(id)a3
{
  id v4;
  void *v5;
  id currentOffsetWasInvalidated;
  id v7;

  if (self->_currentOffsetWasInvalidated != a3)
  {
    v4 = a3;
    v5 = _Block_copy(v4);
    currentOffsetWasInvalidated = self->_currentOffsetWasInvalidated;
    self->_currentOffsetWasInvalidated = v5;

    -[_UISheetInteraction interactor](self, "interactor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setPresentationPointWasInvalidated:", v4);

  }
}

- (_UISheetInteraction)init
{
  _UISheetInteraction *v2;
  _UISheetInteraction *v3;
  NSMutableArray *v4;
  NSMutableArray *registeredPanGestureRecognizers;
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *backgroundGestureRecognizer;
  _UIHyperInteractor *v8;
  _UIHyperInteractor *interactor;
  int v10;
  double v11;
  void *v12;
  _UIHyperpoint *v13;
  uint64_t v14;
  NSMutableArray *detentPoints;
  _UIHyperregionUnion *v16;
  _UIHyperregionUnion *detentUnion;
  _UIHyperrectangle *v18;
  _UIHyperrectangle *detentContinuum;
  uint64_t v20;
  _UIHyperAsymmetricExtender *v21;
  _UIHyperAsymmetricExtender *extender;
  _UIHyperOutOfProcessViewAnimator *v23;
  _UIHyperOutOfProcessViewAnimator *animator;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;
  CAFrameRateRange v34;

  v33.receiver = self;
  v33.super_class = (Class)_UISheetInteraction;
  v2 = -[_UISheetInteraction init](&v33, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_scrollingExpandsToLargerDetentWhenScrolledToEdge = 257;
    v2->_scrollInteractionEnabled = 1;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registeredPanGestureRecognizers = v3->_registeredPanGestureRecognizers;
    v3->_registeredPanGestureRecognizers = v4;

    v6 = objc_alloc_init(UIPanGestureRecognizer);
    backgroundGestureRecognizer = v3->_backgroundGestureRecognizer;
    v3->_backgroundGestureRecognizer = v6;

    -[UIGestureRecognizer setName:](v3->_backgroundGestureRecognizer, "setName:", CFSTR("_UISheetInteractionBackgroundDismissRecognizer"));
    -[UIPanGestureRecognizer setDelegate:](v3->_backgroundGestureRecognizer, "setDelegate:", v3);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v3->_backgroundGestureRecognizer, "setAllowedScrollTypesMask:", 2);
    -[_UISheetInteraction registerPanGestureRecognizer:](v3, "registerPanGestureRecognizer:", v3->_backgroundGestureRecognizer);
    v8 = -[_UIHyperInteractor initWithDimensions:]([_UIHyperInteractor alloc], "initWithDimensions:", 2);
    interactor = v3->_interactor;
    v3->_interactor = v8;

    v10 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_SheetDecelerationFactor, (uint64_t)CFSTR("SheetDecelerationFactor"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v11 = *(double *)&qword_1ECD75E58;
    if (v10)
      v11 = 0.99;
    -[_UIHyperInteractor _setDecelerationRate:](v3->_interactor, "_setDecelerationRate:", v11);
    -[_UIHyperInteractor _setDelegate:](v3->_interactor, "_setDelegate:", v3);
    v12 = (void *)MEMORY[0x1E0C99DE8];
    v13 = -[_UIHyperpoint initWithDimensions:]([_UIHyperpoint alloc], "initWithDimensions:", -[_UIHyperInteractor _dimensions](v3->_interactor, "_dimensions"));
    objc_msgSend(v12, "arrayWithObject:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    detentPoints = v3->_detentPoints;
    v3->_detentPoints = (NSMutableArray *)v14;

    v16 = -[_UIHyperregionUnion initWithDimensions:]([_UIHyperregionUnion alloc], "initWithDimensions:", -[_UIHyperInteractor _dimensions](v3->_interactor, "_dimensions"));
    detentUnion = v3->_detentUnion;
    v3->_detentUnion = v16;

    -[_UIHyperregionUnion _setRegions:](v3->_detentUnion, "_setRegions:", v3->_detentPoints);
    v18 = -[_UIHyperrectangle initWithDimensions:]([_UIHyperrectangle alloc], "initWithDimensions:", -[_UIHyperInteractor _dimensions](v3->_interactor, "_dimensions"));
    detentContinuum = v3->_detentContinuum;
    v3->_detentContinuum = v18;

    objc_initWeak(&location, v3);
    v20 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __27___UISheetInteraction_init__block_invoke;
    v30[3] = &unk_1E16B2F90;
    objc_copyWeak(&v31, &location);
    -[_UIHyperInteractor _setRegionGetter:](v3->_interactor, "_setRegionGetter:", v30);
    v21 = -[_UIHyperAsymmetricExtender initWithDimensions:]([_UIHyperAsymmetricExtender alloc], "initWithDimensions:", -[_UIHyperInteractor _dimensions](v3->_interactor, "_dimensions"));
    extender = v3->_extender;
    v3->_extender = v21;

    v28[0] = v20;
    v28[1] = 3221225472;
    v28[2] = __27___UISheetInteraction_init__block_invoke_5;
    v28[3] = &unk_1E16B2FE0;
    objc_copyWeak(&v29, &location);
    -[_UIHyperInteractor _setExtenderGetter:](v3->_interactor, "_setExtenderGetter:", v28);
    v23 = -[_UIHyperOutOfProcessViewAnimator initWithDimensions:]([_UIHyperOutOfProcessViewAnimator alloc], "initWithDimensions:", -[_UIHyperInteractor _dimensions](v3->_interactor, "_dimensions"));
    animator = v3->_animator;
    v3->_animator = v23;

    v34 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[_UIHyperOutOfProcessViewAnimator _setPreferredFrameRateRange:](v3->_animator, "_setPreferredFrameRateRange:", *(double *)&v34.minimum, *(double *)&v34.maximum, *(double *)&v34.preferred);
    -[_UIHyperOutOfProcessViewAnimator _setUpdateReason:](v3->_animator, "_setUpdateReason:", 1048612);
    -[_UIHyperOutOfProcessViewAnimator _setDelegate:](v3->_animator, "_setDelegate:", v3);
    -[_UIHyperInteractor _setAnimator:](v3->_interactor, "_setAnimator:", v3->_animator);
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __27___UISheetInteraction_init__block_invoke_8;
    v26[3] = &unk_1E16B3008;
    objc_copyWeak(&v27, &location);
    -[_UIHyperInteractor _setUnconstrainedPointGetter:](v3->_interactor, "_setUnconstrainedPointGetter:", v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)registerPanGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UISheetInteraction registeredPanGestureRecognizers](self, "registeredPanGestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v5, "addTarget:action:", self, sel_handlePan_);
  -[_UISheetInteraction updateRegisteredPanGestureRecognizerEnabled:](self, "updateRegisteredPanGestureRecognizerEnabled:", v5);
  -[_UISheetInteraction handlePan:](self, "handlePan:", v5);

}

- (void)updateRegisteredPanGestureRecognizerEnabled:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setEnabled:", -[_UISheetInteraction isEnabled](self, "isEnabled"));

}

- (NSMutableArray)registeredPanGestureRecognizers
{
  return self->_registeredPanGestureRecognizers;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)handlePan:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  switch(objc_msgSend(v11, "state"))
  {
    case 1:
      v4 = -[UIPanGestureRecognizer _scrollDeviceCategory](v11);
      -[_UISheetInteraction draggingBeganFromSource:withRubberBandCoefficient:](self, "draggingBeganFromSource:withRubberBandCoefficient:", v11, _UIScrollViewRubberBandCoefficient(v4));
      break;
    case 2:
      objc_msgSend(v11, "translationInView:", 0);
      v6 = v5;
      v8 = v7;
      objc_msgSend(v11, "velocityInView:", 0);
      -[_UISheetInteraction draggingChangedInSource:withTranslation:velocity:animateChange:](self, "draggingChangedInSource:withTranslation:velocity:animateChange:", v11, 0, v6, v8, v9, v10);
      break;
    case 3:
      -[_UISheetInteraction draggingEndedInSource:](self, "draggingEndedInSource:", v11);
      break;
    case 4:
      -[_UISheetInteraction draggingCancelledInSource:](self, "draggingCancelledInSource:", v11);
      break;
    default:
      break;
  }

}

- (void)setScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3
{
  self->_scrollingExpandsToLargerDetentWhenScrolledToEdge = a3;
}

- (void)setScrollInteractionEnabled:(BOOL)a3
{
  self->_scrollInteractionEnabled = a3;
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (!a3)
      -[_UISheetInteraction cancelDraggingIfNeeded](self, "cancelDraggingIfNeeded");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[_UISheetInteraction registeredPanGestureRecognizers](self, "registeredPanGestureRecognizers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[_UISheetInteraction updateRegisteredPanGestureRecognizerEnabled:](self, "updateRegisteredPanGestureRecognizerEnabled:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)invalidateIndexOfCurrentDetent
{
  id v2;

  -[_UISheetInteraction interactor](self, "interactor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invalidateUnconstrainedPoint");

}

- (void)didMoveToView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UISheetInteraction setView:](self, "setView:", v5);
  if (v5)
  {
    -[_UISheetInteraction backgroundGestureRecognizer](self, "backgroundGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", v4);

  }
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIPanGestureRecognizer)backgroundGestureRecognizer
{
  return self->_backgroundGestureRecognizer;
}

- (void)willMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UISheetInteraction view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7 && v7 != v4)
  {
    -[_UISheetInteraction cancelDraggingIfNeeded](self, "cancelDraggingIfNeeded");
    -[_UISheetInteraction backgroundGestureRecognizer](self, "backgroundGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v6);

    v5 = v7;
  }

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)invalidateDetents
{
  void *v3;
  id v4;

  -[_UISheetInteraction interactor](self, "interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_invalidateRegion");

  -[_UISheetInteraction interactor](self, "interactor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_invalidateUnconstrainedPoint");

}

- (void)cancelDraggingIfNeeded
{
  id v3;

  if (-[_UISheetInteraction isDragging](self, "isDragging"))
  {
    -[_UISheetInteraction dragSource](self, "dragSource");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[_UISheetInteraction draggingCancelledInSource:](self, "draggingCancelledInSource:", v3);

  }
}

- (void)setDragSource:(id)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v5 = a3;
  if (self->_dragSource != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_dragSource, a3);
    -[_UISheetInteraction interactor](self, "interactor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_invalidateRegion");

    v5 = v7;
  }

}

- (CGPoint)currentVelocity
{
  void *v2;
  double *v3;
  double v4;
  double v5;
  CGPoint result;

  -[_UISheetInteraction interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double *)objc_msgSend(v2, "_velocity");

  v4 = *v3;
  v5 = v3[1];
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)sendCurrentOffsetDidChange
{
  void *v3;
  char v4;
  id v5;

  -[_UISheetInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UISheetInteraction delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UISheetInteraction currentOffset](self, "currentOffset");
    objc_msgSend(v5, "sheetInteraction:didChangeOffset:", self);

  }
}

- (void)invalidateRubberBandExtentBeyondMinimumOffset
{
  id v2;

  -[_UISheetInteraction interactor](self, "interactor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invalidateExtender");

}

- (void)invalidateRubberBandExtentBeyondMaximumOffset
{
  id v2;

  -[_UISheetInteraction interactor](self, "interactor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_invalidateExtender");

}

- (BOOL)isUnconstrainedOffsetBeyondSideOrTopExtentInverted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  v3 = a3;
  -[_UISheetInteraction interactor](self, "interactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_unconstrainedExtent");
  v7 = v6;
  -[_UISheetInteraction interactor](self, "interactor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_extent");
  v10 = v9;

  -[_UISheetInteraction interactor](self, "interactor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_extentVector");

  v13 = atan2(-*(double *)(v12 + 8), *(long double *)v12);
  v14 = -2.61799388;
  if (v3)
    v14 = 0.523598776;
  v15 = -0.523598776;
  if (v3)
    v15 = 2.61799388;
  v16 = v13 < v14;
  if (v13 > v15)
    v16 = 1;
  return v7 > v10 && v16;
}

- (CGPoint)attachmentPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[_UISheetInteraction _currentDragPanGesture](self, "_currentDragPanGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UISheetInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  }

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)unregisterPanGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_UISheetInteraction registeredPanGestureRecognizers](self, "registeredPanGestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  objc_msgSend(v5, "removeTarget:action:", self, sel_handlePan_);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[_UISheetInteraction backgroundGestureRecognizer](self, "backgroundGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    +[UIPanGestureRecognizer _defaultHysteresis](UIPanGestureRecognizer, "_defaultHysteresis");
    v10 = v9;
    if (objc_msgSend(v6, "_isPointerTouch"))
    {
      -[_UISheetInteraction view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISheetInteraction view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v12);
      objc_msgSend(v11, "hitTest:withEvent:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = 0.0;

    }
    -[_UISheetInteraction backgroundGestureRecognizer](self, "backgroundGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setHysteresis:", v10);

  }
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "name", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.UIKit.UIWindowDraggingPan"));

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  NSClassFromString(CFSTR("PKDrawingGestureRecognizer"));
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v5 = 1,
        (_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceCardDismissGestureDoesNotRequireFailure, (uint64_t)CFSTR("ForceCardDismissGestureDoesNotRequireFailure"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0)&& byte_1EDDA7D9C)
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a3;
  -[_UISheetInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UISheetInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sheetInteraction:shouldBeginHorizontalRubberBandingWithGestureRecognizer:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[_UISheetInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UISheetInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sheetInteraction:shouldAllowVerticalRubberBandingWithEvent:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_descendentScrollViewShouldScrollHorizontally:(id)a3
{
  return 0;
}

- (BOOL)_descendentScrollViewShouldScrollVertically:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_maxTopOffset");
  objc_msgSend(v4, "contentOffset");
  LOBYTE(self) = -[_UISheetInteraction _shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:](self, "_shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:", v4);

  return (char)self;
}

- (CGPoint)_scrollView:(id)a3 adjustedUnconstrainedOffsetForUnconstrainedOffset:(CGPoint)a4 startOffset:(CGPoint)a5 horizontalVelocity:(double *)a6 verticalVelocity:(double *)a7 animator:(id *)a8
{
  double y;
  double x;
  double v12;
  CGFloat v13;
  id v15;
  double v16;
  double v17;
  int v18;
  _BOOL4 v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  char flags;
  int v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  UIViewPropertyAnimator *v40;
  double v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v12 = a4.y;
  v13 = a4.x;
  v15 = a3;
  objc_msgSend(v15, "_maxTopOffset");
  v17 = v16;
  self->_previousMaxTopOffset = v16;
  if (!-[_UISheetInteraction _shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:](self, "_shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:", v15, x, y, v16))goto LABEL_33;
  v18 = objc_msgSend(v15, "_canScrollIgnoringAncestorPermissionY");
  v19 = v12 > y
     && -[_UISheetInteraction scrollingExpandsToLargerDetentWhenScrolledToEdge](self, "scrollingExpandsToLargerDetentWhenScrolledToEdge");
  v20 = *a7;
  -[_UISheetInteraction detentPoints](self, "detentPoints");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *(double *)(objc_msgSend(v22, "_value") + 8);

  if ((v18 & 1) != 0)
  {
    if (v12 >= v17)
    {
      if (v19)
      {
        -[_UISheetInteraction interactor](self, "interactor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(double *)(objc_msgSend(v25, "_unconstrainedPoint") + 8);
        -[_UISheetInteraction interactor](self, "interactor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26 + *(double *)(objc_msgSend(v27, "_initialTranslation") + 8);

        v24 = v23 - v28;
        if (y - v12 >= v24)
        {
          *a7 = 0.0;
          v24 = y - v12;
        }
        else
        {
          y = v12 + v24;
        }
      }
      else
      {
        v24 = 0.0;
        if (v12 == v17 && v17 == y && *a7 > 0.0)
        {
          -[_UISheetInteraction currentOffset](self, "currentOffset", *a7);
          if (v29 > v23)
            *a7 = 0.0;
        }
        y = v12;
      }
    }
    else
    {
      v24 = v17 - v12;
      *a7 = 0.0;
      y = v17;
    }
  }
  else
  {
    v24 = y - v12;
    *a7 = 0.0;
  }
  objc_msgSend(v15, "_verticalVelocity");
  if (v30 == 0.0)
  {
    objc_msgSend(v15, "panGestureRecognizer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "velocityInView:", 0);
    v33 = v32;

  }
  else
  {
    v33 = 0.0;
  }
  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 1;
  if (-[_UISheetInteraction isDragging](self, "isDragging"))
    goto LABEL_29;
  v35 = v18 ^ 1;
  if (v12 < v17)
    v35 = 1;
  if ((v35 | v19) != 1)
  {
LABEL_29:
    if (!-[_UISheetInteraction isDragging](self, "isDragging"))
    {
LABEL_32:
      *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | flags & 1;
      v12 = y;
      goto LABEL_33;
    }
    goto LABEL_30;
  }
  objc_msgSend(v15, "panGestureRecognizer");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[UIPanGestureRecognizer _scrollDeviceCategory](v36);
  v38 = _UIScrollViewRubberBandCoefficient(v37);

  -[_UISheetInteraction draggingBeganFromSource:withRubberBandCoefficient:](self, "draggingBeganFromSource:withRubberBandCoefficient:", v15, v38);
  objc_msgSend(v15, "contentOffset");
  if (v39 >= v17)
  {
LABEL_30:
    v43 = 0;
    goto LABEL_31;
  }
  if (v20 != 0.0)
  {
    v40 = [UIViewPropertyAnimator alloc];
    v41 = _UISheetTransitionDuration();
    _UISheetTransitionTimingCurve();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *a8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v40, "initWithDuration:timingParameters:", v42, v41);

    v43 = 1;
LABEL_31:
    -[_UISheetInteraction draggingChangedInSource:withTranslation:velocity:animateChange:](self, "draggingChangedInSource:withTranslation:velocity:animateChange:", v15, v43, 0.0, v24, 0.0, v33);
    goto LABEL_32;
  }
LABEL_33:

  v44 = v13;
  v45 = v12;
  result.y = v45;
  result.x = v44;
  return result;
}

- (BOOL)_descendentScrollView:(id)a3 shouldPreserveStartOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double previousMaxTopOffset;
  double v9;
  BOOL v10;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  previousMaxTopOffset = self->_previousMaxTopOffset;
  objc_msgSend(v7, "contentOffset");
  v10 = v9 < previousMaxTopOffset
     && -[_UISheetInteraction _shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:](self, "_shouldInteractWithDescendentScrollView:startOffset:maxTopOffset:", v7, x, y, previousMaxTopOffset);

  return v10;
}

- (BOOL)_descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:(id)a3
{
  void *v3;
  char v4;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 1;
  -[_UISheetInteraction animator](self, "animator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isAnimating");

  return v4;
}

- (BOOL)_shouldInteractWithDescendentScrollView:(id)a3 startOffset:(CGPoint)a4 maxTopOffset:(double)a5
{
  double y;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  double v15;
  double v16;
  void *v17;
  int v18;
  double v19;
  int v20;
  double v21;
  void *v22;
  double v23;

  y = a4.y;
  v8 = a3;
  v9 = v8;
  if (y <= a5 && (objc_msgSend(v8, "_isScrubbing") & 1) == 0)
  {
    objc_msgSend(v9, "refreshControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (objc_msgSend(v9, "_canScrollX") & 1) != 0
      || objc_msgSend(v9, "_isAncestorOfFirstResponder") && objc_msgSend(v9, "keyboardDismissMode") == 2
      || !-[_UISheetInteraction isEnabled](self, "isEnabled")
      || !-[_UISheetInteraction isScrollInteractionEnabled](self, "isScrollInteractionEnabled"))
    {
      v10 = 1;
      goto LABEL_14;
    }
    v12 = -[_UISheetInteraction isDragging](self, "isDragging");
    if (v12)
    {
      -[_UISheetInteraction dragSource](self, "dragSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v9)
      {
        v10 = 1;
LABEL_28:

        goto LABEL_14;
      }
    }
    objc_msgSend(v9, "_intervalBetweenPanGestures");
    v16 = v15;
    v17 = &_UIInternalPreference_MinimumSheetSwipeInterval;
    v18 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_MinimumSheetSwipeInterval, (uint64_t)CFSTR("MinimumSheetSwipeInterval"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    v19 = *(double *)&qword_1EDDA7DA8;
    if (v18)
      v19 = 0.4;
    if (v16 >= v19 || -[_UISheetInteraction isDragging](self, "isDragging"))
    {
      v20 = 0;
    }
    else
    {
      -[_UISheetInteraction animator](self, "animator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "_isAnimating") & 1) == 0
        && !-[_UISheetInteraction delegateAllowsInteractWithQuicklyScrollingDescendentScrollView](self, "delegateAllowsInteractWithQuicklyScrollingDescendentScrollView"))
      {

        v10 = 1;
        goto LABEL_27;
      }
      v20 = 1;
    }
    objc_msgSend(v9, "contentOffset");
    if (v21 >= a5)
    {
      v10 = 0;
      if ((v20 & 1) == 0)
      {
LABEL_23:
        v13 = v9;
        if (v12)
          goto LABEL_28;
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v9, "panGestureRecognizer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "velocityInView:", 0);
      v10 = v23 < 0.0;

      if (!v20)
        goto LABEL_23;
    }

LABEL_27:
    v13 = v9;
    if (v12)
      goto LABEL_28;
LABEL_14:

    goto LABEL_15;
  }
  v10 = 1;
LABEL_15:

  return !v10;
}

- (BOOL)delegateAllowsInteractWithQuicklyScrollingDescendentScrollView
{
  _UISheetInteraction *v3;
  void *v4;

  if ((*(_BYTE *)&self->_delegateFlags & 1) == 0)
    return 0;
  v3 = self;
  -[_UISheetInteraction delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "sheetInteractionShouldInteractWithQuicklyScrollingDescendentScrollView:", v3);

  return (char)v3;
}

- (void)draggingBeganFromSource:(id)a3 withRubberBandCoefficient:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[_UISheetInteraction isDragging](self, "isDragging"))
  {
    kdebug_trace();
    _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, updateRequest, 0x100024u);
    _UIQOSManagedCommitsBegin(self, CFSTR("Dragging"));
    -[_UISheetInteraction setDragSource:](self, "setDragSource:", v9);
    -[_UISheetInteraction interactor](self, "interactor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setRubberBandCoefficient:", a4);

    -[_UISheetInteraction interactor](self, "interactor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_interactionBegan");

    -[_UISheetInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "_sheetInteractionDraggingBegan:withRubberBandCoefficient:", self, a4);

  }
}

- (void)draggingChangedInSource:(id)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5 animateChange:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  CGPoint v14;
  CGPoint v15;

  v6 = a6;
  v15 = a4;
  v14 = a5;
  v8 = a3;
  if (-[_UISheetInteraction isDragging](self, "isDragging"))
  {
    -[_UISheetInteraction dragSource](self, "dragSource");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v8)
    {
      -[_UISheetInteraction interactor](self, "interactor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __86___UISheetInteraction_draggingChangedInSource_withTranslation_velocity_animateChange___block_invoke;
      v12[3] = &unk_1E16B1B78;
      v13 = v6;
      v12[4] = self;
      objc_msgSend(v10, "_interactionChangedCopyingTranslation:velocity:mutatingState:", &v15, &v14, v12);

      -[_UISheetInteraction delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v11, "_sheetInteractionDraggingChanged:withTranslation:velocity:animateChange:", self, v6, v15.x, v15.y, v14.x, v14.y);

    }
  }

}

- (void)draggingEndedInSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  if (-[_UISheetInteraction isDragging](self, "isDragging"))
  {
    -[_UISheetInteraction dragSource](self, "dragSource");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 == v7)
    {
      kdebug_trace();
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, updateRequest, 0x100024u);
      _UIQOSManagedCommitsEnd(self, CFSTR("Dragging"));
      -[_UISheetInteraction setGeneratingAnimations:](self, "setGeneratingAnimations:", 1);
      -[_UISheetInteraction interactor](self, "interactor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45___UISheetInteraction_draggingEndedInSource___block_invoke;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      objc_msgSend(v5, "_interactionEndedMutatingState:", v8);

      -[_UISheetInteraction setGeneratingAnimations:](self, "setGeneratingAnimations:", 0);
      -[_UISheetInteraction delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "_sheetInteractionDraggingEnded:", self);
      -[_UISheetInteraction setIndexOfCurrentDetent:](self, "setIndexOfCurrentDetent:", 0);

    }
  }

}

- (id)_currentDragPanGesture
{
  void *v2;
  id v3;
  void *v4;

  -[_UISheetInteraction dragSource](self, "dragSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isGestureType:", 8))
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "panGestureRecognizer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

- (void)_hyperOutOfProcessViewAnimator:(id)a3 getPresentationPointForInterruptedAnimation:(double *)a4
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[_UISheetInteraction delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UISheetInteraction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "offsetForInterruptedAnimationInSheetInteraction:", self);
    v10 = v9;
    v12 = v11;

    *(_QWORD *)a4 = v10;
    *((_QWORD *)a4 + 1) = v12;
  }
}

- (void)_animateWithParameters:(id)a3 animations:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UISheetInteraction animator](self, "animator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_animateWithParameters:animations:", v7, v6);

}

- (int64_t)indexOfCurrentDetent
{
  return self->_indexOfCurrentDetent;
}

- (void)setIndexOfCurrentDetent:(int64_t)a3
{
  self->_indexOfCurrentDetent = a3;
}

- (BOOL)scrollingExpandsToLargerDetentWhenScrolledToEdge
{
  return self->_scrollingExpandsToLargerDetentWhenScrolledToEdge;
}

- (BOOL)isScrollInteractionEnabled
{
  return self->_scrollInteractionEnabled;
}

- (BOOL)isGeneratingAnimations
{
  return self->_generatingAnimations;
}

- (void)setGeneratingAnimations:(BOOL)a3
{
  self->_generatingAnimations = a3;
}

- (id)currentOffsetWasInvalidated
{
  return self->_currentOffsetWasInvalidated;
}

- (id)rubberBandExtentBeyondMinimumOffsetGetter
{
  return self->_rubberBandExtentBeyondMinimumOffsetGetter;
}

- (id)rubberBandExtentBeyondMaximumOffsetGetter
{
  return self->_rubberBandExtentBeyondMaximumOffsetGetter;
}

- (_UISheetInteractionDelegate)delegate
{
  return (_UISheetInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_UIHyperAsymmetricExtender)extender
{
  return self->_extender;
}

- (_UIHyperOutOfProcessViewAnimator)animator
{
  return self->_animator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSource, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_extender, 0);
  objc_storeStrong((id *)&self->_detentContinuum, 0);
  objc_storeStrong((id *)&self->_detentUnion, 0);
  objc_storeStrong((id *)&self->_detentPoints, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_backgroundGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_registeredPanGestureRecognizers, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_rubberBandExtentBeyondMaximumOffsetGetter, 0);
  objc_storeStrong(&self->_rubberBandExtentBeyondMinimumOffsetGetter, 0);
  objc_storeStrong(&self->_currentOffsetWasInvalidated, 0);
  objc_storeStrong(&self->_indexOfCurrentDetentGetter, 0);
  objc_storeStrong(&self->_detentGetter, 0);
  objc_storeStrong(&self->_numberOfDetentsGetter, 0);
}

@end
