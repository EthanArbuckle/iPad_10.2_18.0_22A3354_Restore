@implementation UIViewAnimationState

+ (void)_addSystemPostAnimationAction:(id)a3
{
  void (**v3)(void);
  void *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);

  v3 = (void (**)(void))a3;
  v4 = (void *)__currentViewAnimationState;
  v11 = v3;
  if (__currentViewAnimationState)
    v4 = *(void **)(__currentViewAnimationState + 32);
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v5[4])
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = (void *)v5[4];
      v5[4] = v6;

    }
    v8 = (void *)objc_msgSend(v11, "copy");
    v9 = (void *)v5[4];
    v10 = _Block_copy(v8);
    objc_msgSend(v9, "addObject:", v10);

  }
  else
  {
    v11[2]();
  }

}

- (void)_incrementDidEndCount
{
  UIViewAnimationState *nextState;

  ++self->_didEndCount;
  if (self->_belongsToTrackingAnimator)
  {
    nextState = self->_nextState;
    if (nextState)
      -[UIViewAnimationState _incrementDidEndCount](nextState, "_incrementDidEndCount");
  }
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  return _CASupportsAnimationForKey(a3);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t i;
  _UIViewAdditiveAnimationAction *v18;
  _UIViewAdditiveAnimationAction *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIViewAnimationState animationForLayer:forKey:forView:](self, "animationForLayer:forKey:forView:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[UIViewAnimationState _outerPropertyAnimator:](self, "_outerPropertyAnimator:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIViewAnimationState _shouldAnimateAdditivelyForKey:onLayer:forView:](self, "_shouldAnimateAdditivelyForKey:onLayer:forView:", v9, v8, v10);
    v14 = v13;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ((objc_msgSend(v11, "isAdditive") | v14) & 1) == 0)
      {
        memset(v21, 0, 24);
        objc_msgSend(v12, "_previousAnimatorForKeyPath:inLayer:compoundKeys:", v9, v8, v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15 && v15 != v12)
          objc_msgSend(v15, "_untrackPropertyAnimationsForKeys:inLayer:", v21, v8);

        for (i = 2; i != -1; --i)
      }
      if (-[UIViewAnimationState _isTrackingEnabled](self, "_isTrackingEnabled"))
        objc_msgSend(v11, "setRemovedOnCompletion:", 0);
    }
    else if (!v13)
    {
      v19 = v11;
      goto LABEL_15;
    }
    v19 = -[_UIViewAdditiveAnimationAction initWithPendingAnimation:withAnimationObject:forView:]([_UIViewAdditiveAnimationAction alloc], "initWithPendingAnimation:withAnimationObject:forView:", v11, v12, v10);
LABEL_15:
    v18 = v19;

    goto LABEL_16;
  }
  v18 = 0;
LABEL_16:

  return v18;
}

- (id)animationForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _UIBasicAnimationFactory *animationFactory;
  uint64_t v14;
  id WeakRetained;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v10 || (*((_QWORD *)v10 + 13) & 0x4000000) == 0)
  {
    v12 = self->_customCurve;
    animationFactory = self->_animationFactory;
    if (animationFactory)
    {
      -[_UIBasicAnimationFactory _basicAnimationForView:withKeyPath:](animationFactory, "_basicAnimationForView:withKeyPath:", v11, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
      if (WeakRetained)
      {
        objc_msgSend((id)v14, "timingFunction");
        v16 = objc_claimAutoreleasedReturnValue();

        v12 = v16;
      }
      else if (!v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _UIGetAnimationCurveSpline(3uLL, v18, v19, v20, v21);
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
      }
      if (self->_animationFactoryMakesPerAnimationCustomCurves)
      {
        -[_UIBasicAnimationFactory _timingFunctionForAnimationInView:withKeyPath:](self->_animationFactory, "_timingFunctionForAnimationInView:withKeyPath:", v11, v9);
        v22 = objc_claimAutoreleasedReturnValue();

        v12 = v22;
      }

    }
    else
    {
      v14 = 0;
    }
    if (!(v14 | v12))
    {
      if (self->_curve != 7)
      {
        if (!-[UIViewAnimationState _shouldStartFromCurrentStateForLayer:key:forView:](self, "_shouldStartFromCurrentStateForLayer:key:forView:", v8, v9, v11))goto LABEL_30;
        goto LABEL_28;
      }
      _UILoadDefaultSpringParameters();
      +[UIViewSpringAnimationState defaultSpringAnimationForKey:mass:stiffness:damping:velocity:](UIViewSpringAnimationState, "defaultSpringAnimationForKey:mass:stiffness:damping:velocity:", v9, *(double *)&_UIViewDefaultSpringMass, *(double *)&_UIViewDefaultSpringStiffness, *(double *)&_UIViewDefaultSpringDamping, 0.0);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v23 = -[UIViewAnimationState _shouldStartFromCurrentStateForLayer:key:forView:](self, "_shouldStartFromCurrentStateForLayer:key:forView:", v8, v9, v11);
    if (v14)
    {
      if (!v23)
        goto LABEL_23;
      objc_msgSend(v8, "implicitAnimationForKeyPath:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v24, "fromValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v14, "setFromValue:", v25);

      }
      if (!v24)
      {
LABEL_23:
        objc_msgSend(v8, "valueForKeyPath:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v14, "setFromValue:", v26);

        v24 = 0;
      }
      v27 = (id)v14;
      v17 = v27;
      goto LABEL_34;
    }
    if (!v23)
    {
LABEL_30:
      if (v11)
        objc_msgSend(v11, "_basicAnimationWithKeyPath:", v9);
      else
        -[UIViewAnimationState _defaultAnimationForKey:](self, "_defaultAnimationForKey:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKeyPath:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFromValue:", v24);
      v27 = 0;
LABEL_34:

      goto LABEL_35;
    }
LABEL_28:
    objc_msgSend(v8, "implicitAnimationForKeyPath:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v28, "copy");

    if (v17)
    {
      v27 = 0;
LABEL_35:
      -[UIViewAnimationState configureAnimation:forLayer:forKey:](self, "configureAnimation:forLayer:forKey:", v17, v8, v9);
      -[UIViewAnimationState setAnimationAttributes:skipDelegateAssignment:customCurve:](self, "setAnimationAttributes:skipDelegateAssignment:customCurve:", v17, 0, v12);

      goto LABEL_36;
    }
    goto LABEL_30;
  }
  v17 = 0;
LABEL_36:

  return v17;
}

- (void)setAnimationAttributes:(id)a3 skipDelegateAssignment:(BOOL)a4 customCurve:(id)a5
{
  CAMediaTimingFunction *v8;
  double duration;
  float v10;
  double v11;
  CAMediaTimingFunction *v12;
  unint64_t curve;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  float v19;
  double v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  double frameInterval;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t updateReason;
  double v32;
  double v33;
  double v34;
  double v35;
  CAMediaTimingFunction *v36;
  double delay;
  double start;
  void *v39;
  void *v40;
  id v41;

  v41 = a3;
  v8 = (CAMediaTimingFunction *)a5;
  if (!v41)
    goto LABEL_41;
  duration = self->_duration;
  v10 = UIAnimationDragCoefficient();
  v11 = v10;
  if (duration == 0.0)
    duration = 0.001;
  v12 = self->_customCurve;
  curve = self->_curve;
  if (curve == 7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v12 = 0;
    v8 = 0;
    duration = *(double *)&_UIViewDefaultSpringDuration;
    curve = 3;
  }
  else if (v10 != 1.0 && duration > 0.001)
  {
    +[UIViewPropertyAnimator _getPropertyAnimationForState:](UIViewPropertyAnimator, "_getPropertyAnimationForState:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v41;
    if (v14)
    {
      objc_msgSend(v14, "_drag");
      v11 = 1.0;
      v17 = 1.0 / v16;
      *(float *)&v17 = v17;
      objc_msgSend(v41, "setSpeed:", v17);
      v15 = v41;
    }
    v18 = v15;
    v19 = UIAnimationDragCoefficient();
    if (v19 == 1.0)
    {

      v25 = duration;
      duration = v11 * v25;
    }
    else
    {
      v20 = v19;
      objc_msgSend(v18, "speed");
      v22 = fabs(v21 + -1.0 / v20);

      v23 = duration;
      v24 = v11 * v23;
      if (v22 >= 0.00000011920929)
        duration = v24;
    }

  }
  frameInterval = self->_frameInterval;
  if (frameInterval > 0.0)
    objc_msgSend(v41, "setFrameInterval:", self->_frameInterval);
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E0CD23C0]))
  {
    *(float *)&v27 = self->_preferredFrameRateRange.minimum;
    *(float *)&v28 = self->_preferredFrameRateRange.maximum;
    *(float *)&v29 = self->_preferredFrameRateRange.preferred;
    objc_msgSend(v41, "setPreferredFrameRateRange:", v27, v28, v29);
    updateReason = self->_updateReason;
    goto LABEL_23;
  }
  v30 = v41;
  if (frameInterval <= 0.0)
  {
    LODWORD(v28) = 1123024896;
    LODWORD(v27) = 30.0;
    LODWORD(v29) = 1123024896;
    objc_msgSend(v41, "setPreferredFrameRateRange:", v27, v28, v29);
    updateReason = 1048609;
LABEL_23:
    objc_msgSend(v41, "setHighFrameRateReason:", updateReason);
    v30 = v41;
  }
  objc_msgSend(v30, "setDuration:", duration);
  v36 = v8;
  if (v8 || (v36 = v12) != 0)
  {
    objc_msgSend(v41, "setTimingFunction:", v36);
  }
  else
  {
    _UIGetAnimationCurveSpline(curve, v32, v33, v34, v35);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTimingFunction:", v40);

  }
  delay = self->_delay;
  start = self->_start;
  if (delay > 0.0 && start == 0.0)
  {
    objc_msgSend(v41, "setBeginTime:", v11 * delay);
    objc_msgSend(v41, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
LABEL_32:
    v39 = v41;
    goto LABEL_33;
  }
  v39 = v41;
  if (start > 0.0)
  {
    objc_msgSend(v41, "setBeginTime:", v11 * delay + start);
    goto LABEL_32;
  }
LABEL_33:
  objc_msgSend(v39, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  if (self->_repeatCount > 0.0)
    objc_msgSend(v41, "setRepeatCount:");
  if ((*((_BYTE *)self + 172) & 8) != 0)
    objc_msgSend(v41, "setAutoreverses:", 1);
  if (!a4)
  {
    objc_msgSend(v41, "setDelegate:", self);
    -[UIViewAnimationState _incrementDidEndCount](self, "_incrementDidEndCount");
    if (self->_didEndCount == 1)
      objc_storeStrong((id *)&self->_retainedSelf, self);
  }

LABEL_41:
}

- (void)configureAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("contents")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "implicitAnimationForKeyPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "fromValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFromValue:", v10);

      }
    }
  }

}

