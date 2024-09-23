@implementation PRRenderer

- (PRRenderer)initWithDelegate:(id)a3
{
  id v5;
  PRRenderer *v6;
  PRRenderer *v7;
  uint64_t v8;
  NSMutableDictionary *viewsByLevel;
  uint64_t v10;
  NSMutableSet *sceneInvalidationActions;
  uint64_t v12;
  PRPosterPreferencesImpl *preferences;
  void *v14;
  uint64_t v15;
  PRRenderer *v16;
  uint64_t v17;
  BSCompoundAssertion *sessionExtensions;
  UIViewFloatAnimatableProperty *v19;
  UIViewFloatAnimatableProperty *unlockAnimator;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  BSInvalidatable *stateCaptureHandle;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id from;
  id location;
  _QWORD v35[4];
  PRRenderer *v36;
  objc_super v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (initWithDelegate__onceToken != -1)
    dispatch_once(&initWithDelegate__onceToken, &__block_literal_global_43);
  v37.receiver = self;
  v37.super_class = (Class)PRRenderer;
  v6 = -[PRRenderer init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = objc_opt_new();
    viewsByLevel = v7->_viewsByLevel;
    v7->_viewsByLevel = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    sceneInvalidationActions = v7->_sceneInvalidationActions;
    v7->_sceneInvalidationActions = (NSMutableSet *)v10;

    v12 = objc_opt_new();
    preferences = v7->_preferences;
    v7->_preferences = (PRPosterPreferencesImpl *)v12;

    v14 = (void *)MEMORY[0x1E0D01718];
    v15 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __31__PRRenderer_initWithDelegate___block_invoke_2;
    v35[3] = &unk_1E2185ED8;
    v16 = v7;
    v36 = v16;
    objc_msgSend(v14, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("Render Extension"), v35);
    v17 = objc_claimAutoreleasedReturnValue();
    sessionExtensions = v16->_sessionExtensions;
    v16->_sessionExtensions = (BSCompoundAssertion *)v17;

    v19 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0DC3F30]);
    unlockAnimator = v16->_unlockAnimator;
    v16->_unlockAnimator = v19;

    -[UIViewFloatAnimatableProperty setValue:](v16->_unlockAnimator, "setValue:", 0.0);
    objc_initWeak(&location, v16);
    objc_initWeak(&from, v16->_unlockAnimator);
    v21 = (void *)MEMORY[0x1E0DC3F10];
    v38[0] = v16->_unlockAnimator;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v15;
    v30[1] = 3221225472;
    v30[2] = __31__PRRenderer_initWithDelegate___block_invoke_4;
    v30[3] = &unk_1E2185F00;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    objc_msgSend(v21, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v22, v30);

    objc_msgSend((id)*MEMORY[0x1E0DC4730], "_stopHangTracer");
    if (objc_msgSend((id)__knownRenderers, "count"))
    {
      PRLogRendering();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[PRRenderer initWithDelegate:].cold.1(v23);

    }
    objc_msgSend((id)__knownRenderers, "addObject:", v16);
    objc_initWeak(&v29, v16);
    v24 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v28, &v29);
    BSLogAddStateCaptureBlockWithTitle();
    v25 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = v16->_stateCaptureHandle;
    v16->_stateCaptureHandle = (BSInvalidatable *)v25;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __31__PRRenderer_initWithDelegate___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__knownRenderers;
  __knownRenderers = v0;

}

void __31__PRRenderer_initWithDelegate___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  BSDispatchMain();

}

void __31__PRRenderer_initWithDelegate___block_invoke_3(uint64_t a1)
{
  -[PRRenderer _updateRenderingExtensions](*(_QWORD *)(a1 + 32));
}

- (void)_updateRenderingExtensions
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  __int128 *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  uint64_t v39;
  __int128 *p_buf;
  _QWORD v41[4];
  char v42;
  _QWORD v43[5];
  uint8_t v44[4];
  uint64_t v45;
  __int128 buf;
  uint64_t v47;
  char v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 56), "isActive");
    v3 = *(_QWORD *)(a1 + 64);
    v4 = MEMORY[0x1E0C809B0];
    if (v2)
    {
      if (!v3)
      {
        PRLogCommon();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = a1;
          _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Acquiring extended rendering assertion.", (uint8_t *)&buf, 0xCu);
        }

        *(_BYTE *)(a1 + 72) = 1;
        v6 = objc_alloc(MEMORY[0x1E0D87C98]);
        objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.PosterKit"), CFSTR("FinishRender"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v6, "initWithExplanation:target:attributes:", CFSTR("ExtendRenderSession"), v7, v9);
        v11 = *(void **)(a1 + 64);
        *(_QWORD *)(a1 + 64) = v10;

        v12 = *(void **)(a1 + 64);
        v43[0] = v4;
        v43[1] = 3221225472;
        v43[2] = __40__PRRenderer__updateRenderingExtensions__block_invoke;
        v43[3] = &unk_1E2186090;
        v43[4] = a1;
        objc_msgSend(v12, "acquireWithInvalidationHandler:", v43);
      }
    }
    else if (v3)
    {
      PRLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_18B634000, v13, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Dropping extended rendering assertion.", (uint8_t *)&buf, 0xCu);
      }

      v14 = *(id *)(a1 + 64);
      v15 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

      *(_BYTE *)(a1 + 72) = 0;
LABEL_12:
      if (*(_BYTE *)(a1 + 72))
        v16 = v2;
      else
        v16 = 0;
      objc_msgSend(*(id *)(a1 + 216), "_FBSScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v4;
      v41[1] = 3221225472;
      v41[2] = __40__PRRenderer__updateRenderingExtensions__block_invoke_125;
      v41[3] = &__block_descriptor_33_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
      v42 = v16;
      objc_msgSend(v17, "pr_performUpdate:", v41);
      objc_msgSend(*(id *)(a1 + 16), "role");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (((v16 | objc_msgSend(v18, "isEqual:", CFSTR("PRPosterRoleLockScreen")) ^ 1) & 1) == 0)
      {
        v19 = *(_BYTE *)(a1 + 73) == 0;

        if (!v19)
          goto LABEL_18;
        objc_msgSend(v17, "settings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isForeground");
        objc_msgSend(*(id *)(a1 + 16), "unlockProgress");
        if ((v20 & BSFloatIsOne()) == 1)
        {
          *(_BYTE *)(a1 + 73) = 1;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v47 = 0x2020000000;
            v48 = 0;
            MEMORY[0x18D77BD04](9, 0, 0, 0);
            PRLogRendering();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v44 = 134217984;
              v45 = a1;
              _os_log_impl(&dword_18B634000, v21, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Posting kCARenderMetalLayerMarkPurgeable notification.", v44, 0xCu);
            }

            PRLogRendering();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v44 = 134217984;
              v45 = a1;
              _os_log_impl(&dword_18B634000, v22, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Calling CABackingStoreCollect.", v44, 0xCu);
            }

            v34 = v4;
            v35 = 3221225472;
            v36 = __40__PRRenderer__updateRenderingExtensions__block_invoke_129;
            v37 = &unk_1E21860D8;
            p_buf = &buf;
            v23 = v14;
            v38 = v23;
            v39 = a1;
            CABackingStoreCollectWithCompletionHandler();
            PRLogRendering();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v44 = 134217984;
              v45 = a1;
              _os_log_impl(&dword_18B634000, v24, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Notifying renderer delegates to drop excess resources.", v44, 0xCu);
            }

            v25 = *(void **)(a1 + 8);
            v30[0] = v4;
            v30[1] = 3221225472;
            v30[2] = __40__PRRenderer__updateRenderingExtensions__block_invoke_130;
            v30[3] = &unk_1E21860D8;
            v33 = &buf;
            v31 = v23;
            v32 = a1;
            objc_msgSend(v25, "renderer:shouldDropExcessResourcesWithCompletionHandler:", a1, v30);

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            PRLogRendering();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = a1;
              _os_log_impl(&dword_18B634000, v26, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Posting kCARenderMetalLayerMarkPurgeable notification.", (uint8_t *)&buf, 0xCu);
            }

            MEMORY[0x18D77BD04](9, 0, 0, 0);
            PRLogRendering();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = a1;
              _os_log_impl(&dword_18B634000, v27, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Posted kCARenderMetalLayerMarkPurgeable notification.", (uint8_t *)&buf, 0xCu);
            }

            PRLogRendering();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 134217984;
              *(_QWORD *)((char *)&buf + 4) = a1;
              _os_log_impl(&dword_18B634000, v28, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Calling CABackingStoreCollect.", (uint8_t *)&buf, 0xCu);
            }

            v29 = v14;
            CABackingStoreCollectWithCompletionHandler();

          }
          goto LABEL_19;
        }
      }

LABEL_18:
      objc_msgSend(v14, "invalidate");
LABEL_19:

      return;
    }
    v14 = 0;
    goto LABEL_12;
  }
}

void __31__PRRenderer_initWithDelegate___block_invoke_4(uint64_t a1)
{
  id v2;
  double v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && *((_BYTE *)WeakRetained + 168))
  {
    objc_msgSend(v2, "presentationValue");
    -[PRRenderer _updateAnimatedUnlockProgress:](WeakRetained, v3);
  }

}

- (void)_updateAnimatedUnlockProgress:(id *)a1
{
  double v4;
  uint64_t v5;
  id v6;
  NSObject *v7;

  if (a1)
  {
    BSDispatchQueueAssertMain();
    objc_msgSend(a1[2], "unlockProgress");
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      v4 = 0.0;
      if ((BSFloatIsZero() & 1) == 0)
      {
        if (BSFloatIsOne())
          v4 = 1.0;
        else
          v4 = a2;
      }
      v5 = objc_msgSend(a1[2], "copy");
      v6 = a1[2];
      a1[2] = (id)v5;

      objc_msgSend(a1[2], "setUnlockProgress:", v4);
      PRLogRendering();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PRRenderer _updateAnimatedUnlockProgress:].cold.1();

      -[PRRenderer reportUpdatedEnvironment:withTransition:](a1, a1[2], 0);
    }
  }
}

