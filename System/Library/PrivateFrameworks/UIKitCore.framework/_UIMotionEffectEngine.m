@implementation _UIMotionEffectEngine

- (void)_unregisterAllMotionEffectsForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIAssociationTable hasLeftValuesForRightValue:](self->_effectViewAssociationTable, "hasLeftValuesForRightValue:", v4))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[_UIMotionEffectEngine _motionEffectsForView:](self, "_motionEffectsForView:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[_UIMotionEffectEngine _unregisterMotionEffect:fromView:](self, "_unregisterMotionEffect:fromView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  -[NSMapTable removeObjectForKey:](self->_suspendedViewsToEffectSets, "removeObjectForKey:", v4);

}

- (void)resetMotionAnalysis
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UILazyMapTable cachedObjectEnumerable](self->_analyzerSettingsToAnalyzers, "cachedObjectEnumerable", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "reset");
        -[_UIMotionEffectEngine _applyEffectsFromAnalyzer:](self, "_applyEffectsFromAnalyzer:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  if (!self->_generatingUpdates || !self->_hasAppliedAtLeastOneUpdateSinceStarting)
    self->_isPendingReset = 1;
}

- (void)_handleLatestDeviceMotion
{
  _BOOL4 hasReceivedAtLeastOneEventSinceStarting;
  _UIMotionEffectEvent *pendingEvent;
  _UIMotionEffectEvent *v5;
  _UIMotionEffectEvent *v6;
  double v7;
  double v8;
  CADisplayLink *displayLink;
  double v10;
  double v11;
  _UIMotionEffectEvent *lastEvent;
  double v13;
  double v14;
  _UIMotionEffectEvent *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  int v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t i;
  void *v28;
  _UIMotionEffectEvent *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  double v37;
  double v38;
  int v39;
  double v40;
  _BOOL4 v41;
  char v42;
  char v43;
  NSMapTable *obj;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!-[_UIMotionEffectEngine _isSuspended](self, "_isSuspended"))
  {
    os_unfair_lock_lock(&self->_pendingEventLock);
    hasReceivedAtLeastOneEventSinceStarting = self->_hasReceivedAtLeastOneEventSinceStarting;
    pendingEvent = self->_pendingEvent;
    v5 = pendingEvent;
    v6 = self->_pendingEvent;
    self->_pendingEvent = 0;

    os_unfair_lock_unlock(&self->_pendingEventLock);
    if (!hasReceivedAtLeastOneEventSinceStarting)
    {
LABEL_53:

      return;
    }
    -[_UIMotionEffectEvent timestamp](v5, "timestamp");
    v8 = v7;
    if (v5)
      displayLink = (CADisplayLink *)v5;
    else
      displayLink = self->_displayLink;
    -[CADisplayLink timestamp](displayLink, "timestamp");
    v11 = v10;
    lastEvent = self->_lastEvent;
    if (lastEvent)
    {
      -[_UIMotionEffectEvent timestamp](lastEvent, "timestamp");
      v14 = v11 - v13;
      v15 = self->_lastEvent;
      if (v5)
        goto LABEL_8;
    }
    else
    {
      v15 = 0;
      v14 = 0.0;
      if (v5)
      {
LABEL_8:
        if (v15 && v14 != 0.0)
        {
          -[_UIMotionEffectEvent velocityRelativeToPreviousEvent:](v5, "velocityRelativeToPreviousEvent:");
          v17 = v16;
          if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76760, (uint64_t)CFSTR("UIMotionEffectSlowVelocityThreshhold")))
          {
            +[UIDevice currentDevice](UIDevice, "currentDevice");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "userInterfaceIdiom");

            v20 = dbl_186681B00[(v19 & 0xFFFFFFFFFFFFFFFBLL) == 1];
          }
          else
          {
            v20 = *(double *)&qword_1ECD76768;
          }
          if (self->_slowUpdatesEnabled)
          {
            if (v17 > v20)
              -[_UIMotionEffectEngine _toggleSlowUpdates](self, "_toggleSlowUpdates");
          }
          else if (v17 <= v20)
          {
            if (!self->_pendingSlowDown)
            {
              v21 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76770, (uint64_t)CFSTR("UIMotionEffectSlowVelocityRequiredTime"));
              v22 = *(double *)&qword_1ECD76778;
              if (v21)
                v22 = 0.5;
              -[_UIMotionEffectEngine performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__toggleSlowUpdates, 0, v22);
              self->_pendingSlowDown = 1;
            }
          }
          else if (self->_pendingSlowDown)
          {
            objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__toggleSlowUpdates, 0);
            self->_pendingSlowDown = 0;
          }
        }
        objc_storeStrong((id *)&self->_lastEvent, pendingEvent);
        goto LABEL_26;
      }
    }
    v5 = -[_UIMotionEffectEvent copyWithTimestamp:](v15, "copyWithTimestamp:", v11);
