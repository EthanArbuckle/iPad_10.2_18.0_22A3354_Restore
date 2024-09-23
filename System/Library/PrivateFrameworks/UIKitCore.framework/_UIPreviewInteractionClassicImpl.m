@implementation _UIPreviewInteractionClassicImpl

- (_UIPreviewInteractionClassicImpl)initWithView:(id)a3 previewInteraction:(id)a4
{
  id v7;
  id v8;
  _UIPreviewInteractionClassicImpl *v9;
  _UIPreviewInteractionClassicImpl *v10;
  _UIPreviewInteractionClassicImpl *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionClassicImpl.m"), 137, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIPreviewInteractionClassicImpl;
  v9 = -[_UIPreviewInteractionClassicImpl init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[_UIPreviewInteractionClassicImpl setPreviewInteraction:](v9, "setPreviewInteraction:", v8);
    objc_storeWeak((id *)&v10->_view, v7);
    v11 = v10;
  }

  return v10;
}

- (_UIPreviewInteractionClassicImpl)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithView_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionClassicImpl.m"), 148, CFSTR("Use %@ to instantiate an instance of %@."), v5, v7);

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIPreviewInteractionTouchForceProviding removeObserver:forKeyPath:](self->_touchForceProvider, "removeObserver:forKeyPath:", self, CFSTR("active"));
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewInteractionClassicImpl;
  -[_UIPreviewInteractionClassicImpl dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  char v10;
  __int16 previewInteractionFlags;
  __int16 v12;
  _UIPreviewInteractionCompatibilityTouchForceProvider *v13;
  id v14;
  _UIPreviewInteractionTouchForceProviding *v15;
  _UIPreviewInteractionTouchForceProviding *v16;
  _UIPreviewInteractionGestureRecognizerTouchForceProvider *v17;
  id v18;
  _UIPreviewInteractionTouchForceProviding *v19;
  _UIPreviewInteractionTouchForceProviding *systemTouchForceProvider;
  _QWORD v21[4];
  id v22;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    *(_WORD *)&self->_previewInteractionFlags = *(_WORD *)&self->_previewInteractionFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&self->_previewInteractionFlags = *(_WORD *)&self->_previewInteractionFlags & 0xFFFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&self->_previewInteractionFlags = *(_WORD *)&self->_previewInteractionFlags & 0xFFFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&self->_previewInteractionFlags = *(_WORD *)&self->_previewInteractionFlags & 0xFFF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_WORD *)&self->_previewInteractionFlags = *(_WORD *)&self->_previewInteractionFlags & 0xFFEF | v9;
    v10 = objc_opt_respondsToSelector();
    previewInteractionFlags = (__int16)self->_previewInteractionFlags;
    if ((v10 & 1) != 0)
      v12 = 32;
    else
      v12 = 0;
    *(_WORD *)&self->_previewInteractionFlags = previewInteractionFlags & 0xFFDF | v12;
    if ((previewInteractionFlags & 0x10) != 0)
    {
      objc_initWeak(&location, self);
      v17 = [_UIPreviewInteractionGestureRecognizerTouchForceProvider alloc];
      v18 = objc_loadWeakRetained((id *)&self->_view);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __48___UIPreviewInteractionClassicImpl_setDelegate___block_invoke;
      v21[3] = &unk_1E16DAEC8;
      objc_copyWeak(&v22, &location);
      v19 = -[_UIPreviewInteractionGestureRecognizerTouchForceProvider initWithView:configuration:](v17, "initWithView:configuration:", v18, v21);

      systemTouchForceProvider = self->_systemTouchForceProvider;
      self->_systemTouchForceProvider = v19;

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      v13 = [_UIPreviewInteractionCompatibilityTouchForceProvider alloc];
      v14 = objc_loadWeakRetained((id *)&self->_view);
      v15 = -[_UIPreviewInteractionCompatibilityTouchForceProvider initWithView:](v13, "initWithView:", v14);
      v16 = self->_systemTouchForceProvider;
      self->_systemTouchForceProvider = v15;

    }
    if (!self->_touchForceProvider)
      -[_UIPreviewInteractionClassicImpl setTouchForceProvider:](self, "setTouchForceProvider:", self->_systemTouchForceProvider);
  }

}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  _UIPreviewInteractionTouchForceProviding *touchForceProvider;
  double v4;
  double v5;
  CGPoint result;

  touchForceProvider = self->_touchForceProvider;
  if (touchForceProvider)
  {
    -[_UIPreviewInteractionTouchForceProviding locationInCoordinateSpace:](touchForceProvider, "locationInCoordinateSpace:", a3);
  }
  else
  {
    v4 = 1.79769313e308;
    v5 = 1.79769313e308;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)cancelInteraction
{
  *(_WORD *)&self->_previewInteractionFlags |= 0x200u;
  -[_UIPreviewInteractionClassicImpl _endHighlightingIfNeeded](self, "_endHighlightingIfNeeded");
  -[_UIPreviewInteractionClassicImpl _dismissPreviewViewControllerIfNeeded](self, "_dismissPreviewViewControllerIfNeeded");
  -[_UIPreviewInteractionTouchForceProviding cancelInteraction](self->_touchForceProvider, "cancelInteraction");
  -[_UIPreviewInteractionClassicImpl _endInteractionIfNeeded](self, "_endInteractionIfNeeded");
}

