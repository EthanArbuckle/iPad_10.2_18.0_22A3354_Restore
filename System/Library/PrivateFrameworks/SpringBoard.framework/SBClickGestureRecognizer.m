@implementation SBClickGestureRecognizer

- (SBClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBClickGestureRecognizer *v4;
  SBClickGestureRecognizer *v5;
  uint64_t v6;
  NSMutableArray *shortcutPressTypesSubsets;
  uint64_t v8;
  NSMutableSet *receivedPressBeganTypes;
  uint64_t v10;
  NSMutableSet *receivedPressEndedTypes;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBClickGestureRecognizer;
  v4 = -[SBPressGestureRecognizer initWithTarget:action:](&v13, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_gestureWasRecognized = 0;
    v4->_numberOfClicksRequired = 1;
    v4->_allPressesUpRequired = 1;
    v4->_maximumClickDownDuration = 0.75;
    v4->_maximumBetweenClicksDelay = 0.35;
    v4->_maximumClickFormationDuration = 0.75;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    shortcutPressTypesSubsets = v5->_shortcutPressTypesSubsets;
    v5->_shortcutPressTypesSubsets = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
    v8 = objc_claimAutoreleasedReturnValue();
    receivedPressBeganTypes = v5->_receivedPressBeganTypes;
    v5->_receivedPressBeganTypes = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
    v10 = objc_claimAutoreleasedReturnValue();
    receivedPressEndedTypes = v5->_receivedPressEndedTypes;
    v5->_receivedPressEndedTypes = (NSMutableSet *)v10;

  }
  return v5;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBClickGestureRecognizer;
  -[SBPressGestureRecognizer reset](&v3, sel_reset);
  -[SBClickGestureRecognizer resetShortcutsTracking](self, "resetShortcutsTracking");
  self->_recognizedClicksCount = 0;
  self->_gestureWasRecognized = 0;
}

- (BOOL)_areRequiredPressTypesContainedInSet:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_shortcutPressTypesSubsets, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_shortcutPressTypesSubsets;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isSubsetOfSet:", v4, (_QWORD)v11) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = -[SBPressGestureRecognizer requiredPressTypesCount](self, "requiredPressTypesCount");
    LOBYTE(v6) = v9 == objc_msgSend(v4, "count");
  }

  return v6;
}

- (void)addShortcutWithPressTypes:(id)a3
{
  NSMutableArray *shortcutPressTypesSubsets;
  id v4;

  shortcutPressTypesSubsets = self->_shortcutPressTypesSubsets;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](shortcutPressTypesSubsets, "addObject:", v4);

}

- (void)_notePressReceivedWithType:(int64_t)a3 phase:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  if (-[SBPressGestureRecognizer latestPressPhase](self, "latestPressPhase", a3, a4))
  {
    if (-[SBPressGestureRecognizer latestPressPhase](self, "latestPressPhase") != 3)
      return;
    v6 = 448;
  }
  else
  {
    v6 = 440;
  }
  v7 = *(Class *)((char *)&self->super.super.super.isa + v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:");

}

- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4
{
  SBPressGestureStateInfo *v7;
  _BOOL4 v8;
  int *v9;
  uint64_t v10;
  unint64_t recognizedClicksCount;
  unint64_t v12;
  uint64_t v13;
  SBPressGestureStateInfo *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(SBPressGestureStateInfo);
  -[SBClickGestureRecognizer _notePressReceivedWithType:phase:](self, "_notePressReceivedWithType:phase:", -[SBPressGestureRecognizer latestPressType](self, "latestPressType"), -[SBPressGestureRecognizer latestPressPhase](self, "latestPressPhase"));
  if (!self->_numberOfClicksRequired || self->_gestureWasRecognized)
  {
    -[SBPressGestureStateInfo setState:](v7, "setState:", 3);
    goto LABEL_20;
  }
  if (a4 < a3)
  {
    v8 = -[SBClickGestureRecognizer didReceiveRequiredPressBeganCount](self, "didReceiveRequiredPressBeganCount");
    self->_allPressBeganReceived = v8;
    if (!a4 || v8)
    {
      -[SBPressGestureStateInfo setState:](v7, "setState:", 0);
      if (self->_allPressBeganReceived)
        v9 = &OBJC_IVAR___SBClickGestureRecognizer__maximumClickDownDuration;
      else
        v9 = &OBJC_IVAR___SBClickGestureRecognizer__maximumClickFormationDuration;
      v10 = *v9;
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  if (a4 <= a3)
  {
LABEL_17:
    -[SBPressGestureStateInfo setIsCoalescing:](v7, "setIsCoalescing:", 1);
    v13 = -[SBClickGestureRecognizer state](self, "state");
    v14 = v7;
LABEL_18:
    -[SBPressGestureStateInfo setState:](v14, "setState:", v13);
    goto LABEL_19;
  }
  if (!self->_allPressBeganReceived)
  {
    v14 = v7;
    v13 = 5;
    goto LABEL_18;
  }
  recognizedClicksCount = self->_recognizedClicksCount;
  if (!self->_allPressesUpRequired)
  {
    v12 = recognizedClicksCount + 1;
    goto LABEL_25;
  }
  if (-[SBClickGestureRecognizer didReceiveRequiredPressEndedCount](self, "didReceiveRequiredPressEndedCount"))
  {
    v12 = self->_recognizedClicksCount + 1;
LABEL_25:
    self->_recognizedClicksCount = v12;
    goto LABEL_27;
  }
  -[SBPressGestureStateInfo setIsCoalescing:](v7, "setIsCoalescing:", 1);
  -[SBPressGestureStateInfo setState:](v7, "setState:", -[SBClickGestureRecognizer state](self, "state"));
  v12 = self->_recognizedClicksCount;
LABEL_27:
  if (recognizedClicksCount >= v12)
    goto LABEL_19;
  if (v12 == self->_numberOfClicksRequired)
  {
    v14 = v7;
    v13 = 3;
    goto LABEL_18;
  }
  self->_allPressBeganReceived = 0;
  -[SBClickGestureRecognizer resetShortcutsTracking](self, "resetShortcutsTracking");
  -[SBPressGestureStateInfo setState:](v7, "setState:", 0);
  v10 = 408;
LABEL_11:
  -[SBPressGestureStateInfo setExpirationTime:](v7, "setExpirationTime:", *(double *)((char *)&self->super.super.super.isa + v10));
  -[SBPressGestureStateInfo setStateUponExpiration:](v7, "setStateUponExpiration:", 5);
LABEL_19:
  self->_gestureWasRecognized = -[SBPressGestureStateInfo state](v7, "state") == 3;
LABEL_20:
  SBLogButtonsCombo();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[SBPressGestureRecognizer name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SBSystemGestureRecognizerStateDescription(-[SBPressGestureStateInfo state](v7, "state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPressGestureStateInfo expirationTime](v7, "expirationTime");
    v20 = v19;
    SBSystemGestureRecognizerStateDescription(-[SBPressGestureStateInfo stateUponExpiration](v7, "stateUponExpiration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544642;
    v23 = v17;
    v24 = 1024;
    v25 = a3;
    v26 = 1024;
    v27 = a4;
    v28 = 2114;
    v29 = v18;
    v30 = 2048;
    v31 = v20;
    v32 = 2114;
    v33 = v21;
    _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ gestureStateInfoForUnbalancedPressBeganCount:%d previousCount:%d outState:%{public}@ expiration:%g setStateUponExpiration:%{public}@", (uint8_t *)&v22, 0x36u);

  }
  return v7;
}

- (void)resetShortcutsTracking
{
  -[NSMutableSet removeAllObjects](self->_receivedPressBeganTypes, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_receivedPressEndedTypes, "removeAllObjects");
}

- (BOOL)didReceiveRequiredPressBeganCount
{
  return -[SBClickGestureRecognizer _areRequiredPressTypesContainedInSet:](self, "_areRequiredPressTypesContainedInSet:", self->_receivedPressBeganTypes);
}

- (BOOL)didReceiveRequiredPressEndedCount
{
  return -[SBClickGestureRecognizer _areRequiredPressTypesContainedInSet:](self, "_areRequiredPressTypesContainedInSet:", self->_receivedPressEndedTypes);
}

- (unint64_t)numberOfClicksRequired
{
  return self->_numberOfClicksRequired;
}

- (void)setNumberOfClicksRequired:(unint64_t)a3
{
  self->_numberOfClicksRequired = a3;
}

- (BOOL)allPressesUpRequired
{
  return self->_allPressesUpRequired;
}

- (void)setAllPressesUpRequired:(BOOL)a3
{
  self->_allPressesUpRequired = a3;
}

- (double)maximumClickFormationDuration
{
  return self->_maximumClickFormationDuration;
}

- (void)setMaximumClickFormationDuration:(double)a3
{
  self->_maximumClickFormationDuration = a3;
}

- (double)maximumClickDownDuration
{
  return self->_maximumClickDownDuration;
}

- (void)setMaximumClickDownDuration:(double)a3
{
  self->_maximumClickDownDuration = a3;
}

- (double)maximumBetweenClicksDelay
{
  return self->_maximumBetweenClicksDelay;
}

- (void)setMaximumBetweenClicksDelay:(double)a3
{
  self->_maximumBetweenClicksDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedPressEndedTypes, 0);
  objc_storeStrong((id *)&self->_receivedPressBeganTypes, 0);
  objc_storeStrong((id *)&self->_shortcutPressTypesSubsets, 0);
}

@end
