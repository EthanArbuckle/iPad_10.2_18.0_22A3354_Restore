@implementation SMIDSMessenger

- (SMIDSMessenger)initWithQueue:(id)a3
{
  id v5;
  SMIDSMessenger *v6;
  SMIDSMessenger *v7;
  uint64_t v8;
  NSMutableArray *idsMessagesWaitingForAck;
  id v10;
  uint64_t v11;
  IDSService *idsService;
  id v13;
  uint64_t v14;
  IDSService *ownAccountIDSService;
  SMIDSMessenger *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)SMIDSMessenger;
    v6 = -[SMIDSMessenger init](&v19, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_queue, a3);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      idsMessagesWaitingForAck = v7->_idsMessagesWaitingForAck;
      v7->_idsMessagesWaitingForAck = (NSMutableArray *)v8;

      v10 = objc_alloc(MEMORY[0x1E0D34358]);
      v11 = objc_msgSend(v10, "initWithService:", *MEMORY[0x1E0D8BBB0]);
      idsService = v7->_idsService;
      v7->_idsService = (IDSService *)v11;

      -[IDSService addDelegate:queue:](v7->_idsService, "addDelegate:queue:", v7, v7->_queue);
      v13 = objc_alloc(MEMORY[0x1E0D34358]);
      v14 = objc_msgSend(v13, "initWithService:", *MEMORY[0x1E0D8BBD8]);
      ownAccountIDSService = v7->_ownAccountIDSService;
      v7->_ownAccountIDSService = (IDSService *)v14;

      -[IDSService addDelegate:queue:](v7->_ownAccountIDSService, "addDelegate:queue:", v7, v7->_queue);
    }
    self = v7;
    v16 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)startSubscriptionOnNearbyDevicesChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[SMIDSMessenger queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SMIDSMessenger_startSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __57__SMIDSMessenger_startSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSubscriptionOnNearbyDevicesChanged");
}

- (void)_startSubscriptionOnNearbyDevicesChanged
{
  -[IDSService setNeedsLaunchOnNearbyDevicesChanged:](self->_idsService, "setNeedsLaunchOnNearbyDevicesChanged:", 1);
}

- (void)cancelSubscriptionOnNearbyDevicesChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[SMIDSMessenger queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SMIDSMessenger_cancelSubscriptionOnNearbyDevicesChanged__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __58__SMIDSMessenger_cancelSubscriptionOnNearbyDevicesChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSubscriptionOnNearbyDevicesChanged");
}

- (void)_cancelSubscriptionOnNearbyDevicesChanged
{
  -[IDSService setNeedsLaunchOnNearbyDevicesChanged:](self->_idsService, "setNeedsLaunchOnNearbyDevicesChanged:", 0);
}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  char *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString **v45;
  uint64_t *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  char *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  void *v63;
  char *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  const char *aSelector;
  SMIDSMessenger *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  const __CFString *v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;
  const __CFString *v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SMIDSMessenger sendIDSMessage:toConversation:completion:]";
      v81 = 1024;
      LODWORD(v82) = 159;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
LABEL_3:
      if (v11)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "-[SMIDSMessenger sendIDSMessage:toConversation:completion:]";
    v81 = 1024;
    LODWORD(v82) = 160;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v80 = "-[SMIDSMessenger sendIDSMessage:toConversation:completion:]";
      v81 = 1024;
      LODWORD(v82) = 161;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  if (objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "sessionID");
      v53 = (char *)objc_claimAutoreleasedReturnValue();
      v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend((id)objc_opt_class(), "messageType");
      *(_DWORD *)buf = 138413314;
      v80 = v53;
      v81 = 2112;
      v82 = v55;
      v83 = 2112;
      v84 = v56;
      v85 = 2112;
      v86 = v57;
      v87 = 1024;
      LODWORD(v88) = v58;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", buf, 0x30u);

    }
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0D18598];
    v94 = *MEMORY[0x1E0CB2D50];
    v95[0] = CFSTR("wrong spi used for sending message over IDS");
    v44 = (void *)MEMORY[0x1E0C99D80];
    v45 = (const __CFString **)v95;
    v46 = &v94;
    goto LABEL_38;
  }
  -[SMIDSMessenger idsService](self, "idsService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "sessionID");
      v59 = (char *)objc_claimAutoreleasedReturnValue();
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "messageID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v80 = v59;
      v81 = 2112;
      v82 = v61;
      v83 = 2112;
      v84 = v62;
      v85 = 2112;
      v86 = v63;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", buf, 0x2Au);

    }
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0D18598];
    v92 = *MEMORY[0x1E0CB2D50];
    v93 = CFSTR("IDSService unavailable");
    v44 = (void *)MEMORY[0x1E0C99D80];
    v45 = &v93;
    v46 = &v92;
