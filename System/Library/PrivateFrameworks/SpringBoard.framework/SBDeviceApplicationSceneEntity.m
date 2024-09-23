@implementation SBDeviceApplicationSceneEntity

- (BOOL)isDeviceApplicationSceneEntity
{
  return 1;
}

- (BOOL)supportsSplitView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[SBApplicationSceneEntity sceneHandle](self, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationSceneEntity application](self, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "windowManagementStyle");
  objc_msgSend(v5, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v6, "supportsMultiWindowLayoutsForSwitcherWindowManagementStyle:displayIdentity:", v7, v8);

  return v7;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  _BOOL4 v5;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneEntity;
  if (-[SBApplicationSceneEntity _supportsLayoutRole:](&v8, sel__supportsLayoutRole_)
    || -[SBDeviceApplicationSceneEntity supportsPresentationAtAnySize](self, "supportsPresentationAtAnySize"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[SBDeviceApplicationSceneEntity supportsSplitView](self, "supportsSplitView");
    if (v5)
      LOBYTE(v5) = a3 == 2 || a3 == 1;
  }
  return v5;
}

- (BOOL)supportsPresentationAtAnySize
{
  void *v2;
  char v3;

  -[SBApplicationSceneEntity application](self, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMedusaCapable");

  return v3;
}

- (BOOL)wantsExclusiveForeground
{
  void *v2;
  void *v3;
  char v4;

  -[SBApplicationSceneEntity application](self, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsExclusiveForeground");

  return v4;
}

- (Class)viewControllerClass
{
  return (Class)objc_opt_class();
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 generatingNewPrimarySceneIfRequired:(BOOL)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBApplicationSceneHandleRequest *v21;
  void *v22;
  SBDeviceApplicationSceneEntity *v23;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  +[SBApplicationSceneHandleRequest defaultSceneSpecificationForDisplayIdentity:](SBApplicationSceneHandleRequest, "defaultSceneSpecificationForDisplayIdentity:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uiSceneSessionRole");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneIdentityForApplication:createPrimaryIfRequired:sceneSessionRole:", v12, v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0D23140]);
  objc_msgSend(v16, "setIdentity:", v15);
  v17 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(v12, "info");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "processIdentity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identityForProcessIdentity:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClientIdentity:", v20);

  objc_msgSend(v16, "setSpecification:", v13);
  v21 = -[SBApplicationSceneHandleRequest initWithApplication:sceneDefinition:displayIdentity:]([SBApplicationSceneHandleRequest alloc], "initWithApplication:sceneDefinition:displayIdentity:", v12, v16, v10);

  objc_msgSend(v11, "fetchOrCreateApplicationSceneHandleForRequest:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:](self, "initWithApplicationSceneHandle:", v22);
  return v23;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationSceneHandle:(id)a3
{
  id v5;
  SBDeviceApplicationSceneEntity *v6;
  void *v8;
  objc_class *v9;
  void *v10;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneEntity.m"), 111, CFSTR("Scene handle expected type SBDeviceApplicationSceneHandle, but it was %@."), v10);

    }
    self = (SBDeviceApplicationSceneEntity *)-[SBApplicationSceneEntity _initWithSceneHandle:](self, "_initWithSceneHandle:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBDeviceApplicationSceneEntity *v7;

  v4 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDeviceApplicationSceneEntity initWithApplication:sceneHandleProvider:displayIdentity:](self, "initWithApplication:sceneHandleProvider:displayIdentity:", v4, v5, v6);

  return v7;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 uniqueIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  SBDeviceApplicationSceneEntity *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "info");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsMultiwindow");

  if ((v15 & 1) == 0)
  {

    v11 = 0;
  }
  v16 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:targetContentIdentifier:sceneHandleProvider:displayIdentity:](self, "initWithApplication:uniqueIdentifier:targetContentIdentifier:sceneHandleProvider:displayIdentity:", v10, v11, 0, v12, v13);

  return v16;
}

+ (id)defaultEntityWithApplication:(id)a3 targetContentIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithApplication:targetContentIdentifier:sceneHandleProvider:displayIdentity:", v13, v12, v11, v10);

  return v14;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 uniqueIdentifier:(id)a4 targetContentIdentifier:(id)a5 sceneHandleProvider:(id)a6 displayIdentity:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  SBDeviceApplicationSceneEntity *v24;
  void *v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneEntity.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandleProvider"));

    }
    objc_msgSend(v13, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "supportsMultiwindow"))
      v19 = v14;
    else
      v19 = 0;
    v20 = v19;

    objc_msgSend(v16, "sceneIdentityForApplication:uniqueIdentifier:targetContentIdentifier:", v13, v20, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v13, v21, v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "fetchOrCreateApplicationSceneHandleForRequest:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:](self, "initWithApplicationSceneHandle:", v23);

    v14 = v20;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 targetContentIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  return -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:targetContentIdentifier:sceneHandleProvider:displayIdentity:](self, "initWithApplication:uniqueIdentifier:targetContentIdentifier:sceneHandleProvider:displayIdentity:", a3, 0, a4, a5, a6);
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  return -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](self, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", a3, 0, a4, a5);
}

