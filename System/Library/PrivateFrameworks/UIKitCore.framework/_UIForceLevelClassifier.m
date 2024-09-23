@implementation _UIForceLevelClassifier

- (_UIForceLevelClassifier)init
{
  _UIForceLevelClassifier *v2;
  NSObservationSource *v3;
  NSObservationSource *progressTouchForceObservable;
  float v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIForceLevelClassifier;
  v2 = -[_UIForceLevelClassifier init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSObservationSource *)objc_alloc_init(MEMORY[0x1E0CB3808]);
    progressTouchForceObservable = v2->_progressTouchForceObservable;
    v2->_progressTouchForceObservable = v3;

    _AXSForceTouchSensitivity();
    -[_UIForceLevelClassifier setCurrentTouchForceMultiplier:](v2, "setCurrentTouchForceMultiplier:", v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__accessibilityForceSensitivityChanged_, CFSTR("UIAccessibilityForceTouchSensitivityChangedNotification"), 0);

    v2->_respectsSystemGestureTouchFiltering = 1;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityForceTouchSensitivityChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIForceLevelClassifier;
  -[_UIForceLevelClassifier dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  id v3;

  -[_UIForceLevelClassifier delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_forceLevelClassifierDidReset:", self);

}

- (BOOL)wantsUnclampedForceValues
{
  return 0;
}

- (void)setCurrentForceLevel:(int64_t)a3
{
  int64_t currentForceLevel;
  id v5;

  currentForceLevel = self->_currentForceLevel;
  if (currentForceLevel != a3)
  {
    self->_currentForceLevel = a3;
    -[_UIForceLevelClassifier delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_forceLevelClassifier:currentForceLevelDidChange:", self, currentForceLevel);

  }
}

- (void)_accessibilityForceSensitivityChanged:(id)a3
{
  float v4;

  _AXSForceTouchSensitivity();
  -[_UIForceLevelClassifier setCurrentTouchForceMultiplier:](self, "setCurrentTouchForceMultiplier:", v4);
  -[_UIForceLevelClassifier touchForceMultiplierDidChange](self, "touchForceMultiplierDidChange");
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD aBlock[5];

  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UIForceLevelClassifier_receiveObservedValue___block_invoke;
  aBlock[3] = &unk_1E16C9598;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  if (-[_UIForceLevelClassifier wantsUnclampedForceValues](self, "wantsUnclampedForceValues"))
  {
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_2;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    objc_msgSend(a3, "ifObservationUnclamped:ifReset:", v6, v8);
  }
  else
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_3;
    v7[3] = &unk_1E16B1B28;
    v7[4] = self;
    objc_msgSend(a3, "ifObservation:ifReset:", v6, v7);
  }
  -[NSObservationSource receiveObservedValue:](self->_progressTouchForceObservable, "receiveObservedValue:", a3);

}

- (id)observableForProgressToForceLevel:(int64_t)a3
{
  int64_t v3;

  if ((unint64_t)(a3 - 1) >= 3)
    v3 = 0xFFFFFFFF80000000;
  else
    v3 = a3 - 1;
  return -[_UIForceLevelClassifier observableForProgressToForceLevel:minimumRequiredForceLevel:](self, "observableForProgressToForceLevel:minimumRequiredForceLevel:", a3, v3);
}

- (id)observableForProgressToForceLevel:(int64_t)a3 minimumRequiredForceLevel:(int64_t)a4
{
  void *v4;
  void *v8;
  NSMutableDictionary *cachedProgressObservables;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  _QWORD block[5];

  v4 = 0;
  if (a3 > a4 && a3 >= 1 && (a4 & 0x8000000000000000) == 0)
  {
    if ((unint64_t)a4 >= 3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __progressObservableCacheKey_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a4;
      if (progressObservableCacheKey_once != -1)
        dispatch_once(&progressObservableCacheKey_once, block);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4 + 4 * a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    cachedProgressObservables = self->_cachedProgressObservables;
    if (!cachedProgressObservables)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->_cachedProgressObservables;
      self->_cachedProgressObservables = v10;

      cachedProgressObservables = self->_cachedProgressObservables;
    }
    -[NSMutableDictionary objectForKey:](cachedProgressObservables, "objectForKey:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[_UIForceLevelClassifier transformerFromTouchForceMessageToProgressToForceLevel:minimumRequiredForceLevel:](self, "transformerFromTouchForceMessageToProgressToForceLevel:minimumRequiredForceLevel:", a3, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObservationSource addObserver:](self->_progressTouchForceObservable, "addObserver:", v12);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_cachedProgressObservables, "setObject:forKey:", v4, v8);

    }
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  id location;

  objc_storeWeak((id *)&self->_delegate, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0 && !self->_delegateObservations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
    v6 = MEMORY[0x1E0C809B0];
    while (1)
    {
      do
      {
        v7 = (void *)v5;
        objc_initWeak(&location, self);
        -[_UIForceLevelClassifier observableForProgressToForceLevel:](self, "observableForProgressToForceLevel:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __39___UIForceLevelClassifier_setDelegate___block_invoke;
        v10[3] = &unk_1E16C97A8;
        objc_copyWeak(v11, &location);
        v11[1] = v7;
        objc_msgSend(v8, "addObserverBlock:", v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v9);
        objc_storeStrong((id *)&self->_delegateObservations, v4);

        objc_destroyWeak(v11);
        objc_destroyWeak(&location);
        v5 = 2;
      }
      while (v7 == (void *)1);
      if (v7 != (void *)2)
        break;
      v5 = 3;
    }

  }
}

- (void)_notifyDelegateOfProgress:(double)a3 toForceLevel:(int64_t)a4
{
  id v7;

  -[_UIForceLevelClassifier delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_forceLevelClassifier:didUpdateProgress:toForceLevel:", self, a4, a3);

}

- (int64_t)currentForceLevel
{
  return self->_currentForceLevel;
}

- (_UIForceLevelClassifierDelegate)delegate
{
  return (_UIForceLevelClassifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)currentTouchForceMultiplier
{
  return self->_currentTouchForceMultiplier;
}

- (void)setCurrentTouchForceMultiplier:(double)a3
{
  self->_currentTouchForceMultiplier = a3;
}

- (BOOL)respectsSystemGestureTouchFiltering
{
  return self->_respectsSystemGestureTouchFiltering;
}

- (void)setRespectsSystemGestureTouchFiltering:(BOOL)a3
{
  self->_respectsSystemGestureTouchFiltering = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateObservations, 0);
  objc_storeStrong((id *)&self->_cachedProgressObservables, 0);
  objc_storeStrong((id *)&self->_progressTouchForceObservable, 0);
}

@end