LABEL_38:
    objc_msgSend(v44, "dictionaryWithObjects:forKeys:count:", v45, v46, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", v43, 5, v18);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v48);

    goto LABEL_39;
  }
  aSelector = a2;
  v71 = self;
  v72 = v9;
  v16 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v10, "receiverHandles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithCapacity:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v10, "receiverHandles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v74 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1E0D8B960];
        objc_msgSend(v24, "primaryHandle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "getSMHandleTypeWithHandle:", v26);

        if (v27 == 2)
        {
          objc_msgSend(v24, "primaryHandle");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = MEMORY[0x1D823138C]();
        }
        else
        {
          if (v27 != 1)
            continue;
          objc_msgSend(v24, "primaryHandle");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = IDSCopyIDForPhoneNumber();
        }
        v30 = (void *)v29;
        objc_msgSend(v18, "addObject:", v29);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v91, 16);
    }
    while (v21);
  }

  v31 = objc_msgSend(v18, "count");
  objc_msgSend(v10, "receiverHandles");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v31 == v33)
  {
    v9 = v72;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v72, "sessionID");
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "messageID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v80 = v36;
      v81 = 2112;
      v82 = v38;
      v83 = 2112;
      v84 = v39;
      v85 = 2112;
      v86 = v40;
      v87 = 2112;
      v88 = v18;
      _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to handles,%@", buf, 0x34u);

    }
    -[SMIDSMessenger sendMessage:toDestinations:completion:](v71, "sendMessage:toDestinations:completion:", v72, v18, v11);
  }
  else
  {
    v9 = v72;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v72, "sessionID");
      v64 = (char *)objc_claimAutoreleasedReturnValue();
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "messageID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "receiverPrimaryHandles");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v80 = v64;
      v81 = 2112;
      v82 = v66;
      v83 = 2112;
      v84 = v67;
      v85 = 2112;
      v86 = v68;
      v87 = 2112;
      v88 = v69;
      v89 = 2112;
      v90 = v18;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Invalid Handles %@,destinations %@", buf, 0x3Eu);

    }
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0D18598];
    v77 = *MEMORY[0x1E0CB2D50];
    v78 = CFSTR("Invalid Handle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, 7, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v52);

  }
LABEL_39:

}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString **v28;
  uint64_t *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  char *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  char *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v58 = 136315394;
    v59 = "-[SMIDSMessenger sendIDSMessageToMyDevices:completion:]";
    v60 = 1024;
    LODWORD(v61) = 220;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", (uint8_t *)&v58, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v58 = 136315394;
      v59 = "-[SMIDSMessenger sendIDSMessageToMyDevices:completion:]";
      v60 = 1024;
      LODWORD(v61) = 221;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v58, 0x12u);
    }

  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v37 = (char *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend((id)objc_opt_class(), "messageType");
      v58 = 138413314;
      v59 = v37;
      v60 = 2112;
      v61 = v39;
      v62 = 2112;
      v63 = v40;
      v64 = 2112;
      v65 = v41;
      v66 = 1024;
      LODWORD(v67) = v42;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", (uint8_t *)&v58, 0x30u);

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v74 = *MEMORY[0x1E0CB2D50];
    v75[0] = CFSTR("wrong spi used for sending message over IDS");
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = (const __CFString **)v75;
    v29 = &v74;
    goto LABEL_23;
  }
  -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 138413058;
      v59 = v43;
      v60 = 2112;
      v61 = v45;
      v62 = 2112;
      v63 = v46;
      v64 = 2112;
      v65 = v47;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", (uint8_t *)&v58, 0x2Au);

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v72 = *MEMORY[0x1E0CB2D50];
    v73 = CFSTR("IDSService unavailable");
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = &v73;
    v29 = &v72;
