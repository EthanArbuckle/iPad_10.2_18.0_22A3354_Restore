@implementation UIPreviewForceInteractionProgress

- (UIPreviewForceInteractionProgress)initWithView:(id)a3 targetState:(int64_t)a4
{
  id v7;
  int64_t v8;
  UIPreviewForceInteractionProgress *v9;
  void *v11;

  v7 = a3;
  if (a4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewForceInteractionProgress.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetState > UIPreviewForceStateNone"));

  }
  if ((unint64_t)(a4 - 1) >= 3)
    v8 = 0xFFFFFFFF80000000;
  else
    v8 = a4 - 1;
  v9 = -[UIPreviewForceInteractionProgress initWithView:targetState:minimumRequiredState:](self, "initWithView:targetState:minimumRequiredState:", v7, a4, v8);

  return v9;
}

- (UIPreviewForceInteractionProgress)initWithView:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5
{
  id v9;
  void *v10;
  UIPreviewForceInteractionProgress *v11;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  if (a4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewForceInteractionProgress.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetState > UIPreviewForceStateNone"));

  }
  if (a5 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewForceInteractionProgress.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minimumState < UIPreviewForceStateCommit"));

  }
  if (a5 >= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewForceInteractionProgress.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minimumState < targetState"));

  }
  objc_msgSend(v9, "_touchForceObservable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIPreviewForceInteractionProgress _initWithObservable:targetState:minimumRequiredState:](self, "_initWithObservable:targetState:minimumRequiredState:", v10, a4, a5);

  return v11;
}

- (UIPreviewForceInteractionProgress)initWithGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  UIPreviewForceInteractionProgress *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "requiredPreviewForceState");
  if ((unint64_t)(v5 - 1) >= 3)
    v6 = 0xFFFFFFFF80000000;
  else
    v6 = v5 - 1;
  v7 = -[UIPreviewForceInteractionProgress initWithGestureRecognizer:minimumRequiredState:](self, "initWithGestureRecognizer:minimumRequiredState:", v4, v6);

  if (v7)
    v7->_updateMinimumStateWithTargetState = 1;
  return v7;
}

- (UIPreviewForceInteractionProgress)initWithGestureRecognizer:(id)a3 minimumRequiredState:(int64_t)a4
{
  id v7;
  void *v8;
  UIPreviewForceInteractionProgress *v9;
  void *v10;
  uint64_t v11;
  NSObservation *targetStateUpdateObservation;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v7 = a3;
  if (a4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewForceInteractionProgress.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minimumState < UIPreviewForceStateCommit"));

  }
  objc_msgSend(v7, "_touchForceObservable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIPreviewForceInteractionProgress _initWithObservable:targetState:minimumRequiredState:](self, "_initWithObservable:targetState:minimumRequiredState:", v8, objc_msgSend(v7, "requiredPreviewForceState"), a4);

  if (v9)
  {
    v9->_completesAtTargetState = 0;
    objc_initWeak(&location, v9);
    objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v7, "requiredPreviewForceState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__UIPreviewForceInteractionProgress_initWithGestureRecognizer_minimumRequiredState___block_invoke;
    v15[3] = &unk_1E16DC470;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v10, "addObserverBlock:", v15);
    v11 = objc_claimAutoreleasedReturnValue();
    targetStateUpdateObservation = v9->_targetStateUpdateObservation;
    v9->_targetStateUpdateObservation = (NSObservation *)v11;

    -[UIPreviewForceInteractionProgress _setGestureBeginObservable:](v9, "_setGestureBeginObservable:", v7);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __84__UIPreviewForceInteractionProgress_initWithGestureRecognizer_minimumRequiredState___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "integerValue");

  objc_msgSend(WeakRetained, "_setTargetState:", v4);
}

- (void)_setGestureBeginObservable:(id)a3
{
  id *v4;
  void *v5;
  NSObservation *v6;
  NSObservation *gestureBeganObservation;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = (id *)a3;
  objc_initWeak(&location, self);
  -[UIGestureRecognizer _beganObservable](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__UIPreviewForceInteractionProgress__setGestureBeginObservable___block_invoke;
  v8[3] = &unk_1E16DC498;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "addObserverBlock:", v8);
  v6 = (NSObservation *)objc_claimAutoreleasedReturnValue();
  gestureBeganObservation = self->_gestureBeganObservation;
  self->_gestureBeganObservation = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __64__UIPreviewForceInteractionProgress__setGestureBeginObservable___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
    objc_msgSend(WeakRetained, "_gestureRecognizerBegan:", objc_msgSend(v4, "BOOLValue"));

}

- (id)_initWithView:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5 useLinearClassifier:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;

  v6 = a6;
  objc_msgSend(a3, "_touchForceObservable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIPreviewForceInteractionProgress _initWithObservable:targetState:minimumRequiredState:useLinearClassifier:](self, "_initWithObservable:targetState:minimumRequiredState:useLinearClassifier:", v10, a4, a5, v6);

  return v11;
}

- (id)_initWithObservable:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5
{
  return -[UIPreviewForceInteractionProgress _initWithObservable:targetState:minimumRequiredState:useLinearClassifier:](self, "_initWithObservable:targetState:minimumRequiredState:useLinearClassifier:", a3, a4, a5, 0);
}

