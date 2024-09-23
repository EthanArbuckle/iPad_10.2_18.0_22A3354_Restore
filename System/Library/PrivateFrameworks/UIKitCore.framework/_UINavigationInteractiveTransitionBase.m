@implementation _UINavigationInteractiveTransitionBase

- (void)setAnimationController:(id)a3
{
  _UINavigationParallaxTransition **p_animationController;
  id v6;

  p_animationController = &self->_animationController;
  objc_storeStrong((id *)&self->_animationController, a3);
  v6 = a3;
  -[_UINavigationParallaxTransition setInteractionController:](*p_animationController, "setInteractionController:", self);

}

- (void)_setShouldReverseLayoutDirection:(BOOL)a3
{
  self->__shouldReverseLayoutDirection = a3;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return self->__shouldReverseLayoutDirection;
}

- (_UINavigationInteractiveTransitionBase)initWithGestureRecognizerView:(id)a3 animator:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  _UINavigationInteractiveTransitionBase *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UINavigationInteractiveTransitionBase;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[UIPercentDrivenInteractiveTransition init](&v13, sel_init);
  -[_UINavigationInteractiveTransitionBase setDelegate:](v10, "setDelegate:", v7, v13.receiver, v13.super_class);
  v10->__useAugmentedShouldPopDecisionProcedure = _UINavigationControllerUseAugmentedPopGesture();
  -[_UINavigationInteractiveTransitionBase _setInteractionState:](v10, "_setInteractionState:", 0);
  objc_storeWeak((id *)&v10->_gestureRecognizerView, v9);
  -[_UINavigationInteractiveTransitionBase _setShouldReverseLayoutDirection:](v10, "_setShouldReverseLayoutDirection:", objc_msgSend(v9, "_shouldReverseLayoutDirection"));
  -[_UINavigationInteractiveTransitionBase _setCompletesTransitionOnEnd:](v10, "_setCompletesTransitionOnEnd:", 1);
  -[_UINavigationInteractiveTransitionBase setAnimationController:](v10, "setAnimationController:", v8);

  objc_msgSend(v7, "gestureRecognizerForInteractiveTransition:WithTarget:action:", v10, v10, sel_handleNavigationTransition_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UINavigationInteractiveTransitionBase setGestureRecognizer:](v10, "setGestureRecognizer:", v11);
  objc_msgSend(v11, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v11, "setMaximumNumberOfTouches:", 1);
  objc_msgSend(v11, "setDelegate:", v10);
  objc_msgSend(v9, "addGestureRecognizer:", v11);

  return v10;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_gestureRecognizer, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_setInteractionState:(int64_t)a3
{
  self->__interactionState = a3;
}

- (void)_setCompletesTransitionOnEnd:(BOOL)a3
{
  self->__completesTransitionOnEnd = a3;
}

- (void)setShouldReverseTranslation:(BOOL)a3
{
  self->_shouldReverseTranslation = a3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[16];

  -[_UINavigationInteractiveTransitionBase gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "removeGestureRecognizer:", v4);

  }
  if (self->__updateRequestActive)
  {
    v7 = dealloc___s_category_9;
    if (!dealloc___s_category_9)
    {
      v7 = __UILogCategoryGetNode("_UINavigationParallaxTransition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&dealloc___s_category_9);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "UIUpdateRequest still active during navigation transition dealloc. Should completeTransition: have been called on the interaction context earlier?", buf, 2u);
    }
    _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, __interactiveNavigationUpdateRequest, 0x100029u);
    self->__updateRequestActive = 0;
  }
  objc_storeWeak((id *)&self->__parent, 0);

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationInteractiveTransitionBase;
  -[_UINavigationInteractiveTransitionBase dealloc](&v9, sel_dealloc);
}

- (UIPanGestureRecognizer)gestureRecognizer
{
  return (UIPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->_gestureRecognizer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->__parent);
  objc_destroyWeak((id *)&self->_gestureRecognizer);
  objc_destroyWeak((id *)&self->_gestureRecognizerView);
}

