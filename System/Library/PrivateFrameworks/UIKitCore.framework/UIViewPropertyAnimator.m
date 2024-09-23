@implementation UIViewPropertyAnimator

+ (BOOL)_trackingAnimationsCurrentlyEnabled
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "_currentTrackedAnimationsUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)_currentTrackedAnimationsUUID
{
  void *v2;
  void *v3;

  objc_msgSend((id)__trackingAnimatorStates, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __61__UIViewPropertyAnimator__setupAssociatedViewAnimationState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_animationState") == 1 || objc_msgSend(WeakRetained, "_animationState") == 4)
  {
    if (objc_msgSend(WeakRetained, "pausesOnCompletion"))
    {
      objc_msgSend(WeakRetained, "_setPausedOnCompletion:", 1);
      objc_msgSend(WeakRetained, "pauseAnimation");
    }
    else
    {
      objc_msgSend(WeakRetained, "_runCompletions:finished:", objc_msgSend(WeakRetained, "_finishingPosition"), a2);
    }
  }

}

- (BOOL)pausesOnCompletion
{
  return self->_pausesOnCompletion;
}

- (int64_t)_finishingPosition
{
  return self->_finishingPosition;
}

- (unint64_t)_optionsForNestedLegacyAnimation:(unint64_t)a3
{
  unint64_t options;
  _BOOL4 v6;
  uint64_t v7;

  options = self->_options;
  v6 = -[UIViewPropertyAnimator isUserInteractionEnabled](self, "isUserInteractionEnabled");
  if (-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible")
    && -[UIViewPropertyAnimator isUserInteractionEnabled](self, "isUserInteractionEnabled")
    && !-[UIViewPropertyAnimator isManualHitTestingEnabled](self, "isManualHitTestingEnabled"))
  {
    a3 |= 0x1000uLL;
  }
  if (v6)
    v7 = options & 4 | 2;
  else
    v7 = options & 4;
  return a3 | -[UIViewPropertyAnimator shouldLayoutSubviews](self, "shouldLayoutSubviews") | v7;
}

- (BOOL)_pausesOnCompletion
{
  return self->_pausesOnCompletion;
}

- (BOOL)_isStarting
{
  return self->_starting;
}

+ (id)_propertyAnimatorWithUUID:(id)a3
{
  return (id)objc_msgSend((id)__ExtantPropertyAnimators, "objectForKey:", a3);
}

- (void)_setOriginalFromValue:(id)a3 forKey:(id)a4 inLayer:(id)a5
{
  id v8;
  id v9;
  _UICompoundObjectMap *originalFromValueMap;
  _UICompoundObjectMap *v11;
  _UICompoundObjectMap *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  originalFromValueMap = self->_originalFromValueMap;
  if (!originalFromValueMap)
  {
    +[_UICompoundObjectMap compoundObjectMap](_UICompoundObjectMap, "compoundObjectMap");
    v11 = (_UICompoundObjectMap *)objc_claimAutoreleasedReturnValue();
    v12 = self->_originalFromValueMap;
    self->_originalFromValueMap = v11;

    originalFromValueMap = self->_originalFromValueMap;
  }
  -[_UICompoundObjectMap setValue:forObject:andProperty:](originalFromValueMap, "setValue:forObject:andProperty:", v13, v9, v8);

}

- (int64_t)state
{
  unint64_t v3;

  v3 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
  if (v3 < 5 && ((0x1Bu >> v3) & 1) != 0)
    return qword_186678528[v3];
  else
    return -[UIViewPropertyAnimator _animationState](self, "_animationState");
}

- (BOOL)_addedPacingAnimation
{
  return self->_addedPacingAnimation;
}

- (void)_setOriginalToValue:(id)a3 forKey:(id)a4 inLayer:(id)a5
{
  id v8;
  id v9;
  _UICompoundObjectMap *originalToValueMap;
  _UICompoundObjectMap *v11;
  _UICompoundObjectMap *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  originalToValueMap = self->_originalToValueMap;
  if (!originalToValueMap)
  {
    +[_UICompoundObjectMap compoundObjectMap](_UICompoundObjectMap, "compoundObjectMap");
    v11 = (_UICompoundObjectMap *)objc_claimAutoreleasedReturnValue();
    v12 = self->_originalToValueMap;
    self->_originalToValueMap = v11;

    originalToValueMap = self->_originalToValueMap;
  }
  -[_UICompoundObjectMap setValue:forObject:andProperty:](originalToValueMap, "setValue:forObject:andProperty:", v13, v9, v8);

}

- (BOOL)isIntrospectable
{
  return self->_introspectable;
}

- (id)_previousAnimatorForKeyPath:(id)a3 inLayer:(id)a4 compoundKeys:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  UIViewPropertyAnimator *v16;
  UIViewPropertyAnimator *v17;
  void *v18;
  void *v19;
  void *v20;
  UIViewPropertyAnimator *v21;
  void *v22;
  void **v23;
  id v24;
  void *v25;
  id *location;
  void *v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "hasPrefix:", CFSTR("bounds")) & 1) != 0
    || (objc_msgSend(v8, "hasPrefix:", CFSTR("contentsRect")) & 1) != 0
    || objc_msgSend(v8, "hasPrefix:", CFSTR("contentsCenter")))
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(".origin"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(".size"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)__ExtantPropertyAnimators;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    location = a5;
    v12 = *(_QWORD *)v32;
    if (v29)
      v13 = v28 == 0;
    else
      v13 = 1;
    v14 = !v13;
LABEL_12:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(obj);
      objc_msgSend((id)__ExtantPropertyAnimators, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v15), location);
      v16 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 != self)
      {
        -[UIViewPropertyAnimator _originalFromValueForKey:inLayer:](v16, "_originalFromValueForKey:inLayer:", v8, v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v22 = v8;
          v23 = location;
          goto LABEL_26;
        }
        if (v14)
        {
          -[UIViewPropertyAnimator _originalFromValueForKey:inLayer:](v17, "_originalFromValueForKey:inLayer:", v29, v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {

LABEL_25:
            objc_storeStrong(location, v29);
            v23 = location + 1;
            v22 = v28;
LABEL_26:
            v24 = v22;
            v25 = *v23;
            *v23 = v24;

            v21 = v17;
            goto LABEL_27;
          }
          -[UIViewPropertyAnimator _originalFromValueForKey:inLayer:](v17, "_originalFromValueForKey:inLayer:", v28, v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            goto LABEL_25;
        }
      }

      if (v11 == ++v15)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v11)
          goto LABEL_12;
        break;
      }
    }
  }
  v21 = 0;
LABEL_27:

  return v21;
}