LABEL_23:
    objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);
    goto LABEL_31;
  }
  -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstRoutableInternetDestinationForSelf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)IDSCopyAddressDestinationForDestination();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "sessionID");
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 138413314;
        v59 = v18;
        v60 = 2112;
        v61 = v20;
        v62 = 2112;
        v63 = v21;
        v64 = 2112;
        v65 = v22;
        v66 = 2112;
        v67 = v15;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to my devices,%@", (uint8_t *)&v58, 0x34u);

      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMIDSMessenger sendMessage:toDestinations:completion:](self, "sendMessage:toDestinations:completion:", v7, v23, v9);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "sessionID");
        v53 = (char *)objc_claimAutoreleasedReturnValue();
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 138413058;
        v59 = v53;
        v60 = 2112;
        v61 = v55;
        v62 = 2112;
        v63 = v56;
        v64 = 2112;
        v65 = v57;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,null destination for self", (uint8_t *)&v58, 0x2Au);

      }
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0D18598];
      v68 = *MEMORY[0x1E0CB2D50];
      v69 = CFSTR("null destination for self");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 7, v23);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v36);

      v15 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v48 = (char *)objc_claimAutoreleasedReturnValue();
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 138413058;
      v59 = v48;
      v60 = 2112;
      v61 = v50;
      v62 = 2112;
      v63 = v51;
      v64 = 2112;
      v65 = v52;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,null routable destination for self", (uint8_t *)&v58, 0x2Au);

    }
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0D18598];
    v70 = *MEMORY[0x1E0CB2D50];
    v71 = CFSTR("null routable destination for self");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 7, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v23);
  }

LABEL_31:
}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString **v28;
  uint64_t *v29;
  NSObject *v30;
  NSObject *v31;
  char *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  char *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  char *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  const char *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  _QWORD v75[2];

  v75[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v58 = 136315394;
    v59 = "-[SMIDSMessenger sendIDSMessageToPairedDevice:completion:]";
    v60 = 1024;
    LODWORD(v61) = 275;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", (uint8_t *)&v58, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v58 = 136315394;
      v59 = "-[SMIDSMessenger sendIDSMessageToPairedDevice:completion:]";
      v60 = 1024;
      LODWORD(v61) = 276;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v58, 0x12u);
    }

  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v42 = (char *)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend((id)objc_opt_class(), "messageType");
      v58 = 138413314;
      v59 = v42;
      v60 = 2112;
      v61 = v44;
      v62 = 2112;
      v63 = v45;
      v64 = 2112;
      v65 = v46;
      v66 = 1024;
      LODWORD(v67) = v47;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", (uint8_t *)&v58, 0x30u);

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v74 = *MEMORY[0x1E0CB2D50];
    v75[0] = CFSTR("wrong spi used for sending message over IDS");
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = (const __CFString **)v75;
    v29 = &v74;
    goto LABEL_23;
  }
  -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v48 = (char *)objc_claimAutoreleasedReturnValue();
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 138413058;
      v59 = v48;
      v60 = 2112;
      v61 = v50;
      v62 = 2112;
      v63 = v51;
      v64 = 2112;
      v65 = v52;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", (uint8_t *)&v58, 0x2Au);

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v72 = *MEMORY[0x1E0CB2D50];
    v73 = CFSTR("IDSService unavailable");
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = &v73;
    v29 = &v72;
LABEL_23:
    objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);
    goto LABEL_31;
  }
  -[SMIDSMessenger effectivePairedDevice](self, "effectivePairedDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "sessionID");
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 138413314;
        v59 = v18;
        v60 = 2112;
        v61 = v20;
        v62 = 2112;
        v63 = v21;
        v64 = 2112;
        v65 = v22;
        v66 = 2112;
        v67 = v15;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to paired device,%@", (uint8_t *)&v58, 0x34u);

      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMIDSMessenger sendMessage:toDestinations:completion:](self, "sendMessage:toDestinations:completion:", v7, v23, v9);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "sessionID");
        v53 = (char *)objc_claimAutoreleasedReturnValue();
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 138413058;
        v59 = v53;
        v60 = 2112;
        v61 = v55;
        v62 = 2112;
        v63 = v56;
        v64 = 2112;
        v65 = v57;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,pairedDevice does not have a destination", (uint8_t *)&v58, 0x2Au);

      }
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0D18598];
      v68 = *MEMORY[0x1E0CB2D50];
      v69 = CFSTR("pairedDevice does not have a destination");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 0, v23);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v41);

      v15 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "sessionID");
      v32 = (char *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 138413058;
      v59 = v32;
      v60 = 2112;
      v61 = v34;
      v62 = 2112;
      v63 = v35;
      v64 = 2112;
      v65 = v36;
      _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,no effectivePairedDevice to send message", (uint8_t *)&v58, 0x2Au);

    }
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0D18598];
    v70 = *MEMORY[0x1E0CB2D50];
    v71 = CFSTR("No effectivePairedDevice to send message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 5, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v23);
  }

