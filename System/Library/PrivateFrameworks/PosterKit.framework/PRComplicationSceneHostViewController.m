@implementation PRComplicationSceneHostViewController

- (PRComplicationSceneHostViewController)initWithScene:(id)a3
{
  id v5;
  PRComplicationSceneHostViewController *v6;
  PRComplicationSceneHostViewController *v7;
  id *p_scene;
  void *v9;
  uint64_t v10;
  UIScenePresenter *scenePresenter;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PRComplicationSceneHostViewController;
  v6 = -[PRComplicationSceneHostViewController init](&v34, sel_init);
  v7 = v6;
  if (v6)
  {
    p_scene = (id *)&v6->_scene;
    objc_storeStrong((id *)&v6->_scene, a3);
    objc_msgSend(*p_scene, "configureParameters:", &__block_literal_global_18);
    objc_msgSend(*p_scene, "uiPresentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createPresenterWithIdentifier:", CFSTR("complications"));
    v10 = objc_claimAutoreleasedReturnValue();
    v33 = v5;
    scenePresenter = v7->_scenePresenter;
    v7->_scenePresenter = (UIScenePresenter *)v10;

    -[UIScenePresenter modifyPresentationContext:](v7->_scenePresenter, "modifyPresentationContext:", &__block_literal_global_5);
    -[UIScenePresenter activate](v7->_scenePresenter, "activate");
    -[UIScenePresenter presentationView](v7->_scenePresenter, "presentationView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", 1);
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setName:", CFSTR("Scene View"));

    objc_msgSend(*p_scene, "activateWithTransitionContext:", 0);
    objc_msgSend(*p_scene, "layerManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", v7);

    -[PRComplicationSceneHostViewController view](v7, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v12);

    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRComplicationSceneHostViewController view](v7, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v12, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    objc_msgSend(v12, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v27;
    objc_msgSend(v12, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v19;
    objc_msgSend(v12, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v24);
    v5 = v33;
  }

  return v7;
}

uint64_t __55__PRComplicationSceneHostViewController_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSettingsWithBlock:", &__block_literal_global_2);
}

void __55__PRComplicationSceneHostViewController_initWithScene___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D228F8];
  v4 = a2;
  objc_msgSend(v2, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v3);

  objc_msgSend(v4, "setForeground:", 1);
}

void __55__PRComplicationSceneHostViewController_initWithScene___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setBackgroundColorWhileHosting:", 0);
  objc_msgSend(v2, "setBackgroundColorWhileNotHosting:", 0);
  objc_msgSend(v2, "setShouldPassthroughHitTestEventsIfTransparent:", 1);

}

- (void)invalidate
{
  UIScenePresenter *scenePresenter;
  FBScene *scene;

  -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate");
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  -[FBScene setDelegate:](self->_scene, "setDelegate:", 0);
  -[FBScene invalidate](self->_scene, "invalidate");
  scene = self->_scene;
  self->_scene = 0;

}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D7FD38]);
  -[PRComplicationSceneHostViewController setView:](self, "setView:", v3);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FBScene *scene;
  uint64_t v11;
  _QWORD v12[9];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PRComplicationSceneHostViewController;
  -[PRComplicationSceneHostViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[PRComplicationSceneHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  objc_msgSend(v3, "bounds");
  if ((unint64_t)(v6 - 3) >= 2)
    v9 = v7;
  else
    v9 = v8;
  scene = self->_scene;
  if ((unint64_t)(v6 - 3) >= 2)
    v11 = v8;
  else
    v11 = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PRComplicationSceneHostViewController_viewDidLayoutSubviews__block_invoke;
  v12[3] = &__block_descriptor_72_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
  v12[4] = 0;
  v12[5] = 0;
  v12[6] = v9;
  v12[7] = v11;
  v12[8] = v6;
  -[FBScene performUpdate:](scene, "performUpdate:", v12);

}

void __62__PRComplicationSceneHostViewController_viewDidLayoutSubviews__block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v7 = a2;
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);
  objc_msgSend(v7, "setInterfaceOrientation:", *((_QWORD *)a1 + 8));

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRComplicationSceneHostViewController;
  -[PRComplicationSceneHostViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
    -[PRComplicationSceneHostViewController _updateTouchDeliveryPolicies](self, "_updateTouchDeliveryPolicies");
  else
    -[PRComplicationSceneHostViewController _clearTouchDeliveryPolicies](self, "_clearTouchDeliveryPolicies");
}

