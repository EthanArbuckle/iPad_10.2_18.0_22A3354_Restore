@implementation SBMainStatusBarStateProvider

- (BOOL)_shouldPostForVisitedItem:(int)a3 withUpdates:(BOOL)a4 toAggregatorData:(id *)a5 lastPost:(id *)a6
{
  int killActivity;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;

  if (a3)
  {
    if (a3 == 32)
    {
      killActivity = self->_killActivity;
      if ((*((_BYTE *)a5 + 2272) & 4) != 0)
      {
        v12 = 0;
        self->_killActivity = 0;
      }
      else
      {
        +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isUILocked") & 1) != 0)
        {
          objc_msgSend((id)SBApp, "userSessionController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          self->_killActivity = objc_msgSend(v11, "isLoginSession") ^ 1;

        }
        else
        {
          self->_killActivity = 0;
        }

        v12 = self->_killActivity;
      }
      if (killActivity != v12)
        a4 = 1;
    }
  }
  else if (self->_statusBarTimeRequiresUpdate)
  {
    self->_statusBarTimeRequiresUpdate = 0;
    a4 = 1;
  }
  v13 = self->_itemIsDisabled[a3];
  if (v13 != self->_itemWasDisabled[a3])
  {
    self->_itemWasDisabled[a3] = v13;
    return 1;
  }
  return a4;
}

- (void)_composePostDataFromAggregatorData:(id *)a3
{
  uint64_t v3;

  if (self->_killActivity)
    a3->var0[32] = 0;
  v3 = 0;
  a3->var0[0] = self->_timeEnabled;
  do
  {
    if (self->_itemIsDisabled[v3])
      a3->var0[v3] = 0;
    ++v3;
  }
  while (v3 != 46);
}

- (void)statusBarStateProvider:(id)a3 didPostStatusBarData:(id *)a4 withActions:(int)a5
{
  uint64_t v5;
  _QWORD v7[5];
  int v8;

  v5 = *(_QWORD *)&a5;
  if (-[NSCountedSet count](self->_dataUpdateAnimationsDisabledRequests, "count", a3))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__SBMainStatusBarStateProvider_statusBarStateProvider_didPostStatusBarData_withActions___block_invoke;
    v7[3] = &__block_descriptor_44_e5_v8__0l;
    v7[4] = a4;
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAA00], "postStatusBarData:withActions:", a4, v5);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_54 != -1)
    dispatch_once(&sharedInstance_onceToken_54, &__block_literal_global_375);
  return (id)sharedInstance___sharedInstance_26;
}

uint64_t __46__SBMainStatusBarStateProvider_sharedInstance__block_invoke()
{
  SBMainStatusBarStateProvider *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBMainStatusBarStateProvider);
  v1 = (void *)sharedInstance___sharedInstance_26;
  sharedInstance___sharedInstance_26 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBMainStatusBarStateProvider)init
{
  SBMainStatusBarStateProvider *v2;
  SBMainStatusBarStateProvider *v3;
  uint64_t v4;
  NSHashTable *contentAssertions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMainStatusBarStateProvider;
  v2 = -[SBStatusBarStateProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_timeEnabled = 1;
    -[SBStatusBarStateProvider addStatusBarStateObserver:](v2, "addStatusBarStateObserver:", v2);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    contentAssertions = v3->_contentAssertions;
    v3->_contentAssertions = (NSHashTable *)v4;

  }
  return v3;
}

- (void)acquireContentAssertion:(id)a3
{
  -[NSHashTable addObject:](self->_contentAssertions, "addObject:", a3);
  -[SBMainStatusBarStateProvider updateTimeEnabled](self, "updateTimeEnabled");
}

- (void)relinquishContentAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_contentAssertions, "removeObject:", a3);
  -[SBMainStatusBarStateProvider updateTimeEnabled](self, "updateTimeEnabled");
}

- (BOOL)contentAssertionsWantTimeEnabledAnimated:(BOOL *)a3 duration:(double *)a4
{
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  uint64_t v13;
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
  v6 = self->_contentAssertions;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "dateAndTimeVisible", (_QWORD)v15) & 1) == 0)
        {
          *a3 = objc_msgSend(v11, "animated");
          objc_msgSend(v11, "duration");
          v12 = 0;
          *(_QWORD *)a4 = v13;
          goto LABEL_11;
        }
      }
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[SBStatusBarStateProvider removeStatusBarStateObserver:](self, "removeStatusBarStateObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBMainStatusBarStateProvider;
  -[SBStatusBarStateProvider dealloc](&v3, sel_dealloc);
}