LABEL_31:
}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  char *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString **v29;
  uint64_t *v30;
  NSObject *v31;
  char *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  char *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  char *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  void *v53;
  char *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  const __CFString *v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  int v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "-[SMIDSMessenger sendIDSMessageToMyNearbyDevices:completion:]";
    v69 = 1024;
    LODWORD(v70) = 329;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "-[SMIDSMessenger sendIDSMessageToMyNearbyDevices:completion:]";
      v69 = 1024;
      LODWORD(v70) = 330;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType")) != 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend((id)objc_opt_class(), "messageType");
      *(_DWORD *)buf = 138413314;
      v68 = v43;
      v69 = 2112;
      v70 = v45;
      v71 = 2112;
      v72 = v46;
      v73 = 2112;
      v74 = v47;
      v75 = 1024;
      v76 = v48;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,wrong SPI being used for message type:%d", buf, 0x30u);

    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D18598];
    v65 = *MEMORY[0x1E0CB2D50];
    v66 = CFSTR("wrong spi used for sending message over IDS");
    v28 = (void *)MEMORY[0x1E0C99D80];
    v29 = &v66;
    v30 = &v65;
    goto LABEL_28;
  }
  -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v49 = (char *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v68 = v49;
      v69 = 2112;
      v70 = v51;
      v71 = 2112;
      v72 = v52;
      v73 = 2112;
      v74 = v53;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", buf, 0x2Au);

    }
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D18598];
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = CFSTR("IDSService unavailable");
    v28 = (void *)MEMORY[0x1E0C99D80];
    v29 = &v64;
    v30 = &v63;
LABEL_28:
    objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);
    goto LABEL_29;
  }
  -[SMIDSMessenger myNearbyDevices](self, "myNearbyDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    -[SMIDSMessenger myNearbyDestinationsFromDevices:](self, "myNearbyDestinationsFromDevices:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "sessionID");
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v68 = v19;
        v69 = 2112;
        v70 = v21;
        v71 = 2112;
        v72 = v22;
        v73 = 2112;
        v74 = v23;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to myNearbyDevices", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMIDSMessenger sendMessage:toDestinations:completion:](self, "sendMessage:toDestinations:completion:", v7, v24, v9);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "sessionID");
        v54 = (char *)objc_claimAutoreleasedReturnValue();
        v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageID");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v68 = v54;
        v69 = 2112;
        v70 = v56;
        v71 = 2112;
        v72 = v57;
        v73 = 2112;
        v74 = v58;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,myNearbyDevices do not have destinations", buf, 0x2Au);

      }
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0D18598];
      v59 = *MEMORY[0x1E0CB2D50];
      v60 = CFSTR("myNearbyDevices do not have destinations");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 0, v24);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v42);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "sessionID");
      v32 = (char *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v68 = v32;
      v69 = 2112;
      v70 = v34;
      v71 = 2112;
      v72 = v35;
      v73 = 2112;
      v74 = v36;
      _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,no nearby devices of mine to send a message", buf, 0x2Au);

    }
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0D18598];
    v61 = *MEMORY[0x1E0CB2D50];
    v62 = CFSTR("No myNearbyDevices to send message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 5, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v24);
  }

LABEL_29:
}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[SMIDSMessenger sendMessage:toDestinations:completion:]";
      v16 = 1024;
      v17 = 385;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 136315394;
    v15 = "-[SMIDSMessenger sendMessage:toDestinations:completion:]";
    v16 = 1024;
    v17 = 386;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinations (in %s:%d)", (uint8_t *)&v14, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[SMIDSMessenger sendMessage:toDestinations:completion:]";
      v16 = 1024;
      v17 = 387;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }

  }