- (id)_originalFromValueForKey:(id)a3 inLayer:(id)a4
{
  return -[_UICompoundObjectMap valueForObject:andProperty:](self->_originalFromValueMap, "valueForObject:andProperty:", a4, a3);
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (void)_setAddedPacingAnimation:(BOOL)a3 animationKey:(id)a4
{
  self->_addedPacingAnimation = a3;
  objc_storeStrong((id *)&self->_pacingAnimationKey, a4);
}

- (BOOL)_generatePointValueSpringAnimationsForKeyPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  -[UITimingCurveProvider springTimingParameters](self->_timingParameters, "springTimingParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v4, "isEqualToString:", CFSTR("position")))
  {
    objc_msgSend(v5, "initialVelocity");
    v8 = v7 != v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setAdditiveOffset:(double)a3 forKey:(id)a4 inLayer:(id)a5
{
  id v8;
  _UICompoundObjectMap *additiveOffsetsForAnimationKeysMap;
  _UICompoundObjectMap *v10;
  _UICompoundObjectMap *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  if (a3 >= 0.0)
  {
    additiveOffsetsForAnimationKeysMap = self->_additiveOffsetsForAnimationKeysMap;
    if (!additiveOffsetsForAnimationKeysMap)
    {
      +[_UICompoundObjectMap compoundObjectMap](_UICompoundObjectMap, "compoundObjectMap");
      v10 = (_UICompoundObjectMap *)objc_claimAutoreleasedReturnValue();
      v11 = self->_additiveOffsetsForAnimationKeysMap;
      self->_additiveOffsetsForAnimationKeysMap = v10;

      additiveOffsetsForAnimationKeysMap = self->_additiveOffsetsForAnimationKeysMap;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICompoundObjectMap setValue:forObject:andProperty:](additiveOffsetsForAnimationKeysMap, "setValue:forObject:andProperty:", v12, v8, v13);

  }
}

- (BOOL)isRunning
{
  return self->_running;
}

- (NSTimeInterval)duration
{
  return self->_baseDuration;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  UITimingCurveProvider *timingParameters;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v29;
  double v30;

  timingParameters = self->_timingParameters;
  v6 = a4;
  -[UITimingCurveProvider springTimingParameters](timingParameters, "springTimingParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "initialVelocity");
  v9 = v8;
  if (!-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible")
    && -[UITimingCurveProvider timingCurveType](self->_timingParameters, "timingCurveType") == 3
    && (-[UITimingCurveProvider cubicTimingParameters](self->_timingParameters, "cubicTimingParameters"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    mediaTimingFunctionForTimingProvider(self->_timingParameters);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v30 = 0.0;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
  v15 = v14;
  +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (double *)v16;
  if (*(double *)(v16 + 48) > 0.0)
    v15 = *(double *)(v16 + 40);
  if ((objc_msgSend(v7, "implicitDuration") & 1) != 0)
  {
    if (v17[6] > 0.0)
    {
      objc_msgSend(v7, "dampingRatio");
      v19 = v18;
      objc_msgSend(v7, "mass");
      +[UIViewSpringAnimationState computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:](UIViewSpringAnimationState, "computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:", &v30, &v29, v15, v19, v20, v9, 0.001);
    }
    objc_msgSend(v7, "mass");
    v22 = v21;
    objc_msgSend(v7, "stiffness");
    v30 = v23;
    objc_msgSend(v7, "damping");
  }
  else
  {
    objc_msgSend(v7, "dampingRatio");
    v22 = 1.0;
    +[UIViewSpringAnimationState computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:](UIViewSpringAnimationState, "computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:", &v30, &v29, v15, v25, 1.0, v9, 0.001);
    v24 = v29;
  }
  v29 = fmax(fabs(v24), 0.0);
  v30 = fmax(fabs(v30), 0.01);
  objc_msgSend(v13, "setTimingFunction:", v12, *(_QWORD *)&v29);
  objc_msgSend(v13, "setMass:", v22);
  objc_msgSend(v13, "setStiffness:", v30);
  objc_msgSend(v13, "setDamping:", v29);
  objc_msgSend(v13, "setVelocity:", v9);
  objc_msgSend(v13, "speed");
  v27 = v26 / self->_drag;
  *(float *)&v27 = v27;
  objc_msgSend(v13, "setSpeed:", v27);

  return v13;
}

- (void)_setTimingParameters:(id)a3
{
  id v4;
  UITimingCurveProvider *v5;
  UITimingCurveProvider *timingParameters;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (UITimingCurveProvider *)objc_msgSend(v4, "copyWithZone:", 0);
  timingParameters = self->_timingParameters;
  self->_timingParameters = v5;

  v11 = v4;
  if (v11)
  {
    if (objc_msgSend(v11, "timingCurveType") == 2)
    {

    }
    else
    {
      v7 = objc_msgSend(v11, "timingCurveType");

      if (v7 != 3)
        goto LABEL_7;
    }
    objc_msgSend(v11, "springTimingParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "implicitDuration");

    if (v9)
    {
      objc_msgSend(v11, "springTimingParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "settlingDuration");
      -[UIViewPropertyAnimator setUnitDuration:](self, "setUnitDuration:");

      self->_internalDuration = self->_baseDuration;
    }
  }
LABEL_7:

}

- (void)_setupAnimationTracking:(id)a3
{
  void (**v4)(_QWORD);
  NSUUID *v5;
  NSUUID *trackingIdentifier;
  id v7;

  v4 = (void (**)(_QWORD))a3;
  +[UIView _startAnimationTracking](UIView, "_startAnimationTracking");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  trackingIdentifier = self->_trackingIdentifier;
  self->_trackingIdentifier = v5;

  objc_msgSend((id)objc_opt_class(), "_saveReferenceToPropertyAnimator:", self);
  v4[2](v4);

  +[UIView _finishAnimationTracking](UIView, "_finishAnimationTracking");
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    -[UIViewPropertyAnimator timingFunctionForPause](self, "timingFunctionForPause");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _pauseAnimation:fromStart:](self, "_pauseAnimation:fromStart:", v7, 1);

  }
}

void __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD *);
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_viewAnimationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_3;
  v6[3] = &unk_1E16B1B50;
  v3 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v4 = *(void (**)(uint64_t, _QWORD *))(v3 + 16);
  v5 = v2;
  v4(v3, v6);

}

void __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  void (*v4)(void);
  _QWORD *v5;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "_viewAnimationState");
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_performWithCompletionCallbacksDisabledOnPop:", v3);

  }
  else
  {
    v4 = (void (*)(void))a2[2];
    v5 = a2;
    v4();
  }

}

uint64_t __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_viewAnimationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushWithViewAnimationID:context:", 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "_setupAssociatedViewAnimationState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_runAnimations");
  return +[UIViewAnimationState popAnimationState](UIViewAnimationState, "popAnimationState");
}

- (void)_setupAssociatedViewAnimationState:(id)a3
{
  id v4;
  void *v5;
  unint64_t options;
  UITimingCurveProvider *v7;
  UITimingCurveProvider *v8;
  uint64_t v9;
  uint64_t v10;
  UITimingCurveProvider *v11;
  UITimingCurveProvider *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  UITimingCurveProvider *v18;
  UITimingCurveProvider *v19;
  uint64_t v20;
  UIViewPropertyAnimator *v21;
  UIViewPropertyAnimator *v22;
  double v23;
  double v24;
  double delay;
  _QWORD v26[4];
  id v27;
  id location;

  v4 = a3;
  -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (!self->_optionsAreExplicit)
  {
    if (-[UIViewPropertyAnimator isUserInteractionEnabled](self, "isUserInteractionEnabled"))
      v10 = 614;
    else
      v10 = 612;
    if (-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible")
      && -[UIViewPropertyAnimator isUserInteractionEnabled](self, "isUserInteractionEnabled")
      && !-[UIViewPropertyAnimator isManualHitTestingEnabled](self, "isManualHitTestingEnabled"))
    {
      v10 |= 0x1000uLL;
    }
    v11 = self->_timingParameters;
    if (!v11)
      goto LABEL_22;
    v12 = v11;
    if (-[UITimingCurveProvider timingCurveType](v11, "timingCurveType"))
    {
      v13 = -[UITimingCurveProvider timingCurveType](v12, "timingCurveType");

      if (v13 != 3)
        goto LABEL_22;
    }
    else
    {

    }
    -[UITimingCurveProvider cubicTimingParameters](self->_timingParameters, "cubicTimingParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 |= objc_msgSend(v15, "animationCurve") << 16;

LABEL_22:
    v16 = -[UIViewPropertyAnimator shouldLayoutSubviews](self, "shouldLayoutSubviews");
    if (-[UIViewPropertyAnimator _shouldBeginFromCurrentState](self, "_shouldBeginFromCurrentState"))
      options = v10 | v16;
    else
      options = (v10 | v16) & 0xFFFFFFFFFFFFFFFBLL;
    self->_options = options;
    goto LABEL_26;
  }
  options = self->_options;
  self->_userInteractionEnabled = (options & 2) != 0;
  v7 = self->_timingParameters;
  if (v7)
  {
    v8 = v7;
    if (-[UITimingCurveProvider timingCurveType](v7, "timingCurveType"))
    {
      v9 = -[UITimingCurveProvider timingCurveType](v8, "timingCurveType");

      if (v9 != 3)
        goto LABEL_19;
    }
    else
    {

    }
    -[UITimingCurveProvider cubicTimingParameters](self->_timingParameters, "cubicTimingParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setAnimationCurve:", (options >> 16) & 7);

  }
LABEL_19:
  self->_shouldLayoutSubviews = options & 1;
LABEL_26:
  if (-[UITimingCurveProvider timingCurveType](self->_timingParameters, "timingCurveType") == 1)
  {
    mediaTimingFunctionForTimingProvider(self->_timingParameters);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setCustomCurve:", v17);
    options |= 0x60000uLL;

  }
  v18 = self->_timingParameters;
  if (!v18)
    goto LABEL_33;
  v19 = v18;
  if (-[UITimingCurveProvider timingCurveType](v18, "timingCurveType") != 2)
  {
    v20 = -[UITimingCurveProvider timingCurveType](v19, "timingCurveType");

    if (v20 == 3)
      goto LABEL_32;
LABEL_33:
    v21 = 0;
    goto LABEL_34;
  }

LABEL_32:
  v21 = self;
LABEL_34:
  v22 = v21;
  -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
  v24 = v23;
  delay = self->_delay;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__UIViewPropertyAnimator__setupAssociatedViewAnimationState___block_invoke;
  v26[3] = &unk_1E16B44C0;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v5, "setupWithDuration:delay:view:options:factory:parentState:start:completion:", 0, options, v22, v4, 0, v26, v24, delay);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
}

- (UIViewAnimationState)_viewAnimationState
{
  return self->_viewAnimationState;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (double)internalDuration
{
  return self->_internalDuration;
}

- (BOOL)shouldLayoutSubviews
{
  return self->_shouldLayoutSubviews;
}

- (BOOL)isManualHitTestingEnabled
{
  return self->_manualHitTestingEnabled;
}

- (void)_clearAnimationState
{
  UIViewPropertyAnimatorTrackingState *trackingState;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  UIViewAnimationState *viewAnimationState;
  id v9;

  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  trackingState = self->_trackingState;
  if (trackingState)
  {
    v4 = (void *)objc_opt_class();
    -[UIViewPropertyAnimatorTrackingState uuid](self->_trackingState, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_removeTrackingAnimator:forUUID:andDescription:", self, v5, self->_trackingDescription);

    trackingState = self->_trackingState;
  }
  self->_trackingState = 0;

  +[UIView _disableAnimationTracking:](UIView, "_disableAnimationTracking:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_outerAnimator);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("running"));
    objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("state"));
    objc_msgSend(v7, "removeObserver:forKeyPath:", self, CFSTR("reversed"));
    +[UIViewPropertyAnimator removeObserved:forObservingAnimatorWithId:](UIViewPropertyAnimator, "removeObserved:forObservingAnimatorWithId:", v7, v9);
    objc_storeWeak((id *)&self->_outerAnimator, 0);
  }
  objc_storeWeak((id *)&self->_viewAnimationState->_propertyAnimator, 0);
  -[UIViewPropertyAnimator _setCompletions:](self, "_setCompletions:", 0);
  -[UIViewPropertyAnimator _setFinishingPosition:](self, "_setFinishingPosition:", 0);
  viewAnimationState = self->_viewAnimationState;
  self->_viewAnimationState = 0;

  -[_UICompoundObjectMap removeAllMappings](self->_originalToValueMap, "removeAllMappings");
  -[_UICompoundObjectMap removeAllMappings](self->_originalFromValueMap, "removeAllMappings");
  -[_UICompoundObjectMap removeAllMappings](self->_additiveOffsetsForAnimationKeysMap, "removeAllMappings");
  -[_UICompoundObjectMap removeAllMappings](self->_continuedWithSpringForAnimationKeyMap, "removeAllMappings");
  self->_drag = 1.0;
  self->_fractionComplete = 0.0;
  self->_hasFinalized = 0;
  -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", 0);
  -[UIViewPropertyAnimator _setKVOCompliantReversed:](self, "_setKVOCompliantReversed:", 0);
  -[UIViewPropertyAnimator _setKVOCompliantState:](self, "_setKVOCompliantState:", 0);
  objc_msgSend((id)objc_opt_class(), "_removeReferenceToPropertyAnimatorWithTrackingIdentifier:", v9);

}

- (void)_setupWithDuration:(double)a3 timingParameters:(id)a4 animations:(id)a5
{
  id v8;
  void *v9;
  double v10;
  NSString *pacingAnimationKey;
  void *v12;
  id v13;

  v13 = a5;
  self->_pausedOnCompletion = 0;
  self->_pausesOnCompletion = 0;
  self->_scrubsLinearly = 1;
  v8 = a4;
  -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 0);
  -[UIViewPropertyAnimator _setFinishingPosition:](self, "_setFinishingPosition:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator setAnimationDescriptionMap:](self, "setAnimationDescriptionMap:", v9);

  self->_hasFinalized = 0;
  *(_WORD *)&self->_userInteractionEnabled = 1;
  v10 = 0.2;
  if (a3 != 0.0)
    v10 = a3;
  self->_baseDuration = v10;
  self->_internalDuration = v10;
  self->_options = 0;
  self->_optionsAreExplicit = 0;
  self->_drag = UIAnimationDragCoefficient();
  *(_WORD *)&self->_running = 0;
  self->_addedPacingAnimation = 0;
  pacingAnimationKey = self->_pacingAnimationKey;
  self->_pacingAnimationKey = 0;

  self->_fractionComplete = 0.0;
  -[UIViewPropertyAnimator _setTimingParameters:](self, "_setTimingParameters:", v8);

  v12 = v13;
  self->_interruptible = 1;
  *(_WORD *)&self->_shouldLayoutSubviews = 1;
  self->_shouldBeginFromCurrentState = 1;
  if (v13)
  {
    -[UIViewPropertyAnimator addAnimations:](self, "addAnimations:", v13);
    v12 = v13;
  }

}

- (void)_setFinishingPosition:(int64_t)a3
{
  self->_finishingPosition = a3;
}

- (void)setAnimationDescriptionMap:(id)a3
{
  objc_storeStrong((id *)&self->_animationDescriptionMap, a3);
}

- (void)startAnimationAsPaused:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void (**v13)(_QWORD);
  _BOOL4 v14;
  void *v15;
  void *v16;
  void (*v17)(_QWORD *, _QWORD *);
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  UIViewPropertyAnimator *v28;
  id v29;
  _QWORD aBlock[5];
  BOOL v31;

  v3 = a3;
  if (a3 && !-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 3482, CFSTR("An animator (%@) can be only started in the paused state if it is interruptible!"), self);

  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState"))
    v6 = 0;
  else
    v6 = v3;
  objc_msgSend((id)objc_opt_class(), "_currentPropertyAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator clearAnimationDescriptions](self, "clearAnimationDescriptions");
  v8 = (void *)objc_opt_new();
  -[UIViewPropertyAnimator _setViewAnimationState:](self, "_setViewAnimationState:", v8);

  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke;
  aBlock[3] = &unk_1E16B46A8;
  v31 = v6;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_2;
  v26[3] = &unk_1E16B46D0;
  v11 = v7;
  v27 = v11;
  v12 = v10;
  v28 = self;
  v29 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(v26);
  -[UIViewPropertyAnimator _setKVOCompliantState:fromState:](self, "_setKVOCompliantState:fromState:", 1, 0);
  if (!v3
    && (-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible")
     || objc_msgSend(v11, "isRunning")))
  {
    -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", 1);
  }
  if (v11 && !-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"))
    -[UIViewPropertyAnimator _setKVOCompliantReversed:](self, "_setKVOCompliantReversed:", objc_msgSend(v11, "isReversed"));
  if (v3)
    -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 4);
  -[UIViewPropertyAnimator _setStarting:](self, "_setStarting:", 1);
  v14 = -[UIViewPropertyAnimator isInterruptible](self, "isInterruptible");
  if (!v11)
  {
    if (v14)
    {
      -[UIViewPropertyAnimator _setupAnimationTracking:](self, "_setupAnimationTracking:", v13);
      if (!v3)
        goto LABEL_24;
LABEL_28:
      -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewPropertyAnimator _setStarting:](self, "_setStarting:", objc_msgSend(v22, "_didEndCount") == 0);

      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _setTrackingIdentifier:](self, "_setTrackingIdentifier:", v21);

LABEL_27:
    objc_msgSend((id)objc_opt_class(), "_saveReferenceToPropertyAnimator:", self);
    v13[2](v13);
    if (!v3)
      goto LABEL_24;
    goto LABEL_28;
  }
  if (!v14)
  {
    objc_storeWeak((id *)&self->_outerAnimator, v11);
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("running"), 1, 0);
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 1, 0);
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("reversed"), 1, 0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _setTrackingIdentifier:](self, "_setTrackingIdentifier:", v20);

    +[UIViewPropertyAnimator animator:isObserving:](UIViewPropertyAnimator, "animator:isObserving:", self, v11);
    goto LABEL_27;
  }
  +[UIView _enableAnimationTracking:](UIView, "_enableAnimationTracking:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator _setTrackingIdentifier:](self, "_setTrackingIdentifier:", v15);
  objc_msgSend((id)objc_opt_class(), "_saveReferenceToPropertyAnimator:", self);
  -[UIViewPropertyAnimator _setupAssociatedViewAnimationState:](self, "_setupAssociatedViewAnimationState:", v16);
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_4;
  v24[3] = &unk_1E16B1B50;
  v24[4] = self;
  v25 = v15;
  v17 = (void (*)(_QWORD *, _QWORD *))v12[2];
  v18 = v15;
  v17(v12, v24);
  if (v3)
  {
    -[UIViewPropertyAnimator timingFunctionForPause](self, "timingFunctionForPause");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _pauseAnimation:fromStart:](self, "_pauseAnimation:fromStart:", v19, 1);

  }
  if (v3)
    goto LABEL_28;
LABEL_24:
  -[UIViewPropertyAnimator _setStarting:](self, "_setStarting:", 0);
LABEL_29:

}

- (BOOL)isInterruptible
{
  return self->_interruptible;
}

- (void)_setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (void)_setKVOCompliantRunning:(BOOL)a3
{
  if (self->_running != a3)
  {
    -[UIViewPropertyAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("running"));
    self->_running = a3;
    -[UIViewPropertyAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("running"));
  }
}

- (void)clearAnimationDescriptions
{
  id v2;

  -[UIViewPropertyAnimator _animationDescriptionMap](self, "_animationDescriptionMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)_setViewAnimationState:(id)a3
{
  id *v5;

  objc_storeStrong((id *)&self->_viewAnimationState, a3);
  v5 = (id *)a3;
  objc_storeWeak(v5 + 34, self);

}

- (NSMutableDictionary)_animationDescriptionMap
{
  return self->_animationDescriptionMap;
}

+ (id)_currentPropertyAnimator
{
  void *v2;
  void *v3;

  +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_outerPropertyAnimator:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setKVOCompliantState:(int64_t)a3
{
  -[UIViewPropertyAnimator _setKVOCompliantState:fromState:](self, "_setKVOCompliantState:fromState:", a3, -[UIViewPropertyAnimator _animationState](self, "_animationState"));
}

- (void)_setKVOCompliantReversed:(BOOL)a3
{
  if (self->_reversed != a3)
  {
    -[UIViewPropertyAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reversed"));
    self->_reversed = a3;
    -[UIViewPropertyAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reversed"));
  }
}

- (void)_executeCompletionHandlerWithFinalPosition:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIViewPropertyAnimator _completions](self, "_completions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 = _Block_copy(*(const void **)(*((_QWORD *)&v11 + 1) + 8 * v9));

        (*((void (**)(void *, int64_t))v7 + 2))(v7, a3);
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);

  }
}

- (void)addCompletion:(void *)completion
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = completion;
  -[UIViewPropertyAnimator _completions](self, "_completions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[UIViewPropertyAnimator _setCompletions:](self, "_setCompletions:", v6);

  }
  -[UIViewPropertyAnimator _completions](self, "_completions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = _Block_copy(v4);

  objc_msgSend(v8, "addObject:", v7);
}

- (NSMutableArray)_completions
{
  return self->_completions;
}

- (void)_setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

+ (void)_removeReferenceToPropertyAnimatorWithTrackingIdentifier:(id)a3
{
  void *v3;

  objc_msgSend((id)__ExtantPropertyAnimators, "removeObjectForKey:", a3);
  if (!objc_msgSend((id)__ExtantPropertyAnimators, "count"))
  {
    v3 = (void *)__ExtantPropertyAnimators;
    __ExtantPropertyAnimators = 0;

  }
}

- (void)_runCompletions:(int64_t)a3 finished:(BOOL)a4
{
  int64_t v6;

  -[UIViewPropertyAnimator finalizeStoppedAnimationWithPosition:](self, "finalizeStoppedAnimationWithPosition:", a3, a4);
  v6 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") != 2)
    -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 5);
  -[UIViewPropertyAnimator _executeCompletionHandlerWithFinalPosition:](self, "_executeCompletionHandlerWithFinalPosition:", a3);
  -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", v6);
  -[UIViewPropertyAnimator _clearAnimationState](self, "_clearAnimationState");
}

- (void)addAnimations:(id)a3 delayFactor:(double)a4 durationFactor:(double)a5
{
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, __n128, __n128);
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __n128 v25;
  __n128 v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __n128 v37;
  __n128 v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;
  _QWORD aBlock[5];
  id v59;
  double v60;

  v9 = a3;
  if (!v9)
  {
    v46 = (void *)MEMORY[0x1E0C99DA0];
    v47 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "raise:format:", v47, CFSTR("%@ requires a non nil animation arg!"), v48);

  }
  if (a5 < 0.0)
  {
    v49 = (void *)MEMORY[0x1E0C99DA0];
    v50 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "raise:format:", v50, CFSTR("%@ requires a durationFactor greater than or equal to zero!"), v51);

  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 2217, CFSTR("Attempt to add an animation to an animator %@ that is in a stopped state"), self);

  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 2218, CFSTR("Attempt to add an animation to an animator %@ as it is completing"), self);

  }
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke;
  aBlock[3] = &unk_1E16B44E8;
  aBlock[4] = self;
  v60 = a4;
  v11 = v9;
  v59 = v11;
  v12 = (void (**)(_QWORD, __n128, __n128))_Block_copy(aBlock);
  if (-[UIViewPropertyAnimator _isActive](self, "_isActive"))
  {
    if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
    {
      if (-[UIViewPropertyAnimator _isStarting](self, "_isStarting")
        && (-[UIViewPropertyAnimator fractionComplete](self, "fractionComplete"), v13 == 0.0))
      {
        -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
        v17 = (1.0 - a4) * v16;
        -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
        v19 = v18 * a4;
        v56[0] = v10;
        v56[1] = 3221225472;
        v56[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_4;
        v56[3] = &unk_1E16B1BF8;
        v57 = v11;
        +[UIView _performWithState:trackingIdentifier:duration:delay:animations:](UIView, "_performWithState:trackingIdentifier:duration:delay:animations:", v14, v15, v56, v17, v19);

        -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = objc_msgSend(v20, "_didEndCount");

        if ((int)v14 >= 1)
        {
          -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 1);
          -[UIViewPropertyAnimator _setStarting:](self, "_setStarting:", 0);
          if (-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"))
            -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", 1);
        }

      }
      else
      {
        -[UIViewPropertyAnimator fractionComplete](self, "fractionComplete");
        v34 = v33;
        -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
        v36 = (1.0 - v34) * v35;
        -[UIViewPropertyAnimator delay](self, "delay");
        v39 = 0.0;
        if (v37.n128_f64[0] > 0.0 && v34 == 0.0)
        {
          -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "_elapsedTimeForCanonicallyTrackedAnimation");
          v42 = v41;

          v37.n128_u64[0] = -1.0;
          v38.n128_u64[0] = 0;
          if (v42 < 0.0)
            v38.n128_f64[0] = -v42;
          if (v42 == -1.0)
            v39 = -1.0;
          else
            v39 = v38.n128_f64[0];
        }
        v12[2](v12, v37, v38);
        -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v10;
        v55[1] = 3221225472;
        v55[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_5;
        v55[3] = &unk_1E16B1B28;
        v55[4] = self;
        +[UIView _performWithState:trackingIdentifier:duration:delay:animations:](UIView, "_performWithState:trackingIdentifier:duration:delay:animations:", v43, v44, v55, v36, v39);

        -[UIViewPropertyAnimator timingFunctionForPause](self, "timingFunctionForPause");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewPropertyAnimator _pauseAnimation:fromStart:minimizingStateModifications:](self, "_pauseAnimation:fromStart:minimizingStateModifications:", v45, 1, 1);

        -[UIViewPropertyAnimator _updateAnimationsToFractionComplete:](self, "_updateAnimationsToFractionComplete:", v34);
      }
    }
    else if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 1)
    {
      -[UIViewPropertyAnimator fractionComplete](self, "fractionComplete");
      v22 = v21;
      -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
      v24 = (1.0 - v22) * v23;
      -[UIViewPropertyAnimator delay](self, "delay");
      v27 = 0.0;
      if (v25.n128_f64[0] > 0.0 && v22 == 0.0)
      {
        -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_elapsedTimeForCanonicallyTrackedAnimation");
        v30 = v29;

        v25.n128_u64[0] = -1.0;
        v26.n128_u64[0] = 0;
        if (v30 < 0.0)
          v26.n128_f64[0] = -v30;
        if (v30 == -1.0)
          v27 = -1.0;
        else
          v27 = v26.n128_f64[0];
      }
      v12[2](v12, v25, v26);
      -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v10;
      v54[1] = 3221225472;
      v54[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_6;
      v54[3] = &unk_1E16B1B28;
      v54[4] = self;
      +[UIView _performWithState:trackingIdentifier:duration:delay:animations:](UIView, "_performWithState:trackingIdentifier:duration:delay:animations:", v31, v32, v54, v24, v27);

    }
  }
  else
  {
    ((void (*)(void (**)(_QWORD, __n128, __n128)))v12[2])(v12);
    -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 3);
  }

}