- (BOOL)_shouldStartFromCurrentStateForLayer:(id)a3 key:(id)a4 forView:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  int v13;
  BOOL v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
  if (WeakRetained)
  {
    objc_msgSend(v9, "animationForKey:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      LOBYTE(v13) = 0;
      goto LABEL_9;
    }
  }
  if ((*((_BYTE *)self + 172) & 2) != 0 && objc_msgSend(v9, "hasBeenCommitted"))
  {
    v13 = !-[UIViewAnimationState _shouldAnimateAdditivelyForKey:onLayer:forView:](self, "_shouldAnimateAdditivelyForKey:onLayer:forView:", v10, v9, v11);
    v14 = v13;
    if (!WeakRetained)
      goto LABEL_10;
    goto LABEL_9;
  }
  LOBYTE(v13) = 0;
  v14 = 0;
  if (WeakRetained)
  {
LABEL_9:

    v14 = v13;
  }
LABEL_10:

  return v14;
}

- (id)_defaultAnimationForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_propertyAnimator);
  objc_storeStrong((id *)&self->_viewToDeferredAnimationsMap, 0);
  objc_storeStrong((id *)&self->_viewsPendingConstraintBasedAnimation, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_addedCompletions, 0);
  objc_storeStrong(&self->_alongsideAnimations, 0);
  objc_storeStrong((id *)&self->_customCurve, 0);
  objc_storeStrong((id *)&self->_animationFactory, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_trackedAnimations, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_transitionOptions, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_animationID, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)sendDelegateAnimationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id delegate;
  const char *didEndSelector;
  NSString *animationID;
  void *v10;
  char v11;
  id v12;
  NSString *v13;
  char v14;
  id v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  NSMutableArray *addedCompletions;
  id WeakRetained;
  void *v27;
  id v28;
  char v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_delegate)
  {
    if (self->_didEndSelector)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_20;
      delegate = self->_delegate;
      didEndSelector = self->_didEndSelector;
      animationID = self->_animationID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(delegate, didEndSelector, animationID, v10, self->_context);
      goto LABEL_7;
    }
    v11 = objc_opt_respondsToSelector();
    v12 = self->_delegate;
    if ((v11 & 1) != 0)
    {
      v13 = self->_animationID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, sel_animationDidStop_finished_context_, v13, v10, self->_context);
LABEL_7:

      goto LABEL_20;
    }
    v14 = objc_opt_respondsToSelector();
    v15 = self->_delegate;
    if ((v14 & 1) != 0)
    {
      v16 = self->_animationID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "performSelector:withObject:withObject:", sel_animationDidStop_finished_, v16, v17);

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(self->_delegate, "performSelector:withObject:", sel_animationDidStop_, self->_animationID);
    }
  }
LABEL_20:
  while (1)
  {
    addedCompletions = self->_addedCompletions;
    if (!addedCompletions)
      break;
    v18 = (void *)-[NSMutableArray copy](addedCompletions, "copy");
    v19 = self->_addedCompletions;
    self->_addedCompletions = 0;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v36 != v23)
            objc_enumerationMutation(v20);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i) + 16))();
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v22);
    }

  }
  if ((*((_BYTE *)self + 172) & 0x40) != 0)
  {
    -[UIViewAnimationState _outerPropertyAnimator:](self, "_outerPropertyAnimator:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__UIViewAnimationState_sendDelegateAnimationDidStop_finished___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
    if (!WeakRetained
      || (v27 = WeakRetained,
          v28 = objc_loadWeakRetained((id *)&self->_propertyAnimator),
          v29 = objc_msgSend(v28, "_pausesOnCompletion"),
          v28,
          v27,
          (v29 & 1) == 0))
    {
      -[UIViewAnimationState _removeAnimationStateFromTrackingMap:disableTrackingIfNeeded:](self, "_removeAnimationStateFromTrackingMap:disableTrackingIfNeeded:", 1, (byte_1EDDCA602 & 1) == 0);
    }
  }
  if (self->_animationID)
    v31 = (const __CFString *)self->_animationID;
  else
    v31 = &stru_1E16EDF20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v31, CFSTR("name"), self->_delegate, CFSTR("delegate"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSNotificationCenter uikitInternalCenter]();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("UIViewAnimationDidStopInternalNotification"), self, v32);

}

+ (void)popAnimationState
{
  const __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  id v10;

  if (!__currentViewAnimationState)
    return;
  v10 = (id)__currentViewAnimationState;
  objc_msgSend(v10, "pop");
  if (*(_QWORD *)(__currentViewAnimationState + 16))
    v3 = *(const __CFString **)(__currentViewAnimationState + 16);
  else
    v3 = &stru_1E16EDF20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v3, CFSTR("name"), *((_QWORD *)v10 + 4), CFSTR("delegate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSNotificationCenter uikitInternalCenter]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("UIViewAnimationDidCommitInternalNotification"), a1, v4);

  v6 = *(id *)(__currentViewAnimationState + 16);
  objc_storeStrong((id *)&__currentViewAnimationState, *(id *)(__currentViewAnimationState + 8));
  if (!*((_DWORD *)v10 + 42) && (*((_BYTE *)v10 + 173) & 1) == 0)
  {
    objc_msgSend(v10, "sendDelegateAnimationDidStop:finished:", 0, 1);
    v7 = (void *)*((_QWORD *)v10 + 4);
    *((_QWORD *)v10 + 4) = 0;

  }
  if (!__currentViewAnimationState && qword_1EDDCA648 && __animate)
  {
    v8 = v6;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UICalloutBarAnimationFade")) & 1) != 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UITextSelectionView"));

    if ((v9 & 1) == 0 && (byte_1EDDCA602 & 1) == 0)
    {
      v8 = (id)qword_1EDDCA648;
      qword_1EDDCA648 = 0;
      goto LABEL_15;
    }
  }
LABEL_16:
  if (!__currentViewAnimationState)
    objc_msgSend((id)qword_1EDDCA670, "removeAllObjects");

}