LABEL_14:
  -[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:](self, "sendMessage:toDestinations:retryCount:completion:", v8, v9, 2, v10);

}

- (void)sendMessage:(id)a3 toDestinations:(id)a4 retryCount:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  id *v30;
  uint64_t *v31;
  uint64_t *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  char *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  SMIDSMessenger *v46;
  id v47;
  void *v48;
  SMIDSMessageWaitingForAck *v49;
  NSObject *v50;
  uint64_t v51;
  double v52;
  char *v53;
  objc_class *v54;
  void *v55;
  void (**v56)(id, _QWORD, void *);
  void *v57;
  void *v58;
  char *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  char *v65;
  id v66;
  void *v67;
  uint64_t v68;
  int64_t v69;
  void (**v70)(id, _QWORD, void *);
  void *v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
      v82 = 1024;
      LODWORD(v83) = 401;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if ((a5 & 0x8000000000000000) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
    v82 = 1024;
    LODWORD(v83) = 402;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinations (in %s:%d)", buf, 0x12u);
  }

  if ((a5 & 0x8000000000000000) == 0)
  {
LABEL_4:
    if (v12)
      goto LABEL_18;
    goto LABEL_15;
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
    v82 = 1024;
    LODWORD(v83) = 403;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: retryCount >= 0 (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_15:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "-[SMIDSMessenger sendMessage:toDestinations:retryCount:completion:]";
      v82 = 1024;
      LODWORD(v83) = 404;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_18:
  v17 = objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", objc_msgSend((id)objc_opt_class(), "messageType"));
  if (v17 == 3)
  {
    -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_27;
  }
  else
  {
    -[SMIDSMessenger idsService](self, "idsService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
LABEL_27:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "sessionID");
        v53 = (char *)objc_claimAutoreleasedReturnValue();
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v56 = v12;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "messageID");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v81 = v53;
        v82 = 2112;
        v83 = v55;
        v84 = 2112;
        v85 = v57;
        v86 = 2112;
        v87 = v58;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,IDSService unavailable", buf, 0x2Au);

        v12 = v56;
      }

      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0D18598];
      v94 = *MEMORY[0x1E0CB2D50];
      v95[0] = CFSTR("IDSService unavailable");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 5, v36);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v20);
      goto LABEL_44;
    }

  }
  v69 = a5;
  v70 = v12;
  v73 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "outputToDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = *MEMORY[0x1E0D34158];
  v93 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "sessionID");
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v81 = v22;
    v82 = 2112;
    v83 = v24;
    v84 = 2112;
    v85 = v25;
    v86 = 2112;
    v87 = v26;
    v88 = 2112;
    v89 = v73;
    v90 = 2112;
    v91 = v20;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to %@,messageDict:%@", buf, 0x3Eu);

  }
  if (v17 == 3)
  {
    -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v78 = 0;
    v79 = 0;
    v29 = (id *)&v79;
    v30 = (id *)&v78;
    v31 = &v79;
    v32 = &v78;
  }
  else
  {
    -[SMIDSMessenger idsService](self, "idsService");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v76 = 0;
    v77 = 0;
    v29 = (id *)&v77;
    v30 = (id *)&v76;
    v31 = &v77;
    v32 = &v76;
  }
  v11 = v73;
  v37 = objc_msgSend(v27, "sendMessage:toDestinations:priority:options:identifier:error:", v20, v73, 300, v75, v31, v32);
  v38 = *v29;
  v39 = *v30;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v37 || v39)
  {
    v74 = v38;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "sessionID");
      v59 = (char *)objc_claimAutoreleasedReturnValue();
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v81 = v59;
      v82 = 2112;
      v83 = v61;
      v84 = 2112;
      v85 = v62;
      v86 = 2112;
      v87 = v63;
      v88 = 2112;
      v89 = v39;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,send failed with error:%@", buf, 0x34u);

    }
    v12[2](v12, 0, v39);
    v51 = objc_msgSend((id)objc_opt_class(), "messageType");
    v36 = v72;
    objc_msgSend(v72, "timeIntervalSinceNow");
    LOBYTE(v68) = 0;
    +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v51, 0, 0, 3 - v69, 1, v39, -v52, v68, objc_msgSend(v11, "count"));
    v38 = v74;
  }
  else
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "sessionID");
      v42 = (char *)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageID");
      v46 = self;
      v47 = v38;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v81 = v42;
      v82 = 2112;
      v83 = v44;
      v84 = 2112;
      v85 = v45;
      v86 = 2112;
      v87 = v48;
      v88 = 2112;
      v89 = v47;
      _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message sent to IDS with identifier,%@", buf, 0x34u);

      v38 = v47;
      self = v46;

      v11 = v73;
    }

    v12 = v70;
    v49 = -[SMIDSMessageWaitingForAck initWithIdentifier:destinations:message:pendingRetryCount:messageSentDate:callback:]([SMIDSMessageWaitingForAck alloc], "initWithIdentifier:destinations:message:pendingRetryCount:messageSentDate:callback:", v38, v11, v10, v69, v72, v70);
    if (v49)
    {
      -[SMIDSMessenger idsMessagesWaitingForAck](self, "idsMessagesWaitingForAck");
      v50 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v50, "addObject:", v49);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        v64 = (objc_class *)objc_opt_class();
        NSStringFromClass(v64);
        v65 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v66 = v38;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v81 = v65;
        v82 = 2112;
        v83 = v67;
        _os_log_fault_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMIDSMessageWaitingForAck", buf, 0x16u);

        v38 = v66;
      }
    }
    v36 = v72;

  }
