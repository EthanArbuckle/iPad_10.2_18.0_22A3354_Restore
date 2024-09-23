@implementation UIGestureRecognizer

- (BOOL)_isExcludedByExcludable:(id)a3
{
  UIGestureRecognizer *v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  uint64_t v8;

  v4 = (UIGestureRecognizer *)a3;
  v5 = (uint64_t)v4;
  LOBYTE(WeakRetained) = 0;
  if (v4 != self)
  {
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v4->_container);

      if (WeakRetained)
      {
        if ((unint64_t)(*(_QWORD *)(v5 + 72) - 1) > 2)
          goto LABEL_22;
        if (!objc_msgSend(*(id *)(v5 + 176), "intersectsSet:", self->_activeEvents))
          goto LABEL_22;
        v7 = objc_msgSend((id)v5, "_shouldDelayUntilForceLevelRequirementIsMet");
        v8 = *(_QWORD *)(v5 + 8);
        if (v7)
        {
          if ((v8 & 0x80000000000) == 0)
            goto LABEL_22;
        }
        if ((v8 & 0x800000000000) == 0
          && (-[UIGestureEnvironment unmetRequirementsForGestureRecognizer:](*(_QWORD *)(v5 + 256), v5) & 1) != 0
          || !-[UIGestureRecognizer _affectedByGesture:](self, "_affectedByGesture:", v5))
        {
          goto LABEL_22;
        }
        if ((*(_QWORD *)&self->_gestureFlags & 0x400000000) != 0 && (unint64_t)(self->_state - 1) <= 2)
        {
          if (!-[UIGestureRecognizer _delegateCanBeCancelledByGestureRecognizer:]((uint64_t)self, v5)
            || (-[UIGestureRecognizer _delegateCanCancelGestureRecognizer:](v5, (uint64_t)self) & 1) == 0)
          {
LABEL_22:
            LOBYTE(WeakRetained) = 0;
            goto LABEL_23;
          }
        }
        else if ((-[UIGestureEnvironment gestureRecognizer:requiresGestureRecognizerToFail:]((uint64_t)self->_gestureEnvironment, v5, (uint64_t)self) & 1) != 0|| !objc_msgSend((id)v5, "canPreventGestureRecognizer:", self)|| !-[UIGestureRecognizer canBePreventedByGestureRecognizer:](self, "canBePreventedByGestureRecognizer:", v5)|| !-[UIGestureRecognizer _delegateCanBePreventedByGestureRecognizer:]((uint64_t)self, v5)|| (-[UIGestureRecognizer _delegateCanPreventGestureRecognizer:](v5, (uint64_t)self) & 1) == 0)
        {
          goto LABEL_22;
        }
        LOBYTE(WeakRetained) = 1;
      }
    }
  }
LABEL_23:

  return (char)WeakRetained;
}

- (BOOL)_affectedByGesture:(id)a3
{
  id WeakRetained;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!self)
  {
    WeakRetained = 0;
    if (a3)
      goto LABEL_3;
LABEL_18:
    v7 = 0;
    v8 = 0;
    goto LABEL_14;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  if (!a3)
    goto LABEL_18;
LABEL_3:
  v6 = objc_loadWeakRetained((id *)a3 + 6);
  v7 = v6;
  v8 = 0;
  if (WeakRetained && v6)
  {
    if (self && (*(_QWORD *)&self->_gestureFlags & 0x1000000000000) != 0
      || (*((_QWORD *)a3 + 1) & 0x1000000000000) != 0)
    {
      v9 = -[UIGestureRecognizer view](self, "view");
      v10 = (id)objc_msgSend(a3, "view");
      v8 = 0;
      if (v9)
      {
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v9, "_window");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "windowScene");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_window");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "windowScene");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v13 == v15;

        }
      }
    }
    else if (v6 == WeakRetained)
    {
      v8 = 1;
      v7 = WeakRetained;
    }
    else if ((isDescendantOfContainer(WeakRetained, v6, 0) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v8 = isDescendantOfContainer(v7, WeakRetained, 0);
    }
  }
LABEL_14:

  return v8;
}

- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet
{
  return self->_requiredPreviewForceState != 0;
}

- (BOOL)_canExcludeOtherExcludables
{
  UIGestureRecognizer *v2;
  _BOOL4 v3;
  uint64_t gestureFlags;

  if (self)
  {
    v2 = self;
    if ((unint64_t)(self->_state - 1) <= 2
      && ((v3 = -[UIGestureRecognizer _shouldDelayUntilForceLevelRequirementIsMet](self, "_shouldDelayUntilForceLevelRequirementIsMet"), gestureFlags = (uint64_t)v2->_gestureFlags, !v3)|| (gestureFlags & 0x80000000000) != 0))
    {
      if ((gestureFlags & 0x800000000000) != 0)
        LOBYTE(self) = 1;
      else
        LOBYTE(self) = -[UIGestureEnvironment unmetRequirementsForGestureRecognizer:]((uint64_t)v2->_gestureEnvironment, (uint64_t)v2) ^ 1;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (uint64_t)_delegateCanBePreventedByGestureRecognizer:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  v5 = WeakRetained;
  v6 = *(_QWORD *)(a1 + 8);
  if ((v6 & 4) != 0)
  {
    if (!objc_msgSend(WeakRetained, "gestureRecognizer:canBePreventedByGestureRecognizer:", a1, a2))
      goto LABEL_10;
    v6 = *(_QWORD *)(a1 + 8);
  }
  if ((v6 & 0x1000) == 0)
    goto LABEL_8;
  if (objc_msgSend(v5, "_gestureRecognizer:canBePreventedByGestureRecognizer:", a1, a2))
  {
    v6 = *(_QWORD *)(a1 + 8);
LABEL_8:
    if ((v6 & 8) != 0)
    {
      if ((objc_msgSend(v5, "gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", a1, a2) & 1) != 0)
        goto LABEL_10;
      v6 = *(_QWORD *)(a1 + 8);
    }
    if ((v6 & 0x2000) != 0)
      v7 = objc_msgSend(v5, "_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", a1, a2) ^ 1;
    else
      v7 = 1;
    goto LABEL_15;
  }
LABEL_10:
  v7 = 0;
LABEL_15:

  return v7;
}

- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventingGestureRecognizer
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer
{
  return 1;
}

- (uint64_t)_delegateCanPreventGestureRecognizer:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  v5 = WeakRetained;
  v6 = *(_QWORD *)(a1 + 8);
  if ((v6 & 2) != 0)
  {
    if (!objc_msgSend(WeakRetained, "gestureRecognizer:canPreventGestureRecognizer:", a1, a2))
      goto LABEL_9;
    v6 = *(_QWORD *)(a1 + 8);
  }
  if ((v6 & 0x800) == 0)
    goto LABEL_7;
  if (!objc_msgSend(v5, "_gestureRecognizer:canPreventGestureRecognizer:", a1, a2))
  {
LABEL_9:
    v7 = 0;
    goto LABEL_14;
  }
  v6 = *(_QWORD *)(a1 + 8);
LABEL_7:
  if ((v6 & 8) != 0)
  {
    if ((objc_msgSend(v5, "gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", a1, a2) & 1) != 0)
      goto LABEL_9;
    v6 = *(_QWORD *)(a1 + 8);
  }
  if ((v6 & 0x2000) != 0)
    v7 = objc_msgSend(v5, "_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", a1, a2) ^ 1;
  else
    v7 = 1;
LABEL_14:

  return v7;
}

- (int64_t)_recognitionEvent
{
  void *v2;
  int64_t v3;

  objc_getAssociatedObject(self, sel__recognitionEvent);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return 0;
}

- (void)_exclude
{
  int64_t state;
  int64_t v3;

  if (self)
  {
    state = self->_state;
    if ((unint64_t)(state - 1) < 3)
      goto LABEL_4;
  }
  else
  {
    state = MEMORY[0x48];
  }
  if (state != 4)
  {
    v3 = 5;
    goto LABEL_8;
  }
LABEL_4:
  v3 = 4;
  if ((*(_QWORD *)&self->_gestureFlags & 0x400000000) == 0)
    v3 = 5;
LABEL_8:
  self->_state = v3;
  -[UIGestureEnvironment setGestureNeedsUpdate:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
}

- (UIView)view
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  viewFromContainer(WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)_needsDynamicFailureRequirementForGestureRecognizer:(id)a3
{
  id WeakRetained;
  uint64_t gestureFlags;
  char v5;
  id v8;

  gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x10000000000) == 0)
    return 0;
  if ((gestureFlags & 0x400000) != 0)
  {
    if (-[UIGestureRecognizer shouldRequireFailureOfGestureRecognizer:](self, "shouldRequireFailureOfGestureRecognizer:", a3))
    {
      return 1;
    }
    gestureFlags = (uint64_t)self->_gestureFlags;
  }
  if ((gestureFlags & 0x80) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_msgSend(WeakRetained, "gestureRecognizer:shouldRequireFailureOfGestureRecognizer:", self, a3) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_15;
    }
    if ((*(_QWORD *)&self->_gestureFlags & 0x20000) == 0)
    {
      v5 = 0;
      goto LABEL_15;
    }
LABEL_14:
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(v8, "_gestureRecognizer:shouldRequireFailureOfGestureRecognizer:", self, a3);

    if ((gestureFlags & 0x80) == 0)
      return v5;
LABEL_15:

    return v5;
  }
  if ((gestureFlags & 0x20000) != 0)
    goto LABEL_14;
  return 0;
}

- (BOOL)_needsDynamicDependentRequirementForGestureRecognizer:(id)a3
{
  id WeakRetained;
  char v4;
  uint64_t gestureFlags;
  id v8;

  if ((*((_QWORD *)a3 + 1) & 0x10000000000) == 0)
    return 0;
  gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x800000) != 0)
  {
    if (-[UIGestureRecognizer shouldBeRequiredToFailByGestureRecognizer:](self, "shouldBeRequiredToFailByGestureRecognizer:", a3))
    {
      return 1;
    }
    gestureFlags = (uint64_t)self->_gestureFlags;
  }
  if ((gestureFlags & 0x100) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_msgSend(WeakRetained, "gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:", self, a3) & 1) != 0)
    {
      v4 = 1;
      goto LABEL_15;
    }
    if ((*(_QWORD *)&self->_gestureFlags & 0x40000) == 0)
    {
      v4 = 0;
      goto LABEL_15;
    }
LABEL_14:
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_msgSend(v8, "_gestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:", self, a3);

    if ((gestureFlags & 0x100) == 0)
      return v4;
LABEL_15:

    return v4;
  }
  if ((gestureFlags & 0x40000) != 0)
    goto LABEL_14;
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
  return 0;
}

- (BOOL)_requiresSystemGesturesToFail
{
  return (*(_QWORD *)&self->_gestureFlags >> 39) & 1;
}

- (UIGestureRecognizerState)state
{
  return self->_state;
}

- (void)_requiredGestureRecognizerCompletedOrWasUnrelated:(uint64_t)a1
{
  uint64_t v3;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 72);
    if (v3 > 3)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "count")
        && (-[UIGestureEnvironment unmetRequirementsForGestureRecognizer:](*(_QWORD *)(a1 + 256), a1) & 1) == 0)
      {
        -[UIGestureRecognizer _enqueueDelayedTouchesToSend](a1);
        -[UIGestureRecognizer _enqueueDelayedPressesToSend](a1);
      }
      -[UIGestureRecognizer _ignoreActiveEvents]((id *)a1);
    }
    else
    {
      if (a2 && (unint64_t)(a2[9] - 1) <= 2)
      {
        -[UIGestureRecognizer _ignoreActiveEvents]((id *)a1);
        v5 = _requiredGestureRecognizerCompletedOrWasUnrelated____s_category;
        if (!_requiredGestureRecognizerCompletedOrWasUnrelated____s_category)
        {
          v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&_requiredGestureRecognizerCompletedOrWasUnrelated____s_category);
        }
        if ((*(_BYTE *)v5 & 1) != 0)
        {
          v13 = *(NSObject **)(v5 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = v13;
            objc_msgSend((id)a1, "_briefDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a2, "_briefDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 138412546;
            v18 = v15;
            v19 = 2112;
            v20 = v16;
            _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@: Failing due to recognition of %@", (uint8_t *)&v17, 0x16u);

          }
        }
        if ((unint64_t)(*(_QWORD *)(a1 + 72) - 1) > 3)
        {
          v3 = 5;
        }
        else
        {
          v3 = 4;
          if ((*(_QWORD *)(a1 + 8) & 0x400000000) == 0)
            v3 = 5;
        }
        *(_QWORD *)(a1 + 72) = v3;
      }
      v6 = v3 <= 1;
      v7 = v3 - 1;
      v8 = *(_QWORD *)(a1 + 8);
      v9 = !v6 && (v8 & 0x1400000000) == 0x1000000000;
      v10 = 0x2000000000;
      if (!v9)
        v10 = 0;
      v11 = (v8 & 0x400000000) != 0 || v7 >= 3;
      v12 = 0x4000000000;
      if (v11)
        v12 = 0;
      *(_QWORD *)(a1 + 8) = v12 | v8 & 0xFFFFFF9FFFFFFFFFLL | v10;
      -[UIGestureEnvironment setGestureNeedsUpdate:](*(_QWORD *)(a1 + 256), a1);
    }
  }
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
  return 0;
}

- (void)setView:(id)a3
{
  id WeakRetained;

  if ((*((char *)&self->_gestureFlags + 8) & 0x8000000000000000) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_container);

    if (WeakRetained != a3)
      -[UIGestureRecognizer _updateContainer:]((uint64_t)self, a3);
  }
}

- (void)setGestureEnvironment:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 256), a2);
}

- (id)_failureDependents
{
  if (a1)
    a1 = (id *)a1[21];
  return a1;
}

- (BOOL)_wantsPartialTouchSequences
{
  return 0;
}

- (void)requireGestureRecognizerToFail:(UIGestureRecognizer *)otherGestureRecognizer
{
  NSMutableSet *failureRequirements;
  NSMutableSet *Mutable;
  NSMutableSet *v7;
  NSMutableSet *failureDependents;
  NSMutableSet *v9;
  NSMutableSet *v10;
  _QWORD block[5];

  if (otherGestureRecognizer == self)
  {
    if (dyld_program_sdk_at_least())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__UIGestureRecognizer_requireGestureRecognizerToFail___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = otherGestureRecognizer;
      if (requireGestureRecognizerToFail__once != -1)
        dispatch_once(&requireGestureRecognizerToFail__once, block);
    }
  }
  else if ((*(_QWORD *)&self->_gestureFlags & 0x10000000000) != 0
         && (!dyld_program_sdk_at_least()
          || -[UIGestureRecognizer _acceptsFailureRequirements](otherGestureRecognizer, "_acceptsFailureRequirements")))
  {
    -[UIGestureEnvironment addRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
    failureRequirements = self->_failureRequirements;
    if (!failureRequirements)
    {
      Mutable = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
      v7 = self->_failureRequirements;
      self->_failureRequirements = Mutable;

      failureRequirements = self->_failureRequirements;
    }
    -[NSMutableSet addObject:](failureRequirements, "addObject:", otherGestureRecognizer);
    if (otherGestureRecognizer)
    {
      failureDependents = otherGestureRecognizer->_failureDependents;
      if (!failureDependents)
      {
        v9 = (NSMutableSet *)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
        v10 = otherGestureRecognizer->_failureDependents;
        otherGestureRecognizer->_failureDependents = v9;

        failureDependents = otherGestureRecognizer->_failureDependents;
      }
      -[NSMutableSet addObject:](failureDependents, "addObject:", self);
    }
  }
}

