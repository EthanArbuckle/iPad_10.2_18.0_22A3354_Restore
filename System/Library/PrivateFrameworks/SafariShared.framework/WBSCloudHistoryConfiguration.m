@implementation WBSCloudHistoryConfiguration

- (WBSCloudHistoryConfiguration)init
{
  WBSCloudHistoryConfiguration *v2;
  WBSCloudHistoryConfiguration *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  WBSCloudHistoryConfiguration *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSCloudHistoryConfiguration;
  v2 = -[WBSCloudHistoryConfiguration init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_shouldBatchSaveRecords = 1;
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Applying built-in configuration", v10, 2u);
    }
    -[WBSCloudHistoryConfiguration _builtInConfiguration](v3, "_builtInConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCloudHistoryConfiguration _applyBuiltInConfiguration:](v3, "_applyBuiltInConfiguration:", v5);

    v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Applying remote configuration", v10, 2u);
    }
    -[WBSCloudHistoryConfiguration remoteConfiguration](v3, "remoteConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCloudHistoryConfiguration applyRemoteConfiguration:](v3, "applyRemoteConfiguration:", v7);

    v8 = v3;
  }

  return v3;
}

- (WBSCloudHistoryConfiguration)initWithDictionary:(id)a3
{
  id v4;
  WBSCloudHistoryConfiguration *v5;
  WBSCloudHistoryConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WBSCloudHistoryConfiguration;
  v5 = -[WBSCloudHistoryConfiguration init](&v8, sel_init);
  if (v5)
  {
    v5->_shouldBatchSaveRecords = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("ShouldBatchSaveRecords"));
    v5->_shouldUseLongLivedOperationsToSaveRecords = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("ShouldUseLongLivedOperationsToSaveRecords"));
    -[WBSCloudHistoryConfiguration _applyConfiguration:withTolerance:](v5, "_applyConfiguration:withTolerance:", v4, 0);
    v6 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *singleDeviceSaveChangesThrottlingPolicyString;
  NSString *multipleDeviceSaveChangesThrottlingPolicyString;
  unint64_t maximumRequestCharacterCount;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[9];
  _QWORD v13[4];
  __int128 v14;
  NSString *syncCircleSizeRetrievalThrottlingPolicyString;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("ShouldBatchSaveRecords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WBSCloudHistoryConfiguration shouldBatchSaveRecords](self, "shouldBatchSaveRecords"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("ShouldUseLongLivedOperationsToSaveRecords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WBSCloudHistoryConfiguration shouldUseLongLivedOperationsToSaveRecords](self, "shouldUseLongLivedOperationsToSaveRecords"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  singleDeviceSaveChangesThrottlingPolicyString = self->_singleDeviceSaveChangesThrottlingPolicyString;
  multipleDeviceSaveChangesThrottlingPolicyString = self->_multipleDeviceSaveChangesThrottlingPolicyString;
  v13[1] = v4;
  v13[2] = singleDeviceSaveChangesThrottlingPolicyString;
  v12[2] = CFSTR("SingleDeviceSaveChangesThrottlingPolicy");
  v12[3] = CFSTR("MultipleDeviceSaveChangesThrottlingPolicy");
  v13[3] = multipleDeviceSaveChangesThrottlingPolicyString;
  v14 = *(_OWORD *)&self->_singleDeviceFetchChangesThrottlingPolicyString;
  v12[4] = CFSTR("SingleDeviceFetchChangesThrottlingPolicy");
  v12[5] = CFSTR("MultipleDeviceFetchChangesThrottlingPolicy");
  maximumRequestCharacterCount = self->_maximumRequestCharacterCount;
  syncCircleSizeRetrievalThrottlingPolicyString = self->_syncCircleSizeRetrievalThrottlingPolicyString;
  v12[6] = CFSTR("SyncCircleSizeRetrievalThrottlingPolicy");
  v12[7] = CFSTR("MaximumRequestLimitCharacterCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", maximumRequestCharacterCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  v12[8] = CFSTR("SyncWindow");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_syncWindow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_builtInConfiguration
{
  void *v3;
  void *v4;
  id v5;

  -[WBSCloudHistoryConfiguration _sharedBuiltInConfiguration](self, "_sharedBuiltInConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudHistoryConfiguration platformBuiltInConfiguration](self, "platformBuiltInConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (void)_applyBuiltInConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  -[WBSCloudHistoryConfiguration applyPlatformConfiguration:withTolerance:](self, "applyPlatformConfiguration:withTolerance:");
  -[WBSCloudHistoryConfiguration _applyConfiguration:withTolerance:](self, "_applyConfiguration:withTolerance:", v4, 0);

}

- (void)_applyConfiguration:(id)a3 withTolerance:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  int64_t v21;
  _QWORD v22[4];
  id v23;
  int64_t v24;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke;
  v22[3] = &unk_1E4B2B680;
  v8 = v6;
  v23 = v8;
  v24 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v22);
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_22;
  v19[3] = &unk_1E4B2B6A8;
  v10 = v8;
  v20 = v10;
  v21 = a4;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v19);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_24;
  v18[3] = &unk_1E4B2B6D0;
  v18[4] = self;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v9)[2](v9, CFSTR("SingleDeviceSaveChangesThrottlingPolicy"), v18);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_26;
  v17[3] = &unk_1E4B2B6D0;
  v17[4] = self;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v9)[2](v9, CFSTR("MultipleDeviceSaveChangesThrottlingPolicy"), v17);
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_27;
  v16[3] = &unk_1E4B2B6D0;
  v16[4] = self;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v9)[2](v9, CFSTR("SingleDeviceFetchChangesThrottlingPolicy"), v16);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_28;
  v15[3] = &unk_1E4B2B6D0;
  v15[4] = self;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v9)[2](v9, CFSTR("MultipleDeviceFetchChangesThrottlingPolicy"), v15);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_29;
  v14[3] = &unk_1E4B2B6D0;
  v14[4] = self;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v9)[2](v9, CFSTR("SyncCircleSizeRetrievalThrottlingPolicy"), v14);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_30;
  v13[3] = &unk_1E4B2B6F8;
  v13[4] = self;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v11)[2](v11, CFSTR("MaximumRequestLimitCharacterCount"), v13);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_32;
  v12[3] = &unk_1E4B2B6F8;
  v12[4] = self;
  ((void (**)(_QWORD, const __CFString *, _QWORD *))v11)[2](v11, CFSTR("SyncWindow"), v12);

}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "safari_stringForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (objc_msgSend(MEMORY[0x1E0D89BB8], "policyStringRepresentsValidPolicy:", v8))
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        v6[2](v6, v9);

      }
    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_2();
    }

  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Configuration did not contain key: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_1();
  }

}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "safari_numberForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9)
    {
      v6[2](v6, v9);
    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_22_cold_2();
    }
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Configuration did not contain key: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_1();
  }

}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("SingleDeviceSaveChangesThrottlingPolicy");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setSingleDeviceSaveChangesThrottlingPolicyString:", v3);

}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("MultipleDeviceSaveChangesThrottlingPolicy");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setMultipleDeviceSaveChangesThrottlingPolicyString:", v3);

}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("SingleDeviceFetchChangesThrottlingPolicy");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setSingleDeviceFetchChangesThrottlingPolicyString:", v3);

}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("MultipleDeviceFetchChangesThrottlingPolicy");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setMultipleDeviceFetchChangesThrottlingPolicyString:", v3);

}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = CFSTR("SyncCircleSizeRetrievalThrottlingPolicy");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %{public}@ for key: %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setSyncCircleSizeRetrievalThrottlingPolicyString:", v3);

}