LABEL_44:

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  SMIDSMessenger *v18;
  id v19;
  SEL v20;
  BOOL v21;

  v11 = a5;
  v12 = a7;
  -[SMIDSMessenger queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke;
  block[3] = &unk_1E92978C0;
  v17 = v11;
  v18 = self;
  v21 = a6;
  v19 = v12;
  v20 = a2;
  v14 = v12;
  v15 = v11;
  dispatch_async(v13, block);

}

void __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  objc_class *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t buf[4];
  id v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  _BYTE v92[14];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = -1;
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__5;
    v77 = __Block_byref_object_dispose__5;
    v78 = 0;
    objc_msgSend(*(id *)(a1 + 40), "idsMessagesWaitingForAck");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke_86;
    v69[3] = &unk_1E9297898;
    v70 = *(id *)(a1 + 32);
    v71 = &v79;
    v72 = &v73;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v69);

    if (v80[3] == -1)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v84 = v23;
        v85 = 2112;
        v86 = v24;
        v87 = 2112;
        v88 = v25;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message not found for identifier %@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "idsMessagesWaitingForAck");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObjectAtIndex:", v80[3]);

      if (*(_BYTE *)(a1 + 64))
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)v74[5], "message");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "sessionID");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 56));
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v74[5], "message");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "messageID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v84 = v6;
          v85 = 2112;
          v86 = v8;
          v87 = 2112;
          v88 = v9;
          v89 = 2112;
          v90 = v11;
          _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send succeeded", buf, 0x2Au);

        }
        objc_msgSend((id)v74[5], "callback");
        v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v12[2](v12, 1, 0);

        v13 = objc_msgSend((id)v74[5], "pendingRetryCount");
        objc_msgSend((id)v74[5], "message");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend((id)objc_opt_class(), "messageType");
        v16 = objc_msgSend((id)v74[5], "pendingRetryCount");
        objc_msgSend((id)v74[5], "messageSentDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceNow");
        v19 = v18;
        objc_msgSend((id)v74[5], "destinations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v68) = 1;
        +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v15, 0, 0, 3 - v13, v16 == 0, 0, -v19, v68, objc_msgSend(v20, "count"));

      }
      else
      {
        v26 = objc_msgSend((id)v74[5], "pendingRetryCount");
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
        if (v26)
        {
          if (v28)
          {
            objc_msgSend((id)v74[5], "message");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "sessionID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (objc_class *)objc_opt_class();
            NSStringFromClass(v53);
            v54 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 56));
            v55 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v74[5], "message");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "messageID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend((id)v74[5], "pendingRetryCount");
            v59 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138413570;
            v84 = v52;
            v85 = 2112;
            v86 = v54;
            v87 = 2112;
            v88 = v55;
            v89 = 2112;
            v90 = v57;
            v91 = 1024;
            *(_DWORD *)v92 = v58;
            *(_WORD *)&v92[4] = 2112;
            *(_QWORD *)&v92[6] = v59;
            _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send failed with %d retries left with error %@", buf, 0x3Au);

          }
          v29 = *(void **)(a1 + 40);
          objc_msgSend((id)v74[5], "message");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v74[5], "destinations");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend((id)v74[5], "pendingRetryCount");
          objc_msgSend((id)v74[5], "callback");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "sendMessage:toDestinations:retryCount:completion:", v30, v31, v32 - 1, v33);

          objc_msgSend((id)v74[5], "message");
          v14 = objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend((id)objc_opt_class(), "messageType");
          v35 = objc_msgSend((id)v74[5], "pendingRetryCount");
          objc_msgSend((id)v74[5], "messageSentDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "timeIntervalSinceNow");
          v38 = v37;
          v39 = *(_QWORD *)(a1 + 48);
          objc_msgSend((id)v74[5], "destinations");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v68) = 0;
          +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v34, 0, 0, 3 - v35, 0, v39, -v38, v68, objc_msgSend(v40, "count"));

        }
        else
        {
          if (v28)
          {
            objc_msgSend((id)v74[5], "message");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "sessionID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (objc_class *)objc_opt_class();
            NSStringFromClass(v62);
            v63 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 56));
            v64 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v74[5], "message");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "messageID");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 138413314;
            v84 = v61;
            v85 = 2112;
            v86 = v63;
            v87 = 2112;
            v88 = v64;
            v89 = 2112;
            v90 = v66;
            v91 = 2112;
            *(_QWORD *)v92 = v67;
            _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send failed on last retry with error %@", buf, 0x34u);

          }
          objc_msgSend((id)v74[5], "callback");
          v41 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v41[2](v41, 0, *(_QWORD *)(a1 + 48));

          objc_msgSend((id)v74[5], "message");
          v14 = objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend((id)objc_opt_class(), "messageType");
          objc_msgSend((id)v74[5], "messageSentDate");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "timeIntervalSinceNow");
          v45 = v44;
          v46 = *(_QWORD *)(a1 + 48);
          objc_msgSend((id)v74[5], "destinations");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v68) = 0;
          +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v42, 0, 0, 3, 1, v46, -v45, v68, objc_msgSend(v47, "count"));

        }
      }
    }

    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v79, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v84 = v49;
      v85 = 2112;
      v86 = v50;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,nil identifier", buf, 0x16u);

    }
  }
}