- (BOOL)_acceptsFailureRequirements
{
  return (*(_QWORD *)&self->_gestureFlags >> 40) & 1;
}

- (void)_componentsBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  double v8;
  void *v9;

  -[UIGestureRecognizer _addActiveEvent:]((uint64_t)self, (uint64_t)a4);
  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  v7 = objc_msgSend(a4, "type");
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _addActiveTouches:]((uint64_t)self, (uint64_t)a3);
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((_BYTE *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        -[UIGestureRecognizer _driver](self, "_driver");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "touchesBegan:withEvent:", a3, a4);

      }
      -[UIGestureRecognizer touchesBegan:withEvent:](self, "touchesBegan:withEvent:", a3, a4);
      if ((*(_QWORD *)&self->_gestureFlags & 0x4000000) != 0)
        objc_msgSend((id)UIApp, "_registerEstimatedTouches:event:forTouchable:", a3, a4, self);
      break;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      return;
    case 3:
    case 4:
      -[UIGestureRecognizer pressesBegan:withEvent:](self, "pressesBegan:withEvent:", a3, a4);
      break;
    case 9:
      if ((~*(_QWORD *)&self->_gestureFlags & 0x300000000000) != 0)
        return;
      -[UIGestureRecognizer _draggingEnteredWithEvent:](self, "_draggingEnteredWithEvent:", a4);
      break;
    case 11:
      if ((*(_QWORD *)&self->_gestureFlags & 0x800000000000000) == 0)
        return;
      -[UIGestureRecognizer _addActiveTouches:]((uint64_t)self, (uint64_t)a3);
      -[UIGestureRecognizer _hoverEntered:withEvent:](self, "_hoverEntered:withEvent:", a3, a4);
      break;
    default:
      if (v7 != 16 || (*(_QWORD *)&self->_gestureFlags & 0x4000000000000000) == 0)
        return;
      -[UIGestureRecognizer _dynamicButtonsBegan:withEvent:](self, "_dynamicButtonsBegan:withEvent:", a3, a4);
      break;
  }
  if (self->_firstEventTimestamp == 0.0)
  {
    objc_msgSend(a4, "timestamp");
    self->_firstEventTimestamp = v8;
  }
}

- (void)_updateGestureForActiveEvents
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v1 = a1;
  v2 = *((id *)v1 + 33);
  objc_msgSend(v1, "_updateForActiveEvents");
  objc_msgSend(v1, "_activeEventOfType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_activeEventOfType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIGestureEnvironment unmetRequirementsForGestureRecognizer:](*((_QWORD *)v1 + 32), (uint64_t)v1);
  if (objc_msgSend(v1, "_shouldDelayUntilForceLevelRequirementIsMet"))
    v6 = (*((_QWORD *)v1 + 1) >> 43) & 1;
  else
    LOBYTE(v6) = 1;
  v7 = v5 | v6 ^ 1;
  objc_msgSend(v3, "timestamp");
  *((_QWORD *)v1 + 7) = v8;
  v9 = *((_QWORD *)v1 + 9);
  if ((unint64_t)(v9 - 1) <= 2)
  {
    if ((v7 & 1) == 0)
    {
      v10 = *((_BYTE *)v1 + 16);
      v11 = *((_QWORD *)v1 + 1);
      if (v9 == 1 && (v11 & 0x400000000) != 0)
      {
        v12 = _updateGestureForActiveEvents___s_category;
        if (!_updateGestureForActiveEvents___s_category)
        {
          v12 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&_updateGestureForActiveEvents___s_category);
        }
        if ((*(_BYTE *)v12 & 1) != 0)
        {
          v21 = *(NSObject **)(v12 + 8);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            objc_msgSend(v1, "_briefDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138412802;
            v25 = v23;
            v26 = 2112;
            v27 = CFSTR("Began");
            v28 = 2112;
            v29 = CFSTR("Changed");
            _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "%@: Automatically moving a gesture from state %@ to state %@ because another event was received.", (uint8_t *)&v24, 0x20u);

          }
        }
        objc_msgSend(v1, "setState:", 2);
        v11 = *((_QWORD *)v1 + 1);
        v10 = *((_BYTE *)v1 + 16);
      }
      if ((v11 & 0x4000000000) != 0)
      {
        *((_QWORD *)v1 + 1) = v11 & 0xFFFFFFBFFFFFFFFFLL;
        *((_BYTE *)v1 + 16) = v10;
        objc_msgSend(v1, "_willBeginAfterSatisfyingFailureRequirements");
        v11 = *((_QWORD *)v1 + 1);
        if ((v11 & 0x400000000) != 0)
        {
LABEL_15:
          if ((v11 & 0x2000000000) == 0)
            goto LABEL_34;
LABEL_29:
          v14 = *((_QWORD *)v1 + 9);
          if (v14 >= 2)
          {
            *((_QWORD *)v1 + 9) = 1;
            _UIGestureRecognizerSendActions((uint64_t)v1, 1);
            v15 = *((_QWORD *)v1 + 9);
            if (v15 == 1)
            {
              *((_QWORD *)v1 + 9) = v14;
              v15 = v14;
            }
            if (v15 == 2)
              goto LABEL_37;
            v16 = 1;
            goto LABEL_36;
          }
LABEL_34:
          if ((objc_msgSend(v1, "_isPaused") & 1) != 0)
          {
LABEL_37:
            if ((*((_QWORD *)v1 + 1) & 0x20000000) != 0)
            {
              v17 = (void *)*((_QWORD *)v1 + 4);
              objc_msgSend(v3, "touchesForGestureRecognizer:", v1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIGestureDelayedEventComponentDispatcher cancelDelayedTouches:touches:fromEvent:]((uint64_t)v2, v17, v18, v3);

              v19 = (void *)*((_QWORD *)v1 + 5);
              objc_msgSend(v4, "pressesForGestureRecognizer:", v1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIGestureDelayedEventComponentDispatcher cancelDelayedPresses:presses:fromEvent:]((uint64_t)v2, v19, v20, v4);

            }
            -[UIGestureRecognizer _clearDelayedTouches]((uint64_t)v1);
            -[UIGestureRecognizer _clearDelayedPresses]((uint64_t)v1);
            goto LABEL_40;
          }
          v16 = 0;
LABEL_36:
          _UIGestureRecognizerSendActions((uint64_t)v1, v16);
          goto LABEL_37;
        }
      }
      else if ((v11 & 0x400000000) != 0)
      {
        goto LABEL_15;
      }
      objc_msgSend(*((id *)v1 + 19), "receiveObservedValue:", MEMORY[0x1E0C9AAB0]);
      if ((*((_QWORD *)v1 + 1) & 0x2000000000) == 0)
        goto LABEL_34;
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (v9 == 4)
  {
    if ((*((_QWORD *)v1 + 1) & 0x400000000) != 0)
      _UIGestureRecognizerSendActions((uint64_t)v1, 0);
LABEL_26:
    -[UIGestureRecognizer _enqueueDelayedTouchesToSend]((uint64_t)v1);
    -[UIGestureRecognizer _enqueueDelayedPressesToSend]((uint64_t)v1);
    goto LABEL_40;
  }
  if (v9 == 5)
  {
    if ((*((_QWORD *)v1 + 1) & 0x200) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)v1 + 29);
      objc_msgSend(WeakRetained, "_gestureRecognizerFailed:", v1);

    }
    objc_msgSend(*((id *)v1 + 19), "receiveObservedValue:", MEMORY[0x1E0C9AAA0]);
    if ((v7 & 1) != 0)
      goto LABEL_40;
    goto LABEL_26;
  }
LABEL_23:
  -[UIGestureRecognizer _delayTouchesForEventIfNeeded:]((uint64_t)v1, v3);
  -[UIGestureRecognizer _delayPressesForEventIfNeeded:]((uint64_t)v1, v4);
LABEL_40:
  if (*((uint64_t *)v1 + 9) >= 3)
  {
    if ((v5 & 1) == 0)
      -[UIGestureRecognizer _ignoreActiveEvents]((id *)v1);
    objc_msgSend(*((id *)v1 + 15), "receiveObservedValue:", 0);
  }

}

- (id)_activeTouchesEvent
{
  if (a1)
  {
    objc_msgSend(a1, "_activeEventOfType:", 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  UIGestureRecognizer *v5;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  int64_t initialTouchType;
  _BYTE *v18;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  id v25;
  int v26;
  id WeakRetained;
  void *v28;
  uint64_t gestureFlags;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  char v37;
  void *v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  char *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v5 = self;
  v65 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if (-[UIGestureRecognizer requiresExclusiveTouchType](self, "requiresExclusiveTouchType", a3, a4, a5)
      && (*(_QWORD *)&v5->_gestureFlags & 0x40000000000) != 0)
    {
      v16 = objc_msgSend(a3, "type");
      initialTouchType = v5->_initialTouchType;
      v8 = v16 == initialTouchType;
      v18 = (_BYTE *)qword_1ECD7E098;
      if (!qword_1ECD7E098)
      {
        v18 = (_BYTE *)(__UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
        atomic_store((unint64_t)v18, (unint64_t *)&qword_1ECD7E098);
      }
      if ((*v18 & 1) != 0 && v16 != initialTouchType)
      {
        v19 = qword_1ECD7E0A0;
        if (!qword_1ECD7E0A0)
        {
          v19 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v19, (unint64_t *)&qword_1ECD7E0A0);
        }
        if ((*(_BYTE *)v19 & 1) != 0)
        {
          v51 = *(NSObject **)(v19 + 8);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = v51;
            -[UIGestureRecognizer _briefDescription](v5, "_briefDescription");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5->_initialTouchType);
            v54 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v60 = v53;
            v61 = 2112;
            v62 = v54;
            _os_log_impl(&dword_185066000, v52, OS_LOG_TYPE_ERROR, "%@: Disallowing touch for gesture recognizer because it does not match _initialTouchType(%@)", buf, 0x16u);

          }
        }
        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }
    v9 = objc_msgSend(a4, "type");
    v10 = dyld_program_sdk_at_least();
    if (v9)
      v11 = v10;
    else
      v11 = 1;
    -[UIGestureRecognizer view](v5, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v5->_allowedTouchTypes & (1 << objc_msgSend(a3, "type"))) == 0
      || !-[UIGestureRecognizer isEnabled](v5, "isEnabled")
      || -[UIGestureRecognizer state](v5, "state") > UIGestureRecognizerStateChanged)
    {
      goto LABEL_84;
    }
    if (v9 || !v12)
    {
      if (v9)
      {
        if (!-[UIGestureRecognizer _shouldReceiveEvent:](v5, "_shouldReceiveEvent:", a4)
          || (-[UIGestureRecognizer _delegateShouldReceiveEvent:]((uint64_t)v5, (uint64_t)a4) & 1) == 0)
        {
          goto LABEL_84;
        }
LABEL_39:
        if (!-[UIGestureRecognizer _shouldReceiveTouch:withEvent:](v5, "_shouldReceiveTouch:withEvent:", a3, a4))
          goto LABEL_84;
        if (!v11)
        {
LABEL_69:
          if ((*((_BYTE *)&v5->_gestureFlags + 8) & 0x40) == 0
            || (-[UIGestureRecognizer _driver](v5, "_driver"),
                v38 = (void *)objc_claimAutoreleasedReturnValue(),
                v39 = objc_msgSend(v38, "shouldReceiveComponent:withEvent:", a3, a4),
                v38,
                v39))
          {
            if ((*(_QWORD *)&v5->_gestureFlags & 0x40000000000) == 0)
            {
              v40 = objc_msgSend(a3, "type");
              v41 = qword_1ECD7E0A8;
              if (!qword_1ECD7E0A8)
              {
                v41 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v41, (unint64_t *)&qword_1ECD7E0A8);
              }
              if ((*(_BYTE *)v41 & 1) != 0)
              {
                v44 = *(NSObject **)(v41 + 8);
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  v45 = v44;
                  -[UIGestureRecognizer _briefDescription](v5, "_briefDescription");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v60 = v46;
                  v61 = 2080;
                  v62 = "-[UIGestureRecognizer _setInitialTouchType:]";
                  v63 = 2112;
                  v64 = v47;
                  _os_log_impl(&dword_185066000, v45, OS_LOG_TYPE_ERROR, "%@: %s (type=%@)", buf, 0x20u);

                }
              }
              if ((v5->_allowedTouchTypes & (1 << v40)) != 0)
              {
                v5->_initialTouchType = v40;
                *(_QWORD *)&v5->_gestureFlags |= 0x40000000000uLL;
              }
              else
              {
                v42 = qword_1ECD7E0B0;
                if (!qword_1ECD7E0B0)
                {
                  v42 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v42, (unint64_t *)&qword_1ECD7E0B0);
                }
                if ((*(_BYTE *)v42 & 1) != 0)
                {
                  v48 = *(NSObject **)(v42 + 8);
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    v49 = v48;
                    -[UIGestureRecognizer _briefDescription](v5, "_briefDescription");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v60 = v50;
                    _os_log_impl(&dword_185066000, v49, OS_LOG_TYPE_ERROR, "%@: Attempting to set initial touch type, that is not allowed...", buf, 0xCu);

                  }
                }
              }
            }
            LOBYTE(v5) = 1;
            goto LABEL_85;
          }
LABEL_84:
          LOBYTE(v5) = 0;
LABEL_85:

          return (char)v5;
        }
        if (!objc_msgSend(a4, "type") && (*(_QWORD *)&v5->_gestureFlags & 0x20000000) != 0)
        {
          -[UIGestureRecognizer _gatherViewsToQueryForDelegateCall]((uint64_t)v5);
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v25 = (id)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v56;
            while (2)
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v56 != v35)
                  objc_enumerationMutation(v25);
                if (!objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "_gestureRecognizerShouldReceiveTouch:", v5, (_QWORD)v55))
                {
                  v26 = 0;
                  goto LABEL_82;
                }
              }
              v34 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
              if (v34)
                continue;
              break;
            }
          }
          v26 = 1;
