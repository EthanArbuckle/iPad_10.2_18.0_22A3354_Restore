@implementation SBLockScreenPlugin

+ (id)_pluginBundleForPluginWithName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D01808], "mainManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pluginBundleForName:type:", v3, CFSTR("lockbundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (SBLockScreenPlugin)pluginWithName:(id)a3 activationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_pluginBundleForPluginWithName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "loadPlugin") & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundle:activationContext:", v8, v7);
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SBLockScreenPlugin pluginWithName:activationContext:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }

  return (SBLockScreenPlugin *)v9;
}

- (SBLockScreenPlugin)initWithBundle:(id)a3 activationContext:(id)a4
{
  id v7;
  id v8;
  SBLockScreenPlugin *v9;
  SBLockScreenPlugin *v10;
  uint64_t v11;
  NSString *bundleName;
  uint64_t v13;
  FBProcess *process;
  SBLockScreenPlugin *v15;
  SBLockScreenPluginController *controller;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  SBLockScreenPlugin *v26;

  v7 = a3;
  v8 = a4;
  v9 = -[SBLockScreenPlugin init](self, "init");
  if (v9)
  {
    v10 = v9;
    objc_storeStrong((id *)&v9->_bundle, a3);
    objc_msgSend(v7, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleName = v10->_bundleName;
    v10->_bundleName = (NSString *)v11;

    objc_msgSend(v8, "process");
    v13 = objc_claimAutoreleasedReturnValue();
    process = v10->_process;
    v10->_process = (FBProcess *)v13;

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__SBLockScreenPlugin_initWithBundle_activationContext___block_invoke;
    v25[3] = &unk_1E8EA8260;
    v15 = v10;
    v26 = v15;
    if (objc_msgSend(v7, "loadPlugin:", v25))
    {
      -[FBProcess addObserver:](v10->_process, "addObserver:", v15);
    }
    else
    {
      controller = v15->_controller;
      v15->_controller = 0;

      SBLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBLockScreenPlugin initWithBundle:activationContext:].cold.1((uint64_t)v7, v17, v18, v19, v20, v21, v22, v23);

      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __55__SBLockScreenPlugin_initWithBundle_activationContext___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EFEB4D18) & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a2, "rootViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(a2, "conformsToProtocol:", &unk_1EFD084A8))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Principal class does not conform to expected protocol"), 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    v4 = objc_alloc_init((Class)a2);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pluginViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "view");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPluginAgent:");
}

- (void)dealloc
{
  objc_super v3;

  -[FBProcess removeObserver:](self->_process, "removeObserver:", self);
  -[SBLockScreenPluginController setPluginAgent:](self->_controller, "setPluginAgent:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBLockScreenPlugin;
  -[SBLockScreenPlugin dealloc](&v3, sel_dealloc);
}

- (SBLockScreenPluginAppearanceContext)appearance
{
  return self->_appearance;
}

- (BOOL)isElementHidden:(int64_t)a3
{
  void *v3;
  char v4;

  -[SBLockScreenPlugin overrideForElement:](self, "overrideForElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  return v4;
}

- (id)overrideForElement:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBLockScreenPlugin appearance](self, "appearance", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "element") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isCapabilityRestricted:(unint64_t)a3
{
  void *v4;

  -[SBLockScreenPlugin appearance](self, "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = (a3 & ~objc_msgSend(v4, "restrictedCapabilities")) == 0;

  return a3;
}

- (CSAppearance)coverSheetAppearance
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  id *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if ((-[SBLockScreenPluginAppearanceContext isHidden](self->_appearance, "isHidden") & 1) != 0)
    return (CSAppearance *)0;
  v4 = (void *)MEMORY[0x1E0D1BB58];
  -[SBLockScreenPlugin name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appearanceWithIdentifier:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPlugin appearance](self, "appearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "backgroundStyle");

  switch(v9)
  {
    case 3:
      goto LABEL_6;
    case 2:
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "priority:", 30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = &unk_1E91D0878;
      goto LABEL_8;
    case 1:
LABEL_6:
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "priority:", 30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = &unk_1E91D0860;
LABEL_8:
      objc_msgSend(v11, "style:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

      break;
  }
  v70 = (void *)v6;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[SBLockScreenPluginAppearanceContext elementOverrides](self->_appearance, "elementOverrides", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (!v16)
    goto LABEL_30;
  v17 = v16;
  v18 = *(_QWORD *)v72;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v72 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      v21 = objc_msgSend(v20, "element");
      if (v21 == 3)
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E50]), "initWithString:accessoryView:", 0, 0);
        objc_msgSend(MEMORY[0x1E0D1BB88], "dateView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isHidden"))
        {
          objc_msgSend(v22, "setString:", &stru_1E8EC7EC0);
          objc_msgSend(v23, "setView:", v22);
        }
        else
        {
          objc_msgSend(v20, "text");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v22, "setString:", v26);
            v27 = v22;
          }
          else
          {
            v27 = 0;
          }
          objc_msgSend(v23, "setView:", v27);

        }
        objc_msgSend(v23, "setPriority:", 30);
        objc_msgSend(v7, "addObject:", v23);
