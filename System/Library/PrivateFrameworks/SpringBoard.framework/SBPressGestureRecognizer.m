@implementation SBPressGestureRecognizer

- (SBPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBPressGestureRecognizer *v4;
  uint64_t v5;
  NSMutableArray *unbalancedPressBeganTypes;
  uint64_t v7;
  NSMutableArray *delayedPressesInfo;
  uint64_t v9;
  NSSet *delayablePressTypes;
  NSSet *precedencePressTypes;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBPressGestureRecognizer;
  v4 = -[SBPressGestureRecognizer initWithTarget:action:](&v14, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v5 = objc_claimAutoreleasedReturnValue();
    unbalancedPressBeganTypes = v4->_unbalancedPressBeganTypes;
    v4->_unbalancedPressBeganTypes = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v7 = objc_claimAutoreleasedReturnValue();
    delayedPressesInfo = v4->_delayedPressesInfo;
    v4->_delayedPressesInfo = (NSMutableArray *)v7;

    v4->_internalGestureState = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    delayablePressTypes = v4->_delayablePressTypes;
    v4->_delayablePressTypes = (NSSet *)v9;

    v4->_waitForPreemptionTimeInterval = 0.075;
    v4->_latestDispatchedPressTimestamp = -1.0;
    precedencePressTypes = v4->_precedencePressTypes;
    v4->_precedencePressTypes = 0;

    v4->_isDispatchingPresses = 0;
    v4->_precedencePressesTime = -1.79769313e308;
    -[SBPressGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    v12 = MEMORY[0x1E0C9AA60];
    -[SBPressGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[SBPressGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", v12);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_waitingGestureStateExpirationTimer, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_waitingForPreemptionTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBPressGestureRecognizer;
  -[SBPressGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (id)name
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPressGestureRecognizer;
  -[SBPressGestureRecognizer name](&v7, sel_name);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)setPressTypesWithPrecedence:(id)a3
{
  NSSet *v4;
  NSSet *precedencePressTypes;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  precedencePressTypes = self->_precedencePressTypes;
  self->_precedencePressTypes = v4;

  -[SBPressGestureRecognizer _allowedPressTypes](self, "_allowedPressTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SBPressGestureRecognizer;
  -[SBPressGestureRecognizer setAllowedPressTypes:](&v7, sel_setAllowedPressTypes_, v6);

}

- (NSArray)pressTypesWithPrecedence
{
  return -[NSSet allObjects](self->_precedencePressTypes, "allObjects");
}

- (void)setAllowedPressTypes:(id)a3
{
  NSSet *v4;
  NSSet *delayablePressTypes;
  void *v6;
  objc_super v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    delayablePressTypes = self->_delayablePressTypes;
    self->_delayablePressTypes = v4;

    -[SBPressGestureRecognizer _allowedPressTypes](self, "_allowedPressTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = self;
    v7.super_class = (Class)SBPressGestureRecognizer;
    -[SBPressGestureRecognizer setAllowedPressTypes:](&v7, sel_setAllowedPressTypes_, v6);

  }
}

- (id)_allowedPressTypes
{
  NSSet *v3;
  NSSet **p_precedencePressTypes;
  void *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;

  v3 = self->_delayablePressTypes;
  p_precedencePressTypes = &self->_precedencePressTypes;
  if (-[NSSet count](self->_precedencePressTypes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", *p_precedencePressTypes);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", self->_delayablePressTypes);
    objc_storeStrong((id *)&self->_precedencePressTypes, v5);
    -[NSSet setByAddingObjectsFromSet:](v3, "setByAddingObjectsFromSet:", *p_precedencePressTypes);
    v6 = objc_claimAutoreleasedReturnValue();

    if (!-[NSSet count](*p_precedencePressTypes, "count"))
    {
      v7 = *p_precedencePressTypes;
      *p_precedencePressTypes = 0;

    }
    v3 = (NSSet *)v6;
  }
  -[NSSet allObjects](v3, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)latestPressType
{
  return self->_latestDispatchedPressType;
}

- (int64_t)latestPressPhase
{
  return self->_latestDispatchedPressPhase;
}

- (double)latestPressTimestamp
{
  return self->_latestDispatchedPressTimestamp;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPressGestureRecognizer;
  -[SBPressGestureRecognizer reset](&v3, sel_reset);
  -[SBPressGestureRecognizer _resetState](self, "_resetState");
}

- (void)processPresses:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSSet *precedencePressTypes;
  void *v12;
  uint64_t v13;
  void *v14;
  NSSet *delayablePressTypes;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSSet count](self->_precedencePressTypes, "count"));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSSet count](self->_delayablePressTypes, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v4;
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        precedencePressTypes = self->_precedencePressTypes;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(precedencePressTypes) = -[NSSet containsObject:](precedencePressTypes, "containsObject:", v12);

        if ((_DWORD)precedencePressTypes)
        {
          v13 = objc_msgSend(v10, "phase");
          v14 = v19;
          if (v13)
            continue;
        }
        else
        {
          delayablePressTypes = self->_delayablePressTypes;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "type"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(delayablePressTypes) = -[NSSet containsObject:](delayablePressTypes, "containsObject:", v16);

          v14 = v18;
          if (!(_DWORD)delayablePressTypes)
            continue;
        }
        objc_msgSend(v14, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  -[SBPressGestureRecognizer _processPrecedencePresses:](self, "_processPrecedencePresses:", v19);
  -[SBPressGestureRecognizer _processDelayablePresses:](self, "_processDelayablePresses:", v18);

}

- (void)_processPrecedencePresses:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "phase", (_QWORD)v11))
          {
            BSContinuousMachTimeNow();
            self->_precedencePressesTime = v10;
            if (self->_waitingForPreemptionTimer)
              -[SBPressGestureRecognizer _cancelGesture](self, "_cancelGesture");
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)_processDelayablePresses:(id)a3
{
  double v4;
  double v5;
  double precedencePressesTime;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  BSAbsoluteMachTimer *v21;
  BSAbsoluteMachTimer *waitingForPreemptionTimer;
  BSAbsoluteMachTimer *v23;
  double waitForPreemptionTimeInterval;
  id v25;
  __int128 v26;
  void *v27;
  id obj;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  obj = a3;
  if (objc_msgSend(obj, "count") || -[SBPressGestureRecognizer _didGestureBegin](self, "_didGestureBegin"))
  {
    BSContinuousMachTimeNow();
    v5 = v4;
    precedencePressesTime = self->_precedencePressesTime;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "sortedArrayUsingDescriptors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogButtonsCombo();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBPressGestureRecognizer _processDelayablePresses:].cold.1(self, v8, v9);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v8;
    v10 = 0;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v11)
    {
      v13 = *(_QWORD *)v32;
      *(_QWORD *)&v12 = 138543874;
      v26 = v12;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v15, "phase", v26) == 4)
          {

            -[SBPressGestureRecognizer _cancelGesture](self, "_cancelGesture");
            goto LABEL_19;
          }
          v16 = objc_msgSend(v15, "phase") == 0;
          SBLogButtonsCombo();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            -[SBPressGestureRecognizer name](self, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v15, "type");
            v20 = objc_msgSend(v15, "phase");
            *(_DWORD *)buf = v26;
            v36 = v18;
            v37 = 2048;
            v38 = v19;
            v39 = 1024;
            v40 = v20;
            _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, "QUEUED %{public}@ pressType: %li phase: %i", buf, 0x1Cu);

          }
          -[SBPressGestureRecognizer _addDelayedPress:](self, "_addDelayedPress:", v15);
          v10 |= v16;
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (self->_precedencePressTypes
      && !-[SBPressGestureRecognizer _didGestureBegin](self, "_didGestureBegin")
      && (v10 & 1) != 0)
    {
      if (v5 - precedencePressesTime >= self->_waitForPreemptionTimeInterval)
      {
        if ((v10 & 1) != 0 && !self->_waitingForPreemptionTimer)
        {
          objc_initWeak((id *)buf, self);
          v21 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBPressGestureRecognizer.waitingForPreemptionTimer"));
          waitingForPreemptionTimer = self->_waitingForPreemptionTimer;
          self->_waitingForPreemptionTimer = v21;

          v23 = self->_waitingForPreemptionTimer;
          waitForPreemptionTimeInterval = self->_waitForPreemptionTimeInterval;
          v25 = MEMORY[0x1E0C80D38];
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __53__SBPressGestureRecognizer__processDelayablePresses___block_invoke;
          v29[3] = &unk_1E8E9EEC8;
          objc_copyWeak(&v30, (id *)buf);
          -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v23, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v29, waitForPreemptionTimeInterval, 0.0);

          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        -[SBPressGestureRecognizer _cancelGesture](self, "_cancelGesture", v5 - precedencePressesTime);
      }
    }
    else
    {
      -[SBPressGestureRecognizer _startDispatchingDelayedPresses](self, "_startDispatchingDelayedPresses");
    }
LABEL_19:

  }
  else
  {
    -[SBPressGestureRecognizer _cancelGesture](self, "_cancelGesture");
  }

}