LABEL_26:
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = self->_analyzersToEffects;
    v23 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v47;
      v26 = 1;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v29 = v5;
          objc_msgSend(v28, "updateWithEvent:", v5);
          objc_msgSend(v28, "viewerRelativeDevicePose");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "viewerOffset");
          v32 = v31;
          v34 = v33;

          v35 = fabs(v32);
          v36 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76780, (uint64_t)CFSTR("UIMotionEffectCenteredThreshold"));
          v37 = *(double *)&qword_1ECD76788;
          if (v36)
            v37 = 0.03;
          if (v35 >= v37)
          {
            v41 = 0;
          }
          else
          {
            v38 = fabs(v34);
            v39 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76780, (uint64_t)CFSTR("UIMotionEffectCenteredThreshold"));
            v40 = *(double *)&qword_1ECD76788;
            if (v39)
              v40 = 0.03;
            v41 = v38 < v40;
          }
          v45 = 0;
          v42 = objc_msgSend(v28, "applyHysteresisWithReceivedEventTimestamp:timeSinceLastNewMotionEvent:slowUpdatesEnabled:returningShouldToggleSlowUpdates:logger:", self->_slowUpdatesEnabled, &v45, 0, v8, v14);
          if (v45)
            -[_UIMotionEffectEngine _toggleSlowUpdates](self, "_toggleSlowUpdates");
          if (self->_isPendingReset)
            v43 = 1;
          else
            v43 = v42;
          if ((v43 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CD28B0], "setLowLatency:", 0);
            -[_UIMotionEffectEngine _applyEffectsFromAnalyzer:](self, "_applyEffectsFromAnalyzer:", v28);
          }
          v26 &= v41;
          v5 = v29;
        }
        v24 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v24);
    }
    else
    {
      v26 = 1;
    }

    self->_hasAppliedAtLeastOneUpdateSinceStarting = 1;
    if (self->_isPendingReset)
    {
      -[_UIMotionEffectEngine resetMotionAnalysis](self, "resetMotionAnalysis");
      self->_isPendingReset = 0;
    }
    if (self->_allAnalyzersAreCentered != v26)
    {
      self->_allAnalyzersAreCentered = v26;
      -[_UIMotionEffectEngine _updateDisplayLinkInterval](self, "_updateDisplayLinkInterval");
    }
    goto LABEL_53;
  }
}