- (BOOL)_isActive
{
  int64_t v3;

  v3 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
  if (v3)
    LOBYTE(v3) = -[UIViewPropertyAnimator _animationState](self, "_animationState") != 3;
  return v3;
}

- (void)_setKVOCompliantState:(int64_t)a3 fromState:(int64_t)a4
{
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") != a3)
  {
    if (-[UIViewPropertyAnimator _animationState](self, "_animationState") != a4)
      -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", a4);
    -[UIViewPropertyAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
    -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", a3);
    -[UIViewPropertyAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
  }
}

- (int64_t)_animationState
{
  return self->_animationState;
}

- (void)_setAnimationState:(int64_t)a3
{
  void *v5;

  self->_animationState = a3;
  v5 = (void *)objc_opt_class();
  if (a3 == 1)
    objc_msgSend(v5, "_saveReferenceToActivePropertyAnimator:", self);
  else
    objc_msgSend(v5, "_removeReferenceToActivePropertyAnimator:", self);
}

+ (void)_removeReferenceToActivePropertyAnimator:(id)a3
{
  void *v3;

  objc_msgSend((id)__ActivePropertyAnimators, "removeObject:", a3);
  if (!objc_msgSend((id)__ActivePropertyAnimators, "count"))
  {
    v3 = (void *)__ActivePropertyAnimators;
    __ActivePropertyAnimators = 0;

  }
}

+ (void)_saveReferenceToActivePropertyAnimator:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)__ActivePropertyAnimators;
  v7 = v3;
  if (!__ActivePropertyAnimators)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)__ActivePropertyAnimators;
    __ActivePropertyAnimators = (uint64_t)v5;

    v3 = v7;
    v4 = (void *)__ActivePropertyAnimators;
  }
  objc_msgSend(v4, "addObject:", v3);

}

- (void)_runAnimations
{
  void *v3;
  id v4;
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
  -[UIViewPropertyAnimator _animations](self, "_animations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator _setAnimations:](self, "_setAnimations:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD aBlock[5];
  id v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "_animations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "_setAnimations:", v4);

  }
  v5 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_animations");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5 > 0.0 && v5 < 1.0;
  v11 = (id)v6;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_2;
    aBlock[3] = &unk_1E16B44E8;
    v14 = *(_QWORD *)(a1 + 48);
    v9 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v13 = v9;
    v10 = _Block_copy(aBlock);
    objc_msgSend(v11, "addObject:", v10);

  }
  else
  {
    v8 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v11, "addObject:", v8);

  }
}

- (NSMutableArray)_animations
{
  return self->_animations;
}

- (void)_setAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_animations, a3);
}

- (void)finalizeStoppedAnimationWithPosition:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD aBlock[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 1
    || -[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    v5 = -[UIViewPropertyAnimator isReversed](self, "isReversed");
    -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v6;
    if (v5)
      +[UIView _updateModelValuesForAnimationWithUUID:useInitialValues:animatable:stateBlock:animationBlock:](UIView, "_updateModelValuesForAnimationWithUUID:useInitialValues:animatable:stateBlock:animationBlock:", v6, 1, 0, 0, &__block_literal_global_494, v6);
    else
      +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v6, &__block_literal_global_495);

  }
  else if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 2)
  {
    +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _setFinishingPosition:](self, "_setFinishingPosition:", a3);
    self->_hasFinalized = 1;
    if (a3 == 2)
    {
      -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_3;
      v26[3] = &unk_1E16B4658;
      v12 = v8;
      v27 = v12;
      v13 = v9;
      v28 = v13;
      +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v10, v26);

      aBlock[0] = v11;
      aBlock[1] = 3221225472;
      aBlock[2] = __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_4;
      aBlock[3] = &unk_1E16B1B50;
      v14 = v13;
      v24 = v14;
      v15 = v12;
      v25 = v15;
      v16 = (void (**)(_QWORD))_Block_copy(aBlock);
      v17 = v16;
      if (v7)
      {
        v21[0] = v11;
        v21[1] = 3221225472;
        v21[2] = __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_5;
        v21[3] = &unk_1E16B1BA0;
        v22 = v16;
        objc_msgSend(v7, "_addCompletion:", v21);

      }
      else
      {
        v16[2](v16);
      }

    }
    else
    {
      -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIView _finalizeStoppedAnimationWithUUID:reverseAnimation:state:performCompletionsImmediately:](UIView, "_finalizeStoppedAnimationWithUUID:reverseAnimation:state:performCompletionsImmediately:", v18, a3 != 0, v7, 1);

      if (!+[UIViewController _shouldDeferTransitions](UIViewController, "_shouldDeferTransitions"))
      {
        -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sendDelegateDidStopManually:", a3 == 0);

      }
    }

  }
}

- (BOOL)isReversed
{
  return self->_reversed;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  unint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  _BOOL4 hasFinalized;
  BOOL v18;
  BOOL v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  NSObject *v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewPropertyAnimator observedsOfAnimatorWithTrackingId:](UIViewPropertyAnimator, "observedsOfAnimatorWithTrackingId:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("running"));
          objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("state"));
          objc_msgSend(v10, "removeObserver:forKeyPath:", self, CFSTR("reversed"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_opt_class();
    -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllObservedForObservingAnimatorWithId:", v12);

  }
  if (dyld_program_sdk_at_least() && -[UIViewPropertyAnimator _isActive](self, "_isActive"))
  {
    v13 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
    if (os_variant_has_internal_diagnostics())
    {
      if (v13 != 2 && v13 != 4)
      {
        __UIFaultDebugAssertLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          v36 = v13;
          _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "Animation state expected to be in paused or stopped state when deallocating while Active. Actual state %i", buf, 8u);
        }

      }
    }
    else if (v13 != 2 && v13 != 4)
    {
      v14 = dealloc___s_category_0;
      if (!dealloc___s_category_0)
      {
        v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&dealloc___s_category_0);
      }
      v15 = *(NSObject **)(v14 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v36 = v13;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Animation state expected to be in paused or stopped state when deallocating while Active. Actual state %i", buf, 8u);
      }
    }
    v16 = -[UIViewPropertyAnimator _isStarting](self, "_isStarting");
    hasFinalized = self->_hasFinalized;
    v18 = v13 == 4 && v16;
    v19 = v13 != 2 || !hasFinalized;
    if (v19 && !v18)
    {
      v20 = v16;
      v21 = -[UIViewPropertyAnimator _isPausedOnCompletion](self, "_isPausedOnCompletion");
      v22 = (void *)MEMORY[0x1E0C99DA0];
      v23 = *MEMORY[0x1E0C99768];
      -[UIViewPropertyAnimator _animationStateAsString](self, "_animationStateAsString");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = CFSTR("NO");
      if (v20)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      if (hasFinalized)
        v26 = CFSTR("YES");
      if (v21)
        v28 = CFSTR("It is an error to release a property animator that has paused on completion. Property animators must either finish animating or be explicitly stopped and finished before they can be released. (animationState = %@, isStarting = %@, hasFinalized = %@, name = %@)");
      else
        v28 = CFSTR("It is an error to release a paused or stopped property animator. Property animators must either finish animating or be explicitly stopped and finished before they can be released. (animationState = %@, isStarting = %@, hasFinalized = %@, name = %@)");
      objc_msgSend(v22, "raise:format:", v23, v28, v24, v27, v26, self->_name);

    }
  }

  v30.receiver = self;
  v30.super_class = (Class)UIViewPropertyAnimator;
  -[UIViewPropertyAnimator dealloc](&v30, sel_dealloc);
}

+ (void)_saveReferenceToPropertyAnimator:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)__ExtantPropertyAnimators;
  v8 = v3;
  if (!__ExtantPropertyAnimators)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__ExtantPropertyAnimators;
    __ExtantPropertyAnimators = v5;

    v3 = v8;
    v4 = (void *)__ExtantPropertyAnimators;
  }
  objc_msgSend(v3, "_trackingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, v7);

}

- (NSUUID)_trackingIdentifier
{
  return self->_trackingIdentifier;
}

+ (id)observedsOfAnimatorWithTrackingId:(id)a3
{
  return (id)objc_msgSend((id)__ObservedByMapping, "objectForKey:", a3);
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  objc_msgSend(a4, "removeAnimationForKey:", a5);
  return 0;
}

- (void)setUnitDuration:(double)a3
{
  self->_baseDuration = a3;
}

- (double)_effectiveAdditiveOffsetForKey:(id)a3 inLayer:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  -[UIViewPropertyAnimator _additiveOffsetForKey:inLayer:](self, "_additiveOffsetForKey:inLayer:", a3, a4);
  v6 = v5;
  if (v5 > 0.0)
  {
    -[UIViewPropertyAnimator delay](self, "delay");
    if (v7 > 0.0)
    {
      -[UIViewPropertyAnimator delay](self, "delay");
      v9 = v8;
      -[UIViewPropertyAnimator duration](self, "duration");
      v6 = v6 - v9 / v10;
    }
  }
  result = 1.0;
  if (v6 <= 1.0)
    result = v6;
  if (v6 < 0.0)
    return 0.0;
  return result;
}

- (double)_additiveOffsetForKey:(id)a3 inLayer:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[_UICompoundObjectMap valueForObject:andProperty:](self->_additiveOffsetsForAnimationKeysMap, "valueForObject:andProperty:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
  }
  else
  {
    v7 = -1.0;
  }

  return v7;
}