void __53__SBPressGestureRecognizer__processDelayablePresses___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startDispatchingDelayedPresses");

}

- (void)_addDelayedPress:(id)a3
{
  id v4;
  double v5;
  double v6;
  SBDelayedPressInfo *v7;

  v4 = a3;
  v7 = objc_alloc_init(SBDelayedPressInfo);
  -[SBDelayedPressInfo setType:](v7, "setType:", objc_msgSend(v4, "type"));
  -[SBDelayedPressInfo setPhase:](v7, "setPhase:", objc_msgSend(v4, "phase"));
  objc_msgSend(v4, "timestamp");
  v6 = v5;

  -[SBDelayedPressInfo setTimestamp:](v7, "setTimestamp:", v6);
  -[NSMutableArray addObject:](self->_delayedPressesInfo, "addObject:", v7);

}

- (void)_startDispatchingDelayedPresses
{
  BSAbsoluteMachTimer *waitingForPreemptionTimer;

  -[BSAbsoluteMachTimer invalidate](self->_waitingForPreemptionTimer, "invalidate");
  waitingForPreemptionTimer = self->_waitingForPreemptionTimer;
  self->_waitingForPreemptionTimer = 0;

  if (!-[SBPressGestureRecognizer _isDispatchingDelayedPresses](self, "_isDispatchingDelayedPresses")
    && -[SBPressGestureRecognizer _delayedPressesCount](self, "_delayedPressesCount") >= 1)
  {
    -[SBPressGestureRecognizer _reallyStartDispatchingDelayedPresses](self, "_reallyStartDispatchingDelayedPresses");
  }
}

