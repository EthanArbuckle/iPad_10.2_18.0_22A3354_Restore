@implementation SUSUIAuthenticationAlertAction

- (SUSUIAuthenticationAlertAction)initWithDescriptor:(id)a3 autoInstallForecast:(id)a4 forInstallTonight:(BOOL)a5 canDeferInstallation:(BOOL)a6 completionQueue:(id)a7 completionBlock:(id)a8
{
  SUSUIAuthenticationAlertAction *v9;
  id v10;
  SUSUIAuthenticationAlertAction *v11;
  id v12;
  objc_super v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(_QWORD *, void *);
  void *v23;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  BOOL v33;
  id v34;
  id location[2];
  SUSUIAuthenticationAlertAction *v36;

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = a5;
  v32 = a6;
  v31 = 0;
  objc_storeStrong(&v31, a7);
  v30 = 0;
  objc_storeStrong(&v30, a8);
  v36->_alertType = 0;
  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  if (location[0])
    objc_msgSend(v29, "encodeObject:forKey:", location[0], CFSTR("_susDescriptor"));
  if (v34)
    objc_msgSend(v29, "encodeObject:forKey:", v34, CFSTR("_susAutoInstallForecast"));
  objc_msgSend(v29, "encodeBool:forKey:", v33, CFSTR("_susForInstallTonight"));
  objc_msgSend(v29, "encodeBool:forKey:", v32, CFSTR("_susCanDeferInstallation"));
  objc_msgSend(v29, "encodeInteger:forKey:", v36->_alertType, CFSTR("_susAlertType"));
  v28 = (id)objc_msgSend(v29, "encodedData");
  v27 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v27, "setObject:forSetting:", v28, SUSUIAuthenticationAlertActionInput);
  objc_msgSend(v27, "setObject:forSetting:", CFSTR("SUSUIAuthenticationAlertAction"), SUSUIAuthenticationAlertActionInputType);
  v11 = v36;
  v12 = v27;
  v25 = 0;
  if (v31)
  {
    v10 = v31;
  }
  else
  {
    v26 = MEMORY[0x24BDAC9B8];
    v25 = 1;
    v10 = v26;
  }
  v19 = MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __144__SUSUIAuthenticationAlertAction_initWithDescriptor_autoInstallForecast_forInstallTonight_canDeferInstallation_completionQueue_completionBlock___block_invoke;
  v23 = &unk_24DA407C0;
  v24 = v30;
  v36 = 0;
  v18.receiver = v11;
  v18.super_class = (Class)SUSUIAuthenticationAlertAction;
  v36 = -[SUSUIAuthenticationAlertAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v18, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v12, v10, &v19, 0.0);
  objc_storeStrong((id *)&v36, v36);
  if ((v25 & 1) != 0)

  objc_storeStrong((id *)&v36->_baseAction, 0);
  v36->_loaded = 1;
  v9 = v36;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v36, 0);
  return v9;
}