- (id)timingFunctionForPause
{
  void *v2;

  if (self->_scrubsLinearly)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (void)_finishTrackingAnimations
{
  void *v2;

  objc_msgSend((id)__trackingAnimatorStates, "removeLastObject");
  if (!objc_msgSend((id)__trackingAnimatorStates, "count"))
  {
    v2 = (void *)__trackingAnimatorStates;
    __trackingAnimatorStates = 0;

  }
}

+ (id)_startTrackingAnimations
{
  id v2;
  void *v3;
  UIViewPropertyAnimatorTrackingState *v4;
  void *v5;

  if (!__trackingAnimatorStates)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (void *)__trackingAnimatorStates;
    __trackingAnimatorStates = (uint64_t)v2;

  }
  v4 = objc_alloc_init(UIViewPropertyAnimatorTrackingState);
  objc_msgSend((id)__trackingAnimatorStates, "addObject:", v4);
  -[UIViewPropertyAnimatorTrackingState uuid](v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_canEnableTrackingAnimationsWithAnimators
{
  BOOL v2;
  void *v3;
  void *v4;

  if (!dyld_program_sdk_at_least()
    || +[UIView _isAnimationTracking](UIView, "_isAnimationTracking"))
  {
    return 0;
  }
  +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_outerPropertyAnimator:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4 == 0;

  return v2;
}

+ (id)_trackAdditiveAnimationWithAnimator:(id)a3 nonAdditiveAnimation:(id)a4 withAnimationKey:(id)a5 forKeyPath:(id)a6 forLayer:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __120__UIViewPropertyAnimator__trackAdditiveAnimationWithAnimator_nonAdditiveAnimation_withAnimationKey_forKeyPath_forLayer___block_invoke;
  v24[3] = &unk_1E16B4470;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  objc_msgSend(a1, "_trackAnimationWithAnimator:forLayer:forAnimationKey:trackingSetup:", v21, v17, v19, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)_trackNonAdditiveAnimationWithAnimator:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__UIViewPropertyAnimator__trackNonAdditiveAnimationWithAnimator_forLayer_forKey___block_invoke;
  v16[3] = &unk_1E16B4448;
  v17 = v8;
  v18 = v10;
  v19 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  objc_msgSend(a1, "_trackAnimationWithAnimator:forLayer:forAnimationKey:trackingSetup:", v13, v11, v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_trackAnimationWithAnimator:(id)a3 forLayer:(id)a4 forAnimationKey:(id)a5 trackingSetup:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  char v18;

  v18 = 0;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_animatorWithTimingAttributesMatchingAnimation:forLayer:wasReused:", v11, v10, &v18);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_animationBlockForTrackingAnimation:animator:trackingSetup:", v11, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v13, "_viewAnimationState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_trackingIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _performWithState:trackingIdentifier:duration:delay:animations:](UIView, "_performWithState:trackingIdentifier:duration:delay:animations:", v15, v16, v14, -1.0, -1.0);

  }
  else
  {
    objc_msgSend(v13, "addAnimations:", v14);
    objc_msgSend(v13, "startAnimation");
    if (objc_msgSend(v12, "startPaused"))
      objc_msgSend(v13, "pauseAnimation");
    objc_msgSend(v12, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_saveTrackingAnimator:forUUID:andDescription:", v13, v15, v13[2]);
  }

  return v13;
}

- (void)startAnimation
{
  UIViewPropertyAnimator *v3;
  _BOOL8 v4;

  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    -[UIViewPropertyAnimator continueAnimation](self, "continueAnimation");
    return;
  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 3)
  {
    v3 = self;
    v4 = 0;
  }
  else
  {
    if (-[UIViewPropertyAnimator _animationState](self, "_animationState"))
      return;
    v4 = -[UIViewPropertyAnimator isInterruptible](self, "isInterruptible");
    v3 = self;
  }
  -[UIViewPropertyAnimator startAnimationAsPaused:](v3, "startAnimationAsPaused:", v4);
}

+ (id)_animatorWithTimingAttributesMatchingAnimation:(id)a3 forLayer:(id)a4 wasReused:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  UISpringTimingParameters *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UISpringTimingParameters *v25;
  __CFString *v26;
  UICubicTimingParameters *v27;
  double *v28;
  id v29;
  UISpringTimingParameters *v30;
  UISpringTimingParameters *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL *v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  UIViewPropertyAnimator *v66;
  id v68;
  id v69;
  __CFString *v70;
  void *v71;
  void *v72;
  BOOL *v73;
  id v74;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  v12 = v11[5];
  objc_msgSend(a1, "_delayForAnimation:forLayer:", v8, v9);
  v14 = v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v8;
    v16 = [UISpringTimingParameters alloc];
    objc_msgSend(v15, "mass");
    v18 = v17;
    objc_msgSend(v15, "stiffness");
    v20 = v19;
    objc_msgSend(v15, "damping");
    v22 = v21;
    objc_msgSend(v15, "initialVelocity");
    v24 = v23;

    v25 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](v16, "initWithMass:stiffness:damping:initialVelocity:", v18, v20, v22, v24, 0.0);
    -[UISpringTimingParameters springTimingParameters](v25, "springTimingParameters");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString setImplicitDuration:](v26, "setImplicitDuration:", 0);
  }
  else
  {
    v27 = [UICubicTimingParameters alloc];
    objc_msgSend(v8, "timingFunction");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v25 = -[UICubicTimingParameters initWithCustomCurve:](v27, "initWithCustomCurve:", v26);
  }

  if ((objc_msgSend(v10, "optimizationsEnabled") & 1) == 0)
  {
    v49 = 0;
    *a5 = 0;
LABEL_22:
    v66 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v25, v12);
    objc_storeStrong((id *)&v66->_trackingDescription, v49);
    objc_storeStrong((id *)&v66->_trackingState, v10);
    v66->_delay = v14;
    -[UIViewPropertyAnimator setScrubsLinearly:](v66, "setScrubsLinearly:", objc_msgSend(v10, "scrubsLinearly"));
    -[UIViewPropertyAnimator setUserInteractionEnabled:](v66, "setUserInteractionEnabled:", objc_msgSend(v10, "userInteractionEnabled"));
    goto LABEL_23;
  }
  v28 = v11;
  v29 = v10;
  v30 = v25;
  v31 = v30;
  if (!v30)
  {
    v26 = CFSTR("timing unknown;");
    goto LABEL_21;
  }
  v32 = -[UISpringTimingParameters timingCurveType](v30, "timingCurveType");
  if (v32 < 2)
  {
    -[UISpringTimingParameters cubicTimingParameters](v31, "cubicTimingParameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _cubicTimingProviderDescription(v33);
    v50 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v32 != 2)
    {
      if (v32 != 3)
        goto LABEL_21;
      v73 = a5;
      v69 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[UISpringTimingParameters cubicTimingParameters](v31, "cubicTimingParameters");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      _cubicTimingProviderDescription(v33);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISpringTimingParameters springTimingParameters](v31, "springTimingParameters");
      v34 = objc_claimAutoreleasedReturnValue();
      v71 = (void *)v34;
      if (v34)
      {
        v35 = (void *)v34;
        v68 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v35, "dampingRatio");
        v37 = v36;
        v38 = objc_msgSend(v35, "implicitDuration");
        objc_msgSend(v35, "mass");
        v40 = v39;
        objc_msgSend(v35, "stiffness");
        v42 = v41;
        objc_msgSend(v35, "damping");
        v44 = v43;
        objc_msgSend(v35, "initialVelocity");
        v46 = v45;
        objc_msgSend(v35, "initialVelocity");
        v48 = (const __CFString *)objc_msgSend(v68, "initWithFormat:", CFSTR("spring %f, %i, %f, %f, %f, %f, %f;"),
                                    v37,
                                    v38,
                                    v40,
                                    v42,
                                    v44,
                                    v46,
                                    v47);
      }
      else
      {
        v48 = CFSTR("spring unknown;");
      }
      v65 = v69;
      v70 = (__CFString *)v48;
      v26 = (__CFString *)objc_msgSend(v65, "initWithFormat:", CFSTR("composed %@ %@"), v72, v48);

      a5 = v73;
      goto LABEL_20;
    }
    -[UISpringTimingParameters springTimingParameters](v31, "springTimingParameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v26 = CFSTR("spring unknown;");
      goto LABEL_20;
    }
    v74 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v33, "dampingRatio");
    v52 = v51;
    v53 = a5;
    v54 = objc_msgSend(v33, "implicitDuration");
    objc_msgSend(v33, "mass");
    v56 = v55;
    objc_msgSend(v33, "stiffness");
    v58 = v57;
    objc_msgSend(v33, "damping");
    v60 = v59;
    objc_msgSend(v33, "initialVelocity");
    v62 = v61;
    objc_msgSend(v33, "initialVelocity");
    v63 = v54;
    a5 = v53;
    v50 = objc_msgSend(v74, "initWithFormat:", CFSTR("spring %f, %i, %f, %f, %f, %f, %f;"),
            v52,
            v63,
            v56,
            v58,
            v60,
            v62,
            v64);
  }
  v26 = (__CFString *)v50;
LABEL_20:

LABEL_21:
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p; %p; %f; %f; %@"),
                  v28,
                  v29,
                  *(_QWORD *)&v12,
                  *(_QWORD *)&v14,
                  v26);

  objc_msgSend((id)qword_1ECD7CAE0, "objectForKey:", v49);
  v66 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
  *a5 = v66 != 0;
  if (!v66)
    goto LABEL_22;
LABEL_23:

  return v66;
}

+ (double)_delayForAnimation:(id)a3 forLayer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "beginTimeMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD2950]);

  objc_msgSend(v5, "beginTime");
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    v10 = 0.0;
    if (v9 > 0.0)
    {
      objc_msgSend(v6, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v12 = v11;
      objc_msgSend(v5, "beginTime");
      v10 = (v13 - v12) / UIAnimationDragCoefficient();
    }
  }

  return v10;
}

+ (id)_animationBlockForTrackingAnimation:(id)a3 animator:(id)a4 trackingSetup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__UIViewPropertyAnimator__animationBlockForTrackingAnimation_animator_trackingSetup___block_invoke;
  v18[3] = &unk_1E16B4420;
  v19 = v11;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v11;
  v16 = _Block_copy(v18);

  return v16;
}

void __85__UIViewPropertyAnimator__animationBlockForTrackingAnimation_animator_trackingSetup___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "startPaused"))
  {
    LODWORD(v2) = 0;
    objc_msgSend(*(id *)(a1 + 40), "setSpeed:", v2);
  }
  objc_msgSend(*(id *)(a1 + 48), "_viewAnimationState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_transferAnimationToTrackingAnimator:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (BOOL)_trackedAnimationsStartPaused
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startPaused");

  return v3;
}

+ (id)_currentTrackedAnimationsState
{
  return (id)objc_msgSend((id)__trackingAnimatorStates, "lastObject");
}

uint64_t __81__UIViewPropertyAnimator__trackNonAdditiveAnimationWithAnimator_forLayer_forKey___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_trackAnimation:withAnimationKey:forKeyPath:inLayer:", a1[4], a1[5], a1[5], a1[6]);
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration dampingRatio:(CGFloat)ratio animations:(void *)animations
{
  void *v8;
  UISpringTimingParameters *v9;
  UIViewPropertyAnimator *v10;
  UIViewPropertyAnimator *v11;

  v8 = animations;
  v9 = -[UISpringTimingParameters initWithDampingRatio:]([UISpringTimingParameters alloc], "initWithDampingRatio:", ratio);
  v10 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](self, "initWithDuration:timingParameters:", v9, duration);
  v11 = v10;
  if (v8)
    -[UIViewPropertyAnimator addAnimations:](v10, "addAnimations:", v8);

  return v11;
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration curve:(UIViewAnimationCurve)curve animations:(void *)animations
{
  void *v8;
  UICubicTimingParameters *v9;
  UIViewPropertyAnimator *v10;
  UIViewPropertyAnimator *v11;

  v8 = animations;
  v9 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", curve);
  v10 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](self, "initWithDuration:timingParameters:", v9, duration);
  v11 = v10;
  if (v8)
    -[UIViewPropertyAnimator addAnimations:](v10, "addAnimations:", v8);

  return v11;
}

- (void)addAnimations:(void *)animation
{
  -[UIViewPropertyAnimator addAnimations:delayFactor:durationFactor:](self, "addAnimations:delayFactor:durationFactor:", animation, 0.0, 1.0);
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration timingParameters:(id)parameters
{
  id v6;
  UIViewPropertyAnimator *v7;
  UIViewPropertyAnimator *v8;
  objc_super v10;

  v6 = parameters;
  v10.receiver = self;
  v10.super_class = (Class)UIViewPropertyAnimator;
  v7 = -[UIViewPropertyAnimator init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[UIViewPropertyAnimator _setupWithDuration:timingParameters:animations:](v7, "_setupWithDuration:timingParameters:animations:", v6, 0, duration);

  return v8;
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
  if (-[UIViewPropertyAnimator _isActive](self, "_isActive"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("It is not allowed to set the userInteractionEnabled property of an active animator (%@)"), self);
  self->_userInteractionEnabled = userInteractionEnabled;
}

uint64_t __120__UIViewPropertyAnimator__trackAdditiveAnimationWithAnimator_nonAdditiveAnimation_withAnimationKey_forKeyPath_forLayer___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_trackAnimation:nonAdditiveAnimation:withAnimationKey:forKeyPath:inLayer:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)setScrubsLinearly:(BOOL)scrubsLinearly
{
  void *v6;

  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 2707, CFSTR("Cannot modify scrubsLinearly while animation is already paused"));

  }
  self->_scrubsLinearly = scrubsLinearly;
}

+ (void)_saveTrackingAnimator:(id)a3 forUUID:(id)a4 andDescription:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)_MergedGlobals_939;
  if (!_MergedGlobals_939)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_MergedGlobals_939;
    _MergedGlobals_939 = v10;

    v9 = (void *)_MergedGlobals_939;
  }
  objc_msgSend(v9, "objectForKey:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    objc_msgSend((id)_MergedGlobals_939, "setObject:forKey:", v12, v7);
  }
  objc_msgSend(v12, "addObject:", v16);
  if (v8)
  {
    v13 = (void *)qword_1ECD7CAE0;
    if (!qword_1ECD7CAE0)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)qword_1ECD7CAE0;
      qword_1ECD7CAE0 = v14;

      v13 = (void *)qword_1ECD7CAE0;
    }
    objc_msgSend(v13, "setObject:forKey:", v16, v8);
  }

}

- (id)timingParameters
{
  return self->_timingParameters;
}

- (void)pauseAnimation
{
  void *v4;
  double v5;
  void *v6;

  if (!-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 2713, CFSTR("An animator %@ that is not interruptible cannot be paused!"), self);

  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 3)
    -[UIViewPropertyAnimator startAnimationAsPaused:](self, "startAnimationAsPaused:", 1);
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 1)
  {
    -[UIViewPropertyAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fractionComplete"));
    -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 4);
    -[UIViewPropertyAnimator timingFunctionForPause](self, "timingFunctionForPause");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _pauseAnimation:fromStart:](self, "_pauseAnimation:fromStart:", v4, 0);
    self->_fractionComplete = v5;

    -[UIViewPropertyAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fractionComplete"));
    -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", 0);
  }
}

- (void)setFractionComplete:(double)a3
{
  double v4;
  double v5;

  v4 = 0.99999;
  if (a3 <= 0.99999)
    v4 = a3;
  if (a3 >= 0.00001)
    v5 = v4;
  else
    v5 = 0.00001;
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    if (v5 != self->_fractionComplete)
    {
      -[UIViewPropertyAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fractionComplete"));
      self->_fractionComplete = v5;
      -[UIViewPropertyAnimator _updateAnimationsToFractionComplete:](self, "_updateAnimationsToFractionComplete:", v5);
      -[UIViewPropertyAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fractionComplete"));
    }
  }
  else if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 3)
  {
    -[UIViewPropertyAnimator startAnimationAsPaused:](self, "startAnimationAsPaused:", 1);
    -[UIViewPropertyAnimator setFractionComplete:](self, "setFractionComplete:", v5);
  }
  else if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 1)
  {
    -[UIViewPropertyAnimator pauseAnimationTransiently](self, "pauseAnimationTransiently");
    -[UIViewPropertyAnimator setFractionComplete:](self, "setFractionComplete:", v5);
    -[UIViewPropertyAnimator _continueWithTimingParameters:duration:](self, "_continueWithTimingParameters:duration:", 0, 0.0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationDescriptionMap, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_timingParameters, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_trackingIdentifier, 0);
  objc_storeStrong((id *)&self->_viewAnimationState, 0);
  objc_destroyWeak((id *)&self->_caContinuationCommitFuture);
  objc_storeStrong((id *)&self->_continuedWithSpringForAnimationKeyMap, 0);
  objc_storeStrong((id *)&self->_additiveOffsetsForAnimationKeysMap, 0);
  objc_storeStrong((id *)&self->_originalFromValueMap, 0);
  objc_storeStrong((id *)&self->_originalToValueMap, 0);
  objc_storeStrong((id *)&self->_timingProviderWhenContinued, 0);
  objc_storeStrong((id *)&self->_timingFunctionWhenPaused, 0);
  objc_storeStrong((id *)&self->_timingFunctionPriorToPause, 0);
  objc_storeStrong((id *)&self->_pacingAnimationKey, 0);
  objc_destroyWeak((id *)&self->_outerAnimator);
  objc_storeStrong((id *)&self->_trackingDescription, 0);
  objc_storeStrong((id *)&self->_trackingState, 0);
}

- (void)setPausesOnCompletion:(BOOL)pausesOnCompletion
{
  self->_pausesOnCompletion = pausesOnCompletion;
}