- (void)_startPreviewAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  _UIPreviewInteractionSimulatingTouchForceProvider *v8;

  y = a3.y;
  x = a3.x;
  *(_WORD *)&self->_previewInteractionFlags |= 0xC000u;
  v7 = a4;
  v8 = -[_UIPreviewInteractionSimulatingTouchForceProvider initWithTouchForce:location:coordinateSpace:]([_UIPreviewInteractionSimulatingTouchForceProvider alloc], "initWithTouchForce:location:coordinateSpace:", v7, 3.5, x, y);

  -[_UIPreviewInteractionClassicImpl setTouchForceProvider:](self, "setTouchForceProvider:", v8);
}

- (void)setTouchForceProvider:(id)a3
{
  _UIPreviewInteractionTouchForceProviding *v4;
  _UIPreviewInteractionTouchForceProviding *touchForceProvider;
  _UIPreviewInteractionTouchForceProviding *obj;

  v4 = (_UIPreviewInteractionTouchForceProviding *)a3;
  if (!v4)
    v4 = self->_systemTouchForceProvider;
  touchForceProvider = self->_touchForceProvider;
  if (touchForceProvider != v4)
  {
    obj = v4;
    -[_UIPreviewInteractionTouchForceProviding removeObserver:forKeyPath:](touchForceProvider, "removeObserver:forKeyPath:", self, CFSTR("active"));
    objc_storeStrong((id *)&self->_touchForceProvider, obj);
    -[_UIPreviewInteractionTouchForceProviding addObserver:forKeyPath:options:context:](obj, "addObserver:forKeyPath:options:context:", self, CFSTR("active"), 1, 0);
    -[_UIPreviewInteractionClassicImpl _updateForCurrentTouchForceProvider](self, "_updateForCurrentTouchForceProvider");
    v4 = obj;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_touchForceProvider == a4)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("active")))
      -[_UIPreviewInteractionClassicImpl _updateForCurrentTouchForceProvider](self, "_updateForCurrentTouchForceProvider");
  }
}

- (void)_updateForCurrentTouchForceProvider
{
  _UIPreviewInteractionStateRecognizer *currentInteractionStateRecognizer;

  if (-[_UIPreviewInteractionTouchForceProviding isActive](self->_touchForceProvider, "isActive"))
  {
    -[_UIPreviewInteractionClassicImpl _prepareForInteractionIfNeeded](self, "_prepareForInteractionIfNeeded");
  }
  else if ((*(_WORD *)&self->_previewInteractionFlags & 0x40) != 0
         || (currentInteractionStateRecognizer = self->_currentInteractionStateRecognizer) != 0
         && !-[_UIPreviewInteractionStateRecognizer currentState](currentInteractionStateRecognizer, "currentState"))
  {
    -[_UIPreviewInteractionClassicImpl _endInteractionIfNeeded](self, "_endInteractionIfNeeded");
  }
}