LABEL_26:

        goto LABEL_27;
      }
      if (v21 != 2)
      {
        if (v21 != 1)
          continue;
        objc_msgSend(MEMORY[0x1E0D1BB88], "statusBar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "priority:", 30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "hidden:", objc_msgSend(v20, "isHidden"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v24);

        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0D1BB88], "dateView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "priority:", 30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setHidden:", objc_msgSend(v20, "isHidden"));
      objc_msgSend(v7, "addObject:", v22);
LABEL_27:

    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  }
  while (v17);
LABEL_30:

  if (objc_msgSend(v69[6], "presentationStyle") == 1)
  {
    v28 = objc_opt_class();
    objc_msgSend(v69, "viewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = objc_msgSend(v31, "showsDateView");
      v33 = (void *)objc_opt_new();
      v34 = v33;
      if (v32)
      {
        objc_msgSend(v33, "hidden:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        v37 = 1;
      }
      else
      {
        objc_msgSend(v33, "hidden:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        v37 = 0;
      }
      objc_msgSend(v35, "vibrantAndCentered:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "priority:", 30);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v39);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1BB88], "dateView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "hidden:", 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "priority:", 30);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v38);
    }

    objc_msgSend(MEMORY[0x1E0D1BB88], "backgroundContent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "priority:", 30);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "hidden:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v42);

    objc_msgSend(MEMORY[0x1E0D1BB88], "pageContent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "priority:", 30);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "hidden:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0D1BB88], "pageControl");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "priority:", 30);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "hidden:", 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v48);

    objc_msgSend(MEMORY[0x1E0D1BB88], "footerCallToActionLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "priority:", 30);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "hidden:", 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v51);

    objc_msgSend(MEMORY[0x1E0D1BB88], "footerStatusLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "priority:", 30);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "hidden:", 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v54);

    objc_msgSend(MEMORY[0x1E0D1BB88], "proudLock");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "priority:", 30);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "hidden:", 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v57);

    objc_msgSend(MEMORY[0x1E0D1BB88], "controlCenterGrabber");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "priority:", 30);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "hidden:", 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v60);

  }
  objc_msgSend(v70, "setComponents:", v7);
  objc_msgSend(v69, "appearance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "backgroundStyle");
  if ((unint64_t)(v62 - 1) < 2)
  {
    v63 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v63;
    v66 = 1;
    goto LABEL_42;
  }
  if (v62 == 3)
  {
    v67 = objc_alloc(MEMORY[0x1E0CEADE8]);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v67;
    v66 = 2;
LABEL_42:
    v68 = (void *)objc_msgSend(v65, "initWithStyle:contentColor:", v66, v64);

  }
  else
  {
    v68 = 0;
  }
  objc_msgSend(v70, "setLegibilitySettings:", v68);

  return (CSAppearance *)v70;
}