- (id)_initWithObservable:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5 useLinearClassifier:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  UIPreviewForceInteractionProgress *v12;
  UIPreviewForceInteractionProgress *v13;
  __objc2_class *v14;
  _UIForceLevelClassifier *v15;
  _UIForceLevelClassifier *classifier;
  uint64_t v17;
  NSObservation *classifierObservation;
  objc_super v20;

  v6 = a6;
  v11 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIPreviewForceInteractionProgress;
  v12 = -[UIInteractionProgress init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_observable, a3);
    v13->_targetState = a4;
    v13->_minimumState = a5;
    if (v6)
      v14 = _UILinearForceLevelClassifier;
    else
      v14 = _UIPreviewInteractionForceLevelClassifier;
    v15 = (_UIForceLevelClassifier *)objc_alloc_init(v14);
    classifier = v13->_classifier;
    v13->_classifier = v15;

    -[_UIForceLevelClassifier setDelegate:](v13->_classifier, "setDelegate:", v13);
    -[_UITouchForceObservable addObserver:](v13->_observable, "addObserver:", v13->_classifier);
    v17 = objc_claimAutoreleasedReturnValue();
    classifierObservation = v13->_classifierObservation;
    v13->_classifierObservation = (NSObservation *)v17;

    v13->_completesAtTargetState = 1;
    -[UIPreviewForceInteractionProgress _installProgressObserver](v13, "_installProgressObserver");
  }

  return v13;
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (BOOL)enteredMinimumState
{
  return self->_enteredMinimumState;
}

- (void)_installProgressObserver
{
  void *v3;
  NSObservation *v4;
  NSObservation *progressObservation;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[_UIForceLevelClassifier observableForProgressToForceLevel:minimumRequiredForceLevel:](self->_classifier, "observableForProgressToForceLevel:minimumRequiredForceLevel:", self->_targetState, self->_minimumState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__UIPreviewForceInteractionProgress__installProgressObserver__block_invoke;
  v6[3] = &unk_1E16DC498;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "addObserverBlock:", v6);
  v4 = (NSObservation *)objc_claimAutoreleasedReturnValue();
  progressObservation = self->_progressObservation;
  self->_progressObservation = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__UIPreviewForceInteractionProgress__installProgressObserver__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 104) && !*((_BYTE *)WeakRetained + 105))
  {
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "setPercentComplete:");
  }

}

- (void)_setTargetState:(int64_t)a3
{
  int64_t v3;
  NSObservation *progressObservation;

  self->_targetState = a3;
  v3 = a3 - 1;
  if (a3 < 1)
  {
    if (self->_updateMinimumStateWithTargetState)
      self->_minimumState = 0xFFFFFFFF80000000;
    progressObservation = self->_progressObservation;
    self->_progressObservation = 0;

  }
  else
  {
    if (self->_updateMinimumStateWithTargetState)
    {
      if ((unint64_t)a3 >= 4)
        v3 = 0xFFFFFFFF80000000;
      self->_minimumState = v3;
    }
    -[UIPreviewForceInteractionProgress _installProgressObserver](self, "_installProgressObserver");
  }
}

- (void)_gestureRecognizerBegan:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((!a3
     || -[_UIForceLevelClassifier currentForceLevel](self->_classifier, "currentForceLevel") >= self->_targetState
     && self->_enteredMinimumState)
    && !self->_didEnd)
  {
    -[UIInteractionProgress endInteraction:](self, "endInteraction:", v3);
    self->_didEnd = 1;
  }
}

- (void)_forceLevelClassifier:(id)a3 currentForceLevelDidChange:(int64_t)a4
{
  id v5;
  BOOL v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!self->_enteredMinimumState)
  {
    v6 = objc_msgSend(v5, "currentForceLevel") < self->_minimumState;
    v5 = v7;
    if (!v6)
      self->_enteredMinimumState = 1;
  }
  if (objc_msgSend(v5, "currentForceLevel") >= self->_targetState
    && !self->_didEnd
    && self->_completesAtTargetState
    && self->_enteredMinimumState)
  {
    -[UIInteractionProgress endInteraction:](self, "endInteraction:", 1);
    self->_didEnd = 1;
  }

}

- (void)_forceLevelClassifierDidReset:(id)a3
{
  if (!self->_didEnd)
    -[UIInteractionProgress endInteraction:](self, "endInteraction:", 0);
  self->_didEnd = 0;
  self->_enteredMinimumState = 0;
}

- (void)_setClassifierShouldRespectSystemGestureTouchFiltering:(BOOL)a3
{
  -[_UIForceLevelClassifier setRespectsSystemGestureTouchFiltering:](self->_classifier, "setRespectsSystemGestureTouchFiltering:", a3);
}

- (BOOL)_classifierShouldRespectSystemGestureTouchFiltering
{
  return -[_UIForceLevelClassifier respectsSystemGestureTouchFiltering](self->_classifier, "respectsSystemGestureTouchFiltering");
}

- (int64_t)_targetState
{
  return self->_targetState;
}

- (BOOL)completesAtTargetState
{
  return self->_completesAtTargetState;
}

- (void)setCompletesAtTargetState:(BOOL)a3
{
  self->_completesAtTargetState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureBeganObservation, 0);
  objc_storeStrong((id *)&self->_targetStateUpdateObservation, 0);
  objc_storeStrong((id *)&self->_progressObservation, 0);
  objc_storeStrong((id *)&self->_classifierObservation, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end
