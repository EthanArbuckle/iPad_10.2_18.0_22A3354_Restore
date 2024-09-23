@implementation STPersistenceConfiguration

+ (NSPersistentStoreDescription)localPersistentXPCStoreDescription
{
  return (NSPersistentStoreDescription *)objc_msgSend(a1, "persistentStoreDescriptionForConfigurationName:type:", CFSTR("Local"), *MEMORY[0x1E0C97A70]);
}

+ (NSURL)managedObjectModelURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__STPersistenceConfiguration_managedObjectModelURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (managedObjectModelURL_onceToken != -1)
    dispatch_once(&managedObjectModelURL_onceToken, block);
  return (NSURL *)(id)managedObjectModelURL_managedObjectModelURL;
}

void __51__STPersistenceConfiguration_managedObjectModelURL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("ScreenTime"), CFSTR("momd"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)managedObjectModelURL_managedObjectModelURL;
  managedObjectModelURL_managedObjectModelURL = v1;

}

+ (NSManagedObjectModel)managedObjectModel
{
  if (managedObjectModel_onceToken != -1)
    dispatch_once(&managedObjectModel_onceToken, &__block_literal_global_17);
  return (NSManagedObjectModel *)(id)managedObjectModel_managedObjectModel;
}

void __48__STPersistenceConfiguration_managedObjectModel__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C97B98]);
  +[STPersistenceConfiguration managedObjectModelURL](STPersistenceConfiguration, "managedObjectModelURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithContentsOfURL:", v3);
  v2 = (void *)managedObjectModel_managedObjectModel;
  managedObjectModel_managedObjectModel = v1;

}

+ (id)persistentStoreDescriptionForConfigurationName:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setType:", v7);
  objc_msgSend(v8, "setConfiguration:", v6);
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v8, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97900]);
  objc_msgSend(v8, "setOption:forKey:", v9, *MEMORY[0x1E0C97970]);
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C97A70]))
  {
    objc_msgSend(v8, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A50]);
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(v8, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A40]);
      objc_msgSend(v8, "setOption:forKey:", CFSTR("com.apple.ScreenTimeAgent.persistence"), *MEMORY[0x1E0C97A60]);
    }
    objc_msgSend(v8, "setShouldMigrateStoreAutomatically:", 0);
    objc_msgSend(v8, "setShouldInferMappingModelAutomatically:", 0);
    objc_msgSend(v8, "setShouldAddStoreAsynchronously:", 0);
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C97860]) & 1) == 0)
  {
    objc_msgSend(a1, "persistentStoreURLForConfigurationName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setURL:", v10);

    objc_msgSend(v8, "setShouldMigrateStoreAutomatically:", 1);
    objc_msgSend(v8, "setShouldInferMappingModelAutomatically:", 1);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOption:forKey:", v12, *MEMORY[0x1E0C97918]);

  }
  return v8;
}

+ (id)persistentStoreURLForConfigurationName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("RMAdminStore"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLocations persistentStoreDirectory](STLocations, "persistentStoreDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
