@implementation SBSystemActionPressWithinTimeIntervalCoachingPolicy

- (SBSystemActionPressWithinTimeIntervalCoachingPolicy)init
{
  SBSystemActionPressWithinTimeIntervalCoachingPolicy *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *settings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSystemActionPressWithinTimeIntervalCoachingPolicy;
  v2 = -[SBSystemActionPressWithinTimeIntervalCoachingPolicy init](&v8, sel_init);
  if (v2)
  {
    +[SBSystemActionDomain rootSettings](SBSystemActionDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coachingSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pressWithinTimeIntervalPolicySettings");
    v5 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBSystemActionPressWithinTimeIntervalCoachingPolicySettings *)v5;

  }
  return v2;
}

- (void)noteDidBeginPreview:(id)a3 forAction:(id)a4
{
  id v6;
  id v7;
  NSCountedSet *countedActions;
  NSCountedSet *v9;
  NSCountedSet *v10;
  NSMapTable *latestPreviewsByAction;
  NSMapTable *v12;
  NSMapTable *v13;
  void *v14;
  double v15;
  double v16;
  NSTimer *v17;
  NSTimer *resetTimer;
  _QWORD v19[4];
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  countedActions = self->_countedActions;
  if (!countedActions)
  {
    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v10 = self->_countedActions;
    self->_countedActions = v9;

    countedActions = self->_countedActions;
  }
  -[NSCountedSet addObject:](countedActions, "addObject:", v7);
  latestPreviewsByAction = self->_latestPreviewsByAction;
  if (!latestPreviewsByAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_latestPreviewsByAction;
    self->_latestPreviewsByAction = v12;

    latestPreviewsByAction = self->_latestPreviewsByAction;
  }
  -[NSMapTable setObject:forKey:](latestPreviewsByAction, "setObject:forKey:", v6, v7);
  -[NSTimer invalidate](self->_resetTimer, "invalidate");
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0C99E88];
  -[SBSystemActionPressWithinTimeIntervalCoachingPolicySettings timeInterval](self->_settings, "timeInterval");
  v16 = v15;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85__SBSystemActionPressWithinTimeIntervalCoachingPolicy_noteDidBeginPreview_forAction___block_invoke;
  v19[3] = &unk_1E8E9FA90;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v14, "scheduledTimerWithTimeInterval:repeats:block:", 0, v19, v16);
  v17 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  resetTimer = self->_resetTimer;
  self->_resetTimer = v17;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __85__SBSystemActionPressWithinTimeIntervalCoachingPolicy_noteDidBeginPreview_forAction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[SBSystemActionPressWithinTimeIntervalCoachingPolicy _reset]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_reset
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v2 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v3 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

- (void)noteDidInvalidateExpansionOfPreview:(id)a3 forAction:(id)a4 withResult:(unint64_t)a5
{
  id v7;
  NSUInteger v8;
  NSUInteger v9;
  id v10;

  v7 = a4;
  if (!a5)
  {
    v10 = v7;
    v8 = -[NSCountedSet countForObject:](self->_countedActions, "countForObject:", v7);
    v7 = v10;
    if (v8)
    {
      v9 = v8;
      do
      {
        -[NSCountedSet removeObject:](self->_countedActions, "removeObject:", v10);
        v7 = v10;
        --v9;
      }
      while (v9);
    }
  }

}

- (void)noteDidEndPreview:(id)a3 forAction:(id)a4
{
  NSMapTable *latestPreviewsByAction;
  id v7;
  id v8;
  id v9;

  v9 = a4;
  latestPreviewsByAction = self->_latestPreviewsByAction;
  v7 = a3;
  -[NSMapTable objectForKey:](latestPreviewsByAction, "objectForKey:", v9);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
    -[NSMapTable removeObjectForKey:](self->_latestPreviewsByAction, "removeObjectForKey:", v9);

}

- (BOOL)wantsCoachingPresentedForAction:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = -[NSCountedSet countForObject:](self->_countedActions, "countForObject:", v4);
  if (v5)
    v6 = SBSystemActionCoachingPolicyWantsCoachingPresented(v4, v5, -[SBSystemActionPressWithinTimeIntervalCoachingPolicySettings presentationThresholdForActionsWithStatefulPreviews](self->_settings, "presentationThresholdForActionsWithStatefulPreviews"), -[SBSystemActionPressWithinTimeIntervalCoachingPolicySettings presentationThresholdForActionsWithStatelessPreviews](self->_settings, "presentationThresholdForActionsWithStatelessPreviews"));
  else
    v6 = 0;

  return v6;
}

- (BOOL)wantsCoachingDismissedForAction:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_latestPreviewsByAction, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_latestPreviewsByAction, 0);
  objc_storeStrong((id *)&self->_countedActions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