void __70__SMIDSMessenger_service_account_identifier_didSendWithSuccess_error___block_invoke_86(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", a1[4]);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: messageDict";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_7;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: fromID";
    goto LABEL_10;
  }
  -[SMIDSMessenger queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SMIDSMessenger_service_account_incomingMessage_fromID___block_invoke;
  block[3] = &unk_1E92978E8;
  block[4] = self;
  v20 = v15;
  v21 = v13;
  v22 = v11;
  v23 = a2;
  dispatch_async(v16, block);

LABEL_8:
}

void __57__SMIDSMessenger_service_account_incomingMessage_fromID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  char v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _BYTE v34[10];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "idsService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceForFromID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)IDSCopyRawAddressForDestination();
  v5 = objc_msgSend(MEMORY[0x1E0D8B9A8], "messageTypeFromDict:", *(_QWORD *)(a1 + 48));
  v6 = objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", v5);
  if (v3)
  {
    if (v6 != 3)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 56), "serviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x1E0D8BBD8];
  }
  else
  {
    if (v6 != 2)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 56), "serviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x1E0D8BBB0];
  }
  v10 = objc_msgSend(v7, "isEqualToString:", *v9);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8B9A8], "createMessageFromDict:", *(_QWORD *)(a1 + 48));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D8B960]);
      v13 = objc_msgSend(v12, "initWithPrimaryHandle:secondaryHandles:", v4, MEMORY[0x1E0C9AA60]);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject sessionID](v11, "sessionID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject messageID](v11, "messageID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        v30 = v15;
        v31 = 2112;
        v32 = v17;
        v33 = 2112;
        *(_QWORD *)v34 = v18;
        *(_WORD *)&v34[8] = 2112;
        v35 = v19;
        v36 = 2112;
        v37 = v4;
        v38 = 1024;
        v39 = v3 != 0;
        v40 = 2112;
        v41 = v11;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received message from %@,fromMe,%d,message,%@", buf, 0x44u);

      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "receivedMessage:fromHandle:fromMe:", v11, v13, v3 != 0);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        v30 = v26;
        v31 = 2112;
        v32 = v27;
        v33 = 2112;
        *(_QWORD *)v34 = v4;
        *(_WORD *)&v34[8] = 2112;
        v35 = v28;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received message from %@ could not be converted to SMMessage,messageDict,%@", buf, 0x2Au);

      }
    }

    goto LABEL_16;
  }
