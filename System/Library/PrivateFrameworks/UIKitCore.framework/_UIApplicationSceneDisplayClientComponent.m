@implementation _UIApplicationSceneDisplayClientComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "settingsDiff");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsProperty:", sel_displayBasedSafeAreaInsetsValue))
    {

LABEL_9:
      v12 = v6;
      objc_msgSend(v5, "transitionContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69___UIApplicationSceneDisplayClientComponent_scene_didUpdateSettings___block_invoke;
      v15[3] = &unk_1E16B3FD8;
      v16 = v12;
      v14 = v12;
      _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v13, v15, 0);

      goto LABEL_10;
    }
    objc_msgSend(v5, "settingsDiff");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsProperty:", sel_interfaceOrientation);

    if (v11)
      goto LABEL_9;
  }
  else
  {
    v8 = scene_didUpdateSettings____s_category;
    if (!scene_didUpdateSettings____s_category)
    {
      v8 = __UILogCategoryGetNode("Accessibility", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&scene_didUpdateSettings____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unexpected scene for display client component: %@", buf, 0xCu);
    }
  }
LABEL_10:

}

- (UIEdgeInsets)displayBasedSafeAreaInsets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  void *v27;
  uint64_t v28;
  UIEdgeInsets result;

  v28 = *MEMORY[0x1E0C80C00];
  -[FBSSceneComponent clientScene](self, "clientScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayBasedSafeAreaInsetsValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "UIEdgeInsetsValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[FBSSceneComponent clientScene](self, "clientScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isUISubclass"))
    {
      objc_msgSend(v15, "safeAreaInsetsPortrait");
      v7 = v16;
      v9 = v17;
      v11 = v18;
      v13 = v19;
    }
    else
    {
      v20 = displayBasedSafeAreaInsets___s_category;
      if (!displayBasedSafeAreaInsets___s_category)
      {
        v20 = __UILogCategoryGetNode("Accessibility", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&displayBasedSafeAreaInsets___s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      v13 = 0.0;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v26 = 138412290;
        v27 = v15;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Unexpected settings for display client component: %@", (uint8_t *)&v26, 0xCu);
      }
      v11 = 0.0;
      v9 = 0.0;
      v7 = 0.0;
    }

  }
  v22 = v7;
  v23 = v9;
  v24 = v11;
  v25 = v13;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

@end