- (void)pop
{
  UIView *transitionView;
  const __CFString *v4;
  int64_t transition;
  const __CFString *v6;
  void *v7;
  double frameInterval;
  double v9;
  double v10;
  double v11;
  uint64_t updateReason;
  id v13;
  UIView *filterView;
  int filter;
  double v16;
  double v17;
  int v18;
  int v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double filterValue;

  -[UIViewAnimationState _runAlongsideAnimations](self, "_runAlongsideAnimations");
  -[UIViewAnimationState _finalizeDeferredAnimations](self, "_finalizeDeferredAnimations");
  transitionView = self->_transitionView;
  if (transitionView)
  {
    v4 = 0;
    transition = self->_transition;
    v6 = CFSTR("pageCurl");
    switch(transition)
    {
      case 'e':
        goto LABEL_17;
      case 'f':
LABEL_6:
        v4 = 0;
        v6 = CFSTR("pageUnCurl");
        goto LABEL_17;
      case 'g':
        v4 = 0;
        v6 = CFSTR("suckEffect");
        goto LABEL_17;
      case 'h':
        v4 = 0;
        v6 = CFSTR("spewEffect");
        goto LABEL_17;
      case 'i':
        v4 = 0;
        v6 = CFSTR("cameraIris");
        goto LABEL_17;
      case 'j':
        v4 = 0;
        v6 = CFSTR("cameraIrisHollowClose");
        goto LABEL_17;
      case 'k':
        v4 = 0;
        v6 = CFSTR("cameraIrisHollowOpen");
        goto LABEL_17;
      case 'l':
        v4 = 0;
        v6 = CFSTR("genieEffect");
LABEL_17:
        objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setType:", v6);
        objc_msgSend(v7, "setSubtype:", v4);
        -[UIViewAnimationState setAnimationAttributes:skipDelegateAssignment:](self, "setAnimationAttributes:skipDelegateAssignment:", v7, 0);
        frameInterval = self->_frameInterval;
        if (frameInterval > 0.0)
          objc_msgSend(v7, "setFrameInterval:", self->_frameInterval);
        if (CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E0CD23C0]))
        {
          if (frameInterval > 0.0)
            goto LABEL_24;
          LODWORD(v10) = 1123024896;
          LODWORD(v9) = 30.0;
          LODWORD(v11) = 1123024896;
          objc_msgSend(v7, "setPreferredFrameRateRange:", v9, v10, v11);
          updateReason = 1048609;
        }
        else
        {
          *(float *)&v9 = self->_preferredFrameRateRange.minimum;
          *(float *)&v10 = self->_preferredFrameRateRange.maximum;
          *(float *)&v11 = self->_preferredFrameRateRange.preferred;
          objc_msgSend(v7, "setPreferredFrameRateRange:", v9, v10, v11);
          updateReason = self->_updateReason;
        }
        objc_msgSend(v7, "setHighFrameRateReason:", updateReason);
LABEL_24:
        if ((*((_BYTE *)self + 172) & 4) != 0)
          objc_msgSend(v7, "setTransitionFlags:", 3);
        if (self->_transitionOptions)
          objc_msgSend(v7, "setOptions:");
        if (+[UIView _shouldTrackActionWithAnimator:](UIView, "_shouldTrackActionWithAnimator:", v7))
          v13 = +[UIViewPropertyAnimator _trackNonAdditiveAnimationWithAnimator:forLayer:forKey:](UIViewPropertyAnimator, "_trackNonAdditiveAnimationWithAnimator:forLayer:forKey:", v7, self->_transitionView->_layer, CFSTR("transition"));
        -[CALayer addAnimation:forKey:](self->_transitionView->_layer, "addAnimation:forKey:", v7, 0);
        if (+[UIView _isAnimationTracking](UIView, "_isAnimationTracking"))
          -[UIViewAnimationState _trackAnimation:withAnimationKey:forKeyPath:inLayer:](self, "_trackAnimation:withAnimationKey:forKeyPath:inLayer:", v7, CFSTR("transition"), CFSTR("transition"), self->_transitionView->_layer);

        transitionView = self->_transitionView;
LABEL_33:
        self->_transitionView = 0;

        break;
      default:
        switch(transition)
        {
          case 1:
            v6 = CFSTR("oglFlip");
            v4 = CFSTR("fromLeft");
            goto LABEL_17;
          case 2:
            v6 = CFSTR("oglFlip");
            v4 = CFSTR("fromRight");
            goto LABEL_17;
          case 3:
            goto LABEL_17;
          case 4:
            goto LABEL_6;
          case 5:
            v4 = 0;
            v6 = CFSTR("fade");
            goto LABEL_17;
          case 6:
            v6 = CFSTR("oglFlip");
            v4 = CFSTR("fromTop");
            goto LABEL_17;
          case 7:
            v6 = CFSTR("oglFlip");
            v4 = CFSTR("fromBottom");
            goto LABEL_17;
          default:
            goto LABEL_33;
        }
        goto LABEL_33;
    }
  }
  filterView = self->_filterView;
  if (filterView)
  {
    filter = self->_filter;
    if ((filter & 0xFFFFFFFE) == 0xC8)
    {
      if (filter == 200)
      {
        -[UIView bounds](filterView, "bounds");
        filterValue = self->_filterValue;
        _UIViewCurlUpTransitionToTime(&filterValue, v16, v17);
        v19 = v18;
        v20 = objc_alloc(MEMORY[0x1E0CD2780]);
        v21 = (void *)objc_msgSend(v20, "initWithType:", *MEMORY[0x1E0CD2E88]);
        objc_msgSend(v21, "setName:", CFSTR("curl"));
        objc_msgSend(v21, "setCachesInputImage:", 1);
        LODWORD(v22) = 1128792064;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v23, CFSTR("inputRadius"));

        LODWORD(v24) = 1083258398;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v25, CFSTR("inputAngle"));

        LODWORD(v26) = v19;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValue:forKey:", v27, CFSTR("inputTime"));

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView layer](self->_filterView, "layer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setFilters:", v28);

      }
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.curl.inputTime"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewAnimationState setAnimationAttributes:](self, "setAnimationAttributes:", v30);
      objc_msgSend(v30, "setFillMode:", *MEMORY[0x1E0CD2B68]);
      if (filter == 200)
      {
        LODWORD(v31) = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setFromValue:", v32);

        objc_msgSend(v30, "setToValue:", 0);
        -[UIView layer](self->_filterView, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAnimation:forKey:", v30, 0);

      }
      else
      {
        objc_msgSend(v30, "setFromValue:", 0);
        objc_msgSend(v30, "setToValue:", 0);
        -[UIView layer](self->_filterView, "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addAnimation:forKey:", v30, 0);

        -[UIView layer](self->_filterView, "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v36) = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setValue:forKeyPath:", v37, CFSTR("filters.curl.inputTime"));

        -[UIView performSelector:withObject:afterDelay:](self->_filterView, "performSelector:withObject:afterDelay:", sel__clearAnimationFilters, 0, self->_delay + self->_duration);
      }

      filterView = self->_filterView;
    }
    self->_filterView = 0;

  }
  -[UIViewAnimationState _runConstraintBasedLayoutAnimations](self, "_runConstraintBasedLayoutAnimations");
}

- (void)_finalizeDeferredAnimations
{
  NSMapTable *i;
  NSMapTable *v4;
  NSMapTable *viewToDeferredAnimationsMap;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  for (i = self->_viewToDeferredAnimationsMap; i; i = self->_viewToDeferredAnimationsMap)
  {
    v4 = i;
    viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
    self->_viewToDeferredAnimationsMap = 0;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * j);
          -[NSMapTable objectForKey:](v6, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_664);
          objc_msgSend(v11, "_generateDeferredAnimations:", v12);

        }
        v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)_runAlongsideAnimations
{
  void (**alongsideAnimations)(id, SEL);
  id v4;

  alongsideAnimations = (void (**)(id, SEL))self->_alongsideAnimations;
  if (alongsideAnimations)
  {
    alongsideAnimations[2](alongsideAnimations, a2);
    v4 = self->_alongsideAnimations;
    self->_alongsideAnimations = 0;

  }
}

- (void)_runConstraintBasedLayoutAnimations
{
  unint64_t v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *viewsPendingConstraintBasedAnimation;
  _QWORD v18[4];
  id v19;
  UIViewAnimationState *v20;
  uint64_t *v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_viewsPendingConstraintBasedAnimation, "count"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v3 = -[NSMutableArray count](self->_viewsPendingConstraintBasedAnimation, "count");
    v28[3] = 0;
    if (v3)
    {
      for (i = 0; i < v3; v28[3] = i)
      {
        -[NSMutableArray objectAtIndex:](self->_viewsPendingConstraintBasedAnimation, "objectAtIndex:", i);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "layer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "context");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = 1;
        }
        else
        {
          objc_msgSend(v5, "_layoutEngine");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v10 != 0;

        }
        if (objc_msgSend(v5, "_is_needsLayout"))
        {
          v11 = !v8;
          LODWORD(v12) = 1;
        }
        else
        {
          objc_msgSend((id)qword_1EDDCA670, "objectForKey:", v5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = objc_msgSend(v13, "count") != 0;

          v11 = !v8;
          if (((!v8 | v12) & 1) == 0)
          {
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            objc_msgSend(v5, "_mutableLayoutArrangements");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v12)
            {
              v15 = *(_QWORD *)v24;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v24 != v15)
                    objc_enumerationMutation(v14);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "_awaitingAnimationLayoutPass") & 1) != 0)
                  {
                    LODWORD(v12) = 1;
                    goto LABEL_20;
                  }
                }
                v12 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                if (v12)
                  continue;
                break;
              }
            }
LABEL_20:

            v11 = 0;
          }
        }
        if (!v11)
        {
          if ((_DWORD)v12)
          {
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke;
            v18[3] = &unk_1E16E1778;
            v19 = v5;
            v20 = self;
            v21 = &v27;
            v22 = v3;
            objc_msgSend(v19, "_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:", v18);

          }
        }

        i = v28[3] + 1;
      }
    }
    viewsPendingConstraintBasedAnimation = self->_viewsPendingConstraintBasedAnimation;
    self->_viewsPendingConstraintBasedAnimation = 0;

    _Block_object_dispose(&v27, 8);
  }
}

- (void)_removeAnimationStateFromTrackingMap:(BOOL)a3 disableTrackingIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSUUID *uuid;
  _BOOL4 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (self->_uuid)
  {
    v14 = a4;
    objc_msgSend((id)qword_1EDDCA650, "objectForKey:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_trackedAnimations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_getAssociatedObject(v11, &unk_1EDDCA604);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setAssociatedObject(v12, &unk_1EDDCA601, 0, (void *)1);
          objc_setAssociatedObject(v11, &unk_1EDDCA604, 0, (void *)1);
          objc_setAssociatedObject(v11, &unk_1EDDCA603, 0, (void *)1);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_trackedAnimations, "removeAllObjects");
    if (v4)
    {
      objc_msgSend(v15, "removeObject:", self);
      if (v14 && !objc_msgSend(v15, "count"))
        +[UIView _disableAnimationTracking:clearTrackedAnimations:](UIView, "_disableAnimationTracking:clearTrackedAnimations:", self->_uuid, 0);
    }
    uuid = self->_uuid;
    self->_uuid = 0;

  }
}

+ (void)pushViewAnimationState:(id)a3 context:(void *)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "pushWithViewAnimationID:context:", v8, a4);

}