- (id)gestureRecognizerView
{
  return objc_loadWeakRetained((id *)&self->_gestureRecognizerView);
}

- (void)_resetInteractionController
{
  -[_UINavigationInteractiveTransitionBase _setInteractionState:](self, "_setInteractionState:", 0);
  -[_UINavigationInteractiveTransitionBase setAnimationController:](self, "setAnimationController:", 0);
}

- (void)cancelInteractiveTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationInteractiveTransitionBase;
  -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](&v3, sel_cancelInteractiveTransition);
  -[_UINavigationInteractiveTransitionBase setAnimationController:](self, "setAnimationController:", 0);
}

- (void)finishInteractiveTransition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationInteractiveTransitionBase;
  -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](&v3, sel_finishInteractiveTransition);
  -[_UINavigationInteractiveTransitionBase setAnimationController:](self, "setAnimationController:", 0);
}

- (void)_stopInteractiveTransition
{
  objc_super v2;

  self->__transitionWasStopped = 1;
  v2.receiver = self;
  v2.super_class = (Class)_UINavigationInteractiveTransitionBase;
  -[UIPercentDrivenInteractiveTransition _stopInteractiveTransition](&v2, sel__stopInteractiveTransition);
}

- (void)_completeStoppedInteractiveTransition
{
  if (self->__stoppedTransitionWasCancelled)
    -[_UINavigationInteractiveTransitionBase cancelInteractiveTransition](self, "cancelInteractiveTransition");
  else
    -[_UINavigationInteractiveTransitionBase finishInteractiveTransition](self, "finishInteractiveTransition");
  self->__transitionWasStopped = 0;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return objc_msgSend(a4, "_isGestureType:", 9);
}

- (void)_updateStatistics:(id)a3 firstSample:(BOOL)a4 finalSample:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double totalDistance;
  double v22;
  double v23;
  double previousTimeStamp;
  double v25;
  double v26;
  unint64_t sampleCount;
  unint64_t v28;
  double v29;
  double previousAcceleration;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  id v36;

  v5 = a4;
  v7 = a3;
  if (self->__useAugmentedShouldPopDecisionProcedure)
  {
    v36 = v7;
    objc_msgSend(v7, "_activeEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v11 = v10;

    -[_UINavigationInteractiveTransitionBase _translationCoefficient](self, "_translationCoefficient");
    v13 = v12;
    objc_msgSend(v36, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "translationInView:", v14);
    v16 = v15;

    v17 = v13 * v16;
    objc_msgSend(v36, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "velocityInView:", v18);
    v20 = v19;

    totalDistance = self->_totalDistance;
    v22 = v17 / totalDistance;
    if (v17 < 0.0)
      v22 = 0.0;
    v23 = v13 * v20 / totalDistance;
    if (v5)
    {
      self->_previousTimeStamp = v11;
      self->_skipTimeStamp = v11;
      self->_previousDisplacement = v22;
      self->_previousVelocity = v23;
      self->_previousAcceleration = 0.0;
      self->_averageVelocity = v23;
      self->_averageAcceleration = 0.0;
      self->_timestamps[0] = 0.0;
      self->_velocities[0] = v23;
      self->_accelerations[0] = 0.0;
      self->_sampleCount = 1;
      v7 = v36;
    }
    else
    {
      previousTimeStamp = self->_previousTimeStamp;
      v25 = v11 - self->_skipTimeStamp;
      self->_skipTimeStamp = v11;
      v7 = v36;
      if (v25 >= 0.01 || v25 > 0.001 && self->_previousDisplacement != v22)
      {
        v26 = v11 - previousTimeStamp;
        sampleCount = self->_sampleCount;
        v28 = sampleCount % 3;
        if (sampleCount > 2)
          self->_averageVelocity = (v23 + self->_averageVelocity * 3.0 - self->_velocities[v28]) / 3.0;
        else
          self->_averageVelocity = (v23 + self->_averageVelocity * (double)sampleCount) / (double)(sampleCount + 1);
        self->_velocities[v28] = v23;
        self->_timestamps[v28] = v26;
        v29 = (v23 - self->_previousVelocity) / v26;
        previousAcceleration = self->_previousAcceleration;
        v31 = vabdd_f64(v29, previousAcceleration);
        v32 = -5.0;
        if (v29 - previousAcceleration > 0.0)
          v32 = 5.0;
        v33 = previousAcceleration + v32;
        if (v31 > 5.0)
          v29 = v33;
        if (sampleCount > 2)
        {
          self->_averageAcceleration = (v29 + self->_averageAcceleration * 3.0 - self->_accelerations[v28]) / 3.0;
          v35 = sampleCount + 1;
        }
        else
        {
          v34 = v29 + self->_averageAcceleration * (double)sampleCount;
          v35 = sampleCount + 1;
          self->_averageAcceleration = v34 / (double)v35;
        }
        self->_accelerations[v28] = v29;
        self->_previousAcceleration = v29;
        self->_previousVelocity = v23;
        self->_previousDisplacement = v22;
        self->_previousTimeStamp = v11;
        self->_sampleCount = v35;
      }
    }
  }

}

