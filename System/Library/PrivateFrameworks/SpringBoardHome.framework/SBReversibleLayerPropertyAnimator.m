@implementation SBReversibleLayerPropertyAnimator

- (SBReversibleLayerPropertyAnimator)initWithLayer:(id)a3 keyPath:(id)a4 initialValue:(double)a5 targetValue:(double)a6
{
  id v11;
  id v12;
  SBReversibleLayerPropertyAnimator *v13;
  SBReversibleLayerPropertyAnimator *v14;
  uint64_t v15;
  NSString *keyPath;
  NSMutableArray *v17;
  NSMutableArray *reversalAnimationKeys;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBReversibleLayerPropertyAnimator;
  v13 = -[SBReversibleLayerPropertyAnimator init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_layer, a3);
    v15 = objc_msgSend(v12, "copy");
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v15;

    v14->_initialValue = a5;
    v14->_targetValue = a6;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    reversalAnimationKeys = v14->_reversalAnimationKeys;
    v14->_reversalAnimationKeys = v17;

    v14->_invalidated = 0;
  }

  return v14;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[SBReversibleLayerPropertyAnimator layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBReversibleLayerPropertyAnimator forwardAnimationKey](self, "forwardAnimationKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "removeAnimationForKey:", v4);
    -[SBReversibleLayerPropertyAnimator forwardOffsetAnimationKey](self, "forwardOffsetAnimationKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "removeAnimationForKey:", v5);
    -[SBReversibleLayerPropertyAnimator reversalAnimationKeys](self, "reversalAnimationKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v3, "removeAnimationForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
    -[SBReversibleLayerPropertyAnimator _fireCompletionIfNecessary](self, "_fireCompletionIfNecessary", (_QWORD)v12);

  }
}

- (void)animateWithSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_invalidated)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SBReversibleLayerPropertyAnimator_animateWithSettings_completion___block_invoke;
    block[3] = &unk_1E8D859C0;
    v19 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[SBReversibleLayerPropertyAnimator setStarted:](self, "setStarted:", 1);
    -[SBReversibleLayerPropertyAnimator setCurrentAnimationSettings:](self, "setCurrentAnimationSettings:", v6);
    -[SBReversibleLayerPropertyAnimator setCompletion:](self, "setCompletion:", v8);
    -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
    v10 = v9;
    -[SBReversibleLayerPropertyAnimator targetValue](self, "targetValue");
    v12 = v11;
    -[SBReversibleLayerPropertyAnimator layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBReversibleLayerPropertyAnimator keyPath](self, "keyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forKeyPath:", v14, v15);

    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.001);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBReversibleLayerPropertyAnimator _animateFromRelativeValue:toRelativeValue:withSettings:beginTime:](self, "_animateFromRelativeValue:toRelativeValue:withSettings:beginTime:", v16, 0, v10 - v12, v10 - v12);
    -[SBReversibleLayerPropertyAnimator forwardAnimationKey](self, "forwardAnimationKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBReversibleLayerPropertyAnimator setForwardOffsetAnimationKey:](self, "setForwardOffsetAnimationKey:", v17);

    -[SBReversibleLayerPropertyAnimator _animateFromValue:toValue:withSettings:beginTime:](self, "_animateFromValue:toValue:withSettings:beginTime:", v6, 0, v10, v12);
  }

}

uint64_t __68__SBReversibleLayerPropertyAnimator_animateWithSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isGoingForward
{
  return (-[SBReversibleLayerPropertyAnimator reversalCount](self, "reversalCount") & 1) == 0;
}

- (BOOL)hasReversed
{
  return -[SBReversibleLayerPropertyAnimator reversalCount](self, "reversalCount") != 0;
}