- (void)pushWithViewAnimationID:(id)a3 context:(void *)a4
{
  NSString *v6;
  NSString *animationID;
  id WeakRetained;
  char v9;
  void *v10;
  id v11;
  char v12;
  id v13;

  v13 = a3;
  v6 = (NSString *)objc_msgSend(v13, "copy");
  animationID = self->_animationID;
  self->_animationID = v6;

  self->_context = a4;
  self->_duration = 0.2;
  if (__currentViewAnimationState)
  {
    WeakRetained = objc_loadWeakRetained((id *)(__currentViewAnimationState + 272));
    if (WeakRetained)
      v9 = 32;
    else
      v9 = *(_BYTE *)(__currentViewAnimationState + 172) & 0x20;
    *((_BYTE *)self + 172) = *((_BYTE *)self + 172) & 0xDF | v9;

    v10 = (void *)__currentViewAnimationState;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong((id *)&self->_nextState, v10);
  objc_storeStrong((id *)&__currentViewAnimationState, self);
  if (__animate)
  {
    v11 = v13;
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("UICalloutBarAnimationFade")))
    {

    }
    else
    {
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("UITextSelectionView"));

      if ((v12 & 1) == 0)
        -[UIViewAnimationState _prepareForViewAnimationAfterPush](self, "_prepareForViewAnimationAfterPush");
    }
  }

}

- (void)_prepareForViewAnimationAfterPush
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *trackedAnimations;
  id WeakRetained;
  char v7;
  char v8;
  BOOL v9;
  id v10;

  if (qword_1EDDCA658
    && !self->_belongsToTrackingAnimator
    && -[UIViewAnimationState _runsAlongsideAnimations](self, "_runsAlongsideAnimations"))
  {
    -[UIViewAnimationState _setAlongsideAnimations:](self, "_setAlongsideAnimations:", qword_1EDDCA658);
    v3 = (void *)qword_1EDDCA658;
    qword_1EDDCA658 = 0;

  }
  if (qword_1EDDCA648)
  {
    if (!self->_trackedAnimations)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      trackedAnimations = self->_trackedAnimations;
      self->_trackedAnimations = v4;

    }
    if (!self->_uuid)
    {
      -[UIViewAnimationState _addAnimationStateForTracking:](self, "_addAnimationStateForTracking:", qword_1EDDCA648);
      WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);
      v7 = *((_BYTE *)self + 172);
      if ((v7 & 0x20) != 0)
      {
        v8 = 64;
        if (WeakRetained)
        {
          v10 = WeakRetained;
          v9 = objc_msgSend(WeakRetained, "isInterruptible") == 0;
          WeakRetained = v10;
          if (v9)
            v8 = 64;
          else
            v8 = 0;
          v7 = *((_BYTE *)self + 172);
        }
      }
      else
      {
        v8 = 0;
      }
      *((_BYTE *)self + 172) = v7 & 0xBF | v8;

    }
  }
}

- (UIViewAnimationState)init
{
  UIViewAnimationState *v2;
  BOOL v3;
  NSMutableArray *v4;
  NSMutableArray *trackedAnimations;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIViewAnimationState;
  v2 = -[UIViewAnimationState init](&v7, sel_init);
  if (v2)
    v3 = qword_1EDDCA648 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    trackedAnimations = v2->_trackedAnimations;
    v2->_trackedAnimations = v4;

  }
  return v2;
}

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  id v19;
  char *v20;
  id v21;
  signed int v22;
  id v23;
  id v24;
  float v25;
  char v26;
  char v27;
  unsigned int v28;
  double v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  id WeakRetained;
  double *v36;
  id *v37;
  void *v38;
  id *v39;
  id *v40;
  id v41;
  id *v42;
  void *v43;
  id v44;
  double v45;
  uint64_t v46;
  char v47;
  id v48;
  id v49;
  id v50;

  v49 = a5;
  v19 = a7;
  v20 = (char *)a8;
  v21 = a9;
  v22 = WORD1(a6) & 7;
  v50 = a10;
  if (!v20 || v20[238])
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_4;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);

  if (WeakRetained)
  {
    v23 = 0;
LABEL_34:
    if ((a6 & 0x20) == 0 && (*((char *)self + 172) & 0x80000000) == 0)
      a3 = *((double *)v20 + 5);
    goto LABEL_56;
  }
  v48 = v21;
  v36 = v20;
  v23 = 0;
  v37 = (id *)v36;
  while (1)
  {
    v38 = v23;
    v23 = objc_loadWeakRetained(v37 + 34);

    if (v23)
    {
      if ((objc_msgSend(v23, "isInterruptible") & 1) != 0)
        break;
    }
    v39 = (id *)v37[1];

    v37 = v39;
    if (!v39)
    {

      v23 = 0;
      goto LABEL_48;
    }
  }

  *((_BYTE *)self + 172) = *((_BYTE *)self + 172) & 0x7F | (((a6 & 0x2008) != 0) << 7);
  a6 = objc_msgSend(v23, "_optionsForNestedLegacyAnimation:", a6);
  if ((a6 & 0x20) == 0)
  {
    a3 = v36[5] - a4;
    a4 = v36[6] + a4;
    v21 = v48;
    if (*((char *)self + 172) < 0)
      goto LABEL_56;
    v47 = 1;
    goto LABEL_50;
  }
LABEL_48:
  v21 = v48;
  if (*((char *)self + 172) < 0)
    goto LABEL_34;
  v47 = 0;
LABEL_50:
  v40 = v36;
  do
  {
    v41 = objc_loadWeakRetained(v40 + 34);
    if (v41)
      break;
    v42 = (id *)v40[1];

    v40 = v42;
  }
  while (v42);

  if ((objc_msgSend(v41, "isInterruptible") & 1) == 0)
  {
    objc_msgSend(v41, "_viewAnimationState");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_incrementDidEndCount");

  }
  v21 = v48;
  if ((v47 & 1) == 0)
    goto LABEL_34;
LABEL_56:
  if ((a6 & 0x40) == 0)
  {
    v22 = *((_DWORD *)v20 + 22);
    if (v22 == 6)
    {
      v24 = *((id *)v20 + 25);
      v22 = 6;
      if ((a6 & 0x200) != 0)
        goto LABEL_62;
      goto LABEL_61;
    }
  }
  v24 = 0;
  if ((a6 & 0x200) == 0)
  {
LABEL_61:
    v44 = *((id *)v20 + 24);

    v19 = v44;
  }
LABEL_62:
  v45 = *((double *)v20 + 7);
  if (v45 > 0.0)
    self->_frameInterval = v45;
  if (!CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)(v20 + 64), *MEMORY[0x1E0CD23C0]))
  {
    v46 = *((_QWORD *)v20 + 8);
    self->_preferredFrameRateRange.preferred = *((float *)v20 + 18);
    *(_QWORD *)&self->_preferredFrameRateRange.minimum = v46;
    self->_updateReason = *((_DWORD *)v20 + 19);
  }
