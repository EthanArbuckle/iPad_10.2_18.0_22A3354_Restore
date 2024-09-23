@implementation SBSUserNotificationAssetDefinition

+ (id)_definitionFromSerializedDefinition:(id)a3
{
  id v3;
  void *v4;
  __objc2_class **v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("SBSCFUNAssetDefinitionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v5 = off_1E288A7A0;
  +[SBSUserNotificationImageAssetDefinition _definitionType](SBSUserNotificationImageAssetDefinition, "_definitionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_5;
  v5 = off_1E288A7B0;
  +[SBSUserNotificationSystemImageDefinition _definitionType](SBSUserNotificationSystemImageDefinition, "_definitionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v9 & 1) != 0
    || (v5 = off_1E288A790,
        +[SBSUserNotificationCAPackageDefinition _definitionType](SBSUserNotificationCAPackageDefinition, "_definitionType"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v4, "isEqualToString:", v10), v10, v11))
  {
LABEL_5:
    v12 = (void *)objc_msgSend(objc_alloc(*v5), "_initWithDictionary:", v3);
  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

+ (NSString)_definitionType
{
  return 0;
}

- (id)_initWithDictionary:(id)a3
{
  id v5;
  SBSUserNotificationAssetDefinition *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationAssetDefinition.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[SBSUserNotificationAssetDefinition init](self, "init");
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)build
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend((id)objc_opt_class(), "_definitionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, CFSTR("SBSCFUNAssetDefinitionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
