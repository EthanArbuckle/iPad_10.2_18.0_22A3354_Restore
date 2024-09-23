@implementation SKUIViewControllerContainerCollectionView

- (void)dealloc
{
  objc_super v3;

  -[SKUIViewControllerContainerCollectionView _endDynamicHysteresisIncrease](self, "_endDynamicHysteresisIncrease");
  v3.receiver = self;
  v3.super_class = (Class)SKUIViewControllerContainerCollectionView;
  -[SKUIViewControllerContainerCollectionView dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v13)
        -[SKUIViewControllerContainerCollectionView observeValueForKeyPath:ofObject:change:context:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  if ((void *)_SKUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext == a6)
  {
    -[SKUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v21, "state") - 3) <= 2)
      -[SKUIViewControllerContainerCollectionView _endDynamicHysteresisIncrease](self, "_endDynamicHysteresisIncrease");

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SKUIViewControllerContainerCollectionView;
    -[SKUIViewControllerContainerCollectionView observeValueForKeyPath:ofObject:change:context:](&v22, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  SKUIViewControllerContainerCollectionView *v18;
  SKUIViewControllerContainerCollectionView *v19;
  id v20;
  BOOL v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIViewControllerContainerCollectionView gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  -[SKUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v7)
  {
    objc_msgSend(v8, "delegate");
    v18 = (SKUIViewControllerContainerCollectionView *)objc_claimAutoreleasedReturnValue();
    if (v18 != self)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        -[SKUIViewControllerContainerCollectionView panGestureRecognizer](v19, "panGestureRecognizer");
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v20 == v8
          && _SKUIScrollViewIsCompetingWithScrollView(self, v19)
          && (_SKUIScrollViewWantsToBeginTrackingImmediately(v19) & 1) != 0)
        {
          -[SKUIViewControllerContainerCollectionView _beginDynamicHysteresisIncreaseWithCompetingScrollView:](self, "_beginDynamicHysteresisIncreaseWithCompetingScrollView:", v19);

          v21 = 1;
          goto LABEL_17;
        }

      }
    }

  }
  if (objc_msgSend((id)+[SKUIViewControllerContainerCollectionView superclass](SKUIViewControllerContainerCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v23.receiver = self;
    v23.super_class = (Class)SKUIViewControllerContainerCollectionView;
    v21 = -[SKUIViewControllerContainerCollectionView gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:](&v23, sel_gestureRecognizer_shouldBeRequiredToFailByGestureRecognizer_, v7, v8);
  }
  else
  {
    v21 = 0;
  }
LABEL_17:

  return v21;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  SKUIViewControllerContainerCollectionView *v18;
  SKUIViewControllerContainerCollectionView *v19;
  id v20;
  char v21;
  BOOL v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        -[SKUIViewControllerContainerCollectionView gestureRecognizer:shouldRequireFailureOfGestureRecognizer:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  -[SKUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 != v7)
    goto LABEL_14;
  objc_msgSend(v8, "delegate");
  v18 = (SKUIViewControllerContainerCollectionView *)objc_claimAutoreleasedReturnValue();
  if (v18 == self)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  v19 = v18;
  -[SKUIViewControllerContainerCollectionView panGestureRecognizer](v19, "panGestureRecognizer");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 != v8 || !_SKUIScrollViewIsCompetingWithScrollView(self, v19))
  {

LABEL_13:
    goto LABEL_14;
  }
  v21 = _SKUIScrollViewWantsToBeginTrackingImmediately(self);

  if ((v21 & 1) != 0)
  {
    v22 = 1;
    goto LABEL_17;
  }
LABEL_14:
  if (objc_msgSend((id)+[SKUIViewControllerContainerCollectionView superclass](SKUIViewControllerContainerCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v24.receiver = self;
    v24.super_class = (Class)SKUIViewControllerContainerCollectionView;
    v22 = -[SKUIViewControllerContainerCollectionView gestureRecognizer:shouldRequireFailureOfGestureRecognizer:](&v24, sel_gestureRecognizer_shouldRequireFailureOfGestureRecognizer_, v7, v8);
  }
  else
  {
    v22 = 0;
  }
LABEL_17:

  return v22;
}

- (void)_beginDynamicHysteresisIncreaseWithCompetingScrollView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  const __CFAllocator *v10;
  __CFRunLoop *Main;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = v4;
  if (!self->_forcingIncreasedPanGestureRecognizerHysteresis)
  {
    objc_msgSend(v4, "panGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_hysteresis");
    self->_competingScrollViewPanGestureRecognizerHysteresis = v7;

    -[SKUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_hysteresis");
    self->_originalPanGestureRecognizerHysteresis = v9;
    objc_msgSend(v8, "_setHysteresis:", 88.0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 0, _SKUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext);
    self->_forcingIncreasedPanGestureRecognizerHysteresis = 1;
    objc_initWeak(&location, self);
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__SKUIViewControllerContainerCollectionView__beginDynamicHysteresisIncreaseWithCompetingScrollView___block_invoke;
    v12[3] = &unk_1E73A9CD8;
    objc_copyWeak(&v13, &location);
    self->_runLoopObserver = CFRunLoopObserverCreateWithHandler(v10, 0x20uLL, 1u, 0, v12);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRunLoopAddObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0DC55B0]);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __100__SKUIViewControllerContainerCollectionView__beginDynamicHysteresisIncreaseWithCompetingScrollView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStateForDynamicHysteresisIncrease");

}

- (void)_endDynamicHysteresisIncrease
{
  __CFRunLoop *Main;
  id v4;

  if (self->_forcingIncreasedPanGestureRecognizerHysteresis)
  {
    self->_competingScrollViewPanGestureRecognizerHysteresis = 0.0;
    -[SKUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setHysteresis:", self->_originalPanGestureRecognizerHysteresis);
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("state"), &_SKUIViewControllerContainerCollectionViewPanGestureRecognizerStateObservationContext);
    self->_originalPanGestureRecognizerHysteresis = 0.0;
    self->_forcingIncreasedPanGestureRecognizerHysteresis = 0;
    if (self->_runLoopObserver)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopRemoveObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      CFRunLoopRemoveObserver(Main, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0DC55B0]);
      CFRelease(self->_runLoopObserver);
      self->_runLoopObserver = 0;
    }

  }
}

- (void)_updateStateForDynamicHysteresisIncrease
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[SKUIViewControllerContainerCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "state"))
  {
    objc_msgSend(v7, "translationInView:", self);
    v4 = fabs(v3);
    v6 = fabs(v5);
    if (v6 > v4 && v6 > self->_competingScrollViewPanGestureRecognizerHysteresis)
      objc_msgSend(v7, "setState:", 5);
  }

}

- (void)observeValueForKeyPath:(uint64_t)a3 ofObject:(uint64_t)a4 change:(uint64_t)a5 context:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)gestureRecognizer:(uint64_t)a3 shouldBeRequiredToFailByGestureRecognizer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)gestureRecognizer:(uint64_t)a3 shouldRequireFailureOfGestureRecognizer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