id __31__PRRenderer_initWithDelegate___block_invoke_18(uint64_t a1)
{
  id *WeakRetained;
  void *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[PRRenderer _stateCaptureDescription](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_stateCaptureDescription
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1[27], "_FBSScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pui_posterContents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "appendObject:withName:", v4, CFSTR("posterPath"));
    objc_msgSend(v1, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("environment"));

    objc_msgSend(v1[27], "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v5, "appendObject:withName:", v9, CFSTR("scene"));

    v11 = (id)objc_msgSend(v5, "appendBool:withName:", *((unsigned __int8 *)v1 + 25), CFSTR("invalidating"));
    v12 = (id)objc_msgSend(v5, "appendBool:withName:", *((unsigned __int8 *)v1 + 24), CFSTR("invalidated"));
    objc_msgSend(v5, "build");
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (UIView)backgroundView
{
  return (UIView *)-[PRRenderer _viewForLevel:]((uint64_t)self, -2000);
}

- (PRRenderingView)_viewForLevel:(uint64_t)a1
{
  void *v4;
  void *v5;
  PRRenderingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (PRRenderingView *)0;
  BSDispatchQueueAssertMain();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (PRRenderingView *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 216), "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[PRRenderingView initWithOwner:scene:level:extensionUserInteractionEnabled:]([PRRenderingView alloc], "initWithOwner:scene:level:extensionUserInteractionEnabled:", a1, *(_QWORD *)(a1 + 216), a2, objc_msgSend(v8, "pui_isExtensionUserInteractionEnabled"));
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, v10);

    PRLogRendering();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 8);
      v14 = 134218240;
      v15 = v12;
      v16 = 2048;
      v17 = -[PRRenderingView level](v6, "level");
      _os_log_impl(&dword_18B634000, v11, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Created view at level %ld", (uint8_t *)&v14, 0x16u);
    }

  }
  return v6;
}

- (UIView)foregroundView
{
  return (UIView *)-[PRRenderer _viewForLevel:]((uint64_t)self, -1000);
}

- (UIView)floatingView
{
  int isDepthEffectEffectively;
  uint64_t *v4;

  isDepthEffectEffectively = -[PRRenderer _isDepthEffectEffectivelyDisabled]((uint64_t)self);
  v4 = &PRPosterLevelFloatingUnder;
  if (!isDepthEffectEffectively)
    v4 = &PRPosterLevelFloating;
  return (UIView *)-[PRRenderer _viewForLevel:]((uint64_t)self, *v4);
}

- (uint64_t)_isDepthEffectEffectivelyDisabled
{
  uint64_t v1;
  void *v2;
  char v3;
  int v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 216), "_FBSScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(*(id *)(v1 + 16), "isDepthEffectDisabled");
    v4 = objc_msgSend(*(id *)(v1 + 16), "isDepthEffectDisallowed");
    objc_msgSend(v2, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "pui_deviceOrientation");
    v7 = objc_msgSend(v5, "pui_isComplicationRowConfigured");
    if ((unint64_t)(v6 - 1) < 2)
      v8 = v7;
    else
      v8 = 0;
    v9 = v4 | v8;
    if ((v3 & 1) != 0)
      v1 = 1;
    else
      v1 = v9;

  }
  return v1;
}

- (void)setAttachments:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *attachments;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  PRPosterSceneAttachmentView *v22;
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
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_attachments, "isEqualToArray:", v4))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = self->_attachments;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "level"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_viewsByLevel, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](self->_viewsByLevel, "removeObjectForKey:", v10);
          objc_msgSend(v11, "invalidate");

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    v12 = (NSArray *)objc_msgSend(v4, "copy");
    attachments = self->_attachments;
    self->_attachments = v12;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_attachments;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "level"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_viewsByLevel, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v22 = -[PRRenderingView initWithOwner:scene:level:extensionUserInteractionEnabled:]([PRPosterSceneAttachmentView alloc], "initWithOwner:scene:level:extensionUserInteractionEnabled:", self, self->_scene, objc_msgSend(v19, "level"), 0);
            -[PRPosterSceneAttachmentView setAttachment:](v22, "setAttachment:", v19);
            -[NSMutableDictionary setObject:forKey:](self->_viewsByLevel, "setObject:forKey:", v22, v20);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }

  }
}

- (void)updatePreferences:(id)a3
{
  void (**v4)(id, PRPosterPreferencesImpl *, id);
  id v5;

  v4 = (void (**)(id, PRPosterPreferencesImpl *, id))a3;
  BSDispatchQueueAssertMain();
  v5 = (id)objc_opt_new();
  v4[2](v4, self->_preferences, v5);

  -[UIWindowScene pr_updatePreferences:withTransition:](self->_scene, "pr_updatePreferences:withTransition:", self->_preferences, v5);
  -[PRRenderer _reapUnusedViews]((uint64_t)self);

}

- (void)_reapUnusedViews
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allKeys", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "isEmpty"))
            objc_msgSend(v7, "invalidate");

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (id)extendRenderingSessionForReason:(id)a3
{
  id v4;
  NSObject *v5;
  PRRenderingSession *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (self->_disableReentrantRenderingExtensionForMemoryReclamation)
  {
    PRLogRendering();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "Not extending render session because disabled re-entrant rendering extension for memory reclamation.", buf, 2u);
    }
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%u] %@"), ++extendRenderingSessionForReason__count, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PRLogRendering();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_18B634000, v8, OS_LOG_TYPE_DEFAULT, "Extending render session for reason: %@", buf, 0xCu);
    }

    -[BSCompoundAssertion acquireForReason:](self->_sessionExtensions, "acquireForReason:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__PRRenderer_extendRenderingSessionForReason___block_invoke;
    v16[3] = &unk_1E2185F50;
    v4 = v7;
    v17 = v4;
    v5 = v9;
    v18 = v5;
    v10 = (void *)MEMORY[0x18D77C604](v16);
    v6 = -[PRRenderingSession initWithReason:invalidationBlock:]([PRRenderingSession alloc], "initWithReason:invalidationBlock:", v4, v10);
    -[PRRenderingSession timeRemaining](v6, "timeRemaining");
    v12 = v11;
    PRLogRendering();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v4;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_18B634000, v13, OS_LOG_TYPE_DEFAULT, "Extend rendering session, reason: %{public}@, %{public}@ seconds", buf, 0x16u);

    }
  }

  return v6;
}

uint64_t __46__PRRenderer_extendRenderingSessionForReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PRLogRendering();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_18B634000, v2, OS_LOG_TYPE_DEFAULT, "End rendering extension, reason: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (id)extendRenderSessionForReason:(id)a3
{
  void *v3;
  void *v4;

  -[PRRenderer extendRenderingSessionForReason:](self, "extendRenderingSessionForReason:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)noteContentSignificantlyChanged
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setContentSignificantlyChanged:", 1);
  -[UIWindowScene pr_updatePreferences:withTransition:](self->_scene, "pr_updatePreferences:withTransition:", self->_preferences, v3);

}

- (id)extensionBundleURL
{
  void *v1;
  void *v2;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }
    objc_msgSend(v1, "bundleURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)dealloc
{
  UIWindowScene *scene;
  objc_super v4;

  scene = self->_scene;
  if (scene && self->_ambientPresentationTraitChangeRegistration)
    -[UIWindowScene unregisterForTraitChanges:](scene, "unregisterForTraitChanges:");
  objc_msgSend((id)__knownRenderers, "removeObject:", self);
  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PRRenderer;
  -[PRRenderer dealloc](&v4, sel_dealloc);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  FBScene *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  int inlineComplicationRendered;
  int graphicComplicationsRendered;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (FBScene *)a3;
  v7 = a4;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v39;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
        objc_opt_self();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = objc_msgSend(v12, "isValid");

          if (v14)
          {
            if (self->_graphicComplicationScene == v6)
            {
              self->_graphicComplicationsRendered = 1;
            }
            else if (self->_sidebarComplicationScene == v6)
            {
              self->_sidebarComplicationsRendered = 1;
            }
            else if (self->_inlineComplicationScene == v6)
            {
              self->_inlineComplicationRendered = 1;
            }
          }
        }
        else
        {

        }
        ++v11;
      }
      while (v9 != v11);
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      v9 = v15;
    }
    while (v15);
  }
  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "pui_isInlineComplicationConfigured");
  v19 = objc_msgSend(v17, "pui_isComplicationRowConfigured");
  v20 = objc_msgSend(v17, "pui_isComplicationSidebarConfigured");
  v21 = objc_msgSend(v17, "pui_deviceOrientation");
  if ((unint64_t)(v21 - 1) < 2)
    v22 = v19;
  else
    v22 = 0;
  if ((unint64_t)(v21 - 3) < 2)
    v23 = v20;
  else
    v23 = 0;
  if (v18)
    inlineComplicationRendered = self->_inlineComplicationRendered;
  else
    inlineComplicationRendered = v22 | v23;
  if ((v22 & inlineComplicationRendered) == 1)
  {
    graphicComplicationsRendered = self->_graphicComplicationsRendered;
    if (!v23)
      goto LABEL_29;
  }
  else
  {
    graphicComplicationsRendered = inlineComplicationRendered & ~v22;
    if (!v23)
    {
LABEL_29:
      if (!graphicComplicationsRendered)
        goto LABEL_35;
LABEL_34:
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCC0]), "initWithInfo:responder:", 0, 0);
      -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sendActions:", v28);

      goto LABEL_35;
    }
  }
  if (graphicComplicationsRendered && self->_sidebarComplicationsRendered)
    goto LABEL_34;
