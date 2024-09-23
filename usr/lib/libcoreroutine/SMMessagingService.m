@implementation SMMessagingService

- (SMMessagingService)init
{
  SMMessagingService *v2;
  SMMessagingService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SMMessagingService;
  v2 = -[RTNotifier init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[RTService setup](v2, "setup");
  return v3;
}

- (void)_setup
{
  SMIDSMessenger *v4;
  void *v5;
  SMIDSMessenger *v6;
  void *v7;
  SMMadridMessenger *v8;
  void *v9;
  SMMadridMessenger *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v4 = [SMIDSMessenger alloc];
    -[RTNotifier queue](self, "queue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SMIDSMessenger initWithQueue:](v4, "initWithQueue:", v5);
    -[SMMessagingService setIdsMessenger:](self, "setIdsMessenger:", v6);

    -[SMMessagingService idsMessenger](self, "idsMessenger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    v8 = [SMMadridMessenger alloc];
    -[RTNotifier queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SMMadridMessenger initWithQueue:](v8, "initWithQueue:", v9);
    -[SMMessagingService setMadridMessenger:](self, "setMadridMessenger:", v10);

    -[SMMessagingService madridMessenger](self, "madridMessenger");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,feature not enabled", buf, 0x16u);

    }
  }
}

- (void)findObjectForMyAccountFromDict:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SMMessagingService_findObjectForMyAccountFromDict_withHandler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __65__SMMessagingService_findObjectForMyAccountFromDict_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "idsMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findObjectForMyAccountFromDict:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSUUID)deviceIdentifier
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v3 = (void *)IDSCopyLocalDeviceUniqueID();
  v4 = (void *)objc_msgSend(v2, "initWithUUIDString:", v3);

  return (NSUUID *)v4;
}

- (void)startSubscriptionOnNearbyDevicesChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SMMessagingService_startSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __61__SMMessagingService_startSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSubscriptionOnNearbyDevicesChange");
}

- (void)_startSubscriptionOnNearbyDevicesChange
{
  id v2;

  -[SMMessagingService idsMessenger](self, "idsMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startSubscriptionOnNearbyDevicesChanged");

}

- (void)cancelSubscriptionOnNearbyDevicesChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SMMessagingService_cancelSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __62__SMMessagingService_cancelSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSubscriptionOnNearbyDevicesChange");
}

- (void)_cancelSubscriptionOnNearbyDevicesChange
{
  id v2;

  -[SMMessagingService idsMessenger](self, "idsMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelSubscriptionOnNearbyDevicesChanged");

}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString **v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  char *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  char *v31;
  void *v32;
  char *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  void (**v41)(id, _QWORD, void *);
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[SMMessagingService sendIDSMessage:toConversation:completion:]";
      v44 = 1024;
      LODWORD(v45) = 209;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v31;
      v44 = 2112;
      v45 = v32;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);

    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D18598];
    v56 = *MEMORY[0x1E0CB2D50];
    v57[0] = CFSTR("message is nil");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = (const __CFString **)v57;
    v21 = &v56;
    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "sessionID");
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v43 = v33;
      v44 = 2112;
      v45 = v35;
      v46 = 2112;
      v47 = v36;
      v48 = 2112;
      v49 = v37;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation is nil", buf, 0x2Au);

    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D18598];
    v54 = *MEMORY[0x1E0CB2D50];
    v55 = CFSTR("conversation is nil");
    v19 = (void *)MEMORY[0x1E0C99D80];
    v20 = &v55;
    v21 = &v54;
LABEL_16:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v23);

    goto LABEL_17;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "sessionID");
    v24 = (char *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "receiverHandles");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v43 = v24;
    v44 = 2112;
    v45 = v26;
    v46 = 2112;
    v47 = v27;
    v48 = 2112;
    v49 = v28;
    v50 = 2112;
    v51 = v29;
    v52 = 2112;
    v53 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,handles:%@,messsage:%@", buf, 0x3Eu);

  }
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __63__SMMessagingService_sendIDSMessage_toConversation_completion___block_invoke;
  v38[3] = &unk_1E9297EB8;
  v38[4] = self;
  v39 = v9;
  v40 = v10;
  v41 = v11;
  dispatch_async(v15, v38);

