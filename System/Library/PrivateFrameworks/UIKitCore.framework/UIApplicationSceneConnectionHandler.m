@implementation UIApplicationSceneConnectionHandler

void _UIApplicationSceneConnectionHandler_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char isKindOfClass;
  id v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  objc_class *v22;
  const char *Name;
  int v24;
  int v25;
  objc_class *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id *v45;
  void *v46;
  unint64_t v47;
  NSObject *v48;
  NSObject *v49;
  objc_class *v50;
  const char *v51;
  void *v52;
  void *v53;
  id v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD block[5];
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  _QWORD *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  id v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = v4;
    if (objc_msgSend((id)UIApp, "isFrontBoard"))
      v9 = objc_msgSend((id)UIApp, "disablesFrontBoardImplicitWindowScenes");
    else
      v9 = 0;
    if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend((id)UIApp, "_defaultSceneIfExists");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_FBSScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isEqual:", v12);

    }
    +[UIScene _scenesIncludingInternal:](_UIPlaceholderWindowScene, "_scenesIncludingInternal:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 && objc_msgSend(v13, "count") && (objc_msgSend((id)UIApp, "isFrontBoard") ^ 1 | v9) == 1)
    {
      v54 = v5;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v53 = v14;
      obj = v14;
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
      v15 = 0;
      if (v57)
      {
        v56 = *(_QWORD *)v69;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v69 != v56)
              objc_enumerationMutation(obj);
            v60 = v16;
            v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v16);
            objc_msgSend(v17, "screen");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = qword_1ECD7CE68;
            if (!qword_1ECD7CE68)
            {
              v19 = __UILogCategoryGetNode("ApplicationLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v19, (unint64_t *)&qword_1ECD7CE68);
            }
            v20 = *(NSObject **)(v19 + 8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = v20;
              v22 = (objc_class *)objc_opt_class();
              Name = class_getName(v22);
              v24 = objc_msgSend(v18, "_isMainScreen");
              v25 = objc_msgSend(v18, "_isMainLikeScreen");
              v26 = (objc_class *)objc_opt_class();
              v27 = class_getName(v26);
              *(_DWORD *)buf = 136447746;
              v74 = Name;
              v75 = 2050;
              v76 = v17;
              v77 = 2050;
              v78 = v18;
              v79 = 1024;
              v80 = v24;
              v81 = 1024;
              v82 = v25;
              v83 = 2082;
              v84 = v27;
              v85 = 2050;
              v86 = v8;
              _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "Migrating windows from placeholder scene: %{public}s: %{public}p; screen: %{public}p, isMain: %d, isMain"
                "Like: %d; to connecting default scene: %{public}s: %{public}p;",
                buf,
                0x40u);

            }
            -[UIWindowScene _keyWindow]((id *)v17);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            v59 = v18;
            if (!v15 && v28)
              v15 = v28;
            v58 = v29;
            v61 = v15;
            v66 = 0u;
            v67 = 0u;
            v64 = 0u;
            v65 = 0u;
            objc_msgSend(v17, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v65;
              do
              {
                v34 = 0;
                do
                {
                  if (*(_QWORD *)v65 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(id **)(*((_QWORD *)&v64 + 1) + 8 * v34);
                  -[UIWindow _fbsScene](v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "_uiWindowSceneFromFBSScene:", v36);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = _UIApplicationSceneConnectionHandler_block_invoke_2;
                  block[3] = &unk_1E16B1B50;
                  block[4] = v35;
                  v63 = v37;
                  v38 = qword_1ECD7CE70;
                  v39 = v37;
                  v40 = v39;
                  if (v38 == -1)
                  {
                    v41 = v39;
                  }
                  else
                  {
                    dispatch_once(&qword_1ECD7CE70, block);
                    v41 = v63;
                  }

                  if (v40)
                    v42 = v40;
                  else
                    v42 = v8;
                  objc_msgSend(v35, "setWindowScene:", v42);

                  ++v34;
                }
                while (v32 != v34);
                v43 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
                v32 = v43;
              }
              while (v43);
            }

            v15 = v61;
            v16 = v60 + 1;
          }
          while (v60 + 1 != v57);
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
        }
        while (v57);
      }

      objc_msgSend(v8, "statusBarManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "updateStatusBarAppearance");

      v5 = v54;
      v14 = v53;
      if (v15)
      {
        objc_msgSend(v15, "windowScene");
        v45 = (id *)objc_claimAutoreleasedReturnValue();
        -[UIWindowScene _keyWindow](v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v46)
        {
          v47 = qword_1ECD7CE78;
          if (!qword_1ECD7CE78)
          {
            v47 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v47, (unint64_t *)&qword_1ECD7CE78);
          }
          v48 = *(NSObject **)(v47 + 8);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = v48;
            v50 = (objc_class *)objc_opt_class();
            v51 = class_getName(v50);
            *(_DWORD *)buf = 136446466;
            v74 = v51;
            v75 = 2050;
            v76 = v15;
            _os_log_impl(&dword_185066000, v49, OS_LOG_TYPE_DEFAULT, "Migrating key window from placeholder scene to connecting default scene: %{public}s: %{public}p", buf, 0x16u);

          }
          -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v15, 1, 1);
        }

      }
    }
    if (_MergedGlobals_974)
    {
      objc_msgSend((id)_MergedGlobals_974, "invalidate");
      v52 = (void *)_MergedGlobals_974;
      _MergedGlobals_974 = 0;

    }
  }

}

void _UIApplicationSceneConnectionHandler_block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  unint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(*(id *)(a1 + 32), "windowScene");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 == *(void **)(a1 + 40))
    {

    }
    else
    {
      v6 = v2;
      v3 = objc_msgSend((id)UIApp, "_hasCalledRunWithMainScene");

      if (v3)
      {
        v4 = _UIApplicationSceneConnectionHandler_block_invoke_2___s_category;
        if (!_UIApplicationSceneConnectionHandler_block_invoke_2___s_category)
        {
          v4 = __UILogCategoryGetNode("ApplicationLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&_UIApplicationSceneConnectionHandler_block_invoke_2___s_category);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "UIWindows were created prior to initial application activation. This may result in incorrect visual appearance.", buf, 2u);
        }
      }
    }
  }
}

@end