LABEL_4:
  self->_duration = a3;
  self->_delay = a4;
  v25 = 3.4028e38;
  if ((a6 & 8) == 0)
    v25 = 0.0;
  self->_repeatCount = v25;
  v26 = a6 >> 1;
  v27 = *((_BYTE *)self + 172) & 0xE5;
  self->_curve = v22;
  *((_BYTE *)self + 172) = ((a6 & 0xFE) >> 1) & 0xA | (16 * (a6 & 1)) | v27;
  self->_transition = (a6 >> 20) & 7;
  objc_storeStrong((id *)&self->_transitionView, a5);
  *((_BYTE *)self + 172) = (*((_BYTE *)self + 172) & 0xFB | (a6 >> 5) & 4) ^ 4;
  objc_storeStrong((id *)&self->_animationFactory, v19);
  v28 = BYTE3(a6) & 0xF;
  if (v28)
  {
    v29 = 1.0 / (240.0 / (double)(int)(v28 + 1));
    if (v29 > 0.0)
      self->_frameInterval = v29;
  }
  if (v20 && !v20[238])
  {
    if (v20[235])
      v30 = a6 | 0x400;
    else
      v30 = a6;
    if (v20[236])
      a6 = v30 | 0x1000;
    else
      a6 = v30;
    v26 = a6 >> 1;
  }
  self->_allowUserInteraction = v26 & 1;
  self->_allowUserInteractionToCutOffEndOfAnimation = (a6 & 0x400) != 0;
  self->_disallowAdditiveAnimations = (a6 & 0x800) != 0;
  self->_allowsHitTesting = (a6 & 0x1000) != 0;
  v31 = v50;
  +[UIViewAnimationBlockDelegate animationBlockDelegateWithDuration:options:start:completion:](UIViewAnimationBlockDelegate, "animationBlockDelegateWithDuration:options:start:completion:", a6, v21, v50, a3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "set_animationState:", self);
  objc_storeStrong(&self->_delegate, v32);
  self->_willStartSelector = sel__willBeginBlockAnimation_context_;
  self->_didEndSelector = sel__didEndBlockAnimation_finished_context_;
  if (v24)
    objc_storeStrong((id *)&self->_customCurve, v24);
  if (v19 && v22 == 6)
  {
    if (!self->_customCurve && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[_UIBasicAnimationFactory _timingFunctionForAnimation](self->_animationFactory, "_timingFunctionForAnimation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
        objc_storeStrong((id *)&self->_customCurve, v33);

      v31 = v50;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      self->_animationFactoryMakesPerAnimationCustomCurves = 1;
    if (!self->_customCurve)
    {
      if (v20)
        v34 = *((_QWORD *)v20 + 11);
      else
        v34 = 5;
      self->_curve = v34;
    }
  }

}

- (void)_addAnimationStateForTracking:(id)a3
{
  NSUUID *v4;
  NSUUID *uuid;
  id v6;

  v4 = (NSUUID *)a3;
  objc_msgSend((id)qword_1EDDCA650, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", self);
  uuid = self->_uuid;
  self->_uuid = v4;

}

- (void)_setAlongsideAnimations:(id)a3
{
  void *v4;
  id alongsideAnimations;

  v4 = _Block_copy(a3);
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = v4;

}

- (BOOL)_runsAlongsideAnimations
{
  return 1;
}

uint64_t __39__UIViewAnimationState__addCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 belongsToTrackingAnimator;
  UIViewAnimationState *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id delegate;
  UIViewAnimationState *retainedSelf;
  id v14;

  v4 = a4;
  v14 = a3;
  belongsToTrackingAnimator = self->_belongsToTrackingAnimator;
  v7 = self->_nextState;
  if (!self->_animationDidStopSent)
  {
    -[UIViewAnimationState _decrementDidEndCount](self, "_decrementDidEndCount");
    if (!self->_didEndCount)
    {
      -[UIViewAnimationState _outerPropertyAnimator:](self, "_outerPropertyAnimator:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "_pausesOnCompletion") || *((char *)self + 172) < 0)
      {
        self->_animationDidStopSent = 1;
        if (!self->_animationDidStopForced)
          -[UIViewAnimationState sendDelegateAnimationDidStop:finished:](self, "sendDelegateAnimationDidStop:finished:", v14, v4);
        if (v8 && (*((char *)self + 172) & 0x80000000) == 0 && (objc_msgSend(v8, "isInterruptible") & 1) == 0)
        {
          objc_msgSend(v8, "_viewAnimationState");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_animationDidStopWithNilAnimationFinished:", v4);

        }
        delegate = self->_delegate;
        self->_delegate = 0;

        retainedSelf = self->_retainedSelf;
        if (retainedSelf)
        {
          self->_retainedSelf = 0;

        }
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);

        if (WeakRetained)
          -[UIViewAnimationState sendDelegateAnimationDidStop:finished:](self, "sendDelegateAnimationDidStop:finished:", v14, v4);
      }

    }
  }
  if (belongsToTrackingAnimator && v7 != 0)
    -[UIViewAnimationState animationDidStop:finished:](v7, "animationDidStop:finished:", v14, v4);

}

- (void)_decrementDidEndCount
{
  --self->_didEndCount;
}

- (void)_animationDidStopWithNilAnimationFinished:(BOOL)a3
{
  -[UIViewAnimationState animationDidStop:finished:](self, "animationDidStop:finished:", 0, a3);
}

- (id)_outerPropertyAnimator:(BOOL)a3
{
  _BOOL4 v3;
  UIViewAnimationState *v4;
  id *p_isa;
  id WeakRetained;
  void *v7;
  id *v8;

  v3 = a3;
  v4 = self;
  if (v4)
  {
    p_isa = (id *)&v4->super.isa;
    WeakRetained = 0;
    while (1)
    {
      v7 = WeakRetained;
      WeakRetained = objc_loadWeakRetained(p_isa + 34);

      if (WeakRetained)
      {
        if (!v3 || (objc_msgSend(WeakRetained, "isInterruptible") & 1) != 0)
          break;
      }
      v8 = (id *)p_isa[1];

      p_isa = v8;
      if (!v8)
      {
        p_isa = (id *)WeakRetained;
        WeakRetained = 0;
        break;
      }
    }

  }
  else
  {
    WeakRetained = 0;
  }
  return WeakRetained;
}

- (BOOL)_hasDeferredAnimationForView:(id)a3 key:(id)a4
{
  NSMapTable *viewToDeferredAnimationsMap;
  id v6;
  void *v7;
  void *v8;

  viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
  v6 = a4;
  -[NSMapTable objectForKey:](viewToDeferredAnimationsMap, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (void)_trackAnimation:(id)a3 nonAdditiveAnimation:(id)a4 withAnimationKey:(id)a5 forKeyPath:(id)a6 inLayer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  int isKindOfClass;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  float v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;

  v60 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (-[UIViewAnimationState _isTrackingEnabled](self, "_isTrackingEnabled"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!v13 || !v14)
        goto LABEL_58;
LABEL_10:
      +[UIViewPropertyAnimator _propertyAnimatorWithUUID:](UIViewPropertyAnimator, "_propertyAnimatorWithUUID:", qword_1EDDCA648);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (!v17 || (v19 = isKindOfClass, objc_opt_class(), ((objc_opt_isKindOfClass() | v19) & 1) == 0))
      {
        if (v12)
        {
          objc_getAssociatedObject(v15, &unk_1EDDCA601);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            v24 = (void *)objc_opt_new();
            objc_setAssociatedObject(v15, &unk_1EDDCA601, v24, (void *)1);
          }
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v12, v14);

        }
        v22 = v12;
        if (!v17)
          goto LABEL_57;
        goto LABEL_54;
      }
      objc_msgSend(v17, "_originalFromValueForKey:inLayer:", v14, v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 & 1) != 0)
        v21 = 0;
      else
        v21 = v60;
      v22 = v21;

      if (v20)
      {
        if (v22 && objc_msgSend(v22, "isAdditive"))
        {
          objc_msgSend(v15, "animationForKey:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            if (objc_msgSend(v14, "hasPrefix:", CFSTR("position")))
            {
              objc_msgSend(v15, "animationForKey:", CFSTR("position.x"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v23 = 0;
            }
          }
          objc_msgSend(v23, "beginTimeMode", v23);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x1E0CD2918]);

          if (v37)
          {
            objc_msgSend(v15, "convertTime:fromLayer:", 0, CACurrentMediaTime());
            v39 = v38;
            v40 = v59;
            objc_msgSend(v59, "beginTime");
            v42 = v39 - v41;
            objc_msgSend(v59, "speed");
            v44 = v42 * v43;
            objc_msgSend(v59, "timeOffset");
            v46 = v44 - v45;
            objc_msgSend(v17, "duration");
            v48 = v46 / v47;
            if (v48 > 1.0)
              v48 = 1.0;
          }
          else
          {
            objc_msgSend(v22, "beginTime");
            v50 = v49;
            objc_msgSend(v17, "duration");
            v48 = v50 / v51;
            v40 = v59;
          }
          objc_msgSend(v17, "_setAdditiveOffset:forKey:inLayer:", v13, v15, v48);

        }
        goto LABEL_53;
      }
      if ((objc_msgSend(v13, "hasPrefix:", CFSTR("UIPacingAnimationForAnimatorsKey")) & 1) != 0)
      {
        v20 = 0;
        goto LABEL_53;
      }
      if ((v19 & 1) != 0)
      {
        objc_msgSend(v60, "values");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_msgSend(v60, "isAdditive") & 1) == 0)
        {
          objc_msgSend(v60, "fromValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
          objc_msgSend(v17, "_setOriginalFromValue:forKey:inLayer:", v20, v14, v15);
          if (objc_msgSend(v17, "state") == 1)
          {
            objc_msgSend(v60, "beginTime");
            v28 = v27;
            if ((objc_msgSend(v17, "_isStarting") & 1) != 0
              || (objc_msgSend(v17, "isRunning") & 1) == 0 && (objc_msgSend(v17, "fractionComplete"), v32 <= 0.001))
            {
              if (!objc_msgSend(v17, "_isStarting") || v28 <= 0.0)
                goto LABEL_53;
              objc_msgSend(v17, "_dragAdjustedDuration");
              v30 = v28 / v29;
              v31 = v17;
            }
            else
            {
              -[UIViewAnimationState _canonicalTrackedUnpacedFractionComplete](self, "_canonicalTrackedUnpacedFractionComplete");
              v34 = v33;
              if (v28 > 0.0)
              {
                objc_msgSend(v17, "_dragAdjustedDuration");
                v34 = v34 + v28 / v35;
              }
              v31 = v17;
              v30 = v34;
            }
            objc_msgSend(v31, "_setAdditiveOffset:forKey:inLayer:", v13, v15, v30);
          }
LABEL_53:

LABEL_54:
          if ((objc_msgSend(v17, "_addedPacingAnimation") & 1) == 0)
          {
            LODWORD(v52) = 0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("uiFractionalProgress"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setFromValue:", v53);
            LODWORD(v55) = 1120403456;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setToValue:", v56);

            objc_msgSend(v17, "_setOriginalFromValue:forKey:inLayer:", v53, CFSTR("uiFractionalProgress"), v15);
            objc_msgSend(v17, "_viewAnimationState");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setAnimationAttributes:skipDelegateAssignment:customCurve:", v54, 0, 0);
            objc_msgSend(v54, "setRemovedOnCompletion:", 0);
            UniqueAnimationKeyForLayer(v15, CFSTR("UIPacingAnimationForAnimatorsKey"), 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addAnimation:forKey:", v54, v58);
            objc_msgSend(v17, "_setAddedPacingAnimation:animationKey:", 1, v58);
            objc_msgSend(v57, "_trackObject:withAnimationPropertyName:inLayer:", v54, v58, v15);

          }
          v12 = v22;
LABEL_57:
          -[UIViewAnimationState _trackObject:withAnimationPropertyName:inLayer:](self, "_trackObject:withAnimationPropertyName:inLayer:", v60, v13, v15);

          goto LABEL_58;
        }
        objc_msgSend(v15, "valueForKeyPath:", v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "fromValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "CA_addValue:multipliedBy:", v26, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_35;
    }
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();
    if (v13 && v14 && (v16 & 1) != 0)
      goto LABEL_10;
  }
LABEL_58:

}

- (BOOL)_shouldAnimateAdditivelyForKey:(id)a3 onLayer:(id)a4 forView:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  int isAdditivelyAnimatableKeyForLayer;
  int v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  float v26;
  float v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_disallowAdditiveAnimations)
  {
    _normalizedAnimationKey(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
      isAdditivelyAnimatableKeyForLayer = objc_msgSend(v10, "_shouldAnimatePropertyAdditivelyWithKey:", v12);
    else
      isAdditivelyAnimatableKeyForLayer = _isAdditivelyAnimatableKeyForLayer(v12, v9);
    v15 = isAdditivelyAnimatableKeyForLayer;
    v16 = dyld_program_sdk_at_least();
    if (self->_animationFactory)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v11 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v17 = -[_UIBasicAnimationFactory _shouldAnimateAdditivelyForView:withKeyPath:](self->_animationFactory, "_shouldAnimateAdditivelyForView:withKeyPath:", v10, v8) ^ 1;
    }
    else
    {
      LOBYTE(v17) = 0;
    }
    v11 = 0;
    if ((v15 & v16) == 1 && (v17 & 1) == 0)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v9, "animationKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v19)
      {
        v20 = v19;
        v29 = v13;
        v30 = v10;
        v21 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(v9, "animationForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), v29, v30);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v23;
              objc_msgSend(v24, "keyPath");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "isEqualToString:", v8))
              {
                if (!objc_msgSend(v24, "isAdditive"))
                {

LABEL_30:
                  v11 = 0;
                  goto LABEL_31;
                }
                objc_msgSend(v24, "repeatCount");
                v27 = v26;

                if (v27 > 0.0)
                  goto LABEL_30;
              }
              else
              {

              }
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v20)
            continue;
          break;
        }
        v11 = 1;