- (void)_reallyStartDispatchingDelayedPresses
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[SBPressGestureRecognizer _shouldStopDispatching](self, "_shouldStopDispatching"))
  {
    self->_isDispatchingPresses = 0;
  }
  else
  {
    self->_isDispatchingPresses = 1;
    -[NSMutableArray firstObject](self->_delayedPressesInfo, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPressGestureRecognizer _updatePublicPressInfo:](self, "_updatePublicPressInfo:", v3);
    -[SBPressGestureRecognizer _gestureStateInfoForPressInfo:](self, "_gestureStateInfoForPressInfo:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPressGestureRecognizer _applyGestureStateInfo:](self, "_applyGestureStateInfo:", v4);
    -[NSMutableArray removeObject:](self->_delayedPressesInfo, "removeObject:", v3);
    if (-[SBPressGestureRecognizer _shouldStopDispatching](self, "_shouldStopDispatching"))
    {
      self->_isDispatchingPresses = 0;
    }
    else if (self->_internalGestureState)
    {
      v6[0] = *MEMORY[0x1E0C99860];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBPressGestureRecognizer performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__reallyStartDispatchingDelayedPresses, 0, v5, 0.0);

    }
    else
    {
      -[SBPressGestureRecognizer _reallyStartDispatchingDelayedPresses](self, "_reallyStartDispatchingDelayedPresses");
    }

  }
}