LABEL_82:

        }
        else
        {
          v25 = 0;
          v26 = 1;
        }
        WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
        v28 = WeakRetained;
        gestureFlags = (uint64_t)v5->_gestureFlags;
        if ((gestureFlags & 0x8000) != 0)
          v30 = 0;
        else
          v30 = v26;
        if ((gestureFlags & 0x8000) != 0 && v26)
        {
          v30 = objc_msgSend(WeakRetained, "_gestureRecognizer:shouldReceiveTouch:", v5, a3);
          gestureFlags = (uint64_t)v5->_gestureFlags;
        }
        if ((gestureFlags & 0x20) == 0)
        {
          v31 = v30;
          goto LABEL_52;
        }
        if (v25)
        {
          v32 = objc_msgSend(v25, "containsObject:", v28);
          v31 = v32 & v30;
          if ((v32 & 1) != 0 || ((v30 ^ 1) & 1) != 0)
          {
LABEL_52:

            if (!v31)
              goto LABEL_84;
            goto LABEL_69;
          }
        }
        else if ((v30 & 1) == 0)
        {

          goto LABEL_84;
        }
        v37 = objc_msgSend(v28, "gestureRecognizer:shouldReceiveTouch:", v5, a3, (_QWORD)v55);

        if ((v37 & 1) == 0)
          goto LABEL_84;
        goto LABEL_69;
      }
    }
    else
    {
      objc_msgSend(v12, "_window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_exclusiveTouchView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_msgSend(v14, "isDescendantOfView:", v12);

        if ((v15 & 1) == 0)
          goto LABEL_84;
      }
    }
    v20 = (unint64_t)v5->_gestureFlags;
    if ((~v20 & 0x8000200000000) != 0)
    {
      v21 = -[UIGestureRecognizer _shouldReceiveEvent:](v5, "_shouldReceiveEvent:", a4);
      v22 = 0x8000000000000;
      if (v21)
        v22 = 0x18000000000000;
      v20 = *(_QWORD *)&v5->_gestureFlags & 0xFFE7FFFFFFFFFFFFLL | v22;
      *(_QWORD *)&v5->_gestureFlags = v20;
    }
    if ((v20 & 0x10000000000000) == 0)
      goto LABEL_84;
    if ((~v20 & 0x20000200000000) != 0)
    {
      v23 = -[UIGestureRecognizer _delegateShouldReceiveEvent:]((uint64_t)v5, (uint64_t)a4);
      v24 = 0x20000000000000;
      if (v23)
        v24 = 0x60000000000000;
      v20 = *(_QWORD *)&v5->_gestureFlags & 0xFF9FFFFFFFFFFFFFLL | v24;
      *(_QWORD *)&v5->_gestureFlags = v20;
    }
    if ((v20 & 0x40000000000000) == 0)
      goto LABEL_84;
    goto LABEL_39;
  }
  return (char)v5;
}

- (id)_activeEventOfType:(int64_t)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
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
  v4 = self->_activeEvents;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)requiresExclusiveTouchType
{
  return (*(_QWORD *)&self->_gestureFlags >> 41) & 1;
}

- (id)_activePressesEvent
{
  if (a1)
  {
    objc_msgSend(a1, "_activeEventOfType:", 3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_isActive
{
  id *v1;
  id WeakRetained;

  v1 = (id *)a1;
  if (a1)
  {
    if (a1[9] <= 2 && objc_msgSend(a1, "isEnabled") && ((unint64_t)v1[1] & 0x200000000) != 0)
    {
      WeakRetained = objc_loadWeakRetained(v1 + 6);
      v1 = (id *)(WeakRetained != 0);

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)_shouldReceiveEvent:(id)a3
{
  return -[UIGestureRecognizer _internalShouldReceiveEvent:]((uint64_t)self, a3);
}

- (uint64_t)_internalShouldReceiveEvent:(uint64_t)a1
{
  int v4;
  void *v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if ((*(_BYTE *)(a1 + 16) & 0x40) != 0)
  {
    objc_msgSend((id)a1, "_driver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "shouldReceiveEvent:", a2);

  }
  else
  {
    v4 = 0;
  }
  v6 = 0;
  switch(objc_msgSend(a2, "type"))
  {
    case 0:
      if (*(_QWORD *)(a1 + 80))
        v7 = 1;
      else
        v7 = v4;
      if (v7)
        goto LABEL_21;
      goto LABEL_15;
    case 3:
    case 4:
      goto LABEL_21;
    case 9:
      v8 = *(_QWORD *)(a1 + 8);
      if ((v8 & 0x100000000000) != 0)
        v9 = (v8 >> 45) & 1;
      else
        v9 = 0;
      if (!(v9 | v4))
        goto LABEL_15;
      goto LABEL_21;
    case 10:
      v10 = (*(_QWORD *)(a1 + 8) >> 60) & 1;
      goto LABEL_20;
    case 11:
      v10 = (*(_QWORD *)(a1 + 8) >> 59) & 1;
      goto LABEL_20;
    case 14:
      v10 = (*(_QWORD *)(a1 + 8) >> 61) & 1;
      goto LABEL_20;
    case 16:
      v10 = (*(_QWORD *)(a1 + 8) >> 62) & 1;
LABEL_20:
      if (v10 | v4)
LABEL_21:
        v6 = objc_msgSend((id)a1, "shouldReceiveEvent:", a2);
      else
LABEL_15:
        v6 = 0;
      break;
    default:
      break;
  }
  v11 = _internalShouldReceiveEvent____s_category;
  if (!_internalShouldReceiveEvent____s_category)
  {
    v11 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&_internalShouldReceiveEvent____s_category);
  }
  if ((*(_BYTE *)v11 & 1) != 0)
  {
    v13 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      objc_msgSend((id)a1, "_briefDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v6)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = (id)objc_opt_class();
      v17 = v23;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%@: Returning %@ for event class: %@", (uint8_t *)&v18, 0x20u);

    }
  }
  return v6;
}

- (uint64_t)_delegateShouldReceiveEvent:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  v5 = WeakRetained;
  v6 = *(_QWORD *)(a1 + 8);
  if ((v6 & 0x4000) != 0)
  {
    v7 = objc_msgSend(WeakRetained, "_gestureRecognizer:shouldReceiveEvent:", a1, a2);
    v6 = *(_QWORD *)(a1 + 8);
  }
  else
  {
    v7 = 1;
  }
  if ((v6 & 0x10) != 0)
    v8 = 0;
  else
    v8 = v7;
  if ((v6 & 0x10) != 0 && v7)
    v8 = objc_msgSend(v5, "gestureRecognizer:shouldReceiveEvent:", a1, a2);
  v9 = _delegateShouldReceiveEvent____s_category;
  if (!_delegateShouldReceiveEvent____s_category)
  {
    v9 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v9, (unint64_t *)&_delegateShouldReceiveEvent____s_category);
  }
  if ((*(_BYTE *)v9 & 1) != 0)
  {
    v11 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      objc_msgSend((id)a1, "_briefDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v8)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = (id)objc_opt_class();
      v15 = v21;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%@: Delegate is returning %@ for event class: %@", (uint8_t *)&v16, 0x20u);

    }
  }

  return v8;
}

- (BOOL)shouldReceiveEvent:(UIEvent *)event
{
  return 1;
}

- (void)_updateCachedActiveEventProperties
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_QWORD *)(a1 + 192) = 0;
    *(_QWORD *)(a1 + 200) = 0;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1 + 176);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
          *(_QWORD *)(a1 + 192) |= objc_msgSend(v7, "_buttonMask", (_QWORD)v8);
          *(_QWORD *)(a1 + 200) |= objc_msgSend(v7, "_modifierFlags");
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_updateForceClassifierWithEvent:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 120);
    objc_msgSend(a2, "touchesForGestureRecognizer:", a1);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "receiveObservedValue:", v3);

  }
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  return 1;
}

- (void)_ignoreActiveEvents
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v2 = (void *)objc_msgSend(a1[22], "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v7, "touchesForGestureRecognizer:", a1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v8, "copy");

          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v24 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(a1, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v7);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            }
            while (v11);
          }
LABEL_15:

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v7, "pressesForGestureRecognizer:", a1, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v20 != v16)
                  objc_enumerationMutation(v9);
                objc_msgSend(a1, "ignorePress:forEvent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), v7);
              }
              v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
            }
            while (v15);
          }
          goto LABEL_15;
        }
        -[UIEvent _removeGestureRecognizer:](v7, a1);
LABEL_16:
        ++v6;
      }
      while (v6 != v4);
      v18 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      v4 = v18;
    }
    while (v18);
  }

}

- (uint64_t)_addActiveTouches:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 96);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v6 = *(void **)(v3 + 96);
      *(_QWORD *)(v3 + 96) = v5;

      v4 = *(void **)(v3 + 96);
    }
    return objc_msgSend(v4, "unionSet:", a2);
  }
  return result;
}

- (uint64_t)_addActiveEvent:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 176);
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(void **)(v3 + 176);
      *(_QWORD *)(v3 + 176) = v5;

      v4 = *(void **)(v3 + 176);
    }
    return objc_msgSend(v4, "addObject:", a2);
  }
  return result;
}

- (id)_gatherViewsToQueryForDelegateCall
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1 || (*(_QWORD *)(a1 + 8) & 0x20000000) == 0)
    return 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v9)
          v9 = (_QWORD *)v9[4];
        v10 = v9;
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if (!v6)
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
          objc_msgSend(v6, "addObject:", v11);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)a1, "_activeEventOfType:", 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "touchesForGestureRecognizer:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (!v6)
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
          objc_msgSend(v6, "addObject:", v18);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEnabled
{
  return (*(_QWORD *)&self->_gestureFlags & 0x100000000) == 0;
}

- (void)ignoreTouch:(UITouch *)touch forEvent:(UIEvent *)event
{
  void *v7;
  id v8;

  if (self)
  {
    _UIGestureDelayedTouchForUITouch(touch, self->_delayedTouches);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UIGestureDelayedEventComponentDispatcher enqueueDelayedTouchToSend:]((uint64_t)self->_delayedEventComponentDispatcher, (uint64_t)v7);
      -[NSMutableArray removeObject:](self->_delayedTouches, "removeObject:", v7);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", touch);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIEvent _removeGestureRecognizer:fromComponents:](event, "_removeGestureRecognizer:fromComponents:", self, v8);
  -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)v8);

}

- (void)_resetGestureRecognizer
{
  uint64_t gestureFlags;
  char v4;
  uint64_t v5;
  char v6;
  id v7;

  -[UIGestureRecognizer reset](self, "reset");
  -[NSMutableSet removeAllObjects](self->_activeEvents, "removeAllObjects");
  self->_forcePressCount = 0;
  *(_QWORD *)&self->_gestureFlags &= 0xFFF9FFFFFFFFFFFFLL;
  self->_firstEventTimestamp = 0.0;
  self->_buttonMask = 0;
  self->_modifierFlags = 0;
  -[UIGestureRecognizer _invalidateInitialTouchType]((uint64_t)self);
  gestureFlags = (uint64_t)self->_gestureFlags;
  v4 = *((_BYTE *)&self->_gestureFlags + 8);
  self->_machTimeEnqueuedForReset = 0;
  *(_QWORD *)&self->_gestureFlags = gestureFlags & 0xFFFEFF81FFFFFFFFLL;
  *((_BYTE *)&self->_gestureFlags + 8) = v4 & 0xEF;
  -[UIGestureRecognizer _enqueueDelayedTouchesToSend]((uint64_t)self);
  -[UIGestureRecognizer _enqueueDelayedPressesToSend]((uint64_t)self);
  *(_QWORD *)&self->_gestureFlags &= ~0x10000000uLL;
  self->_state = 0;
  -[_UITouchForceObservable receiveObservedValue:](self->_touchForceObservable, "receiveObservedValue:", 0);
  v5 = (uint64_t)self->_gestureFlags;
  v6 = *((_BYTE *)&self->_gestureFlags + 8);
  self->_inputPrecision = 0;
  *(_QWORD *)&self->_gestureFlags = v5 & 0x7807F7FFFFFFFFFFLL;
  *((_BYTE *)&self->_gestureFlags + 8) = v6 & 0xF8;
  if ((v6 & 0x40) != 0)
  {
    -[UIGestureRecognizer _driver](self, "_driver");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reset");

  }
}

- (void)_enqueueDelayedTouchesToSend
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v3 = v2;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
      {
        v5 = v4;
        v6 = 0;
        v7 = *(_QWORD *)v15;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v15 != v7)
              objc_enumerationMutation(v3);
            v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
            if (v9)
              v10 = *(void **)(v9 + 24);
            else
              v10 = 0;
            v11 = v10;
            if (objc_msgSend(v11, "isDelayed", (_QWORD)v14) && v9)
            {
              v12 = *(_QWORD *)(v9 + 8);

              if (v12 == 1)
              {
                -[UIGestureDelayedEventComponentDispatcher enqueueDelayedTouchToSend:](*(_QWORD *)(a1 + 264), v9);
                if (!v6)
                  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v6, "addObject:", v9);
              }
            }
            else
            {

            }
            ++v8;
          }
          while (v5 != v8);
          v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v5 = v13;
        }
        while (v13);
      }
      else
      {
        v6 = 0;
      }

      objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", v6);
      -[UIGestureRecognizer _clearDelayedTouches](a1);

    }
  }
}

- (void)_enqueueDelayedPressesToSend
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 40);
    if (v2)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v3 = v2;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
      {
        v5 = v4;
        v6 = 0;
        v7 = *(_QWORD *)v15;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v15 != v7)
              objc_enumerationMutation(v3);
            v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
            if (v9)
              v10 = *(void **)(v9 + 24);
            else
              v10 = 0;
            v11 = v10;
            if (objc_msgSend(v11, "isDelayed", (_QWORD)v14) && v9)
            {
              v12 = *(_QWORD *)(v9 + 8);

              if (v12 == 1)
              {
                -[UIGestureDelayedEventComponentDispatcher enqueueDelayedPressToSend:](*(_QWORD *)(a1 + 264), v9);
                if (!v6)
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v6 = (void *)objc_claimAutoreleasedReturnValue();
                }
                objc_msgSend(v6, "addObject:", v9);
              }
            }
            else
            {

            }
            ++v8;
          }
          while (v5 != v8);
          v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v5 = v13;
        }
        while (v13);
      }
      else
      {
        v6 = 0;
      }

      objc_msgSend(*(id *)(a1 + 40), "removeObjectsInArray:", v6);
      -[UIGestureRecognizer _clearDelayedPresses](a1);

    }
  }
}

- (uint64_t)_invalidateInitialTouchType
{
  uint64_t v1;
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = _invalidateInitialTouchType___s_category;
    if (!_invalidateInitialTouchType___s_category)
    {
      v2 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&_invalidateInitialTouchType___s_category);
    }
    if ((*(_BYTE *)v2 & 1) != 0)
    {
      v3 = *(NSObject **)(v2 + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = v3;
        objc_msgSend((id)v1, "_briefDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412546;
        v7 = v5;
        v8 = 2080;
        v9 = "-[UIGestureRecognizer _invalidateInitialTouchType]";
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%@: %s", (uint8_t *)&v6, 0x16u);

      }
    }
    *(_QWORD *)(v1 + 8) &= ~0x40000000000uLL;
    return objc_msgSend(*(id *)(v1 + 96), "removeAllObjects");
  }
  return result;
}

- (void)_delayTouchesForEventIfNeeded:(uint64_t)a1
{
  if ((objc_msgSend((id)a1, "delaysTouchesBegan") & 1) != 0 || objc_msgSend(*(id *)(a1 + 32), "count"))
    -[UIGestureRecognizer _delayTouchesForEvent:inPhase:](a1, a2, 0);
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0)
    -[UIGestureRecognizer _delayTouchesForEvent:inPhase:](a1, a2, 3);
}

- (void)_delayPressesForEventIfNeeded:(uint64_t)a1
{
  if ((objc_msgSend((id)a1, "delaysTouchesBegan") & 1) != 0 || objc_msgSend(*(id *)(a1 + 40), "count"))
    -[UIGestureRecognizer _delayPressesForEvent:inPhase:](a1, a2, 0);
  if ((*(_DWORD *)(a1 + 8) & 0x80000000) != 0)
    -[UIGestureRecognizer _delayPressesForEvent:inPhase:](a1, a2, 3);
}

