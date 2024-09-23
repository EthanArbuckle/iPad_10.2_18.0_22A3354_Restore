@implementation SBGridSwitcherViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBGridSwitcherViewController;
  -[SBFluidSwitcherViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SBGridSwitcherViewController _setupSpringLoadingSupport](self, "_setupSpringLoadingSupport");
}

- (void)_setupSpringLoadingSupport
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0DA9EE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0DA9EF0]);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v4, "setDelegate:", self);
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0CEA9D0]);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __58__SBGridSwitcherViewController__setupSpringLoadingSupport__block_invoke;
  v11 = &unk_1E8EBE2F0;
  objc_copyWeak(&v12, &location);
  v6 = (void *)objc_msgSend(v5, "initWithInteractionBehavior:interactionEffect:activationHandler:", v3, v4, &v8);
  -[SBFluidSwitcherViewController contentView](self, "contentView", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addInteraction:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __58__SBGridSwitcherViewController__setupSpringLoadingSupport__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "targetItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(WeakRetained, "didSelectContainer:modifierFlags:", v9, 0);
}

- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  int v26;
  NSObject *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  void *v61;
  uint8_t buf[4];
  NSObject *v63;
  __int16 v64;
  _BOOL4 v65;
  _BYTE v66[128];
  uint64_t v67;

  y = a4.y;
  x = a4.x;
  v67 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[SBFluidSwitcherViewController layoutContext](self, "layoutContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeGesture");
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject gestureEvent](v10, "gestureEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v16 = objc_msgSend(v15, "isSwitcherDrag");
  if (v16)
  {
    SBLogAppSwitcherDrag();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v10;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "Not spring-loading because of active gesture: %@", buf, 0xCu);
    }
LABEL_27:

    v26 = 0;
  }
  else
  {

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v8, "items");
    v10 = objc_claimAutoreleasedReturnValue();
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v57 != v20)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "localObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_opt_class();
          v24 = v22;
          if (v23)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v25 = v24;
            else
              v25 = 0;
          }
          else
          {
            v25 = 0;
          }
          v17 = v25;

          if (v17 && -[NSObject startLocation](v17, "startLocation") == 11)
          {
            SBLogAppSwitcherDrag();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v17;
              _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_INFO, "Not spring-loading because dragged items came from switcher: %@", buf, 0xCu);
            }

            goto LABEL_27;
          }

        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        v26 = 1;
        if (v19)
          continue;
        break;
      }
    }
    else
    {
      v26 = 1;
    }
  }

  v28 = -[SBFluidSwitcherViewController _windowManagementStyle](self, "_windowManagementStyle");
  -[SBFluidSwitcherViewController layoutContext](self, "layoutContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "unlockedEnvironmentMode");
  v32 = v31;
  if (!v26)
    goto LABEL_36;
  v33 = v31 & 0xFFFFFFFFFFFFFFFELL;
  if (v28 != 2)
    v33 = v31;
  if (v33 != 2)
  {
    SBLogAppSwitcherDrag();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      SBStringForUnlockedEnvironmentMode(v32);
      v36 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v63 = v36;
      v64 = 1024;
      v65 = v28 == 2;
      _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_INFO, "Not spring-loading for unlockedEnvironmentMode: %@, with chamoisIsEnabled: %d", buf, 0x12u);

    }
LABEL_36:
    v34 = 0;
    goto LABEL_37;
  }
  v34 = 1;
LABEL_37:
  -[SBFluidSwitcherViewController _itemContainerAtLocation:environment:](self, "_itemContainerAtLocation:environment:", 0, x, y);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "appLayout");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  v40 = 0;
  if (v37 && v38)
  {
    objc_msgSend(v37, "killingProgress");
    if (!BSFloatIsZero() || objc_msgSend(v39, "type"))
    {
      v40 = 0;
      goto LABEL_42;
    }
    objc_msgSend(MEMORY[0x1E0DAA620], "draggedItemBundleIdentifiersInDrag:", v8);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");
    if (v44 != 1)
    {
      if (!v44 && (objc_msgSend(v37, "isEligibleForContentDragSpringLoading") & 1) != 0)
        goto LABEL_61;
LABEL_59:
      v40 = 0;
LABEL_63:

      goto LABEL_42;
    }
    objc_msgSend(v43, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      v40 = 0;
LABEL_62:

      goto LABEL_63;
    }
    if (objc_msgSend(v39, "containsItemWithBundleIdentifier:", v45))
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "applicationWithBundleIdentifier:", v45);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v55, "info");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "supportsMultiwindow");

      if (!v48 || v28 != 2 || v32 != 3)
      {

        if (!v48)
          goto LABEL_59;
LABEL_61:
        v40 = v37;

        v60 = *MEMORY[0x1E0DABD88];
        v61 = &unk_1E91D20D8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)MEMORY[0x1E0DA9D78];
        v43 = v53;
        objc_msgSend(v54, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "emitEvent:withPayload:", 31, v43);

        goto LABEL_62;
      }
    }
    else if (v28 != 2 || v32 != 3)
    {

      goto LABEL_61;
    }
    objc_msgSend(v30, "appLayout");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "zOrderedItems");
    v50 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v50, "firstObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "itemForLayoutRole:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v50) = objc_msgSend(v51, "isEqual:", v52);

    if ((v50 & 1) != 0)
      goto LABEL_59;
    goto LABEL_61;
  }
LABEL_42:
  v41 = v40;

  return v41;
}

- (id)targetViewForSpringLoadingEffectForView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "_springLoadingEffectTargetView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