- (CSBehavior)coverSheetBehavior
{
  void *v3;
  int8x8_t v4;
  _QWORD *v5;
  uint8x8_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  void (*v13)(_QWORD *);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  objc_msgSend(MEMORY[0x1E0D1BB70], "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v4 = (int8x8_t)-[SBLockScreenPluginAppearanceContext restrictedCapabilities](self->_appearance, "restrictedCapabilities");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = (void (*)(_QWORD *))__40__SBLockScreenPlugin_coverSheetBehavior__block_invoke;
  v14 = &unk_1E8EA8288;
  v15 = &v16;
  v5 = v12;
  if (v4)
  {
    v20 = 0;
    v6 = (uint8x8_t)vcnt_s8(v4);
    v6.i16[0] = vaddlv_u8(v6);
    v7 = v6.i32[0];
    if (v6.i32[0])
    {
      v8 = 0;
      do
      {
        if (((1 << v8) & *(_QWORD *)&v4) != 0)
        {
          v13(v5);
          if (v20)
            break;
          --v7;
        }
        if (v8 > 0x3E)
          break;
        ++v8;
      }
      while (v7 > 0);
    }
  }

  objc_msgSend(v3, "setRestrictedCapabilities:", v17[3]);
  v9 = -[SBLockScreenPluginAppearanceContext notificationBehavior](self->_appearance, "notificationBehavior");
  if (v9 >= 3)
    v10 = 0;
  else
    v10 = qword_1D0E890E8[v9];
  objc_msgSend(v3, "setNotificationBehavior:", v10);
  objc_msgSend(v3, "setIdleTimerDuration:", 0);
  objc_msgSend(v3, "setIdleTimerMode:", 1);
  objc_msgSend(v3, "setIdleWarnMode:", 1);
  _Block_object_dispose(&v16, 8);
  return (CSBehavior *)v3;
}

_QWORD *__40__SBLockScreenPlugin_coverSheetBehavior__block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 <= 31)
  {
    if (a2 > 7)
    {
      if (a2 == 8)
      {
        result += 4;
        v2 = 56;
      }
      else
      {
        if (a2 != 16)
          return result;
        result += 4;
        v2 = 2048;
      }
    }
    else if (a2 == 2)
    {
      result += 4;
      v2 = 2;
    }
    else
    {
      if (a2 != 4)
        return result;
      result += 4;
      v2 = 4;
    }
  }
  else if (a2 <= 127)
  {
    if (a2 == 32)
    {
      v3 = result[4];
      result += 4;
      *(_QWORD *)(*(_QWORD *)(v3 + 8) + 24) |= 8uLL;
      v2 = 16;
    }
    else
    {
      if (a2 != 64)
        return result;
      result += 4;
      v2 = 512;
    }
  }
  else
  {
    switch(a2)
    {
      case 128:
        result += 4;
        v2 = 64;
        break;
      case 256:
        result += 4;
        v2 = 128;
        break;
      case 512:
        result += 4;
        v2 = 0x4000;
        break;
      default:
        return result;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*result + 8) + 24) |= v2;
  return result;
}

- (BOOL)handleDashBoardEvent:(id)a3
{
  id v4;
  unint64_t v5;
  char v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "type") - 27;
  if (v5 <= 6
    && ((0x7Bu >> v5) & 1) != 0
    && -[SBLockScreenPlugin pluginHandleEvent:](self, "pluginHandleEvent:", qword_1D0E89100[v5]))
  {
    v6 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_updateAppearance:(id)a3
{
  objc_class *v4;
  id v5;
  SBLockScreenPluginAppearanceContext *v6;
  SBLockScreenPluginAppearanceContext *appearance;

  v4 = (objc_class *)MEMORY[0x1E0DAC228];
  v5 = a3;
  v6 = (SBLockScreenPluginAppearanceContext *)objc_msgSend([v4 alloc], "initWithAppearance:", v5);

  appearance = self->_appearance;
  self->_appearance = v6;

}

- (int64_t)pluginPriority
{
  return -[SBLockScreenPluginController pluginPriority](self->_controller, "pluginPriority");
}

- (SBLockScreenPluginViewController)pluginViewController
{
  return (SBLockScreenPluginViewController *)-[SBLockScreenPluginController pluginViewController](self->_controller, "pluginViewController");
}

- (void)pluginWillActivateWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setAuxiliaryAnimation:", 0);
    -[SBLockScreenPluginController pluginWillActivateWithContext:](self->_controller, "pluginWillActivateWithContext:", v4);

  }
  -[SBLockScreenPluginController pluginAppearance](self->_controller, "pluginAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPlugin _updateAppearance:](self, "_updateAppearance:", v5);

}

- (void)pluginDidDeactivateWithContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setAuxiliaryAnimation:", 0);
    -[SBLockScreenPluginController pluginDidDeactivateWithContext:](self->_controller, "pluginDidDeactivateWithContext:", v4);

  }
}

- (SBLockScreenPluginAction)pluginUnlockAction
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBLockScreenPluginController pluginUnlockAction](self->_controller, "pluginUnlockAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (SBLockScreenPluginAction *)v3;
}

- (BOOL)pluginHandleEvent:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[SBLockScreenPluginController pluginHandleEvent:](self->_controller, "pluginHandleEvent:", a3);
  else
    return 0;
}

