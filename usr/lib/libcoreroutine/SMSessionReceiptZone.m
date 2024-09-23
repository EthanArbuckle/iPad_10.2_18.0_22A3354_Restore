@implementation SMSessionReceiptZone

- (SMSessionReceiptZone)initWithQueue:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  SMSessionReceiptZone *v13;
  uint64_t v14;
  NSMutableArray *sessionReceipts;
  SMSessionReceiptZone *v16;
  objc_super v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@", buf, 0x16u);

    }
    v10 = objc_alloc(MEMORY[0x1E0C95098]);
    v11 = objc_msgSend(v10, "initWithZoneName:ownerName:", CFSTR("SessionReceiptZone"), *MEMORY[0x1E0C94730]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v11);
    v19.receiver = self;
    v19.super_class = (Class)SMSessionReceiptZone;
    v13 = -[SMCloudKitZone initWithZone:queue:](&v19, sel_initWithZone_queue_, v12, v5);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = objc_claimAutoreleasedReturnValue();
      sessionReceipts = v13->_sessionReceipts;
      v13->_sessionReceipts = (NSMutableArray *)v14;

    }
    v18.receiver = v13;
    v18.super_class = (Class)SMSessionReceiptZone;
    self = -[SMCloudKitZone initWithZone:queue:](&v18, sel_initWithZone_queue_, v12, v5);

    v16 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

- (void)setupZoneWithQos:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[SMCloudKitZone privateDatabase](self, "privateDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__SMSessionReceiptZone_setupZoneWithQos_completion___block_invoke;
    v11[3] = &unk_1E9297740;
    v11[4] = self;
    v13 = a2;
    v12 = v8;
    -[SMCloudKitZone saveZoneToDatabase:qos:withCompletion:](self, "saveZoneToDatabase:qos:withCompletion:", v9, v7, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __52__SMSessionReceiptZone_setupZoneWithQos_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,zone saved successfully", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionReceiptZoneAvailable:", 1);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save zone with error %@", (uint8_t *)&v15, 0x20u);

    }
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v11();

}

- (void)checkSessionReceiptZoneAvailibilityWithCompletion:(id)a3
{
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  void *v7;
  SMCloudKitQosOptions *v8;
  _QWORD v9[5];
  void (**v10)(id, uint64_t, _QWORD);
  SEL v11;
  uint8_t buf[16];

  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  if (v5)
  {
    if (-[SMSessionReceiptZone sessionReceiptZoneAvailable](self, "sessionReceiptZoneAvailable"))
    {
      v5[2](v5, 1, 0);
    }
    else
    {
      -[SMCloudKitZone privateDatabase](self, "privateDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke;
      v9[3] = &unk_1E9297740;
      v9[4] = self;
      v11 = a2;
      v10 = v5;
      -[SMCloudKitZone fetchZoneFromDatabase:qos:withCompletion:](self, "fetchZoneFromDatabase:qos:withCompletion:", v7, v8, v9);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _BOOL4 v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  SMCloudKitQosOptions *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  __int128 v16;
  _QWORD v17[5];
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (a3)
  {
    if (v6)
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Session receipt zone does not exist. Setting up Session Receipt Zone", buf, 0x16u);

    }
    v10 = *(void **)(a1 + 32);
    v11 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke_19;
    v17[3] = &unk_1E9297740;
    v17[4] = *(_QWORD *)(a1 + 32);
    v16 = *(_OWORD *)(a1 + 40);
    v12 = (id)v16;
    v18 = v16;
    objc_msgSend(v10, "setupZoneWithQos:completion:", v11, v17);

  }
  else
  {
    if (v6)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Session Receipt Zone fetch Successful", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionReceiptZoneAvailable:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __74__SMSessionReceiptZone_checkSessionReceiptZoneAvailibilityWithCompletion___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,Failed to setup Session Receipt Zone with error %@", (uint8_t *)&v13, 0x20u);

    }
    (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "sessionReceiptZoneAvailable"), v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,Setup Session Receipt Zone Successful", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setSessionReceiptZoneAvailable:", 1);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "sessionReceiptZoneAvailable"), 0);
  }

}