- (void)updateWithEvent:(id)a3
{
  id v5;
  _QWORD block[5];

  v5 = a3;
  if (v5)
  {
    os_unfair_lock_lock(&self->_pendingEventLock);
    self->_hasReceivedAtLeastOneEventSinceStarting = 1;
    objc_storeStrong((id *)&self->_pendingEvent, a3);
    os_unfair_lock_unlock(&self->_pendingEventLock);
    if (-[_UIMotionEffectEventProvider wantsSynchronizedUpdates](self->_eventProvider, "wantsSynchronizedUpdates"))
    {
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") && _UIUpdateCycleEnabled())
      {
        -[_UIMotionEffectEngine _handleLatestDeviceMotion](self, "_handleLatestDeviceMotion");
      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41___UIMotionEffectEngine_updateWithEvent___block_invoke;
        block[3] = &unk_1E16B1B28;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
  }

}

- (void)endSuspendingMotionEffectsForView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ECD79B38 != -1)
    dispatch_once(&qword_1ECD79B38, &__block_literal_global_168_0);
  if (_MergedGlobals_13_4)
  {
    -[NSMapTable objectForKey:](self->_suspendedViewsToEffectSets, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMapTable removeObjectForKey:](self->_suspendedViewsToEffectSets, "removeObjectForKey:", v4);
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            -[_UIMotionEffectEngine beginApplyingMotionEffect:toView:](self, "beginApplyingMotionEffect:toView:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), v4, (_QWORD)v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)beginApplyingMotionEffect:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _UILazyMapTable *analyzerSettingsToAnalyzers;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (-[_UIMotionEffectEngine _motionEffectsAreSuspendedForView:](self, "_motionEffectsAreSuspendedForView:", v7))
    {
      -[NSMapTable objectForKey:](self->_suspendedViewsToEffectSets, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v6);

    }
    else
    {
      -[_UIAssociationTable registerAssociationWithLeftValue:rightValue:](self->_effectViewAssociationTable, "registerAssociationWithLeftValue:rightValue:", v6, v8);
      objc_msgSend(v6, "_preferredMotionAnalyzerSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      analyzerSettingsToAnalyzers = self->_analyzerSettingsToAnalyzers;
      _lazyMapClientForEffectAndView(v6, v8);
      v12 = objc_claimAutoreleasedReturnValue();
      -[_UILazyMapTable registerClient:ofObjectForKey:](analyzerSettingsToAnalyzers, "registerClient:ofObjectForKey:", v12, v10);

      LOBYTE(v12) = -[_UILazyMapTable hasCachedObjectForKey:](self->_analyzerSettingsToAnalyzers, "hasCachedObjectForKey:", v10);
      -[_UILazyMapTable objectForKey:](self->_analyzerSettingsToAnalyzers, "objectForKey:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 & 1) == 0)
      {
        -[_UIMotionEffectEventProvider currentEvent](self->_eventProvider, "currentEvent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v13, "updateWithEvent:", v14);
        self->_allAnalyzersAreCentered = 0;
        -[_UIMotionEffectEngine _updateDisplayLinkInterval](self, "_updateDisplayLinkInterval");

      }
      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewerRelativeDevicePose");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIMotionEffectApplicator applyMotionEffect:toViews:usingPose:transformedForTargetInterfaceOrientation:](_UIMotionEffectApplicator, "applyMotionEffect:toViews:usingPose:transformedForTargetInterfaceOrientation:", v6, v15, v16, self->_targetInterfaceOrientation);

      -[NSMapTable objectForKey:](self->_analyzersToEffects, "objectForKey:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_analyzersToEffects, "setObject:forKey:", v17, v13);
      }
      objc_msgSend(v17, "addObject:", v6);
      -[_UIMotionEffectEngine _startOrStopGeneratingUpdates](self, "_startOrStopGeneratingUpdates");

    }
  }

}

- (void)beginSuspendingMotionEffectsForView:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ECD79B38 != -1)
    dispatch_once(&qword_1ECD79B38, &__block_literal_global_168_0);
  if (_MergedGlobals_13_4)
  {
    -[NSMapTable objectForKey:](self->_suspendedViewsToEffectSets, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = -[_UIMotionEffectEngine _hasMotionEffectsForView:](self, "_hasMotionEffectsForView:", v4);
      v7 = (void *)MEMORY[0x1E0C99E20];
      if (v6)
      {
        -[_UIMotionEffectEngine _motionEffectsForView:](self, "_motionEffectsForView:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWithArray:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              -[_UIMotionEffectEngine endApplyingMotionEffect:toView:](self, "endApplyingMotionEffect:toView:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v4, (_QWORD)v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v12);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[NSMapTable setObject:forKey:](self->_suspendedViewsToEffectSets, "setObject:forKey:", v10, v4, (_QWORD)v15);

    }
  }

}

- (BOOL)_hasMotionEffectsForView:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[_UIAssociationTable hasLeftValuesForRightValue:](self->_effectViewAssociationTable, "hasLeftValuesForRightValue:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_suspendedViewsToEffectSets, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (void)endApplyingMotionEffect:(id)a3 toView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (-[_UIMotionEffectEngine _motionEffectsAreSuspendedForView:](self, "_motionEffectsAreSuspendedForView:", v7))
    {
      -[NSMapTable objectForKey:](self->_suspendedViewsToEffectSets, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v6);

    }
    else
    {
      -[_UIMotionEffectEngine _unregisterMotionEffect:fromView:](self, "_unregisterMotionEffect:fromView:", v6, v8);
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIMotionEffectApplicator unapplyMotionEffect:toViews:](_UIMotionEffectApplicator, "unapplyMotionEffect:toViews:", v6, v10);

    }
  }

}

- (id)_motionEffectsForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[_UIMotionEffectEngine _motionEffectsAreSuspendedForView:](self, "_motionEffectsAreSuspendedForView:", v4))
  {
    -[NSMapTable objectForKey:](self->_suspendedViewsToEffectSets, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
  }
  else
  {
    -[_UIAssociationTable leftValuesForRightValue:](self->_effectViewAssociationTable, "leftValuesForRightValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)_motionEffectsAreSuspendedForView:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_suspendedViewsToEffectSets, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_unregisterMotionEffect:(id)a3 fromView:(id)a4
{
  _UIAssociationTable *effectViewAssociationTable;
  id v7;
  void *v8;
  void *v9;
  _UILazyMapTable *analyzerSettingsToAnalyzers;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  effectViewAssociationTable = self->_effectViewAssociationTable;
  v7 = a4;
  -[_UIAssociationTable unregisterAssociationWithLeftValue:rightValue:](effectViewAssociationTable, "unregisterAssociationWithLeftValue:rightValue:", v14, v7);
  objc_msgSend(v14, "_preferredMotionAnalyzerSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UILazyMapTable objectForKey:](self->_analyzerSettingsToAnalyzers, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  analyzerSettingsToAnalyzers = self->_analyzerSettingsToAnalyzers;
  _lazyMapClientForEffectAndView(v14, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UILazyMapTable unregisterClient:ofObjectForKey:](analyzerSettingsToAnalyzers, "unregisterClient:ofObjectForKey:", v11, v8);
  if (v9
    && !-[_UIAssociationTable hasRightValuesForLeftValue:](self->_effectViewAssociationTable, "hasRightValuesForLeftValue:", v14))
  {
    -[NSMapTable objectForKey:](self->_analyzersToEffects, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "removeObject:", v14);
      if (!objc_msgSend(v13, "count"))
        -[NSMapTable removeObjectForKey:](self->_analyzersToEffects, "removeObjectForKey:", v9);
    }

  }
  -[_UIMotionEffectEngine _startOrStopGeneratingUpdates](self, "_startOrStopGeneratingUpdates");

}

- (void)_startOrStopGeneratingUpdates
{
  if (-[_UIMotionEffectEngine _shouldGenerateUpdates](self, "_shouldGenerateUpdates"))
  {
    if (!self->_generatingUpdates)
      -[_UIMotionEffectEngine _startGeneratingUpdates](self, "_startGeneratingUpdates");
  }
  else if (self->_generatingUpdates)
  {
    -[_UIMotionEffectEngine _stopGeneratingUpdates](self, "_stopGeneratingUpdates");
  }
}

- (BOOL)_shouldGenerateUpdates
{
  int v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_motionEffectsEnabled");
  if (v3)
  {
    if (-[_UIMotionEffectEngine _isSuspended](self, "_isSuspended"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[_UIAssociationTable isEmpty](self->_effectViewAssociationTable, "isEmpty");
  }
  return v3;
}

- (BOOL)_isSuspended
{
  return -[NSMutableSet count](self->_suspendReasons, "count") != 0;
}

+ (BOOL)_motionEffectsEnabled
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD79B30 != -1)
    dispatch_once(&qword_1ECD79B30, &__block_literal_global_395);
  v2 = _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache;
  if (_UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache == -1)
  {
    if (_AXSReduceMotionEnabled())
    {
      v2 = 0;
      _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = 0;
    }
    else if (os_variant_has_internal_diagnostics())
    {
      _UIKitUserDefaults();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ECD79B38 != -1)
        dispatch_once(&qword_1ECD79B38, &__block_literal_global_168_0);
      if (_MergedGlobals_13_4)
      {
        v9 = CFSTR("UIMotionEffectsEnabled");
        v10[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "registerDefaults:", v5);

        _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = objc_msgSend(v4, "BOOLForKey:", CFSTR("UIMotionEffectsEnabled"));
      }
      else
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("UIMotionEffectsEnabled"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = objc_msgSend(v6, "BOOLValue");
        }
        else
        {
          if (objc_msgSend((id)UIApp, "_isSpringBoard"))
          {
            objc_msgSend(v4, "setBool:forKey:", 0, CFSTR("UIMotionEffectsEnabled"));
            objc_msgSend(v4, "synchronize");
          }
          v8 = 0;
        }
        _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = v8;

      }
      v2 = _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache;
    }
    else
    {
      if (qword_1ECD79B38 != -1)
        dispatch_once(&qword_1ECD79B38, &__block_literal_global_168_0);
      v2 = _MergedGlobals_13_4;
      _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = _MergedGlobals_13_4;
    }
  }
  return v2 == 1;
}

- (void)_stopGeneratingUpdates
{
  CADisplayLink *displayLink;

  self->_generatingUpdates = 0;
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  -[_UIMotionEffectEventProvider stopGeneratingEvents](self->_eventProvider, "stopGeneratingEvents");
}

- (BOOL)_motionEffect:(id)a3 belongsToView:(id)a4
{
  id v6;
  void *v7;

  if (!a3 || !a4)
    return 0;
  v6 = a3;
  -[_UIMotionEffectEngine _motionEffectsForView:](self, "_motionEffectsForView:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "containsObject:", v6);

  return (char)self;
}

- (void)_applyEffectsFromAnalyzer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "updateHistory");
  objc_msgSend(v4, "viewerRelativeDevicePose");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMapTable objectForKey:](self->_analyzersToEffects, "objectForKey:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[_UIAssociationTable rightValueEnumerableForLeftValue:](self->_effectViewAssociationTable, "rightValueEnumerableForLeftValue:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIMotionEffectApplicator applyMotionEffect:toViews:usingPose:transformedForTargetInterfaceOrientation:](_UIMotionEffectApplicator, "applyMotionEffect:toViews:usingPose:transformedForTargetInterfaceOrientation:", v11, v12, v5, self->_targetInterfaceOrientation);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_updateDisplayLinkInterval
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!-[_UIMotionEffectEventProvider wantsSynchronizedUpdates](self->_eventProvider, "wantsSynchronizedUpdates"))
  {
    -[CADisplayLink maximumRefreshRate](self->_displayLink, "maximumRefreshRate");
    v4 = llround(1.0 / v3);
    if ((_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_915, (uint64_t)CFSTR("UIMotionEffectUIUpdateFrequency")) & 1) != 0|| (v5 = (uint64_t)*(double *)&qword_1ECD76748, (uint64_t)*(double *)&qword_1ECD76748 <= 0))
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      v8 = 32;
      if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v8 = 48;
      v9 = 30;
      if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v9 = 45;
      if (v4 <= 60)
        v5 = v9;
      else
        v5 = v8;
    }
    if (self->_allAnalyzersAreCentered)
    {
      if (self->_eventProviderStatus != 2)
      {
        v13 = 1;
        goto LABEL_23;
      }
      if (self->_slowUpdatesEnabled)
      {
        v10 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76750, (uint64_t)CFSTR("UIMotionEffectUIUpdateSlowFrequency"));
        v11 = (uint64_t)*(double *)&qword_1ECD76758;
        if (v10)
          v11 = 0;
        v12 = 5;
        if (v4 > 60)
          v12 = 8;
        if (v11 >= 1)
          v5 = v11;
        else
          v5 = v12;
      }
    }
    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", v5);
    v13 = 0;