LABEL_17:
}

void __63__SMMessagingService_sendIDSMessage_toConversation_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "idsMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendIDSMessage:toConversation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  char *v23;
  void *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMMessagingService sendIDSMessageToMyDevices:completion:]";
      v30 = 1024;
      LODWORD(v31) = 242;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "sessionID");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v29 = v17;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messsage:%@", buf, 0x34u);

    }
    -[RTNotifier queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SMMessagingService_sendIDSMessageToMyDevices_completion___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v26 = v7;
    v27 = v8;
    dispatch_async(v12, block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("message is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);

  }
}

void __59__SMMessagingService_sendIDSMessageToMyDevices_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "idsMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendIDSMessageToMyDevices:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  char *v23;
  void *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMMessagingService sendIDSMessageToPairedDevice:completion:]";
      v30 = 1024;
      LODWORD(v31) = 265;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "sessionID");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v29 = v17;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messsage:%@", buf, 0x34u);

    }
    -[RTNotifier queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SMMessagingService_sendIDSMessageToPairedDevice_completion___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v26 = v7;
    v27 = v8;
    dispatch_async(v12, block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("message is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);

  }
}

void __62__SMMessagingService_sendIDSMessageToPairedDevice_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "idsMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendIDSMessageToPairedDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  char *v23;
  void *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[SMMessagingService sendIDSMessageToMyNearbyDevices:completion:]";
      v30 = 1024;
      LODWORD(v31) = 288;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "sessionID");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v29 = v17;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v7;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messsage:%@", buf, 0x34u);

    }
    -[RTNotifier queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__SMMessagingService_sendIDSMessageToMyNearbyDevices_completion___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v26 = v7;
    v27 = v8;
    dispatch_async(v12, block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("message is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);

  }
}

void __65__SMMessagingService_sendIDSMessageToMyNearbyDevices_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "idsMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendIDSMessageToMyNearbyDevices:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)effectivePairedDevice
{
  void *v2;
  void *v3;

  -[SMMessagingService idsMessenger](self, "idsMessenger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)convertRTPlatformToIDSDeviceType:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[SMMessagingService idsMessenger](self, "idsMessenger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "convertRTPlatformToIDSDeviceType:", v4);

  return v6;
}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v11;
      v31 = 2112;
      v32 = v12;
      v33 = 1024;
      v34 = v7;
      v35 = 2112;
      v36 = v13;
      _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageUrl:%@,messageGUID:%@,success:%d,error:%@", buf, 0x3Au);

    }
    -[RTNotifier queue](self, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__SMMessagingService_iMessageSendFor_guid_successful_withError___block_invoke;
    block[3] = &unk_1E92A29A0;
    block[4] = self;
    v21 = v11;
    v22 = v12;
    v24 = v7;
    v23 = v13;
    dispatch_async(v15, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl", buf, 2u);
    }

  }
}

void __64__SMMessagingService_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iMessageSendFor:guid:successful:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v7 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageUrl";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_9;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v27 = v19;
    v28 = 2112;
    v29 = v20;
    v30 = 2112;
    v31 = v12;
    v32 = 1024;
    v33 = v7;
    v34 = 2112;
    v35 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageGUID:%@,success:%d,error:%@", buf, 0x30u);

  }
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SMMessagingService_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  block[3] = &unk_1E92A29A0;
  block[4] = self;
  v22 = v11;
  v23 = v12;
  v25 = v7;
  v24 = v13;
  dispatch_async(v15, block);

LABEL_10:
}

void __82__SMMessagingService_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iMessageScheduledSendScheduledFor:guid:successful:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v9;
      v27 = 1024;
      v28 = v6;
      v29 = 2112;
      v30 = v10;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageGUID:%@,success:%d,error:%@", buf, 0x30u);

    }
    -[RTNotifier queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__SMMessagingService_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
    v17[3] = &unk_1E929EBC0;
    v17[4] = self;
    v18 = v9;
    v20 = v6;
    v19 = v10;
    dispatch_async(v12, v17);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID", buf, 2u);
    }

  }
}

