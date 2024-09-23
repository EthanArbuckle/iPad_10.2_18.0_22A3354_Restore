@implementation SBWidgetExtensionDebuggingController

- (SBWidgetExtensionDebuggingController)initWithWorkspace:(id)a3 toolService:(id)a4 homeScreenDataSource:(id)a5 controlCenterDataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBWidgetExtensionDebuggingController *v15;
  SBWidgetExtensionDebuggingController *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CHSWidgetExtensionProvider *extensionProvider;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBWidgetExtensionDebuggingController;
  v15 = -[SBWidgetExtensionDebuggingController init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workspace, a3);
    objc_storeStrong((id *)&v16->_homeScreenDataSource, a5);
    objc_storeStrong((id *)&v16->_controlCenterDataSource, a6);
    objc_storeStrong((id *)&v16->_toolService, a4);
    v17 = objc_alloc(MEMORY[0x1E0D101C0]);
    objc_msgSend(MEMORY[0x1E0D10180], "visible");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0FFE8], "visible");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithWidgetsPredicate:controlsPredicate:", v18, v19);

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D101B0]), "initWithOptions:", v20);
    extensionProvider = v16->_extensionProvider;
    v16->_extensionProvider = (CHSWidgetExtensionProvider *)v21;

    -[SBMainWorkspace registerHandler:forExtensionPoint:](v16->_workspace, "registerHandler:forExtensionPoint:", v16, CFSTR("com.apple.widgetkit-extension"));
  }

  return v16;
}

- (void)launchExtensionWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SBWidgetExtensionDebuggingController *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SBLogWidgets();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SBAvocadoDebuggingController launching avocado extension: %@ options: %@", buf, 0x16u);
  }

  objc_msgSend(v9, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D0FF00], objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D0FEF8], objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CHSWidgetFamilyFromString();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke;
  v18[3] = &unk_1E8EBA948;
  v19 = v12;
  v20 = v8;
  v21 = self;
  v22 = v10;
  v15 = v10;
  v16 = v8;
  v17 = v12;
  -[SBWidgetExtensionDebuggingController _descriptorForWidgetFromExtension:forRequestedKind:requestedWidgetFamily:completion:](self, "_descriptorForWidgetFromExtension:forRequestedKind:requestedWidgetFamily:completion:", v16, v17, v14, v18);

}

void __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v5, "widgetDescriptorToUse");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controlDescriptorToUse");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7)
    {
      SBLogWidgets();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "DEBUG: descriptor chosen: %@", buf, 0xCu);
      }

      v12 = *(void **)(*(_QWORD *)(a1 + 48) + 32);
      v13 = objc_msgSend(v5, "widgetFamily");
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_52;
      v20[3] = &unk_1E8E9F598;
      v21 = *(id *)(a1 + 56);
      objc_msgSend(v12, "launchWidget:widgetFamily:completion:", v7, v13, v20);
      v14 = v21;
    }
    else
    {
      if (!v8)
        goto LABEL_14;
      SBLogWidgets();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = (uint64_t)v9;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "DEBUG: descriptor chosen: %@", buf, 0xCu);
      }

      v16 = *(void **)(a1 + 56);
      v17 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_54;
      v18[3] = &unk_1E8E9F598;
      v19 = v16;
      objc_msgSend(v17, "launchControl:completion:", v9, v18);
      v14 = v19;
    }

    goto LABEL_14;
  }
  SBLogWidgets();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_cold_1(a1, (uint64_t)v6, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_14:

}

uint64_t __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_52(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

uint64_t __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_54(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)_descriptorForWidgetFromExtension:(id)a3 forRequestedKind:(id)a4 requestedWidgetFamily:(int64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  CHSToolSupportService *toolService;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWidgetExtensionDebuggingController.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleID"));

  }
  SBLogWidgets();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v11;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Requesting chronod fetch descriptors for: %{public}@", buf, 0xCu);
  }

  toolService = self->_toolService;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke;
  v20[3] = &unk_1E8EBA998;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = a5;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  -[CHSToolSupportService reloadDescriptorsForExtensionBundleIdentifier:completion:](toolService, "reloadDescriptorsForExtensionBundleIdentifier:completion:", v18, v20);

}