- (void)_prepareForInteractionIfNeeded
{
  _UIPreviewInteractionStateRecognizer *v3;
  _UIPreviewInteractionStateRecognizer *currentInteractionStateRecognizer;
  CADisplayLink *v5;
  void *v6;
  void *v7;
  CADisplayLink *continuousEvaluationDisplayLink;
  CADisplayLink *v9;

  if (!self->_currentInteractionStateRecognizer)
  {
    v3 = objc_alloc_init(_UIPreviewInteractionStateRecognizer);
    currentInteractionStateRecognizer = self->_currentInteractionStateRecognizer;
    self->_currentInteractionStateRecognizer = v3;

    -[_UIPreviewInteractionStateRecognizer setMinimumPreviewDuration:](self->_currentInteractionStateRecognizer, "setMinimumPreviewDuration:", 0.2);
    -[_UIPreviewInteractionStateRecognizer setShouldDelayReveal:](self->_currentInteractionStateRecognizer, "setShouldDelayReveal:", (*(_WORD *)&self->_previewInteractionFlags & 0x10) == 0);
    self->_sceneReferenceLocationFromLatestUpdate = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  }
  if (!self->_continuousEvaluationDisplayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__updateForContinuousEvaluation_);
    v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v7, CFSTR("UITrackingRunLoopMode"));

    -[CADisplayLink setPreferredFramesPerSecond:](v5, "setPreferredFramesPerSecond:", 60);
    continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
    self->_continuousEvaluationDisplayLink = v5;
    v9 = v5;

    -[_UIPreviewInteractionClassicImpl _updateForContinuousEvaluation:](self, "_updateForContinuousEvaluation:", v9);
  }
}

- (void)_endContinuousEvaluation
{
  CADisplayLink *continuousEvaluationDisplayLink;
  _UIPreviewInteractionStateRecognizer *currentInteractionStateRecognizer;

  -[CADisplayLink invalidate](self->_continuousEvaluationDisplayLink, "invalidate");
  continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  self->_continuousEvaluationDisplayLink = 0;

  currentInteractionStateRecognizer = self->_currentInteractionStateRecognizer;
  self->_currentInteractionStateRecognizer = 0;

}

- (void)_endInteractiveStateTransitions
{
  -[_UIPreviewInteractionClassicImpl _endContinuousEvaluation](self, "_endContinuousEvaluation");
  -[_UIPreviewInteractionClassicImpl _endUsingFeedbackIfNeeded](self, "_endUsingFeedbackIfNeeded");
  *(_WORD *)&self->_previewInteractionFlags &= ~0x40u;
}

- (void)_resetAfterInteraction
{
  -[_UIPreviewInteractionClassicImpl _endViewControllerPresentationObserving](self, "_endViewControllerPresentationObserving");
  -[_UIPreviewInteractionClassicImpl _endContinuousEvaluation](self, "_endContinuousEvaluation");
  -[_UIPreviewInteractionClassicImpl _endHighlightingIfNeeded](self, "_endHighlightingIfNeeded");
  *(_WORD *)&self->_previewInteractionFlags = *(_WORD *)&self->_previewInteractionFlags & 0x3F | 0x100;
  -[_UIPreviewInteractionClassicImpl setTouchForceProvider:](self, "setTouchForceProvider:", 0);
}

- (void)_updateForContinuousEvaluation:(id)a3
{
  _UIPreviewInteractionTouchForceProviding *touchForceProvider;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  touchForceProvider = self->_touchForceProvider;
  if (touchForceProvider
    && (-[_UIPreviewInteractionTouchForceProviding isActive](touchForceProvider, "isActive") & 1) == 0
    && (*(_WORD *)&self->_previewInteractionFlags & 0xC0) != 0)
  {
    -[_UIPreviewInteractionClassicImpl _endInteractionIfNeeded](self, "_endInteractionIfNeeded");
  }
  -[_UIPreviewInteractionClassicImpl _prepareUsingFeedbackIfNeeded](self, "_prepareUsingFeedbackIfNeeded");
  -[_UIPreviewInteractionTouchForceProviding touchForce](self->_touchForceProvider, "touchForce");
  v6 = v5;
  v7 = CACurrentMediaTime();
  -[_UIPreviewInteractionTouchForceProviding locationInCoordinateSpace:](self->_touchForceProvider, "locationInCoordinateSpace:", 0);
  -[_UIPreviewInteractionClassicImpl _updateInteractionStateRecognizerForTouchForce:atTimestamp:withCentroidAtLocation:](self, "_updateInteractionStateRecognizerForTouchForce:atTimestamp:withCentroidAtLocation:", v6, v7, v8, v9);

}