LABEL_35:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[NSMutableDictionary allValues](self->_viewsByLevel, "allValues", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "setExtensionUserInteractionEnabled:", objc_msgSend(v17, "pui_isExtensionUserInteractionEnabled"));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v31);
  }

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  UIWindowScene *scene;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  PRPosterEnvironmentImpl *v21;
  void *v22;
  void *v23;
  PRPosterEnvironmentImpl *v24;
  PRPosterEnvironmentImpl *environment;
  NSObject *v26;
  PRRenderingBackdropView *v27;
  PRRenderingBackdropView *backdropView;
  PRRenderingBackdropView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[16];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_scene)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already have a scene"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRRenderer scene:willConnectToSession:options:].cold.3();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6E5C8CLL);
  }
  v12 = v11;
  v13 = v9;
  NSClassFromString(CFSTR("UIWindowScene"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRRenderer scene:willConnectToSession:options:].cold.1();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6E5CF0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:UIWindowSceneClass]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRRenderer scene:willConnectToSession:options:].cold.1();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6E5D54);
  }

  PRLogRendering();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B634000, v14, OS_LOG_TYPE_DEFAULT, "Scene did connect", buf, 2u);
  }

  objc_storeStrong((id *)&self->_scene, a3);
  -[UIWindowScene setDelegate:](self->_scene, "setDelegate:", self);
  -[UIWindowScene _registerSceneComponent:forKey:](self->_scene, "_registerSceneComponent:forKey:", self, CFSTR("PRRenderer"));
  scene = self->_scene;
  v36[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _registerBSActionResponderArray:forKey:](scene, "_registerBSActionResponderArray:forKey:", v16, CFSTR("PRRenderer"));

  -[UIWindowScene _FBSScene](self->_scene, "_FBSScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "backlightSceneEnvironment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSupportsAlwaysOn:", 1);

  objc_msgSend(v17, "settings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PRLogTelemetrySignposts();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B634000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_INIT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  v21 = [PRPosterEnvironmentImpl alloc];
  -[UIWindowScene traitCollection](self->_scene, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRRenderer extensionBundleURL]((uint64_t)self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PRPosterEnvironmentImpl initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:](v21, "initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:", v19, v22, 0, v23);
  environment = self->_environment;
  self->_environment = v24;

  if (-[PRPosterEnvironmentImpl isPreview](self->_environment, "isPreview")
    || -[PRPosterEnvironmentImpl isSnapshot](self->_environment, "isSnapshot"))
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "_stopHangTracer");
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "_startHangTracer");
  }
  -[PRRenderer _updateViewsIfNeededFrom:to:](self, 0, v19);
  -[PRRenderingDelegate renderer:didInitializeWithEnvironment:](self->_delegate, "renderer:didInitializeWithEnvironment:", self, self->_environment);
  -[PRRenderer didInitializeWithEnvironment:](self, "didInitializeWithEnvironment:", self->_environment);
  PRLogTelemetrySignposts();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B634000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_INIT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  kdebug_trace();
  -[PRRenderer _updateContentSize]((uint64_t)self);
  -[PRRenderer _configureProminentDisplay]((id *)&self->super.isa);
  v27 = -[PRRenderingBackdropView initWithOwner:scene:]([PRRenderingBackdropView alloc], "initWithOwner:scene:", self, self->_scene);
  backdropView = self->_backdropView;
  self->_backdropView = v27;

  v29 = self->_backdropView;
  -[PRPosterEnvironmentImpl backlightProgress](self->_environment, "backlightProgress");
  -[PRRenderingBackdropView setTargetBacklightProgress:](v29, "setTargetBacklightProgress:");
  objc_msgSend(v19, "pui_sceneAttachments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRRenderer setAttachments:](self, "setAttachments:", v30);

  objc_msgSend(v13, "_FBSScene");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updateClientSettingsWithBlock:", &__block_literal_global_48_1);

  -[PRRenderer _registerForAmbientPresentationTraitChangesIfNecessary](self);
}

- (void)_updateViewsIfNeededFrom:(void *)a3 to:
{
  id v5;
  id v6;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    -[PRRenderer _updateOrientationIfNeededFrom:to:](a1, v6, v5);
    -[PRRenderer _updateDepthEffectIfNeededFrom:to:]((uint64_t)a1);

  }
}

- (void)_updateContentSize
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *MEMORY[0x1E0C9D820];
    v2 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = -[PRRenderer _collectContentSizeForView:](a1, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8));
          if (v3 < v9)
            v3 = v9;
          if (v2 < v10)
            v2 = v10;
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(a1 + 216), "_FBSScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __32__PRRenderer__updateContentSize__block_invoke;
    v12[3] = &__block_descriptor_48_e69_v24__0__FBSMutableSceneClientSettings_8__FBSSceneTransitionContext_16l;
    *(double *)&v12[4] = v3;
    *(double *)&v12[5] = v2;
    objc_msgSend(v11, "pr_performUpdate:", v12);

  }
}