+ (id)defaultEntityWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  return (id)objc_msgSend(a1, "entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:", a3, 0, a4, a5);
}

+ (SBDeviceApplicationSceneEntity)entityWithApplication:(id)a3 scenePersistenceIdentifier:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (a4)
  {
    v13 = a4;
    v14 = objc_opt_class();
    v15 = v11;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    objc_msgSend(v17, "existingSceneHandleForPersistenceIdentifier:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "sceneIdentifier");
    a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v10, a4, v11, v12);

  return (SBDeviceApplicationSceneEntity *)v19;
}

+ (id)newEntityWithApplication:(id)a3 sceneHandleProvider:(id)a4 displayIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(v9, "newSceneIdentityForApplication:", v10);
  v12 = objc_alloc((Class)a1);
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithApplication:uniqueIdentifier:targetContentIdentifier:sceneHandleProvider:displayIdentity:", v10, v13, 0, v9, v8);

  return v14;
}

- (SBDeviceApplicationSceneEntity)initWithApplication:(id)a3 generatingNewSceneIfRequiredWithSpecification:(id)a4 sceneHandleProvider:(id)a5 displayIdentity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBApplicationSceneHandleRequest *v21;
  void *v22;
  SBDeviceApplicationSceneEntity *v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "uiSceneSessionRole");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sceneIdentityForApplication:createPrimaryIfRequired:sceneSessionRole:", v13, 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0D23140]);
  objc_msgSend(v16, "setIdentity:", v15);
  v17 = (void *)MEMORY[0x1E0D231C0];
  objc_msgSend(v13, "info");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "processIdentity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identityForProcessIdentity:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClientIdentity:", v20);

  objc_msgSend(v16, "setSpecification:", v12);
  v21 = -[SBApplicationSceneHandleRequest initWithApplication:sceneDefinition:displayIdentity:]([SBApplicationSceneHandleRequest alloc], "initWithApplication:sceneDefinition:displayIdentity:", v13, v16, v10);

  objc_msgSend(v11, "fetchOrCreateApplicationSceneHandleForRequest:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:](self, "initWithApplicationSceneHandle:", v22);
  return v23;
}

+ (id)defaultEntityWithApplicationForMainDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultEntityWithApplication:sceneHandleProvider:displayIdentity:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultEntityWithApplicationForMainDisplay:(id)a3 targetContentIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultEntityWithApplication:targetContentIdentifier:sceneHandleProvider:displayIdentity:", v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (SBDeviceApplicationSceneEntity)entityWithApplicationForMainDisplay:(id)a3 withScenePersistenceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:", v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBDeviceApplicationSceneEntity *)v10;
}

+ (id)newEntityWithApplicationForMainDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(a1, "newEntityWithApplication:sceneHandleProvider:displayIdentity:", v4, v5, v6);

  return v7;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 generatingNewPrimarySceneIfRequired:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  SBDeviceApplicationSceneEntity *v9;

  v4 = a4;
  v6 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBDeviceApplicationSceneEntity initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:](self, "initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:", v6, v4, v7, v8);

  return v9;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 generatingNewSceneIfRequiredWithSpecification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SBDeviceApplicationSceneEntity *v10;

  v6 = a4;
  v7 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBDeviceApplicationSceneEntity initWithApplication:generatingNewSceneIfRequiredWithSpecification:sceneHandleProvider:displayIdentity:](self, "initWithApplication:generatingNewSceneIfRequiredWithSpecification:sceneHandleProvider:displayIdentity:", v7, v6, v8, v9);

  return v10;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 targetContentIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SBDeviceApplicationSceneEntity *v10;

  v6 = a4;
  v7 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBDeviceApplicationSceneEntity initWithApplication:targetContentIdentifier:sceneHandleProvider:displayIdentity:](self, "initWithApplication:targetContentIdentifier:sceneHandleProvider:displayIdentity:", v7, v6, v8, v9);

  return v10;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainDisplay:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SBDeviceApplicationSceneEntity *v10;

  v6 = a4;
  v7 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](self, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v7, v6, v8, v9);

  return v10;
}

- (SBDeviceApplicationSceneEntity)initWithApplicationForMainSecureDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBDeviceApplicationSceneEntity *v7;

  v4 = a3;
  +[SBSceneManagerCoordinator secureMainDisplaySceneManager](SBSceneManagerCoordinator, "secureMainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:targetContentIdentifier:sceneHandleProvider:displayIdentity:](self, "initWithApplication:uniqueIdentifier:targetContentIdentifier:sceneHandleProvider:displayIdentity:", v4, 0, 0, v5, v6);

  return v7;
}

@end