- (BOOL)_isDispatchingDelayedPresses
{
  return self->_isDispatchingPresses;
}

- (BOOL)_shouldStopDispatching
{
  int64_t v3;
  BOOL result;

  v3 = -[SBPressGestureRecognizer _delayedPressesCount](self, "_delayedPressesCount");
  result = -[SBPressGestureRecognizer _isGestureFailedOrCancelled](self, "_isGestureFailedOrCancelled");
  if (!v3)
    return 1;
  return result;
}

- (int64_t)_delayedPressesCount
{
  return -[NSMutableArray count](self->_delayedPressesInfo, "count");
}

- (void)_resetDelayedPresses
{
  BSAbsoluteMachTimer *waitingForPreemptionTimer;

  -[BSAbsoluteMachTimer invalidate](self->_waitingForPreemptionTimer, "invalidate");
  waitingForPreemptionTimer = self->_waitingForPreemptionTimer;
  self->_waitingForPreemptionTimer = 0;

  -[NSMutableArray removeAllObjects](self->_delayedPressesInfo, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_unbalancedPressBeganTypes, "removeAllObjects");
}

- (id)_gestureStateInfoForPressInfo:(id)a3
{
  NSMutableArray *unbalancedPressBeganTypes;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SBPressGestureStateInfo *v10;
  uint64_t v12;

  unbalancedPressBeganTypes = self->_unbalancedPressBeganTypes;
  v5 = a3;
  v6 = -[NSMutableArray count](unbalancedPressBeganTypes, "count");
  v12 = 0;
  v7 = objc_msgSend(v5, "type");
  v8 = objc_msgSend(v5, "phase");

  -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:](self, "_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:", v7, v8, &v12);
  if ((unint64_t)(v12 - 3) > 1)
  {
    -[SBPressGestureRecognizer gestureStateInfoForUnbalancedPressBeganCount:previousCount:](self, "gestureStateInfoForUnbalancedPressBeganCount:previousCount:", -[NSMutableArray count](self->_unbalancedPressBeganTypes, "count"), v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_internalGestureState > 0)
      v9 = 4;
    else
      v9 = 5;
    v10 = objc_alloc_init(SBPressGestureStateInfo);
    -[SBPressGestureStateInfo setState:](v10, "setState:", v9);
    return v10;
  }
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:(int64_t)a3 andPhase:(int64_t)a4 result:(int64_t *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSMutableArray indexOfObject:](self->_unbalancedPressBeganTypes, "indexOfObject:", v8);
  v10 = v9;
  if (a4 == 3)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      SBLogButtonsCombo();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:].cold.3();

      v13 = 4;
    }
    else
    {
      -[NSMutableArray removeObjectAtIndex:](self->_unbalancedPressBeganTypes, "removeObjectAtIndex:", v9);
      SBLogButtonsCombo();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:].cold.4();

      v13 = 2;
    }
    goto LABEL_20;
  }
  if (!a4)
  {
    SBLogButtonsCombo();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v12)
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:].cold.1();

      -[NSMutableArray addObject:](self->_unbalancedPressBeganTypes, "addObject:", v8);
      v13 = 1;
    }
    else
    {
      if (v12)
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:].cold.2();

      -[NSMutableArray removeObjectAtIndex:](self->_unbalancedPressBeganTypes, "removeObjectAtIndex:", v10);
      v13 = 3;
    }
LABEL_20:
    *a5 = v13;
    goto LABEL_21;
  }
  SBLogButtonsCombo();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[UIGestureRecognizer sb_briefDescription](self, "sb_briefDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v17;
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v18;
    _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ _updateUnbalanced type:%{public}@ phase is %{public}@, ignoring", (uint8_t *)&v19, 0x20u);

  }
LABEL_21:

}