- (void)_configureProminentDisplay
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  PRComplicationsSnapshotSceneHostViewController *v40;
  uint64_t v41;
  id v42;
  PRComplicationsSnapshotSceneHostViewController *v43;
  uint64_t v44;
  id v45;
  PRComplicationsSnapshotSceneHostViewController *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  int v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  int v91;
  int v92;
  int v93;
  _QWORD v94[4];
  _QWORD v95[6];

  v95[4] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend(a1[27], "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "pui_isInlineComplicationConfigured");
  v5 = objc_msgSend(v3, "pui_isComplicationRowConfigured");
  v6 = objc_msgSend(v3, "pui_isComplicationSidebarConfigured");
  v7 = objc_msgSend(v3, "pui_showsHeaderElements");
  v8 = objc_msgSend(v3, "pui_showsComplications");
  if (!v7
    || (objc_msgSend(a1, "timePreviewProminentDisplayViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    if (v5)
      goto LABEL_5;
LABEL_20:
    v10 = 0;
    if (!v6)
      goto LABEL_6;
    goto LABEL_21;
  }
  v80 = v6;
  v76 = a1[1];
  if (v76)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(a1[2], "targetConfiguredProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "titleStyleConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[2], "role");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "effectiveTimeFontWithExtensionBundle:forRole:", v12);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v14;
  objc_msgSend(v14, "effectiveTitleColor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[2], "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v5;
  if (objc_msgSend(v15, "_backlightLuminance") == 1)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(a1[2], "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "_backlightLuminance") == 0;

  }
  v74 = (void *)v12;
  v68 = v16;
  objc_msgSend(v88, "vibrancyConfigurationWithExtensionBundle:luminanceReduced:", v12, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v4;
  if (v4)
    v19 = -3;
  else
    v19 = -1;
  v20 = objc_alloc(MEMORY[0x1E0D1BCA8]);
  objc_msgSend(v84, "color");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithElements:baseFont:date:textColor:", v19, v86, 0, v21);

  objc_msgSend(v22, "setBackgroundType:", objc_msgSend(v18, "backgroundType"));
  objc_msgSend(v22, "setEffectType:", objc_msgSend(v18, "effectType"));
  v23 = v18;
  objc_msgSend(v18, "alternativeVibrancyEffectLUT");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_opt_respondsToSelector();
  objc_msgSend(v24, "lutIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v24;
  objc_msgSend(v24, "bundleURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v8;
  v90 = v7;
  if ((v21 & 1) != 0)
    objc_msgSend(v22, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:luminanceReduced:", v25, v26, v68);
  else
    objc_msgSend(v22, "setAlternativeVibrancyEffectLUTIdentifier:alternativeVibrancyEffectLUTBundleURL:", v25, v26);

  v70 = v23;
  objc_msgSend(v23, "groupName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setGroupName:", v27);

  objc_msgSend(v22, "pr_setAlternateDateEnabled:", objc_msgSend(v88, "isAlternateDateEnabled"));
  objc_msgSend(v88, "timeNumberingSystem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberingSystem:", v69);
  -[PRRenderer _viewForLevel:]((uint64_t)a1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v28, "addSubview:", v29);
  v62 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v29, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v65;
  objc_msgSend(v29, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v61;
  objc_msgSend(v29, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v30;
  objc_msgSend(v29, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "activateConstraints:", v34);

  objc_msgSend(v88, "titleContentStyle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitleContentStyle:", v35);

  objc_msgSend(a1, "setTimePreviewProminentDisplayViewController:", v22);
  v8 = v92;
  v7 = v90;
  v4 = v82;
  v6 = v80;
  if (!v78)
    goto LABEL_20;
LABEL_5:
  v10 = (unint64_t)(objc_msgSend(v3, "pui_deviceOrientation") - 1) < 2;
  if (!v6)
  {
LABEL_6:
    v11 = 0;
    goto LABEL_22;
  }
LABEL_21:
  v11 = (unint64_t)(objc_msgSend(v3, "pui_deviceOrientation") - 3) < 2;
LABEL_22:
  if ((v8 & (v4 | v10 | v11)) == 1)
  {
    objc_msgSend(a1, "complicationsPreviewProminentDisplayViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BCA8]), "initWithElements:baseFont:date:textColor:", 28, 0, 0, 0);
      if (v10)
      {
        -[PRRenderer _makeGraphicComplicationPreviewScene](a1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = a1[14];
        a1[14] = (id)v38;

        objc_msgSend(a1[14], "setDelegate:", a1);
        v40 = -[PRComplicationsSnapshotSceneHostViewController initWithScene:]([PRComplicationsSnapshotSceneHostViewController alloc], "initWithScene:", a1[14]);
        objc_msgSend(v37, "setComplicationContainerViewController:", v40);

      }
      if (v11)
      {
        -[PRRenderer _makeSidebarComplicationPreviewScene](a1);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = a1[16];
        a1[16] = (id)v41;

        objc_msgSend(a1[16], "setDelegate:", a1);
        v43 = -[PRComplicationsSnapshotSceneHostViewController initWithScene:]([PRComplicationsSnapshotSceneHostViewController alloc], "initWithScene:", a1[16]);
        objc_msgSend(v37, "setComplicationSidebarViewController:", v43);

      }
      v91 = v7;
      v93 = v8;
      if (v4)
      {
        -[PRRenderer _makeInlineComplicationPreviewScene](a1);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = a1[18];
        a1[18] = (id)v44;

        objc_msgSend(a1[18], "setDelegate:", a1);
        v46 = -[PRComplicationsSnapshotSceneHostViewController initWithScene:]([PRComplicationsSnapshotSceneHostViewController alloc], "initWithScene:", a1[18]);
        objc_msgSend(v37, "setSubtitleComplicationViewController:", v46);

      }
      -[PRRenderer _viewForLevel:]((uint64_t)a1, 2000);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v47, "addSubview:", v48);
      v79 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v48, "leadingAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "leadingAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "constraintEqualToAnchor:", v87);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v85;
      objc_msgSend(v48, "trailingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "trailingAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToAnchor:", v81);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v77;
      objc_msgSend(v48, "topAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "topAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v94[2] = v50;
      objc_msgSend(v48, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bottomAnchor");
      v75 = v37;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v94[3] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 4);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "activateConstraints:", v54);

      objc_msgSend(a1, "setComplicationsPreviewProminentDisplayViewController:", v75);
      v8 = v93;
      v7 = v91;
    }
  }
  objc_msgSend(a1, "timePreviewProminentDisplayViewController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setHidden:", v7 ^ 1u);

  objc_msgSend(a1, "complicationsPreviewProminentDisplayViewController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setHidden:", v8 ^ 1u);

  -[PRRenderer _updateProminentViewSizingAndTransforms](a1);
}

uint64_t __49__PRRenderer_scene_willConnectToSession_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setDidFinishInitialization:", 1);
}

- (void)_registerForAmbientPresentationTraitChangesIfNecessary
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_18B634000, a2, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Registering for ambient presentation trait changes", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_17();
}

- (void)sceneDidDisconnect:(id)a3
{
  -[PRRenderer _issueSceneInvalidated:]((uint64_t)self, 0);
}

- (void)_issueSceneInvalidated:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void (**v30)(_QWORD, _QWORD);
  NSObject *v31;
  void *v32;
  CFAbsoluteTime Current;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  dispatch_time_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  void (**v43)(_QWORD, _QWORD);
  _QWORD v44[5];
  NSObject *v45;
  id v46;
  CFAbsoluteTime v47;
  _QWORD v48[5];
  id v49;
  id v50;
  NSObject *v51;
  char *v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  id location;
  void *v57;
  uint64_t v58;
  const __CFString *v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  _BYTE v63[10];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    PRLogRendering();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v61 = a1;
      v62 = 1024;
      *(_DWORD *)v63 = v3 != 0;
      _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called w/ scene invalidation action: %{BOOL}u", buf, 0x12u);
    }

    if (*(_BYTE *)(a1 + 24) || *(_BYTE *)(a1 + 25))
    {
      PRLogRendering();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(a1 + 24);
        v7 = *(unsigned __int8 *)(a1 + 25);
        *(_DWORD *)buf = 134218496;
        v61 = a1;
        v62 = 1024;
        *(_DWORD *)v63 = v6;
        *(_WORD *)&v63[4] = 1024;
        *(_DWORD *)&v63[6] = v7;
        _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called while disconnected (%{BOOL}u) or disconnecting (%{BOOL}u)", buf, 0x18u);
      }

      if (v3 && *(_BYTE *)(a1 + 24))
      {
        PRLogRendering();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(unsigned __int8 *)(a1 + 24);
          *(_DWORD *)buf = 134218240;
          v61 = a1;
          v62 = 1024;
          *(_DWORD *)v63 = v9;
          _os_log_impl(&dword_18B634000, v8, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called while disconnected (%{BOOL}u); will fire sceneInvalidationAction immediately",
            buf,
            0x12u);
        }

        v10 = (void *)MEMORY[0x1E0D016A8];
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v58 = *MEMORY[0x1E0CB2D68];
        v59 = CFSTR("Scene already disconnected");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pr_errorWithCode:userInfo:", 5, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "responseForError:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "sendResponse:", v14);

      }
      else if (v3 && *(_BYTE *)(a1 + 25))
      {
        PRLogRendering();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(unsigned __int8 *)(a1 + 24);
          *(_DWORD *)buf = 134218240;
          v61 = a1;
          v62 = 1024;
          *(_DWORD *)v63 = v16;
          _os_log_impl(&dword_18B634000, v15, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated called while disconnecting (%{BOOL}u); will enqueue sceneInvalidation"
            "Action for calling after disconnected",
            buf,
            0x12u);
        }

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      }
      if (*(_QWORD *)(a1 + 8) || *(_QWORD *)(a1 + 216))
      {
        PRLogRendering();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v61 = a1;
          _os_log_impl(&dword_18B634000, v17, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated cleaning issuing poster invalidation cleanup because things are in an inconsistent state", buf, 0xCu);
        }

        -[PRRenderer _cleanupAfterNotifyingDelegateOfInvalidation](a1);
      }
      PRLogRendering();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v61 = a1;
        _os_log_impl(&dword_18B634000, v18, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene already disconnected; bailing",
          buf,
          0xCu);
      }
    }
    else
    {
      PRLogRendering();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v61 = a1;
        _os_log_impl(&dword_18B634000, v19, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated; Acquiring runtime assertion to allow for invalidation",
          buf,
          0xCu);
      }

      v20 = objc_alloc(MEMORY[0x1E0D87C98]);
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.PosterKit"), CFSTR("FinishRender"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v20, "initWithExplanation:target:attributes:", CFSTR("ExtendRenderSession"), v21, v23);

      objc_initWeak(&location, (id)a1);
      v25 = MEMORY[0x1E0C809B0];
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke;
      v54[3] = &unk_1E2185F78;
      objc_copyWeak(&v55, &location);
      objc_msgSend(v24, "acquireWithInvalidationHandler:", v54);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
      v27 = PRGetMemoryUsageForCurrentProcess();
      PRLogRendering();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v61 = a1;
        v62 = 2048;
        *(_QWORD *)v63 = v27;
        _os_log_impl(&dword_18B634000, v28, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated; Memory usage prior to invalidation: %llu",
          buf,
          0x16u);
      }

      v48[0] = v25;
      v48[1] = 3221225472;
      v48[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke_67;
      v48[3] = &unk_1E2185FA0;
      v48[4] = a1;
      v29 = v26;
      v49 = v29;
      v52 = sel__issueSceneInvalidated_;
      v50 = v3;
      v53 = v27;
      v18 = v24;
      v51 = v18;
      v30 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D77C604](v48);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        PRLogRendering();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v61 = a1;
          _os_log_impl(&dword_18B634000, v31, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene is disconnecting (async)", buf, 0xCu);
        }

        *(_BYTE *)(a1 + 25) = 1;
        v32 = (void *)MEMORY[0x18D77C448]();
        Current = CFAbsoluteTimeGetCurrent();
        v34 = *(void **)(a1 + 8);
        v44[0] = v25;
        v44[1] = 3221225472;
        v44[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke_73;
        v44[3] = &unk_1E2185FF0;
        v44[4] = a1;
        v47 = Current;
        v35 = v30;
        v46 = v35;
        v45 = v18;
        objc_msgSend(v34, "rendererDidInvalidate:completion:", a1, v44);
        v36 = dispatch_time(0, 8000000000);
        v40[0] = v25;
        v40[1] = 3221225472;
        v40[2] = __37__PRRenderer__issueSceneInvalidated___block_invoke_75;
        v40[3] = &unk_1E2186018;
        v41 = v29;
        v42 = a1;
        v43 = v35;
        dispatch_after(v36, MEMORY[0x1E0C80D38], v40);

        objc_autoreleasePoolPop(v32);
      }
      else
      {
        *(_BYTE *)(a1 + 24) = 1;
        PRLogRendering();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v61 = a1;
          _os_log_impl(&dword_18B634000, v37, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene disconnection (sync)", buf, 0xCu);
        }

        v38 = (void *)MEMORY[0x18D77C448]();
        objc_msgSend(*(id *)(a1 + 8), "rendererDidInvalidate:", a1);
        -[PRRenderer _cleanupAfterNotifyingDelegateOfInvalidation](a1);
        objc_autoreleasePoolPop(v38);
        PRLogRendering();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v61 = a1;
          _os_log_impl(&dword_18B634000, v39, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene did disconnect (sync)", buf, 0xCu);
        }

        v30[2](v30, 0);
      }

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_cleanupAfterNotifyingDelegateOfInvalidation
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    PRLogRendering();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a1;
      _os_log_impl(&dword_18B634000, v2, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _cleanupAfterNotifyingDelegateOfInvalidation begin", buf, 0xCu);
    }

    v3 = (void *)MEMORY[0x18D77C448]();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "invalidate");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 96), "invalidate");
    objc_msgSend(*(id *)(a1 + 112), "invalidate");
    objc_msgSend(*(id *)(a1 + 128), "invalidate");
    objc_msgSend(*(id *)(a1 + 144), "invalidate");
    objc_msgSend(*(id *)(a1 + 56), "invalidate");
    objc_msgSend(*(id *)(a1 + 160), "invalidate");
    objc_msgSend(*(id *)(a1 + 64), "invalidate");
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    if (*(_QWORD *)(a1 + 176))
      objc_msgSend(*(id *)(a1 + 216), "unregisterForTraitChanges:");
    objc_msgSend(*(id *)(a1 + 216), "setDelegate:", 0);
    v10 = *(void **)(a1 + 216);
    *(_QWORD *)(a1 + 216) = 0;

    v11 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    objc_msgSend((id)__knownRenderers, "removeObject:", a1);
    objc_msgSend(*(id *)(a1 + 104), "invalidate");
    objc_autoreleasePoolPop(v3);
    PRLogRendering();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a1;
      _os_log_impl(&dword_18B634000, v12, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _cleanupAfterNotifyingDelegateOfInvalidation end", buf, 0xCu);
    }

  }
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRLogRendering();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 134218242;
    v8 = WeakRetained;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> _issueSceneInvalidated; Runtime assertion to allow for invalidation: %{public}@",
      (uint8_t *)&v7,
      0x16u);

  }
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_67(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  PRLogRendering();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218240;
    v29 = v5;
    v30 = 1024;
    v31 = a2;
    _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Invalidation completion block was called; didTimeOut: %{BOOL}u",
      buf,
      0x12u);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "setFlag:", 1))
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<PRRenderer %p> did not call the completion block.  Aborting."), *(_QWORD *)(a1 + 32), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __37__PRRenderer__issueSceneInvalidated___block_invoke_67_cold_1();
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      PRLogRendering();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v29 = v7;
        _os_log_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Invalidation completion block marked completed", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
      objc_msgSend(MEMORY[0x1E0D016A8], "response");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 48);
      if (v9)
        objc_msgSend(v9, "sendResponse:", v8);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "sendResponse:", v8);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v12);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
      }
      -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));

      objc_msgSend(*(id *)(a1 + 56), "invalidate");
    }
  }
  else
  {
    PRLogRendering();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __37__PRRenderer__issueSceneInvalidated___block_invoke_67_cold_2(a1, v15, v16, v17, v18, v19, v20, v21);

  }
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int has_internal_content;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = PRGetMemoryUsageForCurrentProcess();
    v5 = PRGetMaximumMemoryUsageForCurrentProcess();
    PRLogRendering();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = a1;
      v24 = 2048;
      v25 = a2;
      _os_log_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory before invalidation: %{iec-bytes}lld", (uint8_t *)&v22, 0x16u);
    }

    PRLogRendering();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = a1;
      v24 = 2048;
      v25 = v4;
      _os_log_impl(&dword_18B634000, v7, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory after invalidation: %{iec-bytes}lld", (uint8_t *)&v22, 0x16u);
    }

    PRLogRendering();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 134218240;
      v23 = a1;
      v24 = 2048;
      v25 = v5;
      _os_log_impl(&dword_18B634000, v8, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory maximum: %{iec-bytes}lld", (uint8_t *)&v22, 0x16u);
    }

    v9 = a2 - v4;
    if (a2 - v4 > -1000001)
    {
      PRLogRendering();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 134218240;
        v23 = a1;
        v24 = 2048;
        v25 = v9;
        _os_log_impl(&dword_18B634000, v12, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory freed after invalidation: %{iec-bytes}llu", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      has_internal_content = os_variant_has_internal_content();
      PRLogRendering();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (has_internal_content)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:].cold.3();
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:].cold.4();
      }
    }

    if (v4 > v5)
    {
      v13 = os_variant_has_internal_content();
      PRLogRendering();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:].cold.1(a1, v15);
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[PRRenderer _validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:].cold.2(a1, v15, v16, v17, v18, v19, v20, v21);
      }

    }
  }
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_73(uint64_t a1)
{
  double Current;
  NSObject *v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  PRLogRendering();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = Current - *(double *)(a1 + 56);
    *(_DWORD *)buf = 134218240;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene is disconnecting (async); client has called internal invalidation completion block in %{time}f",
      buf,
      0x16u);
  }

  -[PRRenderer _cleanupAfterNotifyingDelegateOfInvalidation](*(_QWORD *)(a1 + 32));
  PRLogRendering();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v11 = v7;
    _os_log_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene did disconnect! (async)", buf, 0xCu);
  }

  v9 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  BSDispatchMain();

}