- (void)writeSessionReceiptRecord:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[4];
  NSObject *v14;
  SMSessionReceiptZone *v15;
  id v16;
  SEL v17;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: sessionReceipt";
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  -[SMSessionReceiptZone sessionReceipts](self, "sessionReceipts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v7);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__SMSessionReceiptZone_writeSessionReceiptRecord_completion___block_invoke;
  v13[3] = &unk_1E929BD88;
  v14 = v7;
  v15 = self;
  v17 = a2;
  v16 = v9;
  -[SMSessionReceiptZone checkSessionReceiptZoneAvailibilityWithCompletion:](self, "checkSessionReceiptZoneAvailibilityWithCompletion:", v13);

  v11 = v14;
LABEL_7:

}

void __61__SMSessionReceiptZone_writeSessionReceiptRecord_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138413058;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v10, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_writeSessionReceiptRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }

}

- (void)_writeSessionReceiptRecord:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
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
  SMCloudKitQosOptions *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  SMSessionReceiptZone *v31;
  id v32;
  SEL v33;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x1E0C95070]);
  objc_msgSend(v7, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCloudKitZone zoneID](self, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithRecordName:zoneID:", v11, v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("SessionReceiptRecord"), v13);
  objc_msgSend(v7, "receiverHandles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encryptedValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("allReceiverHandlesEncrypted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "sessionType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encryptedValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("sessionTypeEncrypted"));

  objc_msgSend(v7, "startTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encryptedValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("sessionStartTimeEncrypted"));

  objc_msgSend(v7, "endTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encryptedValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("sessionEndTimeEncrypted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "readStatus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encryptedValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("safetyCacheReadStatusEncrypted"));

  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 1, 0, 0);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__SMSessionReceiptZone__writeSessionReceiptRecord_completion___block_invoke;
  v29[3] = &unk_1E929BDB0;
  v30 = v7;
  v31 = self;
  v32 = v8;
  v33 = a2;
  v27 = v8;
  v28 = v7;
  -[SMCloudKitZone saveRecord:toDatabase:qos:withCompletion:](self, "saveRecord:toDatabase:qos:withCompletion:", v14, v25, v26, v29);

}

void __62__SMSessionReceiptZone__writeSessionReceiptRecord_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138413058;
      v19 = v7;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v4;
      v11 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@";
      v12 = v5;
      v13 = 42;
LABEL_6:
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v18, v13);

    }
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v7;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v11 = "#SafetyCache,Initiator,sessionID:%@,%@,%@,saved successfully";
    v12 = v5;
    v13 = 32;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, BOOL, id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4 == 0, v4, v15, v16, v17);
}

- (void)fetchSessionReceiptRecordWithSessionID:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, uint64_t, _QWORD);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  SEL v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  SMSessionReceiptZone *v25;
  id v26;
  void (**v27)(id, void *, uint64_t, _QWORD);
  SEL v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, uint64_t, _QWORD))a5;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: completion";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_16;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_18;
  }
  v21 = a2;
  v22 = v10;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[SMSessionReceiptZone sessionReceipts](self, "sessionReceipts");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "sessionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqual:", v9);

        if (v19)
        {
          v11[2](v11, v17, 1, 0);
          v10 = v22;
          goto LABEL_16;
        }
      }
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v14)
        continue;
      break;
    }
  }

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke;
  v23[3] = &unk_1E929BDD8;
  v24 = v9;
  v25 = self;
  v28 = v21;
  v27 = v11;
  v10 = v22;
  v26 = v22;
  -[SMSessionReceiptZone checkSessionReceiptZoneAvailibilityWithCompletion:](self, "checkSessionReceiptZoneAvailibilityWithCompletion:", v23);

  v12 = v24;
LABEL_16:

}

