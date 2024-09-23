@implementation SBSLockScreenContentAction

- (SBSLockScreenContentAction)initWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SBSLockScreenContentAction *v22;
  objc_super v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x1E0D017D0];
  v16 = a4;
  v17 = objc_alloc_init(v15);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v18, 1);

  objc_msgSend(v17, "setObject:forSetting:", v16, 2);
  objc_msgSend(v17, "setObject:forSetting:", v12, 3);
  LODWORD(v18) = objc_msgSend(v16, "isEqualToString:", CFSTR("App"));

  if ((_DWORD)v18)
    v19 = SBSSecureAppTypeForIdentifier(v12);
  else
    v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forSetting:", v20, 4);

  if (v13)
    objc_msgSend(v17, "setObject:forSetting:", v13, 5);
  dispatch_get_global_queue(25, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)SBSLockScreenContentAction;
  v22 = -[SBSLockScreenContentAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v24, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v17, v21, v14, 0.0);

  return v22;
}

- (unint64_t)type
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SBSLockScreenContentAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

- (NSString)slot
{
  void *v2;
  void *v3;

  -[SBSLockScreenContentAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[SBSLockScreenContentAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)secureAppType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SBSLockScreenContentAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

- (id)configurationObject
{
  void *v2;
  void *v3;

  -[SBSLockScreenContentAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)automaticallyInvalidatesOnSecureAppUserDismissal
{
  return -[SBSLockScreenContentAction secureAppType](self, "secureAppType") == 12;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setSlot:(id)a3
{
  objc_storeStrong((id *)&self->_slot, a3);
}

- (void)setSecureAppType:(unint64_t)a3
{
  self->_secureAppType = a3;
}

- (void)setConfigurationObject:(id)a3
{
  objc_storeStrong(&self->_configurationObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationObject, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

@end