uint64_t __37__PRRenderer__issueSceneInvalidated___block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PRLogRendering();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_18B634000, v2, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene is disconnected (async); sending external invalidation completion",
      (uint8_t *)&v5,
      0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

uint64_t __37__PRRenderer__issueSceneInvalidated___block_invoke_75(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "getFlag");
  if ((result & 1) == 0)
  {
    PRLogRendering();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 134218240;
      v6 = v4;
      v7 = 2048;
      v8 = 0x4020000000000000;
      _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene disconnection (async) timedout after %f seconds", (uint8_t *)&v5, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return result;
}

- (PRRenderer)initWithScene:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  PRRenderer *result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  PRRenderer *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this should not be called"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("PRRenderer.m");
    v19 = 1024;
    v20 = 594;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18B634000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (PRRenderer *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (UIScene)_scene
{
  return (UIScene *)self->_scene;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_actionsAfterHandlingAppIntentsHandshakeActionsInActions:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = v3;
  if (a1)
  {
    v4 = v3;
    a1 = (void *)objc_msgSend(v3, "mutableCopy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v10, "isValid"))
            {
              objc_msgSend(MEMORY[0x1E0C91D88], "sharedListener");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "listenerEndpoint");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "respondWithListenerEndpoint:error:", v12, 0);

            }
            objc_msgSend(a1, "removeObject:", v10);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
  return a1;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  UIWindowScene *scene;
  uint64_t v33;
  UIWindowScene *v34;
  UIWindowScene *v35;
  char v36;
  char v37;
  void *v38;
  UIWindowScene *v39;
  void *v40;
  PRPosterEnvironmentImpl *v41;
  void *v42;
  PRPosterEnvironmentImpl *v43;
  PRPosterEnvironmentImpl *environment;
  PRPosterEnvironmentImpl *v45;
  PRPosterEnvironmentImpl *v46;
  BOOL v47;
  id *v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  PRInvalidatable *wakeToken;
  PRInvalidatable *v58;
  PRInvalidatable *v59;
  PRInvalidatable *v60;
  int64_t v61;
  dispatch_time_t v62;
  PRInvalidatable *v63;
  dispatch_time_t v64;
  double v65;
  void *v66;
  double v67;
  _BOOL8 v69;
  double v70;
  dispatch_time_t v71;
  id v72;
  char v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  void *v83;
  NSObject *v84;
  BOOL v85;
  PRInvalidatable *v86;
  PRInvalidatable *unlockToken;
  char *__ptr32 *v88;
  double v89;
  double v90;
  int v91;
  double v92;
  NSObject *v93;
  UIViewFloatAnimatableProperty *unlockAnimator;
  PRPosterEnvironmentImpl *v95;
  NSObject *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  PRPosterEnvironmentImpl *v104;
  uint64_t v105;
  PRPosterEnvironmentImpl *v106;
  id v107;
  NSObject *v108;
  void *v109;
  void *v110;
  int IsOne;
  void *v112;
  int v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  int v118;
  int v119;
  int v120;
  id v121;
  PRPosterEnvironmentImpl *v122;
  void *v123;
  void *v124;
  _QWORD v125[4];
  id v126;
  uint64_t v127;
  uint64_t v128;
  void (*v129)(uint64_t);
  void *v130;
  PRRenderer *v131;
  PRPosterEnvironmentImpl *v132;
  id v133;
  double v134;
  double v135;
  BOOL v136;
  char v137;
  char v138;
  _QWORD v139[5];
  _QWORD v140[5];
  _QWORD v141[4];
  id v142;
  _QWORD block[5];
  PRInvalidatable *v144;
  uint8_t v145[4];
  PRRenderer *v146;
  _BYTE buf[22];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = (uint64_t)a5;
  v16 = (unint64_t)a6;
  v17 = a7;
  if (!*(_WORD *)&self->_disconnected)
  {
    v121 = v13;
    objc_msgSend(v14, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(v15 | v16))
    {
      objc_msgSend(MEMORY[0x1E0D23210], "diffFromSettings:toSettings:", 0, v18);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v120 = objc_msgSend(v18, "pui_isWallpaperObscured");
    if (v120)
      objc_msgSend(v17, "setAnimationSettings:", 0);
    v123 = (void *)objc_opt_new();
    v124 = v18;
    if (PUIDynamicRotationIsActive()
      && (objc_msgSend(v17, "animationSettings"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v19,
          v19))
    {
      v20 = (void *)MEMORY[0x1E0D016B0];
      objc_msgSend(v17, "animationSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "duration");
      v23 = v22;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "settingsWithDuration:timingFunction:", v24, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v17, "animationSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v123, "setAnimationSettings:", v25);

    objc_msgSend(v17, "actions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRRenderer _actionsAfterHandlingAppIntentsHandshakeActionsInActions:](self, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setActions:", v28);

    objc_msgSend(v123, "setSignificantEvent:", objc_msgSend(v17, "pui_significantEvent"));
    objc_msgSend(v123, "setSettingsDiff:", v15);
    v122 = self->_environment;
    v30 = *MEMORY[0x1E0C9D538];
    v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v31 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v119 = objc_msgSend((id)v16, "pui_showsHeaderElements");
      v118 = objc_msgSend((id)v16, "pui_showsComplications");
      scene = self->_scene;
      v33 = objc_opt_class();
      v34 = scene;
      if (v33)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v35 = v34;
        else
          v35 = 0;
      }
      else
      {
        v35 = 0;
      }
      v39 = v35;

      -[UIWindowScene traitCollection](v39, "traitCollection");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = [PRPosterEnvironmentImpl alloc];
      -[PRRenderer extensionBundleURL]((uint64_t)self);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[PRPosterEnvironmentImpl initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:](v41, "initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:", v124, v40, 0, v42);
      environment = self->_environment;
      self->_environment = v43;

      v45 = self->_environment;
      -[PRPosterEnvironmentImpl backlightProgress](v122, "backlightProgress");
      -[PRPosterEnvironmentImpl setBacklightProgress:](v45, "setBacklightProgress:");
      v46 = self->_environment;
      -[PRPosterEnvironmentImpl linearBacklightProgress](v122, "linearBacklightProgress");
      -[PRPosterEnvironmentImpl setLinearBacklightProgress:](v46, "setLinearBacklightProgress:");
      objc_msgSend(v123, "setSettingsDiff:", v15);
      v47 = -[PRPosterEnvironmentImpl isPreview](self->_environment, "isPreview");
      v48 = (id *)MEMORY[0x1E0DC4730];
      if (v47 || -[PRPosterEnvironmentImpl isSnapshot](self->_environment, "isSnapshot"))
        objc_msgSend(*v48, "_stopHangTracer");
      else
        objc_msgSend(*v48, "_startHangTracer");
      -[PRRenderer _updateViewsIfNeededFrom:to:](self, (void *)v16, v124);
      v49 = objc_msgSend((id)v16, "pui_isSnapshot");
      v50 = objc_msgSend(v124, "pui_isSnapshot");
      v51 = objc_msgSend(v124, "pui_showsHeaderElements");
      v52 = objc_msgSend(v124, "pui_showsComplications");
      if (v119 != v51 || ((v118 ^ v52) & 1) != 0 || v49 != v50)
        -[PRRenderer _configureProminentDisplay]((id *)&self->super.isa);
      v53 = -[PRPosterEnvironmentImpl luminance](self->_environment, "luminance");
      v38 = v124;
      if (-[PRPosterEnvironmentImpl luminance](v122, "luminance") != v53)
      {
        PRLogRendering();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromBLSAdjustedLuminance();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v55;
          _os_log_impl(&dword_18B634000, v54, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p>: Backlight now: %{public}@", buf, 0x16u);

          v38 = v124;
        }

        -[PRRenderer extendRenderSessionForReason:](self, "extendRenderSessionForReason:", CFSTR("LuminanceDidChange"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRInvalidatable invalidate](self->_wakeToken, "invalidate");
        wakeToken = self->_wakeToken;
        self->_wakeToken = 0;

        if (v53 == 2)
        {
          -[PRRenderer extendRenderSessionForReason:](self, "extendRenderSessionForReason:", CFSTR("ScreenWake"));
          v58 = (PRInvalidatable *)objc_claimAutoreleasedReturnValue();
          v59 = self->_wakeToken;
          self->_wakeToken = v58;

          v60 = v58;
          if (v120)
            v61 = 0;
          else
            v61 = 3000000000;
          v62 = dispatch_time(0, v61);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke;
          block[3] = &unk_1E2183900;
          block[4] = self;
          v144 = v60;
          v63 = v60;
          v64 = v62;
          v38 = v124;
          dispatch_after(v64, MEMORY[0x1E0C80D38], block);

        }
        v65 = 0.0;
        if ((v120 & 1) == 0)
        {
          +[PRPosterDomain rootSettings](PRPosterDomain, "rootSettings");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "wakeDuration");
          v65 = v67;

        }
        v69 = v65 > 0.0 && v53 != 0;
        v70 = 1.0;
        if (v53 != 2)
          v70 = 0.0;
        -[PRRenderingBackdropView setTargetBacklightProgress:animated:](self->_backdropView, "setTargetBacklightProgress:animated:", v69, v70);
        v71 = dispatch_time(0, (uint64_t)(v65 * 1000000000.0));
        v141[0] = MEMORY[0x1E0C809B0];
        v141[1] = 3221225472;
        v141[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2;
        v141[3] = &unk_1E2184010;
        v142 = v56;
        v72 = v56;
        dispatch_after(v71, MEMORY[0x1E0C80D38], v141);

      }
      v73 = objc_msgSend((id)v16, "pr_isParallaxEffectivelyEnabled");
      v37 = v73 ^ objc_msgSend(v38, "pr_isParallaxEffectivelyEnabled");
      objc_msgSend((id)v16, "pui_userTapLocation");
      v75 = v74;
      v77 = v76;
      objc_msgSend(v38, "pui_userTapLocation");
      v79 = v78;
      v81 = v80;
      v82 = objc_msgSend((id)v16, "pui_userTapEventsCounter");
      if (v82 == objc_msgSend(v38, "pui_userTapEventsCounter") && v79 == v75 && v81 == v77)
      {
        v36 = 0;
      }
      else
      {
        v36 = 1;
        v29 = v81;
        v30 = v79;
      }
      objc_msgSend(v38, "pui_sceneAttachments");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRRenderer setAttachments:](self, "setAttachments:", v83);

      v31 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v36 = 0;
      v37 = 0;
      v38 = v124;
    }
    *(_OWORD *)buf = *MEMORY[0x1E0C9D820];
    if (objc_msgSend(v17, "pr_finishUnlockingWithParameters:", buf))
    {
      if (self->_animatingUnlock)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!_animatingUnlock"));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PRRenderer _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:].cold.1();
        objc_msgSend(objc_retainAutorelease(v117), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18B6E8D50);
      }
      self->_animatingUnlock = 1;
      PRLogTelemetrySignposts();
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = v16 == 0;
      if (os_signpost_enabled(v84))
      {
        *(_WORD *)v145 = 0;
        _os_signpost_emit_with_name_impl(&dword_18B634000, v84, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_UNLOCK_PROGRESS", " enableTelemetry=YES  isAnimation=YES ", v145, 2u);
      }

      kdebug_trace();
      self->_interruptedUnlock = 0;
      -[PRRenderer extendRenderSessionForReason:](self, "extendRenderSessionForReason:", CFSTR("FinishUnlock"));
      v86 = (PRInvalidatable *)objc_claimAutoreleasedReturnValue();
      unlockToken = self->_unlockToken;
      self->_unlockToken = v86;

      v31 = MEMORY[0x1E0C809B0];
      v139[4] = self;
      v140[0] = MEMORY[0x1E0C809B0];
      v88 = &off_18B73A000;
      v140[1] = 3221225472;
      v140[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_93;
      v140[3] = &unk_1E2184010;
      v140[4] = self;
      v139[0] = MEMORY[0x1E0C809B0];
      v139[1] = 3221225472;
      v139[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_3;
      v139[3] = &unk_1E2186040;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v140, v139, *(double *)buf, *(double *)&buf[8]);
    }
    else
    {
      objc_msgSend(v38, "pr_unlockProgress");
      v90 = v89;
      v91 = objc_msgSend((id)v15, "pr_unlockProgressDidChange");
      if (self->_animatingUnlock)
      {
        v85 = v16 == 0;
        if (v91 && (objc_msgSend((id)v16, "pr_unlockProgress"), v90 < v92))
        {
          PRLogRendering();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v145 = 134217984;
            v146 = self;
            _os_log_impl(&dword_18B634000, v93, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Interrupting animated unlock!", v145, 0xCu);
          }

          *(_WORD *)&self->_animatingUnlock = 256;
          unlockAnimator = self->_unlockAnimator;
          -[UIViewFloatAnimatableProperty presentationValue](unlockAnimator, "presentationValue");
          -[UIViewFloatAnimatableProperty setValue:](unlockAnimator, "setValue:");
        }
        else
        {
          v95 = self->_environment;
          -[PRPosterEnvironmentImpl unlockProgress](v122, "unlockProgress");
          -[PRPosterEnvironmentImpl setUnlockProgress:](v95, "setUnlockProgress:");
        }
        v31 = MEMORY[0x1E0C809B0];
        v88 = &off_18B73A000;
      }
      else
      {
        v85 = v16 == 0;
        v88 = &off_18B73A000;
        if (v91)
        {
          PRLogRendering();
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            -[PRRenderer _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:].cold.2();

          v31 = MEMORY[0x1E0C809B0];
          if (self->_interruptedUnlock)
          {
            -[UIViewFloatAnimatableProperty value](self->_unlockAnimator, "value");
            v98 = v97;
            objc_msgSend((id)v16, "pr_unlockProgress");
            v100 = v90 - v99;
            v101 = 0.0;
            if (v90 - v99 <= 0.0)
              v102 = 0.0;
            else
              v102 = 1.0;
            v103 = v102 - v90;
            if ((BSFloatIsZero() & 1) == 0)
              v101 = (v102 - v98) / v103;
            if (BSFloatIsZero())
              v90 = v102;
            else
              v90 = v98 + v100 * v101;
            if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
              self->_interruptedUnlock = 0;
          }
          -[UIViewFloatAnimatableProperty setValue:](self->_unlockAnimator, "setValue:", v90);
          -[PRPosterEnvironmentImpl setUnlockProgress:](self->_environment, "setUnlockProgress:", v90);
        }
      }
    }
    v104 = self->_environment;
    v127 = v31;
    v105 = *((_QWORD *)v88 + 472);
    v128 = v105;
    v129 = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_96;
    v130 = &unk_1E2186068;
    v136 = v85;
    v131 = self;
    v106 = v104;
    v132 = v106;
    v107 = v123;
    v133 = v107;
    v137 = v37;
    v138 = v36;
    v134 = v30;
    v135 = v29;
    _UISceneSettingsDiffActionPerformChangesWithTransitionContext();
    if (objc_msgSend(v124, "pui_isInvalidated"))
    {
      PRLogRendering();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v145 = 134217984;
        v146 = self;
        _os_log_impl(&dword_18B634000, v108, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> issuing scene settings invalidation", v145, 0xCu);
      }

      objc_msgSend(v124, "otherSettings");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "objectForSetting:", 20469);
      v110 = (void *)objc_claimAutoreleasedReturnValue();

      -[PRRenderer _issueSceneInvalidated:]((uint64_t)self, v110);
    }
    -[PRPosterEnvironmentImpl unlockProgress](self->_environment, "unlockProgress");
    IsOne = BSFloatIsOne();
    -[PRPosterEnvironmentImpl role](self->_environment, "role");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v112, "isEqual:", CFSTR("PRPosterRoleLockScreen"));

    if (v113 && IsOne)
    {
      -[PRRenderer extendRenderingSessionForReason:](self, "extendRenderingSessionForReason:", CFSTR("delaySuspend"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = (void *)MEMORY[0x1E0CD28B0];
      v125[0] = MEMORY[0x1E0C809B0];
      v125[1] = v105;
      v125[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_102;
      v125[3] = &unk_1E2184010;
      v126 = v114;
      v116 = v114;
      objc_msgSend(v115, "bs_performAfterSynchronizedCommit:", v125);

    }
    v13 = v121;
  }

}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v3 == v2)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

  }
}

uint64_t __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_93(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  CAFrameRateRange v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_94;
  v4[3] = &unk_1E2184010;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2490370, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_94(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setValue:", 1.0);
}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_3(uint64_t a1, int a2, int a3)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  PRLogRendering();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 134218496;
    v12 = v10;
    v13 = 1024;
    v14 = a2;
    v15 = 1024;
    v16 = a3;
    _os_log_debug_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Unlock animator complete! %d/%d", (uint8_t *)&v11, 0x18u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  PRLogTelemetrySignposts();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_18B634000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_UNLOCK_PROGRESS", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v11, 2u);
  }

  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "invalidate");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 88);
  *(_QWORD *)(v8 + 88) = 0;

}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_96(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 72))
  {
    -[PRRenderer reportUpdatedEnvironment:withTransition:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    if (*(_BYTE *)(a1 + 73))
      -[PRRenderer _updateContentSize](*(_QWORD *)(a1 + 32));
    if (*(_BYTE *)(a1 + 74) && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "renderer:didReceiveTapAtPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  -[PRRenderer _reapUnusedViews](*(_QWORD *)(a1 + 32));
}

- (void)reportUpdatedEnvironment:(void *)a3 withTransition:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  id *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = a2;
    PRLogTelemetrySignposts();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B634000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_UPDATE", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v11, 2u);
    }

    kdebug_trace();
    objc_msgSend(v5, "animationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      PRLogRendering();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134218242;
        v12 = a1;
        v13 = 2114;
        v14 = v8;
        _os_log_impl(&dword_18B634000, v9, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Reporting updated environment with non-nil animation settings: %{public}@", (uint8_t *)&v11, 0x16u);
      }

    }
    objc_msgSend(a1[1], "renderer:didUpdateEnvironment:withTransition:", a1, v6, v5);
    objc_msgSend(a1, "didUpdateEnvironment:", v6);

    PRLogTelemetrySignposts();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B634000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PBF_ENV_UPDATE", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v11, 2u);
    }

    kdebug_trace();
  }

}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_102(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_103;
  block[3] = &unk_1E2184010;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __124__PRRenderer__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType___block_invoke_2_103(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "assertion");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (void)_updateOrientationIfNeededFrom:(void *)a3 to:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  double v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(v5, "interfaceOrientation");
    if (v7 != objc_msgSend(v6, "interfaceOrientation"))
    {
      v8 = objc_msgSend(v5, "interfaceOrientation");
      v9 = objc_msgSend(v6, "interfaceOrientation");
      PRLogRendering();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        switch(v8)
        {
          case 1:
            v11 = CFSTR("UIInterfaceOrientationPortrait");
            break;
          case 3:
            v11 = CFSTR("UIInterfaceOrientationLandscapeRight");
            break;
          case 4:
            v11 = CFSTR("UIInterfaceOrientationLandscapeLeft");
            break;
          default:
            v11 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
            if (v8 != 2)
              v11 = 0;
            break;
        }
        switch(v9)
        {
          case 1:
            v12 = CFSTR("UIInterfaceOrientationPortrait");
            break;
          case 3:
            v12 = CFSTR("UIInterfaceOrientationLandscapeRight");
            break;
          case 4:
            v12 = CFSTR("UIInterfaceOrientationLandscapeLeft");
            break;
          default:
            v12 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
            if (v9 != 2)
              v12 = 0;
            break;
        }
        *(_DWORD *)buf = 134218498;
        v27 = a1;
        v28 = 2114;
        v29 = v11;
        v30 = 2114;
        v31 = v12;
        _os_log_impl(&dword_18B634000, v10, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Scene Orientation has updated from %{public}@ -> %{public}@", buf, 0x20u);
      }

    }
    v13 = objc_msgSend(v5, "pui_deviceOrientation");
    if (v13 == objc_msgSend(v6, "pui_deviceOrientation"))
      goto LABEL_47;
    v14 = objc_msgSend(v5, "pui_deviceOrientation");
    v15 = objc_msgSend(v6, "pui_deviceOrientation");
    PRLogRendering();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      switch(v14)
      {
        case 1:
          v17 = CFSTR("UIInterfaceOrientationPortrait");
          break;
        case 3:
          v17 = CFSTR("UIInterfaceOrientationLandscapeRight");
          break;
        case 4:
          v17 = CFSTR("UIInterfaceOrientationLandscapeLeft");
          break;
        default:
          v17 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
          if (v14 != 2)
            v17 = 0;
          break;
      }
      switch(v15)
      {
        case 1:
          v18 = CFSTR("UIInterfaceOrientationPortrait");
          break;
        case 3:
          v18 = CFSTR("UIInterfaceOrientationLandscapeRight");
          break;
        case 4:
          v18 = CFSTR("UIInterfaceOrientationLandscapeLeft");
          break;
        default:
          v18 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
          if (v15 != 2)
            v18 = 0;
          break;
      }
      *(_DWORD *)buf = 134218498;
      v27 = a1;
      v28 = 2114;
      v29 = v17;
      v30 = 2114;
      v31 = v18;
      _os_log_impl(&dword_18B634000, v16, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Device Orientation has updated from %{public}@ -> %{public}@", buf, 0x20u);
    }

    if ((unint64_t)(v14 - 3) >= 2)
    {
      v19 = 0.5;
      if (((v14 - 1) | (unint64_t)(v15 - 1)) >= 2)
      {
LABEL_46:
        objc_msgSend(a1, "extendRenderingSessionForReason:", CFSTR("RotationAnimations"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0CD28B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke;
        v23[3] = &unk_1E21847C0;
        v25 = v19;
        v24 = v20;
        v22 = v20;
        objc_msgSend(v21, "bs_performAfterSynchronizedCommit:", v23);

LABEL_47:
        -[PRRenderer _updateProminentViewSizingAndTransforms]((id *)a1);
        goto LABEL_48;
      }
    }
    else
    {
      v19 = 0.5;
      if ((unint64_t)(v15 - 3) > 1)
        goto LABEL_46;
    }
    v19 = 0.9;
    goto LABEL_46;
  }
LABEL_48:

}

- (void)_updateDepthEffectIfNeededFrom:(uint64_t)a1 to:
{
  int isDepthEffectEffectively;
  char v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    isDepthEffectEffectively = -[PRRenderer _isDepthEffectEffectivelyDisabled](a1);
    v3 = isDepthEffectEffectively;
    if (*(unsigned __int8 *)(a1 + 184) != isDepthEffectEffectively)
    {
      if (*(_BYTE *)(a1 + 184))
        v4 = -500;
      else
        v4 = 1000;
      if (isDepthEffectEffectively)
        v5 = -500;
      else
        v5 = 1000;
      -[PRRenderer _moveViewForLevel:toLevel:](a1, v4, v5);
    }
    *(_BYTE *)(a1 + 184) = v3;
  }
}

