@implementation WBSManagedExtensionsController

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSManagedExtensionsController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_once != -1)
    dispatch_once(&sharedController_once, block);
  return (id)sharedController_sharedController;
}

void __50__WBSManagedExtensionsController_sharedController__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

+ (NSURL)managedExtensionsConfigurationURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mobileSafariContainerDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Library/Safari"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("SafariExtensionsManagedConfiguration.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (WBSManagedExtensionsController)init
{
  WBSManagedExtensionsController *v2;
  WBSManagedExtensionsController *v3;
  void *v4;
  WBSManagedExtensionsController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSManagedExtensionsController;
  v2 = -[WBSManagedExtensionsController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WBSManagedExtensionsController _readManagedExtensionsStateFromDisk](v2, "_readManagedExtensionsStateFromDisk");
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__managedExtensionConfigurationDidChange_, CFSTR("ManagedExtensionsConfigurationDidChange"), 0);

    v5 = v3;
  }

  return v3;
}

- (int64_t)managedExtensionStateForComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSDictionary safari_dictionaryForKey:](self->_managedExtensionsState, "safari_dictionaryForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("State"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = managedExtensionStateFromString(v5);
  }
  else
  {
    -[NSDictionary safari_dictionaryForKey:](self->_managedExtensionsState, "safari_dictionaryForKey:", CFSTR("*"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("State"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v7 = managedExtensionStateFromString(v9);
    else
      v7 = 0;

  }
  return v7;
}

- (int64_t)managedExtensionPrivateBrowsingStateForComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[NSDictionary safari_dictionaryForKey:](self->_managedExtensionsState, "safari_dictionaryForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("PrivateBrowsing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = managedExtensionStateFromString(v5);
  }
  else
  {
    -[NSDictionary safari_dictionaryForKey:](self->_managedExtensionsState, "safari_dictionaryForKey:", CFSTR("*"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("PrivateBrowsing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v7 = managedExtensionStateFromString(v9);
    else
      v7 = 0;

  }
  return v7;
}

- (id)allowedDomainsForComposedIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSDictionary safari_dictionaryForKey:](self->_managedExtensionsState, "safari_dictionaryForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "safari_arrayForKey:", CFSTR("AllowedDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)deniedDomainsForComposedIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSDictionary safari_dictionaryForKey:](self->_managedExtensionsState, "safari_dictionaryForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "safari_arrayForKey:", CFSTR("DeniedDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_domainIsManaged:(id)a3 byManagedDomainSet:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__WBSManagedExtensionsController__domainIsManaged_byManagedDomainSet___block_invoke;
  v8[3] = &unk_1E649B8A0;
  v9 = v5;
  v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "safari_containsObjectPassingTest:", v8);

  return (char)a4;
}

uint64_t __70__WBSManagedExtensionsController__domainIsManaged_byManagedDomainSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("*")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("*")))
  {
    v4 = 1;
    objc_msgSend(v3, "substringFromIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v6) & 1) == 0)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "hasSuffix:", v8);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)domainIsManaged:(id)a3 forComposedIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v6 = a4;
  v7 = a3;
  -[WBSManagedExtensionsController allowedDomainsForComposedIdentifier:](self, "allowedDomainsForComposedIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  -[WBSManagedExtensionsController deniedDomainsForComposedIdentifier:](self, "deniedDomainsForComposedIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  v15 = -[WBSManagedExtensionsController _domainIsManaged:byManagedDomainSet:](self, "_domainIsManaged:byManagedDomainSet:", v7, v14);

  return v15;
}

- (BOOL)domainIsDenied:(id)a3 forComposedIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WBSManagedExtensionsController deniedDomainsForComposedIdentifier:](self, "deniedDomainsForComposedIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WBSManagedExtensionsController _domainIsManaged:byManagedDomainSet:](self, "_domainIsManaged:byManagedDomainSet:", v6, v7);

  return (char)self;
}

- (BOOL)anyDomainIsManagedForComposedIdentifier:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  -[WBSManagedExtensionsController allowedDomainsForComposedIdentifier:](self, "allowedDomainsForComposedIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 1;
  }
  else
  {
    -[WBSManagedExtensionsController deniedDomainsForComposedIdentifier:](self, "deniedDomainsForComposedIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count") != 0;

  }
  return v6;
}

- (BOOL)allDomainsAreManagedForComposedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  -[WBSManagedExtensionsController allowedDomainsForComposedIdentifier:](self, "allowedDomainsForComposedIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[WBSManagedExtensionsController deniedDomainsForComposedIdentifier:](self, "deniedDomainsForComposedIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  v12 = objc_msgSend(v11, "safari_containsObjectPassingTest:", &__block_literal_global_14);

  return v12;
}

uint64_t __76__WBSManagedExtensionsController_allDomainsAreManagedForComposedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("*"));
}

- (BOOL)hasAnyExtensionManagement
{
  void *v2;
  BOOL v3;

  -[NSDictionary allKeys](self->_managedExtensionsState, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_readManagedExtensionsStateFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *managedExtensionsState;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend((id)objc_opt_class(), "managedExtensionsConfigurationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfURL:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "safari_dictionaryForKey:", CFSTR("ExtensionSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_dictionaryForKey:", CFSTR("Payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_dictionaryForKey:", CFSTR("ManagedExtensions"));
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  managedExtensionsState = self->_managedExtensionsState;
  self->_managedExtensionsState = v7;

}

- (void)_managedExtensionConfigurationDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WBSManagedExtensionsController__managedExtensionConfigurationDidChange___block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__WBSManagedExtensionsController__managedExtensionConfigurationDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_readManagedExtensionsStateFromDisk");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ManagedExtensionsStateDidChange"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedExtensionsState, 0);
}

@end