- (void)reverse
{
  id v3;

  -[SBReversibleLayerPropertyAnimator currentAnimationSettings](self, "currentAnimationSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBReversibleLayerPropertyAnimator _reverseWithSettings:directionChangeSettings:headStart:](self, "_reverseWithSettings:directionChangeSettings:headStart:", v3, 0, 0.0);

}

- (void)reverseWithSettings:(id)a3 directionChangeSettings:(id)a4 headStart:(double)a5
{
  -[SBReversibleLayerPropertyAnimator _reverseWithSettings:directionChangeSettings:headStart:](self, "_reverseWithSettings:directionChangeSettings:headStart:", a3, a4, a5);
  -[SBReversibleLayerPropertyAnimator setReversedWithNewSettings:](self, "setReversedWithNewSettings:", 1);
}

- (void)_reverseWithSettings:(id)a3 directionChangeSettings:(id)a4 headStart:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  id v61;

  v61 = a3;
  v8 = a4;
  if (!self->_invalidated)
  {
    -[SBReversibleLayerPropertyAnimator setReversalCount:](self, "setReversalCount:", -[SBReversibleLayerPropertyAnimator reversalCount](self, "reversalCount") + 1);
    -[SBReversibleLayerPropertyAnimator layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBReversibleLayerPropertyAnimator forwardAnimationKey](self, "forwardAnimationKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "beginTime");
      v14 = v13;
      v15 = CACurrentMediaTime();
      if (!BSFloatLessThanFloat())
      {
        objc_msgSend(v9, "removeAnimationForKey:", v10);
LABEL_22:

        goto LABEL_23;
      }
      v16 = (void *)objc_msgSend(v61, "mutableCopy");
      -[SBReversibleLayerPropertyAnimator currentAnimationSettings](self, "currentAnimationSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      if ((objc_msgSend(v16, "isEqual:", v18) & 1) != 0)
      {
        objc_msgSend(v16, "setDelay:", 0.0);
        if (-[SBReversibleLayerPropertyAnimator isGoingForward](self, "isGoingForward"))
        {
          -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
          v20 = v19;
          -[SBReversibleLayerPropertyAnimator targetValue](self, "targetValue");
        }
        else
        {
          -[SBReversibleLayerPropertyAnimator targetValue](self, "targetValue");
          v20 = v60;
          -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
        }
        -[SBReversibleLayerPropertyAnimator _animateFromValue:toValue:withSettings:beginTime:](self, "_animateFromValue:toValue:withSettings:beginTime:", v16, 0, v20, v21);
      }
      else
      {
        objc_msgSend(v18, "setDelay:", 0.0);
        v24 = -0.0;
        if (!v8)
          v24 = a5;
        v25 = v24 + v14;
        -[SBReversibleLayerPropertyAnimator targetValue](self, "targetValue");
        v27 = v26;
        -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
        v29 = v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBReversibleLayerPropertyAnimator _animateFromValue:toValue:withSettings:beginTime:](self, "_animateFromValue:toValue:withSettings:beginTime:", v18, v30, v27, v29);

        v31 = (0.08 - (v15 - v14)) / 0.08;
        if (v31 <= 0.0)
          v32 = 0.0;
        else
          v32 = v31 * 0.04;
        -[SBReversibleLayerPropertyAnimator _percentCompleteForAnimation:time:](self, "_percentCompleteForAnimation:time:", v12, v15 - v14 + v32);
        v34 = v33;
        -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
        v36 = v35;
        -[SBReversibleLayerPropertyAnimator targetValue](self, "targetValue");
        v38 = v37;
        -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
        v40 = v36 + v34 * (v38 - v39);
        -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
        v42 = v40 - v41;
        objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.001);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBReversibleLayerPropertyAnimator _animateFromRelativeValue:toRelativeValue:withSettings:beginTime:](self, "_animateFromRelativeValue:toRelativeValue:withSettings:beginTime:", v43, 0, v42, v42);
        if (v8 && (BSFloatIsZero() & 1) == 0)
        {
          -[SBReversibleLayerPropertyAnimator _animationWithSettings:](self, "_animationWithSettings:", v8);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBReversibleLayerPropertyAnimator _inputPercentCompleteForAnimation:outputPercentComplete:precision:](self, "_inputPercentCompleteForAnimation:outputPercentComplete:precision:", v44, v34, 0.001);
          v46 = v45;
          objc_msgSend(v44, "duration");
          v48 = v15 - v46 * v47;
          -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
          v50 = v49;
          -[SBReversibleLayerPropertyAnimator targetValue](self, "targetValue");
          v52 = v51;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBReversibleLayerPropertyAnimator _animateFromValue:toValue:withSettings:beginTime:](self, "_animateFromValue:toValue:withSettings:beginTime:", v8, v53, v50, v52);

          -[SBReversibleLayerPropertyAnimator targetValue](self, "targetValue");
          v55 = v54;
          -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
          v57 = v56;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48 + a5);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBReversibleLayerPropertyAnimator _animateFromValue:toValue:withSettings:beginTime:](self, "_animateFromValue:toValue:withSettings:beginTime:", v8, v58, v55, v57);

        }
        -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
        -[SBReversibleLayerPropertyAnimator _animateFromValue:toValue:withSettings:beginTime:](self, "_animateFromValue:toValue:withSettings:beginTime:", v16, 0, v40, v59);

      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
      objc_msgSend(v22, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBReversibleLayerPropertyAnimator keyPath](self, "keyPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKeyPath:", v16, v23);

    }
    goto LABEL_22;
  }
LABEL_23:

}