void __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke_2;
  block[3] = &unk_1E2184010;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __48__PRRenderer__updateOrientationIfNeededFrom_to___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "assertion");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

- (void)_updateProminentViewSizingAndTransforms
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  if (a1)
  {
    objc_msgSend(a1[27], "_FBSScene");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "settings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "pui_deviceOrientation");
    LOBYTE(v2) = objc_msgSend(v3, "pui_isSnapshot");
    v5 = objc_msgSend(v3, "pui_content");
    if ((v2 & 1) != 0 || v5 == 1)
    {
      -[PRRenderer _viewForLevel:]((uint64_t)a1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "timePreviewProminentDisplayViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[PRRenderer _viewForLevel:]((uint64_t)a1, 2000);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "complicationsPreviewProminentDisplayViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "bounds");
      x = v50.origin.x;
      y = v50.origin.y;
      width = v50.size.width;
      height = v50.size.height;
      v16 = v4 - 3;
      v17 = CGRectGetWidth(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v18 = CGRectGetHeight(v51);
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      v19 = CGRectGetWidth(v52);
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      v20 = CGRectGetHeight(v53);
      if (v17 >= v18)
        v21 = v17;
      else
        v21 = v18;
      if (v17 >= v18)
        v22 = v18;
      else
        v22 = v17;
      if (v19 >= v20)
        v23 = v20;
      else
        v23 = v19;
      if (v19 >= v20)
        v20 = v19;
      if (v16 >= 2)
        v24 = v20;
      else
        v24 = v23;
      if (v16 >= 2)
        v25 = v22;
      else
        v25 = v21;
      v26 = 0.0;
      objc_msgSend(v6, "setFrame:", 0.0, 0.0, v25, v24);
      objc_msgSend(v9, "setFrame:", 0.0, 0.0, v25, v24);
      v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v42 = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v49.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v49.c = v41;
      v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      *(_OWORD *)&v49.tx = v40;
      v27 = objc_msgSend(v3, "pui_deviceOrientation");
      if (PUIDynamicRotationIsActive())
      {
        memset(&v48, 0, sizeof(v48));
        if (v27 != 1)
        {
          switch(v27)
          {
            case 3:
              v26 = 1.57079633;
              break;
            case 4:
              v26 = -1.57079633;
              break;
            case 2:
              v26 = 3.14159265;
              break;
            default:
              v26 = 0.0;
              break;
          }
        }
        CGAffineTransformMakeRotation(&v47, v26);
        UIIntegralTransform();
        objc_msgSend(v8, "bounds");
        v32 = v28;
        v33 = v29;
        v34 = v30;
        *(_OWORD *)&v46.a = v42;
        *(_OWORD *)&v46.c = v41;
        *(_OWORD *)&v46.tx = v40;
        if ((unint64_t)(v27 - 3) <= 1)
        {
          v35 = v31;
          v36 = CGRectGetHeight(*(CGRect *)&v28);
          v54.origin.x = v32;
          v54.origin.y = v33;
          v54.size.width = v34;
          v54.size.height = v35;
          v37 = v36 - CGRectGetWidth(v54);
          if (v37 < 0.0)
            v37 = -v37;
          v38 = v37 * 0.5;
          v39 = -(v37 * 0.5);
          if (v27 == 3)
            v39 = v38;
          *(_OWORD *)&t1.a = v42;
          *(_OWORD *)&t1.c = v41;
          *(_OWORD *)&t1.tx = v40;
          CGAffineTransformTranslate(&v45, &t1, v39, v39);
          UIIntegralTransform();
        }
        t1 = v46;
        t2 = v48;
        CGAffineTransformConcat(&v49, &t1, &t2);
      }
      v48 = v49;
      objc_msgSend(v8, "setTransform:", &v48);
      v48 = v49;
      objc_msgSend(v11, "setTransform:", &v48);

    }
  }
}