- (BOOL)popGesture:(id)a3 withRemainingDuration:(double)a4 shouldPopWithVelocity:(double *)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double totalDistance;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;

  v8 = a3;
  v9 = v8;
  if (self->__useAugmentedShouldPopDecisionProcedure)
  {
    if (self->_sampleCount >= 3 && self->__interactionState == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
      -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
      v12 = v11;
      v13 = objc_msgSend(WeakRetained, "lastOperation");
      v14 = 1.0 - v12;
      if (v13 != 1)
        v14 = v12;
      totalDistance = self->_totalDistance;
      v16 = v14 + self->_averageAcceleration * 0.5 * a4 * a4 + self->_averageVelocity * a4 > fmin(187.5 / totalDistance, 0.5);
      *a5 = totalDistance * self->_previousVelocity;

    }
    else
    {
      objc_msgSend(v8, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "velocityInView:", v17);
      v19 = v18;

      v16 = self->_averageVelocity > 0.0 && self->__interactionState != 1;
      *(_QWORD *)a5 = v19;
    }
  }
  else
  {
    objc_msgSend(v8, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "velocityInView:", v20);
    v22 = v21;

    v16 = v22 >= 0.0;
  }

  return v16;
}

- (void)startInteractiveTransition
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startInteractiveTransition:", self);

}