- (void)disableStatusBarItem:(int)a3 requestor:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  NSCountedSet **itemDisabledRequests;
  NSCountedSet *v10;
  uint64_t v11;
  NSCountedSet *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = v7;
  v15 = v7;
  if (v4 >= 0x2E)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainStatusBarStateProvider.m"), 141, CFSTR("Invalid status bar item %d"), v4);

    v8 = v15;
    if (v15)
      goto LABEL_3;
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainStatusBarStateProvider.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestor"));

  v8 = v15;
LABEL_3:
  itemDisabledRequests = self->_itemDisabledRequests;
  v10 = self->_itemDisabledRequests[v4];
  if (!v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 1);
    v12 = itemDisabledRequests[v4];
    itemDisabledRequests[v4] = (NSCountedSet *)v11;

    v8 = v15;
    v10 = itemDisabledRequests[v4];
  }
  -[NSCountedSet addObject:](v10, "addObject:", v8);
  -[SBMainStatusBarStateProvider _updateDisabledItems](self, "_updateDisabledItems");

}

- (void)enableStatusBarItem:(int)a3 requestor:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  NSCountedSet *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = v7;
  if (v4 >= 0x2E)
  {
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainStatusBarStateProvider.m"), 153, CFSTR("Invalid status bar item %d"), v4);

    v8 = v13;
    if (v13)
      goto LABEL_3;
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  v14 = v8;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainStatusBarStateProvider.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestor"));

  v8 = v14;
LABEL_3:
  v9 = self->_itemDisabledRequests[v4];
  if (v9)
  {
    v12 = v8;
    -[NSCountedSet removeObject:](v9, "removeObject:", v8);
    -[SBMainStatusBarStateProvider _updateDisabledItems](self, "_updateDisabledItems");
    v8 = v12;
  }

}

- (void)_updateDisabledItems
{
  uint64_t i;
  _BOOL4 v4;

  -[SBStatusBarStateProvider beginCoalescentBlock](self, "beginCoalescentBlock");
  for (i = 0; i != 46; ++i)
  {
    v4 = !i && self->_timeCloaked
      || (i & 0x3D) != 0xC && self->_allButBatteryCloaked
      || self->_telephonyAndBluetoothCloaked
      && ((i & 0x3D) == 4 || (i - 9) < 0x18 && ((0x9000C1u >> (i - 9)) & 1) != 0)
      || -[NSCountedSet count](self->_itemDisabledRequests[i], "count") != 0;
    if (self->_itemIsDisabled[i] != v4)
    {
      self->_itemIsDisabled[i] = v4;
      -[SBStatusBarStateProvider updateStatusBarItem:](self, "updateStatusBarItem:", i);
    }
  }
  -[SBStatusBarStateProvider endCoalescentBlock](self, "endCoalescentBlock");
}

- (BOOL)isTimeEnabled
{
  return self->_timeEnabled;
}

- (void)updateTimeEnabled
{
  -[SBMainStatusBarStateProvider updateTimeEnabledImmediately:](self, "updateTimeEnabledImmediately:", 0);
}

- (void)updateTimeEnabledImmediately:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  double v6;
  unsigned __int8 v7;

  v3 = a3;
  v7 = 0;
  v6 = 0.0;
  v5 = -[SBMainStatusBarStateProvider contentAssertionsWantTimeEnabledAnimated:duration:](self, "contentAssertionsWantTimeEnabledAnimated:duration:", &v7, &v6);
  -[SBMainStatusBarStateProvider _enableTime:crossfade:crossfadeDuration:immediately:](self, "_enableTime:crossfade:crossfadeDuration:immediately:", v5, v7, v3, v6);
}

- (void)enableTime:(BOOL)a3
{
  -[SBMainStatusBarStateProvider enableTime:crossfade:crossfadeDuration:](self, "enableTime:crossfade:crossfadeDuration:", a3, 0, 0.0);
}

- (void)enableTime:(BOOL)a3 crossfade:(BOOL)a4 crossfadeDuration:(double)a5
{
  -[SBMainStatusBarStateProvider _enableTime:crossfade:crossfadeDuration:immediately:](self, "_enableTime:crossfade:crossfadeDuration:immediately:", a3, a4, 0, a5);
}

