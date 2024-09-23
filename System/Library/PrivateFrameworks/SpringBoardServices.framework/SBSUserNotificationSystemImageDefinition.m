@implementation SBSUserNotificationSystemImageDefinition

+ (id)_definitionType
{
  return CFSTR("systemImage");
}

- (SBSUserNotificationSystemImageDefinition)initWithSystemImageName:(id)a3
{
  return (SBSUserNotificationSystemImageDefinition *)-[SBSUserNotificationSystemImageDefinition _initWithSystemImageName:tintColor:](self, "_initWithSystemImageName:tintColor:", a3, 0);
}

- (id)_initWithSystemImageName:(id)a3 tintColor:(id)a4
{
  id v8;
  id v9;
  SBSUserNotificationSystemImageDefinition *v10;
  id *p_isa;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSCFUserNotificationSystemImageDefinition.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemImageName"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBSUserNotificationSystemImageDefinition;
  v10 = -[SBSUserNotificationSystemImageDefinition init](&v14, sel_init);
  p_isa = (id *)&v10->super.super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_systemImageName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)_initWithDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSUserNotificationSystemImageDefinition;
  v5 = -[SBSUserNotificationAssetDefinition _initWithDictionary:](&v12, sel__initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SBSCFUNSystemImageName"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[1];
    v5[1] = v6;

    objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("SBSCFUNTintColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[SBSUserNotificationColorDefinition _initWithDictionary:]([SBSUserNotificationColorDefinition alloc], "_initWithDictionary:", v8);
      v10 = (void *)v5[2];
      v5[2] = v9;

    }
  }

  return v5;
}

- (id)build
{
  void *v3;
  void *v4;
  NSString *systemImageName;
  SBSUserNotificationColorDefinition *tintColor;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSUserNotificationSystemImageDefinition;
  -[SBSUserNotificationAssetDefinition build](&v10, sel_build);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  systemImageName = self->_systemImageName;
  if (systemImageName)
    objc_msgSend(v4, "setObject:forKey:", systemImageName, CFSTR("SBSCFUNSystemImageName"));
  tintColor = self->_tintColor;
  if (tintColor)
  {
    -[SBSUserNotificationColorDefinition build](tintColor, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("SBSCFUNTintColor"));

  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (SBSUserNotificationColorDefinition)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

@end
