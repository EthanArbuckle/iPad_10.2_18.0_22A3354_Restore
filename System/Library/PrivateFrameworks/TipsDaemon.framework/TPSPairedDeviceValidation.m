@implementation TPSPairedDeviceValidation

uint64_t __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)watchDeviceInfo
{
  void *v2;
  void *v3;
  TPSCloudDeviceInfo *v4;
  TPSCloudDeviceInfo *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 || objc_msgSend(MEMORY[0x1E0DBF3A0], "ignoreTargetingValidator"))
  {
    v4 = -[TPSCloudDeviceInfo initWithModel:]([TPSCloudDeviceInfo alloc], "initWithModel:", CFSTR("watch"));
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D51778]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSCloudDeviceInfo setMaxOSVersion:](v5, "setMaxOSVersion:", v6);

    }
    else
    {
      -[TPSCloudDeviceInfo setMaxOSVersion:](v4, "setMaxOSVersion:", 0);
    }
    -[TPSCloudDeviceInfo setDisplayName:](v5, "setDisplayName:", kTPSPairedAppleWatch);
  }
  else
  {
    v5 = 0;
  }
  -[TPSCloudDeviceInfo setSymbolIdentifier:](v5, "setSymbolIdentifier:", CFSTR("applewatch"));

  return v5;
}

+ (id)homePodDeviceInfo
{
  const __CFString *v2;
  char v3;
  const __CFString *v4;
  int v5;
  TPSCloudDeviceInfo *v6;

  if ((objc_msgSend(getHMClientConnectionClass(), "areAnyHomePodsConfigured") & 1) != 0
    || objc_msgSend(getHMClientConnectionClass(), "areAnyLargeHomePodConfigured"))
  {
    v2 = CFSTR("homepod");
    v3 = 1;
    v4 = CFSTR("homepod.and.homepodmini");
  }
  else
  {
    v3 = 0;
    v2 = 0;
    v4 = CFSTR("homepodmini");
  }
  v5 = objc_msgSend(getHMClientConnectionClass(), "areAnyHomePodMiniConfigured");
  if (v5)
    v2 = v4;
  if ((v5 & 1) != 0 || (v3 & 1) != 0)
    goto LABEL_11;
  if (objc_msgSend(MEMORY[0x1E0DBF3A0], "ignoreTargetingValidator"))
  {
    v2 = CFSTR("homepod.and.homepodmini");
LABEL_11:
    v6 = -[TPSCloudDeviceInfo initWithModel:]([TPSCloudDeviceInfo alloc], "initWithModel:", CFSTR("homepod"));
    -[TPSCloudDeviceInfo setDisplayName:](v6, "setDisplayName:", CFSTR("HomePod"));
    -[TPSCloudDeviceInfo setSymbolIdentifier:](v6, "setSymbolIdentifier:", v2);
    return v6;
  }
  return 0;
}

+ (id)airPodsDeviceInfo
{
  int v2;
  char v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TPSCloudDeviceInfo *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[9];
  _QWORD v16[11];

  v16[9] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0DBF3A0], "ignoreTargetingValidator");
  v3 = v2;
  if (v2)
    v4 = &unk_1EA1F0910;
  else
    v4 = 0;
  v5 = v4;
  v6 = &unk_1EA1F0910;
  if ((v3 & 1) == 0)
  {
    v16[0] = &unk_1EA1F09B8;
    v16[1] = &unk_1EA1F09D0;
    v16[2] = &unk_1EA1F0910;
    v16[3] = &unk_1EA1F0928;
    v16[4] = &unk_1EA1F0940;
    v16[5] = &unk_1EA1F0958;
    v16[6] = &unk_1EA1F0970;
    v16[7] = &unk_1EA1F0988;
    v16[8] = &unk_1EA1F09A0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairedDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSBluetoothChecker bluetoothPairedForProductIDs:withPairedDevices:](TPSBluetoothChecker, "bluetoothPairedForProductIDs:withPairedDevices:", v7, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return 0;
  }
  v10 = -[TPSCloudDeviceInfo initWithModel:]([TPSCloudDeviceInfo alloc], "initWithModel:", CFSTR("airpods"));
  -[TPSCloudDeviceInfo setDisplayName:](v10, "setDisplayName:", CFSTR("AirPods"));
  v14[0] = &unk_1EA1F09B8;
  v14[1] = &unk_1EA1F09D0;
  v15[0] = CFSTR("airpods");
  v15[1] = CFSTR("airpods");
  v14[2] = &unk_1EA1F0910;
  v14[3] = &unk_1EA1F0928;
  v15[2] = CFSTR("airpodsmax");
  v15[3] = CFSTR("airpodspro");
  v14[4] = &unk_1EA1F0940;
  v14[5] = &unk_1EA1F0958;
  v15[4] = CFSTR("airpodspro");
  v15[5] = CFSTR("airpods.gen3");
  v14[6] = &unk_1EA1F0970;
  v14[7] = &unk_1EA1F0988;
  v15[6] = CFSTR("airpodspro");
  v15[7] = CFSTR("airpods");
  v14[8] = &unk_1EA1F09A0;
  v15[8] = CFSTR("airpods");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCloudDeviceInfo setSymbolIdentifier:](v10, "setSymbolIdentifier:", v12);

  return v10;
}

