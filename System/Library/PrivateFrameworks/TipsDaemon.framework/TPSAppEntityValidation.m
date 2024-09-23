@implementation TPSAppEntityValidation

- (TPSAppEntityValidation)initWithAppEntity:(id)a3
{
  id v5;
  TPSAppEntityValidation *v6;
  TPSAppEntityValidation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSAppEntityValidation;
  v6 = -[TPSAppEntityValidation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appEntity, a3);

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  TPSAppIntentsHelper *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  TPSAppEntityValidation *v13;
  id v14;

  v4 = a3;
  -[TPSAppEntity value](self->_appEntity, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(TPSAppIntentsHelper);
  -[TPSAppEntity name](self->_appEntity, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSAppEntity bundleId](self->_appEntity, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__TPSAppEntityValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1EA1E0790;
  v13 = self;
  v14 = v4;
  v12 = v5;
  v9 = v5;
  v10 = v4;
  -[TPSAppIntentsHelper fetchReturnValueFromEntityNamed:inBundleId:withParameters:completionHandler:](v6, "fetchReturnValueFromEntityNamed:inBundleId:withParameters:completionHandler:", v7, v8, 0, v11);

}

uint64_t __49__TPSAppEntityValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5;
  NSObject *v6;

  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v5 = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __49__TPSAppIntentValidation_validateWithCompletion___block_invoke_cold_1(a1, v5, v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (TPSAppEntity)appEntity
{
  return self->_appEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appEntity, 0);
}

@end
