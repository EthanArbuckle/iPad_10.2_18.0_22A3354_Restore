@implementation UIApplicationSceneDisconnectionHandler

void _UIApplicationSceneDisconnectionHandler_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  const char *Name;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id *v27;
  unint64_t v28;
  NSObject *v29;
  NSObject *v30;
  objc_class *v31;
  const char *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _QWORD *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  id *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = v2;
    if ((objc_msgSend((id)UIApp, "_appAdoptsUISceneLifecycle") & 1) == 0)
    {
      objc_msgSend((id)UIApp, "_defaultSceneIfExists");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_FBSScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8)
      {
        if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0)
        {
          -[UIWindowScene _keyWindow]((id *)v5);
          v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "screen");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "screen");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIWindowScene _placeholderWindowSceneForScreen:create:](UIWindowScene, "_placeholderWindowSceneForScreen:create:", v11, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIApplicationSceneDisconnectionHandler_block_invoke_3");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("_UISceneConnectionActions.m"), 141, CFSTR("Unexpected class for placeholder scene: %@"), v12);

          }
          v13 = v12;
          -[_UIScreenBasedWindowScene _preventAutoInvalidationForReason:]((uint64_t)v13, CFSTR("default scene disconnected"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)&_MergedGlobals_974, v14);
          v15 = qword_1ECD7CE80;
          if (!qword_1ECD7CE80)
          {
            v15 = __UILogCategoryGetNode("ApplicationLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&qword_1ECD7CE80);
          }
          v16 = *(NSObject **)(v15 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            v18 = (objc_class *)objc_opt_class();
            Name = class_getName(v18);
            v20 = (objc_class *)objc_opt_class();
            *(_DWORD *)buf = 136447746;
            v41 = Name;
            v42 = 2050;
            v43 = v5;
            v44 = 2082;
            v45 = class_getName(v20);
            v46 = 2050;
            v47 = v13;
            v48 = 2050;
            v49 = v10;
            v50 = 1024;
            v51 = objc_msgSend(v10, "_isMainScreen");
            v52 = 1024;
            v53 = objc_msgSend(v10, "_isMainLikeScreen");
            _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Migrating windows from disconnecting default scene: %{public}s: %{public}p; to placeholder scene: %{public"
              "}s: %{public}p; screen: %{public}p, isMain: %d, isMainLike: %d",
              buf,
              0x40u);

          }
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v5, "_allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v36 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "setWindowScene:", v13);
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
            }
            while (v23);
          }

          if (v9)
          {
            -[UIWindowScene _keyWindow](v13);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "windowScene");
            v27 = (id *)objc_claimAutoreleasedReturnValue();

            if (!v26 && v27 == v13)
            {
              v28 = qword_1ECD7CE88;
              if (!qword_1ECD7CE88)
              {
                v28 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v28, (unint64_t *)&qword_1ECD7CE88);
              }
              v29 = *(NSObject **)(v28 + 8);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v30 = v29;
                v31 = (objc_class *)objc_opt_class();
                v32 = class_getName(v31);
                *(_DWORD *)buf = 136446466;
                v41 = v32;
                v42 = 2050;
                v43 = v9;
                _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_DEFAULT, "Migrating key window from disconnecting default scene to placeholder scene: %{public}s: %{public}p", buf, 0x16u);

              }
              -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v9, 1, 1);
            }

          }
        }
      }
    }

  }
}

@end