- (void)_updateInteractionStateRecognizerForTouchForce:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5
{
  double y;
  double x;
  _UIPreviewInteractionStateRecognizer *v10;
  __int16 previewInteractionFlags;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  __int16 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  int v33;
  double v35;
  double v36;
  double v37;
  void *v38;
  _UIPreviewInteractionStateRecognizer *v39;
  _UIPreviewInteractionStateRecognizer *v40;

  y = a5.y;
  x = a5.x;
  v10 = self->_currentInteractionStateRecognizer;
  if (v10)
  {
    previewInteractionFlags = (__int16)self->_previewInteractionFlags;
    if ((previewInteractionFlags & 0x100) != 0)
    {
      if (a3 >= 1.0)
        goto LABEL_50;
      *(_WORD *)&self->_previewInteractionFlags = previewInteractionFlags & 0xFE7F;
      v39 = v10;
      -[_UIPreviewInteractionStateRecognizer reset](v10, "reset");
      v10 = v39;
      previewInteractionFlags = (__int16)self->_previewInteractionFlags;
    }
    if ((previewInteractionFlags & 0x80) == 0)
    {
      v40 = v10;
      -[_UIPreviewInteractionStateRecognizer evaluateWithTouchForce:atTimestamp:withCentroidAtLocation:](v10, "evaluateWithTouchForce:atTimestamp:withCentroidAtLocation:", a3, a4, x, y);
      v12 = *(_WORD *)&self->_previewInteractionFlags << 18 >> 29;
      v13 = -[_UIPreviewInteractionStateRecognizer currentState](v40, "currentState");
      v14 = (__int16)self->_previewInteractionFlags;
      v15 = 2;
      if ((v14 & 0x4000) == 0)
        v15 = v13;
      if (v15 >= v12)
        v16 = v15;
      else
        v16 = (__int16)((__int16)(4 * v14) >> 13);
      *(_WORD *)&self->_previewInteractionFlags = ((v16 & 7) << 11) | v14 & 0xC7FF;
      -[_UIPreviewInteractionClassicImpl delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 <= v12)
        goto LABEL_33;
      if (v16 < 1)
        goto LABEL_20;
      if ((*(_WORD *)&self->_previewInteractionFlags & 0x40) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "previewInteractionShouldBegin:", v18);

          if ((v19 & 1) == 0)
          {
            *(_WORD *)&self->_previewInteractionFlags |= 0x180u;
LABEL_49:

            v10 = v40;
            goto LABEL_50;
          }
        }
        *(_WORD *)&self->_previewInteractionFlags |= 0x40u;
        -[_UIPreviewInteractionClassicImpl _prepareUsingFeedback](self, "_prepareUsingFeedback");
        -[_UIPreviewInteractionClassicImpl _prepareHighlighterIfNeeded](self, "_prepareHighlighterIfNeeded");
      }
      if ((unint64_t)v16 <= 1)
      {
        v16 = 1;
        -[_UIPreviewInteractionClassicImpl _actuateFeedbackForStateIfNeeded:](self, "_actuateFeedbackForStateIfNeeded:", 1);
LABEL_33:
        v31 = (__int16)self->_previewInteractionFlags;
        if ((v31 & 0x40) != 0 && v16 != 3)
        {
          v32 = v16 + 1;
          v33 = v31 & 2;
          if (v32 == 3 && v33 == 0)
          {
            -[_UIPreviewInteractionClassicImpl _endInteractiveStateTransitions](self, "_endInteractiveStateTransitions");
            -[_UIPreviewInteractionClassicImpl _endInteractionIfNeeded](self, "_endInteractionIfNeeded");
          }
          else
          {
            -[_UIPreviewInteractionStateRecognizer currentProgressToState:](v40, "currentProgressToState:", v32);
            v36 = v35;
            if (v35 > 0.0
              || (*(_WORD *)&self->_previewInteractionFlags & 0x400) == 0
              || self->_sceneReferenceLocationFromLatestUpdate.x != x
              || self->_sceneReferenceLocationFromLatestUpdate.y != y)
            {
              v37 = fmax(v35, 0.0);
              -[_UIPreviewInteractionClassicImpl _updateFeedbackTowardNextState:progress:](self, "_updateFeedbackTowardNextState:progress:", v32, v37);
              -[_UIPreviewInteractionClassicImpl _updateHighlighter:](self, "_updateHighlighter:", v37);
              -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32 == 3)
                objc_msgSend(v17, "previewInteraction:didUpdateCommitTransition:ended:", v38, 0, v37);
              else
                objc_msgSend(v17, "previewInteraction:didUpdatePreviewTransition:ended:", v38, 0, v37);

              *(_WORD *)&self->_previewInteractionFlags = *(_WORD *)&self->_previewInteractionFlags & 0xFBFF | ((v36 <= 0.0) << 10);
              self->_sceneReferenceLocationFromLatestUpdate.x = x;
              self->_sceneReferenceLocationFromLatestUpdate.y = y;
            }
          }
        }
        goto LABEL_49;
      }
      if (-[_UIPreviewInteractionClassicImpl _shouldCancelTransitionToState:](self, "_shouldCancelTransitionToState:", v16))
      {
        -[_UIPreviewInteractionClassicImpl _actuateFeedbackForStateIfNeeded:](self, "_actuateFeedbackForStateIfNeeded:", 0);
        v20 = (__int16)self->_previewInteractionFlags;
      }
      else
      {
LABEL_20:
        -[_UIPreviewInteractionClassicImpl _actuateFeedbackForStateIfNeeded:](self, "_actuateFeedbackForStateIfNeeded:", v16);
        v20 = (__int16)self->_previewInteractionFlags;
        if (v16)
        {
          if (v16 == 3)
          {
            if ((v20 & 2) != 0)
            {
              +[_UIStatistics previewInteractionPopCount](_UIStatistics, "previewInteractionPopCount");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "incrementValueBy:", 1);

              _UIPowerLogPopOccured();
              *(_WORD *)&self->_previewInteractionFlags &= ~0x40u;
              -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "previewInteraction:didUpdateCommitTransition:ended:", v30, 1, 1.0);

              -[_UIPreviewInteractionClassicImpl _resetAfterInteraction](self, "_resetAfterInteraction");
            }
            v16 = 3;
          }
          else if (v16 == 2)
          {
            +[_UIStatistics previewInteractionTapCount](_UIStatistics, "previewInteractionTapCount");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSampleRate:", 0.0);

            +[_UIStatistics previewInteractionPeekCount](_UIStatistics, "previewInteractionPeekCount");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "incrementValueBy:", 1);

            if ((v20 & 2) != 0)
            {
              +[_UIStatistics previewInteractionPeekDuration](_UIStatistics, "previewInteractionPeekDuration");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "startTimingForObject:", self);

            }
            _UIPowerLogPeekBegan();
            -[_UIPreviewInteractionClassicImpl _updateHighlighter:](self, "_updateHighlighter:", 1.0);
            -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "previewInteraction:didUpdatePreviewTransition:ended:", v24, 1, 1.0);

            -[_UIPreviewInteractionClassicImpl _presentPreviewViewControllerIfNeeded](self, "_presentPreviewViewControllerIfNeeded");
            v16 = 2;
          }
          goto LABEL_33;
        }
      }
      *(_WORD *)&self->_previewInteractionFlags = v20 & 0xFFBF;
      -[_UIPreviewInteractionHighlighter setShouldEndWithCancelAnimation:](self->_highlighter, "setShouldEndWithCancelAnimation:", 1);
      if (self->_highlighter)
      {
        v25 = (void *)UIApp;
        -[_UIPreviewInteractionClassicImpl view](self, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_window");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_eventRoutingScene");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_cancelAllEventsOfType:onEventRoutingScene:", 0, v28);

      }
      -[_UIPreviewInteractionClassicImpl _resetAfterInteraction](self, "_resetAfterInteraction");
      v16 = 0;
      goto LABEL_33;
    }
  }