- (void)_applyGestureStateInfo:(id)a3
{
  id v4;
  int64_t v5;
  char v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  SBPressGestureStateInfo *v11;
  NSObject *v12;
  SBPressGestureStateInfo *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  SBPressGestureRecognizer *v20;
  SBPressGestureStateInfo *v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  v6 = objc_msgSend(v4, "isCoalescing");
  self->_internalGestureState = v5;
  v7 = -[SBPressGestureRecognizer _isGestureFailedOrCancelled](self, "_isGestureFailedOrCancelled");
  if ((v6 & 1) == 0 && !v7)
  {
    -[SBPressGestureRecognizer _stopWaitingGestureStateExpiration](self, "_stopWaitingGestureStateExpiration");
    objc_msgSend(v4, "expirationTime");
    if (v8 != -1.0)
    {
      objc_msgSend(v4, "expirationTime");
      v10 = v9;
      v11 = objc_alloc_init(SBPressGestureStateInfo);
      -[SBPressGestureStateInfo setState:](v11, "setState:", objc_msgSend(v4, "stateUponExpiration"));
      SBLogButtonsCombo();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SBPressGestureRecognizer _applyGestureStateInfo:].cold.2();

      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke;
      v19 = &unk_1E8E9E820;
      v20 = self;
      v21 = v11;
      v13 = v11;
      v14 = (void *)MEMORY[0x1D17E5550](&v16);
      -[SBPressGestureRecognizer _waitGestureStateExpirationWithFireInterval:timerExpiredActionBlock:](self, "_waitGestureStateExpirationWithFireInterval:timerExpiredActionBlock:", v14, v10, v16, v17, v18, v19, v20);

    }
  }
  SBLogButtonsCombo();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[SBPressGestureRecognizer _applyGestureStateInfo:].cold.1();

  -[SBPressGestureRecognizer setState:](self, "setState:", self->_internalGestureState);
}

uint64_t __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;

  SBLogButtonsCombo();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke_cold_1(a1);

  return objc_msgSend(*(id *)(a1 + 32), "_applyGestureStateInfo:", *(_QWORD *)(a1 + 40));
}

- (void)_updatePublicPressInfo:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    self->_latestDispatchedPressType = objc_msgSend(v4, "type");
    self->_latestDispatchedPressPhase = objc_msgSend(v6, "phase");
    objc_msgSend(v6, "timestamp");
    self->_latestDispatchedPressTimestamp = v5;
  }
  else
  {
    -[SBPressGestureRecognizer _resetPublishedPressInfo](self, "_resetPublishedPressInfo");
  }

}

- (void)_waitGestureStateExpirationWithFireInterval:(double)a3 timerExpiredActionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  BSAbsoluteMachTimer *v8;
  BSAbsoluteMachTimer *waitingGestureStateExpirationTimer;
  BSAbsoluteMachTimer *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  SBLogButtonsCombo();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBPressGestureRecognizer _waitGestureStateExpirationWithFireInterval:timerExpiredActionBlock:].cold.1(self);

  -[BSAbsoluteMachTimer invalidate](self->_waitingGestureStateExpirationTimer, "invalidate");
  v8 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBPressGestureRecognizer.waitingGestureStateExpirationTimer"));
  waitingGestureStateExpirationTimer = self->_waitingGestureStateExpirationTimer;
  self->_waitingGestureStateExpirationTimer = v8;

  v10 = self->_waitingGestureStateExpirationTimer;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__SBPressGestureRecognizer__waitGestureStateExpirationWithFireInterval_timerExpiredActionBlock___block_invoke;
  v12[3] = &unk_1E8EC1D10;
  v13 = v6;
  v11 = v6;
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v10, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v12, a3, 0.0);

}