void __74__SMMessagingService_iMessageScheduledSendCancelFor_successful_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iMessageScheduledSendCancelFor:successful:withError:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)iMessageScheduledSendTriggeredFor:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageGUID:%@", buf, 0x20u);

    }
    -[RTNotifier queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__SMMessagingService_iMessageScheduledSendTriggeredFor___block_invoke;
    v12[3] = &unk_1E9297540;
    v12[4] = self;
    v13 = v5;
    dispatch_async(v7, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID", buf, 2u);
    }

  }
}

void __56__SMMessagingService_iMessageScheduledSendTriggeredFor___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iMessageScheduledSendTriggeredFor:", *(_QWORD *)(a1 + 40));

}

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: messageUrl";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: handle";
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v17;
    v25 = 2112;
    v26 = v18;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v11;
    v31 = 1024;
    v32 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messsageUrl:%@,handle:%@,fromMe:%d", buf, 0x30u);

  }
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__SMMessagingService_iMessageReceived_fromHandle_fromMe___block_invoke;
  v19[3] = &unk_1E929EBC0;
  v19[4] = self;
  v20 = v9;
  v21 = v11;
  v22 = v5;
  dispatch_async(v13, v19);

LABEL_10:
}

void __57__SMMessagingService_iMessageReceived_fromHandle_fromMe___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iMessageReceived:fromHandle:fromMe:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

}

- (void)iMessageDeletedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)buf = 138413058;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2048;
      v19 = objc_msgSend(v5, "count");
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,numMessageUrls,%lu,messsageUrls:%@", buf, 0x2Au);

    }
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__SMMessagingService_iMessageDeletedFor___block_invoke;
    v12[3] = &unk_1E9297540;
    v12[4] = self;
    v13 = v5;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrls", buf, 2u);
    }

  }
}

void __41__SMMessagingService_iMessageDeletedFor___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iMessageDeletedFor:", *(_QWORD *)(a1 + 40));

}

- (void)iMessageConversationDeletedFor:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  SMMessagingService *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v9;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,recipients,%@", buf, 0x20u);

    }
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      v16 = MEMORY[0x1E0C9AA60];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B960]), "initWithPrimaryHandle:secondaryHandles:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17), v16);
          -[NSObject addObject:](v11, "addObject:", v18);

          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v14);
    }

    v19 = objc_alloc(MEMORY[0x1E0D8B918]);
    v20 = -[NSObject copy](v11, "copy");
    v21 = (void *)objc_msgSend(v19, "initWithReceiverHandles:identifier:displayName:", v20, 0, 0);

    -[RTNotifier queue](self, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __53__SMMessagingService_iMessageConversationDeletedFor___block_invoke;
    v24[3] = &unk_1E9297540;
    v25 = v21;
    v26 = self;
    v23 = v21;
    dispatch_async(v22, v24);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles && receiverHandles.count", buf, 2u);
    }
  }

}

void __53__SMMessagingService_iMessageConversationDeletedFor___block_invoke(uint64_t a1)
{
  SMConversationDeletedNotification *v2;

  v2 = -[SMConversationDeletedNotification initWithConversation:]([SMConversationDeletedNotification alloc], "initWithConversation:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "postNotification:", v2);

}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  char *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  objc_class *v35;
  char *v36;
  void *v37;
  char *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "-[SMMessagingService sendMadridMessage:associatedGUID:toConversation:summaryText:completion:]";
      v52 = 1024;
      LODWORD(v53) = 433;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v36;
      v52 = 2112;
      v53 = v37;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);

    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D18598];
    v66 = *MEMORY[0x1E0CB2D50];
    v67[0] = CFSTR("message is nil");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = (const __CFString **)v67;
    v27 = &v66;
    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "sessionID");
      v38 = (char *)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messageID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v51 = v38;
      v52 = 2112;
      v53 = v40;
      v54 = 2112;
      v55 = v41;
      v56 = 2112;
      v57 = (uint64_t)v42;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation is nil", buf, 0x2Au);

    }
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D18598];
    v64 = *MEMORY[0x1E0CB2D50];
    v65 = CFSTR("conversation is nil");
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = &v65;
    v27 = &v64;
