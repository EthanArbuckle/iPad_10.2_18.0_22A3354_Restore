@implementation SBSceneManagerReference

- (BOOL)isDefunct
{
  void *v3;
  BOOL v4;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference isDefunct]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSceneManagerReference.m"), 168, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_managerWasValid)
    return 0;
  -[SBSceneManagerReference manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (id)manager
{
  SBSceneManager *manager;
  SBSceneManager *WeakRetained;
  void *v6;
  void *v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference manager]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSceneManagerReference.m"), 143, CFSTR("this call must be made on the main thread"));

  }
  manager = self->_manager;
  if (manager)
    WeakRetained = manager;
  else
    WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
  return WeakRetained;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (void)retainForScene:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference retainForScene:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSceneManagerReference.m"), 182, CFSTR("this call must be made on the main thread"));

  }
  v4 = v8;
  if (v8)
  {
    v5 = -[NSMutableSet containsObject:](self->_retainingScenes, "containsObject:", v8);
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42__SBSceneManagerReference_retainForScene___block_invoke;
      v9[3] = &unk_1E8E9E820;
      v9[4] = self;
      v10 = v8;
      -[SBSceneManagerReference _updateRetainWithBlock:](self, "_updateRetainWithBlock:", v9);

      v4 = v8;
    }
  }

}

- (void)_updateRetainWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 v5;
  SBSceneManager *WeakRetained;
  SBSceneManager *manager;
  void *v8;
  SBSceneManager *v9;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[SBSceneManagerReference isRetaining](self, "isRetaining");
  v4[2](v4);

  if (-[SBSceneManagerReference isRetaining](self, "isRetaining"))
  {
    if (!v5)
    {
      WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
      manager = self->_manager;
      self->_manager = WeakRetained;

    }
  }
  else if (v5)
  {
    -[SBSceneManagerReference manager](self, "manager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneManagerReference _autoreleaseManager:](self, "_autoreleaseManager:", v8);

    v9 = self->_manager;
    self->_manager = 0;

  }
}

- (BOOL)isRetaining
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference isRetaining]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBSceneManagerReference.m"), 163, CFSTR("this call must be made on the main thread"));

  }
  if (self->_invalidated)
    return 0;
  if (self->_displayIsConnected)
    return 1;
  return -[NSMutableSet count](self->_retainingScenes, "count") != 0;
}

void __42__SBSceneManagerReference_retainForScene___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:count:", a1 + 40, 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

  }
}

- (SBSceneManagerReference)initWithDisplayIdentity:(id)a3
{
  id v6;
  SBSceneManagerReference *v7;
  SBSceneManagerReference *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerReference.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBSceneManagerReference;
  v7 = -[SBSceneManagerReference init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_displayIdentity, a3);

  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)-[SBSceneManagerReference debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneManagerReference descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBSceneManagerReference *v11;

  v4 = a3;
  -[SBSceneManagerReference succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SBSceneManagerReference_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __65__SBSceneManagerReference_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "manager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("manager"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSceneManagerReference succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayIdentity, CFSTR("display"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBSceneManagerReference isRetaining](self, "isRetaining"), CFSTR("isRetaining"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBSceneManagerReference isDefunct](self, "isDefunct"), CFSTR("isDefunct"));
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  SBSceneManagerReference *v13;
  id v14;

  v4 = a3;
  -[SBSceneManagerReference descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __63__SBSceneManagerReference_debugDescriptionWithMultilinePrefix___block_invoke;
  v12 = &unk_1E8E9E820;
  v13 = self;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("retaining reasons"), v4, &v9);

  objc_msgSend(v6, "build", v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __63__SBSceneManagerReference_debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 41))
  {
    objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", CFSTR("display-connected"), 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(v2 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "description", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:withName:", v9, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_autoreleaseManager:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;

  v3 = a3;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[SBSceneManagerReference _autoreleaseManager:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SBSceneManagerReference__autoreleaseManager___block_invoke;
    block[3] = &unk_1E8E9DED8;
    v12 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __47__SBSceneManagerReference__autoreleaseManager___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __47__SBSceneManagerReference__autoreleaseManager___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
}

- (id)delegate
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference delegate]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBSceneManagerReference.m"), 133, CFSTR("this call must be made on the main thread"));

  }
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  SBSceneManagerReferenceDelegate *v4;
  SBSceneManagerReferenceDelegate *delegate;
  void *v6;
  void *v7;

  v4 = (SBSceneManagerReferenceDelegate *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference setDelegate:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSceneManagerReference.m"), 138, CFSTR("this call must be made on the main thread"));

  }
  delegate = self->_delegate;
  self->_delegate = v4;

}