LABEL_50:

}

- (void)_endInteractionIfNeeded
{
  __int16 previewInteractionFlags;
  _UIPreviewInteractionStateRecognizer *currentInteractionStateRecognizer;
  void *v5;
  void *v6;
  id v7;

  previewInteractionFlags = (__int16)self->_previewInteractionFlags;
  -[_UIPreviewInteractionClassicImpl _resetAfterInteraction](self, "_resetAfterInteraction");
  currentInteractionStateRecognizer = self->_currentInteractionStateRecognizer;
  self->_currentInteractionStateRecognizer = 0;

  *(_WORD *)&self->_previewInteractionFlags &= ~0x100u;
  -[_UIPreviewInteractionClassicImpl _endUsingFeedbackIfNeeded](self, "_endUsingFeedbackIfNeeded");
  if ((previewInteractionFlags & 0x240) == 0x40)
  {
    -[_UIPreviewInteractionClassicImpl delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewInteractionDidCancel:", v6);

  }
  +[_UIStatistics previewInteractionPeekDuration](_UIStatistics, "previewInteractionPeekDuration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isTimingForObject:", self))
  {
    if ((previewInteractionFlags & 0x200) != 0)
      objc_msgSend(v7, "cancelTimingForObject:", self);
    else
      objc_msgSend(v7, "recordTimingForObject:", self);
    _UIPowerLogPeekEnded();
  }

}