- (BOOL)delaysTouchesBegan
{
  return (*(_QWORD *)&self->_gestureFlags >> 30) & 1;
}

- (void)_clearDelayedTouches
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v8 = _clearDelayedTouches___s_category;
        if (!_clearDelayedTouches___s_category)
        {
          v8 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_clearDelayedTouches___s_category);
        }
        if ((*(_BYTE *)v8 & 1) != 0)
        {
          v14 = *(NSObject **)(v8 + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = v14;
            objc_msgSend((id)a1, "_briefDescription");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v7)
              v9 = *(void **)(v7 + 24);
            else
              v9 = 0;
            v12 = v9;
            *(_DWORD *)buf = 138412546;
            v21 = v13;
            v22 = 2112;
            v23 = v12;
            _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "%@: Clearing delay on touch %@", buf, 0x16u);

          }
        }
        -[UIGestureDelayedEventComponentDispatcher removeDelayedTouch:](*(id **)(a1 + 264), v7);
        ++v6;
      }
      while (v4 != v6);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      v4 = v10;
    }
    while (v10);
  }

  v11 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;

}

- (void)_clearDelayedPresses
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v8 = _clearDelayedPresses___s_category;
        if (!_clearDelayedPresses___s_category)
        {
          v8 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_clearDelayedPresses___s_category);
        }
        if ((*(_BYTE *)v8 & 1) != 0)
        {
          v14 = *(NSObject **)(v8 + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = v14;
            objc_msgSend((id)a1, "_briefDescription");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v7)
              v9 = *(void **)(v7 + 24);
            else
              v9 = 0;
            v12 = v9;
            *(_DWORD *)buf = 138412546;
            v21 = v13;
            v22 = 2112;
            v23 = v12;
            _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "%@: Clearing delay on press %@", buf, 0x16u);

          }
        }
        -[UIGestureDelayedEventComponentDispatcher removeDelayedPress:](*(_QWORD *)(a1 + 264), v7);
        ++v6;
      }
      while (v4 != v6);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      v4 = v10;
    }
    while (v10);
  }

  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;

}

- (void)setDelegate:(id)delegate
{
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t gestureFlags;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;

  v5 = objc_opt_respondsToSelector();
  v6 = 16;
  if ((v5 & 1) == 0)
    v6 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFEFLL | v6;
  v7 = objc_opt_respondsToSelector();
  v8 = 32;
  if ((v7 & 1) == 0)
    v8 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFDFLL | v8;
  v9 = objc_opt_respondsToSelector();
  v10 = 64;
  if ((v9 & 1) == 0)
    v10 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFBFLL | v10;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFFELL | objc_opt_respondsToSelector() & 1;
  v11 = objc_opt_respondsToSelector();
  v12 = 8;
  if ((v11 & 1) == 0)
    v12 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFF7 | v12;
  v13 = objc_opt_respondsToSelector();
  v14 = 128;
  if ((v13 & 1) == 0)
    v14 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFF7FLL | v14;
  v15 = objc_opt_respondsToSelector();
  v16 = 256;
  if ((v15 & 1) == 0)
    v16 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFEFFLL | v16;
  v17 = objc_opt_respondsToSelector();
  v18 = 1024;
  if ((v17 & 1) == 0)
    v18 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFBFFLL | v18;
  v19 = objc_opt_respondsToSelector();
  v20 = 2048;
  if ((v19 & 1) == 0)
    v20 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFF7FFLL | v20;
  v21 = objc_opt_respondsToSelector();
  v22 = 4096;
  if ((v21 & 1) == 0)
    v22 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFEFFFLL | v22;
  v23 = objc_opt_respondsToSelector();
  v24 = 0x2000;
  if ((v23 & 1) == 0)
    v24 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFDFFFLL | v24;
  v25 = objc_opt_respondsToSelector();
  v26 = 0x4000;
  if ((v25 & 1) == 0)
    v26 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFBFFFLL | v26;
  v27 = objc_opt_respondsToSelector();
  v28 = 0x8000;
  if ((v27 & 1) == 0)
    v28 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFF7FFFLL | v28;
  v29 = objc_opt_respondsToSelector();
  v30 = 0x10000;
  if ((v29 & 1) == 0)
    v30 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFEFFFFLL | v30;
  v31 = objc_opt_respondsToSelector();
  v32 = 0x20000;
  if ((v31 & 1) == 0)
    v32 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFDFFFFLL | v32;
  v33 = objc_opt_respondsToSelector();
  v34 = 0x40000;
  if ((v33 & 1) == 0)
    v34 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFBFFFFLL | v34;
  v35 = objc_opt_respondsToSelector();
  v36 = 0x80000;
  if ((v35 & 1) == 0)
    v36 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFF7FFFFLL | v36;
  v37 = objc_opt_respondsToSelector();
  v38 = 0x100000;
  if ((v37 & 1) == 0)
    v38 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFEFFFFFLL | v38;
  v39 = objc_opt_respondsToSelector();
  v40 = 0x200000;
  if ((v39 & 1) == 0)
    v40 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFDFFFFFLL | v40;
  v41 = objc_opt_respondsToSelector();
  v42 = 2;
  if ((v41 & 1) == 0)
    v42 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFFDLL | v42;
  v43 = objc_opt_respondsToSelector();
  v44 = 4;
  if ((v43 & 1) == 0)
    v44 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFFFFFFFFBLL | v44;
  v45 = objc_opt_respondsToSelector();
  gestureFlags = (uint64_t)self->_gestureFlags;
  v47 = 512;
  if ((v45 & 1) == 0)
    v47 = 0;
  v48 = gestureFlags & 0xFFFFFFFFFDFFFDFFLL | v47;
  v49 = ((_DWORD)gestureFlags << 17) & 0x2000000;
  v50 = (gestureFlags & 0x60080) == 0;
  v51 = 0x2000000;
  if (v50)
    v51 = v49;
  *(_QWORD *)&self->_gestureFlags = v48 | v51;
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (UIGestureRecognizer)initWithTarget:(id)target action:(SEL)action
{
  UIGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  UIGestureRecognizer *v8;
  _QWORD v10[5];
  UIGestureRecognizer *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIGestureRecognizer;
  v6 = -[UIGestureRecognizer init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    _UIGestureRecognizerCommonInit((uint64_t)v6);
    if (target)
    {
      if ((dyld_program_sdk_at_least() & 1) != 0
        || (objc_msgSend(target, sel_allowsWeakReference) & 1) != 0)
      {
        if (action)
          _UIGestureRecognizerAddTargetToArray((id *)&v7->_targets, target, (void *)action);
      }
      else
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __45__UIGestureRecognizer_initWithTarget_action___block_invoke;
        v10[3] = &unk_1E16B1B50;
        v10[4] = target;
        v8 = v7;
        v11 = v8;
        if (initWithTarget_action__once != -1)
        {
          dispatch_once(&initWithTarget_action__once, v10);
          v8 = v11;
        }

      }
    }
  }
  return v7;
}

- (void)setRequiresExclusiveTouchType:(BOOL)requiresExclusiveTouchType
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!requiresExclusiveTouchType)
    v3 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFDFFFFFFFFFFLL | v3;
}

+ (BOOL)_shouldDefaultToTouches
{
  return 1;
}

- (void)setCancelsTouchesInView:(BOOL)cancelsTouchesInView
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!cancelsTouchesInView)
    v3 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (void)setDelaysTouchesBegan:(BOOL)delaysTouchesBegan
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!delaysTouchesBegan)
    v3 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (void)setAllowedPressTypes:(NSArray *)allowedPressTypes
{
  NSArray *v4;
  NSArray *v5;

  v4 = (NSArray *)-[NSArray copy](allowedPressTypes, "copy");
  v5 = self->_allowedPressTypes;
  self->_allowedPressTypes = v4;

}

- (NSArray)allowedPressTypes
{
  return self->_allowedPressTypes;
}

- (uint64_t)_removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 96), "minusSet:", a2);
    result = objc_msgSend(*(id *)(v2 + 96), "count");
    if (!result)
      return -[UIGestureRecognizer _invalidateInitialTouchType](v2);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  NSMutableSet *failureDependents;
  NSMutableSet *failureRequirements;
  objc_super v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = MEMORY[0x1E0C809B0];
  failureDependents = self->_failureDependents;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__UIGestureRecognizer_dealloc__block_invoke;
  v8[3] = &unk_1E16C93D8;
  v8[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](failureDependents, "enumerateObjectsUsingBlock:", v8);
  failureRequirements = self->_failureRequirements;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __30__UIGestureRecognizer_dealloc__block_invoke_2;
  v7[3] = &unk_1E16C93D8;
  v7[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](failureRequirements, "enumerateObjectsUsingBlock:", v7);
  -[UIGestureRecognizer _enqueueDelayedTouchesToSend]((uint64_t)self);
  -[UIGestureRecognizer _enqueueDelayedPressesToSend]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)UIGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v6, sel_dealloc);
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 248);
}

- (void)setDelaysTouchesEnded:(BOOL)delaysTouchesEnded
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!delaysTouchesEnded)
    v3 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (void)setEnabled:(BOOL)enabled
{
  uint64_t gestureFlags;
  uint64_t v4;
  UIGestureEnvironment *gestureEnvironment;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  gestureFlags = (uint64_t)self->_gestureFlags;
  if ((BYTE4(gestureFlags) & 1) == enabled)
  {
    v4 = 0x100000000;
    if (enabled)
      v4 = 0;
    *((_BYTE *)&self->_gestureFlags + 8) = *((_BYTE *)&self->_gestureFlags + 8);
    *(_QWORD *)&self->_gestureFlags = gestureFlags & 0xFFFFFFFEFFFFFFFFLL | v4;
    if ((gestureFlags & 0x200000000) != 0 && !enabled)
    {
      gestureEnvironment = self->_gestureEnvironment;
      v7[0] = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)gestureEnvironment, v6);

    }
  }
}

- (UIGestureRecognizer)init
{
  return -[UIGestureRecognizer initWithTarget:action:](self, "initWithTarget:action:", 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedEventComponentDispatcher, 0);
  objc_storeStrong((id *)&self->_gestureEnvironment, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_allowedPressTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeEvents, 0);
  objc_storeStrong((id *)&self->_failureDependents, 0);
  objc_storeStrong((id *)&self->_failureRequirements, 0);
  objc_storeStrong((id *)&self->_beganObservable, 0);
  objc_storeStrong((id *)&self->_forceTargets, 0);
  objc_storeStrong((id *)&self->_touchForceObservableAndClassifierObservation, 0);
  objc_storeStrong((id *)&self->_touchForceObservable, 0);
  objc_storeStrong((id *)&self->_forceClassifier, 0);
  objc_storeStrong((id *)&self->_internalActiveTouches, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_delayedPresses, 0);
  objc_storeStrong((id *)&self->_delayedTouches, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

- (void)setAllowedTouchTypes:(NSArray *)allowedTouchTypes
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_allowedTouchTypes = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = allowedTouchTypes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = *MEMORY[0x1E0C99778];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "integerValue");
        switch(v10)
        {
          case 0:
            v11 = self->_allowedTouchTypes | 1;
            goto LABEL_11;
          case 1:
            v11 = self->_allowedTouchTypes | 2;
            goto LABEL_11;
          case 2:
            v11 = self->_allowedTouchTypes | 4;
            goto LABEL_11;
          case 3:
            v11 = self->_allowedTouchTypes | 8;
LABEL_11:
            self->_allowedTouchTypes = v11;
            break;
          default:
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Invalid value for touch type: %ld. Must be one of UITouchTypeDirect, UITouchTypeIndirect, UITouchTypeStylus, or UITouchTypeIndirectPointer"), v10);
            break;
        }
        ++v9;
      }
      while (v6 != v9);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v12;
    }
    while (v12);
  }

}

- (CGPoint)_centroidOfTouches:(id)a3 excludingEnded:(BOOL)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = _CentroidOfTouches(a3, a4);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)_componentsEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  void *v8;

  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  v7 = objc_msgSend(a4, "type");
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((_BYTE *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        -[UIGestureRecognizer _driver](self, "_driver");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "touchesEnded:withEvent:", a3, a4);

      }
      -[UIGestureRecognizer touchesEnded:withEvent:](self, "touchesEnded:withEvent:", a3, a4);
      if ((*(_QWORD *)&self->_gestureFlags & 0x4000000) != 0)
        objc_msgSend((id)UIApp, "_registerEstimatedTouches:event:forTouchable:", a3, a4, self);
      break;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      return;
    case 3:
    case 4:
      -[UIGestureRecognizer pressesEnded:withEvent:](self, "pressesEnded:withEvent:", a3, a4);
      break;
    case 9:
      if ((~*(_QWORD *)&self->_gestureFlags & 0x300000000000) == 0)
        -[UIGestureRecognizer _draggingEndedWithEvent:](self, "_draggingEndedWithEvent:", a4);
      break;
    case 11:
      if ((*(_QWORD *)&self->_gestureFlags & 0x800000000000000) != 0)
      {
        -[UIGestureRecognizer _hoverExited:withEvent:](self, "_hoverExited:withEvent:", a3, a4);
        -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      }
      break;
    default:
      if (v7 == 16 && (*(_QWORD *)&self->_gestureFlags & 0x4000000000000000) != 0)
        -[UIGestureRecognizer _dynamicButtonsEnded:withEvent:](self, "_dynamicButtonsEnded:withEvent:", a3, a4);
      break;
  }
}

- (void)setState:(UIGestureRecognizerState)state
{
  unint64_t v5;
  int64_t v6;
  UIGestureEnvironment *gestureEnvironment;
  UIGestureRecognizerState v8;
  _BYTE *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t i;
  id *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  uint64_t gestureFlags;
  BOOL v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  unint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSMutableSet *obj;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = _MergedGlobals_1075;
  if (!_MergedGlobals_1075)
  {
    v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_MergedGlobals_1075);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v30 = *(id *)(v5 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      -[UIGestureRecognizer _briefDescription](self, "_briefDescription");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if ((unint64_t)state > UIGestureRecognizerStateFailed)
        v33 = 0;
      else
        v33 = off_1E16C94F0[state];
      *(_DWORD *)buf = 138412546;
      v60 = v31;
      v61 = 2112;
      v62 = v33;
      _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "%@: Setting state to %@", buf, 0x16u);

    }
  }
  v6 = self->_state;
  if (state < UIGestureRecognizerStateBegan || v6)
    goto LABEL_8;
  gestureEnvironment = self->_gestureEnvironment;
  if (gestureEnvironment)
  {
    gestureEnvironment->_updateExclusivity = 1;
    v6 = self->_state;
LABEL_8:
    v8 = state;
    switch(v6)
    {
      case 0:
        goto LABEL_9;
      case 1:
        if (state == UIGestureRecognizerStateFailed)
          goto LABEL_21;
        if (state == UIGestureRecognizerStateBegan)
          goto LABEL_20;
        v8 = state;
        if (state == UIGestureRecognizerStatePossible)
          v8 = UIGestureRecognizerStateBegan;
        break;
      case 2:
        if (state == UIGestureRecognizerStateFailed)
        {
LABEL_21:
          v8 = UIGestureRecognizerStateCancelled;
        }
        else if (state == UIGestureRecognizerStateBegan || (v8 = state) == UIGestureRecognizerStatePossible)
        {
LABEL_20:
          v8 = UIGestureRecognizerStateChanged;
        }
        break;
      case 3:
      case 4:
      case 5:
        return;
      default:
        goto LABEL_26;
    }
    goto LABEL_26;
  }
