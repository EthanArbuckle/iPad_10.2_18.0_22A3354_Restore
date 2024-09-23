@implementation SBSUserNotificationCAPackageDefinition

+ (id)_definitionType
{
  return CFSTR("caPackageAsset");
}

+ (id)definitionWithCAPackagePath:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[SBSUserNotificationCAPackageDefinition _initWithCAPackagePath:]([SBSUserNotificationCAPackageDefinition alloc], "_initWithCAPackagePath:", v3);

  return v4;
}

- (id)_initWithCAPackagePath:(id)a3
{
  id v6;
  SBSUserNotificationCAPackageDefinition *v7;
  SBSUserNotificationCAPackageDefinition *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationCAPackageDefinition.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("caPackagePath"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBSUserNotificationCAPackageDefinition;
  v7 = -[SBSUserNotificationCAPackageDefinition init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_caPackagePath, a3);

  return v8;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSUserNotificationCAPackageDefinition;
  v5 = -[SBSUserNotificationAssetDefinition _initWithDictionary:](&v9, sel__initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SBSCFCAPackagePath"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (id)build
{
  void *v3;
  void *v4;
  NSString *caPackagePath;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSUserNotificationCAPackageDefinition;
  -[SBSUserNotificationAssetDefinition build](&v8, sel_build);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  caPackagePath = self->_caPackagePath;
  if (caPackagePath)
    objc_msgSend(v4, "setObject:forKey:", caPackagePath, CFSTR("SBSCFCAPackagePath"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (NSString)caPackagePath
{
  return self->_caPackagePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caPackagePath, 0);
}

@end
