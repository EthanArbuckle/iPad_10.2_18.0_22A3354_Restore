@implementation SBSystemActionTrackPreviewsCoachingPolicy

- (SBSystemActionTrackPreviewsCoachingPolicy)init
{
  SBSystemActionTrackPreviewsCoachingPolicy *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  SBSystemActionTrackPreviewsCoachingPolicySettings *settings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSystemActionTrackPreviewsCoachingPolicy;
  v2 = -[SBSystemActionTrackPreviewsCoachingPolicy init](&v8, sel_init);
  if (v2)
  {
    +[SBSystemActionDomain rootSettings](SBSystemActionDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "coachingSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trackPreviewsPolicySettings");
    v5 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBSystemActionTrackPreviewsCoachingPolicySettings *)v5;

  }
  return v2;
}

- (void)noteDidBeginPreview:(id)a3 forAction:(id)a4
{
  id v6;
  NSMapTable *trackedPreviewsByAction;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  trackedPreviewsByAction = self->_trackedPreviewsByAction;
  if (!trackedPreviewsByAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_trackedPreviewsByAction;
    self->_trackedPreviewsByAction = v8;

    trackedPreviewsByAction = self->_trackedPreviewsByAction;
  }
  -[NSMapTable objectForKey:](trackedPreviewsByAction, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_trackedPreviewsByAction, "setObject:forKey:", v10, v6);
  }
  objc_msgSend(v10, "addObject:", v11);

}

- (void)noteDidInvalidateExpansionOfPreview:(id)a3 forAction:(id)a4 withResult:(unint64_t)a5
{
  NSMapTable *trackedPreviewsByAction;

  if (!a5)
  {
    -[NSMapTable removeObjectForKey:](self->_trackedPreviewsByAction, "removeObjectForKey:", a4);
    if (!-[NSMapTable count](self->_trackedPreviewsByAction, "count"))
    {
      trackedPreviewsByAction = self->_trackedPreviewsByAction;
      self->_trackedPreviewsByAction = 0;

    }
  }
}

- (void)noteDidEndPreview:(id)a3 forAction:(id)a4
{
  NSMapTable *trackedPreviewsByAction;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMapTable *v11;
  id v12;

  v12 = a4;
  trackedPreviewsByAction = self->_trackedPreviewsByAction;
  v7 = a3;
  -[NSMapTable objectForKey:](trackedPreviewsByAction, "objectForKey:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    -[NSMapTable removeObjectForKey:](self->_trackedPreviewsByAction, "removeObjectForKey:", v12);
  if (!-[NSMapTable count](self->_trackedPreviewsByAction, "count"))
  {
    v11 = self->_trackedPreviewsByAction;
    self->_trackedPreviewsByAction = 0;

  }
}

- (BOOL)wantsCoachingPresentedForAction:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = -[SBSystemActionTrackPreviewsCoachingPolicy _trackedPreviewCount]((uint64_t)self);
  if (v5)
    v6 = SBSystemActionCoachingPolicyWantsCoachingPresented(v4, v5, -[SBSystemActionTrackPreviewsCoachingPolicySettings presentationThresholdForActionsWithStatefulPreviews](self->_settings, "presentationThresholdForActionsWithStatefulPreviews"), -[SBSystemActionTrackPreviewsCoachingPolicySettings presentationThresholdForActionsWithStatelessPreviews](self->_settings, "presentationThresholdForActionsWithStatelessPreviews"));
  else
    v6 = 0;

  return v6;
}

- (uint64_t)_trackedPreviewCount
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 16), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v9, "count");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)wantsCoachingDismissedForAction:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_trackedPreviewsByAction, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPreviewsByAction, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