LABEL_16:
    objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 7, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v29);

    goto LABEL_17;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "sessionID");
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageID");
    v33 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v51 = v30;
    v52 = 2112;
    v53 = v43;
    v54 = 2112;
    v55 = v32;
    v56 = 2112;
    v57 = v33;
    v34 = (void *)v33;
    v58 = 2112;
    v59 = v15;
    v60 = 2112;
    v61 = v14;
    v62 = 2112;
    v63 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation:%@,associatedGUID:%@,messsage:%@", buf, 0x48u);

  }
  -[RTNotifier queue](self, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SMMessagingService_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E9298280;
  block[4] = self;
  v45 = v13;
  v46 = v14;
  v47 = v15;
  v48 = v16;
  v49 = v17;
  dispatch_async(v21, block);

LABEL_17:
}

void __93__SMMessagingService_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendMadridMessage:associatedGUID:toConversation:summaryText:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString **v31;
  uint64_t *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  char *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  objc_class *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  objc_class *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  void *v58;
  void *v59;
  char *v60;
  void *v61;
  char *v62;
  char *v63;
  _QWORD block[5];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  id v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;
  __int16 v88;
  id v89;
  uint64_t v90;
  const __CFString *v91;
  uint64_t v92;
  const __CFString *v93;
  uint64_t v94;
  const __CFString *v95;
  uint64_t v96;
  _QWORD v97[4];

  v97[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v73 = "-[SMMessagingService scheduleMadridMessageSendForMessage:messageGUID:associatedGUID:sendDate:toConversation:"
            "summaryText:completion:]";
      v74 = 1024;
      LODWORD(v75) = 473;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v38;
      v74 = 2112;
      v75 = v39;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message is nil", buf, 0x16u);

    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0D18598];
    v96 = *MEMORY[0x1E0CB2D50];
    v97[0] = CFSTR("message is nil");
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = (const __CFString **)v97;
    v32 = &v96;
    goto LABEL_24;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "sessionID");
      v60 = (char *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageID");
      v42 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v73 = v60;
      v74 = 2112;
      v75 = v56;
      v76 = 2112;
      v77 = v41;
      v78 = 2112;
      v79 = v42;
      v43 = (void *)v42;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messageGUID is nil", buf, 0x2Au);

    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0D18598];
    v94 = *MEMORY[0x1E0CB2D50];
    v95 = CFSTR("messageGUID is nil");
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v95;
    v32 = &v94;
    goto LABEL_24;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "sessionID");
      v62 = (char *)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageID");
      v48 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v73 = v62;
      v74 = 2112;
      v75 = v58;
      v76 = 2112;
      v77 = v47;
      v78 = 2112;
      v79 = v48;
      v49 = (void *)v48;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,conversation is nil", buf, 0x2Au);

    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0D18598];
    v92 = *MEMORY[0x1E0CB2D50];
    v93 = CFSTR("conversation is nil");
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v93;
    v32 = &v92;
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v19)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "sessionID");
      v63 = (char *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageID");
      v52 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v73 = v63;
      v74 = 2112;
      v75 = v59;
      v76 = 2112;
      v77 = v51;
      v78 = 2112;
      v79 = v52;
      v53 = (void *)v52;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sendDate is nil", buf, 0x2Au);

    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0D18598];
    v90 = *MEMORY[0x1E0CB2D50];
    v91 = CFSTR("sendDate is nil");
    v30 = (void *)MEMORY[0x1E0C99D80];
    v31 = &v91;
    v32 = &v90;
LABEL_24:
    objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 7, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, 0, 0, v36);

    goto LABEL_25;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v16, "sessionID");
    v57 = (char *)objc_claimAutoreleasedReturnValue();
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "messageID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v73 = v57;
    v74 = 2112;
    v75 = v61;
    v76 = 2112;
    v77 = v55;
    v78 = 2112;
    v79 = (uint64_t)v45;
    v80 = 2112;
    v81 = v17;
    v82 = 2112;
    v83 = v54;
    v84 = 2112;
    v85 = v20;
    v86 = 2112;
    v87 = v18;
    v88 = 2112;
    v89 = v16;
    _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,messageGUID:%@,sendDate:%@,conversation:%@,associatedGUID:%@,message:%@", buf, 0x5Cu);

  }
  -[RTNotifier queue](self, "queue");
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__SMMessagingService_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E92A29C8;
  block[4] = self;
  v65 = v16;
  v66 = v17;
  v67 = v18;
  v68 = v19;
  v69 = v20;
  v70 = v21;
  v71 = v22;
  dispatch_async(v26, block);

