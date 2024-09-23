@implementation SBSLockScreenContentAssertion

+ (id)acquireContentProviderAssertionForType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 errorHandler:(id)a6
{
  return (id)objc_msgSend(a1, "acquireContentProviderAssertionForType:slot:identifier:configurationObject:errorHandler:", a3, a4, a5, 0, a6);
}

+ (id)acquireContentProviderAssertionForType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 errorHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  void *v16;
  void *v17;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *))a7;
  if (objc_msgSend(a1, "_isRestrictedDevice"))
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBSLockScreenContentAssertionErrorDomain"), 3, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v16);

    }
    v17 = 0;
  }
  else
  {
    v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:slot:identifier:configurationObject:errorHandler:", a3, v12, v13, v14, v15);
  }

  return v17;
}

- (SBSLockScreenContentAssertion)initWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6 errorHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SBSLockScreenContentAssertion *v16;
  SBSLockScreenContentAssertion *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SBSLockScreenContentAssertion;
  v16 = -[SBSLockScreenContentAssertion init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[SBSLockScreenContentAssertion _setErrorHandler:](v16, "_setErrorHandler:", v15);
    -[SBSLockScreenContentAssertion setSlot:](v17, "setSlot:", v12);
    -[SBSLockScreenContentAssertion setIdentifier:](v17, "setIdentifier:", v13);
    -[SBSLockScreenContentAssertion setConfigurationObject:](v17, "setConfigurationObject:", v14);
    -[SBSLockScreenContentAssertion _acquireAssertionWithType:slot:identifier:configurationObject:](v17, "_acquireAssertionWithType:slot:identifier:configurationObject:", a3, v12, v13, v14);
  }

  return v17;
}

- (void)dealloc
{
  SBSLockScreenContentAction *action;
  objc_super v4;

  -[SBSLockScreenContentAction invalidate](self->_action, "invalidate");
  action = self->_action;
  self->_action = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBSLockScreenContentAssertion;
  -[SBSLockScreenContentAssertion dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  SBSLockScreenContentAction *action;

  -[SBSLockScreenContentAction invalidate](self->_action, "invalidate");
  action = self->_action;
  self->_action = 0;

}

- (unint64_t)type
{
  return -[SBSLockScreenContentAction type](self->_action, "type");
}

- (NSString)slot
{
  return -[SBSLockScreenContentAction slot](self->_action, "slot");
}

- (NSString)identifier
{
  return -[SBSLockScreenContentAction identifier](self->_action, "identifier");
}

- (void)_acquireAssertionWithType:(unint64_t)a3 slot:(id)a4 identifier:(id)a5 configurationObject:(id)a6
{
  id v10;
  id v11;
  id v12;
  SBSLockScreenContentAction *v13;
  id v14;
  id v15;
  id v16;
  SBSLockScreenContentAction *v17;
  SBSLockScreenContentAction *action;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28[2];
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v13 = [SBSLockScreenContentAction alloc];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke;
  v24 = &unk_1E288D0C0;
  objc_copyWeak(v28, &location);
  v28[1] = (id)a3;
  v14 = v10;
  v25 = v14;
  v15 = v11;
  v26 = v15;
  v16 = v12;
  v27 = v16;
  v17 = -[SBSLockScreenContentAction initWithType:slot:identifier:configurationObject:handler:](v13, "initWithType:slot:identifier:configurationObject:handler:", a3, v14, v15, v16, &v21);
  action = self->_action;
  self->_action = v17;

  if (self->_action)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v21, v22, v23, v24, v25, v26);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendActions:withResult:", v19, 0);

  }
  else
  {
    SBLogDashBoard();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SBSLockScreenContentAssertion _acquireAssertionWithType:slot:identifier:configurationObject:].cold.1((uint64_t)v14, (uint64_t)v15, v19);
  }

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);

}

void __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D010D0];
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D010D0]) && objc_msgSend(v6, "code") == 1)
  {
    v9 = objc_msgSend(WeakRetained, "_supportsReacquisition");

    if (v9)
    {
      objc_msgSend(WeakRetained, "_acquireAssertionWithType:slot:identifier:configurationObject:", a1[8], a1[4], a1[5], a1[6]);
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "domain");
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SBSLockScreenContentAssertionErrorDomain")))goto LABEL_10;
  objc_msgSend(v6, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v8);

  if ((v12 & 1) == 0)
  {
    SBLogDashBoard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke_cold_1(v6, v10);
LABEL_10:

  }
  objc_msgSend(WeakRetained, "_errorHandler");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v6);

LABEL_14:
}

- (BOOL)_supportsReacquisition
{
  void *v2;
  char v3;

  -[SBSLockScreenContentAssertion slot](self, "slot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("App"));

  return v3;
}

+ (BOOL)_isRestrictedDevice
{
  return MGGetSInt32Answer() - 4 < 0xFFFFFFFD;
}

- (void)setSlot:(id)a3
{
  objc_storeStrong((id *)&self->_slot, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)configurationObject
{
  return self->_configurationObject;
}

- (void)setConfigurationObject:(id)a3
{
  objc_storeStrong(&self->_configurationObject, a3);
}

- (SBSLockScreenContentAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (id)_errorHandler
{
  return self->_errorHandler;
}

- (void)_setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong(&self->_configurationObject, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)_acquireAssertionWithType:(os_log_t)log slot:identifier:configurationObject:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "[ContentAssertion] Action is nil after initialization, dropping content entirely. slot: %{public}@ identifier: %{public}@", (uint8_t *)&v3, 0x16u);
}

void __95__SBSLockScreenContentAssertion__acquireAssertionWithType_slot_identifier_configurationObject___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);

}

@end