void __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v16;
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(*(id *)(a1 + 32), "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithRecordName:zoneID:", v7, v8);

    v10 = *(void **)(a1 + 40);
    objc_msgSend(v10, "privateDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke_24;
    v21[3] = &unk_1E929BDB0;
    v13 = *(id *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v22 = v13;
    v23 = v14;
    v20 = *(_OWORD *)(a1 + 56);
    v15 = (id)v20;
    v24 = v20;
    objc_msgSend(v10, "fetchRecord:fromDatabase:qos:withCompletion:", v9, v11, v12, v21);

  }
}

void __78__SMSessionReceiptZone_fetchSessionReceiptRecordWithSessionID_qos_completion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  objc_class *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v9;
      v38 = 2112;
      v39 = v11;
      v40 = 2112;
      v41 = v12;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v8)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v13;
      v38 = 2112;
      v39 = v15;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched successfully", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "checkSessionReceiptFieldsAvailibility:sessionID:", v5, *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v20;
        v38 = 2112;
        v39 = v22;
        v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Fetched all session receipt data successfully", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 40), "sessionReceipts");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v17);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v30 = *(_QWORD *)(a1 + 32);
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v30;
        v38 = 2112;
        v39 = v32;
        v40 = 2112;
        v41 = v33;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Failed to fetch session receipt data", buf, 0x20u);

      }
      v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v26 = *MEMORY[0x1E0D8BB70];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing Fields of Session Receipt data"), *MEMORY[0x1E0CB2D50]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 7, v28);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (id)checkSessionReceiptFieldsAvailibility:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const char *aSelector;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v6, "encryptedValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sessionStartTimeEncrypted"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_11;
  v12 = (void *)v11;
  objc_msgSend(v6, "encryptedValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionEndTimeEncrypted"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  v15 = (void *)v14;
  objc_msgSend(v6, "encryptedValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("allReceiverHandlesEncrypted"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_9:

    goto LABEL_10;
  }
  v18 = (void *)v17;
  aSelector = a2;
  v48 = v9;
  objc_msgSend(v6, "encryptedValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("sessionTypeEncrypted"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {

    a2 = aSelector;
    goto LABEL_9;
  }
  v21 = (void *)v20;
  objc_msgSend(v6, "encryptedValues");
  v46 = v6;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("safetyCacheReadStatusEncrypted"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v46;
  a2 = aSelector;
  v9 = v48;
  if (v23)
  {
    v42 = objc_alloc(MEMORY[0x1E0D8BA50]);
    objc_msgSend(v46, "encryptedValues");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("sessionTypeEncrypted"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v44, "unsignedIntegerValue");
    objc_msgSend(v46, "encryptedValues");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("sessionStartTimeEncrypted"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "encryptedValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("sessionEndTimeEncrypted"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "encryptedValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("allReceiverHandlesEncrypted"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "encryptedValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("safetyCacheReadStatusEncrypted"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v42, "initWithSessionID:sessionType:sessionStartTime:sessionEndTime:receiverHandles:safetyCacheReadStaus:", v48, v24, v25, v27, v29, objc_msgSend(v31, "BOOLValue"));

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v9 = v48;
      v50 = v48;
      v51 = 2112;
      v52 = v35;
      v53 = 2112;
      v54 = v36;
      _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Fetched session receipt data", buf, 0x20u);

    }
    else
    {
      v9 = v48;
    }
    v8 = v46;
    goto LABEL_15;
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = v8;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v50 = v9;
    v51 = 2112;
    v52 = v40;
    v53 = 2112;
    v54 = v41;
    _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,Missing fields in session receipt", buf, 0x20u);

    v8 = v39;
  }
  v32 = 0;
LABEL_15:

  return v32;
}

- (NSMutableArray)sessionReceipts
{
  return self->_sessionReceipts;
}

- (void)setSessionReceipts:(id)a3
{
  objc_storeStrong((id *)&self->_sessionReceipts, a3);
}

- (BOOL)sessionReceiptZoneAvailable
{
  return self->_sessionReceiptZoneAvailable;
}

- (void)setSessionReceiptZoneAvailable:(BOOL)a3
{
  self->_sessionReceiptZoneAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionReceipts, 0);
}

@end
