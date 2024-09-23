@implementation SBInProcessSecureAppAction

- (SBInProcessSecureAppAction)initWithType:(unint64_t)a3 applicationSceneEntity:(id)a4 handler:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  SBInProcessSecureAppAction *v11;
  objc_super v13;

  v7 = a4;
  v8 = *MEMORY[0x1E0DAB7B0];
  v9 = a5;
  SBSIdentifierForSecureAppType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SBInProcessSecureAppAction;
  v11 = -[SBInProcessSecureAppAction initWithType:slot:identifier:configurationObject:handler:](&v13, sel_initWithType_slot_identifier_configurationObject_handler_, 1, v8, v10, 0, v9);

  if (v11)
    -[SBInProcessSecureAppAction setApplicationSceneEntity:](v11, "setApplicationSceneEntity:", v7);

  return v11;
}

- (SBInProcessSecureAppAction)initWithType:(unint64_t)a3 hostableEntity:(id)a4 handler:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  SBInProcessSecureAppAction *v11;
  objc_super v13;

  v7 = a4;
  v8 = *MEMORY[0x1E0DAB7B0];
  v9 = a5;
  SBSIdentifierForSecureAppType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SBInProcessSecureAppAction;
  v11 = -[SBInProcessSecureAppAction initWithType:slot:identifier:configurationObject:handler:](&v13, sel_initWithType_slot_identifier_configurationObject_handler_, 1, v8, v10, 0, v9);

  if (v11)
    -[SBInProcessSecureAppAction setHostableEntity:](v11, "setHostableEntity:", v7);

  return v11;
}

- (BOOL)isInProcessAction
{
  return 1;
}

- (SBApplicationSceneEntity)applicationSceneEntity
{
  return self->_applicationSceneEntity;
}

- (void)setApplicationSceneEntity:(id)a3
{
  objc_storeStrong((id *)&self->_applicationSceneEntity, a3);
}

- (CSHostableEntity)hostableEntity
{
  return self->_hostableEntity;
}

- (void)setHostableEntity:(id)a3
{
  objc_storeStrong((id *)&self->_hostableEntity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostableEntity, 0);
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
}

@end
