@implementation SBSystemApertureSceneHoster

- (void)activateWithSystemApertureController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_storeWeak((id *)&self->_systemApertureController, a3);
  -[SBSystemApertureSceneHoster server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAB010]), "initWithDelegate:", self);
    -[SBSystemApertureSceneHoster setServer:](self, "setServer:", v5);

    -[SBSystemApertureSceneHoster server](self, "server");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startServer");

  }
}

- (id)sceneCreationRequestServer:(id)a3 didReceiveRequestForSystemApertureSceneWithClientIdentity:(id)a4
{
  id v6;
  id v7;
  SBSystemApertureSceneElement *v8;
  void *v9;
  void *v10;
  SBSystemApertureSceneElement *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, int);
  void *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  v8 = [SBSystemApertureSceneElement alloc];
  objc_msgSend(MEMORY[0x1E0DAC6D8], "specification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureSceneHoster systemApertureController](self, "systemApertureController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __116__SBSystemApertureSceneHoster_sceneCreationRequestServer_didReceiveRequestForSystemApertureSceneWithClientIdentity___block_invoke;
  v18 = &unk_1E8EC0980;
  objc_copyWeak(&v19, &location);
  v11 = -[SBSystemApertureSceneElement initWithSceneSpecification:sceneClientIdentity:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v8, "initWithSceneSpecification:sceneClientIdentity:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", v9, v7, v10, &v15);

  -[SBSystemApertureSceneHoster _addPendingElement:](self, "_addPendingElement:", v11, v15, v16, v17, v18);
  -[SBSystemApertureSceneElement activate](v11, "activate");
  -[SBSystemApertureSceneElement scene](v11, "scene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identityToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __116__SBSystemApertureSceneHoster_sceneCreationRequestServer_didReceiveRequestForSystemApertureSceneWithClientIdentity___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v5 = a2;
  if (a3)
  {
    v8 = v5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_registerElement:", v8);
    }
    else if (objc_msgSend(v8, "isActivated"))
    {
      objc_msgSend(v8, "deactivateWhenRemovedWithHandler:", 0);
    }

    v5 = v8;
  }

}

- (void)sceneCreationRequestServer:(id)a3 invalidateSceneElement:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)-[NSMapTable copy](self->_activeElements, "copy", 0);
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "scene");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identityToken");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "isEqual:", v5))
        {
          -[SBSystemApertureSceneHoster _invalidateElement:](self, "_invalidateElement:", v12);

          goto LABEL_11;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_addPendingElement:(id)a3
{
  NSMutableSet *pendingElements;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  pendingElements = self->_pendingElements;
  if (!pendingElements)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_pendingElements;
    self->_pendingElements = v5;

    pendingElements = self->_pendingElements;
  }
  -[NSMutableSet addObject:](pendingElements, "addObject:", v7);

}

- (void)_removePendingElement:(id)a3
{
  id v4;
  NSMutableSet *pendingElements;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableSet removeObject:](self->_pendingElements, "removeObject:", v4);

  if (!-[NSMutableSet count](self->_pendingElements, "count"))
  {
    pendingElements = self->_pendingElements;
    self->_pendingElements = 0;

  }
}

- (void)_registerElement:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *activeElements;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id from;
  id location;

  v4 = a3;
  BSDispatchQueueAssertMain();
  if (!self->_activeElements)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    activeElements = self->_activeElements;
    self->_activeElements = v5;

  }
  -[SBSystemApertureSceneHoster systemApertureController](self, "systemApertureController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerElement:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  objc_msgSend(v4, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__SBSystemApertureSceneHoster__registerElement___block_invoke;
  v20[3] = &unk_1E8EC09A8;
  objc_copyWeak(&v21, &location);
  objc_copyWeak(&v22, &from);
  objc_msgSend(v11, "monitorForDeath:", v20);

  v14 = v12;
  v15 = 3221225472;
  v16 = __48__SBSystemApertureSceneHoster__registerElement___block_invoke_3;
  v17 = &unk_1E8EC09D0;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v13 = (void *)MEMORY[0x1D17E5550](&v14);
  objc_msgSend(v4, "setClientInvalidationRequestHandler:", v13, v14, v15, v16, v17);
  objc_msgSend(v4, "setSceneInvalidationHandler:", v13);
  if (v8)
    -[NSMapTable setObject:forKey:](self->_activeElements, "setObject:forKey:", v8, v4);
  else
    -[SBSystemApertureSceneHoster _invalidateElement:](self, "_invalidateElement:", v4);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_copyWeak(&v8, (id *)(a1 + 40));
  BSDispatchMain();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);

}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained, "_invalidateElement:", v2);

}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_copyWeak(&v5, (id *)(a1 + 40));
  BSDispatchMain();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);

}

void __48__SBSystemApertureSceneHoster__registerElement___block_invoke_4(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidateElement:", v2);

}

- (void)_invalidateElement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureSceneHoster.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("element != nil"));

  }
  BSDispatchQueueAssertMain();
  -[NSMapTable objectForKey:](self->_activeElements, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isActivated") && (objc_msgSend(v5, "isDeactivating") & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__SBSystemApertureSceneHoster__invalidateElement___block_invoke;
    v8[3] = &unk_1E8EA60B8;
    v8[4] = self;
    objc_msgSend(v5, "deactivateWhenRemovedWithHandler:", v8);
  }
  else if ((objc_msgSend(v5, "isDeactivating") & 1) == 0)
  {
    -[SBSystemApertureSceneHoster _removeElement:](self, "_removeElement:", v5);
  }
  if (objc_msgSend(v6, "isValid"))
    objc_msgSend(v6, "invalidateWithReason:", CFSTR("SBSystemApertureSceneHoster invalidated element"));

}

uint64_t __50__SBSystemApertureSceneHoster__invalidateElement___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeElement:", a2);
}

- (void)_removeElement:(id)a3
{
  NSMapTable *activeElements;
  id v5;
  NSMapTable *v6;

  activeElements = self->_activeElements;
  v5 = a3;
  -[NSMapTable removeObjectForKey:](activeElements, "removeObjectForKey:", v5);
  -[NSMutableSet removeObject:](self->_pendingElements, "removeObject:", v5);

  if (!-[NSMapTable count](self->_activeElements, "count"))
  {
    v6 = self->_activeElements;
    self->_activeElements = 0;

  }
}

- (void)invalidate
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__SBSystemApertureSceneHoster_invalidate__block_invoke;
  v4[3] = &unk_1E8EA60B8;
  v4[4] = self;
  -[SBSystemApertureSceneHoster _enumerateElementsUsingBlock:](self, "_enumerateElementsUsingBlock:", v4);
  -[SBSystemApertureSceneHoster server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBSystemApertureSceneHoster setServer:](self, "setServer:", 0);
}

uint64_t __41__SBSystemApertureSceneHoster_invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateElement:", a2);
}

- (void)_enumerateElementsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableSet allObjects](self->_pendingElements, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)-[NSMapTable copy](self->_activeElements, "copy", 0);
  objc_msgSend(v10, "keyEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (SBSystemApertureController)systemApertureController
{
  return (SBSystemApertureController *)objc_loadWeakRetained((id *)&self->_systemApertureController);
}

- (void)setSystemApertureController:(id)a3
{
  objc_storeWeak((id *)&self->_systemApertureController, a3);
}

- (SBSSystemApertureScenePresentationSessionServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_destroyWeak((id *)&self->_systemApertureController);
  objc_storeStrong((id *)&self->_pendingElements, 0);
  objc_storeStrong((id *)&self->_activeElements, 0);
}

@end