void __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  v5 = a1[5];
  v7 = a1[7];
  v6 = a1[6];
  v4 = v3;
  BSDispatchMain();

}

void __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    SBLogWidgets();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Couldn't find descriptors -- looking locally in process as a last resort", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "widgetExtensionContainerForExtensionBundleIdentifier:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localExtensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_63;
    v17 = &unk_1E8EAD220;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v5, "bs_firstObjectPassingTest:", &v14);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "orderedDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedControlDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWidgets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v6, "count");
    v10 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134218240;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu widget descriptors, %lu control descriptors", buf, 0x16u);
  }

  if (v2 && (objc_msgSend(v6, "count") || objc_msgSend(v7, "count")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_reallyFindDescriptorForWidgetFromExtension:forRequestedKind:requestedWidgetFamily:completion:", v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get descriptors for extensionBundleID (%@)"), *(_QWORD *)(a1 + 48), v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWidgets();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();

    SBWidgetExtensionDebugError(1, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

uint64_t __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_63(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_reallyFindDescriptorForWidgetFromExtension:(id)a3 forRequestedKind:(id)a4 requestedWidgetFamily:(int64_t)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  _SBWidgetExtensionLaunchRequestResult *v47;
  _SBWidgetExtensionLaunchRequestResult *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  int8x8_t v54;
  _QWORD *v55;
  uint8x8_t v56;
  int v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  void (**v72)(id, _QWORD, void *);
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  _QWORD v78[2];
  void (*v79)(_QWORD *);
  void *v80;
  uint64_t *v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v76 = a4;
  v72 = (void (**)(id, _QWORD, void *))a6;
  v75 = v10;
  objc_msgSend(v10, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extensionBundleIdentifier");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "orderedDescriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "orderedControlDescriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWidgetExtensionDebuggingController.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleIdentifier"));

  }
  if (!objc_msgSend(v12, "count") && !objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWidgetExtensionDebuggingController.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[widgetDescriptors count] > 0 || [controlDescriptors count] > 0"));

  }
  BSDispatchQueueAssertMain();
  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_309);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_75_1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  if (v76 && objc_msgSend(v76, "length"))
  {
    v14 = MEMORY[0x1E0C809B0];
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_3;
    v96[3] = &unk_1E8EBAA40;
    v15 = v76;
    v97 = v15;
    objc_msgSend(v77, "bs_firstObjectPassingTest:", v96);
    v16 = objc_claimAutoreleasedReturnValue();
    v94[0] = v14;
    v94[1] = 3221225472;
    v94[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_4;
    v94[3] = &unk_1E8EAD248;
    v17 = v15;
    v95 = v17;
    objc_msgSend(v73, "bs_firstObjectPassingTest:", v94);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!(v16 | v18))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v17;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v26 = v77;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v91 != v28)
              objc_enumerationMutation(v26);
            v30 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "kind");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("'%@'"), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v32);

          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v90, v104, 16);
        }
        while (v27);
      }

      v88 = 0u;
      v89 = 0u;
      v87 = 0u;
      v86 = 0u;
      v33 = v73;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
      if (v34)
      {
        v35 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v87 != v35)
              objc_enumerationMutation(v33);
            v37 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * j), "kind");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("'%@'"), v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v39);

          }
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
        }
        while (v34);
      }

      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid requested widget kind: '%@'. Please specify one of: %@ in your scheme's Environment Variables using the key '__WidgetKind'."), v71, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogWidgets();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();

      SBWidgetExtensionDebugError(2, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v72[2](v72, 0, v43);

      v16 = (uint64_t)v97;
      goto LABEL_53;
    }

    v19 = v97;