uint64_t __96__SBPressGestureRecognizer__waitGestureStateExpirationWithFireInterval_timerExpiredActionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_stopWaitingGestureStateExpiration
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "sb_briefDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ timer cancel", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_cancelGesture
{
  int64_t internalGestureState;
  uint64_t v4;
  SBPressGestureStateInfo *v5;

  internalGestureState = self->_internalGestureState;
  if (internalGestureState <= 2)
  {
    if (internalGestureState > 0)
      v4 = 4;
    else
      v4 = 5;
    v5 = objc_alloc_init(SBPressGestureStateInfo);
    -[SBPressGestureStateInfo setState:](v5, "setState:", v4);
    -[SBPressGestureRecognizer _updatePublicPressInfo:](self, "_updatePublicPressInfo:", 0);
    -[SBPressGestureRecognizer _applyGestureStateInfo:](self, "_applyGestureStateInfo:", v5);

  }
}

- (BOOL)_didGestureBegin
{
  return (unint64_t)(self->_internalGestureState - 1) < 2;
}

- (BOOL)_isGestureFailedOrCancelled
{
  return (self->_internalGestureState & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)_resetState
{
  unint64_t *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v1, "sb_briefDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBSystemGestureRecognizerStateDescription(*v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v4, v5, "%{public}@ reset:%{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_20();
}

- (void)_resetPublishedPressInfo
{
  self->_latestDispatchedPressTimestamp = -1.0;
}

- (double)waitForPreemptionTimeInterval
{
  return self->_waitForPreemptionTimeInterval;
}

- (void)setWaitForPreemptionTimeInterval:(double)a3
{
  self->_waitForPreemptionTimeInterval = a3;
}

- (int64_t)requiredPressTypesCount
{
  return -[NSSet count](self->_delayablePressTypes, "count");
}

- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4
{
  SBPressGestureStateInfo *v7;
  SBPressGestureStateInfo *v8;
  uint64_t v9;

  v7 = objc_alloc_init(SBPressGestureStateInfo);
  v8 = v7;
  if (!a4)
  {
    if (a3 > 0)
    {
      v9 = 1;
      goto LABEL_9;
    }
LABEL_7:
    -[SBPressGestureStateInfo setIsCoalescing:](v7, "setIsCoalescing:", 1);
    v9 = -[SBPressGestureRecognizer state](self, "state");
    goto LABEL_9;
  }
  if (!a3)
  {
    v9 = 3;
    goto LABEL_9;
  }
  if (a3 == a4)
    goto LABEL_7;
  v9 = 2;
LABEL_9:
  -[SBPressGestureStateInfo setState:](v8, "setState:", v9);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForPreemptionTimer, 0);
  objc_storeStrong((id *)&self->_waitingGestureStateExpirationTimer, 0);
  objc_storeStrong((id *)&self->_unbalancedPressBeganTypes, 0);
  objc_storeStrong((id *)&self->_delayedPressesInfo, 0);
  objc_storeStrong((id *)&self->_precedencePressTypes, 0);
  objc_storeStrong((id *)&self->_delayablePressTypes, 0);
}

- (void)_processDelayablePresses:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 1024;
  v9 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "QUEUEING %{public}@ presses:%d", (uint8_t *)&v6, 0x12u);

  OUTLINED_FUNCTION_20();
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v0, "sb_briefDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ press .Began: adding press", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v0, "sb_briefDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ press .Began: duplicate .Began ", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v0, "sb_briefDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ phase .Ended: missing .Began", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v0, "sb_briefDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ phase .Ended: removing press", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_applyGestureStateInfo:.cold.1()
{
  unint64_t *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v1, "sb_briefDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBSystemGestureRecognizerStateDescription(*v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v4, v5, "%{public}@ setState:%{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_20();
}

- (void)_applyGestureStateInfo:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v1, "sb_briefDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBSystemGestureRecognizerStateDescription(objc_msgSend(v0, "stateUponExpiration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v4, v5, "%{public}@ state upon expiration:%{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_20();
}

void __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "sb_briefDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "%{public}@ timer fired", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)_waitGestureStateExpirationWithFireInterval:(void *)a1 timerExpiredActionBlock:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "sb_briefDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "%{public}@ timer start fireInterval:%g", v4, v5, v6, v7, 2u);

}

@end