LABEL_23:
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v13);
  }
}

- (void)updateEventProviderStatus:(int64_t)a3
{
  if (self->_eventProviderStatus != a3)
  {
    self->_eventProviderStatus = a3;
    -[_UIMotionEffectEngine _updateDisplayLinkInterval](self, "_updateDisplayLinkInterval");
  }
}

- (NSArray)suspensionReasons
{
  return (NSArray *)-[NSMutableSet allObjects](self->_suspendReasons, "allObjects");
}

- (void)beginSuspendingForReason:(id)a3
{
  -[NSMutableSet addObject:](self->_suspendReasons, "addObject:", a3);
  -[_UIMotionEffectEngine _startOrStopGeneratingUpdates](self, "_startOrStopGeneratingUpdates");
}

- (void)_setTargetInterfaceOrientation:(int64_t)a3
{
  self->_targetInterfaceOrientation = a3;
}

+ (Class)_analyzerClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_motionEffectsSupported
{
  if (qword_1ECD79B38 != -1)
    dispatch_once(&qword_1ECD79B38, &__block_literal_global_168_0);
  return _MergedGlobals_13_4;
}

- (void)_startGeneratingUpdates
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int64_t v13;
  _UIMotionEffectEvent *lastEvent;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_UIMotionEffectEventProvider startGeneratingEvents](self->_eventProvider, "startGeneratingEvents");
  if (!-[_UIMotionEffectEventProvider wantsSynchronizedUpdates](self->_eventProvider, "wantsSynchronizedUpdates"))
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__handleLatestDeviceMotion);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    -[_UIMotionEffectEngine _updateDisplayLinkInterval](self, "_updateDisplayLinkInterval");
    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_analyzersToEffects;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "resetHysteresis", (_QWORD)v15);
      }
      while (v9 != v11);
      v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  self->_hasReceivedAtLeastOneEventSinceStarting = 0;
  self->_hasAppliedAtLeastOneUpdateSinceStarting = 0;
  *(_WORD *)&self->_slowUpdatesEnabled = 0;
  self->_generatingUpdates = 1;
  v12 = -[_UIMotionEffectEventProvider wantsSynchronizedUpdates](self->_eventProvider, "wantsSynchronizedUpdates");
  v13 = 2;
  if (v12)
    v13 = 0;
  self->_eventProviderStatus = v13;
  lastEvent = self->_lastEvent;
  self->_lastEvent = 0;

}