LABEL_9:
  if ((unint64_t)(state - 1) < 2)
  {
    v8 = UIGestureRecognizerStateBegan;
    goto LABEL_25;
  }
  v8 = state;
  if (state == UIGestureRecognizerStatePossible)
    goto LABEL_26;
  if (state == UIGestureRecognizerStateCancelled)
  {
    v8 = UIGestureRecognizerStateFailed;
    goto LABEL_26;
  }
  v8 = state;
  if ((state & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v8 = UIGestureRecognizerStateEnded;
LABEL_25:
    if (!-[UIGestureRecognizer _shouldBegin](self, "_shouldBegin"))
    {
      v28 = qword_1ECD7E080;
      if (!qword_1ECD7E080)
      {
        v28 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&qword_1ECD7E080);
      }
      if ((*(_BYTE *)v28 & 1) != 0)
      {
        v39 = *(NSObject **)(v28 + 8);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = v39;
          -[UIGestureRecognizer _briefDescription](self, "_briefDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v60 = (uint64_t)v41;
          _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_ERROR, "%@: Failing due to NO from gestureRecognizerShouldBegin", buf, 0xCu);

        }
      }
      state = UIGestureRecognizerStateFailed;
      goto LABEL_30;
    }
  }
LABEL_26:
  v9 = (_BYTE *)qword_1ECD7E088;
  if (!qword_1ECD7E088)
  {
    v9 = (_BYTE *)(__UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v9, (unint64_t *)&qword_1ECD7E088);
  }
  if ((*v9 & 1) != 0)
  {
    if (v8 == state)
      goto LABEL_30;
    v34 = qword_1ECD7E090;
    if (!qword_1ECD7E090)
    {
      v34 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v34, (unint64_t *)&qword_1ECD7E090);
    }
    if ((*(_BYTE *)v34 & 1) != 0)
    {
      v35 = *(id *)(v34 + 8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        -[UIGestureRecognizer _briefDescription](self, "_briefDescription");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if ((unint64_t)v8 > UIGestureRecognizerStateFailed)
          v38 = 0;
        else
          v38 = off_1E16C94F0[v8];
        *(_DWORD *)buf = 138412546;
        v60 = v36;
        v61 = 2112;
        v62 = v38;
        _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "%@: Invalid state machine transition. Instead setting state to %@", buf, 0x16u);

      }
    }
  }
  state = v8;
LABEL_30:
  v10 = self->_state;
  if (v10 != state || v10 == 2)
  {
    self->_state = state;
    if (state == UIGestureRecognizerStateBegan)
      *(_QWORD *)&self->_gestureFlags |= 0x1000000000uLL;
    v11 = state;
    if (v10 != state)
    {
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      obj = self->_activeEvents;
      v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
      if (v44)
      {
        v43 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v54 != v43)
              objc_enumerationMutation(obj);
            v13 = *(id **)(*((_QWORD *)&v53 + 1) + 8 * i);
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            -[UITabBarControllerSidebar _actualFooterContentConfiguration](v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v50;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v50 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v19, "_gestureRecognizer:didTransitionToState:", self, state);
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
              }
              while (v16);
            }

          }
          v44 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, buf, 16);
        }
        while (v44);
      }

      v11 = self->_state;
    }
    if ((unint64_t)(v11 - 1) <= 2
      && -[UIGestureRecognizer _analyticsIsGestureHandled](self, "_analyticsIsGestureHandled"))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[UIGestureRecognizer _allActiveTouches](self, "_allActiveTouches");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v46;
        do
        {
          for (k = 0; k != v22; ++k)
          {
            if (*(_QWORD *)v46 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
            if (v25)
              *(_WORD *)(v25 + 236) |= 0x400u;
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        }
        while (v22);
      }

    }
    if (dyld_program_sdk_at_least())
    {
      gestureFlags = (uint64_t)self->_gestureFlags;
      if ((gestureFlags & 0x2000000000) == 0)
      {
        v27 = (gestureFlags & 0x1400000000) == 0x1000000000 && self->_state > 1;
        *((_BYTE *)&self->_gestureFlags + 8) = *((_BYTE *)&self->_gestureFlags + 8);
        *(_QWORD *)&self->_gestureFlags = gestureFlags & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)v27 << 37);
      }
    }
    -[UIGestureEnvironment setGestureNeedsUpdate:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
    if ((state & 0xFFFFFFFFFFFFFFFELL) == 4 && (*((_BYTE *)&self->_gestureFlags + 8) & 0x40) != 0)
    {
      -[UIGestureRecognizer _driver](self, "_driver");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fail");

    }
  }
}

- (BOOL)_analyticsIsGestureHandled
{
  return self->_analyticsGestureHandled;
}

- (NSSet)_allActiveTouches
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_internalActiveTouches, "copy");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_delayPressesForEvent:(uint64_t)a3 inPhase:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a2, "_pressesForGestureRecognizer:withPhase:", a1, a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        _UIGestureDelayedTouchForUITouch(v10, *(void **)(a1 + 40));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          if (!*(_QWORD *)(a1 + 40))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = *(void **)(a1 + 40);
            *(_QWORD *)(a1 + 40) = v12;

          }
          -[UIGestureDelayedEventComponentDispatcher delayedPressForPress:event:](*(void ***)(a1 + 264), v10, a2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (CGPoint)locationInView:(UIView *)view
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint result;

  v26 = *MEMORY[0x1E0C80C00];
  -[UIGestureRecognizer _activeTouchesEvent](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchesForGestureRecognizer:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "locationInView:", view, (_QWORD)v21);
        v11 = (int)(v15 + (double)v11);
        v12 = (int)(v16 + (double)v12);
      }
      v10 += v9;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);

    v17 = (double)(v11 / v10);
    v18 = (double)(v12 / v10);
  }
  else
  {

    v17 = *MEMORY[0x1E0C9D538];
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v19 = v17;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)addTarget:(id)target action:(SEL)action
{
  _UIGestureRecognizerAddTargetToArray((id *)&self->_targets, target, (void *)action);
}

- (void)_setRequiresSystemGesturesToFail:(BOOL)a3
{
  uint64_t gestureFlags;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  gestureFlags = (uint64_t)self->_gestureFlags;
  if (((((gestureFlags & 0x8000000000) == 0) ^ a3) & 1) == 0)
  {
    v4 = 0x8000000000;
    if (!a3)
      v4 = 0;
    *((_BYTE *)&self->_gestureFlags + 8) = *((_BYTE *)&self->_gestureFlags + 8);
    *(_QWORD *)&self->_gestureFlags = gestureFlags & 0xFFFFFF7FFFFFFFFFLL | v4;
    if (a3)
    {
      -[UIGestureRecognizer view](self, "view");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "_createSystemGestureGateGestureRecognizerIfNeeded");
        objc_msgSend(v6, "_createOtherSystemGateGestureRecognizersIfNeeded");
      }

    }
  }
}

- (BOOL)_inForceCapableEnvironment
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceTouchCapability") == 2;

  return v3;
}

- (NSMutableSet)_pairedGestureIdentifiers
{
  return (NSMutableSet *)-[UIGestureRecognizer _pairedGestureIdentifiersAndCreate:](self, "_pairedGestureIdentifiersAndCreate:", 1);
}

- (id)_pairedGestureIdentifiersAndCreate:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;

  v3 = a3;
  objc_getAssociatedObject(self, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, a2, v6, (void *)1);
  }
  return v6;
}

- (void)_setAnalyticsGestureHandled:(BOOL)a3
{
  self->_analyticsGestureHandled = a3;
}

- (void)_touchWasCancelled:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = _touchWasCancelled____s_category;
      if (!_touchWasCancelled____s_category)
      {
        v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_touchWasCancelled____s_category);
      }
      if ((*(_BYTE *)v5 & 1) != 0)
      {
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v7 = v6;
          objc_msgSend((id)a1, "_briefDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 138412546;
          v10 = v8;
          v11 = 2112;
          v12 = a2;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "%@: Cancelling delay of touch %@", (uint8_t *)&v9, 0x16u);

        }
      }
      -[UIGestureDelayedEventComponentDispatcher removeDelayedTouch:](*(id **)(a1 + 264), (uint64_t)v4);
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v4);
    }

  }
}

- (BOOL)_shouldBegin
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  unint64_t v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (~*(_DWORD *)&self->_gestureFlags & 0x20000000 | (unint64_t)(~*((_BYTE *)&self->_gestureFlags + 8) & 8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v3 = 0;
    if ((*(_QWORD *)&self->_gestureFlags & 1) == 0)
      goto LABEL_21;
LABEL_20:
    if ((objc_msgSend(WeakRetained, "gestureRecognizerShouldBegin:", self, (_QWORD)v21) & 1) != 0)
      goto LABEL_21;
LABEL_31:
    v19 = 0;
    goto LABEL_32;
  }
  -[UIGestureRecognizer _gatherViewsToQueryForDelegateCall]((uint64_t)self);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "gestureRecognizerShouldBegin:", self, (_QWORD)v21))
        {
          v8 = 0;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_14:

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((*(_QWORD *)&self->_gestureFlags & 1) != 0
    && (!v3 || (objc_msgSend(v3, "containsObject:", WeakRetained) & 1) == 0))
  {
    if (!v8)
      goto LABEL_31;
    goto LABEL_20;
  }
  if (!v8)
    goto LABEL_31;
LABEL_21:
  if ((*(_QWORD *)&self->_gestureFlags & 0x400) != 0
    && !objc_msgSend(WeakRetained, "_gestureRecognizerShouldBegin:", self))
  {
    goto LABEL_31;
  }
  -[UIGestureRecognizer _activeEvents](self, "_activeEvents", (_QWORD)v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "touchesForGestureRecognizer:", self);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unionSet:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v14);
  }

  v18 = +[UIEvent _inputPrecisionForTouches:](UIEvent, "_inputPrecisionForTouches:", v11);
  self->_inputPrecision = v18;

  v19 = 1;
LABEL_32:

  return v19;
}

- (id)_activeEvents
{
  return (id)-[NSMutableSet copy](self->_activeEvents, "copy");
}

- (int64_t)_modifierFlags
{
  return self->_modifierFlags;
}

- (void)_setAcceptsFailureRequiments:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (NSArray)allowedTouchTypes
{
  id v3;
  void *v4;
  int64_t allowedTouchTypes;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  allowedTouchTypes = self->_allowedTouchTypes;
  if ((allowedTouchTypes & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", &unk_1E1A97D40);
    allowedTouchTypes = self->_allowedTouchTypes;
    if ((allowedTouchTypes & 2) == 0)
    {
LABEL_3:
      if ((allowedTouchTypes & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v4, "addObject:", &unk_1E1A97D70);
      if ((self->_allowedTouchTypes & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((allowedTouchTypes & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addObject:", &unk_1E1A97D58);
  allowedTouchTypes = self->_allowedTouchTypes;
  if ((allowedTouchTypes & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((allowedTouchTypes & 8) != 0)
LABEL_5:
    objc_msgSend(v4, "addObject:", &unk_1E1A97D88);
LABEL_6:
  v6 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v6;
}

- (NSUInteger)numberOfTouches
{
  void *v3;
  void *v4;
  NSUInteger v5;

  -[UIGestureRecognizer _activeTouchesEvent](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "touchesForGestureRecognizer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)_setCanExcludeWithActiveRequirements:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (void)_setKeepTouchesOnContinuation:(BOOL)a3
{
  self->_keepTouchesOnContinuation = a3;
}

- (id)_activeTouchesForEvent:(id)a3
{
  return -[UIGestureRecognizer _activeComponentsForEvent:]((uint64_t)self, a3);
}

- (void)_delayTouchesForEvent:(uint64_t)a3 inPhase:
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  objc_class *v21;
  void *v22;
  __CFString *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = _delayTouchesForEvent_inPhase____s_category;
  if (!_delayTouchesForEvent_inPhase____s_category)
  {
    v6 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&_delayTouchesForEvent_inPhase____s_category);
  }
  if ((*(_BYTE *)v6 & 1) != 0)
  {
    v17 = *(id *)(v6 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v28.receiver = (id)a1;
      v28.super_class = (Class)UIGestureRecognizer;
      objc_msgSendSuper2(&v28, sel_description);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = a2;
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v20);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412802;
      v31 = v18;
      v32 = 2112;
      v33 = v23;
      v34 = 2048;
      v35 = a3;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "%@: Delaying touches for event: %@; phase: %li",
        buf,
        0x20u);

    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a2, "_touchesForGesture:withPhase:", a1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        _UIGestureDelayedTouchForUITouch(v12, *(void **)(a1 + 32));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          if (!*(_QWORD *)(a1 + 32))
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v15 = *(void **)(a1 + 32);
            *(_QWORD *)(a1 + 32) = v14;

          }
          -[UIGestureDelayedEventComponentDispatcher delayedTouchForTouch:event:](*(void ***)(a1 + 264), v12, a2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

}

- (NSString)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _appendDescriptionToString:atLevel:includingDependencies:]((uint64_t)self, v3, 0, 1);
  return (NSString *)v3;
}

- (void)_appendDescriptionToString:(int)a3 atLevel:(int)a4 includingDependencies:
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;

  if (a1)
  {
    v8 = (void *)MEMORY[0x186DC9484]();
    if (objc_msgSend(a2, "length"))
      objc_msgSend(a2, "appendString:", CFSTR("\n"));
    v30 = a4;
    if (a3)
    {
      v9 = 1;
      do
      {
        objc_msgSend(a2, "appendString:", CFSTR("    "));
        ++v9;
      }
      while (v9 <= a3);
    }
    -[UIGestureRecognizer _rawBriefDescription]((void *)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "appendFormat:", CFSTR("<%@"), v10);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if ((void *)v13 == v11)
    {
LABEL_11:

    }
    else
    {
      v14 = (void *)v13;
      while (1)
      {
        v15 = objc_opt_class();

        if (v12 == (void *)v15)
          break;
        v12 = (void *)objc_msgSend(v12, "superclass");
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == v11)
          goto LABEL_11;
      }
    }
    if ((void *)objc_opt_class() != v12 && (void *)objc_opt_class() != v12)
    {
      NSStringFromClass((Class)v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "appendFormat:", CFSTR("; baseClass = %@"), v16);

    }
    v17 = objc_msgSend((id)a1, "state");
    if (v17 > 5)
      v18 = 0;
    else
      v18 = off_1E16C94F0[v17];
    objc_msgSend(a2, "appendFormat:", CFSTR("; state = %@"), v18);
    if ((objc_msgSend((id)a1, "isEnabled") & 1) == 0)
      objc_msgSend(a2, "appendString:", CFSTR("; enabled = NO"));
    if ((objc_msgSend((id)a1, "cancelsTouchesInView") & 1) == 0)
      objc_msgSend(a2, "appendString:", CFSTR("; cancelsTouchesInView = NO"));
    if (objc_msgSend((id)a1, "delaysTouchesBegan"))
      objc_msgSend(a2, "appendString:", CFSTR("; delaysTouchesBegan = YES"));
    if ((objc_msgSend((id)a1, "delaysTouchesEnded") & 1) == 0)
      objc_msgSend(a2, "appendString:", CFSTR("; delaysTouchesEnded = NO"));
    objc_msgSend((id)a1, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v19);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = CFSTR("(nil)");
    }
    objc_msgSend(a2, "appendFormat:", CFSTR("; view = %@"), v23);

    v24 = objc_msgSend(*(id *)(a1 + 24), "count");
    v25 = *(void **)(a1 + 24);
    if (v24 == 1)
    {
      objc_msgSend(v25, "objectAtIndex:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "appendFormat:", CFSTR("; target= <%@>"), v26);

      v27 = v30;
    }
    else
    {
      v27 = v30;
      if ((unint64_t)objc_msgSend(v25, "count") >= 2)
        objc_msgSend(a2, "appendFormat:", CFSTR("; targets= <%@>"), *(_QWORD *)(a1 + 24));
    }
    objc_msgSend((id)a1, "_appendSubclassDescription:", a2);
    if (v27)
    {
      v28 = *(void **)(a1 + 160);
      if (v28)
        -[UIGestureRecognizer _appendDescription:forDependencies:toString:atLevel:]((uint64_t)CFSTR("must-fail"), v28, a2, a3 + 1);
      v29 = *(void **)(a1 + 168);
      if (v29)
        -[UIGestureRecognizer _appendDescription:forDependencies:toString:atLevel:]((uint64_t)CFSTR("must-fail-for"), v29, a2, a3 + 1);
    }
    objc_msgSend(a2, "appendFormat:", CFSTR(">"));

    objc_autoreleasePoolPop(v8);
  }
}

- (BOOL)cancelsTouchesInView
{
  return (*(_QWORD *)&self->_gestureFlags >> 29) & 1;
}

- (BOOL)delaysTouchesEnded
{
  return (*(_QWORD *)&self->_gestureFlags >> 31) & 1;
}

- (id)_rawBriefDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB37A0];
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@: %p"), v4, a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      objc_msgSend(v5, "appendFormat:", CFSTR(" (%@)"), v6);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)lastTouchTimestamp
{
  return self->_lastTouchTimestamp;
}

- (void)removeTarget:(id)target action:(SEL)action
{
  NSMutableArray *targets;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  targets = self->_targets;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = targets;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v21;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        if (target)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "target");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14 == target)
          {
            v15 = target;
            if (!action)
              goto LABEL_23;
            v17 = (const char *)objc_msgSend(v13, "action");

            if (v17 == action)
            {
LABEL_12:
              if (!v10)
                goto LABEL_13;
              goto LABEL_14;
            }
          }
          else
          {
            v15 = v14;
            objc_msgSend(v13, "target");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {

              goto LABEL_15;
            }
            if (!action)
            {
LABEL_23:

              if (!v10)
LABEL_13:
                v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
LABEL_14:
              -[NSMutableArray addObject:](v10, "addObject:", v13, (_QWORD)v20);
              goto LABEL_15;
            }
            v18 = (const char *)objc_msgSend(v13, "action");

            if (v18 == action)
              goto LABEL_12;
          }
        }
        else if (!action
               || (SEL)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "action", (_QWORD)v20) == action)
        {
          goto LABEL_12;
        }
LABEL_15:
        ++v12;
      }
      while (v9 != v12);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v9 = v19;
      if (!v19)
      {

        if (v10)
        {
          -[NSMutableArray removeObjectsInArray:](v7, "removeObjectsInArray:", v10);
          goto LABEL_29;
        }
        return;
      }
    }
  }
  v10 = v7;