- (double)_translationCoefficient
{
  _BOOL4 v3;
  _BOOL4 shouldReverseTranslation;
  double result;

  v3 = -[_UINavigationInteractiveTransitionBase _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  shouldReverseTranslation = self->_shouldReverseTranslation;
  if (!v3)
    shouldReverseTranslation = !self->_shouldReverseTranslation;
  result = -1.0;
  if (shouldReverseTranslation)
    return 1.0;
  return result;
}

- (BOOL)_shouldPauseRunningTransition
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "lastOperation") == 2)
  {
    objc_msgSend(v3, "_transitionConductor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "transitionWasCancelled");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)handleNavigationTransition:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  int v18;
  double v19;
  double v20;
  UICubicTimingParameters *v21;
  _BOOL4 v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v6);
  v8 = v7;

  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      self->_totalDistance = v11;
      self->__interactionState = 1;
      if (objc_msgSend(WeakRetained, "_isTransitioning")
        && -[_UINavigationInteractiveTransitionBase _shouldPauseRunningTransition](self, "_shouldPauseRunningTransition"))
      {
        -[UIPercentDrivenInteractiveTransition pauseInteractiveTransition](self, "pauseInteractiveTransition");
        -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
      }
      else
      {
        self->_wantsInteractiveStart = 1;
        -[_UINavigationInteractiveTransitionBase startInteractiveTransition](self, "startInteractiveTransition");
        self->_wantsInteractiveStart = 0;
        v12 = 0.0;
      }
      self->_percentCompleteWhenPaused = v12;
      -[_UINavigationInteractiveTransitionBase _updateStatistics:firstSample:finalSample:](self, "_updateStatistics:firstSample:finalSample:", v4, 1, 0);
      if (!self->__updateRequestActive)
      {
        _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, __interactiveNavigationUpdateRequest, 0x100029u);
        self->__updateRequestActive = 1;
      }
      break;
    case 2:
      -[_UINavigationInteractiveTransitionBase _translationCoefficient](self, "_translationCoefficient");
      v24 = v8 * v23 / v11;
      v25 = objc_msgSend(WeakRetained, "lastOperation");
      v26 = -v24;
      if (v25 != 1)
        v26 = v24;
      v27 = self->_percentCompleteWhenPaused + v26;
      if (+[UIView _fluidParallaxTransitionsEnabled]())
      {
        v28 = -[UIPanGestureRecognizer _scrollDeviceCategory](v4);
        _UIScrollViewRubberBandCoefficient(v28);
        +[_UIFluidNavigationTransitionsDomain parallaxSettings](_UIFluidNavigationTransitionsDomain, "parallaxSettings");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "rubberBandExtent");
        _UIScrollViewRubberBandOffsetWithoutDecorationForOffset(0, v27, 1.0, 0.0, v30);
        v27 = v31;

      }
      else if (v27 >= 1.0)
      {
        v27 = 0.999;
      }
      -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](self, "updateInteractiveTransition:", v27);
      -[_UINavigationInteractiveTransitionBase _updateStatistics:firstSample:finalSample:](self, "_updateStatistics:firstSample:finalSample:", v4, 0, 0);
      self->__interactionState = 2;
      break;
    case 3:
      -[_UINavigationInteractiveTransitionBase _updateStatistics:firstSample:finalSample:](self, "_updateStatistics:firstSample:finalSample:", v4, 0, 1);
      -[UIPercentDrivenInteractiveTransition duration](self, "duration");
      v14 = v13;
      -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
      v16 = v15;
      v32 = 0.0;
      v17 = -[_UINavigationInteractiveTransitionBase popGesture:withRemainingDuration:shouldPopWithVelocity:](self, "popGesture:withRemainingDuration:shouldPopWithVelocity:", v4, &v32, v14);
      self->__interactionState = 3;
      v18 = v17 ^ (objc_msgSend(WeakRetained, "lastOperation") == 1);
      v19 = 1.0 - v16;
      if (!v18)
        v19 = v16;
      v20 = v32;
      if (v32 != 0.0)
      {
        v20 = v14 / (v11 / fabs(v32));
        if (v19 < v20)
          v19 = v20;
      }
      -[UIPercentDrivenInteractiveTransition setCompletionSpeed:](self, "setCompletionSpeed:", v19, v20);
      v21 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", -[UIPercentDrivenInteractiveTransition completionCurve](self, "completionCurve"));
      -[UIPercentDrivenInteractiveTransition setTimingCurve:](self, "setTimingCurve:", v21);

      v22 = -[_UINavigationInteractiveTransitionBase _completesTransitionOnEnd](self, "_completesTransitionOnEnd");
      if (v18)
      {
        if (v22)
        {
          -[_UINavigationInteractiveTransitionBase finishInteractiveTransition](self, "finishInteractiveTransition");
          goto LABEL_30;
        }
        self->__stoppedTransitionWasCancelled = 0;
      }
      else
      {
        if (v22)
          goto LABEL_23;
        self->__stoppedTransitionWasCancelled = 1;
      }
      -[_UINavigationInteractiveTransitionBase _stopInteractiveTransition](self, "_stopInteractiveTransition");
      goto LABEL_30;
    case 4:
      self->__interactionState = 0;
LABEL_23:
      -[_UINavigationInteractiveTransitionBase cancelInteractiveTransition](self, "cancelInteractiveTransition");
