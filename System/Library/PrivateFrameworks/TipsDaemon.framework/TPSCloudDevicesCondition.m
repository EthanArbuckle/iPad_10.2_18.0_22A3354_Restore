@implementation TPSCloudDevicesCondition

- (TPSCloudDevicesCondition)init
{
  TPSCloudDevicesCondition *v2;
  TPSCloudDevicesCondition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCloudDevicesCondition;
  v2 = -[TPSCloudDevicesCondition init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TPSCondition setType:](v2, "setType:", 7);
  return v3;
}

- (id)targetingValidations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[TPSCondition values](self, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSCondition values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__TPSCloudDevicesCondition_targetingValidations__block_invoke;
  v11[3] = &unk_1EA1E0908;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __48__TPSCloudDevicesCondition_targetingValidations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSCloudDeviceValidation *v4;

  v3 = a2;
  v4 = -[TPSCloudDeviceValidation initWithDeviceInfo:]([TPSCloudDeviceValidation alloc], "initWithDeviceInfo:", v3);

  -[TPSCloudDeviceValidation setDataSource:](v4, "setDataSource:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

- (id)_valuesFromValuesArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke;
  v9[3] = &unk_1EA1E05B0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  TPSCloudDeviceInfo *v4;
  NSObject *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[TPSCloudDeviceInfo initWithDictionary:]([TPSCloudDeviceInfo alloc], "initWithDictionary:", v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, v5);

  }
}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D34358]);
  v6 = (void *)objc_msgSend(v5, "initWithService:", *MEMORY[0x1E0DBF460]);
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCloudDevicesCondition setRegisteredDevices:](self, "setRegisteredDevices:", v7);

  v10[1] = 3221225472;
  v10[2] = __51__TPSCloudDevicesCondition_validateWithCompletion___block_invoke;
  v10[3] = &unk_1EA1E0930;
  v10[4] = self;
  v11 = v4;
  v9.receiver = self;
  v9.super_class = (Class)TPSCloudDevicesCondition;
  v10[0] = MEMORY[0x1E0C809B0];
  v8 = v4;
  -[TPSCondition validateWithCompletion:](&v9, sel_validateWithCompletion_, v10);

}

uint64_t __51__TPSCloudDevicesCondition_validateWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setRegisteredDevices:", 0);
}

- (NSArray)registeredDevices
{
  return self->_registeredDevices;
}

- (void)setRegisteredDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDevices, 0);
}

void __51__TPSCloudDevicesCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unexpected value for cloud device condition: %@", (uint8_t *)&v2, 0xCu);
}

@end