- (int64_t)_targetInterfaceOrientation
{
  return self->_targetInterfaceOrientation;
}

- (void)endSuspendingForReason:(id)a3
{
  -[NSMutableSet removeObject:](self->_suspendReasons, "removeObject:", a3);
  -[_UIMotionEffectEngine _startOrStopGeneratingUpdates](self, "_startOrStopGeneratingUpdates");
}

- (_UIMotionEffectEngine)init
{
  _UIMotionEffectEngine *v2;
  _UIMotionEffectEventProvider *v3;
  _UIMotionEffectEventProvider *eventProvider;
  _UIAssociationTable *v5;
  _UIAssociationTable *effectViewAssociationTable;
  _UILazyMapTable *v7;
  uint64_t v8;
  _UIMotionEffectEngine *v9;
  uint64_t v10;
  _UILazyMapTable *analyzerSettingsToAnalyzers;
  uint64_t v12;
  NSMapTable *analyzersToEffects;
  uint64_t v14;
  NSMapTable *suspendedViewsToEffectSets;
  NSMutableSet *v16;
  NSMutableSet *suspendReasons;
  void *v18;
  const char *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  _UIMotionEffectEngine *v23;
  _UIMotionEffectEngine *v24;
  _QWORD v26[4];
  _UIMotionEffectEngine *v27;
  id v28;
  _QWORD handler[4];
  id v30;
  id location;
  _QWORD v32[4];
  _UIMotionEffectEngine *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_UIMotionEffectEngine;
  v2 = -[_UIMotionEffectEngine init](&v34, sel_init);
  if (v2)
  {
    v3 = (_UIMotionEffectEventProvider *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_eventProviderClass"));
    eventProvider = v2->_eventProvider;
    v2->_eventProvider = v3;

    -[_UIMotionEffectEventProvider setConsumer:](v2->_eventProvider, "setConsumer:", v2);
    v5 = -[_UIAssociationTable initWithLeftValueOptions:rightValueOptions:]([_UIAssociationTable alloc], "initWithLeftValueOptions:rightValueOptions:", 512, 256);
    effectViewAssociationTable = v2->_effectViewAssociationTable;
    v2->_effectViewAssociationTable = v5;

    v7 = [_UILazyMapTable alloc];
    v8 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __29___UIMotionEffectEngine_init__block_invoke;
    v32[3] = &unk_1E16D93F8;
    v9 = v2;
    v33 = v9;
    v10 = -[_UILazyMapTable initWithMappingBlock:](v7, "initWithMappingBlock:", v32);
    analyzerSettingsToAnalyzers = v9->_analyzerSettingsToAnalyzers;
    v9->_analyzerSettingsToAnalyzers = (_UILazyMapTable *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 1);
    analyzersToEffects = v9->_analyzersToEffects;
    v9->_analyzersToEffects = (NSMapTable *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 0);
    suspendedViewsToEffectSets = v9->_suspendedViewsToEffectSets;
    v9->_suspendedViewsToEffectSets = (NSMapTable *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    suspendReasons = v9->_suspendReasons;
    v9->_suspendReasons = v16;

    v9->_targetInterfaceOrientation = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__startOrStopGeneratingUpdates, CFSTR("_UIMotionEffectEngineEnabledDidChangeNotification"), 0);

    objc_initWeak(&location, v9);
    v19 = (const char *)*MEMORY[0x1E0C83A00];
    v20 = MEMORY[0x1E0C80D38];
    v21 = MEMORY[0x1E0C80D38];
    handler[0] = v8;
    handler[1] = 3221225472;
    handler[2] = __29___UIMotionEffectEngine_init__block_invoke_2;
    handler[3] = &unk_1E16C2E38;
    objc_copyWeak(&v30, &location);
    notify_register_dispatch(v19, &v9->_thermalNotificationToken, v20, handler);

    dispatch_get_global_queue(33, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __29___UIMotionEffectEngine_init__block_invoke_4;
    v26[3] = &unk_1E16D9428;
    v23 = v9;
    v27 = v23;
    objc_copyWeak(&v28, &location);
    notify_register_dispatch("com.apple.backboardd.backlight.changed", &v9->_screenDimmingNotificationToken, v22, v26);

    v24 = v23;
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v2;
}

+ (Class)_eventProviderClass
{
  return (Class)objc_opt_class();
}

- (void)_toggleSlowUpdates
{
  _BOOL8 v3;

  if (self->_generatingUpdates)
  {
    self->_pendingSlowDown = 0;
    v3 = !self->_slowUpdatesEnabled;
    self->_slowUpdatesEnabled ^= 1u;
    -[_UIMotionEffectEventProvider setSlowUpdatesEnabled:](self->_eventProvider, "setSlowUpdatesEnabled:", v3);
    -[_UIMotionEffectEngine _updateDisplayLinkInterval](self, "_updateDisplayLinkInterval");
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIMotionEffectEngine _stopGeneratingUpdates](self, "_stopGeneratingUpdates");
  -[_UIMotionEffectEngine _unapplyAllEffects](self, "_unapplyAllEffects");
  -[_UIMotionEffectEventProvider setConsumer:](self->_eventProvider, "setConsumer:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityReduceMotionStatusDidChangeNotification"), 0);

  notify_cancel(self->_thermalNotificationToken);
  notify_cancel(self->_screenDimmingNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)_UIMotionEffectEngine;
  -[_UIMotionEffectEngine dealloc](&v4, sel_dealloc);
}

- (void)_unapplyAllEffects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UIAssociationTable leftValueEnumerable](self->_effectViewAssociationTable, "leftValueEnumerable", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[_UIAssociationTable rightValueEnumerableForLeftValue:](self->_effectViewAssociationTable, "rightValueEnumerableForLeftValue:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIMotionEffectApplicator unapplyMotionEffect:toViews:](_UIMotionEffectApplicator, "unapplyMotionEffect:toViews:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL8 generatingUpdates;
  NSMutableSet *suspendReasons;
  void *v8;
  _UIAssociationTable *effectViewAssociationTable;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  generatingUpdates = self->_generatingUpdates;
  suspendReasons = self->_suspendReasons;
  -[_UILazyMapTable cachedObjects](self->_analyzerSettingsToAnalyzers, "cachedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  effectViewAssociationTable = self->_effectViewAssociationTable;
  -[NSMapTable keyEnumerator](self->_suspendedViewsToEffectSets, "keyEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p isGeneratingUpdates=%d suspensionReasons=%@ analyzers=%@ effects=%@ suspendedViews=%@>"), v5, self, generatingUpdates, suspendReasons, v8, effectViewAssociationTable, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_suspendReasons, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_pendingEvent, 0);
  objc_storeStrong((id *)&self->_eventProvider, 0);
  objc_storeStrong((id *)&self->_suspendedViewsToEffectSets, 0);
  objc_storeStrong((id *)&self->_analyzersToEffects, 0);
  objc_storeStrong((id *)&self->_analyzerSettingsToAnalyzers, 0);
  objc_storeStrong((id *)&self->_effectViewAssociationTable, 0);
}

@end
