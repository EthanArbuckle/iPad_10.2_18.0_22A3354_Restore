@implementation TPSContextualBiomeDeviceWirelessBluetoothEvent

- (id)publisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Wireless");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Bluetooth");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D026F0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v8, v10, 0, 0, 0);

  objc_msgSend(v7, "publisherWithUseCase:options:", CFSTR("FeatureDiscoverability"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)filterHandler
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  -[TPSContextualBiomeDeviceWirelessBluetoothEvent _filteringPredicate](self, "_filteringPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__TPSContextualBiomeDeviceWirelessBluetoothEvent_filterHandler__block_invoke;
    aBlock[3] = &unk_1E395B858;
    v7 = v2;
    v4 = _Block_copy(aBlock);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __63__TPSContextualBiomeDeviceWirelessBluetoothEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)filterParametersForBiomeQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v30.receiver = self;
  v30.super_class = (Class)TPSContextualBiomeDeviceWirelessBluetoothEvent;
  -[TPSContextualBiomeEvent filterParametersForBiomeQuery](&v30, sel_filterParametersForBiomeQuery);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v9 = v7;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "TPSSafeObjectForKey:", CFSTR("appleAudioDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "TPSSafeBoolForKey:", CFSTR("appleAudioDevice")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("appleAudioDevice"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "TPSSafeObjectForKey:", CFSTR("deviceType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "TPSSafeIntForKey:", CFSTR("deviceType")));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("deviceType"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "TPSSafeObjectForKey:", CFSTR("productIDs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "TPSSafeArrayForKey:", CFSTR("productIDs"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("productID"));

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "TPSSafeObjectForKey:", CFSTR("userWearing"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "TPSSafeBoolForKey:", CFSTR("userWearing")));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("userWearing"));

  }
  v29 = (void *)objc_msgSend(v9, "copy");

  return v29;
}

- (id)_filteringPredicate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  char v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  _QWORD v35[4];
  char v36;

  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "TPSSafeObjectForKey:", CFSTR("appleAudioDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "TPSSafeBoolForKey:", CFSTR("appleAudioDevice"));

    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke;
    v35[3] = &__block_descriptor_33_e44_B24__0__BMDeviceBluetooth_8__NSDictionary_16l;
    v36 = v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "TPSSafeObjectForKey:", CFSTR("deviceType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (int)objc_msgSend(v13, "TPSSafeIntForKey:", CFSTR("deviceType"));

    v34[0] = v7;
    v34[1] = 3221225472;
    v34[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_2;
    v34[3] = &__block_descriptor_40_e44_B24__0__BMDeviceBluetooth_8__NSDictionary_16l;
    v34[4] = v14;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v34);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v15);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "TPSSafeObjectForKey:", CFSTR("productIDs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "TPSSafeArrayForKey:", CFSTR("productIDs"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3880];
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_3;
    v32[3] = &unk_1E395B8C0;
    v33 = v19;
    v21 = v19;
    objc_msgSend(v20, "predicateWithBlock:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v22);

  }
  -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "TPSSafeObjectForKey:", CFSTR("userWearing"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[TPSContextualBiomeEvent filterInfo](self, "filterInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "TPSSafeBoolForKey:", CFSTR("userWearing"));

    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_4;
    v30[3] = &__block_descriptor_33_e44_B24__0__BMDeviceBluetooth_8__NSDictionary_16l;
    v31 = v26;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v27);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

BOOL __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == objc_msgSend(a2, "appleAudioDevice");
}

BOOL __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  return *(_QWORD *)(a1 + 32) == (int)objc_msgSend(a2, "deviceType");
}

uint64_t __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "productID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

BOOL __69__TPSContextualBiomeDeviceWirelessBluetoothEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == objc_msgSend(a2, "userWearing");
}

@end
