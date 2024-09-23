@implementation _UIFocusEffectsController

- (_UIFocusEffectsController)init
{
  _UIFocusEffectsController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusEffectsController;
  result = -[_UIFocusEffectsController init](&v3, sel_init);
  if (result)
  {
    result->_displayMovementAdjustment = 1.0;
    result->_displayOffsetAccumulatorEnabled = 0;
  }
  return result;
}

- (void)updateCurrentOffset:(CGPoint)a3
{
  -[_UIFocusEffectsController updateCurrentOffset:overrideDisplayOffset:](self, "updateCurrentOffset:overrideDisplayOffset:", 0, a3.x, a3.y);
}

- (void)updateCurrentOffset:(CGPoint)a3 overrideDisplayOffset:(id)a4
{
  double v6;
  CGPoint displayOffset;
  _BOOL4 v8;
  CGPoint currentOffset;
  float64x2_t v17;
  int v18;
  float64x2_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  UIFocusMovementHint *v24;
  UIFocusMovementHint *v25;
  int v26;
  CGPoint v27;
  double x;
  double v29;
  float64x2_t v30;
  float64x2_t v31;
  double y;
  void *v33;
  id v34[2];
  id v35[2];

  x = a3.x;
  y = a3.y;
  objc_msgSend(a4, "CGPointValue");
  if (a4)
  {
    v8 = self->_displayOffset.x != v6;
    if (self->_displayOffset.y != displayOffset.x)
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  currentOffset = self->_currentOffset;
  if (currentOffset.x != x || self->_currentOffset.y != y || v8)
  {
    __asm
    {
      FMOV            V3.2D, #1.0
      FMOV            V4.2D, #-1.0
    }
    if (self->_displayOffsetAccumulatorEnabled)
    {
      if (a4)
      {
        self->_displayOffset.x = v6;
        self->_displayOffset.y = displayOffset.x;
      }
      else
      {
        v17.f64[0] = x;
        v17.f64[1] = y;
        displayOffset = self->_displayOffset;
        self->_displayOffset = (CGPoint)vmaxnmq_f64(vminnmq_f64(vaddq_f64((float64x2_t)displayOffset, vmulq_n_f64(vsubq_f64(v17, (float64x2_t)currentOffset), self->_displayMovementAdjustment)), _Q3), _Q4);
      }
    }
    else
    {
      self->_displayOffset.x = x;
      self->_displayOffset.y = y;
    }
    self->_currentOffset.x = fmax(fmin(x, 1.0), -1.0);
    self->_currentOffset.y = fmax(fmin(y, 1.0), -1.0);
    if (_UIInternalPreferencesRevisionOnce != -1)
    {
      v30 = _Q4;
      *(float64x2_t *)v34 = _Q3;
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      _Q4 = v30;
      _Q3 = *(float64x2_t *)v34;
    }
    v18 = _UIInternalPreferencesRevisionVar;
    displayOffset.x = 0.8;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v26 = _UIInternalPreference_FocusEngineMotionEffectMaxOffset;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_FocusEngineMotionEffectMaxOffset)
      {
        v27 = displayOffset;
        v31 = _Q4;
        *(float64x2_t *)v35 = _Q3;
        while (v18 >= v26)
        {
          _UIInternalPreferenceSync(v18, &_UIInternalPreference_FocusEngineMotionEffectMaxOffset, (uint64_t)CFSTR("FocusEngineMotionEffectMaxOffset"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
          v26 = _UIInternalPreference_FocusEngineMotionEffectMaxOffset;
          if (v18 == _UIInternalPreference_FocusEngineMotionEffectMaxOffset)
          {
            _Q4 = v31;
            _Q3 = *(float64x2_t *)v35;
            displayOffset.x = v27.x;
            goto LABEL_21;
          }
        }
        *(_QWORD *)&displayOffset.x = qword_1EDDA8038;
        _Q4 = v31;
        _Q3 = *(float64x2_t *)v35;
      }
    }
LABEL_21:
    v19 = vmaxnmq_f64(vminnmq_f64(vdivq_f64((float64x2_t)self->_displayOffset, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&displayOffset.x, 0)), _Q3), _Q4);
    v20 = v19.f64[1];
    v29 = v19.f64[0];
    -[_UIFocusEffectsController _notifyObserversForMovementDirection:](self, "_notifyObserversForMovementDirection:", v27);
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v33 = v21;
      objc_msgSend(v21, "_focusSystem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "focusedItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v24 = [UIFocusMovementHint alloc];
          objc_msgSend(v23, "frame");
          v25 = -[UIFocusMovementHint initWithMovementDirection:itemSize:](v24, "initWithMovementDirection:itemSize:", v29, v20);
          objc_msgSend(v23, "didHintFocusMovement:", v25);

        }
      }

      v21 = v33;
    }

  }
}

