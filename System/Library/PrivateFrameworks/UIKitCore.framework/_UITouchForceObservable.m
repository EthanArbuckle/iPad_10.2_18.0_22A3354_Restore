@implementation _UITouchForceObservable

- (_UITouchForceObservable)init
{
  return -[_UITouchForceObservable initWithView:](self, "initWithView:", 0);
}

- (_UITouchForceObservable)initWithView:(id)a3
{
  id v4;
  _UITouchForceObservable *v5;
  _UITouchForceObservable *v6;
  _UITouchesObservingGestureRecognizer *v7;
  _UITouchesObservingGestureRecognizer *gestureRecognizer;
  void *v9;
  uint64_t v10;
  NSObservation *touchesObservation;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UITouchForceObservable;
  v5 = -[_UITouchForceObservable init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    if (v4)
    {
      v7 = objc_alloc_init(_UITouchesObservingGestureRecognizer);
      gestureRecognizer = v6->_gestureRecognizer;
      v6->_gestureRecognizer = v7;

      objc_initWeak(&location, v6);
      objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v6->_gestureRecognizer, "touches");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __40___UITouchForceObservable_initWithView___block_invoke;
      v13[3] = &unk_1E16DC470;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v9, "addObserverBlock:", v13);
      v10 = objc_claimAutoreleasedReturnValue();
      touchesObservation = v6->_touchesObservation;
      v6->_touchesObservation = (NSObservation *)v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

- (void)dealloc
{
  _UITouchesObservingGestureRecognizer *gestureRecognizer;
  void *v4;
  objc_super v5;

  gestureRecognizer = self->_gestureRecognizer;
  if (gestureRecognizer)
  {
    -[UIGestureRecognizer view](gestureRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_gestureRecognizer);

  }
  v5.receiver = self;
  v5.super_class = (Class)_UITouchForceObservable;
  -[NSObservationSource dealloc](&v5, sel_dealloc);
}

- (void)receiveObservedValue:(id)a3
{
  id v4;
  CADisplayLink *v5;
  void *v6;
  CADisplayLink *continuousEvaluationDisplayLink;
  NSSet *v8;
  NSSet *v9;
  void *v10;
  NSSet *currentTouches;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  self->_lastObservationTime = CACurrentMediaTime();
  if (self->_currentTouches && !objc_msgSend(v4, "count"))
  {
    currentTouches = self->_currentTouches;
    self->_currentTouches = 0;

    -[_UITouchForceObservable _cancelContinuousEvaluation](self, "_cancelContinuousEvaluation");
    +[_UITouchForceMessage reset](_UITouchForceMessage, "reset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITouchForceObservable receiveObservedValue:](&v13, sel_receiveObservedValue_, v10, v12.receiver, v12.super_class, self, _UITouchForceObservable);
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "count"))
  {
    if (!self->_currentTouches)
    {
      -[_UITouchForceObservable _cancelContinuousEvaluation](self, "_cancelContinuousEvaluation");
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__updateForContinuousEvaluation_);
      v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink setPreferredFramesPerSecond:](v5, "setPreferredFramesPerSecond:", 60);
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

      continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
      self->_continuousEvaluationDisplayLink = v5;

    }
    v8 = (NSSet *)objc_msgSend(v4, "copy");
    v9 = self->_currentTouches;
    self->_currentTouches = v8;

    -[_UITouchForceObservable _touchForceMessageForTouches:](self, "_touchForceMessageForTouches:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITouchForceObservable receiveObservedValue:](&v12, sel_receiveObservedValue_, v10, self, _UITouchForceObservable, v13.receiver, v13.super_class);
    goto LABEL_8;
  }
LABEL_9:

}

- (double)_unclampedTouchForceForTouches:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  unint64_t v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITouchForceObservable.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[touches count] > 0"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v10 = v10 + -[UITouch _unclampedForce](*(_QWORD **)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v12 = objc_msgSend(v6, "count");
  return v10 / (double)v12;
}

- (double)_timestampForTouches:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITouchForceObservable.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[touches count] > 0"));

  }
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v8 = v7;

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "timestamp");
          v8 = fmax(v14, v8);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (double)_maximumPossibleForceForTouches:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v10;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITouchForceObservable.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[touches count] > 0"));

  }
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumPossibleForce");
  v8 = v7;

  return v8;
}

- (BOOL)_shouldFilterDueToSystemGesturesForTouches:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((-[UITouch _mightBeConsideredForForceSystemGesture](*(void **)(*((_QWORD *)&v8 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)addObserver:(id)a3
{
  id v4;
  int64_t observerCount;
  void *v6;
  objc_super v8;

  v4 = a3;
  observerCount = self->_observerCount;
  self->_observerCount = observerCount + 1;
  if (!observerCount)
    -[_UITouchForceObservable _willBeginHavingAnyObservers](self, "_willBeginHavingAnyObservers");
  v8.receiver = self;
  v8.super_class = (Class)_UITouchForceObservable;
  -[_UITouchForceObservable addObserver:](&v8, sel_addObserver_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeObservation:(id)a3
{
  int64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITouchForceObservable;
  -[_UITouchForceObservable removeObservation:](&v5, sel_removeObservation_, a3);
  v4 = self->_observerCount - 1;
  self->_observerCount = v4;
  if (!v4)
    -[_UITouchForceObservable _didEndHavingAnyObservers](self, "_didEndHavingAnyObservers");
}

- (void)_willBeginHavingAnyObservers
{
  id WeakRetained;

  if (self->_gestureRecognizer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", self->_gestureRecognizer);

  }
}

- (void)_didEndHavingAnyObservers
{
  id WeakRetained;

  if (self->_gestureRecognizer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_gestureRecognizer);

  }
}

- (id)_touchForceMessageForTouches:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___UITouchForceObservable__touchForceMessageForTouches___block_invoke;
  v8[3] = &unk_1E16DC6D0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[_UITouchForceMessage observe:](_UITouchForceMessage, "observe:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateForContinuousEvaluation:(id)a3
{
  if (CACurrentMediaTime() - self->_lastObservationTime > 0.0133333333)
    -[_UITouchForceObservable receiveObservedValue:](self, "receiveObservedValue:", self->_currentTouches);
}

- (void)_cancelContinuousEvaluation
{
  CADisplayLink *continuousEvaluationDisplayLink;

  -[CADisplayLink invalidate](self->_continuousEvaluationDisplayLink, "invalidate");
  continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  self->_continuousEvaluationDisplayLink = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouches, 0);
  objc_storeStrong((id *)&self->_continuousEvaluationDisplayLink, 0);
  objc_storeStrong((id *)&self->_touchesObservation, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