LABEL_25:
}

void __132__SMMessagingService_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleMadridMessageSendForMessage:messageGUID:associatedGUID:sendDate:toConversation:summaryText:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *v12;
  NSObject *v13;
  objc_class *v14;
  char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  char *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void (**v31)(id, _QWORD, void *);
  id v32;
  id v33;
  objc_class *v34;
  char *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (v11)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[SMMessagingService cancelMadridMessageSendForMessageGUID:toConversation:completion:]";
      v43 = 1024;
      LODWORD(v44) = 529;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v15;
    v43 = 2112;
    v44 = v16;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,nil messageGUID", buf, 0x16u);

  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v18 = *MEMORY[0x1E0D18598];
  v51 = *MEMORY[0x1E0CB2D50];
  v52[0] = CFSTR("messageGUID is nil");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, 0, v20);

  if (!v10)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v23;
      v43 = 2112;
      v44 = v24;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,nil conversation", buf, 0x16u);

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v49 = *MEMORY[0x1E0CB2D50];
    v50 = CFSTR("conversation is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 7, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v28);

  }
LABEL_14:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v42 = v35;
    v43 = 2112;
    v44 = v36;
    v45 = 2112;
    v46 = v9;
    v47 = 2112;
    v48 = v10;
    _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,messageGUID:%@,conversation:%@", buf, 0x2Au);

  }
  -[RTNotifier queue](self, "queue");
  v30 = objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __86__SMMessagingService_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke;
  v37[3] = &unk_1E9297EB8;
  v37[4] = self;
  v38 = v9;
  v39 = v10;
  v40 = v11;
  v31 = v11;
  v32 = v10;
  v33 = v9;
  dispatch_async(v30, v37);

}

void __86__SMMessagingService_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "madridMessenger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelMadridMessageSendForMessageGUID:toConversation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)receivedSessionStartMessageSendResultWithMessage:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  SMSessionStartMessageSendResultNotification *v15;
  const char *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v7 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = (SMSessionStartMessageSendResultNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v22) = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, &v15->super.super, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v22, 2u);
    goto LABEL_9;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = (SMSessionStartMessageSendResultNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v22) = 0;
    v16 = "Invalid parameter not satisfying: guid";
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138414082;
    v23 = v17;
    v24 = 2112;
    v25 = v19;
    v26 = 2112;
    v27 = v20;
    v28 = 2112;
    v29 = v21;
    v30 = 2112;
    v31 = v12;
    v32 = 1024;
    v33 = v7;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v11;
    _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received session start message send result,guid,%@,success,%d,error,%@,message,%@", (uint8_t *)&v22, 0x4Eu);

  }
  v15 = -[SMSessionStartMessageSendResultNotification initWithSessionStartMessage:messageGUID:success:error:]([SMSessionStartMessageSendResultNotification alloc], "initWithSessionStartMessage:messageGUID:success:error:", v11, v12, v7, v13);
  -[RTNotifier postNotification:](self, "postNotification:", v15);
LABEL_9:

}

- (void)receivedMessage:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  SMMessageReceivedNotification *v13;
  const char *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = (SMMessageReceivedNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v20) = 0;
    v14 = "Invalid parameter not satisfying: message";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, &v13->super.super, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v20, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = (SMMessageReceivedNotification *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super.super, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v20) = 0;
    v14 = "Invalid parameter not satisfying: fromHandle";
    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413826;
    v21 = v15;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v19;
    v28 = 2112;
    v29 = v11;
    v30 = 1024;
    v31 = v5;
    v32 = 2112;
    v33 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received message from handle %@,fromMe,%d,message,%@", (uint8_t *)&v20, 0x44u);

  }
  v13 = -[SMMessageReceivedNotification initWithMessage:fromHandle:fromMe:]([SMMessageReceivedNotification alloc], "initWithMessage:fromHandle:fromMe:", v9, v11, v5);
  -[RTNotifier postNotification:](self, "postNotification:", v13);
