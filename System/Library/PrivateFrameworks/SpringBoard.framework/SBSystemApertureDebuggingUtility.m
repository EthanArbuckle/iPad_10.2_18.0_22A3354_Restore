@implementation SBSystemApertureDebuggingUtility

- (SBSystemApertureDebuggingUtility)initWithDelegate:(id)a3
{
  id v4;
  SBSystemApertureDebuggingUtility *v5;
  uint64_t v6;
  NSMutableArray *bufferEntries;
  uint64_t v8;
  SBSystemApertureSettings *settings;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSystemApertureDebuggingUtility;
  v5 = -[SBSystemApertureDebuggingUtility init](&v11, sel_init);
  if (v5)
  {
    v5->_isAppleInternal = os_variant_has_internal_diagnostics();
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6 = objc_opt_new();
    bufferEntries = v5->_bufferEntries;
    v5->_bufferEntries = (NSMutableArray *)v6;

    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (SBSystemApertureSettings *)v8;

    -[PTSettings addKeyPathObserver:](v5->_settings, "addKeyPathObserver:", v5);
    -[SBSystemApertureDebuggingUtility _setupTestRecipe](v5, "_setupTestRecipe");
  }

  return v5;
}

- (void)updatedPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;

  self->_queryIteration = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[SBSystemApertureDebuggingUtility _collectPreferences:context:withStackDepiction:andQueryIteration:](self, "_collectPreferences:context:withStackDepiction:andQueryIteration:", v12, v11, v10, a6);
  -[SBSystemApertureDebuggingUtility _handleStreamBuddySessionForPreferences:context:withStackDepiction:andQueryIteration:](self, "_handleStreamBuddySessionForPreferences:context:withStackDepiction:andQueryIteration:", v12, v11, v10, a6);

}

- (void)setAnimationFrameRecording:(BOOL)a3
{
  CADisplayLink *displayLink;
  BOOL v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *animationFrameRecordings;

  displayLink = self->_displayLink;
  if (displayLink)
    v5 = 1;
  else
    v5 = !a3;
  if (v5)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate", a3);
    animationFrameRecordings = self->_displayLink;
    self->_displayLink = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__observeAnimationFrames_);
    v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v7 = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    v10 = (NSMutableDictionary *)objc_opt_new();
    animationFrameRecordings = self->_animationFrameRecordings;
    self->_animationFrameRecordings = v10;
  }

}

- (void)clearBufferEntries
{
  -[NSMutableArray removeAllObjects](self->_bufferEntries, "removeAllObjects");
}

- (NSMutableArray)systemApertureModelStateDump
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *obj;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = (id)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_bufferEntries;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v3)
  {
    v4 = v3;
    v16 = *(_QWORD *)v19;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v5);
        v22[0] = CFSTR("queryIteration");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "queryIteration"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v7;
        v22[1] = CFSTR("SBSAPreferences");
        objc_msgSend(v6, "preferences");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureDebuggingUtility _repackageDictionaryDescribable:](self, "_repackageDictionaryDescribable:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v9;
        v22[2] = CFSTR("SBSAContext");
        objc_msgSend(v6, "context");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureDebuggingUtility _repackageDictionaryDescribable:](self, "_repackageDictionaryDescribable:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23[2] = v11;
        v22[3] = CFSTR("stackDepiction");
        objc_msgSend(v6, "stackDepiction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[3] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObject:", v13);
        ++v5;
      }
      while (v4 != v5);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v4);
  }

  return (NSMutableArray *)v17;
}

- (void)_setupTestRecipe
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SBSystemApertureDebuggingUtility__setupTestRecipe__block_invoke;
  v3[3] = &unk_1E8E9E980;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D83110], "recipeWithTitle:toggleAction:", CFSTR("Toggle StreamBuddy"), v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTDomain registerTestRecipe:](SBAppSwitcherDomain, "registerTestRecipe:", v2);

}

void __52__SBSystemApertureDebuggingUtility__setupTestRecipe__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  SBStreamBuddySession *v6;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2 && *(_BYTE *)(v3 + 40) && !*(_QWORD *)(v3 + 8))
  {
    v6 = objc_alloc_init(SBStreamBuddySession);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "start");
  }
  else
  {
    objc_msgSend(*(id *)(v3 + 8), "stop");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = 0;

  }
}