- (void)_prepareUsingFeedbackIfNeeded
{
  _UIPreviewInteractionTouchForceProviding *touchForceProvider;
  _UIDeepPressAnalyzer *deepPressAnalyzer;
  _UIDeepPressAnalyzer *v5;
  _UIDeepPressAnalyzer *v6;
  double v7;
  double v8;
  _UIPreviewInteractionTouchForceProviding *v9;
  id WeakRetained;
  double v11;
  double v12;

  if (!self->_feedbackGenerator)
  {
    touchForceProvider = self->_touchForceProvider;
    if (touchForceProvider)
    {
      if ((*(_WORD *)&self->_previewInteractionFlags & 0x80000000) == 0)
      {
        deepPressAnalyzer = self->_deepPressAnalyzer;
        if (!deepPressAnalyzer)
        {
          v5 = objc_alloc_init(_UIDeepPressAnalyzer);
          v6 = self->_deepPressAnalyzer;
          self->_deepPressAnalyzer = v5;

          deepPressAnalyzer = self->_deepPressAnalyzer;
          touchForceProvider = self->_touchForceProvider;
        }
        -[_UIPreviewInteractionTouchForceProviding touchForce](touchForceProvider, "touchForce");
        v8 = v7;
        v9 = self->_touchForceProvider;
        WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        -[_UIPreviewInteractionTouchForceProviding locationInCoordinateSpace:](v9, "locationInCoordinateSpace:", WeakRetained);
        -[_UIDeepPressAnalyzer analyzeTouchForce:centroidAtLocation:](deepPressAnalyzer, "analyzeTouchForce:centroidAtLocation:", v8, v11, v12);

        if (-[_UIDeepPressAnalyzer isDeepPressLikely](self->_deepPressAnalyzer, "isDeepPressLikely"))
          -[_UIPreviewInteractionClassicImpl _prepareUsingFeedback](self, "_prepareUsingFeedback");
      }
    }
  }
}