- (void)_moveViewForLevel:(uint64_t)a3 toLevel:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a1)
  {
    BSDispatchQueueAssertMain();
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "setLevel:", a3);
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v9);

      v10 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v12, v11);

    }
  }
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  char v19;
  PRRenderingDelegate *delegate;
  PRRenderingDelegate *v21;
  PRRenderingEvent *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
        v13 = objc_opt_class();
        v14 = v12;
        if (v13)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v15 = v14;
          else
            v15 = 0;
        }
        else
        {
          v15 = 0;
        }
        v16 = v15;

        if (v16)
        {
          objc_msgSend(v16, "eventType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqual:", CFSTR("PRRenderingEventTypeTap"));

          v19 = objc_opt_respondsToSelector();
          if (v18 && (v19 & 1) != 0)
          {
            delegate = self->_delegate;
            objc_msgSend(v16, "location");
            -[PRRenderingDelegate renderer:didReceiveTapAtPoint:](delegate, "renderer:didReceiveTapAtPoint:", self);
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v21 = self->_delegate;
            v22 = -[PRRenderingEvent initWithAction:]([PRRenderingEvent alloc], "initWithAction:", v16);
            -[PRRenderingDelegate renderer:didReceiveEvent:](v21, "renderer:didReceiveEvent:", self, v22);

          }
        }
        else
        {
          objc_msgSend(v24, "addObject:", v14);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  return v24;
}

- (void)updatedValuesForView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  PRPosterEnvironmentImpl *v11;
  PRPosterEnvironmentImpl *environment;
  int v13;
  PRRenderer *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  -[PRRenderingBackdropView backlightProgress](self->_backdropView, "backlightProgress");
  v5 = v4;
  v6 = 1.0;
  v7 = 1.0;
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    v7 = 0.0;
    if (!BSFloatLessThanOrEqualToFloat())
      v7 = v5;
  }
  -[PRRenderingBackdropView linearBacklightProgress](self->_backdropView, "linearBacklightProgress");
  v9 = v8;
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    v6 = 0.0;
    if (!BSFloatLessThanOrEqualToFloat())
      v6 = v9;
  }
  PRLogRendering();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134218496;
    v14 = self;
    v15 = 2048;
    v16 = v7;
    v17 = 2048;
    v18 = v6;
    _os_log_debug_impl(&dword_18B634000, v10, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Backlight progress is %.6f; linear is %.6f",
      (uint8_t *)&v13,
      0x20u);
  }

  -[PRPosterEnvironmentImpl backlightProgress](self->_environment, "backlightProgress");
  if (!BSFloatEqualToFloat()
    || (-[PRPosterEnvironmentImpl linearBacklightProgress](self->_environment, "linearBacklightProgress"),
        (BSFloatEqualToFloat() & 1) == 0))
  {
    v11 = (PRPosterEnvironmentImpl *)-[PRPosterEnvironmentImpl copy](self->_environment, "copy");
    environment = self->_environment;
    self->_environment = v11;

    -[PRPosterEnvironmentImpl setBacklightProgress:](self->_environment, "setBacklightProgress:", v7);
    -[PRPosterEnvironmentImpl setLinearBacklightProgress:](self->_environment, "setLinearBacklightProgress:", v6);
    -[PRRenderer reportUpdatedEnvironment:withTransition:]((id *)&self->super.isa, self->_environment, 0);
  }
}

- (void)invalidateView:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *viewsByLevel;
  void *v7;
  int v8;
  PRRenderer *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRLogRendering();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = self;
    v10 = 2048;
    v11 = objc_msgSend(v4, "level");
    _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Invalidated view at level %ld", (uint8_t *)&v8, 0x16u);
  }

  viewsByLevel = self->_viewsByLevel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "level"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](viewsByLevel, "removeObjectForKey:", v7);

  objc_msgSend(v4, "removeFromSuperview");
}