LABEL_31:
        v13 = v29;
        v10 = v30;
      }
      else
      {
        v11 = 1;
      }

    }
    goto LABEL_33;
  }
  v11 = 0;
LABEL_34:

  return v11;
}

- (BOOL)_isTrackingEnabled
{
  return self->_uuid && self->_trackedAnimations != 0;
}

- (void)_trackObject:(id)a3 withAnimationPropertyName:(id)a4 inLayer:(id)a5
{
  id v8;
  id object;

  v8 = a4;
  object = a3;
  objc_setAssociatedObject(object, &unk_1EDDCA604, a5, (void *)1);
  objc_setAssociatedObject(object, &unk_1EDDCA603, v8, (void *)1);

  -[NSMutableArray addObject:](self->_trackedAnimations, "addObject:", object);
}

- (id)_trackedAnimations
{
  return self->_trackedAnimations;
}

- (void)_removeAnimationStateFromTrackingMap:(BOOL)a3
{
  -[UIViewAnimationState _removeAnimationStateFromTrackingMap:disableTrackingIfNeeded:](self, "_removeAnimationStateFromTrackingMap:disableTrackingIfNeeded:", a3, 1);
}

- (int)_didEndCount
{
  return self->_didEndCount;
}

- (void)setAnimationAttributes:(id)a3 skipDelegateAssignment:(BOOL)a4
{
  -[UIViewAnimationState setAnimationAttributes:skipDelegateAssignment:customCurve:](self, "setAnimationAttributes:skipDelegateAssignment:customCurve:", a3, a4, 0);
}

- (id)_updateAnimationFrameWithAnimationProperties:(id)a3
{
  _UIViewAnimationFrame *v4;

  v4 = (_UIViewAnimationFrame *)a3;
  if (!v4)
    v4 = objc_alloc_init(_UIViewAnimationFrame);
  -[_UIViewAnimationFrame setStartTime:](v4, "setStartTime:", 0.0);
  -[_UIViewAnimationFrame setDuration:](v4, "setDuration:", self->_duration);
  return v4;
}

- (double)_canonicalTrackedUnpacedFractionComplete
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  id v10;

  v10 = 0;
  -[UIViewAnimationState _canonicalTrackedLayerAnimationInLayer:](self, "_canonicalTrackedLayerAnimationInLayer:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  objc_msgSend(v3, "beginTimeMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD2918]);

  v7 = -1.0;
  if (v6)
  {
    objc_msgSend(v3, "duration");
    -[UIViewAnimationState _unpacedFractionCompleteForAnimation:inLayer:duration:](self, "_unpacedFractionCompleteForAnimation:inLayer:duration:", v3, v4);
    v7 = v8;
  }

  return v7;
}

- (id)_canonicalTrackedLayerAnimationInLayer:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend((id)qword_1EDDCA650, "objectForKeyedSubscript:", self->_uuid, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "_trackedAnimations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "objectAtIndex:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = v9;
            objc_getAssociatedObject(v9, &unk_1EDDCA603);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_getAssociatedObject(v10, &unk_1EDDCA604);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "hasBeenCommitted"))
            {
              objc_msgSend(v12, "animationForKey:", v11);
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
                *a3 = objc_retainAutorelease(v12);

              goto LABEL_16;
            }

          }
        }

      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_16:

  return v5;
}

- (void)_trackAnimation:(id)a3 withAnimationKey:(id)a4 forKeyPath:(id)a5 inLayer:(id)a6
{
  -[UIViewAnimationState _trackAnimation:nonAdditiveAnimation:withAnimationKey:forKeyPath:inLayer:](self, "_trackAnimation:nonAdditiveAnimation:withAnimationKey:forKeyPath:inLayer:", a3, 0, a4, a5, a6);
}

- (void)_transferAnimationToTrackingAnimator:(id)a3
{
  id v5;
  int v6;
  id WeakRetained;
  void *v8;
  int v9;
  UIViewAnimationState *v10;
  UIViewAnimationState *nextState;
  void *v12;
  UIViewAnimationState *v13;
  _BYTE *delegate;
  _BYTE *v15;
  unint64_t v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = dyld_program_sdk_at_least();
  WeakRetained = objc_loadWeakRetained((id *)&self->_propertyAnimator);

  if (v6)
  {
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 1168, CFSTR("Attempting to transfer an animation to an animation state that does not belong to a property animator."));

    }
  }
  else if (!WeakRetained)
  {
    v16 = qword_1EDDCA660;
    if (!qword_1EDDCA660)
    {
      v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&qword_1EDDCA660);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Attempting to transfer an animation to an animation state that does not belong to a property animator.", buf, 2u);
    }
  }
  v9 = dyld_program_sdk_at_least();
  objc_msgSend(v5, "delegate");
  v10 = (UIViewAnimationState *)objc_claimAutoreleasedReturnValue();
  nextState = self->_nextState;

  if (v9)
  {
    if (v10 != nextState)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 1169, CFSTR("Attempting to transfer an animation to an animation state that is not a direct child of the animation's animation state."));

    }
  }
  else if (v10 != nextState)
  {
    v18 = qword_1EDDCA668;
    if (!qword_1EDDCA668)
    {
      v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&qword_1EDDCA668);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Attempting to transfer an animation to an animation state that is not a direct child of the animation's animation state.", v20, 2u);
    }
  }
  if (!self->_belongsToTrackingAnimator)
  {
    v13 = self->_nextState;
    self->_allowsHitTesting = v13->_allowsHitTesting;
    self->_allowUserInteractionToCutOffEndOfAnimation = v13->_allowUserInteractionToCutOffEndOfAnimation;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      delegate = self->_delegate;
      v15 = self->_nextState->_delegate;
      delegate[12] = v15[12];
      delegate[9] = v15[9];
      delegate[11] = v15[11];
    }
    self->_belongsToTrackingAnimator = 1;
    objc_storeStrong((id *)&self->_retainedSelf, self);
  }
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  ++self->_didEndCount;

}

- (BOOL)_addCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__UIViewAnimationState__addCompletion___block_invoke;
  v7[3] = &unk_1E16EB1C8;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[UIViewAnimationState _addCompletionWithPosition:](self, "_addCompletionWithPosition:", v7);

  return (char)self;
}

- (BOOL)_addCompletionWithPosition:(id)a3
{
  id v4;
  NSMutableArray *addedCompletions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;

  v4 = a3;
  addedCompletions = self->_addedCompletions;
  if (!addedCompletions)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_addedCompletions;
    self->_addedCompletions = v6;

    addedCompletions = self->_addedCompletions;
  }
  v8 = (void *)objc_msgSend(v4, "copy");
  -[NSMutableArray addObject:](addedCompletions, "addObject:", v8);

  return 1;
}