- (void)_prepareUsingFeedback
{
  _UIStatesFeedbackGenerator *v3;
  id WeakRetained;
  _UIStatesFeedbackGenerator *v5;
  _UIStatesFeedbackGenerator *feedbackGenerator;
  id v7;

  if (!self->_feedbackGenerator)
  {
    +[_UIStatesFeedbackGeneratorPreviewConfiguration defaultConfiguration](_UIStatesFeedbackGeneratorPreviewConfiguration, "defaultConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [_UIStatesFeedbackGenerator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v5 = -[_UIStatesFeedbackGenerator initWithConfiguration:view:](v3, "initWithConfiguration:view:", v7, WeakRetained);
    feedbackGenerator = self->_feedbackGenerator;
    self->_feedbackGenerator = v5;

    -[UIFeedbackGenerator activateWithCompletionBlock:](self->_feedbackGenerator, "activateWithCompletionBlock:", 0);
  }
}

- (void)_endUsingFeedbackIfNeeded
{
  _UIStatesFeedbackGenerator *feedbackGenerator;
  _UIDeepPressAnalyzer *deepPressAnalyzer;

  -[_UIPreviewInteractionClassicImpl _turnOffFeedbackGenerator](self, "_turnOffFeedbackGenerator");
  -[UIFeedbackGenerator deactivate](self->_feedbackGenerator, "deactivate");
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = 0;

  deepPressAnalyzer = self->_deepPressAnalyzer;
  self->_deepPressAnalyzer = 0;

}

- (void)_turnOnFeedbackGenerator
{
  if (!self->_feedbackGeneratorTurnedOn)
  {
    -[UIFeedbackGenerator _activateWithStyle:completionBlock:](self->_feedbackGenerator, "_activateWithStyle:completionBlock:", 2, 0);
    self->_feedbackGeneratorTurnedOn = 1;
  }
}

- (void)_turnOffFeedbackGenerator
{
  if (self->_feedbackGeneratorTurnedOn)
  {
    -[UIFeedbackGenerator _deactivateWithStyle:](self->_feedbackGenerator, "_deactivateWithStyle:", 2);
    self->_feedbackGeneratorTurnedOn = 0;
  }
}

- (void)_actuateFeedbackForStateIfNeeded:(int64_t)a3
{
  _UIStatesFeedbackGenerator *feedbackGenerator;
  $93CAF7BAECAC17ADD94959AE568FF036 previewInteractionFlags;
  __CFString **v6;

  feedbackGenerator = self->_feedbackGenerator;
  if (feedbackGenerator)
  {
    previewInteractionFlags = self->_previewInteractionFlags;
    if ((*(_DWORD *)&previewInteractionFlags & 0x80000000) == 0)
    {
      switch(a3)
      {
        case 0:
          if ((*(_BYTE *)&previewInteractionFlags & 4) != 0)
          {
            v6 = _UIStatesFeedbackGeneratorForcePresentationStateCancel;
            goto LABEL_10;
          }
          break;
        case 1:
          -[_UIPreviewInteractionClassicImpl _turnOnFeedbackGenerator](self, "_turnOnFeedbackGenerator");
          break;
        case 2:
          v6 = _UIStatesFeedbackGeneratorForcePresentationStatePreview;
          goto LABEL_10;
        case 3:
          v6 = _UIStatesFeedbackGeneratorForcePresentationStateCommit;
LABEL_10:
          -[_UIStatesFeedbackGenerator transitionToState:ended:](feedbackGenerator, "transitionToState:ended:", *v6, 1);
          break;
        default:
          return;
      }
    }
  }
}

- (void)_updateFeedbackTowardNextState:(int64_t)a3 progress:(double)a4
{
  _UIStatesFeedbackGenerator *feedbackGenerator;

  feedbackGenerator = self->_feedbackGenerator;
  if (feedbackGenerator
    && (a3 & 0xFFFFFFFFFFFFFFFELL) == 2
    && (*(_WORD *)&self->_previewInteractionFlags & 0x80000000) == 0)
  {
    -[_UIStatesFeedbackGenerator transitionToState:updated:](feedbackGenerator, "transitionToState:updated:", CFSTR("preview"), a4);
  }
}

- (BOOL)_shouldCancelTransitionToState:(int64_t)a3
{
  int v3;
  void *v5;
  void *v6;

  if ((*(_WORD *)&self->_previewInteractionFlags & 4) != 0)
  {
    -[_UIPreviewInteractionClassicImpl delegate](self, "delegate", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "_previewInteractionShouldFinishTransitionToPreview:", v6) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_prepareHighlighterIfNeeded
{
  _UIPreviewInteractionHighlighter **p_highlighter;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  p_highlighter = &self->_highlighter;
  if (self->_highlighter || (*(_WORD *)&self->_previewInteractionFlags & 0x10) == 0)
    return;
  -[_UIPreviewInteractionClassicImpl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_previewInteractionFlags & 0x10) == 0)
    goto LABEL_4;
  -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_previewInteractionHighlighterForPreviewTransition:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionClassicImpl.m"), 656, CFSTR("_previewInteractionHighlighterForPreviewTransition needs to return a valid highlighter."));

LABEL_4:
    v6 = 0;
  }
  -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_prepareForInteraction:", v8);

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_UIPreviewInteractionTouchForceProviding gestureRecognizer](self->_systemTouchForceProvider, "gestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "cancelsInteractionWhenScrolling");
      v11 = 0.0;
      if (v10)
        v11 = 10.0;
      objc_msgSend(v9, "setAllowableMovement:", v11);

    }
  }
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __63___UIPreviewInteractionClassicImpl__prepareHighlighterIfNeeded__block_invoke;
  v16 = &unk_1E16B3F40;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v6, "setPrivateCompletionBlock:", &v13);
  objc_storeStrong((id *)p_highlighter, v6);
  -[_UIPreviewInteractionClassicImpl _prepareForViewControllerPresentationObserving](self, "_prepareForViewControllerPresentationObserving", v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_updateHighlighter:(double)a3
{
  _UIPreviewInteractionHighlighter *highlighter;
  id v5;

  if (!self->_viewControllerHelper)
  {
    highlighter = self->_highlighter;
    -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionHighlighter _updateFromInteraction:fractionComplete:ended:](highlighter, "_updateFromInteraction:fractionComplete:ended:", v5, 0, a3);

  }
}

- (void)_endHighlightingIfNeeded
{
  _UIPreviewInteractionHighlighter *highlighter;
  void *v4;

  if (!self->_viewControllerHelper)
  {
    highlighter = self->_highlighter;
    -[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionHighlighter _updateFromInteraction:fractionComplete:ended:](highlighter, "_updateFromInteraction:fractionComplete:ended:", v4, 1, 0.0);

    -[_UIPreviewInteractionHighlighter setShouldEndWithCancelAnimation:](self->_highlighter, "setShouldEndWithCancelAnimation:", 0);
  }
}