LABEL_29:

}

uint64_t __30__UIGestureRecognizer_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 168), "removeObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __30__UIGestureRecognizer_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 160), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_isTouchGestureRecognizer
{
  void *v2;
  BOOL v3;

  -[UIGestureRecognizer allowedTouchTypes](self, "allowedTouchTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_setRecognitionEvent:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, sel__recognitionEvent, v4, (void *)1);

}

+ (BOOL)_supportsDefaultTouchTypes
{
  return !_UIDeviceHasExternalTouchInput();
}

+ (BOOL)_supportsStylusTouches
{
  return 1;
}

+ (BOOL)_shouldUseLinearForceLevelClassifier
{
  return 0;
}

void __45__UIGestureRecognizer_initWithTarget_action___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_6;
  if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_6)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_6);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a target. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v6, 0x16u);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIGestureRecognizer)initWithCoder:(NSCoder *)coder
{
  UIGestureRecognizer *v5;
  UIGestureRecognizer *v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *allowedPressTypes;
  _BOOL4 v20;
  uint64_t v21;
  objc_super v23;

  if (dyld_program_sdk_at_least())
  {
    v5 = -[UIGestureRecognizer init](self, "init");
    if (!v5)
      return v5;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)UIGestureRecognizer;
    v6 = -[UIGestureRecognizer init](&v23, sel_init);
    v5 = v6;
    if (!v6)
      return v5;
    _UIGestureRecognizerCommonInit((uint64_t)v6);
  }
  v7 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("UIGestureRecognizer.disabled"));
  v8 = 0x100000000;
  if (!v7)
    v8 = 0;
  *(_QWORD *)&v5->_gestureFlags = *(_QWORD *)&v5->_gestureFlags & 0xFFFFFFFEFFFFFFFFLL | v8;
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("UIGestureRecognizer.cancelsTouchesInView")))
  {
    v9 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("UIGestureRecognizer.cancelsTouchesInView"));
    v10 = 0x20000000;
    if (!v9)
      v10 = 0;
    *(_QWORD *)&v5->_gestureFlags = *(_QWORD *)&v5->_gestureFlags & 0xFFFFFFFFDFFFFFFFLL | v10;
  }
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("UIGestureRecognizer.delaysTouchesBegan")))
  {
    v11 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("UIGestureRecognizer.delaysTouchesBegan"));
    v12 = 0x40000000;
    if (!v11)
      v12 = 0;
    *(_QWORD *)&v5->_gestureFlags = *(_QWORD *)&v5->_gestureFlags & 0xFFFFFFFFBFFFFFFFLL | v12;
  }
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("UIGestureRecognizer.delaysTouchesEnded")))
  {
    v13 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("UIGestureRecognizer.delaysTouchesEnded"));
    v14 = 0x80000000;
    if (!v13)
      v14 = 0;
    *(_QWORD *)&v5->_gestureFlags = *(_QWORD *)&v5->_gestureFlags & 0xFFFFFFFF7FFFFFFFLL | v14;
  }
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("UIGestureRecognizer.allowedTouchTypes")))
    v5->_allowedTouchTypes = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("UIGestureRecognizer.allowedTouchTypes"));
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", v17, CFSTR("UIGestureRecognizer.allowedPressTypes"));
  v18 = objc_claimAutoreleasedReturnValue();
  allowedPressTypes = v5->_allowedPressTypes;
  v5->_allowedPressTypes = (NSArray *)v18;

  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("UIGestureRecognizer.requiredPreviewForceState")))
  {
    v5->_requiredPreviewForceState = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("UIGestureRecognizer.requiredPreviewForceState"));
  }
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("UIGestureRecognizer.requiresExclusiveTouchType")))
  {
    v20 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("UIGestureRecognizer.requiresExclusiveTouchType"));
    v21 = 0x20000000000;
    if (!v20)
      v21 = 0;
    *(_QWORD *)&v5->_gestureFlags = *(_QWORD *)&v5->_gestureFlags & 0xFFFFFDFFFFFFFFFFLL | v21;
  }
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("UIGestureRecognizer._analyticsGestureHandled")))
  {
    v5->_analyticsGestureHandled = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("UIGestureRecognizer._analyticsGestureHandled"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t gestureFlags;
  int64_t requiredPreviewForceState;

  gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x100000000) != 0)
  {
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("UIGestureRecognizer.disabled"));
    gestureFlags = (uint64_t)self->_gestureFlags;
    if ((gestureFlags & 0x20000000) != 0)
    {
LABEL_3:
      if ((gestureFlags & 0x40000000) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((gestureFlags & 0x20000000) != 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a3, "encodeBool:forKey:", 0, CFSTR("UIGestureRecognizer.cancelsTouchesInView"));
  gestureFlags = (uint64_t)self->_gestureFlags;
  if ((gestureFlags & 0x40000000) == 0)
  {
LABEL_4:
    if ((gestureFlags & 0x80000000) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("UIGestureRecognizer.delaysTouchesBegan"));
  if ((*(_QWORD *)&self->_gestureFlags & 0x80000000) == 0)
LABEL_5:
    objc_msgSend(a3, "encodeBool:forKey:", 0, CFSTR("UIGestureRecognizer.delaysTouchesEnded"));
LABEL_6:
  objc_msgSend(a3, "encodeInteger:forKey:", self->_allowedTouchTypes, CFSTR("UIGestureRecognizer.allowedTouchTypes"));
  if (-[NSArray count](self->_allowedPressTypes, "count"))
    objc_msgSend(a3, "encodeObject:forKey:", self->_allowedPressTypes, CFSTR("UIGestureRecognizer.allowedPressTypes"));
  requiredPreviewForceState = self->_requiredPreviewForceState;
  if (requiredPreviewForceState)
    objc_msgSend(a3, "encodeInteger:forKey:", requiredPreviewForceState, CFSTR("UIGestureRecognizer.requiredPreviewForceState"));
  objc_msgSend(a3, "encodeBool:forKey:", (*(_QWORD *)&self->_gestureFlags >> 41) & 1, CFSTR("UIGestureRecognizer.requiresExclusiveTouchType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_analyticsGestureHandled, CFSTR("UIGestureRecognizer._analyticsGestureHandled"));
}

- (void)_updateContainer:(uint64_t)a1
{
  id *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  __CFString *v37;
  id WeakRetained;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE buf[12];
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_storeWeak(v4, a2);
    v5 = dyld_program_sdk_at_least();
    if (!a2 && v5 && WeakRetained && (*(_QWORD *)(a1 + 8) & 0x200000000) != 0)
    {
      v6 = _cancelGestureForNewContainerIfNecessary_previousContainer____s_category[0];
      if (!_cancelGestureForNewContainerIfNecessary_previousContainer____s_category[0])
      {
        v6 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, _cancelGestureForNewContainerIfNecessary_previousContainer____s_category);
      }
      if ((*(_BYTE *)v6 & 1) != 0)
      {
        v33 = *(id *)(v6 + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)a1, "_briefDescription");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          v36 = *(_QWORD *)(a1 + 72);
          if (v36 > 5)
            v37 = 0;
          else
            v37 = off_1E16C94F0[v36];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v34;
          v44 = 2112;
          v45 = v37;
          _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "%@: Cancelling gesture because the container was set to nil while in state %@", buf, 0x16u);

        }
      }
      v7 = *(_QWORD *)(a1 + 256);
      *(_QWORD *)buf = a1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIGestureEnvironment _cancelGestureRecognizers:](v7, v8);

    }
    viewFromContainer(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (*(_QWORD *)(a1 + 112) && -[UIGestureRecognizer _inForceCapableEnvironment]((void *)a1))
        -[UIGestureRecognizer _ensureForceObservationChain](a1);
      if ((*(_QWORD *)(a1 + 8) & 0x8000000000) != 0)
      {
        objc_msgSend(v9, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "_createSystemGestureGateGestureRecognizerIfNeeded");
          objc_msgSend(v11, "_createOtherSystemGateGestureRecognizersIfNeeded");
        }

      }
      objc_msgSend(v9, "_window");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = objc_msgSend((id)a1, "_wantsPartialTouchSequences");

        if (v14)
        {
          v15 = (void *)UIApp;
          objc_msgSend(v9, "_window");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v15, "_touchesEventForWindow:", v16);

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v17, "allTouches");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v40 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v23, "view");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v24)
                {
                  objc_msgSend(v23, "window");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "hitTest:withEvent:", 0, -[UITouch _locationInWindow:]((double *)v23, 0));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                }
                if (objc_msgSend((id)a1, "_shouldReceiveTouch:forEvent:recognizerView:", v23, v17, v9))
                {
                  -[UITouch _addGestureRecognizer:]((uint64_t)v23, (void *)a1);
                  objc_msgSend(v17, "_touchesForKey:", a1);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "addObject:", v23);

                  objc_msgSend(v17, "_invalidateGestureRecognizerForWindowCache");
                }

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
            }
            while (v20);
          }

        }
      }
      objc_msgSend(v9, "_window");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = *(_QWORD *)(a1 + 8);

        if ((v28 & 0x800000000000000) != 0)
        {
          v29 = (void *)UIApp;
          objc_msgSend(v9, "_window");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (id)objc_msgSend(v29, "_hoverEventForWindow:", v30);

          objc_msgSend(v9, "_window");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setNeedsHitTestResetForWindow:", v32);

        }
      }
    }

  }
}

- (void)setContainer:(uint64_t)a1
{
  id *v4;
  id WeakRetained;
  id v6;
  id v7;
  int has_internal_diagnostics;
  BOOL v9;
  char v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  if (a1)
  {
    v4 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    if (WeakRetained != a2)
    {
      v6 = objc_loadWeakRetained(v4);
      -[UIGestureRecognizer _updateContainer:](a1, a2);
      if (a2)
      {
        v7 = viewFromContainer(a2);
        if (v7)
        {
          *(_BYTE *)(a1 + 16) |= 0x80u;
          objc_msgSend((id)a1, "setView:", v7);
          *(_BYTE *)(a1 + 16) &= ~0x80u;
        }
        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (v6)
          v9 = v7 == 0;
        else
          v9 = 0;
        v10 = !v9;
        if (has_internal_diagnostics)
        {
          if ((v10 & 1) == 0)
          {
            viewFromContainer(v6);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              __UIFaultDebugAssertLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Re-attaching UIGestureRecognizer to a container without a view is unsupported", buf, 2u);
              }

            }
          }
        }
        else if ((v10 & 1) == 0)
        {
          viewFromContainer(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = setContainer____s_category;
            if (!setContainer____s_category)
            {
              v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v12, (unint64_t *)&setContainer____s_category);
            }
            v13 = *(NSObject **)(v12 + 8);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v16 = 0;
              _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Re-attaching UIGestureRecognizer to a container without a view is unsupported", v16, 2u);
            }
          }
        }
      }
      else if (viewFromContainer(v6))
      {
        *(_BYTE *)(a1 + 16) |= 0x80u;
        objc_msgSend((id)a1, "setView:", 0);
        *(_BYTE *)(a1 + 16) &= ~0x80u;
      }

    }
  }
}

