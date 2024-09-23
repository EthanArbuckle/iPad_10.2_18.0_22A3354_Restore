@implementation SMSentinelZone

- (SMSentinelZone)initWithQueue:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  SMSentinelZone *v9;
  objc_super v11;

  v4 = (objc_class *)MEMORY[0x1E0C95098];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithZoneName:ownerName:", CFSTR("SentinelZone"), *MEMORY[0x1E0C94730]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v7);
  v11.receiver = self;
  v11.super_class = (Class)SMSentinelZone;
  v9 = -[SMCloudKitZone initWithZone:queue:](&v11, sel_initWithZone_queue_, v8, v5);

  return v9;
}

- (void)saveZoneWithXPCActivity:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  SMCloudKitQosOptions *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v7 = a4;
  v8 = a3;
  v9 = -[SMCloudKitQosOptions initWithDefaultQos:masqueradeBundleID:xpcActivity:]([SMCloudKitQosOptions alloc], "initWithDefaultQos:masqueradeBundleID:xpcActivity:", 0, 0, v8);

  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SMSentinelZone_saveZoneWithXPCActivity_completion___block_invoke;
  v12[3] = &unk_1E9297740;
  v13 = v7;
  v14 = a2;
  v12[4] = self;
  v11 = v7;
  -[SMCloudKitZone saveZoneToDatabase:qos:withCompletion:](self, "saveZoneToDatabase:qos:withCompletion:", v10, v9, v12);

}

void __53__SMSentinelZone_saveZoneWithXPCActivity_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413314;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 1024;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,%@,%@,success,%d,error,%@,underlying error,%@", (uint8_t *)&v13, 0x30u);

  }
  if (v7)
    v12 = v7;
  else
    v12 = v5;
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v12);

}

@end