- (double)fractionComplete
{
  int64_t v3;
  double result;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double fractionComplete;
  BOOL v13;

  v3 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
  result = 0.0;
  if (v3 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_caContinuationCommitFuture);
    if (!WeakRetained
      || (v6 = WeakRetained,
          v7 = objc_loadWeakRetained((id *)&self->_caContinuationCommitFuture),
          v8 = objc_msgSend(v7, "_isFinished"),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_canonicalTrackedUnpacedFractionComplete");
      v11 = v10;

      if (v11 > -1.0
        || ((fractionComplete = self->_fractionComplete, fractionComplete >= 0.0)
          ? (v13 = fractionComplete > 1.0)
          : (v13 = 1),
            v13))
      {
        fractionComplete = v11;
      }
      goto LABEL_15;
    }
  }
  else if (v3 != 4 && v3 != 2)
  {
    return result;
  }
  fractionComplete = self->_fractionComplete;
LABEL_15:
  result = 1.0;
  if (fractionComplete != 0.99999)
  {
    result = 0.0;
    if (fractionComplete != 0.00001)
    {
      result = 1.0;
      if (fractionComplete <= 1.0)
        result = fractionComplete;
      if (fractionComplete < 0.0)
        return 0.0;
    }
  }
  return result;
}

- (void)stopAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (!-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 3170, CFSTR("An animator %@ that is not interruptible cannot be stopped!"), self);

  }
  if (-[UIViewPropertyAnimator state](self, "state") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 3171, CFSTR("Animator %@ is already stopped!"), self);

  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 1
    || -[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _stopAnimationWithUUID:](UIView, "_stopAnimationWithUUID:", v6);

    if (v3)
      -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 2);
    else
      -[UIViewPropertyAnimator _setKVOCompliantState:](self, "_setKVOCompliantState:", 2);
    self->_pausedAsSpring = 0;
    -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", 0);
    -[UIViewPropertyAnimator _setKVOCompliantReversed:](self, "_setKVOCompliantReversed:", 0);
    if (v3)
    {
      -[UIViewPropertyAnimator _setCompletions:](self, "_setCompletions:", 0);
      -[UIViewPropertyAnimator _setFinishingPosition:](self, "_setFinishingPosition:", 2);
      -[UIViewPropertyAnimator _runCompletions:finished:](self, "_runCompletions:finished:", 2, 0);
    }
  }
}

+ (id)_originalFromValueForKey:(id)a3 inLayer:(id)a4 forAnimatorWithTrackingIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_propertyAnimatorWithUUID:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_originalFromValueForKey:inLayer:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_originalToValueForKey:(id)a3 inLayer:(id)a4
{
  return -[_UICompoundObjectMap valueForObject:andProperty:](self->_originalToValueMap, "valueForObject:andProperty:", a4, a3);
}

+ (id)_getPropertyAnimationForState:(id)a3
{
  return objc_loadWeakRetained((id *)a3 + 34);
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  void *v6;

  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") != 2
    && -[UIViewPropertyAnimator _animationState](self, "_animationState"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 2202, CFSTR("finishAnimationAtPosition: should only be called on a stopped animator!"));

  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 2)
    -[UIViewPropertyAnimator _runCompletions:finished:](self, "_runCompletions:finished:", a3, 1);
}

+ (void)_removeTrackingAnimator:(id)a3 forUUID:(id)a4 andDescription:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  v8 = (void *)_MergedGlobals_939;
  v9 = a3;
  objc_msgSend(v8, "objectForKey:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v9);

  if (!v10)
  {
    objc_msgSend((id)_MergedGlobals_939, "removeObjectForKey:", v13);
    if (!objc_msgSend((id)_MergedGlobals_939, "count"))
    {
      v11 = (void *)_MergedGlobals_939;
      _MergedGlobals_939 = 0;

    }
  }
  if (v7)
  {
    objc_msgSend((id)qword_1ECD7CAE0, "removeObjectForKey:", v7);
    if (!objc_msgSend((id)qword_1ECD7CAE0, "count"))
    {
      v12 = (void *)qword_1ECD7CAE0;
      qword_1ECD7CAE0 = 0;

    }
  }

}

- (void)_setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    self->_optionsAreExplicit = 1;
  }
}

- (void)_setPausesOnCompletion:(BOOL)a3
{
  if (!self->_interruptible)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("It is not allowed to set the pausesOnCompletion property on a non-interruptible animator (%@)"), self);
  self->_pausesOnCompletion = a3;
}

- (void)setInterruptible:(BOOL)interruptible
{
  if (-[UIViewPropertyAnimator _isActive](self, "_isActive"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("It is not allowed to set the interruptible property of an active animator (%@)"), self);
  self->_interruptible = interruptible;
}

- (void)_setShouldLayoutSubviews:(BOOL)a3
{
  if (-[UIViewPropertyAnimator _isActive](self, "_isActive"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("shouldLayoutSubviews may not be set on an active animator (%@)"), self);
  self->_shouldLayoutSubviews = a3;
}

- (void)_setShouldBeginFromCurrentState:(BOOL)a3
{
  if (-[UIViewPropertyAnimator _isActive](self, "_isActive"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("_shouldBeginFromCurrentState may not be set on an active animator (%@)"), self);
  self->_shouldBeginFromCurrentState = a3;
}

- (UIViewPropertyAnimator)init
{
  void *v3;
  UIViewPropertyAnimator *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](self, "initWithDuration:timingParameters:", v3, 0.0);

  return v4;
}

- (UIViewPropertyAnimator)initWithDuration:(NSTimeInterval)duration controlPoint1:(CGPoint)point1 controlPoint2:(CGPoint)point2 animations:(void *)animations
{
  double y;
  double x;
  double v8;
  double v9;
  void *v12;
  UICubicTimingParameters *v13;
  UIViewPropertyAnimator *v14;
  UIViewPropertyAnimator *v15;

  y = point2.y;
  x = point2.x;
  v8 = point1.y;
  v9 = point1.x;
  v12 = animations;
  v13 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]([UICubicTimingParameters alloc], "initWithControlPoint1:controlPoint2:", v9, v8, x, y);
  v14 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](self, "initWithDuration:timingParameters:", v13, duration);
  v15 = v14;
  if (v12)
    -[UIViewPropertyAnimator addAnimations:](v14, "addAnimations:", v12);

  return v15;
}

- (UIViewPropertyAnimator)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 initialVelocity:(CGVector)a6 animations:(id)a7
{
  double dy;
  double dx;
  id v13;
  UISpringTimingParameters *v14;
  UIViewPropertyAnimator *v15;
  UIViewPropertyAnimator *v16;

  dy = a6.dy;
  dx = a6.dx;
  v13 = a7;
  v14 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", a3, a4, a5, dx, dy);
  v15 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](self, "initWithDuration:timingParameters:", v14, 0.0);
  v16 = v15;
  if (v13)
    -[UIViewPropertyAnimator addAnimations:](v15, "addAnimations:", v13);

  return v16;
}

+ (UIViewPropertyAnimator)runningPropertyAnimatorWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void *)animations completion:(void *)completion
{
  void *v12;
  void *v13;
  _BYTE *v14;

  v12 = completion;
  v13 = animations;
  v14 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "initWithDuration:curve:animations:", (options >> 16) & 7, v13, duration);

  objc_msgSend(v14, "setInterruptible:", +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled") ^ 1);
  objc_msgSend(v14, "setManualHitTestingEnabled:", 1);
  v14[51] = 1;
  objc_msgSend(v14, "_setOptions:", options & 0xF0F0267);
  if (v12)
    objc_msgSend(v14, "addCompletion:", v12);
  objc_msgSend(v14, "startAnimationAfterDelay:", delay);

  return (UIViewPropertyAnimator *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIViewPropertyAnimator duration](self, "duration");
  v6 = v5;
  -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setupWithDuration:timingParameters:animations:", v7, 0, v6);

  objc_msgSend(v4, "setUserInteractionEnabled:", -[UIViewPropertyAnimator isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  objc_msgSend(v4, "setInterruptible:", -[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"));
  objc_msgSend(v4, "_setShouldLayoutSubviews:", -[UIViewPropertyAnimator shouldLayoutSubviews](self, "shouldLayoutSubviews"));
  return v4;
}

+ (void)_setTrackedAnimationsStartPaused:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartPaused:", v3);

}

+ (BOOL)_trackedAnimationsScrubLinearly
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrubsLinearly");

  return v3;
}

+ (void)_setTrackedAnimationsScrubLinearly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrubsLinearly:", v3);

}

+ (BOOL)_trackedAnimationsUserInteractionEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInteractionEnabled");

  return v3;
}

+ (void)_setTrackedAnimationsUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

+ (BOOL)_trackedAnimationsOptimizationsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "optimizationsEnabled");

  return v3;
}

+ (void)_setTrackedAnimationsOptimizationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "_currentTrackedAnimationsState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptimizationsEnabled:", v3);

}

+ (id)_animatorForTrackedAnimationsUUID:(id)a3
{
  void *v3;
  _UIViewPropertyAnimatorTrackingGroup *v4;

  objc_msgSend(a1, "_animatorsForTrackedAnimationsUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIViewPropertyAnimatorTrackingGroup initWithAnimators:]([_UIViewPropertyAnimatorTrackingGroup alloc], "initWithAnimators:", v3);

  return v4;
}

+ (id)_performWhileTrackingAnimations:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(a1, "_startTrackingAnimations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4);
  objc_msgSend(a1, "_finishTrackingAnimations");
  objc_msgSend(a1, "_animatorForTrackedAnimationsUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_animatorsForTrackedAnimationsUUID:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99D20];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend((id)_MergedGlobals_939, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithArray:", v7);

  return v8;
}

+ (BOOL)_containsAnimatorForTrackedAnimationsUUID:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend((id)_MergedGlobals_939, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setReversed:(BOOL)a3
{
  void (**v4)(_QWORD);
  int64_t v5;
  _QWORD v6[5];
  BOOL v7;

  if (self->_reversed != a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__UIViewPropertyAnimator_setReversed___block_invoke;
    v6[3] = &unk_1E16B1B78;
    v6[4] = self;
    v7 = a3;
    v4 = (void (**)(_QWORD))_Block_copy(v6);
    v5 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
    if ((unint64_t)(v5 - 3) >= 2)
    {
      if (v5 != 1)
      {
LABEL_7:

        return;
      }
      -[UIViewPropertyAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reversed"));
      -[UIViewPropertyAnimator pauseAnimationTransiently](self, "pauseAnimationTransiently");
      v4[2](v4);
      -[UIViewPropertyAnimator _continueWithTimingParameters:duration:](self, "_continueWithTimingParameters:duration:", 0, 0.0);
    }
    else
    {
      -[UIViewPropertyAnimator willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("reversed"));
      v4[2](v4);
    }
    -[UIViewPropertyAnimator didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("reversed"));
    goto LABEL_7;
  }
}

uint64_t __38__UIViewPropertyAnimator_setReversed___block_invoke(uint64_t a1)
{
  double v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_setFinishingPosition:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "fractionComplete");
  return objc_msgSend(*(id *)(a1 + 32), "setFractionComplete:", 1.0 - v2);
}

- (double)_dragAdjustedDuration
{
  double drag;
  double v3;

  drag = self->_drag;
  -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
  return v3 * fmax(drag, 1.0);
}

- (double)unitDuration
{
  return self->_baseDuration;
}

- (NSTimeInterval)delay
{
  return self->_delay;
}

- (double)_drag
{
  return self->_drag;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(CFSTR("running"), "isEqualToString:", v4) & 1) != 0
    || (objc_msgSend(CFSTR("reversed"), "isEqualToString:", v4) & 1) != 0
    || (objc_msgSend(CFSTR("fractionComplete"), "isEqualToString:", v4) & 1) != 0
    || (objc_msgSend(CFSTR("state"), "isEqualToString:", v4) & 1) != 0
    || (objc_msgSend(CFSTR("animationState"), "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___UIViewPropertyAnimator;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)_springAnimationForXComponent:(id *)a3 forYComponent:(id *)a4
{
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;

  -[UITimingCurveProvider springTimingParameters](self->_timingParameters, "springTimingParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  objc_msgSend(v7, "initialVelocity");
  v10 = v9;
  if ((objc_msgSend(v7, "implicitDuration") & 1) == 0)
  {
    v18 = 0.0;
    v19 = 0.0;
    -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
    v12 = v11;
    objc_msgSend(v7, "dampingRatio");
    +[UIViewSpringAnimationState computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:](UIViewSpringAnimationState, "computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:", &v18, &v19, v12, v13, 1.0, v10, 0.001);
    objc_msgSend(v8, "stiffness");
    if (v14 < v18)
      v14 = v18;
    objc_msgSend(v8, "damping", *(_QWORD *)&v14);
    if (v15 < v19)
      v15 = v19;
    v19 = v15;
    objc_msgSend(v8, "setStiffness:", v18);
    objc_msgSend(v8, "setDamping:", v19);
  }
  v16 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v16, "setVelocity:", v10);
  v17 = objc_retainAutorelease(v16);
  *a4 = v17;

}

- (id)animationsDescription
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__UIViewPropertyAnimator_animationsDescription__block_invoke;
  v7[3] = &unk_1E16B4498;
  v5 = v3;
  v8 = v5;
  +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v4, v7);

  return v5;
}

uint64_t __47__UIViewPropertyAnimator_animationsDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@>\n"), v4);

  return 0;
}

+ (void)animator:(id)a3 isObserving:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = (void *)__ObservedByMapping;
  if (!__ObservedByMapping)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)__ObservedByMapping;
    __ObservedByMapping = v7;

    v6 = (void *)__ObservedByMapping;
  }
  objc_msgSend(v13, "_trackingIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)__ObservedByMapping;
    objc_msgSend(v13, "_trackingIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v12);

  }
  objc_msgSend(v10, "addObject:", v5);

}

+ (void)removeObserved:(id)a3 forObservingAnimatorWithId:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend((id)__ObservedByMapping, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "removeObject:", v9);
    if (!objc_msgSend(v7, "count"))
    {
      objc_msgSend((id)__ObservedByMapping, "removeObjectForKey:", v5);
      if (!objc_msgSend((id)__ObservedByMapping, "count"))
      {
        v8 = (void *)__ObservedByMapping;
        __ObservedByMapping = 0;

      }
    }
  }

}

+ (void)removeAllObservedForObservingAnimatorWithId:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend((id)__ObservedByMapping, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "removeAllObjects");
    objc_msgSend((id)__ObservedByMapping, "removeObjectForKey:", v6);
    if (!objc_msgSend((id)__ObservedByMapping, "count"))
    {
      v5 = (void *)__ObservedByMapping;
      __ObservedByMapping = 0;

    }
  }

}

- (id)_stateAsString
{
  unint64_t v2;

  v2 = -[UIViewPropertyAnimator state](self, "state");
  if (v2 > 2)
    return CFSTR("unknown");
  else
    return off_1E16B47F8[v2];
}

- (id)_animationStateAsString
{
  unint64_t v2;

  v2 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
  if (v2 > 5)
    return CFSTR("unknown");
  else
    return off_1E16B4810[v2];
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator _stateAsString](self, "_stateAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIViewPropertyAnimator isRunning](self, "isRunning"))
    v7 = CFSTR(" running");
  else
    v7 = &stru_1E16EDF20;
  if (-[UIViewPropertyAnimator isReversed](self, "isReversed"))
    v8 = CFSTR(" reversed");
  else
    v8 = &stru_1E16EDF20;
  v9 = -[UIViewPropertyAnimator isInterruptible](self, "isInterruptible");
  v10 = CFSTR(" interruptible");
  if (!v9)
    v10 = &stru_1E16EDF20;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@(%p) [%@]%@%@%@>"), v5, self, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

void __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;

  v2 = 1.0 - *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "internalDuration");
  v4 = v2 * v3;
  v5 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "internalDuration");
  v7 = v5 * v6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_3;
  v8[3] = &unk_1E16B1BF8;
  v9 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, 0, v4, v7);

}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAnimations");
}

