@implementation SBApplicationSceneHandleRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneDefinition, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_existingScene, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

- (FBSSceneDefinition)sceneDefinition
{
  return self->_sceneDefinition;
}

- (SBApplication)application
{
  return self->_application;
}

+ (id)defaultRequestForApplication:(id)a3 sceneIdentity:(id)a4 displayIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "defaultSceneSpecificationForDisplayIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_dataStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sceneStoreForIdentifier:creatingIfNecessary:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("sceneSessionRole"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CEBB58]))
    {
      objc_msgSend(MEMORY[0x1E0CEA8F0], "specification");
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v17;
    }

  }
  v18 = objc_alloc_init(MEMORY[0x1E0D23140]);
  objc_msgSend(v18, "setIdentity:", v9);
  v19 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(v8, "info");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "processIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identityForProcessIdentity:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClientIdentity:", v22);

  objc_msgSend(v18, "setSpecification:", v11);
  v23 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithApplication:sceneDefinition:displayIdentity:", v8, v18, v10);

  return v23;
}

- (SBApplicationSceneHandleRequest)initWithApplication:(id)a3 sceneDefinition:(id)a4 displayIdentity:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBApplicationSceneHandleRequest *v12;
  SBApplicationSceneHandleRequest *v13;
  uint64_t v14;
  FBSSceneDefinition *sceneDefinition;
  uint64_t v16;
  FBSDisplayIdentity *displayIdentity;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBApplicationSceneHandleRequest;
  v12 = -[SBApplicationSceneHandleRequest init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    v14 = objc_msgSend(v10, "copy");
    sceneDefinition = v13->_sceneDefinition;
    v13->_sceneDefinition = (FBSSceneDefinition *)v14;

    v16 = objc_msgSend(v11, "copy");
    displayIdentity = v13->_displayIdentity;
    v13->_displayIdentity = (FBSDisplayIdentity *)v16;

  }
  return v13;
}

+ (id)defaultSceneSpecificationForDisplayIdentity:(id)a3
{
  id v3;
  char v4;
  uint64_t v5;
  id *v6;
  NSObject *v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "expectsSecureRendering");
  v5 = objc_msgSend(v3, "sb_displayWindowingMode");
  if ((v4 & 1) == 0)
  {
    if (v5 != 1)
    {
      if (v5 == 2)
      {
        v6 = (id *)0x1E0CEA310;
        goto LABEL_10;
      }
      SBLogWorkspace();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        _SBFLoggingMethodProem();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = v10;
        v13 = 2114;
        v14 = v3;
        _os_log_error_impl(&dword_1D0540000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] asked for a display we don't really know about. falling back to default spec: %{public}@", (uint8_t *)&v11, 0x16u);

      }
    }
    v6 = (id *)0x1E0CEA348;
    goto LABEL_10;
  }
  v6 = (id *)0x1E0CEA300;
LABEL_10:
  objc_msgSend(*v6, "specification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (FBScene)existingScene
{
  return self->_existingScene;
}

- (void)setExistingScene:(id)a3
{
  objc_storeStrong((id *)&self->_existingScene, a3);
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (void)setDisplayIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_displayIdentity, a3);
}

- (void)setSceneDefinition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