- (void)_animateFromValue:(double)a3 toValue:(double)a4 withSettings:(id)a5 beginTime:(id)a6
{
  -[SBReversibleLayerPropertyAnimator _animateFromRelativeValue:toRelativeValue:withSettings:beginTime:](self, "_animateFromRelativeValue:toRelativeValue:withSettings:beginTime:", a5, a6, 0.0, a4 - a3);
}

- (void)_animateFromRelativeValue:(double)a3 toRelativeValue:(double)a4 withSettings:(id)a5 beginTime:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = a6;
  v11 = a5;
  -[SBReversibleLayerPropertyAnimator layer](self, "layer");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[SBReversibleLayerPropertyAnimator keyPath](self, "keyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBReversibleLayerPropertyAnimator _additiveAnimationForKeyPath:withSettings:beginTime:fromRelativeValue:toRelativeValue:](self, "_additiveAnimationForKeyPath:withSettings:beginTime:fromRelativeValue:toRelativeValue:", v12, v11, v10, a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@"), v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBReversibleLayerPropertyAnimator setOutstandingCAAnimationCompletionCount:](self, "setOutstandingCAAnimationCompletionCount:", -[SBReversibleLayerPropertyAnimator outstandingCAAnimationCompletionCount](self, "outstandingCAAnimationCompletionCount")+ 1);
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "setRemovedOnCompletion:", 0);
  objc_msgSend(v13, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  if (-[SBReversibleLayerPropertyAnimator hasReversed](self, "hasReversed"))
  {
    -[SBReversibleLayerPropertyAnimator reversalAnimationKeys](self, "reversalAnimationKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v17);

  }
  else
  {
    -[SBReversibleLayerPropertyAnimator setForwardAnimationKey:](self, "setForwardAnimationKey:", v17);
  }
  objc_msgSend(v19, "addAnimation:forKey:", v13, v17);

}

- (id)_additiveAnimationForKeyPath:(id)a3 withSettings:(id)a4 beginTime:(id)a5 fromRelativeValue:(double)a6 toRelativeValue:(double)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;

  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[SBReversibleLayerPropertyAnimator _animationWithSettings:](self, "_animationWithSettings:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeyPath:", v14);

  objc_msgSend(v13, "delay");
  v17 = v16;

  if (v12)
  {
    objc_msgSend(v15, "setBeginTimeMode:", *MEMORY[0x1E0CD2918]);
    objc_msgSend(v12, "doubleValue");
    v17 = v17 + v18;
LABEL_5:
    objc_msgSend(v15, "setBeginTime:", v17);
    goto LABEL_6;
  }
  if ((BSFloatIsZero() & 1) == 0)
  {
    objc_msgSend(v15, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v20);

  objc_msgSend(v15, "setAdditive:", 1);
  return v15;
}

- (id)_animationWithSettings:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isSpringAnimation") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2848], "animation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applyToCAAnimation:", v4);
    objc_msgSend(v3, "epsilon");
    v6 = v5;

    objc_msgSend(v4, "durationForEpsilon:", v6);
    objc_msgSend(v4, "setDuration:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applyToCAAnimation:", v4);

  }
  return v4;
}

- (double)_percentCompleteForAnimation:(id)a3 time:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a3;
  objc_msgSend(v6, "duration");
  v8 = v7;
  v9 = 0.0;
  if (BSFloatGreaterThanFloat())
  {
    v9 = fmin(fmax(a4 / v8, 0.0), 1.0);
    if ((BSFloatIsOne() & 1) == 0 && (BSFloatIsZero() & 1) == 0)
    {
      -[SBReversibleLayerPropertyAnimator _outputPercentCompleteForAnimation:inputPercentComplete:](self, "_outputPercentCompleteForAnimation:inputPercentComplete:", v6, v9);
      v9 = v10;
    }
  }

  return v9;
}

- (double)_inputPercentCompleteForAnimation:(id)a3 outputPercentComplete:(double)a4 precision:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  int v15;

  v7 = a3;
  v8 = fmin(fmax(a4, 0.0), 1.0);
  if ((BSFloatIsOne() & 1) != 0 || (BSFloatIsZero() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    v9 = 0.5;
    -[SBReversibleLayerPropertyAnimator _outputPercentCompleteForAnimation:inputPercentComplete:](self, "_outputPercentCompleteForAnimation:inputPercentComplete:", v7, 0.5);
    if (BSFloatGreaterThanFloat())
    {
      v11 = 0.0;
      v12 = 1.0;
      v13 = 101;
      v14 = 0.5;
      while (--v13)
      {
        v15 = BSFloatLessThanFloat();
        if (v15)
          v9 = v14 + (v12 - v14) * 0.5;
        else
          v9 = v14 + (v14 - v11) * -0.5;
        if (v15)
          v11 = v14;
        else
          v12 = v14;
        -[SBReversibleLayerPropertyAnimator _outputPercentCompleteForAnimation:inputPercentComplete:](self, "_outputPercentCompleteForAnimation:inputPercentComplete:", v7, v9);
        v14 = v9;
        if ((BSFloatGreaterThanFloat() & 1) == 0)
          goto LABEL_4;
      }
      v9 = v14;
    }
  }
LABEL_4:

  return v9;
}