- (void)_componentsChanged:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;

  v7 = objc_msgSend(a4, "type");
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 0xA)
    -[UIGestureRecognizer _addActiveEvent:]((uint64_t)self, (uint64_t)a4);
  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((_BYTE *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        -[UIGestureRecognizer _driver](self, "_driver");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "touchesMoved:withEvent:", a3, a4);

      }
      -[UIGestureRecognizer touchesMoved:withEvent:](self, "touchesMoved:withEvent:", a3, a4);
      if ((*(_QWORD *)&self->_gestureFlags & 0x4000000) != 0)
        objc_msgSend((id)UIApp, "_registerEstimatedTouches:event:forTouchable:", a3, a4, self);
      break;
    case 3:
    case 4:
      -[UIGestureRecognizer pressesChanged:withEvent:](self, "pressesChanged:withEvent:", a3, a4);
      break;
    case 9:
      if ((~*(_QWORD *)&self->_gestureFlags & 0x300000000000) == 0)
        -[UIGestureRecognizer _draggingUpdatedWithEvent:](self, "_draggingUpdatedWithEvent:", a4);
      break;
    case 10:
      if ((*(_QWORD *)&self->_gestureFlags & 0x1000000000000000) != 0)
        -[UIGestureRecognizer _scrollingChangedWithEvent:](self, "_scrollingChangedWithEvent:", a4);
      break;
    case 11:
      if ((*(_QWORD *)&self->_gestureFlags & 0x800000000000000) != 0)
        -[UIGestureRecognizer _hoverMoved:withEvent:](self, "_hoverMoved:withEvent:", a3, a4);
      break;
    case 14:
      if ((*((_BYTE *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        -[UIGestureRecognizer _driver](self, "_driver");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transformChangedWithEvent:", a4);

      }
      if ((*(_QWORD *)&self->_gestureFlags & 0x2000000000000000) != 0)
        -[UIGestureRecognizer _transformChangedWithEvent:](self, "_transformChangedWithEvent:", a4);
      break;
    case 16:
      if ((*(_QWORD *)&self->_gestureFlags & 0x4000000000000000) != 0)
        -[UIGestureRecognizer _dynamicButtonsChanged:withEvent:](self, "_dynamicButtonsChanged:withEvent:", a3, a4);
      break;
    default:
      return;
  }
}

- (void)_componentsCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  void *v8;

  -[UIGestureRecognizer _updateCachedActiveEventProperties]((uint64_t)self);
  v7 = objc_msgSend(a4, "type");
  switch(v7)
  {
    case 0:
      -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      -[UIGestureRecognizer _updateForceClassifierWithEvent:]((uint64_t)self, a4);
      if ((*((_BYTE *)&self->_gestureFlags + 8) & 0x40) != 0)
      {
        -[UIGestureRecognizer _driver](self, "_driver");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "touchesCancelled:withEvent:", a3, a4);

      }
      -[UIGestureRecognizer touchesCancelled:withEvent:](self, "touchesCancelled:withEvent:", a3, a4);
      if ((*(_QWORD *)&self->_gestureFlags & 0x4000000) != 0)
        objc_msgSend((id)UIApp, "_registerEstimatedTouches:event:forTouchable:", a3, a4, self);
      break;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
      return;
    case 3:
    case 4:
      -[UIGestureRecognizer pressesCancelled:withEvent:](self, "pressesCancelled:withEvent:", a3, a4);
      break;
    case 9:
      if ((~*(_QWORD *)&self->_gestureFlags & 0x300000000000) == 0)
        -[UIGestureRecognizer _draggingExitedWithEvent:](self, "_draggingExitedWithEvent:", a4);
      break;
    case 11:
      if ((*(_QWORD *)&self->_gestureFlags & 0x800000000000000) != 0)
      {
        -[UIGestureRecognizer _hoverCancelled:withEvent:](self, "_hoverCancelled:withEvent:", a3, a4);
        -[UIGestureRecognizer _removeActiveTouchesAndInvalidateInitialTouchTypeIfNeeded:]((uint64_t)self, (uint64_t)a3);
      }
      break;
    default:
      if (v7 == 16 && (*(_QWORD *)&self->_gestureFlags & 0x4000000000000000) != 0)
        -[UIGestureRecognizer _dynamicButtonsCancelled:withEvent:](self, "_dynamicButtonsCancelled:withEvent:", a3, a4);
      break;
  }
}

+ (BOOL)_supportsTouchContinuation
{
  return 1;
}

- (void)_addTouch:(id)a3 forEvent:(id)a4
{
  UIGestureEnvironment *gestureEnvironment;
  _QWORD aBlock[7];

  if (objc_msgSend((id)objc_opt_class(), "_supportsTouchContinuation")
    && (-[NSMutableSet containsObject:](self->_internalActiveTouches, "containsObject:", a3) & 1) == 0)
  {
    -[UITouch _addGestureRecognizer:]((uint64_t)a3, self);
    objc_msgSend(a4, "_addTouch:forDelayedDelivery:", a3, 1);
    if ((unint64_t)(objc_msgSend(a3, "phase") - 5) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      gestureEnvironment = self->_gestureEnvironment;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __42__UIGestureRecognizer__addTouch_forEvent___block_invoke;
      aBlock[3] = &unk_1E16B47A8;
      aBlock[4] = a3;
      aBlock[5] = self;
      aBlock[6] = a4;
      -[UIGestureEnvironment _addPreUpdateAction:]((uint64_t)gestureEnvironment, aBlock);
    }
  }
}

uint64_t __42__UIGestureRecognizer__addTouch_forEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "phase");
  objc_msgSend(*(id *)(a1 + 32), "setPhase:", 0);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_componentsBegan:withEvent:", v4, *(_QWORD *)(a1 + 48));

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    *(_QWORD *)(v5 + 8) |= 0x200000000uLL;
  return objc_msgSend(*(id *)(a1 + 32), "setPhase:", v2);
}

- (void)_removeTouch:(id)a3 forEvent:(id)a4
{
  -[UIGestureRecognizer _removeTouch:forEvent:byCancellingTouches:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, 0);
}

- (void)_removeTouch:(uint64_t)a3 forEvent:(char)a4 byCancellingTouches:
{
  uint64_t v8;
  _QWORD v9[7];
  char v10;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 96), "containsObject:", a2))
    {
      v8 = *(_QWORD *)(a1 + 256);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __65__UIGestureRecognizer__removeTouch_forEvent_byCancellingTouches___block_invoke;
      v9[3] = &unk_1E16B4030;
      v9[4] = a1;
      v9[5] = a2;
      v10 = a4;
      v9[6] = a3;
      -[UIGestureEnvironment _addPreUpdateAction:](v8, v9);
    }
  }
}

uint64_t __65__UIGestureRecognizer__removeTouch_forEvent_byCancellingTouches___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    *(_QWORD *)(v2 + 8) |= 0x200000000uLL;
  v3 = objc_msgSend(*(id *)(a1 + 40), "phase");
  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v4, "setPhase:", 4);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_componentsCancelled:withEvent:", v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v4, "setPhase:", 3);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_componentsEnded:withEvent:", v6, *(_QWORD *)(a1 + 48));
  }

  objc_msgSend(*(id *)(a1 + 48), "_removeTouch:fromGestureRecognizer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  -[UITouch _removeGestureRecognizer:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "setPhase:", v3);
}

- (void)transferTouchesFromGestureRecognizer:(void *)a1
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a2;
    if (a2)
    {
      v3 = a1;
      v4 = (void *)UIApp;
      objc_msgSend(a1, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v4, "_touchesEventForWindow:", v6);

      v8 = (void *)UIApp;
      objc_msgSend(v2, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v8, "_touchesEventForWindow:", v10);

      if (v7 != v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel_transferTouchesFromGestureRecognizer_, v3, CFSTR("UIGestureRecognizer.m"), 1433, CFSTR("%@ is not in the same window scene as %@"), v2, v3);

      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v2[12];
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        v28 = v3;
        do
        {
          v15 = 0;
          v29 = v13;
          do
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
            objc_msgSend(v3, "view");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "_window");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18
              || (objc_msgSend(v16, "window"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19,
                  v18 == v19))
            {
              objc_msgSend(v2, "_removeTouch:forEvent:", v16, v7);
            }
            else
            {
              v20 = v14;
              v21 = v2;
              v33 = 0u;
              v34 = 0u;
              v31 = 0u;
              v32 = 0u;
              objc_msgSend(v16, "gestureRecognizers");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v32;
                do
                {
                  v26 = 0;
                  do
                  {
                    if (*(_QWORD *)v32 != v25)
                      objc_enumerationMutation(v22);
                    objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v26++), "_removeTouch:forEvent:", v16, v7);
                  }
                  while (v24 != v26);
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
                }
                while (v24);
              }

              objc_msgSend(v16, "setWindow:", v18);
              v2 = v21;
              v14 = v20;
              v3 = v28;
              v13 = v29;
            }
            objc_msgSend(v3, "_addTouch:forEvent:", v16, v7);

            ++v15;
          }
          while (v15 != v13);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v13);
      }

    }
  }
}

- (void)addTouchesFromGestureRecognizer:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v4 = (void *)UIApp;
    objc_msgSend(a1, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "_touchesEventForWindow:", v6);

    v8 = (void *)UIApp;
    objc_msgSend(a2, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v8, "_touchesEventForWindow:", v10);

    if (v7 != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_addTouchesFromGestureRecognizer_, a1, CFSTR("UIGestureRecognizer.m"), 1456, CFSTR("%@ is not in the same window scene as %@"), a2, a1);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = a2[12];
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(a1, "_addTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), v7);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)ignorePress:(UIPress *)button forEvent:(UIPressesEvent *)event
{
  void *v6;

  if (self)
  {
    _UIGestureDelayedTouchForUITouch(button, self->_delayedPresses);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[UIGestureDelayedEventComponentDispatcher enqueueDelayedPressToSend:]((uint64_t)self->_delayedEventComponentDispatcher, (uint64_t)v6);
      -[NSMutableArray removeObject:](self->_delayedPresses, "removeObject:", v6);
    }

  }
  -[UIPress _removeGestureRecognizer:](button, "_removeGestureRecognizer:", self, event);
}

- (id)_activeComponentsForEvent:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a2, "_componentsForGestureRecognizer:", a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "_eventComponentPhase");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "value");

        if (v10 <= 2)
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "addObject:", v8);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_pressWasCancelled:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    _UIGestureDelayedTouchForUITouch(a2, *(void **)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = _pressWasCancelled____s_category;
      if (!_pressWasCancelled____s_category)
      {
        v5 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&_pressWasCancelled____s_category);
      }
      if ((*(_BYTE *)v5 & 1) != 0)
      {
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v7 = v6;
          objc_msgSend((id)a1, "_briefDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 138412546;
          v10 = v8;
          v11 = 2112;
          v12 = a2;
          _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "%@: Cancelling delay of press %@", (uint8_t *)&v9, 0x16u);

        }
      }
      -[UIGestureDelayedEventComponentDispatcher removeDelayedPress:](*(_QWORD *)(a1 + 264), (uint64_t)v4);
      objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);
    }

  }
}

- (BOOL)_isPaused
{
  return 0;
}

- (int64_t)_depthFirstCompare:(id)a3
{
  id WeakRetained;
  id v6;
  int64_t result;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  if (a3)
  {
    v6 = objc_loadWeakRetained((id *)a3 + 6);

    if (WeakRetained && v6)
    {
      result = objc_msgSend(WeakRetained, "_compareGestureRecognizerContainer:", v6);
      if (!result)
      {
        objc_msgSend(WeakRetained, "gestureRecognizers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "indexOfObject:", self);

        objc_msgSend(v6, "gestureRecognizers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "indexOfObject:", a3);

        if (v9 < v11)
          return -1;
        else
          return 1;
      }
      return result;
    }
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v12 = 0;
  else
    v12 = -1;
  if (WeakRetained)
    return v12;
  else
    return 1;
}

- (BOOL)_wantsHoverEventsWhilePointerIsLocked
{
  return 0;
}

- (uint64_t)_shouldReceivePress:(uint64_t)a3 forPressesEvent:
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(result + 8);
    if ((~v6 & 0x80000200000000) != 0)
    {
      v7 = objc_msgSend((id)result, "_shouldReceiveEvent:", a3);
      v8 = 0x80000000000000;
      if (v7)
        v8 = 0x180000000000000;
      v6 = *(_QWORD *)(v5 + 8) & 0xFE7FFFFFFFFFFFFFLL | v8;
      *(_QWORD *)(v5 + 8) = v6;
    }
    if ((v6 & 0x100000000000000) != 0)
    {
      result = -[UIGestureRecognizer _delegateShouldReceivePressesEvent:](v5, a3);
      if ((_DWORD)result)
      {
        result = objc_msgSend((id)v5, "_shouldReceivePress:", a2);
        if ((_DWORD)result)
        {
          result = -[UIGestureRecognizer _delegateShouldReceivePress:](v5, a2);
          if ((_DWORD)result)
          {
            if ((*(_BYTE *)(v5 + 16) & 0x40) != 0)
            {
              objc_msgSend((id)v5, "_driver");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = objc_msgSend(v9, "shouldReceiveComponent:withEvent:", a2, a3);

              return v10;
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_delegateShouldReceivePressesEvent:(uint64_t)result
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 8);
    if ((~v3 & 0x200000200000000) != 0)
    {
      v4 = -[UIGestureRecognizer _delegateShouldReceiveEvent:](result, a2);
      v5 = 0x200000000000000;
      if (v4)
        v5 = 0x600000000000000;
      v3 = *(_QWORD *)(v2 + 8) & 0xF9FFFFFFFFFFFFFFLL | v5;
      *(_QWORD *)(v2 + 8) = v3;
    }
    return (v3 >> 58) & 1;
  }
  return result;
}

- (uint64_t)_delegateShouldReceivePress:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  v5 = WeakRetained;
  v6 = *(_QWORD *)(a1 + 8);
  if ((v6 & 0x10000) == 0)
    goto LABEL_5;
  if (objc_msgSend(WeakRetained, "_gestureRecognizer:shouldReceivePress:", a1, a2))
  {
    v6 = *(_QWORD *)(a1 + 8);
LABEL_5:
    if ((v6 & 0x40) != 0)
      v7 = objc_msgSend(v5, "gestureRecognizer:shouldReceivePress:", a1, a2);
    else
      v7 = 1;
    goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (!a3)
    return 1;
  -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (uint64_t)_delegateShouldReceiveDynamicButtonEvent:(uint64_t)result
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 16);
    if (~*(_QWORD *)(result + 8) & 0x200000000 | ~(_BYTE)v3 & 2)
    {
      v4 = -[UIGestureRecognizer _delegateShouldReceiveEvent:](result, a2);
      v5 = 2;
      if (v4)
        v5 = 6;
      v3 = *(_BYTE *)(v2 + 16) & 0xF9 | (unint64_t)v5;
      *(_BYTE *)(v2 + 16) = v3;
    }
    return (v3 >> 2) & 1;
  }
  return result;
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  return 1;
}

- (uint64_t)_delegateShouldReceiveDynamicButton:(uint64_t)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  v5 = WeakRetained;
  if ((*(_QWORD *)(a1 + 8) & 0x200000) != 0)
    v6 = objc_msgSend(WeakRetained, "_gestureRecognizer:shouldReceiveDynamicButton:", a1, a2);
  else
    v6 = 1;

  return v6;
}

- (uint64_t)_shouldReceiveDynamicButton:(uint64_t)a3 forEvent:
{
  char v6;

  if (!a1)
    return 0;
  if ((~*(_QWORD *)(a1 + 8) & 0x8000000200000000) != 0)
  {
    v6 = *(_BYTE *)(a1 + 16) & 0xFE | (objc_msgSend((id)a1, "_shouldReceiveEvent:", a3) != 0);
    *(_QWORD *)(a1 + 8) |= 0x8000000000000000;
    *(_BYTE *)(a1 + 16) = v6;
    if ((v6 & 1) == 0)
      return 0;
  }
  else if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    return 0;
  }
  if (-[UIGestureRecognizer _delegateShouldReceiveDynamicButtonEvent:](a1, a3)
    && objc_msgSend((id)a1, "_shouldReceiveDynamicButton:", a2))
  {
    return -[UIGestureRecognizer _delegateShouldReceiveDynamicButton:](a1, a2);
  }
  return 0;
}

- (int64_t)_buttonMask
{
  return self->_buttonMask;
}

- (int64_t)_defaultAllowedMouseButtons
{
  return 1;
}

- (id)_beganObservable
{
  if (a1)
    a1 = (id *)a1[19];
  return a1;
}

- (void)_ensureForceObservationChain
{
  void *v2;
  int v3;
  __objc2_class **v4;
  id v5;
  void *v6;
  void *v7;
  _UITouchForceObservable *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (a1)
  {
    v2 = *(void **)(a1 + 104);
    if (!v2)
    {
      v3 = objc_msgSend((id)objc_opt_class(), "_shouldUseLinearForceLevelClassifier");
      v4 = off_1E167C8E0;
      if (!v3)
        v4 = off_1E167CB90;
      v5 = objc_alloc_init(*v4);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v2 = *(void **)(a1 + 104);
    }
    objc_msgSend(v2, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != (void *)a1)
      objc_msgSend(*(id *)(a1 + 104), "setDelegate:", a1);
    if (!*(_QWORD *)(a1 + 120))
    {
      v8 = objc_alloc_init(_UITouchForceObservable);
      v9 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v8;

      *(_QWORD *)(a1 + 144) = 0;
      *(_QWORD *)(a1 + 8) &= 0xFFF9FFFFFFFFFFFFLL;
      v10 = objc_alloc_init(MEMORY[0x1E0CB3808]);
      v11 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = v10;

    }
    if (!*(_QWORD *)(a1 + 128))
    {
      objc_msgSend(*(id *)(a1 + 120), "addObserver:", *(_QWORD *)(a1 + 104));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v12;

    }
  }
}

- (uint64_t)_delegateCanCancelGestureRecognizer:(uint64_t)a1
{
  id WeakRetained;
  uint64_t v6;

  if ((*(_QWORD *)(a1 + 8) & 0x80000) == 0)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  v6 = objc_msgSend(WeakRetained, "_gestureRecognizer:canCancelGestureRecognizer:", a1, a2);

  return v6;
}

- (uint64_t)_delegateCanBeCancelledByGestureRecognizer:(uint64_t)a1
{
  id WeakRetained;
  uint64_t v6;

  if (!a1 || (*(_QWORD *)(a1 + 8) & 0x100000) == 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
  v6 = objc_msgSend(WeakRetained, "_gestureRecognizer:canBeCancelledByGestureRecognizer:", a1, a2);

  return v6;
}

void __54__UIGestureRecognizer_requireGestureRecognizerToFail___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_LinkCheckShouldFailOnPressesBeganIfNotTrackingTouches_block_invoke_2___s_category;
  if (!_UIInternalPreference_LinkCheckShouldFailOnPressesBeganIfNotTrackingTouches_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_LinkCheckShouldFailOnPressesBeganIfNotTrackingTouches_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Attempting set a failure requirement between a gesture recognizer and itself. (%@)", (uint8_t *)&v5, 0xCu);
  }
}

- (void)removeFailureRequirement:(id)a3
{
  UIGestureEnvironment *gestureEnvironment;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[UIGestureEnvironment removeRequirementForGestureRecognizer:requiringGestureRecognizerToFail:]((uint64_t)self->_gestureEnvironment, (uint64_t)self, (uint64_t)a3);
    -[NSMutableSet removeObject:](self->_failureRequirements, "removeObject:", a3);
    objc_msgSend(*((id *)a3 + 21), "removeObject:", self);
    -[UIGestureRecognizer _requiredGestureRecognizerCompletedOrWasUnrelated:]((uint64_t)self, a3);
    gestureEnvironment = self->_gestureEnvironment;
    v7[0] = self;
    v7[1] = a3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _queueGestureRecognizersForResetIfFinished:]((uint64_t)gestureEnvironment, v6);

  }
}