- (void)animationDidStart:(id)a3
{
  id v4;
  UIViewAnimationState *nextState;
  const char *context;
  char v7;
  char v8;
  id v9;
  id v10;

  v4 = a3;
  if ((*((_BYTE *)self + 172) & 1) == 0 && !self->_animationDidStopSent && !self->_animationDidStopForced)
  {
    *((_BYTE *)self + 172) |= 1u;
    if (self->_delegate)
    {
      context = (const char *)self->_context;
      v10 = v4;
      if (self->_willStartSelector)
      {
        v7 = objc_opt_respondsToSelector();
        v4 = v10;
        if ((v7 & 1) != 0)
        {
          _UIPerformVoidSelector2(self->_delegate, self->_willStartSelector, (const char *)self->_animationID, context);
LABEL_16:
          v4 = v10;
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(self->_delegate, "performSelector:withObject:withObject:", sel_animationWillStart_context_, self->_animationID, context);
          goto LABEL_16;
        }
        v8 = objc_opt_respondsToSelector();
        v4 = v10;
        if ((v8 & 1) != 0)
        {
          objc_msgSend(self->_delegate, "performSelector:withObject:", sel_animationWillStart_, self->_animationID);
          goto LABEL_16;
        }
      }
    }
  }
  if (self->_belongsToTrackingAnimator)
  {
    nextState = self->_nextState;
    if (nextState)
    {
      v9 = v4;
      -[UIViewAnimationState animationDidStart:](nextState, "animationDidStart:");
      v4 = v9;
    }
  }

}

uint64_t __62__UIViewAnimationState_sendDelegateAnimationDidStop_finished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAnimationStateFromTrackingMap:disableTrackingIfNeeded:", 1, (byte_1EDDCA602 & 1) == 0);
}

- (double)_unpacedFractionCompleteForAnimation:(id)a3 inLayer:(id)a4 duration:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = -1.0;
  if (v7)
  {
    if (objc_msgSend(v8, "hasBeenCommitted"))
    {
      objc_msgSend(v7, "beginTimeMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CD2918]);

      v10 = 0.0;
      if (v12)
      {
        if (a5 == 0.0)
        {
          objc_msgSend(v7, "duration");
          a5 = v13;
        }
        objc_msgSend(v9, "convertTime:fromLayer:", 0, CACurrentMediaTime());
        v15 = v14;
        objc_msgSend(v7, "beginTime");
        v17 = v15 - v16;
        objc_msgSend(v7, "speed");
        v19 = v17 * fabsf(v18);
        objc_msgSend(v7, "timeOffset");
        v21 = v19 - v20;
        if (v21 > 0.0)
        {
          v22 = v21 / a5;
          if (v22 <= 1.0)
            v10 = v22;
          else
            v10 = 1.0;
        }
      }
    }
  }

  return v10;
}

uint64_t __51__UIViewAnimationState__finalizeDeferredAnimations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_finalize");
}

- (void)sendDelegateDidStopManually:(BOOL)a3
{
  _BOOL8 v4;
  UIViewAnimationState *nextState;

  if (!self->_animationDidStopSent && !self->_animationDidStopForced)
  {
    v4 = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(self->_delegate, "_setForcingImmediateCompletion:", 1);
    -[UIViewAnimationState sendDelegateAnimationDidStop:finished:](self, "sendDelegateAnimationDidStop:finished:", 0, v4);
    self->_animationDidStopForced = 1;
    if (self->_belongsToTrackingAnimator)
    {
      nextState = self->_nextState;
      if (nextState)
        -[UIViewAnimationState sendDelegateDidStopManually:](nextState, "sendDelegateDidStopManually:", v4);
    }
  }
}

- (void)_setFinishedPosition:(int64_t)a3
{
  UIViewAnimationState *nextState;

  self->_finishedPosition = a3;
  if (self->_belongsToTrackingAnimator)
  {
    nextState = self->_nextState;
    if (nextState)
      -[UIViewAnimationState _setFinishedPosition:](nextState, "_setFinishedPosition:");
  }
}

- (void)_performWithCompletionCallbacksDisabledOnPop:(id)a3
{
  char v4;

  v4 = *((_BYTE *)self + 173);
  *((_BYTE *)self + 173) = v4 | 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *((_BYTE *)self + 173) = *((_BYTE *)self + 173) & 0xFE | v4 & 1;
}

- (BOOL)_isKeyframeAnimation
{
  return 0;
}

- (void)_transformIntoAdditiveAnimationAndNoteOriginal:(id)a3 inLayer:(id)a4 animationKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isAdditive") & 1) == 0 && !self->_disallowAdditiveAnimations)
  {
    objc_msgSend(v8, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if ((objc_msgSend(v13, "_shouldAnimatePropertyAdditivelyWithKey:", v11) & 1) == 0)
          goto LABEL_23;
        goto LABEL_9;
      }
    }
    else
    {

    }
    v13 = 0;
    if (!_isAdditivelyAnimatableKeyForLayer(v11, v9))
    {
LABEL_23:

      goto LABEL_24;
    }
LABEL_9:
    objc_msgSend(v8, "toValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v8, "keyPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKeyPath:", v17);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "fromValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (objc_msgSend(v10, "hasPrefix:", CFSTR("position")))
        objc_msgSend(v16, "CGPointValue");
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __92__UIViewAnimationState__transformIntoAdditiveAnimationAndNoteOriginal_inLayer_animationKey___block_invoke;
      v31[3] = &unk_1E16B47A8;
      v32 = v9;
      v33 = v16;
      v34 = v8;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v31);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v10, "hasPrefix:", CFSTR("position")))
      goto LABEL_22;
    objc_msgSend(v16, "CGPointValue");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v18, "CGPointValue");
    v25 = v24;
    v27 = v26;
    if ((objc_msgSend(v10, "hasSuffix:", CFSTR(".x")) & 1) == 0)
    {
      if (!objc_msgSend(v10, "hasSuffix:", CFSTR(".y")))
      {
LABEL_22:
        objc_msgSend(v18, "CA_addValue:multipliedBy:", v16, 0xFFFFFFFFLL);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAdditive:", 1);
        objc_msgSend(v8, "setFromValue:", v29);
        objc_msgSend(v16, "CA_addValue:multipliedBy:", v16, 0xFFFFFFFFLL);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setToValue:", v30);

        goto LABEL_23;
      }
      v21 = v25;
      v27 = v23;
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v21, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v28;
    goto LABEL_22;
  }
LABEL_24:

}

void __92__UIViewAnimationState__transformIntoAdditiveAnimationAndNoteOriginal_inLayer_animationKey___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "keyPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValue:forKeyPath:", v2, v3);

}

- (double)_elapsedTimeForCanonicallyTrackedAnimation
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  id v16;

  v16 = 0;
  -[UIViewAnimationState _canonicalTrackedLayerAnimationInLayer:](self, "_canonicalTrackedLayerAnimationInLayer:", &v16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v16;
  v4 = v3;
  v5 = -1.0;
  if (v2)
  {
    if (v3)
    {
      if (objc_msgSend(v3, "hasBeenCommitted"))
      {
        objc_msgSend(v2, "beginTimeMode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2918]);

        if (v7)
        {
          objc_msgSend(v4, "convertTime:fromLayer:", 0, CACurrentMediaTime());
          v9 = v8;
          objc_msgSend(v2, "beginTime");
          v11 = v9 - v10;
          objc_msgSend(v2, "speed");
          v13 = v11 * fabsf(v12);
          objc_msgSend(v2, "timeOffset");
          v5 = v13 - v14;
        }
      }
    }
  }

  return v5;
}

+ (void)_addConstraintPendingAnimation:(id)a3 container:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    objc_msgSend(a1, "_addViewForConstraintBasedAnimation:", v6);
    v7 = (void *)qword_1EDDCA670;
    if (!qword_1EDDCA670)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
      v9 = (void *)qword_1EDDCA670;
      qword_1EDDCA670 = v8;

      v7 = (void *)qword_1EDDCA670;
    }
    objc_msgSend(v7, "objectForKey:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend((id)qword_1EDDCA670, "setObject:forKey:", v10, v6);
    }
    objc_msgSend(v10, "addObject:", v11);

  }
}

+ (void)_addViewForConstraintBasedAnimation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a3;
  if (__currentViewAnimationState)
  {
    v10 = v3;
    objc_msgSend(v3, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(void **)(__currentViewAnimationState + 256);
      if (!v5)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v7 = *(void **)(__currentViewAnimationState + 256);
        *(_QWORD *)(__currentViewAnimationState + 256) = v6;

        v5 = *(void **)(__currentViewAnimationState + 256);
      }
      if (objc_msgSend(v5, "count"))
      {
        v8 = 0;
        while (1)
        {
          objc_msgSend(*(id *)(__currentViewAnimationState + 256), "objectAtIndex:", v8);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (v9 == v10)
          {

            goto LABEL_16;
          }
          if (objc_msgSend(v10, "isDescendantOfView:", v9))
            break;
          if (objc_msgSend(v9, "isDescendantOfView:", v10))
            goto LABEL_14;

          if (++v8 >= (unint64_t)objc_msgSend(*(id *)(__currentViewAnimationState + 256), "count"))
            goto LABEL_11;
        }
        ++v8;
LABEL_14:

      }
      else
      {
LABEL_11:
        v8 = 0;
      }
      objc_msgSend(v10, "setNeedsLayout");
      objc_msgSend(*(id *)(__currentViewAnimationState + 256), "insertObject:atIndex:", v10, v8);
    }
LABEL_16:

    v3 = v10;
  }

}

- (id)_createDeferredAnimationForKey:(id)a3 ignoringKeyFrames:(BOOL)a4
{
  return objc_alloc_init(_UIViewDeferredBasicAnimation);
}

