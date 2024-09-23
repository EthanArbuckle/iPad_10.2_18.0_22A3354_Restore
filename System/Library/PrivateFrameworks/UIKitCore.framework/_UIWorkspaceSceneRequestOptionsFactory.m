@implementation _UIWorkspaceSceneRequestOptionsFactory

+ (id)sharedFactory
{
  if (_MergedGlobals_1182 != -1)
    dispatch_once(&_MergedGlobals_1182, &__block_literal_global_431);
  return (id)qword_1ECD7F6E0;
}

+ (id)_defaultBuilderProviders
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_createDefaultBuilders
{
  id v3;
  _UIApplicationSceneRequestBuilder *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v20 = CFSTR("UIWindowSceneSessionRoleApplication");
  v4 = objc_alloc_init(_UIApplicationSceneRequestBuilder);
  v21[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDictionary:", v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "_defaultBuilderProviders", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "createDefaultBuilders");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addEntriesFromDictionary:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

- (id)_init
{
  _UIWorkspaceSceneRequestOptionsFactory *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *buildersByRole;
  uint64_t v5;
  NSDictionary *defaultBuildersByRole;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIWorkspaceSceneRequestOptionsFactory;
  v2 = -[_UIWorkspaceSceneRequestOptionsFactory init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    buildersByRole = v2->_buildersByRole;
    v2->_buildersByRole = v3;

    +[_UIWorkspaceSceneRequestOptionsFactory _createDefaultBuilders](_UIWorkspaceSceneRequestOptionsFactory, "_createDefaultBuilders");
    v5 = objc_claimAutoreleasedReturnValue();
    defaultBuildersByRole = v2->_defaultBuildersByRole;
    v2->_defaultBuildersByRole = (NSDictionary *)v5;

  }
  return v2;
}

- (void)_registerBuilder:(id)a3 forRole:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  _BYTE v18[24];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UIWorkspaceSceneRequestOptionsFactory buildersByRole](self, "buildersByRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = qword_1ECD7F6E8;
    if (!qword_1ECD7F6E8)
    {
      v10 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD7F6E8);
    }
    if ((*(_BYTE *)v10 & 1) != 0)
    {
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 138412802;
        *(_QWORD *)&v18[4] = v7;
        *(_WORD *)&v18[12] = 2112;
        *(_QWORD *)&v18[14] = v9;
        *(_WORD *)&v18[22] = 2112;
        v19 = v6;
        v12 = "Replacing existing builder for role \"%@\". existing=%@, new=%@";
        v13 = v11;
        v14 = 32;
LABEL_13:
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, v12, v18, v14);
      }
    }
  }
  else
  {
    v15 = qword_1ECD7F6F0;
    if (!qword_1ECD7F6F0)
    {
      v15 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7F6F0);
    }
    if ((*(_BYTE *)v15 & 1) != 0)
    {
      v17 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 138412546;
        *(_QWORD *)&v18[4] = v7;
        *(_WORD *)&v18[12] = 2112;
        *(_QWORD *)&v18[14] = v6;
        v12 = "Registering builder for role \"%@\": %@";
        v13 = v17;
        v14 = 22;
        goto LABEL_13;
      }
    }
  }
  -[_UIWorkspaceSceneRequestOptionsFactory buildersByRole](self, "buildersByRole", *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)_effectiveBuilderForRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UIWorkspaceSceneRequestOptionsFactory buildersByRole](self, "buildersByRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[_UIWorkspaceSceneRequestOptionsFactory defaultBuildersByRole](self, "defaultBuildersByRole");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)customEndpointForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIWorkspaceSceneRequestOptionsFactory _effectiveBuilderForRole:](self, "_effectiveBuilderForRole:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "customEndpointForRequest:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)buildWorkspaceRequestOptionsForRequest:(id)a3 withContinuation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "role");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[_UIWorkspaceSceneRequestOptionsFactory _effectiveBuilderForRole:](self, "_effectiveBuilderForRole:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = qword_1ECD7F708;
      if (!qword_1ECD7F708)
      {
        v24 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v24, (unint64_t *)&qword_1ECD7F708);
      }
      if ((*(_BYTE *)v24 & 1) != 0)
      {
        v28 = *(NSObject **)(v24 + 8);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v23;
          v37 = 2112;
          v38 = v6;
          _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Building workspace request options using builder: %@; clientRequest=%@",
            buf,
            0x16u);
        }
      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __98___UIWorkspaceSceneRequestOptionsFactory_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke;
      v31[3] = &unk_1E16DB610;
      v32 = v23;
      v34 = v7;
      v33 = v15;
      objc_msgSend(v32, "buildWorkspaceRequestOptionsForRequest:withContinuation:", v6, v31);

      v25 = v32;
    }
    else
    {
      v27 = qword_1ECD7F700;
      if (!qword_1ECD7F700)
      {
        v27 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&qword_1ECD7F700);
      }
      if ((*(_BYTE *)v27 & 1) != 0)
      {
        v30 = *(NSObject **)(v27 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v15;
          _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_ERROR, "Building workspace request options failed because no builder is registered for scene session role \"%@\".", buf, 0xCu);
        }
      }
      _UISceneErrorForActivationRequestOfInvalidRole((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v25);
    }

  }
  else
  {
    v26 = qword_1ECD7F6F8;
    if (!qword_1ECD7F6F8)
    {
      v26 = __UILogCategoryGetNode("SceneRequestFactory", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v26, (unint64_t *)&qword_1ECD7F6F8);
    }
    if ((*(_BYTE *)v26 & 1) != 0)
    {
      v29 = *(NSObject **)(v26 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Building workspace request options failed because role was nil in client request.", buf, 2u);
      }
    }
    _UISceneErrorForActivationRequestOfInvalidRole((uint64_t)CFSTR("<nil>"), v8, v9, v10, v11, v12, v13, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v23);
  }

}

- (NSMutableDictionary)buildersByRole
{
  return self->_buildersByRole;
}

- (void)setBuildersByRole:(id)a3
{
  objc_storeStrong((id *)&self->_buildersByRole, a3);
}

- (NSDictionary)defaultBuildersByRole
{
  return self->_defaultBuildersByRole;
}

- (void)setDefaultBuildersByRole:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBuildersByRole, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBuildersByRole, 0);
  objc_storeStrong((id *)&self->_buildersByRole, 0);
}

@end