void __144__SUSUIAuthenticationAlertAction_initWithDescriptor_autoInstallForecast_forInstallTonight_canDeferInstallation_completionQueue_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  const __CFString *v2;
  id v4;
  char IsYes;
  os_log_t oslog;
  char v7;
  _QWORD *v8;
  id location[2];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = a1;
  v4 = (id)objc_msgSend(location[0], "info");
  objc_msgSend(v4, "flagForSetting:", SUSUIAuthenticationAlertActionOutputSuccess);
  IsYes = BSSettingFlagIsYes();

  v7 = IsYes & 1;
  oslog = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if ((v7 & 1) != 0)
      v2 = CFSTR("YES");
    else
      v2 = CFSTR("NO");
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v2);
    _os_log_impl(&dword_218F45000, oslog, OS_LOG_TYPE_DEFAULT, "SUSUIAuthenticationAlertAction got response:%@", v10, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (SUSUIAuthenticationAlertAction)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4 completionQueue:(id)a5 completionBlock:(id)a6
{
  SUSUIAuthenticationAlertAction *v7;
  id v8;
  SUSUIAuthenticationAlertAction *v9;
  id v10;
  objc_super v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(_QWORD *, void *);
  void *v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  id location[2];
  SUSUIAuthenticationAlertAction *v30;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = 0;
  objc_storeStrong(&v26, a6);
  v30->_alertType = 1;
  v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  if (location[0])
    objc_msgSend(v25, "encodeObject:forKey:", location[0], CFSTR("_susRollbackDescriptor"));
  objc_msgSend(v25, "encodeBool:forKey:", v28, CFSTR("_susCanDeferInstallation"));
  objc_msgSend(v25, "encodeInteger:forKey:", v30->_alertType, CFSTR("_susAlertType"));
  v24 = (id)objc_msgSend(v25, "encodedData");
  v23 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v23, "setObject:forSetting:", v24, SUSUIAuthenticationAlertActionInput);
  objc_msgSend(v23, "setObject:forSetting:", CFSTR("SUSUIAuthenticationAlertAction"), SUSUIAuthenticationAlertActionInputType);
  v9 = v30;
  v10 = v23;
  v21 = 0;
  if (v27)
  {
    v8 = v27;
  }
  else
  {
    v22 = MEMORY[0x24BDAC9B8];
    v21 = 1;
    v8 = v22;
  }
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __114__SUSUIAuthenticationAlertAction_initWithRollbackDescriptor_canDeferInstallation_completionQueue_completionBlock___block_invoke;
  v19 = &unk_24DA407C0;
  v20 = v26;
  v30 = 0;
  v14.receiver = v9;
  v14.super_class = (Class)SUSUIAuthenticationAlertAction;
  v30 = -[SUSUIAuthenticationAlertAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v14, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v10, v8, &v15, 0.0);
  objc_storeStrong((id *)&v30, v30);
  if ((v21 & 1) != 0)

  objc_storeStrong((id *)&v30->_baseAction, 0);
  v30->_loaded = 1;
  v7 = v30;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v30, 0);
  return v7;
}

void __114__SUSUIAuthenticationAlertAction_initWithRollbackDescriptor_canDeferInstallation_completionQueue_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  const __CFString *v2;
  id v4;
  char IsYes;
  os_log_t oslog;
  char v7;
  _QWORD *v8;
  id location[2];
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = a1;
  v4 = (id)objc_msgSend(location[0], "info");
  objc_msgSend(v4, "flagForSetting:", SUSUIAuthenticationAlertActionOutputSuccess);
  IsYes = BSSettingFlagIsYes();

  v7 = IsYes & 1;
  oslog = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if ((v7 & 1) != 0)
      v2 = CFSTR("YES");
    else
      v2 = CFSTR("NO");
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v2);
    _os_log_impl(&dword_218F45000, oslog, OS_LOG_TYPE_DEFAULT, "SUSUIAuthenticationAlertAction got response:%@", v10, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (SUSUIAuthenticationAlertAction)initWithInfo:(id)a3 forBaseAction:(id)a4
{
  id v4;
  objc_super v7;
  int v8;
  id v9;
  id v10;
  id location[2];
  id v12;
  SUSUIAuthenticationAlertAction *v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = (id)objc_msgSend(location[0], "objectForSetting:", SUSUIAuthenticationAlertActionInputType);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("SUSUIAuthenticationAlertAction")) & 1) != 0)
  {
    v4 = v12;
    v12 = 0;
    v7.receiver = v4;
    v7.super_class = (Class)SUSUIAuthenticationAlertAction;
    v12 = -[SUSUIAuthenticationAlertAction initWithInfo:responder:](&v7, sel_initWithInfo_responder_, location[0], 0);
    objc_storeStrong(&v12, v12);
    if (v12)
    {
      objc_msgSend(v12, "setBaseAction:", v10);
      *((_BYTE *)v12 + 32) = 0;
    }
    v13 = (SUSUIAuthenticationAlertAction *)v12;
    v8 = 1;
  }
  else
  {
    v13 = 0;
    v8 = 1;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v13;
}

- (SUDescriptor)descriptor
{
  -[SUSUIAuthenticationAlertAction _loadIfNecessary](self, "_loadIfNecessary", a2);
  return self->_descriptor;
}