- (id)_deferredAnimationForView:(id)a3 key:(id)a4 ignoringKeyFrames:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSMapTable *viewToDeferredAnimationsMap;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
  if (!viewToDeferredAnimationsMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_viewToDeferredAnimationsMap;
    self->_viewToDeferredAnimationsMap = v11;

    viewToDeferredAnimationsMap = self->_viewToDeferredAnimationsMap;
  }
  -[NSMapTable objectForKey:](viewToDeferredAnimationsMap, "objectForKey:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = (void *)objc_opt_new();
    -[NSMapTable setObject:forKey:](self->_viewToDeferredAnimationsMap, "setObject:forKey:", v13, v8);
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[UIViewAnimationState _createDeferredAnimationForKey:ignoringKeyFrames:](self, "_createDeferredAnimationForKey:ignoringKeyFrames:", v9, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setKey:", v9);
    objc_msgSend(v14, "setDuration:", self->_duration);
    objc_msgSend(v8, "_initialValueForKey:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInitialValue:", v15);

    objc_msgSend(v14, "setRepeatCount:", self->_repeatCount);
    objc_msgSend(v14, "setAutoreverses:", (*((unsigned __int8 *)self + 172) >> 3) & 1);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v9);
  }

  return v14;
}

void __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int8x16_t v15;
  _QWORD v16[4];
  int8x16_t v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;

  v2 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_2;
  v25[3] = &unk_1E16B1B28;
  v26 = *(id *)(a1 + 32);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v25);
  objc_msgSend(*(id *)(a1 + 32), "_layoutEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v5 = *(_QWORD *)(a1 + 48);
  v24 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
  v16[0] = v2;
  v16[1] = 3221225472;
  v16[2] = __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_3;
  v16[3] = &unk_1E16EB1A0;
  v19 = v5;
  v15 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v15.i64[0];
  v17 = vextq_s8(v15, v15, 8uLL);
  v20 = &v21;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v6, "_withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:", v16);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v9 = v22[3];
  if ((unint64_t)(v9 + 1) < *(_QWORD *)(a1 + 56))
    v10 = v9 + 1;
  else
    v10 = *(_QWORD *)(a1 + 56);
  while (v8 < v10)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "objectAtIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setInAnimatedLayout:", 0);
    objc_msgSend(v11, "_layoutEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setInAnimatedLayout:", 0);

    ++v8;
    v14 = v22[3];
    if ((unint64_t)(v14 + 1) < *(_QWORD *)(a1 + 56))
      v10 = v14 + 1;
    else
      v10 = *(_QWORD *)(a1 + 56);
  }
  objc_msgSend(v7, "_setInAnimatedLayout:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v22[3];

  _Block_object_dispose(&v21, 8);
}

uint64_t __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __59__UIViewAnimationState__runConstraintBasedLayoutAnimations__block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  for (i = *(_QWORD *)(a1 + 32); v2 < objc_msgSend(*(id *)(i + 256), "count"); i = *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "objectAtIndex:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isDescendantOfView:", *(_QWORD *)(a1 + 40)))
    {

      break;
    }
    objc_msgSend(v4, "_setNeedsUpdateConstraintsNeedingLayout:", 0);
    objc_msgSend(v4, "_setInAnimatedLayout:", 1);
    objc_msgSend(v4, "_layoutEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setInAnimatedLayout:", 1);

    objc_msgSend(v4, "_flushConstraintsPendingAnimatedChanges");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v2;

    ++v2;
  }
  objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  if (!objc_msgSend(*(id *)(a1 + 48), "_is_needsLayout") || (v7 = *(id *)(a1 + 48)) == 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "_hostsLayoutEngine") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "superview");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        do
        {
          v12 = v9;
          if (v8 == *(void **)(a1 + 48))
            break;
          if (objc_msgSend(v8, "_is_needsLayout"))
          {
            v10 = v8;

            v12 = v10;
          }
          objc_msgSend(v8, "superview");
          v11 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v11;
          v9 = v12;
        }
        while (v11);

        v7 = v12;
      }
    }
  }
  v13 = v7;
  objc_msgSend(*(id *)(a1 + 48), "_setInAnimatedLayout:", 1);
  objc_msgSend(v13, "layoutIfNeeded");

}

- (void)_setCustomCurve:(id)a3
{
  objc_storeStrong((id *)&self->_customCurve, a3);
}

- (void)setAnimationAttributes:(id)a3
{
  -[UIViewAnimationState setAnimationAttributes:skipDelegateAssignment:customCurve:](self, "setAnimationAttributes:skipDelegateAssignment:customCurve:", a3, 0, 0);
}

- (void)_removeLastCompletion
{
  -[NSMutableArray removeLastObject](self->_addedCompletions, "removeLastObject");
}

- (BOOL)_allowsUserInteraction
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->_delegate, "_allowsUserInteraction");
  else
    return 1;
}

- (BOOL)_allowsUserInteractionToCutOffEndOfAnimation
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->_delegate, "_allowsUserInteractionToCutOffEndOfAnimation");
  else
    return 0;
}

- (BOOL)_allowsHitTesting
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->_delegate, "_allowsHitTesting");
  else
    return 0;
}

- (void)_acceptEarlyAnimationCutoff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  UIViewAnimationState *nextState;
  uint64_t j;
  void *v13;
  UIViewAnimationState *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  void *v22;
  id delegate;
  UIViewAnimationState *retainedSelf;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_animationDidStopSent && self->_allowUserInteractionToCutOffEndOfAnimation)
  {
    self->_animationDidStopSent = 1;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend((id)qword_1EDDCA650, "objectForKeyedSubscript:", self->_uuid);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v38 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "_acceptEarlyAnimationCutoff:", v4);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v8);
    }

    if (self->_belongsToTrackingAnimator)
    {
      nextState = self->_nextState;
      if (nextState)
        -[UIViewAnimationState _acceptEarlyAnimationCutoff:](nextState, "_acceptEarlyAnimationCutoff:", v4);
    }
    objc_msgSend((id)qword_1EDDCA650, "objectForKeyedSubscript:", self->_uuid, v4);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v28)
    {
      v27 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = self;
          -[UIViewAnimationState _trackedAnimations](self, "_trackedAnimations");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            do
            {
              for (k = 0; k != v17; ++k)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
                objc_getAssociatedObject(v20, &unk_1EDDCA603);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_getAssociatedObject(v20, &unk_1EDDCA604);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "removeAnimationForKey:", v21);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
            }
            while (v17);
          }

          objc_msgSend(v13, "_incrementDidEndCount");
          self = v14;
        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v28);
    }
    v4 = v25;
    -[UIViewAnimationState sendDelegateAnimationDidStop:finished:](self, "sendDelegateAnimationDidStop:finished:", v25, 1);
    delegate = self->_delegate;
    self->_delegate = 0;

    retainedSelf = self->_retainedSelf;
    if (retainedSelf)
    {
      self->_retainedSelf = 0;

    }
  }

}

- (void)_untrackAnimationsWithIdentifier:(id)a3 keyPath:(id)a4 inLayer:(id)a5 removeFromLayer:(BOOL)a6
{
  void *v6;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char isKindOfClass;
  void *v20;
  int v21;
  char v22;
  uint64_t v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v30 = a6;
  v43 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v10 = a4;
  v32 = a5;
  objc_msgSend((id)qword_1EDDCA650, "objectForKeyedSubscript:", self->_uuid);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(obj);
        v29 = v11;
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v11), "_trackedAnimations", v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v34 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v18, "keyPath");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v20, "isEqualToString:", v10))
                {

LABEL_22:
                  objc_getAssociatedObject(v18, &unk_1EDDCA604);
                  v23 = objc_claimAutoreleasedReturnValue();
                  if ((id)v23 == v32)
                  {
                    objc_getAssociatedObject(v18, &unk_1EDDCA603);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v30)
                      objc_msgSend(v32, "removeAnimationForKey:", v24);
                    objc_setAssociatedObject(v18, &unk_1EDDCA603, 0, (void *)1);
                    objc_setAssociatedObject(v18, &unk_1EDDCA604, 0, (void *)1);
                    objc_msgSend(v31, "addObject:", v18);

                    v6 = v32;
                  }
                  else
                  {
                    v6 = (void *)v23;
                  }
LABEL_27:

                  v6 = v20;
                  continue;
                }
                v6 = v20;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = objc_msgSend(v10, "isEqualToString:", CFSTR("transition"));
                v22 = v21;
                if ((isKindOfClass & 1) == 0)
                {
                  v20 = v6;
                  if (!v21)
                    continue;
                  goto LABEL_22;
                }

                v20 = v6;
                if ((v22 & 1) != 0)
                  goto LABEL_22;
              }
              else
              {
                v20 = v6;
                if ((isKindOfClass & 1) != 0)
                  goto LABEL_27;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v15);
        }

        if (objc_msgSend(v31, "count"))
          objc_msgSend(v13, "removeObjectsInArray:", v31);

        v11 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v28);
  }

}

+ (id)originalAnimationForKeyPath:(id)a3 inLayer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_getAssociatedObject(a4, &unk_1EDDCA601);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldDecomposeGeometricTypes
{
  return (*((unsigned __int8 *)self + 173) >> 1) & 1;
}

- (id)delegate
{
  return self->_delegate;
}

- (BOOL)isInProcess
{
  return 0;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_preferredFrameRateRange.minimum;
  maximum = self->_preferredFrameRateRange.maximum;
  preferred = self->_preferredFrameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (unsigned)updateReason
{
  return self->_updateReason;
}

- (UIViewAnimationState)nextState
{
  return self->_nextState;
}

- (BOOL)disallowInheritance
{
  return self->_disallowInheritance;
}

- (void)setDisallowInheritance:(BOOL)a3
{
  self->_disallowInheritance = a3;
}

@end