- (uint64_t)_derivedInterfaceOrientation
{
  int IsActive;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a1)
    return 0;
  IsActive = PUIDynamicRotationIsActive();
  objc_msgSend(*(id *)(a1 + 216), "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (IsActive)
    v6 = objc_msgSend(v4, "pui_deviceOrientation");
  else
    v6 = objc_msgSend(v4, "interfaceOrientation");
  v7 = v6;

  return v7;
}

- (id)_makeGraphicComplicationPreviewScene
{
  id v1;
  PRComplicationsSnapshotSceneSpecification *v2;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(PRComplicationsSnapshotSceneSpecification);
    -[PRRenderer _makeComplicationPreviewSceneWithSpecification:]((uint64_t)v1, v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_makeSidebarComplicationPreviewScene
{
  id v1;
  PRSidebarComplicationsSnapshotSceneSpecification *v2;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(PRSidebarComplicationsSnapshotSceneSpecification);
    -[PRRenderer _makeComplicationPreviewSceneWithSpecification:]((uint64_t)v1, v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_makeInlineComplicationPreviewScene
{
  id v1;
  PRInlineComplicationSnapshotSceneSpecification *v2;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc_init(PRInlineComplicationSnapshotSceneSpecification);
    -[PRRenderer _makeComplicationPreviewSceneWithSpecification:]((uint64_t)v1, v2);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __40__PRRenderer__updateRenderingExtensions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PRLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "descriptionWithMultilinePrefix:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated rendering assertion: %@", buf, 0xCu);

  }
  BSDispatchMain();

}

uint64_t __40__PRRenderer__updateRenderingExtensions__block_invoke_124(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  return -[PRRenderer _updateRenderingExtensions](*(_QWORD *)(a1 + 32));
}

uint64_t __40__PRRenderer__updateRenderingExtensions__block_invoke_125(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setInExtendedRenderSession:", *(unsigned __int8 *)(a1 + 32));
}

void __40__PRRenderer__updateRenderingExtensions__block_invoke_129(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 73) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_BYTE *)(v2 + 24) = 1;
  PRLogRendering();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v4;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: CABackingStoreCollect completed.", (uint8_t *)&v5, 0xCu);
  }

}

void __40__PRRenderer__updateRenderingExtensions__block_invoke_130(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 73) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_BYTE *)(v2 + 24) = 1;
  PRLogRendering();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v4;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: Renderer delegates completed dropping excess resources.", (uint8_t *)&v5, 0xCu);
  }

}

void __40__PRRenderer__updateRenderingExtensions__block_invoke_131(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 73) = 0;
  PRLogRendering();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 134217984;
    v5 = v3;
    _os_log_impl(&dword_18B634000, v2, OS_LOG_TYPE_DEFAULT, "<PRRenderer %p> Memory reclamation: CABackingStoreCollect completed.", (uint8_t *)&v4, 0xCu);
  }

}

- (double)_collectContentSizeForView:(uint64_t)a1
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isHidden") & 1) != 0 || (objc_msgSend(v4, "alpha"), v5 == 0.0))
    {
      v6 = *MEMORY[0x1E0C9D820];
    }
    else
    {
      objc_msgSend(v4, "bounds");
      v6 = v8;
      v10 = v9;
      if ((objc_msgSend(v4, "clipsToBounds") & 1) == 0)
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v4, "subviews", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = -[PRRenderer _collectContentSizeForView:](a1, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
              if (v6 < v16)
                v6 = v16;
              if (v10 < v17)
                v10 = v17;
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v13);
        }

      }
    }
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

uint64_t __32__PRRenderer__updateContentSize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setContentSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (id)_makeComplicationPreviewSceneWithSpecification:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  if (a1)
  {
    PRComplicationsSceneWorkspace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke;
    v19[3] = &unk_1E2184858;
    v20 = v3;
    objc_msgSend(v4, "createScene:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 16), "targetConfiguredProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleStyleConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(id *)(a1 + 8);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(*(id *)(a1 + 16), "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "_backlightLuminance") == 1)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 16), "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "_backlightLuminance") == 0;

    }
    objc_msgSend(v8, "vibrancyConfigurationWithExtensionBundle:luminanceReduced:", v10, v12);
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_2;
    v16[3] = &unk_1E2186120;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = a1;
    v14 = v17;
    objc_msgSend(v6, "configureParameters:", v16);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a2;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PRRenderer-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v5, "setSpecification:", *(_QWORD *)(a1 + 32));
  v9 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(MEMORY[0x1E0D87D80], "identityForAngelJobLabel:", CFSTR("com.apple.PosterBoard"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityForProcessIdentity:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientIdentity:", v10);

}

void __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_3;
  v7[3] = &unk_1E21845D0;
  v8 = *(id *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "updateClientSettingsWithBlock:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_4;
  v6[3] = &unk_1E2184F48;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "updateSettingsWithBlock:", v6);

}

uint64_t __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setVibrancyConfiguration:", *(_QWORD *)(a1 + 32));
}

void __61__PRRenderer__makeComplicationPreviewSceneWithSpecification___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  v4 = a2;
  objc_msgSend(v3, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pui_posterContents");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pui_setPosterContents:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pui_previewIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pui_setPreviewIdentifier:", v9);

}

- (uint64_t)_isAmbientSupportedForRendererScene
{
  void *v1;
  void *v2;
  char v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 216), "_FBSScene");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "settings");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

void __68__PRRenderer__registerForAmbientPresentationTraitChangesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;

  v3 = a2;
  PRLogRendering();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __68__PRRenderer__registerForAmbientPresentationTraitChangesIfNecessary__block_invoke_cold_1(a1, v3, v4);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[PRRenderer _updateEnvironmentForUpdatedTraitCollection](WeakRetained);

}

- (void)_updateEnvironmentForUpdatedTraitCollection
{
  id v2;
  PRPosterEnvironmentImpl *v3;
  void *v4;
  void *v5;
  void *v6;
  PRPosterEnvironmentImpl *v7;
  id v8;
  PRPosterEnvironmentImpl *v9;
  id v10;

  if (a1)
  {
    objc_msgSend(a1[27], "_FBSScene");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v2 = a1[2];
    v3 = [PRPosterEnvironmentImpl alloc];
    objc_msgSend(v10, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[27], "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRRenderer extensionBundleURL]((uint64_t)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PRPosterEnvironmentImpl initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:](v3, "initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:", v4, v5, 0, v6);

    objc_msgSend(v2, "backlightProgress");
    -[PRPosterEnvironmentImpl setBacklightProgress:](v7, "setBacklightProgress:");
    objc_msgSend(v2, "linearBacklightProgress");
    -[PRPosterEnvironmentImpl setLinearBacklightProgress:](v7, "setLinearBacklightProgress:");
    objc_msgSend(v2, "unlockProgress");
    -[PRPosterEnvironmentImpl setUnlockProgress:](v7, "setUnlockProgress:");
    v8 = a1[2];
    a1[2] = v7;
    v9 = v7;

    -[PRRenderer reportUpdatedEnvironment:withTransition:](a1, a1[2], 0);
  }
}

- (PRPosterRenderingEnvironment)environment
{
  return (PRPosterRenderingEnvironment *)self->_environment;
}

- (PRPosterRenderingPreferences)preferences
{
  return (PRPosterRenderingPreferences *)self->_preferences;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (CSProminentDisplayViewController)timePreviewProminentDisplayViewController
{
  return self->_timePreviewProminentDisplayViewController;
}

- (void)setTimePreviewProminentDisplayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_timePreviewProminentDisplayViewController, a3);
}

- (CSProminentDisplayViewController)complicationsPreviewProminentDisplayViewController
{
  return self->_complicationsPreviewProminentDisplayViewController;
}

- (void)setComplicationsPreviewProminentDisplayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_complicationsPreviewProminentDisplayViewController, a3);
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_complicationsPreviewProminentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_timePreviewProminentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_ambientPresentationTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_unlockAnimator, 0);
  objc_storeStrong((id *)&self->_inlineComplicationScene, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationScene, 0);
  objc_storeStrong((id *)&self->_graphicComplicationScene, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_unlockToken, 0);
  objc_storeStrong((id *)&self->_wakeToken, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_sessionExtensions, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_viewsByLevel, 0);
  objc_storeStrong((id *)&self->_sceneInvalidationActions, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "More than one renderer instantiated at a time?", v1, 2u);
}

- (void)_updateAnimatedUnlockProgress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_2(&dword_18B634000, v0, v1, "<PRRenderer %p> Unlock progress is %.6f (animated)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

- (void)scene:willConnectToSession:options:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)scene:willConnectToSession:options:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_67_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(*(SEL *)(v0 + 64));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __37__PRRenderer__issueSceneInvalidated___block_invoke_67_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_18B634000, a2, a3, "<PRRenderer %p> Invalidation completion block ALREADY CALLED", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_17();
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_18B634000, a2, OS_LOG_TYPE_FAULT, "<PRRenderer %p> Memory after invalidation exceeds max memory usage for poster!", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_17();
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_18B634000, a2, a3, "<PRRenderer %p> Memory after invalidation exceeds max memory usage for poster!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_17();
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_3();
  _os_log_fault_impl(&dword_18B634000, v0, OS_LOG_TYPE_FAULT, "<PRRenderer %p> Memory increased after invalidation; invalidating this poster caused a memory gain of %{iec-bytes}llu bytes",
    v1,
    0x16u);
  OUTLINED_FUNCTION_17();
}

- (void)_validateCleanupResultedInThingsCleanedUpWithPrememoryUsage:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_3();
  _os_log_error_impl(&dword_18B634000, v0, OS_LOG_TYPE_ERROR, "<PRRenderer %p> Memory increased after invalidation; invalidating this poster caused a memory gain of %{iec-bytes}llu bytes",
    v1,
    0x16u);
  OUTLINED_FUNCTION_17();
}

- (void)_performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_9_2(&dword_18B634000, v0, v1, "<PRRenderer %p> Unlock progress is %.6f (explicit)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

void __68__PRRenderer__registerForAmbientPresentationTraitChangesIfNecessary__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(a2, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAmbientPresented");
  objc_msgSend(a2, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ambientDisplayStyle");
  AMUIAmbientDisplayStyleString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 134218498;
  v11 = WeakRetained;
  v12 = 1024;
  v13 = v7;
  v14 = 2114;
  v15 = v9;
  _os_log_debug_impl(&dword_18B634000, a3, OS_LOG_TYPE_DEBUG, "<PRRenderer %p> Updating renderer environment for ambient presentation update [ isAmbientPresented:%{BOOL}d ; ambien"
    "tDisplayStyle:%{public}@ ]",
    (uint8_t *)&v10,
    0x1Cu);

}

@end