LABEL_45:

    goto LABEL_46;
  }
  if (objc_msgSend(v77, "count") == 1 && !objc_msgSend(v73, "count"))
  {
    objc_msgSend(v77, "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
  }
  else
  {
    if (objc_msgSend(v77, "count") || objc_msgSend(v73, "count") != 1)
    {
      -[SBWidgetExtensionDebugHomeScreenDataSource hasExistingWidgetFromExtension:](self->_homeScreenDataSource, "hasExistingWidgetFromExtension:", v74);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (uint64_t)v20;
      if (v20)
      {
        objc_msgSend(v20, "kind");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWidgetExtensionDebuggingController.m"), 253, CFSTR("Must provide a kind"));

        }
        a5 = objc_msgSend((id)v16, "family");
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_87;
        v84[3] = &unk_1E8EBAA40;
        v85 = (id)v16;
        objc_msgSend(v77, "bs_firstObjectPassingTest:", v84);
        v23 = objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v24 = v85;
      }
      else
      {
        -[SBWidgetExtensionDebugControlCenterDataSource hasExistingControlFromExtension:](self->_controlCenterDataSource, "hasExistingControlFromExtension:", v74);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v44;
        if (v44)
        {
          objc_msgSend(v44, "kind");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45 == 0;

          if (v46)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWidgetExtensionDebuggingController.m"), 263, CFSTR("Must provide a kind"));

          }
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2_88;
          v82[3] = &unk_1E8EAD248;
          v24 = v24;
          v83 = v24;
          objc_msgSend(v73, "bs_firstObjectPassingTest:", v82);
          v18 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = 0;
        }
        v23 = 0;
      }

      if (!(v23 | v18))
      {
        objc_msgSend(v77, "bs_map:", &__block_literal_global_91_1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR(", "));
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please specify the widget kind in the scheme's Environment Variables using the key '_XCWidgetKind' to be one of: %@"), v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWidgets();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();

        SBWidgetExtensionDebugError(2, v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v72[2](v72, 0, v53);

        goto LABEL_53;
      }
      v19 = (void *)v16;
      v16 = v23;
      goto LABEL_45;
    }
    objc_msgSend(v73, "firstObject");
    v18 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
  }
LABEL_46:
  if (!(v16 | v18))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWidgetExtensionDebuggingController.m"), 283, CFSTR("Should have a widget or control descriptor to use by now"));

    goto LABEL_49;
  }
  if (!v16 || v99[3])
    goto LABEL_49;
  if (!a5)
  {
    v54 = (int8x8_t)objc_msgSend((id)v16, "supportedFamilies");
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v79 = (void (*)(_QWORD *))__134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_98;
    v80 = &unk_1E8EA8288;
    v81 = &v98;
    v55 = v78;
    if (v54)
    {
      v102 = 0;
      v56 = (uint8x8_t)vcnt_s8(v54);
      v56.i16[0] = vaddlv_u8(v56);
      v57 = v56.i32[0];
      if (v56.i32[0])
      {
        v58 = 0;
        do
        {
          if (((1 << v58) & *(_QWORD *)&v54) != 0)
          {
            v79(v55);
            if (v102)
              break;
            --v57;
          }
          if (v58 > 0x3E)
            break;
          ++v58;
        }
        while (v57 > 0);
      }
    }

    goto LABEL_49;
  }
  objc_msgSend((id)v16, "supportedFamilies");
  if (CHSWidgetFamilyMaskContainsFamily())
  {
    v99[3] = a5;
LABEL_49:
    v47 = [_SBWidgetExtensionLaunchRequestResult alloc];
    v48 = -[_SBWidgetExtensionLaunchRequestResult initWithWidgetDescriptor:widgetFamily:controlDescriptor:](v47, "initWithWidgetDescriptor:widgetFamily:controlDescriptor:", v16, v99[3], v18);
    ((void (**)(id, _SBWidgetExtensionLaunchRequestResult *, void *))v72)[2](v72, v48, 0);

    goto LABEL_53;
  }
  v59 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17E2DA8](a5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "kind");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "stringWithFormat:", CFSTR("Request widget family (%@) is not supported by this widget kind (%@)"), v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogWidgets();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();

  SBWidgetExtensionDebugError(3, v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2](v72, 0, v64);

LABEL_53:
  _Block_object_dispose(&v98, 8);

}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_87(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2_88(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

id __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_3_89(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("'%@'"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_98(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  *a4 = 1;
  return result;
}

- (CHSWidgetExtensionProvider)_extensionProvider
{
  return self->_extensionProvider;
}

- (void)_setExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCenterDataSource, 0);
  objc_storeStrong((id *)&self->_homeScreenDataSource, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_toolService, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

void __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Failed to validate widget kind (%@) for extension (%@): %@", (uint8_t *)&v5, 0x20u);
}

@end