uint64_t __67__UIViewPropertyAnimator_addAnimations_delayFactor_durationFactor___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAnimations");
}

- (void)addAnimations:(void *)animation delayFactor:(CGFloat)delayFactor
{
  -[UIViewPropertyAnimator addAnimations:delayFactor:durationFactor:](self, "addAnimations:delayFactor:durationFactor:", animation, delayFactor, 1.0);
}

- (id)_animationDescriptionForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIViewPropertyAnimator _animationDescriptionMap](self, "_animationDescriptionMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_explicitAnimationUpdateForProperty:(id)a3 forView:(id)a4 withValue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  -[UIViewPropertyAnimator _animationDescriptionForView:](self, "_animationDescriptionForView:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "isImplicit") & 1) == 0)
  {
    objc_msgSend(v14, "fromValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v14, "toValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToValue:", v8))
        v18 = v14;
      else
        v18 = 0;
      v15 = v18;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_newAnimationUpdateForProperty:(id)a3 implicit:(BOOL)a4 additive:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  _UIViewPropertyAnimationUpdate *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = -[_UIViewPropertyAnimationUpdate initWithPropertyName:implicit:additive:]([_UIViewPropertyAnimationUpdate alloc], "initWithPropertyName:implicit:additive:", v7, v6, v5);

  return v8;
}

- (void)_notePropertyAnimationUpdate:(id)a3 forView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _UIViewPropertyAnimationDescription *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator _animationDescriptionMap](self, "_animationDescriptionMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (_UIViewPropertyAnimationDescription *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = -[_UIViewPropertyAnimationDescription initWithView:]([_UIViewPropertyAnimationDescription alloc], "initWithView:", v6);
    -[UIViewPropertyAnimator _animationDescriptionMap](self, "_animationDescriptionMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v7);

  }
  -[_UIViewPropertyAnimationDescription _addUpdate:](v9, "_addUpdate:", v11);

}

- (NSArray)animationDescriptions
{
  void *v2;
  void *v3;

  -[UIViewPropertyAnimator _animationDescriptionMap](self, "_animationDescriptionMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_setContinuedWithNewSpring:(BOOL)a3 forAnimationKey:(id)a4 forLayer:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _UICompoundObjectMap *continuedWithSpringForAnimationKeyMap;
  _UICompoundObjectMap *v11;
  _UICompoundObjectMap *v12;
  void *v13;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  continuedWithSpringForAnimationKeyMap = self->_continuedWithSpringForAnimationKeyMap;
  if (!continuedWithSpringForAnimationKeyMap)
  {
    +[_UICompoundObjectMap compoundObjectMap](_UICompoundObjectMap, "compoundObjectMap");
    v11 = (_UICompoundObjectMap *)objc_claimAutoreleasedReturnValue();
    v12 = self->_continuedWithSpringForAnimationKeyMap;
    self->_continuedWithSpringForAnimationKeyMap = v11;

    continuedWithSpringForAnimationKeyMap = self->_continuedWithSpringForAnimationKeyMap;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICompoundObjectMap setValue:forObject:andProperty:](continuedWithSpringForAnimationKeyMap, "setValue:forObject:andProperty:", v13, v9, v8);

  return 1;
}

- (BOOL)_wasContinuedWithNewSpringForAnimationKey:(id)a3 forLayer:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[_UICompoundObjectMap valueForObject:andProperty:](self->_continuedWithSpringForAnimationKeyMap, "valueForObject:andProperty:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (void)_untrackPropertyAnimationsForKeys:(id *)a3 inLayer:(id)a4
{
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    if (!a3[v6])
      break;
    -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_untrackAnimationsWithIdentifier:keyPath:inLayer:removeFromLayer:", self->_trackingIdentifier, a3[v6], v10, 0);

    -[UIViewPropertyAnimator _setOriginalFromValue:forKey:inLayer:](self, "_setOriginalFromValue:forKey:inLayer:", 0, a3[v6], v10);
    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);

}

- (double)_pauseAnimation:(id)a3 fromStart:(BOOL)a4
{
  double result;

  -[UIViewPropertyAnimator _pauseAnimation:fromStart:minimizingStateModifications:](self, "_pauseAnimation:fromStart:minimizingStateModifications:", a3, a4, 0);
  return result;
}

- (double)_pauseAnimation:(id)a3 fromStart:(BOOL)a4 minimizingStateModifications:(BOOL)a5
{
  id v9;
  UITimingCurveProvider *timingProviderWhenContinued;
  UITimingCurveProvider *v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  UITimingCurveProvider *v18;
  _BOOL4 v19;
  double v20;
  UITimingCurveProvider *v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t *v34;
  BOOL v35;
  BOOL v36;
  _QWORD aBlock[4];
  id v38;
  UIViewPropertyAnimator *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[3];
  char v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[3];
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[4];
  uint64_t v61;
  double *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;

  v9 = a3;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = 0;
  v61 = 0;
  v62 = (double *)&v61;
  v63 = 0x2020000000;
  v64 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v60[3] = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__11;
  v58[4] = __Block_byref_object_dispose__11;
  v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__11;
  v56[4] = __Block_byref_object_dispose__11;
  v57 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  timingProviderWhenContinued = self->_timingProviderWhenContinued;
  if (timingProviderWhenContinued)
  {
    v11 = timingProviderWhenContinued;
  }
  else
  {
    -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
    v11 = (UITimingCurveProvider *)(id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v22 = 0;
      goto LABEL_8;
    }
  }
  v22 = v11;
  if (-[UITimingCurveProvider timingCurveType](v11, "timingCurveType") == 2)
  {

  }
  else
  {
    v12 = -[UITimingCurveProvider timingCurveType](v11, "timingCurveType");

    if (v12 != 3)
      goto LABEL_8;
  }
  v13 = -[UIViewPropertyAnimator _computeSmallestDisplacementFractionComplete:](self, "_computeSmallestDisplacementFractionComplete:", v68 + 3);
  *((_BYTE *)v72 + 24) = v13;
LABEL_8:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke;
  aBlock[3] = &unk_1E16B4510;
  v40 = v48;
  v41 = v46;
  v42 = &v52;
  v43 = v50;
  v14 = v9;
  v38 = v14;
  v39 = self;
  v44 = v58;
  v45 = v56;
  v15 = _Block_copy(aBlock);
  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke_2;
  v23[3] = &unk_1E16B4538;
  v25 = v60;
  v26 = &v52;
  v23[4] = self;
  v35 = a4;
  v27 = v50;
  v28 = v58;
  v29 = v56;
  v30 = v48;
  v31 = &v71;
  v32 = &v67;
  v17 = v14;
  v36 = a5;
  v24 = v17;
  v33 = v65;
  v34 = &v61;
  +[UIView modifyTrackedAnimations:removeOnCompletion:animationFactory:block:]((uint64_t)UIView, v16, 0, v15, v23);

  if (!a5)
  {
    self->_pausedAsSpring = *((_BYTE *)v53 + 24);
    objc_storeStrong((id *)&self->_timingFunctionWhenPaused, a3);
    self->_fractionCompleteWhenContinued = 0.0;
    v18 = self->_timingProviderWhenContinued;
    self->_timingProviderWhenContinued = 0;

  }
  v19 = -[UIViewPropertyAnimator isReversed](self, "isReversed");
  v20 = v62[3];
  if (v19)
  {
    v20 = 1.0 - v20;
    v62[3] = v20;
  }

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);

  return v20;
}

id __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  BOOL v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v10 = 0;
  else
    v10 = objc_msgSend(v8, "hasPrefix:", CFSTR("UIPacingAnimationForAnimatorsKey"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v11 + 24))
    v12 = 1;
  else
    v12 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  *(_BYTE *)(v11 + 24) = v12;
  objc_opt_class();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_opt_isKindOfClass() & 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v13 = 0;
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    v13 = 1;
  }
  else
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "_wasContinuedWithNewSpringForAnimationKey:forLayer:", v8, v9);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v14 = v7;
    objc_msgSend(*(id *)(a1 + 40), "_originalFromValueForKey:inLayer:", v8, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      objc_msgSend(v14, "keyPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_trackingIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _UIFromValueForAnimation(v14, v18, v9, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      v23 = *(void **)(a1 + 40);
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(v14, "keyPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_setOriginalFromValue:forKey:inLayer:", v24, v25, v9);

    }
    v26 = *(void **)(a1 + 40);
    objc_msgSend(v14, "keyPath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_originalToValueForKey:inLayer:", v27, v9);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    v31 = (void *)MEMORY[0x1E0CD2710];
    objc_msgSend(v14, "keyPath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "animationWithKeyPath:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDelegate:", v34);

    objc_msgSend(v14, "timingFunction");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTimingFunction:", v35);

    objc_msgSend(v33, "setToValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    objc_msgSend(v33, "setFromValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_msgSend(v14, "duration");
    objc_msgSend(v33, "setDuration:");
    objc_msgSend(v14, "preferredFrameRateRange");
    objc_msgSend(v33, "setPreferredFrameRateRange:");
    objc_msgSend(v33, "setHighFrameRateReason:", objc_msgSend(v14, "highFrameRateReason"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = v7;
      objc_msgSend(v36, "animations");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v38, "copy");

      objc_msgSend(v36, "delegate");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "setDelegate:", v14);
    }
    else
    {
      v33 = (void *)objc_msgSend(v7, "copy");
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v40 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = 0;

      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v14 = *(id *)(v41 + 40);
      *(_QWORD *)(v41 + 40) = 0;
    }
  }

  objc_msgSend(v33, "setBeginTime:", 0.0);
  objc_msgSend(v33, "setBeginTimeMode:", CFSTR("relative"));

  return v33;
}

uint64_t __81__UIViewPropertyAnimator__pauseAnimation_fromStart_minimizingStateModifications___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, id *a7)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id WeakRetained;
  void *v18;
  id v19;
  char v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double *v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  double v39;
  int v41;
  void *v42;
  double v43;
  float v44;
  double v45;
  double v46;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0xBFF0000000000000;
  v46 = 1.0;
  v14 = *a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
  if (WeakRetained
    && (v18 = WeakRetained,
        v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152)),
        v20 = objc_msgSend(v19, "_isFinished"),
        v19,
        v18,
        (v20 & 1) == 0))
  {
    v25 = *(double **)(a1 + 32);
    v24 = v25[3];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_viewAnimationState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "duration");
    objc_msgSend(v21, "_unpacedFractionCompleteForAnimation:inLayer:duration:", v12, v11);
    v23 = 1.0;
    if (v22 <= 1.0)
      v23 = v22;
    if (v22 >= 0.0)
      v24 = v23;
    else
      v24 = 0.0;

    v25 = *(double **)(a1 + 32);
  }
  if (objc_msgSend(v25, "isReversed"))
    v26 = 1.0 - v24;
  else
    v26 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "animations");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_effectiveAdditiveOffsetForKey:inLayer:", v13, v11);
    v30 = 0.0;
    if (v29 < v26)
      v30 = (v26 - v29) / (1.0 - v29);

    v26 = v30;
    v12 = (id)v28;
  }
  v32 = 0.0;
  if (objc_msgSend(v11, "hasBeenCommitted") && !*(_BYTE *)(a1 + 128))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        v32 = v26;
        goto LABEL_22;
      }
    }
    else if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      goto LABEL_46;
    }
    v41 = objc_msgSend(*(id *)(a1 + 32), "_computeDisplacementFractionComplete:withKey:inLayer:fromValue:toValue:fractionComplete:displacement:", v16, v13, v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, &v46);
    objc_msgSend(*(id *)(a1 + 32), "_restoreLayerValueIfReversed:animation:toValue:", v11, v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      {
        v31 = v46;
        if (v46 != 0.0 && v41 == 1)
        {
LABEL_52:
          v45 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          if (v45 > 0.0)
            v32 = computeInverseOfTimingFunction(*(void **)(a1 + 40), v45);
          goto LABEL_22;
        }
      }
    }
LABEL_46:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                              + 24);
    }
    else if (v26 > 0.0)
    {
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v12, "timingFunction", v31);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v43 = v26;
        objc_msgSend(v42, "_solveForInput:", v43);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v44;

      }
      else
      {
        v32 = v26;
      }
    }
    goto LABEL_52;
  }
LABEL_22:
  v33 = 0.99999;
  if (v32 <= 0.99999)
    v33 = v32;
  if (v32 >= 0.0)
    v34 = v33;
  else
    v34 = 0.0;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) && !*(_BYTE *)(a1 + 129))
  {
    objc_msgSend(v14, "timingFunction", v33);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(a1 + 32);
    v37 = *(void **)(v36 + 96);
    *(_QWORD *)(v36 + 96) = v35;

  }
  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  if (!*(_BYTE *)(v38 + 24))
  {
    *(_BYTE *)(v38 + 24) = 1;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = v34;
  }
  LODWORD(v33) = 0;
  objc_msgSend(v14, "setSpeed:", v33);
  objc_msgSend(v14, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v16, "setFromValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  }
  objc_msgSend(v12, "duration");
  objc_msgSend(v14, "setTimeOffset:", v34 * v39);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v14, "setTimingFunction:");

  return 0;
}

- (void)pauseAnimationTransiently
{
  double v3;
  id v4;

  -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 4);
  -[UIViewPropertyAnimator timingFunctionForPause](self, "timingFunctionForPause");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewPropertyAnimator _pauseAnimation:fromStart:](self, "_pauseAnimation:fromStart:", v4, 0);
  self->_fractionComplete = v3;

}

- (void)_restoreLayerValueIfReversed:(id)a3 animation:(id)a4 toValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (-[UIViewPropertyAnimator isReversed](self, "isReversed"))
  {
    if (v9)
    {
      v10 = v9;
LABEL_5:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __73__UIViewPropertyAnimator__restoreLayerValueIfReversed_animation_toValue___block_invoke;
      v14[3] = &unk_1E16B47A8;
      v15 = v13;
      v16 = v10;
      v17 = v8;
      v12 = v10;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);

      goto LABEL_6;
    }
    objc_msgSend(v8, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKeyPath:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_5;
  }
LABEL_6:

}

void __73__UIViewPropertyAnimator__restoreLayerValueIfReversed_animation_toValue___block_invoke(uint64_t a1)
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

