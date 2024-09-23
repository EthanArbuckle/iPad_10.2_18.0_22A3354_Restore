@implementation UISceneRequestOptions

+ (id)_sceneRequestOptionsForActivatingSceneSession:(id)a3 activationOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(a1, "initialClientSettings:activationOptions:targetSession:", v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)initialClientSettings:(id)a3 activationOptions:(id)a4 targetSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIApplicationSceneRequestBuilder *v11;
  void *v12;
  id v13;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(_UIApplicationSceneRequestBuilder);
  v19 = 0;
  -[_UIApplicationSceneRequestBuilder _optionsWithInitialClientSettings:activationOptions:targetSession:optionsClass:outError:](v11, "_optionsWithInitialClientSettings:activationOptions:targetSession:optionsClass:outError:", v10, v9, v8, a1, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v19;
  if (os_variant_has_internal_diagnostics())
  {
    if (v13)
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
LABEL_12:

        goto LABEL_3;
      }
      objc_msgSend(v13, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "An error was produced while building scene request options but will be ignored because a deprecated factory method was used. Error: %@", buf, 0xCu);
LABEL_11:

      goto LABEL_12;
    }
  }
  else if (v13)
  {
    v17 = initialClientSettings_activationOptions_targetSession____s_category;
    if (!initialClientSettings_activationOptions_targetSession____s_category)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&initialClientSettings_activationOptions_targetSession____s_category);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v15 = v18;
      objc_msgSend(v13, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "An error was produced while building scene request options but will be ignored because a deprecated factory method was used. Error: %@", buf, 0xCu);
      goto LABEL_11;
    }
  }
LABEL_3:

  return v12;
}

@end