- (void)_enableTime:(BOOL)a3 crossfade:(BOOL)a4 crossfadeDuration:(double)a5 immediately:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (self->_timeEnabled != a3)
  {
    v6 = a6;
    v8 = a4;
    self->_timeEnabled = a3;
    self->_statusBarTimeRequiresUpdate = 1;
    -[SBStatusBarStateProvider updateStatusBarItem:](self, "updateStatusBarItem:", 0);
    objc_msgSend((id)SBApp, "statusBarForEmbeddedDisplay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = &unk_1E91D2138;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeEnabled);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabledCenterItems:duration:", v12, a5);

    if (v6)
      objc_msgSend(v10, "forceUpdateData:", v8);

  }
}

- (void)setTimeCloaked:(BOOL)a3
{
  self->_timeCloaked = a3;
  -[SBMainStatusBarStateProvider _updateDisabledItems](self, "_updateDisabledItems");
}

- (void)setAllItemsExceptBatteryCloaked:(BOOL)a3
{
  self->_allButBatteryCloaked = a3;
  -[SBMainStatusBarStateProvider _updateDisabledItems](self, "_updateDisabledItems");
}

- (void)setTelephonyAndBluetoothItemsCloaked:(BOOL)a3
{
  self->_telephonyAndBluetoothCloaked = a3;
  -[SBMainStatusBarStateProvider _updateDisabledItems](self, "_updateDisabledItems");
}

- (void)disableDataUpdateAnimationsForRequestor:(id)a3
{
  id v4;
  NSCountedSet *dataUpdateAnimationsDisabledRequests;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  dataUpdateAnimationsDisabledRequests = self->_dataUpdateAnimationsDisabledRequests;
  v8 = v4;
  if (!dataUpdateAnimationsDisabledRequests)
  {
    v6 = (NSCountedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 1);
    v7 = self->_dataUpdateAnimationsDisabledRequests;
    self->_dataUpdateAnimationsDisabledRequests = v6;

    v4 = v8;
    dataUpdateAnimationsDisabledRequests = self->_dataUpdateAnimationsDisabledRequests;
  }
  -[NSCountedSet addObject:](dataUpdateAnimationsDisabledRequests, "addObject:", v4);

}

- (void)stopDisablingDataUpdateAnimationsForRequestor:(id)a3
{
  NSCountedSet *dataUpdateAnimationsDisabledRequests;

  -[NSCountedSet removeObject:](self->_dataUpdateAnimationsDisabledRequests, "removeObject:", a3);
  if (!-[NSCountedSet count](self->_dataUpdateAnimationsDisabledRequests, "count"))
  {
    dataUpdateAnimationsDisabledRequests = self->_dataUpdateAnimationsDisabledRequests;
    self->_dataUpdateAnimationsDisabledRequests = 0;

  }
}

- (void)forceUpdateLocalStatusBarData
{
  void *v2;
  _OWORD v3[242];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(v3, 0, 512);
  -[SBStatusBarStateProvider getStatusBarData:](self, "getStatusBarData:", v3);
  objc_msgSend((id)SBApp, "statusBarForEmbeddedDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUpdateToData:animated:", v3, 0);

}

- (void)statusBarStateAggregatorDidRequestImmediateUpdates:(id)a3
{
  id v4;

  -[SBMainStatusBarStateProvider _identifierForStateAggregator:](self, "_identifierForStateAggregator:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBMainStatusBarStateProvider disableDataUpdateAnimationsForRequestor:](self, "disableDataUpdateAnimationsForRequestor:", v4);

}

- (void)statusBarStateAggregatorDidStopRequestingImmediateUpdates:(id)a3
{
  id v4;

  -[SBMainStatusBarStateProvider _identifierForStateAggregator:](self, "_identifierForStateAggregator:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBMainStatusBarStateProvider stopDisablingDataUpdateAnimationsForRequestor:](self, "stopDisablingDataUpdateAnimationsForRequestor:", v4);

}

- (id)_identifierForStateAggregator:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), v4);

  return v5;
}

uint64_t __88__SBMainStatusBarStateProvider_statusBarStateProvider_didPostStatusBarData_withActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEAA00], "postStatusBarData:withActions:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (NSHashTable)contentAssertions
{
  return self->_contentAssertions;
}

- (void)setContentAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_contentAssertions, a3);
}

- (void).cxx_destruct
{
  NSCountedSet **itemDisabledRequests;
  uint64_t i;

  objc_storeStrong((id *)&self->_contentAssertions, 0);
  objc_storeStrong((id *)&self->_dataUpdateAnimationsDisabledRequests, 0);
  itemDisabledRequests = self->_itemDisabledRequests;
  for (i = 45; i != -1; --i)
    objc_storeStrong((id *)&itemDisabledRequests[i], 0);
}

@end