- (TPSPairedDeviceValidation)initWithTargetDevices:(id)a3 excludeDevices:(id)a4
{
  NSObject *v7;
  id v8;
  id v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *syncQueue;
  TPSPairedDeviceValidation *v12;
  objc_super v14;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = a4;
  v9 = a3;
  v10 = (OS_dispatch_queue *)dispatch_queue_create(0, v7);
  syncQueue = self->_syncQueue;
  self->_syncQueue = v10;

  v14.receiver = self;
  v14.super_class = (Class)TPSPairedDeviceValidation;
  v12 = -[TPSInclusivityValidation initWithTargetValues:excludeValues:](&v14, sel_initWithTargetValues_excludeValues_, v9, v8);

  return v12;
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_2;
  v8[3] = &unk_1EA1DFD18;
  v9 = v3;
  v7 = v3;
  +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v4, 1, v5, 0, v6, v8);

}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  TPSPairedDeviceValidation *v25;
  _QWORD v26[4];
  id v27;
  TPSPairedDeviceValidation *v28;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[TPSPairedDeviceValidation targetDevices](self, "targetDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    -[TPSPairedDeviceValidation targetDevices](self, "targetDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSPairedDeviceValidation _validationsForDevices:](self, "_validationsForDevices:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke;
    v26[3] = &unk_1EA1E0988;
    v27 = v10;
    v28 = self;
    v11 = v10;
    +[TPSBlockValidation blockValidationWithBlock:](TPSBlockValidation, "blockValidationWithBlock:", v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  -[TPSPairedDeviceValidation excludeDevices](self, "excludeDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[TPSPairedDeviceValidation excludeDevices](self, "excludeDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSPairedDeviceValidation _validationsForDevices:](self, "_validationsForDevices:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_3;
    v23[3] = &unk_1EA1E0988;
    v24 = v16;
    v25 = self;
    v17 = v16;
    +[TPSBlockValidation blockValidationWithBlock:](TPSBlockValidation, "blockValidationWithBlock:", v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  if (objc_msgSend(v5, "count"))
  {
    -[TPSTargetingValidation name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSPairedDeviceValidation completionQueue](self, "completionQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5;
    v21[3] = &unk_1EA1E09B0;
    v21[4] = self;
    v22 = v4;
    +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v5, 0, v19, 0, v20, v21);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (id)completionQueue
{
  return dispatch_get_global_queue(0, 0);
}

- (id)_validationsForDevices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  TPSPairedDeviceValidation *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__TPSPairedDeviceValidation__validationsForDevices___block_invoke;
  v13 = &unk_1EA1E09D8;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_cachedDevices, 0);
  objc_storeStrong((id *)&self->_cachedPeers, 0);
}

void __52__TPSPairedDeviceValidation__validationsForDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_validationForDeviceNumber:", objc_msgSend(a2, "integerValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)_validationForDeviceNumber:(int64_t)a3
{
  TPSPairedWatchValidation *v4;
  void *v5;
  TPSTargetingValidation *v6;
  const __CFString *v7;
  uint64_t v8;
  __objc2_class *v9;
  uint64_t v10;
  uint64_t v11;
  TPSTargetingValidation *v12;
  NSObject *v13;

  switch(a3)
  {
    case 0:
      v4 = [TPSPairedWatchValidation alloc];
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("36A0EB23-E045-4E99-9D71-8FB9A853ADA7"));
      v6 = -[TPSPairedWatchValidation initWithCapability:](v4, "initWithCapability:", v5);

      if (!v6)
        goto LABEL_27;
      return v6;
    case 1:
      v7 = CFSTR("A1603");
      v8 = 1;
      goto LABEL_9;
    case 2:
      v9 = TPSPairedCarPlayValidation;
      goto LABEL_21;
    case 3:
      v10 = 8194;
      v11 = 3;
      goto LABEL_25;
    case 4:
      v9 = TPSPairedHomePodValidation;
      goto LABEL_21;
    case 5:
      v7 = CFSTR("A2051");
      v8 = 5;
LABEL_9:
      -[TPSPairedDeviceValidation _bluetoothValidationForTag:deviceType:](self, "_bluetoothValidationForTag:deviceType:", v7, v8);
      v12 = (TPSTargetingValidation *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 6:
      v10 = 8207;
      v11 = 6;
      goto LABEL_25;
    case 7:
      v9 = TPSPairedAirTagValidation;
      goto LABEL_21;
    case 8:
      v10 = 8206;
      v11 = 8;
      goto LABEL_25;
    case 9:
      v9 = TPSPairedHomePodMiniValidation;
      goto LABEL_21;
    case 10:
      v10 = 8202;
      v11 = 10;
      goto LABEL_25;
    case 12:
      v10 = 8211;
      v11 = 12;
      goto LABEL_25;
    case 21:
      -[TPSPairedDeviceValidation _bluetoothValidationForProductIDs:deviceType:joinType:](self, "_bluetoothValidationForProductIDs:deviceType:joinType:", &unk_1EA1F0AA0, 21, 1);
      v12 = (TPSTargetingValidation *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 22:
      v9 = TPSPairedLargeHomePodValidation;
LABEL_21:
      v12 = (TPSTargetingValidation *)objc_alloc_init(v9);
      goto LABEL_26;
    case 23:
      +[TPSBlockValidation blockValidationWithBlock:](TPSBlockValidation, "blockValidationWithBlock:", &__block_literal_global_6);
      v12 = (TPSTargetingValidation *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 24:
      v10 = 8217;
      v11 = 24;
      goto LABEL_25;
    case 25:
      v10 = 8219;
      v11 = 25;
LABEL_25:
      -[TPSPairedDeviceValidation _bluetoothValidationForProductID:deviceType:](self, "_bluetoothValidationForProductID:deviceType:", v10, v11);
      v12 = (TPSTargetingValidation *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      v6 = v12;
      if (!v12)
        goto LABEL_27;
      return v6;
    default:
      objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[TPSPairedDeviceValidation _validationForDeviceNumber:].cold.1(a3, v13);

LABEL_27:
      v6 = objc_alloc_init(TPSTargetingValidation);
      return v6;
  }
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;

  v5 = (void *)MEMORY[0x1E0DBF3D0];
  v6 = a3;
  objc_msgSend(v5, "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5_cold_1(a1, a2, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSArray)cachedPeers
{
  NSObject *v3;
  _QWORD block[5];

  -[TPSPairedDeviceValidation syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__TPSPairedDeviceValidation_cachedPeers__block_invoke;
  block[3] = &unk_1EA1DF818;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_cachedPeers;
}

void __40__TPSPairedDeviceValidation_cachedPeers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    +[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pairedPeers");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = v2;

  }
}

- (NSArray)cachedDevices
{
  NSObject *v3;
  _QWORD block[5];

  -[TPSPairedDeviceValidation syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__TPSPairedDeviceValidation_cachedDevices__block_invoke;
  block[3] = &unk_1EA1DF818;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_cachedDevices;
}

void __42__TPSPairedDeviceValidation_cachedDevices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    +[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pairedDevices");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = v2;

  }
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_4;
  v8[3] = &unk_1EA1DFD18;
  v9 = v3;
  v7 = v3;
  +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:](TPSTargetingValidator, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v4, 1, v5, 0, v6, v8);

}

uint64_t __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__TPSPairedDeviceValidation__validationForDeviceNumber___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v2 = (void *)MEMORY[0x1E0D51838];
  v3 = a2;
  objc_msgSend(v2, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getActivePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForProperty:", *MEMORY[0x1E0D51738]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("Watch3,"));
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __56__TPSPairedDeviceValidation__validationForDeviceNumber___block_invoke_cold_1(v7, v8);

  v3[2](v3, v7, 0);
}

- (id)_bluetoothValidationForTag:(id)a3 deviceType:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  TPSPairedDeviceValidation *v12;
  int64_t v13;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke;
  v10[3] = &unk_1EA1E0A40;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v7 = v6;
  +[TPSBlockValidation blockValidationWithBlock:](TPSBlockValidation, "blockValidationWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _BOOL8, _QWORD);
  void *v5;
  _BOOL8 v6;
  NSObject *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "cachedPeers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[TPSBluetoothChecker bluetoothPairedWithTag:withPairedPeers:](TPSBluetoothChecker, "bluetoothPairedWithTag:withPairedPeers:", v2, v5);

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke_cold_1();

  v4[2](v4, v6, 0);
}

- (id)_bluetoothValidationForProductID:(unsigned int)a3 deviceType:(int64_t)a4
{
  _QWORD v5[6];
  unsigned int v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke;
  v5[3] = &unk_1EA1E0A68;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  +[TPSBlockValidation blockValidationWithBlock:](TPSBlockValidation, "blockValidationWithBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _BOOL8, _QWORD);
  void *v5;
  _BOOL8 v6;
  NSObject *v7;

  v2 = *(unsigned int *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cachedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[TPSBluetoothChecker bluetoothPairedForProductID:withPairedDevices:](TPSBluetoothChecker, "bluetoothPairedForProductID:withPairedDevices:", v2, v5);

  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke_cold_1();

  v4[2](v4, v6, 0);
}

- (id)_bluetoothValidationForProductIDs:(id)a3 deviceType:(int64_t)a4 joinType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  TPSPairedDeviceValidation *v14;
  int64_t v15;
  int64_t v16;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke;
  v12[3] = &unk_1EA1E0AB8;
  v13 = v8;
  v14 = self;
  v15 = a5;
  v16 = a4;
  v9 = v8;
  +[TPSBlockValidation blockValidationWithBlock:](TPSBlockValidation, "blockValidationWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke(_QWORD *a1, void *a2)
{
  void (**v3)(id, uint64_t, _QWORD);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a2;
  v4 = a1[6];
  if (v4 == 1)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_3;
    v10[3] = &unk_1EA1E0A90;
    v7 = (void *)a1[4];
    v10[4] = a1[5];
    v6 = objc_msgSend(v7, "na_any:", v10);
    goto LABEL_5;
  }
  if (!v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_2;
    v11[3] = &unk_1EA1E0A90;
    v5 = (void *)a1[4];
    v11[4] = a1[5];
    v6 = objc_msgSend(v5, "na_all:", v11);
LABEL_5:
    v8 = v6;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_cold_1();

  v3[2](v3, v8, 0);
}

BOOL __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  v3 = objc_msgSend(a2, "unsignedIntValue");
  objc_msgSend(*(id *)(a1 + 32), "cachedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[TPSBluetoothChecker bluetoothPairedForProductID:withPairedDevices:](TPSBluetoothChecker, "bluetoothPairedForProductID:withPairedDevices:", v3, v4);

  return v5;
}

BOOL __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;

  v3 = objc_msgSend(a2, "unsignedIntValue");
  objc_msgSend(*(id *)(a1 + 32), "cachedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[TPSBluetoothChecker bluetoothPairedForProductID:withPairedDevices:](TPSBluetoothChecker, "bluetoothPairedForProductID:withPairedDevices:", v3, v4);

  return v5;
}

- (void)setCachedPeers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setCachedDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

void __52__TPSPairedDeviceValidation_validateWithCompletion___block_invoke_5_cold_1(uint64_t a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "targetDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "excludeDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413058;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 1024;
  v16 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - Include: %@, Exclude: %@. Valid: %d", (uint8_t *)&v9, 0x26u);

}

- (void)_validationForDeviceNumber:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unrecognized device number: %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __56__TPSPairedDeviceValidation__validationForDeviceNumber___block_invoke_cold_1(char a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 23;
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "Checking for BT Device: %ld. Paired: %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

void __67__TPSPairedDeviceValidation__bluetoothValidationForTag_deviceType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1DAC2F000, v0, v1, "Checking for BT Device: %ld. Paired: %d", v2, v3);
  OUTLINED_FUNCTION_1_0();
}

void __73__TPSPairedDeviceValidation__bluetoothValidationForProductID_deviceType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1DAC2F000, v0, v1, "Checking for BT Device: %ld. Paired: %d", v2, v3);
  OUTLINED_FUNCTION_1_0();
}

void __83__TPSPairedDeviceValidation__bluetoothValidationForProductIDs_deviceType_joinType___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1DAC2F000, v0, v1, "Checking for BT Device: %ld. Paired: %d", v2, v3);
  OUTLINED_FUNCTION_1_0();
}

@end
