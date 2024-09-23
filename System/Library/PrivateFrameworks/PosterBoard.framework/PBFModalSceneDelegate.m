@implementation PBFModalSceneDelegate

- (PBFModalSceneDelegate)init
{
  PBFModalSceneDelegate *v2;
  uint64_t v3;
  NSMapTable *sceneToWindowMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFModalSceneDelegate;
  v2 = -[PBFModalSceneDelegate init](&v6, sel_init);
  if (v2)
  {
    +[PBFModalRootViewController prewarmTopButtonLayout](PBFModalRootViewController, "prewarmTopButtonLayout");
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    sceneToWindowMap = v2->_sceneToWindowMap;
    v2->_sceneToWindowMap = (NSMapTable *)v3;

  }
  return v2;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  PBFModalRootViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  PBFModalRootViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_class();
  v23 = v9;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v23;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14)
  {
    v15 = [PBFModalRootViewController alloc];
    +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance](PBFPosterExtensionDataStoreXPCServiceGlue, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:](v15, "initWithScene:dataStore:behaviorAssertionProvider:", v14, v17, v18);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v14);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v21);

    objc_msgSend(v20, "setRootViewController:", v19);
    objc_msgSend(v20, "makeKeyAndVisible");
    -[NSMapTable setObject:forKey:](self->_sceneToWindowMap, "setObject:forKey:", v20, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("windowScene != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFModalSceneDelegate scene:willConnectToSession:options:].cold.1(a2, (uint64_t)self, (uint64_t)v22);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSMapTable objectForKey:](self->_sceneToWindowMap, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");
    objc_msgSend(v5, "setRootViewController:", 0);
    objc_msgSend(v5, "setHidden:", 1);
    -[NSMapTable removeObjectForKey:](self->_sceneToWindowMap, "removeObjectForKey:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneToWindowMap, 0);
}

- (void)scene:(const char *)a1 willConnectToSession:(uint64_t)a2 options:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PBFModalSceneDelegate.m");
  v16 = 1024;
  v17 = 34;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
