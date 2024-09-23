@implementation SBDisplayPortalManager

- (SBDisplayPortalManager)initWithWindowSceneManager:(id)a3
{
  id v5;
  SBDisplayPortalManager *v6;
  SBDisplayPortalManager *v7;
  uint64_t v8;
  NSMapTable *sourceViewToPortalWindowsMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDisplayPortalManager;
  v6 = -[SBDisplayPortalManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_windowSceneManager, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    sourceViewToPortalWindowsMap = v7->_sourceViewToPortalWindowsMap;
    v7->_sourceViewToPortalWindowsMap = (NSMapTable *)v8;

  }
  return v7;
}

- (void)createPortalsForSourceView:(id)a3 usingTraitsRole:(id)a4 onWindowScenesPassingTest:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  SBDisplayPortalManager *v21;
  id v22;
  id v23;
  id v24;

  v18 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMapTable objectForKey:](self->_sourceViewToPortalWindowsMap, "objectForKey:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v18, "_sbWindowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayPortalManager.m"), 46, CFSTR("Cannot create portals for a view that is not being displayed"));

    }
    -[SBWindowSceneManager connectedWindowScenes](self->_windowSceneManager, "connectedWindowScenes", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __95__SBDisplayPortalManager_createPortalsForSourceView_usingTraitsRole_onWindowScenesPassingTest___block_invoke;
    v19[3] = &unk_1E8EAE930;
    v20 = v12;
    v24 = v10;
    v21 = self;
    v14 = v18;
    v22 = v14;
    v23 = v9;
    v15 = v12;
    objc_msgSend(v13, "bs_compactMap:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable setObject:forKey:](self->_sourceViewToPortalWindowsMap, "setObject:forKey:", v16, v14);
  }

}

id __95__SBDisplayPortalManager_createPortalsForSourceView_usingTraitsRole_onWindowScenesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (*(id *)(a1 + 32) == v3 || !(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_createPortalForSourceView:sourceWindowScene:targetWindowScene:traitsRole:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_createPortalForSourceView:(id)a3 sourceWindowScene:(id)a4 targetWindowScene:(id)a5 traitsRole:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "bounds");
  objc_msgSend(v11, "convertRect:toNeighboringDisplayWindowScene:", v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE58]), "initWithSourceView:", v12);
  objc_msgSend(v21, "portalLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCrossDisplay:", 1);

  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
  objc_msgSend(v21, "setUserInteractionEnabled:", 0);
  v23 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v21);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC18]), "initWithWindowScene:", v10);
  objc_msgSend(v25, "_setRoleHint:", v9);

  objc_msgSend(v25, "setOpaque:", 0);
  objc_msgSend(v25, "setRootViewController:", v23);
  objc_msgSend(v25, "setHidden:", 0);
  objc_msgSend(v12, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "windowLevel");
  objc_msgSend(v25, "setWindowLevel:");

  return v25;
}

- (void)destroyPortalsForSourceView:(id)a3
{
  id v4;
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
  v4 = a3;
  -[NSMapTable objectForKey:](self->_sourceViewToPortalWindowsMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_sourceViewToPortalWindowsMap, "removeObjectForKey:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setHidden:", 1, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_sourceViewToPortalWindowsMap, 0);
}

@end