LABEL_11:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v21 = v3 != 0;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v30 = v23;
    v31 = 2112;
    v32 = v24;
    v33 = 1024;
    *(_DWORD *)v34 = v5;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v21;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received unexpected message type %d when fromMe:%d", buf, 0x22u);

  }
LABEL_16:

}

- (id)effectivePairedDevice
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isDefaultPairedDevice") && objc_msgSend(v7, "relationship") == 1)
        {
          v4 = v7;
          goto LABEL_12;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

+ (int64_t)convertRTPlatformToIDSDeviceType:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "iPhoneDevice") && (objc_msgSend(v3, "iPhonePlatform") & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "watchPlatform") & 1) != 0)
  {
    v4 = 6;
  }
  else
  {
    v4 = objc_msgSend(v3, "macOSPlatform");
  }

  return v4;
}

- (void)findObjectForMyAccountFromDict:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  SMIDSMessenger *v32;
  const char *aSelector;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[SMIDSMessenger idsService](self, "idsService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    v34 = *(_QWORD *)v41;
    v35 = v8;
    v32 = self;
    aSelector = a2;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v15, "vettedAliases", v32);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v37;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v37 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v7, "objectForKey:", v21);
              v22 = objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v24 = (void *)v22;
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  v26 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(aSelector);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v45 = v27;
                  v46 = 2112;
                  v47 = v28;
                  v48 = 2112;
                  v49 = v21;
                  v50 = 2112;
                  v51 = v24;
                  _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,found handle %@ in dict with object %@", buf, 0x2Au);

                }
                v8 = v35;
                (*((void (**)(id, void *, void *))v35 + 2))(v35, v21, v24);

                goto LABEL_22;
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
            if (v18)
              continue;
            break;
          }
        }

        v13 = v34;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
      v8 = v35;
      a2 = aSelector;
    }
    while (v12);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v45 = v30;
    v46 = 2112;
    v47 = v31;
    v48 = 2112;
    v49 = v7;
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,did not find handle for this account in dict %@", buf, 0x20u);

  }
  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
LABEL_22:

}

- (id)myNearbyDevices
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SMIDSMessenger ownAccountIDSService](self, "ownAccountIDSService", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "relationship") == 1 && objc_msgSend(v10, "isNearby"))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)myNearbyDestinationsFromDevices:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138412802;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "destination", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "description");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v26 = v15;
            v27 = 2112;
            v28 = v16;
            v29 = 2112;
            v30 = v17;
            _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,my nearby device missing destination,device: %@", buf, 0x20u);

          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SMIDSMessenger effectivePairedDevice](self, "effectivePairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,effectivePairedDevice %@, devices %@", (uint8_t *)&v14, 0x2Au);

  }
  if (v7)
  {
    v12 = -[SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification initWithIDSDevice:]([SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification alloc], "initWithIDSDevice:", v7);
    -[SMIDSMessenger delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotification:", v12);

  }
}

- (SMMessagingServiceMessengerDelegate)delegate
{
  return (SMMessagingServiceMessengerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (IDSService)ownAccountIDSService
{
  return self->_ownAccountIDSService;
}

- (void)setOwnAccountIDSService:(id)a3
{
  objc_storeStrong((id *)&self->_ownAccountIDSService, a3);
}

- (NSMutableArray)idsMessagesWaitingForAck
{
  return self->_idsMessagesWaitingForAck;
}

- (void)setIdsMessagesWaitingForAck:(id)a3
{
  objc_storeStrong((id *)&self->_idsMessagesWaitingForAck, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsMessagesWaitingForAck, 0);
  objc_storeStrong((id *)&self->_ownAccountIDSService, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