- (void)setManager:(id)a3
{
  id v5;
  SBSceneManager *WeakRetained;
  SBSceneManager *manager;
  void *v8;
  void *v9;
  void *v10;
  id obj;

  obj = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference setManager:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBSceneManagerReference.m"), 148, CFSTR("this call must be made on the main thread"));

  }
  -[SBSceneManagerReference manager](self, "manager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != obj)
  {
    if (obj && self->_invalidated)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerReference.m"), 151, CFSTR("you can't set the manager if the reference has been invalidated : manager=%@"), obj);

    }
    -[SBSceneManagerReference _autoreleaseManager:](self, "_autoreleaseManager:", v5);
    -[SBSceneManagerReference _autoreleaseManager:](self, "_autoreleaseManager:", obj);
    objc_storeWeak((id *)&self->_weak_manager, obj);
    if (-[SBSceneManagerReference isRetaining](self, "isRetaining"))
    {
      WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
      manager = self->_manager;
      self->_manager = WeakRetained;

    }
    self->_managerWasValid = obj != 0;
  }

}

- (void)setDisplayIsConnected:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference setDisplayIsConnected:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBSceneManagerReference.m"), 173, CFSTR("this call must be made on the main thread"));

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBSceneManagerReference_setDisplayIsConnected___block_invoke;
  v7[3] = &unk_1E8E9F508;
  v7[4] = self;
  v8 = a3;
  -[SBSceneManagerReference _updateRetainWithBlock:](self, "_updateRetainWithBlock:", v7);
}

uint64_t __49__SBSceneManagerReference_setDisplayIsConnected___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 41) = *(_BYTE *)(result + 40);
  return result;
}

- (void)releaseForScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference releaseForScene:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBSceneManagerReference.m"), 195, CFSTR("this call must be made on the main thread"));

  }
  v4 = v7;
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__SBSceneManagerReference_releaseForScene___block_invoke;
    v8[3] = &unk_1E8E9E820;
    v8[4] = self;
    v9 = v7;
    -[SBSceneManagerReference _updateRetainWithBlock:](self, "_updateRetainWithBlock:", v8);

    v4 = v7;
  }

}

uint64_t __43__SBSceneManagerReference_releaseForScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  SBSceneManager *WeakRetained;
  SBSceneManager *manager;
  void *v6;
  void *v7;
  SBSceneManager *v8;
  void *v9;
  void *v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSceneManagerReference invalidate]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("SBSceneManagerReference.m"), 204, CFSTR("this call must be made on the main thread"));

  }
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_manager)
    {
      WeakRetained = (SBSceneManager *)objc_loadWeakRetained((id *)&self->_weak_manager);
      manager = self->_manager;

      if (WeakRetained != manager)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneManagerReference.m"), 207, CFSTR("we were trying to retain manager but it went away anyway : manager=%@"), self->_manager);

      }
    }
    -[SBSceneManagerReference manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneManagerReference _autoreleaseManager:](self, "_autoreleaseManager:", v7);

    v8 = self->_manager;
    self->_manager = 0;

    -[SBSceneManagerReferenceDelegate sceneManagerDidInvalidateForReference:](self->_delegate, "sceneManagerDidInvalidateForReference:", self);
  }
}

- (void)setDisplayIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_displayIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainingScenes, 0);
  objc_destroyWeak((id *)&self->_weak_manager);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

- (void)_autoreleaseManager:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, MEMORY[0x1E0C81028], a3, "delaying release of %@", a5, a6, a7, a8, 2u);
}

void __47__SBSceneManagerReference__autoreleaseManager___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, MEMORY[0x1E0C81028], a3, "performing delayed release of %@", a5, a6, a7, a8, 2u);
}

@end
