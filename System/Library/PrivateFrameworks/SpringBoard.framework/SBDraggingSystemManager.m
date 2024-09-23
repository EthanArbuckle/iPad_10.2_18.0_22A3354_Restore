@implementation SBDraggingSystemManager

+ (SBDraggingSystemManager)sharedInstance
{
  void *v2;
  SBDraggingSystemManager *v3;
  void *v4;
  void *v5;

  v2 = (void *)sharedInstance_sharedInstance_0;
  if (!sharedInstance_sharedInstance_0)
  {
    v3 = objc_alloc_init(SBDraggingSystemManager);
    v4 = (void *)sharedInstance_sharedInstance_0;
    sharedInstance_sharedInstance_0 = (uint64_t)v3;

    objc_msgSend(MEMORY[0x1E0CEA578], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", sharedInstance_sharedInstance_0);

    v2 = (void *)sharedInstance_sharedInstance_0;
  }
  return (SBDraggingSystemManager *)v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setCommandeered:(BOOL)a3 forDropSession:(id)a4 forReason:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0CEA578];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sessionForDropSession:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDraggingSystemManager setCommandeered:forDraggingSystemSession:forReason:](self, "setCommandeered:forDraggingSystemSession:forReason:", v6, v11, v9);
}

- (void)setCommandeered:(BOOL)a3 forDraggingSystemSession:(id)a4 forReason:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSMapTable *commandeerReasons;
  BOOL v10;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  id v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v8 = a5;
  commandeerReasons = self->_commandeerReasons;
  if (commandeerReasons)
    v10 = 1;
  else
    v10 = !v6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_commandeerReasons;
    self->_commandeerReasons = v11;

    commandeerReasons = self->_commandeerReasons;
  }
  -[NSMapTable objectForKey:](commandeerReasons, "objectForKey:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
  {
    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0CB3550]);
      -[NSMapTable setObject:forKey:](self->_commandeerReasons, "setObject:forKey:", v14, v15);
    }
    objc_msgSend(v14, "addObject:", v8);
    objc_msgSend(v15, "setCommandeered:", 1);
  }
  else
  {
    objc_msgSend(v13, "removeObject:", v8);
    if (v14 && !objc_msgSend(v14, "count"))
    {
      objc_msgSend(v15, "setCommandeered:", 0);
      -[NSMapTable removeObjectForKey:](self->_commandeerReasons, "removeObjectForKey:", v15);
    }
  }

}

- (void)dragSessionDidBegin:(id)a3
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "dragSessionDidBegin:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)dragSessionDidEnd:(id)a3
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "dragSessionDidEnd:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)touchRoutingPolicyForBeginningDragSessionWithInfo:(id)a3
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  int v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _OWORD v56[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "supportsSystemDrag"))
  {
    v46 = objc_alloc_init(MEMORY[0x1E0CEA580]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __77__SBDraggingSystemManager_touchRoutingPolicyForBeginningDragSessionWithInfo___block_invoke;
    v63[3] = &unk_1E8EA5288;
    v45 = v4;
    v64 = v45;
    v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v63);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectedWindowScenes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v60 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "switcherController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "switcherWindow");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            ((void (**)(_QWORD, void *))v5)[2](v5, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v9);
    }

    v14 = objc_msgSend(v3, "processIdentifier");
    v57 = 0u;
    v58 = 0u;
    if (v3)
      objc_msgSend(v3, "auditToken");
    v56[0] = v57;
    v56[1] = v58;
    objc_msgSend(MEMORY[0x1E0D016E0], "tokenFromAuditToken:", v56);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_controlCenterWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v16;
    v17 = objc_msgSend(v16, "isHidden");
    if (v14 == getpid() || objc_msgSend(v47, "hasEntitlement:", CFSTR("com.apple.springboard.app-drag")))
    {
      v43 = v3;
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "window");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v20 = v17;
      else
        v20 = 0;
      if (v20 == 1)
        ((void (**)(_QWORD, void *))v5)[2](v5, v19);
      v42 = v14;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend((id)SBApp, "windowSceneManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "connectedWindowScenes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v53;
        do
        {
          v26 = 0;
          v27 = v19;
          do
          {
            if (*(_QWORD *)v53 != v25)
              objc_enumerationMutation(v22);
            v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v26);
            objc_msgSend(v28, "homeScreenController");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "window");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
              v30 = v17;
            else
              v30 = 0;
            if (v30 == 1)
              ((void (**)(_QWORD, void *))v5)[2](v5, v19);
            ++v26;
            v27 = v19;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
        }
        while (v24);
      }

      v3 = v43;
      v14 = v42;
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "connectedWindowScenes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v49 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "floatingDockController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatingDockWindow");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
            ((void (**)(_QWORD, void *))v5)[2](v5, v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v65, 16);
      }
      while (v34);
    }

    if (v44)
      v39 = v17;
    else
      v39 = 1;
    if ((v39 & 1) == 0)
      ((void (**)(_QWORD, void *))v5)[2](v5, v44);
    v40 = v46;
    objc_msgSend(v46, "setContextIDsToAlwaysSendTouchesByDisplayIdentifier:", v45);
    if (v14 == getpid())
      objc_msgSend(v46, "setHitTestingDisabled:", 1);

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

void __77__SBDraggingSystemManager_touchRoutingPolicyForBeginningDragSessionWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)*MEMORY[0x1E0CEBF60];
  if (v6)
    v8 = (void *)v6;
  v16 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = *(void **)(a1 + 32);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "setObject:forKey:", v11, v16);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend(v3, "_contextId");

  objc_msgSend(v13, "numberWithUnsignedInt:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandeerReasons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