- (BOOL)_computeDisplacementFractionComplete:(id)a3 withKey:(id)a4 inLayer:(id)a5 fromValue:(id)a6 toValue:(id)a7 fractionComplete:(double *)a8 displacement:(double *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  int v56;
  void *v57;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  double v100;
  double v101[2];

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v100 = 0.0;
  v101[0] = 1.0;
  v18 = a4;
  v19 = objc_msgSend(v18, "hasSuffix:", CFSTR(".x"));
  v20 = objc_msgSend(v18, "hasSuffix:", CFSTR(".y"));
  LODWORD(a5) = objc_msgSend(v18, "hasPrefix:", CFSTR("transform"));

  v56 = (int)a5;
  if (v17)
  {
    v21 = v17;
  }
  else
  {
    objc_msgSend(v14, "keyPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKeyPath:", v22);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  v57 = v17;
  v23 = v20;
  if (v16)
  {
    v24 = v16;
    v25 = v16;
  }
  else
  {
    v24 = 0;
    objc_msgSend(v14, "keyPath");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _UIFromValueForAnimation(v14, v26, v15, v27);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "presentationLayer");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  v59 = v15;
  if (v28)
    v30 = (void *)v28;
  else
    v30 = v15;
  v31 = v14;
  objc_msgSend(v14, "keyPath");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "valueForKeyPath:", v32);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = v25;
  v36 = v35;

  if (v19)
  {
    objc_msgSend(v21, "CGPointValue");
    v38 = v37;
    objc_msgSend(v25, "CGPointValue");
    v40 = vabdd_f64(v38, v39);
    v101[0] = v40;
    objc_msgSend(v21, "CGPointValue");
    v42 = v41;
    objc_msgSend(v36, "CGPointValue");
    v44 = vabdd_f64(v42, v43);
  }
  else if (v23)
  {
    objc_msgSend(v21, "CGPointValue");
    v46 = v45;
    objc_msgSend(v25, "CGPointValue");
    v40 = vabdd_f64(v46, v47);
    v101[0] = v40;
    objc_msgSend(v21, "CGPointValue");
    v49 = v48;
    objc_msgSend(v36, "CGPointValue");
    v44 = vabdd_f64(v49, v50);
  }
  else
  {
    objc_msgSend(v21, "CA_distanceToValue:", v25);
    v40 = fabs(v51);
    v101[0] = v40;
    objc_msgSend(v21, "CA_distanceToValue:", v36);
    v44 = fabs(v52);
  }
  v100 = v44;
  if (v40 == 0.0)
  {
    v53 = -1.0;
    if (v56)
    {
      v54 = 0uLL;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      if (v25)
      {
        objc_msgSend(v25, "CATransform3DValue");
        v54 = 0uLL;
      }
      v90 = v54;
      v91 = v54;
      v88 = v54;
      v89 = v54;
      v86 = v54;
      v87 = v54;
      v84 = v54;
      v85 = v54;
      if (v21)
        objc_msgSend(v21, "CATransform3DValue");
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      if (v36)
        objc_msgSend(v36, "CATransform3DValue");
      v72 = v96;
      v73 = v97;
      v74 = v98;
      v75 = v99;
      v68 = v92;
      v69 = v93;
      v70 = v94;
      v71 = v95;
      v64 = v88;
      v65 = v89;
      v66 = v90;
      v67 = v91;
      v60 = v84;
      v61 = v85;
      v62 = v86;
      v63 = v87;
      if (_UIVPA_CATransformDisplacement(&v68, &v60, v101))
      {
        v72 = v96;
        v73 = v97;
        v74 = v98;
        v75 = v99;
        v68 = v92;
        v69 = v93;
        v70 = v94;
        v71 = v95;
        v64 = v80;
        v65 = v81;
        v66 = v82;
        v67 = v83;
        v60 = v76;
        v61 = v77;
        v62 = v78;
        v63 = v79;
        if (_UIVPA_CATransformDisplacement(&v68, &v60, &v100))
          v53 = v100 / v101[0];
      }
    }
  }
  else
  {
    v53 = fabs((v40 - v44) / v40);
  }
  if (a8)
    *a8 = v53;
  if (a9)
    *a9 = v101[0];

  return v53 != -1.0;
}

- (BOOL)_computeSmallestDisplacementFractionComplete:(double *)a3
{
  void *v5;
  char v6;
  _QWORD v8[7];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0x3FF0000000000000;
  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__UIViewPropertyAnimator__computeSmallestDisplacementFractionComplete___block_invoke;
  v8[3] = &unk_1E16B4560;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v13;
  +[UIView mapTrackedAnimations:withBlock:]((uint64_t)UIView, v5, v8);

  if (a3)
    *a3 = v10[3];
  v6 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

uint64_t __71__UIViewPropertyAnimator__computeSmallestDisplacementFractionComplete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v21;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "animationForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v10, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_originalFromValueForKey:inLayer:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 32);
    objc_msgSend(v10, "keyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_originalToValueForKey:inLayer:", v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(void **)(a1 + 32);
    v21 = 0.0;
    LODWORD(v15) = objc_msgSend(v17, "_computeDisplacementFractionComplete:withKey:inLayer:fromValue:toValue:fractionComplete:displacement:", v10, v8, v7, v13, v16, &v21, 0);
    objc_msgSend(*(id *)(a1 + 32), "_restoreLayerValueIfReversed:animation:toValue:", v7, v10, v16);
    if ((_DWORD)v15)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(double *)(v18 + 24);
      if (v19 >= v21)
        v19 = v21;
      *(double *)(v18 + 24) = v19;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  return 0;
}

- (void)_continueWithTimingParameters:(id)a3 duration:(double)a4
{
  id v7;
  void *v8;
  _BOOL4 pausedAsSpring;
  CAMediaTimingFunction *v10;
  CAMediaTimingFunction *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  CAMediaTimingFunction *timingFunctionPriorToPause;
  CAMediaTimingFunction *timingFunctionWhenPaused;
  double fractionComplete;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  float v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  _BOOL4 v33;
  double fractionCompleteWhenContinued;
  double v35;
  double v36;
  void *v37;
  void *v38;
  CAMediaTimingFunction *v39;
  id v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  id v44;
  id v45;
  double v46;
  double v47;
  _QWORD aBlock[7];
  BOOL v49;
  BOOL v50;
  unint64_t v51;
  _QWORD v52[3];
  char v53;
  _QWORD v54[3];
  char v55;

  v7 = a3;
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") != 4)
    goto LABEL_39;
  if (-[UIViewPropertyAnimator _isStarting](self, "_isStarting"))
  {
    -[UIViewPropertyAnimator addAnimations:](self, "addAnimations:", &__block_literal_global_485);
    goto LABEL_39;
  }
  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_39;
  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  pausedAsSpring = self->_pausedAsSpring;
  v10 = self->_timingFunctionPriorToPause;
  v11 = self->_timingFunctionWhenPaused;
  -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
  v13 = v12;
  -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = objc_msgSend(v14, "timingCurveType") == 2 || objc_msgSend(v15, "timingCurveType") == 3;
  else
    v16 = 0;

  v17 = v7;
  v18 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "timingCurveType") == 2)
    {

      v16 = 1;
    }
    else
    {
      v16 = objc_msgSend(v18, "timingCurveType") == 3;

    }
    mediaTimingFunctionForTimingProvider(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    mediaTimingFunctionForTimingProvider(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_pausedAsSpring = 0;
  timingFunctionPriorToPause = self->_timingFunctionPriorToPause;
  self->_timingFunctionPriorToPause = 0;

  timingFunctionWhenPaused = self->_timingFunctionWhenPaused;
  self->_timingFunctionWhenPaused = 0;

  -[UIViewPropertyAnimator _setAnimationState:](self, "_setAnimationState:", 1);
  self->_fractionCompleteWhenContinued = self->_fractionComplete;
  objc_storeStrong((id *)&self->_timingProviderWhenContinued, a3);
  self->_pausedOnCompletion = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v53 = 0;
  if (a4 != 0.0)
  {
    fractionComplete = self->_fractionComplete;
    -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
    v13 = a4 / (1.0 - fractionComplete);
    if (v24 != v13)
      -[UIViewPropertyAnimator setInternalDuration:](self, "setInternalDuration:", v13);
  }
  v25 = self->_fractionComplete;
  v26 = -[UIViewPropertyAnimator isReversed](self, "isReversed");
  v27 = 1.0 - v25;
  if (!v26)
    v27 = v25;
  *(double *)&v51 = -1.0;
  v39 = v10;
  if (!v16)
  {
    if (pausedAsSpring)
    {
      if (-[UIViewPropertyAnimator _computeSmallestDisplacementFractionComplete:](self, "_computeSmallestDisplacementFractionComplete:", &v51, v27, v10, v41))
      {
        v25 = *(double *)&v51;
LABEL_30:
        if (v20)
          v25 = computeInverseOfTimingFunction(v20, v25);
        if (-[UIViewPropertyAnimator isReversed](self, "isReversed"))
          v25 = 1.0 - v25;
        goto LABEL_34;
      }
    }
    else
    {
      *(float *)&v27 = v27;
      if (v11)
        -[CAMediaTimingFunction _solveForInput:](v11, "_solveForInput:", v27, v10, v41);
      else
        -[CAMediaTimingFunction _solveForInput:](v10, "_solveForInput:", v27, v10, v41);
      v25 = v28;
    }
    *(double *)&v51 = v25;
    goto LABEL_30;
  }
LABEL_34:
  v29 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_2;
  aBlock[3] = &unk_1E16B45A8;
  aBlock[6] = v52;
  aBlock[4] = self;
  aBlock[5] = v54;
  v49 = v16;
  v50 = pausedAsSpring;
  v30 = _Block_copy(aBlock);
  v43[0] = v29;
  v43[1] = 3221225472;
  v43[2] = __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_3;
  v43[3] = &unk_1E16B45D0;
  v43[4] = self;
  v46 = v13;
  v47 = v25;
  v44 = v18;
  v31 = v20;
  v45 = v31;
  +[UIView modifyTrackedAnimations:removeOnCompletion:animationFactory:block:]((uint64_t)UIView, v41, 0, v30, v43);
  self->_fractionComplete = v25;
  -[UIViewPropertyAnimator _animations](self, "_animations");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = -[UIViewPropertyAnimator isReversed](self, "isReversed");
    fractionCompleteWhenContinued = self->_fractionCompleteWhenContinued;
    -[UIViewPropertyAnimator internalDuration](self, "internalDuration");
    v36 = v35;
    if (!v33)
      fractionCompleteWhenContinued = 1.0 - fractionCompleteWhenContinued;
    -[UIViewPropertyAnimator _viewAnimationState](self, "_viewAnimationState", v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v29;
    v42[1] = 3221225472;
    v42[2] = __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_4;
    v42[3] = &unk_1E16B1B28;
    v42[4] = self;
    +[UIView _performWithState:trackingIdentifier:duration:delay:animations:](UIView, "_performWithState:trackingIdentifier:duration:delay:animations:", v37, v38, v42, v36 * fractionCompleteWhenContinued, 0.0);

  }
  -[UIViewPropertyAnimator _scheduleCACommitFuture](self, "_scheduleCACommitFuture", v39);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v54, 8);

LABEL_39:
}

id __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  int v24;
  int v25;
  int v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  id v58;
  void *v59;
  void *v60;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v10 + 24))
  {
    v11 = 0;
    v12 = 1;
  }
  else
  {
    v13 = objc_msgSend(v8, "hasPrefix:", CFSTR("UIPacingAnimationForAnimatorsKey"));
    v11 = v13;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v10 + 24))
      v12 = 1;
    else
      v12 = v13;
  }
  *(_BYTE *)(v10 + 24) = v12;
  v14 = v7;
  objc_opt_class();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_opt_isKindOfClass() & 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;
  v17 = v16;
  if (v16)
  {
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v16, "keyPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_originalFromValueForKey:inLayer:", v19, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = *(void **)(a1 + 32);
    objc_msgSend(v17, "keyPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_originalToValueForKey:inLayer:", v22, v9);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "keyPath");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = -[__CFString hasSuffix:](v23, "hasSuffix:", CFSTR(".origin"));
    v25 = -[__CFString hasSuffix:](v23, "hasSuffix:", CFSTR(".size"));
    v26 = v25;
    if ((v24 & 1) != 0 || v25)
    {
      if (-[__CFString hasPrefix:](v23, "hasPrefix:", CFSTR("bounds")))
      {

        v23 = CFSTR("bounds");
      }
      if (-[__CFString hasPrefix:](v23, "hasPrefix:", CFSTR("contentsRect")))
      {

        v23 = CFSTR("contentsRect");
      }
      if (-[__CFString hasPrefix:](v23, "hasPrefix:", CFSTR("contentsCenter")))
      {

        v23 = CFSTR("contentsCenter");
      }
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v26 = 0;
    v24 = 0;
    v23 = 0;
    v60 = 0;
    v20 = 0;
  }
  if (*(_BYTE *)(a1 + 56))
    v27 = v11;
  else
    v27 = 1;
  if ((v27 & 1) != 0 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 57))
      v34 = v11;
    else
      v34 = 1;
    if ((v34 & 1) != 0 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v30 = (void *)objc_msgSend(v14, "copy");
    }
    else
    {
      v35 = v8;
      v36 = (void *)MEMORY[0x1E0CD2710];
      objc_msgSend(v17, "keyPath");
      v37 = v20;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "animationWithKeyPath:", v38);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v37;
      objc_msgSend(v14, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDelegate:", v39);

      objc_msgSend(v30, "setFromValue:", v37);
      objc_msgSend(*(id *)(a1 + 32), "_viewAnimationState");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_transformIntoAdditiveAnimationAndNoteOriginal:inLayer:animationKey:", v30, v9, v35);

      v8 = v35;
      objc_msgSend(v14, "preferredFrameRateRange");
      objc_msgSend(v30, "setPreferredFrameRateRange:");
      objc_msgSend(v30, "setHighFrameRateReason:", objc_msgSend(v14, "highFrameRateReason"));
    }
    goto LABEL_44;
  }
  v59 = v20;
  v28 = (void *)MEMORY[0x1E0CD2848];
  objc_msgSend(v17, "keyPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "animationWithKeyPath:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDelegate:", v31);

  v58 = v8;
  if (objc_msgSend(*(id *)(a1 + 32), "isReversed"))
  {
    v32 = v30;
    v33 = v59;
LABEL_36:
    objc_msgSend(v32, "setToValue:", v33);
    goto LABEL_37;
  }
  if (v60)
  {
    v32 = v30;
    v33 = v60;
    goto LABEL_36;
  }
LABEL_37:
  objc_msgSend(v9, "presentationLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (!v41)
    v41 = v9;
  objc_msgSend(v41, "valueForKeyPath:", v23);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFromValue:", v43);

  if (v26)
  {
    objc_msgSend(v30, "fromValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "CGRectValue");
    v46 = v45;
    v48 = v47;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFromValue:", v49);

  }
  if (v24)
  {
    objc_msgSend(v30, "fromValue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "CGRectValue");
    v52 = v51;
    v54 = v53;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v52, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFromValue:", v55);

  }
  objc_msgSend(*(id *)(a1 + 32), "_viewAnimationState");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "_transformIntoAdditiveAnimationAndNoteOriginal:inLayer:animationKey:", v30, v9, v58);

  v8 = v58;
  objc_msgSend(v14, "preferredFrameRateRange");
  objc_msgSend(v30, "setPreferredFrameRateRange:");
  objc_msgSend(v30, "setHighFrameRateReason:", objc_msgSend(v14, "highFrameRateReason"));
  objc_msgSend(*(id *)(a1 + 32), "_setContinuedWithNewSpring:forAnimationKey:forLayer:", 1, v58, v9);
  v20 = v59;
LABEL_44:

  return v30;
}

uint64_t __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, id *a7)
{
  id v10;
  id v11;
  id v12;
  char isKindOfClass;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  int v48;
  double v49;
  id v50;
  double v52;
  double v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = *a7;
  v12 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(*(id *)(a1 + 32), "_effectiveAdditiveOffsetForKey:inLayer:", v10, v12);
  v15 = v14;

  v16 = *(double *)(a1 + 56);
  v17 = objc_msgSend(*(id *)(a1 + 32), "isReversed");
  v18 = *(double *)(a1 + 64);
  v19 = 1.0 - v15;
  v20 = (v18 - v15) / (1.0 - v15);
  v21 = v16 * (v15 - v18);
  if (v15 <= 0.0)
    v21 = 0.0;
  if (v15 <= v18)
    v21 = 0.0;
  else
    v20 = 0.0;
  v22 = v18 / v19;
  if (v17)
  {
    v23 = 0.0;
  }
  else
  {
    v22 = v20;
    v23 = v21;
  }
  v24 = v19 * v16;
  v25 = v24 * (1.0 - v22);
  if ((isKindOfClass & 1) != 0)
  {
    v26 = v11;
    v52 = 0.0;
    v53 = 0.0;
    v27 = *(void **)(a1 + 40);
    if (v27)
    {
      objc_msgSend(v27, "springTimingParameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "timingParameters");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "springTimingParameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v28, "initialVelocity", *(_QWORD *)&v52);
    v42 = v41;
    v44 = v43;
    objc_msgSend(v28, "dampingRatio");
    v46 = v45;
    objc_msgSend(v26, "keyPath");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "hasPrefix:", CFSTR("position")))
    {
      v48 = objc_msgSend(v10, "hasSuffix:", CFSTR(".y"));

      if (v48)
        v42 = v44;
    }
    else
    {

    }
    +[UIViewSpringAnimationState computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:](UIViewSpringAnimationState, "computeDerivedSpringParameters:zeta:mass:velocity:epsilon:stiffness:damping:", &v53, &v52, v25, v46, 1.0, v42, 0.001);
    objc_msgSend(v26, "setMass:", 1.0);
    objc_msgSend(v26, "setStiffness:", v53);
    objc_msgSend(v26, "setDamping:", v52);
    objc_msgSend(v26, "setVelocity:", v42);
    objc_msgSend(v26, "setDuration:", v25);
    objc_msgSend(v26, "setBeginTimeMode:", CFSTR("relative"));
    objc_msgSend(v26, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    v49 = 1.0 / *(double *)(*(_QWORD *)(a1 + 32) + 40);
    *(float *)&v49 = v49;
    objc_msgSend(v26, "setSpeed:", v49);
    objc_msgSend(v26, "setTimingFunction:", *(_QWORD *)(a1 + 48));

    goto LABEL_24;
  }
  objc_msgSend(v11, "setTimeOffset:", 0.0);
  objc_msgSend(v11, "setAutoreverses:", 0);
  objc_msgSend(v11, "setBeginTime:", v23 - (v24 - v25) * *(double *)(*(_QWORD *)(a1 + 32) + 40));
  v29 = objc_msgSend(*(id *)(a1 + 32), "isReversed");
  v30 = -1.0;
  if (!v29)
    v30 = 1.0;
  v31 = v30 / *(double *)(*(_QWORD *)(a1 + 32) + 40);
  *(float *)&v31 = v31;
  objc_msgSend(v11, "setSpeed:", v31);
  objc_msgSend(v11, "setDuration:", v24);
  objc_msgSend(v11, "setBeginTimeMode:", CFSTR("relative"));
  v32 = *MEMORY[0x1E0CD2B58];
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v11, "setTimingFunction:", *(_QWORD *)(a1 + 48));
  v26 = v11;
  if (objc_msgSend(*(id *)(a1 + 32), "isReversed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "internalDuration");
    v26 = v11;
    if (v24 < v33)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0CD2700]);
      v54[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAnimations:", v35);

      objc_msgSend(*(id *)(a1 + 32), "internalDuration");
      objc_msgSend(v34, "setDuration:");
      objc_msgSend(v34, "setBeginTimeMode:", CFSTR("relative"));
      objc_msgSend(v11, "beginTime");
      objc_msgSend(v34, "setBeginTime:");
      objc_msgSend(v11, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDelegate:", v36);

      objc_msgSend(v34, "setFillMode:", v32);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTimingFunction:", v37);

      v38 = 1.0 / *(double *)(*(_QWORD *)(a1 + 32) + 40);
      *(float *)&v38 = v38;
      objc_msgSend(v34, "setSpeed:", v38);
      v26 = v34;

      objc_msgSend(v11, "setBeginTime:", 0.0);
      objc_msgSend(v11, "setDelegate:", 0);
      LODWORD(v39) = -1.0;
      objc_msgSend(v11, "setSpeed:", v39);
LABEL_24:

    }
  }
  v50 = objc_retainAutorelease(v26);
  *a7 = v50;

  return 0;
}