- (void)adjustDisplayOffsetAccumulationFactorForFocusTransfer
{
  self->_displayMovementAdjustment = 0.5;
}

- (void)resetDisplayOffsetAccumulationFactor
{
  self->_displayMovementAdjustment = 1.0;
}

- (void)reset
{
  double v3;
  double v4;
  void *v5;

  -[_UIFocusEffectsController resetDisplayOffsetAccumulationFactor](self, "resetDisplayOffsetAccumulationFactor");
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *MEMORY[0x1E0C9D538], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusEffectsController updateCurrentOffset:overrideDisplayOffset:](self, "updateCurrentOffset:overrideDisplayOffset:", v5, v3, v4);

  -[_UIFocusEffectsController cancelRollbackAnimation](self, "cancelRollbackAnimation");
}

- (void)startRollbackAnimation
{
  CGPoint displayOffset;
  _UIDynamicValueConvergenceAnimation *v4;
  _UIDynamicValueConvergenceAnimation *rollbackAnimation;
  _UIDynamicValueConvergenceAnimation *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  CGPoint currentOffset;
  CGPoint v10;

  -[_UIFocusEffectsController cancelRollbackAnimation](self, "cancelRollbackAnimation");
  displayOffset = self->_displayOffset;
  currentOffset = self->_currentOffset;
  v10 = displayOffset;
  v4 = -[_UIDynamicValueConvergenceAnimation initWithValue:targetValue:convergenceRate:minimumDifference:]([_UIDynamicValueConvergenceAnimation alloc], "initWithValue:targetValue:convergenceRate:minimumDifference:", 1.0, 0.0, 0.99, 0.01);
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___UIFocusEffectsController_startRollbackAnimation__block_invoke;
  v8[3] = &unk_1E16C6808;
  v8[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___UIFocusEffectsController_startRollbackAnimation__block_invoke_2;
  v7[3] = &unk_1E16B3FD8;
  -[_UIDynamicValueConvergenceAnimation runWithValueApplier:completion:](v4, "runWithValueApplier:completion:", v8, v7);
  rollbackAnimation = self->_rollbackAnimation;
  self->_rollbackAnimation = v4;
  v6 = v4;

}

- (void)cancelRollbackAnimation
{
  _UIDynamicValueConvergenceAnimation *rollbackAnimation;
  _UIDynamicValueConvergenceAnimation *v4;

  rollbackAnimation = self->_rollbackAnimation;
  if (rollbackAnimation)
  {
    -[_UIDynamicAnimation stop](rollbackAnimation, "stop");
    v4 = self->_rollbackAnimation;
    self->_rollbackAnimation = 0;

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversForMovementDirection:(CGVector)a3
{
  double dy;
  double dx;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  dy = a3.dy;
  dx = a3.dx;
  v16 = *MEMORY[0x1E0C80C00];
  -[NSHashTable setRepresentation](self->_observers, "setRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "focusEffectsController:updateMovementDirection:", self, dx, dy);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (CGPoint)displayOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_displayOffset.x;
  y = self->_displayOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)currentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentOffset.x;
  y = self->_currentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)displayOffsetAccumulatorEnabled
{
  return self->_displayOffsetAccumulatorEnabled;
}

- (void)setDisplayOffsetAccumulatorEnabled:(BOOL)a3
{
  self->_displayOffsetAccumulatorEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rollbackAnimation, 0);
}

@end