- (BOOL)_canExcludeWithActiveRequirements
{
  return (*(_QWORD *)&self->_gestureFlags >> 47) & 1;
}

- (BOOL)_hasUnmetFailureRequirements
{
  _BOOL4 v3;

  if ((-[UIGestureEnvironment unmetRequirementsForGestureRecognizer:]((uint64_t)self->_gestureEnvironment, (uint64_t)self) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[UIGestureRecognizer _shouldDelayUntilForceLevelRequirementIsMet](self, "_shouldDelayUntilForceLevelRequirementIsMet");
    if (v3)
      LOBYTE(v3) = (*(_QWORD *)&self->_gestureFlags & 0x80000000000) == 0;
  }
  return v3;
}

- (int64_t)requiredPreviewForceState
{
  return self->_requiredPreviewForceState;
}

- (void)setRequiredPreviewForceState:(int64_t)a3
{
  if (a3 && -[UIGestureRecognizer _inForceCapableEnvironment](self))
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
  -[UIGestureRecognizer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("requiredPreviewForceState"));
  self->_requiredPreviewForceState = a3;
  -[UIGestureRecognizer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("requiredPreviewForceState"));
}

- (int64_t)currentPreviewForceState
{
  int64_t result;

  result = (int64_t)self->_forceClassifier;
  if (result)
    return objc_msgSend((id)result, "currentForceLevel");
  return result;
}

- (id)_touchForceObservable
{
  _UITouchForceObservable *touchForceObservable;

  touchForceObservable = self->_touchForceObservable;
  if (!touchForceObservable)
  {
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
    touchForceObservable = self->_touchForceObservable;
  }
  return touchForceObservable;
}

- (id)_forceLevelClassifier
{
  _UIForceLevelClassifier *forceClassifier;

  forceClassifier = self->_forceClassifier;
  if (!forceClassifier)
  {
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
    forceClassifier = self->_forceClassifier;
  }
  return forceClassifier;
}

- (void)_setForceLevelClassifier:(id)a3
{
  _UIForceLevelClassifier *forceClassifier;
  _UIForceLevelClassifier **p_forceClassifier;
  NSObservation *touchForceObservableAndClassifierObservation;

  p_forceClassifier = &self->_forceClassifier;
  forceClassifier = self->_forceClassifier;
  if (forceClassifier != a3)
  {
    -[_UIForceLevelClassifier setDelegate:](forceClassifier, "setDelegate:", 0);
    touchForceObservableAndClassifierObservation = self->_touchForceObservableAndClassifierObservation;
    self->_touchForceObservableAndClassifierObservation = 0;

    objc_storeStrong((id *)p_forceClassifier, a3);
    -[UIGestureRecognizer _ensureForceObservationChain]((uint64_t)self);
  }
}

- (void)_forceLevelClassifier:(id)a3 currentForceLevelDidChange:(int64_t)a4
{
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*(_QWORD *)&self->_gestureFlags & 0x80000000000) == 0
    && -[UIGestureRecognizer _shouldDelayUntilForceLevelRequirementIsMet](self, "_shouldDelayUntilForceLevelRequirementIsMet")&& self->_requiredPreviewForceState <= objc_msgSend(a3, "currentForceLevel"))
  {
    v7 = _forceLevelClassifier_currentForceLevelDidChange____s_category;
    if (!_forceLevelClassifier_currentForceLevelDidChange____s_category)
    {
      v7 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_forceLevelClassifier_currentForceLevelDidChange____s_category);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v11 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        -[UIGestureRecognizer _briefDescription](self, "_briefDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%@: Force requirement for satisfied", (uint8_t *)&v14, 0xCu);

      }
    }
    *(_QWORD *)&self->_gestureFlags |= 0x80000000000uLL;
    -[UIGestureEnvironment setGestureNeedsUpdate:]((uint64_t)self->_gestureEnvironment, (uint64_t)self);
  }
  if (objc_msgSend(a3, "currentForceLevel") != a4)
  {
    if (!self->_state && (*(_QWORD *)&self->_gestureFlags & 0x2000000000000) == 0)
    {
      v8 = -[UIGestureRecognizer _shouldBegin](self, "_shouldBegin");
      v9 = 0x2000000000000;
      if (v8)
        v9 = 0x6000000000000;
      *(_QWORD *)&self->_gestureFlags = *(_QWORD *)&self->_gestureFlags & 0xFFF9FFFFFFFFFFFFLL | v9;
    }
    if (objc_msgSend(a3, "currentForceLevel") > a4)
    {
      v10 = objc_msgSend(a3, "currentForceLevel");
      if (v10 == -[UIGestureRecognizer requiredPreviewForceState](self, "requiredPreviewForceState"))
        ++self->_forcePressCount;
    }
    if ((*(_QWORD *)&self->_gestureFlags & 0x4000000000000) != 0)
    {
      if (-[NSMutableArray count](self->_forceTargets, "count"))
        _UIGestureRecognizerSendTargetActions((uint64_t)self, self->_forceTargets);
    }
  }
}

- (void)_addForceTarget:(void *)a3 action:
{
  id *v5;
  uint64_t v6;
  id v7;

  if (a1)
  {
    v5 = (id *)(a1 + 136);
    if (!*(_QWORD *)(a1 + 136))
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v7 = *v5;
      *v5 = (id)v6;

    }
    _UIGestureRecognizerAddTargetToArray(v5, a2, a3);
  }
}

- (NSString)_briefDescription
{
  void *v3;
  void *v4;
  UIGestureRecognizerState v5;
  __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIGestureRecognizer _rawBriefDescription](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIGestureRecognizer state](self, "state");
  if ((unint64_t)v5 > UIGestureRecognizerStateFailed)
    v6 = 0;
  else
    v6 = off_1E16C94F0[v5];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; state = %@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (uint64_t)_appendDescription:(uint64_t)a1 forDependencies:(void *)a2 toString:(void *)a3 atLevel:(int)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  uint64_t v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "appendFormat:", CFSTR("; %@ = {"), a1);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((v11 & 1) == 0)
          objc_msgSend(a3, "appendString:", CFSTR(","));
        -[UIGestureRecognizer _appendDescriptionToString:atLevel:includingDependencies:](v13, a3, (a4 + 1), 0);
        v11 = 0;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v11 = 0;
    }
    while (v9);
  }

  objc_msgSend(a3, "appendString:", CFSTR("\n"));
  if (a4)
  {
    v14 = 1;
    do
    {
      objc_msgSend(a3, "appendString:", CFSTR("    "));
      ++v14;
    }
    while (v14 <= a4);
  }
  return objc_msgSend(a3, "appendString:", CFSTR("}"));
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v6 = a4;
  }
  else
  {
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_convertPointFromSceneReferenceSpace:", x, y);
    x = v10;
    y = v11;
  }
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v6 = a4;
  }
  else
  {
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  v11 = v9;
  v12 = v10;
  if (v8)
  {
    objc_msgSend(v8, "_convertPointToSceneReferenceSpace:", v9, v10);
    v11 = v13;
    v12 = v14;
  }

  v15 = v11;
  v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)locationOfTouch:(NSUInteger)touchIndex inView:(UIView *)view
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  CGPoint result;

  -[UIGestureRecognizer _activeTouchesEvent](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "touchesForGestureRecognizer:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") <= touchIndex)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("-[%@ %@]"), v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%ld) beyond bounds (%ld)."), v11, touchIndex, objc_msgSend(v9, "count"));
    v14 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingSelector:", sel__compareIndex_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectAtIndex:", touchIndex);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationInView:", view);
    v14 = v13;
    v16 = v15;

  }
  v21 = v14;
  v22 = v16;
  result.y = v22;
  result.x = v21;
  return result;
}

- (uint64_t)_defaultAllowedTouchTypesMask
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (result)
  {
    if ((objc_msgSend((id)objc_opt_class(), "_supportsDefaultTouchTypes") & 1) != 0)
      goto LABEL_13;
    v1 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", sel__shouldDefaultToTouches);
    if (v1 == +[UIGestureRecognizer methodForSelector:](UIGestureRecognizer, "methodForSelector:", sel__shouldDefaultToTouches))return 0;
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _shouldDefaultToTouchesOverride(UIGestureRecognizer *const __strong)");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIGestureRecognizer.m"), 3193, CFSTR("Overriding _shouldDefaultToTouches is no longer supported. Please explicitly set allowedTouchTypes and allowedPressTypes."));

    }
    else
    {
      if (!os_variant_has_internal_diagnostics())
      {
        v4 = _shouldDefaultToTouchesOverride___s_category;
        if (!_shouldDefaultToTouchesOverride___s_category)
        {
          v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&_shouldDefaultToTouchesOverride___s_category);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Overriding _shouldDefaultToTouches is no longer supported. Please explicitly set allowedTouchTypes and allowedPressTypes.  This will become an assert in a future version.", v6, 2u);
        }
LABEL_12:
        if (objc_msgSend((id)objc_opt_class(), "_shouldDefaultToTouches"))
        {
LABEL_13:
          if (objc_msgSend((id)objc_opt_class(), "_supportsStylusTouches"))
            return 15;
          else
            return 11;
        }
        return 0;
      }
      __UIFaultDebugAssertLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v2, OS_LOG_TYPE_FAULT, "Overriding _shouldDefaultToTouches is no longer supported. Please explicitly set allowedTouchTypes and allowedPressTypes.  This will become an assert in a future version.", buf, 2u);
      }
    }

    goto LABEL_12;
  }
  return result;
}

- (id)_defaultAllowedTouchTypes
{
  unint64_t v1;

  if (a1)
  {
    v1 = -[UIGestureRecognizer _defaultAllowedTouchTypesMask]((uint64_t)a1);
    _UIGestureRecognizerAllowedTouchTypesArrayFromMask(v1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_UIGestureRecognizerDriver)_driver
{
  return 0;
}

- (void)_gestureRecognizerDriver:(id)a3 didUpdateState:(int64_t)a4 previousState:(int64_t)a5
{
  UIGestureRecognizerState v9;
  uint64_t v10;

  v9 = -[UIGestureRecognizer state](self, "state");
  if (v9 <= UIGestureRecognizerStateChanged)
  {
    switch(a4)
    {
      case 3:
        if (v9 < UIGestureRecognizerStateBegan)
        {
          v10 = 5;
        }
        else if ((*(_QWORD *)&self->_gestureFlags & 0x400000000) != 0)
        {
          v10 = 4;
        }
        else
        {
          v10 = 5;
        }
        break;
      case 2:
        v10 = 3;
        break;
      case 1:
        if (v9)
          v10 = 2;
        else
          v10 = 1;
        break;
      default:
LABEL_16:
        -[UIGestureRecognizer _stateUpdatedForDriver:previousState:](self, "_stateUpdatedForDriver:previousState:", a3, a5);
        return;
    }
    -[UIGestureRecognizer setState:](self, "setState:", v10);
    goto LABEL_16;
  }
}

- (BOOL)_keepTouchesOnContinuation
{
  return self->_keepTouchesOnContinuation;
}

- (void)setDelayedEventComponentDispatcher:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 264), a2);
}

- (BOOL)_wantsGESEvents
{
  return self->_wantsGESEvents;
}

- (void)_wantsGESEvents:(BOOL)a3
{
  self->_wantsGESEvents = a3;
}

- (void)_connectInterfaceBuilderEventConnection:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "target");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "action");

  -[UIGestureRecognizer addTarget:action:](self, "addTarget:action:", v6, v5);
}

@end