uint64_t __65__UIViewPropertyAnimator__continueWithTimingParameters_duration___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAnimations");
}

- (void)continueAnimationWithTimingParameters:(id)parameters durationFactor:(CGFloat)durationFactor
{
  double v7;
  void *v8;
  id v9;

  v9 = parameters;
  if (!-[UIViewPropertyAnimator isInterruptible](self, "isInterruptible"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 3147, CFSTR("An animator %@ that is not interruptible cannot be continued or reversed!"), self);

  }
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    -[UIViewPropertyAnimator unitDuration](self, "unitDuration");
    -[UIViewPropertyAnimator _continueWithTimingParameters:duration:](self, "_continueWithTimingParameters:duration:", v9, v7 * durationFactor);
    -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", 1);
  }

}

- (void)continueAnimation
{
  -[UIViewPropertyAnimator continueAnimationWithTimingParameters:durationFactor:](self, "continueAnimationWithTimingParameters:durationFactor:", 0, 0.0);
}

- (void)_scheduleCACommitFuture
{
  _UIAppCACommitFuture **p_caContinuationCommitFuture;
  id WeakRetained;
  id v4;
  id v5;

  p_caContinuationCommitFuture = &self->_caContinuationCommitFuture;
  WeakRetained = objc_loadWeakRetained((id *)&self->_caContinuationCommitFuture);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_caContinuationCommitFuture);
    objc_msgSend(v4, "invalidate");

  }
  +[_UIAppCACommitFuture scheduledPostCommitFuture:](_UIAppCACommitFuture, "scheduledPostCommitFuture:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)p_caContinuationCommitFuture, v5);

}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAnimationForKey:");
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) != a2)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  return 0;
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "animationDidStop:finished:", v8, 0);

        objc_msgSend(v7, "sendDelegateDidStopManually:", 0);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v9 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animationDidStop:finished:", v10, 0);

  return objc_msgSend(*(id *)(a1 + 40), "sendDelegateDidStopManually:", 0);
}

uint64_t __63__UIViewPropertyAnimator_finalizeStoppedAnimationWithPosition___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (double)computeCurrentTimingFunction:(double)a3
{
  int64_t v5;
  UITimingCurveProvider *timingProviderWhenContinued;
  UITimingCurveProvider *v7;
  CAMediaTimingFunction *timingFunctionWhenPaused;
  CAMediaTimingFunction *v9;
  double v10;
  double v11;
  float v12;

  v5 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
  if ((unint64_t)(v5 - 1) < 3)
  {
LABEL_2:
    timingProviderWhenContinued = self->_timingProviderWhenContinued;
    if (timingProviderWhenContinued)
    {
      v7 = timingProviderWhenContinued;
    }
    else
    {
      -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
      v7 = (UITimingCurveProvider *)objc_claimAutoreleasedReturnValue();
    }
    v9 = (CAMediaTimingFunction *)v7;
    -[UIViewPropertyAnimator duration](self, "duration");
    a3 = computeTimingProvider(v9, v11, a3);
    goto LABEL_11;
  }
  if (v5 == 4)
  {
    timingFunctionWhenPaused = self->_timingFunctionWhenPaused;
    if (timingFunctionWhenPaused)
    {
      v9 = timingFunctionWhenPaused;
    }
    else
    {
      v9 = self->_timingFunctionPriorToPause;
      if (!v9)
        goto LABEL_2;
    }
    *(float *)&v10 = a3;
    -[CAMediaTimingFunction _solveForInput:](v9, "_solveForInput:", v10);
    a3 = v12;
LABEL_11:

  }
  return a3;
}

- (double)computeInverseOfCurrentTimingFunction:(double)a3
{
  int64_t v5;
  UITimingCurveProvider *timingProviderWhenContinued;
  UITimingCurveProvider *v7;
  CAMediaTimingFunction *v8;
  CAMediaTimingFunction *v9;
  double v10;
  double v11;
  UITimingCurveProvider *v13;
  UITimingCurveProvider *v14;
  UITimingCurveProvider *v15;
  double v16;

  v5 = -[UIViewPropertyAnimator _animationState](self, "_animationState");
  if ((unint64_t)(v5 - 1) < 3)
  {
    timingProviderWhenContinued = self->_timingProviderWhenContinued;
    if (timingProviderWhenContinued)
    {
      v7 = timingProviderWhenContinued;
    }
    else
    {
      -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
      v7 = (UITimingCurveProvider *)objc_claimAutoreleasedReturnValue();
    }
    v9 = (CAMediaTimingFunction *)v7;
    -[UIViewPropertyAnimator duration](self, "duration");
    v10 = computeInverseOfTimingProvider(v9, v11, a3);
    goto LABEL_9;
  }
  if (v5 == 4)
  {
    v8 = self->_timingFunctionWhenPaused;
    if (!v8)
    {
      v13 = self->_timingProviderWhenContinued;
      if (v13)
      {
        v14 = v13;
      }
      else
      {
        -[UIViewPropertyAnimator timingParameters](self, "timingParameters");
        v14 = (UITimingCurveProvider *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      -[UIViewPropertyAnimator duration](self, "duration");
      a3 = computeInverseOfTimingProvider(v15, v16, a3);

      v9 = 0;
      goto LABEL_10;
    }
    v9 = v8;
    v10 = computeInverseOfTimingFunction(v8, a3);
LABEL_9:
    a3 = v10;
LABEL_10:

  }
  return a3;
}

- (double)pacedFractionComplete
{
  double result;

  -[UIViewPropertyAnimator fractionComplete](self, "fractionComplete");
  if (result > 0.00001 && result < 0.99999)
    -[UIViewPropertyAnimator computeCurrentTimingFunction:](self, "computeCurrentTimingFunction:");
  return result;
}

- (void)setPacedFractionComplete:(double)a3
{
  if (a3 > 0.00001 && a3 < 0.99999)
    -[UIViewPropertyAnimator computeInverseOfCurrentTimingFunction:](self, "computeInverseOfCurrentTimingFunction:");
  -[UIViewPropertyAnimator setFractionComplete:](self, "setFractionComplete:");
}

- (void)_updateAnimationsToFractionComplete:(double)a3
{
  void *v5;
  _QWORD v6[6];

  if (-[UIViewPropertyAnimator isReversed](self, "isReversed"))
    a3 = 1.0 - a3;
  -[UIViewPropertyAnimator _trackingIdentifier](self, "_trackingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__UIViewPropertyAnimator__updateAnimationsToFractionComplete___block_invoke;
  v6[3] = &unk_1E16B4680;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  +[UIView modifyTrackedAnimations:removeOnCompletion:animationFactory:block:]((uint64_t)UIView, v5, 0, 0, v6);

}

uint64_t __62__UIViewPropertyAnimator__updateAnimationsToFractionComplete___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void **a7)
{
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  id v32;

  v11 = a4;
  v12 = *a7;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(*(id *)(a1 + 32), "_effectiveAdditiveOffsetForKey:inLayer:", v13, v14);
  v17 = v16;

  if (v17 <= 0.0)
  {
    v28 = *(double *)(a1 + 40);
    v29 = v15;
    goto LABEL_10;
  }
  v18 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v18 + 165) || !*(_QWORD *)(v18 + 96) || (v19 = *(void **)(v18 + 104)) == 0)
  {
    v30 = *(double *)(a1 + 40);
    v23 = 0.0;
    if (v30 <= v17)
      goto LABEL_12;
    v28 = (v30 - v17) / (1.0 - v17);
    v29 = v11;
LABEL_10:
    objc_msgSend(v29, "duration");
    v26 = v31;
    goto LABEL_11;
  }
  v20 = *(double *)(a1 + 40);
  *(float *)&v20 = v20;
  objc_msgSend(v19, "_solveForInput:", v20);
  v22 = computeInverseOfTimingFunction(*(void **)(*(_QWORD *)(a1 + 32) + 96), v21);
  v23 = 0.0;
  if (v22 > v17)
  {
    v24 = (v22 - v17) / (1.0 - v17);
    *(float *)&v24 = v24;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "_solveForInput:", v24);
    v26 = v25;
    objc_msgSend(v11, "duration");
    v28 = v27;
LABEL_11:
    v23 = v26 * v28;
  }
LABEL_12:
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v15, "setTimeOffset:", v23);
  v32 = objc_retainAutorelease(v15);
  *a7 = v32;

  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    -[UIViewPropertyAnimator _setKVOCompliantReversed:](self, "_setKVOCompliantReversed:", objc_msgSend(v9, "isReversed"));
    -[UIViewPropertyAnimator _setKVOCompliantRunning:](self, "_setKVOCompliantRunning:", objc_msgSend(v9, "isRunning"));
    v11 = objc_msgSend(v9, "_animationState");
    if (v11)
      -[UIViewPropertyAnimator _setKVOCompliantState:](self, "_setKVOCompliantState:", v11);
  }

}

void __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_viewAnimationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_5;
  v4[3] = &unk_1E16B1B28;
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  +[UIView _performWithState:trackingIdentifier:duration:delay:animations:](UIView, "_performWithState:trackingIdentifier:duration:delay:animations:", v2, v3, v4, -1.0, -1.0);

}

uint64_t __49__UIViewPropertyAnimator_startAnimationAsPaused___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAnimations");
}

- (void)startAnimationAfterDelay:(double)a3
{
  void *v6;

  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewPropertyAnimator.m"), 3585, CFSTR("A paused animator (%@) cannot be started with a delay!"), self);

  }
  if (a3 < 0.0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The delay should be greater than or equal to zero."));
  self->_delay = a3;
  -[UIViewPropertyAnimator startAnimation](self, "startAnimation");
}

- (void)interactionProgressDidUpdate:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIViewPropertyAnimator _animationState](self, "_animationState") == 4)
  {
    objc_msgSend(v4, "percentComplete");
    -[UIViewPropertyAnimator setFractionComplete:](self, "setFractionComplete:");
  }

}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  objc_msgSend(a3, "removeProgressObserver:", self);
  -[UIViewPropertyAnimator setReversed:](self, "setReversed:", !v4);
  -[UIViewPropertyAnimator continueAnimation](self, "continueAnimation");
}

- (void)setInternalDuration:(double)a3
{
  self->_internalDuration = a3;
}

- (void)_setTrackingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trackingIdentifier, a3);
}

- (BOOL)_shouldBeginFromCurrentState
{
  return self->_shouldBeginFromCurrentState;
}

- (NSString)_name
{
  return self->_name;
}

- (void)set_name:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setManualHitTestingEnabled:(BOOL)manualHitTestingEnabled
{
  self->_manualHitTestingEnabled = manualHitTestingEnabled;
}

- (BOOL)scrubsLinearly
{
  return self->_scrubsLinearly;
}

- (unint64_t)_options
{
  return self->_options;
}

- (BOOL)_isPausedOnCompletion
{
  return self->_pausedOnCompletion;
}

- (void)_setPausedOnCompletion:(BOOL)a3
{
  self->_pausedOnCompletion = a3;
}

- (void)setIntrospectable:(BOOL)a3
{
  self->_introspectable = a3;
}

@end