- (double)_outputPercentCompleteForAnimation:(id)a3 inputPercentComplete:(double)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  float v11;

  v5 = a3;
  objc_msgSend(v5, "timingFunction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
  {
    *(float *)&v7 = a4;
    objc_msgSend(v6, "_solveForInput:", v7);
    a4 = v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(float *)&v10 = a4;
    objc_msgSend(v5, "_solveForInput:", v10);
    a4 = v11;
  }

  return a4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  SBReversibleLayerPropertyAnimator *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_invalidated)
  {
    -[SBReversibleLayerPropertyAnimator setOutstandingCAAnimationCompletionCount:](self, "setOutstandingCAAnimationCompletionCount:", -[SBReversibleLayerPropertyAnimator outstandingCAAnimationCompletionCount](self, "outstandingCAAnimationCompletionCount")- 1);
    if (!-[SBReversibleLayerPropertyAnimator outstandingCAAnimationCompletionCount](self, "outstandingCAAnimationCompletionCount"))
    {
      SBLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[SBReversibleLayerPropertyAnimator layer](self, "layer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "animationKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v5;
        v28 = 2112;
        v29 = self;
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "animation completed [%@]: %@, layer: %@", buf, 0x20u);

      }
      -[SBReversibleLayerPropertyAnimator layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBReversibleLayerPropertyAnimator forwardAnimationKey](self, "forwardAnimationKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v9, "removeAnimationForKey:", v10);
      -[SBReversibleLayerPropertyAnimator forwardOffsetAnimationKey](self, "forwardOffsetAnimationKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v9, "removeAnimationForKey:", v11);
      if (!-[SBReversibleLayerPropertyAnimator isGoingForward](self, "isGoingForward"))
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[SBReversibleLayerPropertyAnimator initialValue](self, "initialValue");
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBReversibleLayerPropertyAnimator keyPath](self, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forKeyPath:", v13, v14);

      }
      -[SBReversibleLayerPropertyAnimator reversalAnimationKeys](self, "reversalAnimationKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v22 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v9, "removeAnimationForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), (_QWORD)v21);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v18);
        }

      }
      -[SBReversibleLayerPropertyAnimator _fireCompletionIfNecessary](self, "_fireCompletionIfNecessary", (_QWORD)v21);

    }
  }

}

- (void)_fireCompletionIfNecessary
{
  void (**v3)(id, BOOL);

  -[SBReversibleLayerPropertyAnimator completion](self, "completion");
  v3 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBReversibleLayerPropertyAnimator setCompletion:](self, "setCompletion:", 0);
    v3[2](v3, -[SBReversibleLayerPropertyAnimator isGoingForward](self, "isGoingForward"));
  }

}

- (CALayer)layer
{
  return self->_layer;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (double)initialValue
{
  return self->_initialValue;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (BOOL)hasStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BSAnimationSettings)currentAnimationSettings
{
  return self->_currentAnimationSettings;
}

- (void)setCurrentAnimationSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)reversalCount
{
  return self->_reversalCount;
}

- (void)setReversalCount:(unint64_t)a3
{
  self->_reversalCount = a3;
}

- (BOOL)hasReversedWithNewSettings
{
  return self->_reversedWithNewSettings;
}

- (void)setReversedWithNewSettings:(BOOL)a3
{
  self->_reversedWithNewSettings = a3;
}

- (unint64_t)outstandingCAAnimationCompletionCount
{
  return self->_outstandingCAAnimationCompletionCount;
}

- (void)setOutstandingCAAnimationCompletionCount:(unint64_t)a3
{
  self->_outstandingCAAnimationCompletionCount = a3;
}

- (NSString)forwardAnimationKey
{
  return self->_forwardAnimationKey;
}

- (void)setForwardAnimationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)forwardOffsetAnimationKey
{
  return self->_forwardOffsetAnimationKey;
}

- (void)setForwardOffsetAnimationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSMutableArray)reversalAnimationKeys
{
  return self->_reversalAnimationKeys;
}

- (void)setReversalAnimationKeys:(id)a3
{
  objc_storeStrong((id *)&self->_reversalAnimationKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reversalAnimationKeys, 0);
  objc_storeStrong((id *)&self->_forwardOffsetAnimationKey, 0);
  objc_storeStrong((id *)&self->_forwardAnimationKey, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_currentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