LABEL_30:
      if (self->__updateRequestActive)
      {
        _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, __interactiveNavigationUpdateRequest, 0x100029u);
        self->__updateRequestActive = 0;
      }
      break;
    default:
      self->__interactionState = 0;
      -[_UINavigationInteractiveTransitionBase setNotInteractiveTransition](self, "setNotInteractiveTransition");
      break;
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UINavigationInteractiveTransitionBase *v5;
  _UINavigationInteractiveTransitionBaseDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  v5 = self;
  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v5) = objc_msgSend(WeakRetained, "interactiveTransition:gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", v5, v8, v7);

  return (char)v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id WeakRetained;
  char v5;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  if ((objc_msgSend(WeakRetained, "_isTransitioning") & 1) != 0
    || (objc_msgSend(WeakRetained, "needsDeferredTransition") & 1) != 0
    || self->__transitionWasStopped)
  {
    v5 = 0;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(v7, "shouldBeginInteractiveTransition:", self);

  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(WeakRetained, "interactiveTransition:gestureRecognizer:shouldReceiveTouch:", self, v6, v7);
  else
    v9 = 1;

  return v9;
}

- (BOOL)wantsInteractiveStart
{
  return self->_wantsInteractiveStart;
}

- (BOOL)_supportsCoordinatedPresentationDismissal
{
  return 1;
}

- (BOOL)shouldReverseTranslation
{
  return self->_shouldReverseTranslation;
}

- (_UINavigationParallaxTransition)animationController
{
  return self->_animationController;
}

- (int64_t)_interactionState
{
  return self->__interactionState;
}

- (BOOL)_transitionWasStopped
{
  return self->__transitionWasStopped;
}

- (void)_setTransitionWasStopped:(BOOL)a3
{
  self->__transitionWasStopped = a3;
}

- (BOOL)_stoppedTransitionWasCancelled
{
  return self->__stoppedTransitionWasCancelled;
}

- (void)_setStoppedTransitionWasCancelled:(BOOL)a3
{
  self->__stoppedTransitionWasCancelled = a3;
}

- (UIViewController)_parent
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__parent);
}

- (void)_setParent:(id)a3
{
  objc_storeWeak((id *)&self->__parent, a3);
}

- (BOOL)_useAugmentedShouldPopDecisionProcedure
{
  return self->__useAugmentedShouldPopDecisionProcedure;
}

- (void)_setUseAugmentedShouldPopDecisionProcedure:(BOOL)a3
{
  self->__useAugmentedShouldPopDecisionProcedure = a3;
}

- (BOOL)_completesTransitionOnEnd
{
  return self->__completesTransitionOnEnd;
}

- (_UINavigationInteractiveTransitionBaseDelegate)delegate
{
  return (_UINavigationInteractiveTransitionBaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_sampleCount = a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_totalDistance = a3;
}

- (double)skipTimeStamp
{
  return self->_skipTimeStamp;
}

- (void)setSkipTimeStamp:(double)a3
{
  self->_skipTimeStamp = a3;
}

- (double)previousTimeStamp
{
  return self->_previousTimeStamp;
}

- (void)setPreviousTimeStamp:(double)a3
{
  self->_previousTimeStamp = a3;
}

- (double)previousDisplacement
{
  return self->_previousDisplacement;
}

- (void)setPreviousDisplacement:(double)a3
{
  self->_previousDisplacement = a3;
}

- (double)previousVelocity
{
  return self->_previousVelocity;
}

- (void)setPreviousVelocity:(double)a3
{
  self->_previousVelocity = a3;
}

- (double)previousAcceleration
{
  return self->_previousAcceleration;
}

- (void)setPreviousAcceleration:(double)a3
{
  self->_previousAcceleration = a3;
}

- (double)averageVelocity
{
  return self->_averageVelocity;
}

- (void)setAverageVelocity:(double)a3
{
  self->_averageVelocity = a3;
}

- (double)averageAcceleration
{
  return self->_averageAcceleration;
}

- (void)setAverageAcceleration:(double)a3
{
  self->_averageAcceleration = a3;
}

@end