- (SURollbackDescriptor)rollbackDescriptor
{
  -[SUSUIAuthenticationAlertAction _loadIfNecessary](self, "_loadIfNecessary", a2);
  return self->_rollbackDescriptor;
}

- (SUAutoInstallForecast)autoInstallForecast
{
  -[SUSUIAuthenticationAlertAction _loadIfNecessary](self, "_loadIfNecessary", a2);
  return self->_autoInstallForecast;
}

- (BOOL)forInstallTonight
{
  -[SUSUIAuthenticationAlertAction _loadIfNecessary](self, "_loadIfNecessary", a2);
  return self->_forInstallTonight;
}

- (BOOL)canDeferInstallation
{
  -[SUSUIAuthenticationAlertAction _loadIfNecessary](self, "_loadIfNecessary", a2);
  return self->_canDeferInstallation;
}

- (unint64_t)alertType
{
  -[SUSUIAuthenticationAlertAction _loadIfNecessary](self, "_loadIfNecessary", a2);
  return self->_alertType;
}

- (void)fireCompletionIfNecessaryForResult:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id location;
  BOOL v7;
  SEL v8;
  SUSUIAuthenticationAlertAction *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  location = self;
  if (v9->_baseAction)
    objc_storeStrong(&location, v9->_baseAction);
  if ((objc_msgSend(location, "canSendResponse") & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE0BE40]);
    objc_msgSend(v5, "setFlag:forSetting:", BSSettingFlagForBool(), SUSUIAuthenticationAlertActionOutputSuccess);
    v3 = location;
    v4 = (id)objc_msgSend(MEMORY[0x24BE0BD90], "responseWithInfo:", v5);
    objc_msgSend(v3, "sendResponse:");

    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)_loadIfNecessary
{
  id v2;
  SUDescriptor *v3;
  SUDescriptor *descriptor;
  SURollbackDescriptor *v5;
  SURollbackDescriptor *rollbackDescriptor;
  SUAutoInstallForecast *v7;
  SUAutoInstallForecast *autoInstallForecast;
  char v9;
  char v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14[2];
  SUSUIAuthenticationAlertAction *v15;

  v15 = self;
  v14[1] = (id)a2;
  if (!self->_loaded)
  {
    v12 = (id)-[SUSUIAuthenticationAlertAction info](v15, "info");
    v14[0] = (id)objc_msgSend(v12, "objectForSetting:", SUSUIAuthenticationAlertActionInput);

    v2 = objc_alloc(MEMORY[0x24BDD1620]);
    v13 = (id)objc_msgSend(v2, "initForReadingFromData:error:", v14[0]);
    v3 = (SUDescriptor *)(id)objc_msgSend(v13, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_susDescriptor"));
    descriptor = v15->_descriptor;
    v15->_descriptor = v3;

    v5 = (SURollbackDescriptor *)(id)objc_msgSend(v13, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_susRollbackDescriptor"));
    rollbackDescriptor = v15->_rollbackDescriptor;
    v15->_rollbackDescriptor = v5;

    v7 = (SUAutoInstallForecast *)(id)objc_msgSend(v13, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_susAutoInstallForecast"));
    autoInstallForecast = v15->_autoInstallForecast;
    v15->_autoInstallForecast = v7;

    v9 = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("_susForInstallTonight"));
    v15->_forInstallTonight = v9 & 1;
    v10 = objc_msgSend(v13, "decodeBoolForKey:", CFSTR("_susCanDeferInstallation"));
    v15->_canDeferInstallation = v10 & 1;
    v11 = objc_msgSend(v13, "decodeIntegerForKey:", CFSTR("_susAlertType"));
    v15->_alertType = v11;
    objc_msgSend(v13, "finishDecoding");
    v15->_loaded = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
  }
}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

- (BSAction)baseAction
{
  return self->_baseAction;
}

- (void)setBaseAction:(id)a3
{
  objc_storeStrong((id *)&self->_baseAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseAction, 0);
  objc_storeStrong((id *)&self->_autoInstallForecast, 0);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