- (id)_repackageDictionaryDescribable:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dictionaryDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SBSystemApertureDebuggingUtility _repackageDictionaryDescribable:](self, "_repackageDictionaryDescribable:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "description");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v14, v11);

        }
        else
        {
          objc_msgSend(v5, "setObject:forKey:", v12, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_collectPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  SBSystemApertureDebuggingUtilityBufferEntry *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_isAppleInternal)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemApertureDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "enableSystemApertureStateCollection");

    if (v14)
    {
      v15 = -[SBSystemApertureDebuggingUtilityBufferEntry initWithQueryIteration:preferences:context:stackDepiction:]([SBSystemApertureDebuggingUtilityBufferEntry alloc], "initWithQueryIteration:preferences:context:stackDepiction:", a6, v16, v10, v11);
      if (-[NSMutableArray count](self->_bufferEntries, "count") == 50
        && !-[SBSystemApertureDebuggingUtility isSystemApertureUnderAutomationTesting](self, "isSystemApertureUnderAutomationTesting"))
      {
        -[NSMutableArray removeObjectAtIndex:](self->_bufferEntries, "removeObjectAtIndex:", 0);
      }
      -[NSMutableArray addObject:](self->_bufferEntries, "addObject:", v15);

    }
  }

}

- (void)_handleStreamBuddySessionForPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (self->_streamBuddySession)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = a5;
    v12 = a4;
    v13 = a3;
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%lu"), a6, CFSTR("queryIteration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v18[1] = CFSTR("SBSAPreferences");
    -[SBSystemApertureDebuggingUtility _repackageDictionaryDescribable:](self, "_repackageDictionaryDescribable:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[1] = v15;
    v18[2] = CFSTR("SBSAContext");
    -[SBSystemApertureDebuggingUtility _repackageDictionaryDescribable:](self, "_repackageDictionaryDescribable:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18[3] = CFSTR("stackDepiction");
    v19[2] = v16;
    v19[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBStreamBuddySession sendSystemApertureStateDump:](self->_streamBuddySession, "sendSystemApertureStateDump:", v17);
  }
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__SBSystemApertureDebuggingUtility_setSystemApertureUnderAutomationTesting___block_invoke;
  v3[3] = &unk_1E8E9F508;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __76__SBSystemApertureDebuggingUtility_setSystemApertureUnderAutomationTesting___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "systemApertureDebuggingUtility:shouldCreateDebuggingLabel:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)_observeAnimationFrames:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemApertureDebuggingUtilityOrderedContainerViews:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "elementViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "elementViewProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "element");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "elementIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(v7, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "presentationLayer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "frame");
          objc_msgSend(v12, "valueWithRect:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "layer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "presentationLayer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "cornerRadius");
          *(float *)&v19 = v19;
          objc_msgSend(v16, "numberWithFloat:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_queryIteration);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = CFSTR("frame");
          v31[1] = CFSTR("cornerRadius");
          v32[0] = v15;
          v32[1] = v20;
          v31[2] = CFSTR("queryIteration");
          v32[2] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_animationFrameRecordings, "objectForKey:", v11);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
            v23 = (void *)objc_opt_new();
          objc_msgSend(v23, "addObject:", v22);
          -[NSMutableDictionary setObject:forKey:](self->_animationFrameRecordings, "setObject:forKey:", v23, v11);

        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v26);
  }

}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id WeakRetained;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("showQueryIterationLabel")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "systemApertureDebuggingUtility:shouldCreateDebuggingLabel:", self, -[SBSystemApertureSettings showQueryIterationLabel](self->_settings, "showQueryIterationLabel"));

  }
}

- (void)streamBuddySession:(id)a3 connectionState:(int)a4 withError:(id)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v5 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  SBLogStreamBuddy();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringFromStreamBuddyConnectionState(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%@ State:%@ withError:%@", (uint8_t *)&v14, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemApertureDebuggingUtility:updateUIForConnectionState:", self, v5);

}

- (SBSystemApertureDebuggingUtilityDelegate)delegate
{
  return (SBSystemApertureDebuggingUtilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)animationFrameRecordings
{
  return self->_animationFrameRecordings;
}

- (BOOL)isSystemApertureUnderAutomationTesting
{
  return self->_systemApertureUnderAutomationTesting;
}

- (void)setIsSystemApertureUnderAutomationTesting:(BOOL)a3
{
  self->_isSystemApertureUnderAutomationTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationFrameRecordings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_bufferEntries, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_streamBuddySession, 0);
}

@end