uint64_t __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_30(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2114;
    v9 = CFSTR("MaximumRequestLimitCharacterCount");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %lu for key: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumRequestCharacterCount:", a2);
}

uint64_t __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_32(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  int v6;
  unint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a2;
    v8 = 2114;
    v9 = CFSTR("SyncWindow");
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Retrieved value: %lu for key: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setSyncWindow:", (double)a2);
}

- (id)_sharedBuiltInConfiguration
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("SingleDeviceFetchChangesThrottlingPolicy");
  v3[1] = CFSTR("MultipleDeviceFetchChangesThrottlingPolicy");
  v4[0] = CFSTR("11:15 | 1:1275");
  v4[1] = CFSTR("50:1 | 50:3 | 20:4 | 20:5 | 20:15 | 20:18 | 20:20");
  v3[2] = CFSTR("SyncCircleSizeRetrievalThrottlingPolicy");
  v3[3] = CFSTR("MaximumRequestLimitCharacterCount");
  v4[2] = CFSTR("1:1440");
  v4[3] = &unk_1E4B87958;
  v3[4] = CFSTR("SyncWindow");
  v4[4] = &unk_1E4B87CE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)platformBuiltInConfiguration
{
  return 0;
}

- (id)remoteConfiguration
{
  return 0;
}

- (void)applyRemoteConfiguration:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WBSCloudHistoryConfiguration applyPlatformConfiguration:withTolerance:](self, "applyPlatformConfiguration:withTolerance:", v5, 1);
    -[WBSCloudHistoryConfiguration _applyConfiguration:withTolerance:](self, "_applyConfiguration:withTolerance:", v5, 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("WBSCloudHistoryConfigurationChangedNotification"), self, 0);

  }
}

- (NSString)singleDeviceSaveChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSingleDeviceSaveChangesThrottlingPolicyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)multipleDeviceSaveChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMultipleDeviceSaveChangesThrottlingPolicyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)singleDeviceFetchChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSingleDeviceFetchChangesThrottlingPolicyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)multipleDeviceFetchChangesThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMultipleDeviceFetchChangesThrottlingPolicyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)syncCircleSizeRetrievalThrottlingPolicyString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSyncCircleSizeRetrievalThrottlingPolicyString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)maximumRequestCharacterCount
{
  return self->_maximumRequestCharacterCount;
}

- (void)setMaximumRequestCharacterCount:(unint64_t)a3
{
  self->_maximumRequestCharacterCount = a3;
}

- (double)syncWindow
{
  return self->_syncWindow;
}

- (void)setSyncWindow:(double)a3
{
  self->_syncWindow = a3;
}

- (BOOL)shouldBatchSaveRecords
{
  return self->_shouldBatchSaveRecords;
}

- (BOOL)shouldUseLongLivedOperationsToSaveRecords
{
  return self->_shouldUseLongLivedOperationsToSaveRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_multipleDeviceFetchChangesThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_singleDeviceFetchChangesThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_multipleDeviceSaveChangesThrottlingPolicyString, 0);
  objc_storeStrong((id *)&self->_singleDeviceSaveChangesThrottlingPolicyString, 0);
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, v0, v1, "Configuration did not contain key: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, v0, v1, "Configuration did not contain string value for key: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__WBSCloudHistoryConfiguration__applyConfiguration_withTolerance___block_invoke_22_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_4(&dword_1A3D90000, v0, v1, "Configuration did not contain unsigned integer for key: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