LABEL_9:

}

- (void)deletedMessage:(id)a3
{
  id v5;
  NSObject *v6;
  SMMessageDeletedNotification *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "sessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413314;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,deleted message,%@", (uint8_t *)&v13, 0x34u);

    }
    v7 = -[SMMessageDeletedNotification initWithMessage:]([SMMessageDeletedNotification alloc], "initWithMessage:", v5);
    -[RTNotifier postNotification:](self, "postNotification:", v7);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = (SMMessageDeletedNotification *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D1A22000, &v7->super.super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message", (uint8_t *)&v13, 2u);
    }
  }

}

+ (BOOL)isCellularActivated
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  objc_class *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  intptr_t (*v31)(uint64_t, char, uint64_t);
  void *v32;
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE buf[12];
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v3 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __41__SMMessagingService_isCellularActivated__block_invoke;
  v32 = &unk_1E929F3E8;
  v34 = &v35;
  v5 = v3;
  v33 = v5;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:handler:](SMInitiatorEligibility, "checkCellularEnabledWithQueue:handler:", v4, &v29);

  v6 = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v29, v30, v31, v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v6, v8))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v7);
  v11 = v10;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_94);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "submitToCoreAnalytics:type:duration:", v16, 1, v11);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v18 = (void *)MEMORY[0x1E0CB35C8];
  v44[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v44, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_retainAutorelease(v20);

  }
  else
  {
LABEL_6:
    v21 = 0;
  }

  v22 = v21;
  if (v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v27;
      v40 = 2112;
      v41 = v28;
      v42 = 2112;
      v43 = v22;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,sema error,%@", buf, 0x20u);

    }
  }
  v24 = *((_BYTE *)v36 + 24) != 0;

  _Block_object_dispose(&v35, 8);
  return v24;
}

intptr_t __41__SMMessagingService_isCellularActivated__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isStandalone
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D8B928]);
  dispatch_get_global_queue(2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithQueue:", v3);

  LOBYTE(v3) = objc_msgSend(v4, "isEffectivePairedDeviceNearby") ^ 1;
  return (char)v3;
}

+ (void)submitCAMetricForMessageType:(unint64_t)a3 scheduledSend:(BOOL)a4 cancelationAttempt:(BOOL)a5 attemptNumber:(int64_t)a6 wasFinalAttempt:(BOOL)a7 timeToSendMessage:(double)a8 sendError:(id)a9 success:(BOOL)a10 numReceivers:(unint64_t)a11
{
  _BOOL8 v12;
  _BOOL8 v14;
  _BOOL8 v15;
  id v18;
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
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v12 = a7;
  v14 = a5;
  v15 = a4;
  v33 = a9;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v19, CFSTR("timeToSendMessage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v20, CFSTR("attemptNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", a3));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v21, CFSTR("interfaceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v22, CFSTR("isScheduledSend"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v23, CFSTR("isCancelationAttempt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v24, CFSTR("messageType"));

  if (v33)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v33, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@:%d"), v26, objc_msgSend(v33, "code"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forKey:", v27, CFSTR("sendError"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v28, CFSTR("wasFinalAttempt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v29, CFSTR("wasSuccessful"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isCellularActivated"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v30, CFSTR("isCellularActivated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isStandalone"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v31, CFSTR("isStandalone"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKey:", v32, CFSTR("numReceivers"));

  AnalyticsSendEvent();
}

- (SMIDSMessenger)idsMessenger
{
  return self->_idsMessenger;
}

- (void)setIdsMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_idsMessenger, a3);
}

- (SMMadridMessenger)madridMessenger
{
  return self->_madridMessenger;
}

- (void)setMadridMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_madridMessenger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madridMessenger, 0);
  objc_storeStrong((id *)&self->_idsMessenger, 0);
}

@end