- (void)_updateTouchDeliveryPolicies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSMutableDictionary *touchDeliveryPolicyAssertions;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  __int128 v38;
  unsigned int v39;
  id obj;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  id v51;
  id v52;
  id location;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  PRComplicationSceneHostViewController *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  int v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[PRComplicationSceneHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FBScene layerManager](self->_scene, "layerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[NSMutableDictionary allKeys](self->_touchDeliveryPolicyAssertions, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v7, "initWithArray:", v8);

    -[PRComplicationSceneHostViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v10, "_contextId");

    PRLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v60 = self;
      v61 = 2114;
      v62 = v6;
      _os_log_impl(&dword_18B634000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Updating touch delivery policies for layers: %{public}@", buf, 0x16u);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v12)
    {
      v41 = *(_QWORD *)v55;
      *(_QWORD *)&v13 = 134218498;
      v38 = v13;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v55 != v41)
            objc_enumerationMutation(obj);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "contextID", v38);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "removeObject:", v16);

          touchDeliveryPolicyAssertions = self->_touchDeliveryPolicyAssertions;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](touchDeliveryPolicyAssertions, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(touchDeliveryPolicyAssertions) = v19 == 0;

          if ((_DWORD)touchDeliveryPolicyAssertions)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0D00E10]);
            objc_msgSend(MEMORY[0x1E0D00E08], "policyRequiringSharingOfTouchesDeliveredToChildContextId:withHostContextId:", v15, v39);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "endpoint");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setAssertionEndpoint:", v22);

            objc_initWeak(&location, self);
            v47 = MEMORY[0x1E0C809B0];
            v48 = 3221225472;
            v49 = __69__PRComplicationSceneHostViewController__updateTouchDeliveryPolicies__block_invoke;
            v50 = &unk_1E2184CC8;
            objc_copyWeak(&v52, &location);
            v23 = v21;
            v51 = v23;
            BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              PRLogCommon();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v38;
                v60 = self;
                v61 = 2114;
                v62 = v20;
                v63 = 1024;
                v64 = v15;
                _os_log_impl(&dword_18B634000, v25, OS_LOG_TYPE_DEFAULT, "[%p] Saving touch policy assertion %{public}@ for context id %u", buf, 0x1Cu);
              }

              v26 = self->_touchDeliveryPolicyAssertions;
              if (!v26)
              {
                v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
                v28 = self->_touchDeliveryPolicyAssertions;
                self->_touchDeliveryPolicyAssertions = v27;

                v26 = self->_touchDeliveryPolicyAssertions;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v20, v29);

              objc_msgSend(v24, "ipc_addPolicy:", v23);
            }

            objc_destroyWeak(&v52);
            objc_destroyWeak(&location);

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v12);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = v42;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v44 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          -[NSMutableDictionary objectForKey:](self->_touchDeliveryPolicyAssertions, "objectForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "invalidate");
          -[NSMutableDictionary removeObjectForKey:](self->_touchDeliveryPolicyAssertions, "removeObjectForKey:", v34);
          PRLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = objc_msgSend(v34, "unsignedIntValue");
            *(_DWORD *)buf = 134218498;
            v60 = self;
            v61 = 2114;
            v62 = v35;
            v63 = 1024;
            v64 = v37;
            _os_log_impl(&dword_18B634000, v36, OS_LOG_TYPE_DEFAULT, "[%p] Invalidating assertion %{public}@ for context id %u", buf, 0x1Cu);
          }

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      }
      while (v31);
    }

  }
}

void __69__PRComplicationSceneHostViewController__updateTouchDeliveryPolicies__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PRLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 134218498;
      v8 = WeakRetained;
      v9 = 2114;
      v10 = v6;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Sending touch delivery policy %{public}@ failed with error: %{public}@", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_clearTouchDeliveryPolicies
{
  NSObject *v3;
  int v4;
  PRComplicationSceneHostViewController *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PRLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "[%p] Clearing any touch delivery policies", (uint8_t *)&v4, 0xCu);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_touchDeliveryPolicyAssertions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_24);
  -[NSMutableDictionary removeAllObjects](self->_touchDeliveryPolicyAssertions, "removeAllObjects");
}

uint64_t __68__PRComplicationSceneHostViewController__clearTouchDeliveryPolicies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchDeliveryPolicyAssertions, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