- (void)addLifecycleObserver:(id)a3
{
  id v4;
  NSMutableArray *lifecycleObservers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  lifecycleObservers = self->_lifecycleObservers;
  v8 = v4;
  if (!lifecycleObservers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_lifecycleObservers;
    self->_lifecycleObservers = v6;

    v4 = v8;
    lifecycleObservers = self->_lifecycleObservers;
  }
  -[NSMutableArray addObject:](lifecycleObservers, "addObject:", v4);

}

- (void)removeLifecycleObserver:(id)a3
{
  NSMutableArray *lifecycleObservers;

  -[NSMutableArray removeObject:](self->_lifecycleObservers, "removeObject:", a3);
  if (!-[NSMutableArray count](self->_lifecycleObservers, "count"))
  {
    lifecycleObservers = self->_lifecycleObservers;
    self->_lifecycleObservers = 0;

  }
}

- (void)enumerateLifecycleObserversUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)-[NSMutableArray copy](self->_lifecycleObservers, "copy");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)hidesLockScreenComplications
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[SBLockScreenPluginController hidesLockScreenComplications](self->_controller, "hidesLockScreenComplications");
  else
    return 0;
}

- (void)activatePluginController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  objc_msgSend(WeakRetained, "activatePluginController:", self);

}

- (void)deactivatePluginController:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  objc_msgSend(WeakRetained, "deactivatePluginController:", self);

}

- (void)pluginController:(id)a3 updateAppearance:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;

  -[SBLockScreenPlugin _updateAppearance:](self, "_updateAppearance:", a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  -[SBLockScreenPlugin pluginAppearance](self, "pluginAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "pluginController:updateAppearance:", self, v6);

  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "pluginAppearanceDidChange:", self);

}

- (BOOL)pluginController:(id)a3 sendAction:(id)a4
{
  SBLockScreenPlugin *v4;
  SBLockScreenPluginAgent **p_agent;
  id v6;
  id WeakRetained;

  v4 = self;
  p_agent = &self->_agent;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_agent);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "pluginController:sendAction:", v4, v6);

  return (char)v4;
}

- (void)processDidExit:(id)a3
{
  _QWORD block[5];

  objc_msgSend(a3, "removeObserver:", self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SBLockScreenPlugin_processDidExit___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __37__SBLockScreenPlugin_processDidExit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "deactivatePluginController:", *(_QWORD *)(a1 + 32));

}

- (NSString)description
{
  return (NSString *)-[SBLockScreenPlugin descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenPlugin succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_bundleName, CFSTR("name"));
  -[BSPluginBundle identifier](self->_bundle, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("identifier"));

  v7 = (id)objc_msgSend(v3, "appendClass:withName:", -[BSPluginBundle principalClass](self->_bundle, "principalClass"), CFSTR("principalClass"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLockScreenPlugin descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBLockScreenPlugin *v11;

  v4 = a3;
  -[SBLockScreenPlugin succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SBLockScreenPlugin_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __60__SBLockScreenPlugin_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("controller"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("overlay"));
}

- (SBLockScreenPluginDelegate)delegate
{
  return (SBLockScreenPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBLockScreenPluginController)controller
{
  return self->_controller;
}

- (SBLockOverlayContext)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (NSString)name
{
  return self->_bundleName;
}

- (id)auxiliaryActivationAnimationBlock
{
  return self->_auxiliaryActivationAnimationBlock;
}

- (void)setAuxiliaryActivationAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)auxiliaryDeactivationAnimationBlock
{
  return self->_auxiliaryDeactivationAnimationBlock;
}

- (void)setAuxiliaryDeactivationAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SBLockScreenPluginAgent)pluginAgent
{
  return (SBLockScreenPluginAgent *)objc_loadWeakRetained((id *)&self->_agent);
}

- (void)setPluginAgent:(id)a3
{
  objc_storeWeak((id *)&self->_agent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_auxiliaryDeactivationAnimationBlock, 0);
  objc_storeStrong(&self->_auxiliaryActivationAnimationBlock, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_lifecycleObservers, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_destroyWeak((id *)&self->_agent);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

+ (void)pluginWithName:(uint64_t)a3 activationContext:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "[SBLockScreenPlugin] No plugin bundle found named \"%@\", a5, a6, a7, a8, 2u);
}

- (void)initWithBundle:(uint64_t)a3 activationContext:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "[SBLockScreenPlugin] No root view controller was returned from %@", a5, a6, a7, a8, 2u);
}

@end