- (void)_presentPreviewViewControllerIfNeeded
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _UIPreviewInteractionViewControllerHelper *v12;
  _UIPreviewInteractionViewControllerHelper *viewControllerHelper;
  _UIPreviewInteractionViewControllerHelper *v14;
  _UIPreviewInteractionHighlighter *highlighter;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  if (self->_highlighter && !self->_viewControllerHelper && (*(_WORD *)&self->_previewInteractionFlags & 0x20) != 0)
  {
    -[_UIPreviewInteractionClassicImpl delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "_viewControllerForAncestor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionClassicImpl.m"), 718, CFSTR("UIPreviewInteraction cannot determine presenting view controller."));

    }
    if ((*(_WORD *)&self->_previewInteractionFlags & 0x20) != 0
      && (-[_UIPreviewInteractionClassicImpl previewInteraction](self, "previewInteraction"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "_previewInteraction:viewControllerPresentationForPresentingViewController:", v7, v6),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      objc_msgSend(v8, "viewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v6)
      {
        objc_msgSend(v8, "viewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parentViewController");
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionClassicImpl.m"), 733, CFSTR("UIPreviewInteraction cannot determine presenting view controller."));

          v6 = 0;
        }
      }
      v12 = -[_UIPreviewInteractionViewControllerHelper initWithViewControllerPresentation:]([_UIPreviewInteractionViewControllerHelper alloc], "initWithViewControllerPresentation:", v8);
      viewControllerHelper = self->_viewControllerHelper;
      self->_viewControllerHelper = v12;

      objc_initWeak(&location, self);
      -[_UIPreviewInteractionHighlighter setPrivateCompletionBlock:](self->_highlighter, "setPrivateCompletionBlock:", 0);
      highlighter = self->_highlighter;
      v14 = self->_viewControllerHelper;
      v16 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __73___UIPreviewInteractionClassicImpl__presentPreviewViewControllerIfNeeded__block_invoke;
      v22[3] = &unk_1E16B3F40;
      objc_copyWeak(&v23, &location);
      v20[0] = v16;
      v20[1] = 3221225472;
      v20[2] = __73___UIPreviewInteractionClassicImpl__presentPreviewViewControllerIfNeeded__block_invoke_2;
      v20[3] = &unk_1E16B3F40;
      objc_copyWeak(&v21, &location);
      -[_UIPreviewInteractionViewControllerHelper presentViewControllerFromViewController:highlighter:presentationCompletion:dismissalCompletion:](v14, "presentViewControllerFromViewController:highlighter:presentationCompletion:dismissalCompletion:", v6, highlighter, v22, v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

    }
    else
    {
      -[_UIPreviewInteractionClassicImpl touchForceProvider](self, "touchForceProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cancelInteraction");

    }
  }
}

- (void)_dismissPreviewViewControllerIfNeeded
{
  _UIPreviewInteractionViewControllerHelper *viewControllerHelper;

  viewControllerHelper = self->_viewControllerHelper;
  if (viewControllerHelper)
    -[_UIPreviewInteractionViewControllerHelper dismissViewController](viewControllerHelper, "dismissViewController");
}

- (id)_gestureRecognizerForExclusionRelationship
{
  return 0;
}

- (void)_prepareForViewControllerPresentationObserving
{
  void *v3;
  void *v4;
  id viewControllerPresentationObserver;
  _QWORD v6[5];
  id v7;
  id location;

  if (!self->_viewControllerPresentationObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82___UIPreviewInteractionClassicImpl__prepareForViewControllerPresentationObserving__block_invoke;
    v6[3] = &unk_1E16CB250;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIInternalViewControllerPresentationWillBeginNotification"), 0, 0, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    viewControllerPresentationObserver = self->_viewControllerPresentationObserver;
    self->_viewControllerPresentationObserver = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_endViewControllerPresentationObserving
{
  void *v3;
  id viewControllerPresentationObserver;

  if (self->_viewControllerPresentationObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_viewControllerPresentationObserver);

    viewControllerPresentationObserver = self->_viewControllerPresentationObserver;
    self->_viewControllerPresentationObserver = 0;

  }
}

- (UIPreviewInteractionDelegate)delegate
{
  return (UIPreviewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UIPreviewInteractionTouchForceProviding)touchForceProvider
{
  return self->_touchForceProvider;
}

- (UIPreviewInteraction)previewInteraction
{
  return (UIPreviewInteraction *)objc_loadWeakRetained((id *)&self->_previewInteraction);
}

- (void)setPreviewInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_previewInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previewInteraction);
  objc_storeStrong((id *)&self->_touchForceProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_viewControllerPresentationObserver, 0);
  objc_storeStrong((id *)&self->_viewControllerHelper, 0);
  objc_storeStrong((id *)&self->_highlighter, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_deepPressAnalyzer, 0);
  objc_storeStrong((id *)&self->_continuousEvaluationDisplayLink, 0);
  objc_storeStrong((id *)&self->_currentInteractionStateRecognizer, 0);
  objc_storeStrong((id *)&self->_systemTouchForceProvider, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
