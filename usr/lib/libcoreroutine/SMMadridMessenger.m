@implementation SMMadridMessenger

- (SMMadridMessenger)initWithQueue:(id)a3
{
  id v5;
  SMMadridMessenger *v6;
  SMMadridMessenger *v7;
  uint64_t v8;
  NSMutableArray *madridMessagesWaitingForAck;
  uint64_t v10;
  NSMutableArray *resultsWaitingForProcessing;
  SMMadridMessenger *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)SMMadridMessenger;
    v6 = -[SMMadridMessenger init](&v15, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_queue, a3);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      madridMessagesWaitingForAck = v7->_madridMessagesWaitingForAck;
      v7->_madridMessagesWaitingForAck = (NSMutableArray *)v8;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
      resultsWaitingForProcessing = v7->_resultsWaitingForProcessing;
      v7->_resultsWaitingForProcessing = (NSMutableArray *)v10;

    }
    self = v7;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  id v37;
  id v38;
  void *v39;
  dispatch_group_t group;
  id v41;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint8_t *v49;
  SEL v50;
  _QWORD v51[4];
  id v52;
  SMMadridMessenger *v53;
  dispatch_group_t v54;
  uint8_t *v55;
  SEL v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  const __CFString *v64;
  uint8_t v65[4];
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  _QWORD v76[4];

  v76[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v41 = a4;
  v14 = a5;
  v42 = a6;
  v15 = a7;
  if (v15)
  {
    if (v13)
    {
      if (v14
        && (objc_msgSend(v14, "receiverHandles"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "count"),
            v16,
            v17))
      {
        *(_QWORD *)buf = 0;
        v58 = buf;
        v59 = 0x3032000000;
        v60 = __Block_byref_object_copy__16;
        v61 = __Block_byref_object_dispose__16;
        v62 = 0;
        v18 = dispatch_group_create();
        dispatch_group_enter(v18);
        objc_msgSend(v14, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMMadridMessenger queue](self, "queue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
        v51[3] = &unk_1E9298B18;
        v55 = buf;
        v21 = v13;
        v52 = v21;
        v53 = self;
        v56 = a2;
        group = v18;
        v54 = group;
        +[SMMessagingUtilities queryChatWithGroupID:queue:handler:](SMMessagingUtilities, "queryChatWithGroupID:queue:handler:", v19, v20, v51);

        -[SMMadridMessenger createMSMessage:summaryText:](self, "createMSMessage:summaryText:", v21, v42);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[SMMadridMessenger queue](self, "queue");
          v23 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_107;
          block[3] = &unk_1E9298B68;
          block[4] = self;
          v44 = v22;
          v45 = v21;
          v49 = buf;
          v50 = a2;
          v46 = v14;
          v47 = v41;
          v48 = v15;
          dispatch_group_notify(group, v23, block);

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v21, "sessionID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v37 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "messageID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v65 = 138413058;
            v66 = v35;
            v67 = 2112;
            v68 = v37;
            v69 = 2112;
            v70 = v38;
            v71 = 2112;
            v72 = v39;
            _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,failed to create MSMessage", v65, 0x2Au);

          }
          v32 = (void *)MEMORY[0x1E0CB35C8];
          v63 = *MEMORY[0x1E0CB2D50];
          v64 = CFSTR("MSMessage creation failed");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v34);

        }
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v73 = *MEMORY[0x1E0CB2D50];
        v74 = CFSTR("nil conversation");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v27);

      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB2D50];
      v76[0] = CFSTR("nil message");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v30);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "guid");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "messageID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v13 = 138413314;
      v14 = v7;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,found chatGUID,%@", (uint8_t *)&v13, 0x34u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_107(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  SMMadridMessageWaitingForAck *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  SMMadridMessageWaitingForAck *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_class *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  const __CFString *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "getIMPluginPayloadFromMSMessage:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "messageID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    v57 = v7;
    v58 = 2112;
    v59 = v9;
    v60 = 2112;
    v61 = v10;
    v62 = 2112;
    v63 = v11;
    v64 = 2112;
    v65 = v12;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to chatGUID,%@", buf, 0x34u);

  }
  objc_msgSend(v4, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "receiverPrimaryHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = *(id *)(a1 + 48);
  v15 = v3;
  v16 = IMSPISendMSMessagePayloadWithSummaryTextReturningGUID();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "sessionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "messageID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 56);
      v24 = *(_QWORD *)(a1 + 64);
      v26 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413826;
      v57 = v19;
      v58 = 2112;
      v59 = v21;
      v60 = 2112;
      v61 = v22;
      v62 = 2112;
      v63 = v23;
      v64 = 2112;
      v65 = v25;
      v66 = 2112;
      v67 = v24;
      v68 = 2112;
      v69 = v26;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages accepted message to conversation %@,associatedGUID,%@,message,%@", buf, 0x48u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v27 = [SMMadridMessageWaitingForAck alloc];
    objc_msgSend(*(id *)(a1 + 48), "messageID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend((id)objc_opt_class(), "messageType");
    v31 = *(_QWORD *)(a1 + 56);
    v32 = (void *)MEMORY[0x1D8232094](*(_QWORD *)(a1 + 72));
    v33 = -[SMMadridMessageWaitingForAck initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:](v27, "initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:", v29, v30, v5, 0, v31, v32);

    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 32), "madridMessagesWaitingForAck");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v34, "addObject:", v33);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 88));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v57 = v50;
        v58 = 2112;
        v59 = v51;
        _os_log_fault_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMMadridMessageWaitingForAck", buf, 0x16u);

      }
      v33 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "sessionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "messageID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *(_QWORD *)(a1 + 56);
      v46 = *(_QWORD *)(a1 + 64);
      v48 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413826;
      v57 = v41;
      v58 = 2112;
      v59 = v43;
      v60 = 2112;
      v61 = v44;
      v62 = 2112;
      v63 = v45;
      v64 = 2112;
      v65 = v47;
      v66 = 2112;
      v67 = v46;
      v68 = 2112;
      v69 = v48;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages rejected message to conversation,%@,associatedGUID,%@,message,%@", buf, 0x48u);

    }
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0D18598];
    v54 = *MEMORY[0x1E0CB2D50];
    v55 = CFSTR("Messages rejected message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 0, v37);
    v33 = (SMMadridMessageWaitingForAck *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v38 = objc_msgSend((id)objc_opt_class(), "messageType");
    objc_msgSend(v5, "timeIntervalSinceNow");
    v40 = -v39;
    objc_msgSend(*(id *)(a1 + 56), "receiverHandles");
    v34 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v52) = 0;
    +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v38, 0, 0, 1, 1, v33, v40, v52, -[NSObject count](v34, "count"));
  }

}

void __92__SMMadridMessenger_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = v6;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages GUID is nil", (uint8_t *)&v11, 0x2Au);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "messageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413314;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received GUID:%@", (uint8_t *)&v11, 0x34u);
LABEL_4:

  }
LABEL_6:

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
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD block[5];
  NSObject *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void (**v49)(_QWORD, _QWORD, _QWORD, _QWORD);
  _BYTE *v50;
  SEL v51;
  _QWORD v52[4];
  id v53;
  SMMadridMessenger *v54;
  NSObject *v55;
  _BYTE *v56;
  SEL v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  __int128 v60;
  uint64_t v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v22;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: message";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_22;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_18;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: sendDate";
    goto LABEL_18;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: conversation";
    goto LABEL_18;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: completion";
    goto LABEL_18;
  }
  -[SMMadridMessenger createMSMessage:summaryText:](self, "createMSMessage:summaryText:", v16, v21);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__16;
    *(_QWORD *)&v60 = __Block_byref_object_dispose__16;
    *((_QWORD *)&v60 + 1) = 0;
    v35 = dispatch_group_create();
    dispatch_group_enter(v35);
    objc_msgSend(v20, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMMadridMessenger queue](self, "queue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
    v52[3] = &unk_1E9298B18;
    v56 = buf;
    v34 = v16;
    v53 = v34;
    v54 = self;
    v57 = a2;
    v36 = v35;
    v55 = v36;
    +[SMMessagingUtilities queryChatWithGroupID:queue:handler:](SMMessagingUtilities, "queryChatWithGroupID:queue:handler:", v37, v24, v52);

    -[SMMadridMessenger queue](self, "queue");
    v38 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_116;
    block[3] = &unk_1E9298B90;
    block[4] = self;
    v25 = v40;
    v43 = v25;
    v44 = v34;
    v50 = buf;
    v51 = a2;
    v45 = v20;
    v46 = v19;
    v47 = v17;
    v48 = v18;
    v49 = v23;
    dispatch_group_notify(v36, v38, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "sessionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      v59 = v32;
      LOWORD(v60) = 2112;
      *(_QWORD *)((char *)&v60 + 2) = v33;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,failed to create MSMessage", buf, 0x2Au);

    }
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v61 = *MEMORY[0x1E0CB2D50];
    v62[0] = CFSTR("MSMessage creation failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v23)[2](v23, 0, 0, v30);

    v25 = 0;
  }
LABEL_22:

}

void __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "guid");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "messageID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v13 = 138413314;
      v14 = v7;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,found chatGUID,%@", (uint8_t *)&v13, 0x34u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __131__SMMadridMessenger_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_116(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  SMMadridMessageWaitingForAck *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  SMMadridMessageWaitingForAck *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  objc_class *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const __CFString *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "getIMPluginPayloadFromMSMessage:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 104));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "messageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    v58 = v5;
    v59 = 2112;
    v60 = v7;
    v61 = 2112;
    v62 = v8;
    v63 = 2112;
    v64 = v9;
    v65 = 2112;
    v66 = v10;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,sending message to chatGUID,%@", buf, 0x34u);

  }
  objc_msgSend(v2, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "receiverPrimaryHandles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = IMSPIScheduleSendMSMessagePayloadWithSummaryTextAndGUID();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "sessionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "messageID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *(_QWORD *)(a1 + 80);
      v21 = v2;
      v22 = v3;
      v23 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "stringFromDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138414082;
      v58 = v16;
      v59 = 2112;
      v60 = v18;
      v61 = 2112;
      v62 = v19;
      v63 = 2112;
      v64 = v20;
      v65 = 2112;
      v66 = v23;
      v3 = v22;
      v2 = v21;
      v67 = 2112;
      v68 = v53;
      v69 = 2112;
      v70 = v24;
      v71 = 2112;
      v72 = v25;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages accepted message to conversation %@,associatedGUID,%@,sendDate,%@,message,%@", buf, 0x52u);

    }
    v26 = [SMMadridMessageWaitingForAck alloc];
    objc_msgSend(*(id *)(a1 + 48), "messageID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend((id)objc_opt_class(), "messageType");
    v31 = *(_QWORD *)(a1 + 56);
    v30 = *(_QWORD *)(a1 + 64);
    v32 = (void *)MEMORY[0x1D8232094](*(_QWORD *)(a1 + 88));
    v33 = -[SMMadridMessageWaitingForAck initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:](v26, "initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:", v28, v29, v30, 0, v31, v32);

    if (v33)
    {
      objc_msgSend(*(id *)(a1 + 32), "madridMessagesWaitingForAck");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v34, "addObject:", v33);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 104));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v58 = v50;
        v59 = 2112;
        v60 = v51;
        _os_log_fault_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMMadridMessageWaitingForAck", buf, 0x16u);

      }
      v33 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "sessionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "messageID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *(_QWORD *)(a1 + 80);
      v46 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "stringFromDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138414082;
      v58 = v41;
      v59 = 2112;
      v60 = v43;
      v61 = 2112;
      v62 = v44;
      v63 = 2112;
      v64 = v45;
      v65 = 2112;
      v66 = v46;
      v67 = 2112;
      v68 = v54;
      v69 = 2112;
      v70 = v47;
      v71 = 2112;
      v72 = v48;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,Messages rejected message to conversation %@,associatedGUID,%@,sendDate,%@,message,%@", buf, 0x52u);

    }
    v35 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0D18598];
    v55 = *MEMORY[0x1E0CB2D50];
    v56 = CFSTR("Messages rejected message");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 0, v37);
    v33 = (SMMadridMessageWaitingForAck *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    v38 = objc_msgSend((id)objc_opt_class(), "messageType");
    objc_msgSend(v3, "timeIntervalSinceNow");
    v40 = -v39;
    objc_msgSend(*(id *)(a1 + 56), "receiverHandles");
    v34 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v52) = 0;
    +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v38, 1, 0, 1, 1, v33, v40, v52, -[NSObject count](v34, "count"));
  }

}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v17 = 0;
    v13 = "Invalid parameter not satisfying: messageGUID";
    v14 = (uint8_t *)&v17;
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v13, v14, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v16 = 0;
    v13 = "Invalid parameter not satisfying: conversation";
    v14 = (uint8_t *)&v16;
    goto LABEL_11;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 0;
      v13 = "Invalid parameter not satisfying: completion";
      v14 = (uint8_t *)&v15;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  -[SMMadridMessenger cancelMadridMessageSendForMessageGUID:toConversation:retryCount:completion:](self, "cancelMadridMessageSendForMessageGUID:toConversation:retryCount:completion:", v8, v9, 2, v10);
LABEL_13:

}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 retryCount:(int64_t)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t (*IMSPICancelScheduledMessageWithGUIDAndDestinationsSymbolLoc)(id, id);
  char v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  SMMadridMessageWaitingForAck *v26;
  void *v27;
  SMMadridMessageWaitingForAck *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  SMMadridMessageWaitingForAck *v44;
  void *v45;
  SMMadridMessageWaitingForAck *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  objc_class *v63;
  void *v64;
  void *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  id obj;
  NSObject *log;
  void (**v77)(id, _QWORD, void *);
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  const __CFString *v83;
  _BYTE v84[128];
  uint64_t v85;
  const __CFString *v86;
  _BYTE buf[24];
  id v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v77 = (void (**)(id, _QWORD, void *))a6;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: messageGUID";
LABEL_44:
    _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_54;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: conversation";
    goto LABEL_44;
  }
  if (!v77)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: completion";
    goto LABEL_44;
  }
  if (a5 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: retryCount >= 0";
    goto LABEL_44;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v88 = v8;
    v89 = 2112;
    v90 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,canceling scheduled send for %@ to conversation %@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  log = objc_claimAutoreleasedReturnValue();
  if (!_MergedGlobals_95)
  {
    *(_OWORD *)buf = xmmword_1E9298BD8;
    *(_QWORD *)&buf[16] = 0;
    _MergedGlobals_95 = _sl_dlopen();
  }
  if (_MergedGlobals_95 && getIMSPICancelScheduledMessageWithGUIDAndDestinationsSymbolLoc())
  {
    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "receiverPrimaryHandles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v8;
    v18 = v16;
    IMSPICancelScheduledMessageWithGUIDAndDestinationsSymbolLoc = (uint64_t (*)(id, id))getIMSPICancelScheduledMessageWithGUIDAndDestinationsSymbolLoc();
    if (!IMSPICancelScheduledMessageWithGUIDAndDestinationsSymbolLoc)
    {
      dlerror();
      abort_report_np();
    }
    v20 = IMSPICancelScheduledMessageWithGUIDAndDestinationsSymbolLoc(v17, v18);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2112;
        v88 = v17;
        v89 = 2112;
        v90 = v18;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,Messages accepted cancel request for %@ to handles %@", buf, 0x2Au);

      }
      v26 = [SMMadridMessageWaitingForAck alloc];
      v27 = (void *)MEMORY[0x1D8232094](v77);
      v28 = -[SMMadridMessageWaitingForAck initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:](v26, "initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:", v17, 3, log, a5, v9, v27);

      if (v28)
      {
        -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
        v29 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v29, "addObject:", v28);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v67;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v68;
          _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMMadridMessageWaitingForAck", buf, 0x16u);

        }
        v28 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v63 = (objc_class *)objc_opt_class();
        NSStringFromClass(v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v65;
        *(_WORD *)&buf[22] = 2112;
        v88 = v17;
        v89 = 2112;
        v90 = v18;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,Messages rejected cancel request for %@ to handles %@", buf, 0x2Au);

      }
      v58 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0D18598];
      v85 = *MEMORY[0x1E0CB2D50];
      v86 = CFSTR("Messages rejected cancel request");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "errorWithDomain:code:userInfo:", v59, 0, v60);
      v28 = (SMMadridMessageWaitingForAck *)objc_claimAutoreleasedReturnValue();

      v77[2](v77, 0, v28);
      -[NSObject timeIntervalSinceNow](log, "timeIntervalSinceNow");
      v62 = -v61;
      objc_msgSend(v9, "receiverHandles");
      v29 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v69) = 0;
      +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 1, 1, v28, v62, v69, -[NSObject count](v29, "count"));
    }

  }
  else
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v31 = v9;
    objc_msgSend(v9, "receiverHandles");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    if (v32)
    {
      v33 = v32;
      obj = v18;
      v34 = *(_QWORD *)v79;
      v72 = *MEMORY[0x1E0D18598];
      v71 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v79 != v34)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v36, "primaryHandle");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = IMSPICancelScheduledMessageWithGUIDAndDestination();

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if ((v38 & 1) != 0)
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v41 = (objc_class *)objc_opt_class();
              NSStringFromClass(v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v42;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v43;
              *(_WORD *)&buf[22] = 2112;
              v88 = v8;
              v89 = 2112;
              v90 = v36;
              _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,Messages accepted cancel request for %@ to handle %@", buf, 0x2Au);

            }
            v44 = [SMMadridMessageWaitingForAck alloc];
            v45 = (void *)MEMORY[0x1D8232094](v77);
            v46 = -[SMMadridMessageWaitingForAck initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:](v44, "initWithIdentifier:messageType:messageSentDate:pendingRetryCount:conversation:callback:", v8, 3, log, a5, v31, v45);

            if (v46)
            {
              -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
              v47 = objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v47, "addObject:", v46);
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                v55 = (objc_class *)objc_opt_class();
                NSStringFromClass(v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v56;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v57;
                _os_log_fault_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,failed to create SMMadridMessageWaitingForAck", buf, 0x16u);

              }
              v46 = 0;
            }
          }
          else
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v52 = (objc_class *)objc_opt_class();
              NSStringFromClass(v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v53;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v54;
              *(_WORD *)&buf[22] = 2112;
              v88 = v8;
              v89 = 2112;
              v90 = v36;
              _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,Messages rejected cancel request for %@ to handle %@", buf, 0x2Au);

            }
            v48 = (void *)MEMORY[0x1E0CB35C8];
            v82 = v71;
            v83 = CFSTR("Messages rejected cancel request");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "errorWithDomain:code:userInfo:", v72, 0, v49);
            v46 = (SMMadridMessageWaitingForAck *)objc_claimAutoreleasedReturnValue();

            v77[2](v77, 0, v46);
            -[NSObject timeIntervalSinceNow](log, "timeIntervalSinceNow");
            v51 = -v50;
            objc_msgSend(v31, "receiverHandles");
            v47 = objc_claimAutoreleasedReturnValue();
            LOBYTE(v69) = 0;
            +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 1, 1, v46, v51, v69, -[NSObject count](v47, "count"));
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      }
      while (v33);
      v9 = v31;
      v18 = obj;
    }
  }

LABEL_54:
}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v26;
  NSObject *v27;
  objc_class *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  id v37;
  void *v38;
  objc_class *v39;
  id v40;
  void *v41;
  uint64_t v42;
  const char *aSelector;
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  _BYTE v71[14];
  uint64_t v72;

  v7 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    aSelector = a2;
    if (!v12)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v61 = "-[SMMadridMessenger iMessageSendFor:guid:successful:withError:]";
        v62 = 1024;
        LODWORD(v63) = 480;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID (in %s:%d)", buf, 0x12u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D8B9A8], "sessionIDFromURL:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8B9A8], "messageIDFromURL:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(MEMORY[0x1E0D8B9A8], "messageTypeFromURL:", v11);
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = -1;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__16;
    v54 = __Block_byref_object_dispose__16;
    v55 = 0;
    -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __63__SMMadridMessenger_iMessageSendFor_guid_successful_withError___block_invoke;
    v46[3] = &unk_1E9298BB8;
    v44 = v16;
    v47 = v44;
    v48 = &v56;
    v49 = &v50;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v46);

    if (v57[3] == -1
      || (objc_msgSend((id)v51[5], "callback"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v45 != 1)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413826;
          v61 = (const char *)v15;
          v62 = 2112;
          v63 = v37;
          v64 = 2112;
          v65 = v38;
          v66 = 2112;
          v67 = v44;
          v68 = 2112;
          v69 = v12;
          v70 = 1024;
          *(_DWORD *)v71 = v7;
          *(_WORD *)&v71[4] = 2112;
          *(_QWORD *)&v71[6] = v13;
          _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,index not found or nil callback,GUID,%@,success,%d,error,%@", buf, 0x44u);

        }
        if (v57[3] == -1)
          goto LABEL_27;
        -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
        v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeObjectAtIndex:", v57[3]);
        goto LABEL_26;
      }
    }
    else
    {

      if (v45 != 1)
      {
LABEL_12:
        -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObjectAtIndex:", v57[3]);

        objc_msgSend((id)v51[5], "messageSentDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceNow");
        v24 = v23;

        objc_msgSend((id)v51[5], "callback");
        v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v7)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v29 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v61 = (const char *)v15;
            v62 = 2112;
            v63 = v29;
            v64 = 2112;
            v65 = v30;
            v66 = 2112;
            v67 = v44;
            v68 = 2112;
            v69 = v12;
            _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send succeeded,GUID,%@", buf, 0x34u);

          }
          v31 = 0;
          v32 = v12;
        }
        else
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            v61 = (const char *)v15;
            v62 = 2112;
            v63 = v40;
            v64 = 2112;
            v65 = v41;
            v66 = 2112;
            v67 = v44;
            v68 = 2112;
            v69 = v13;
            v70 = 2112;
            *(_QWORD *)v71 = v12;
            _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,message send failed with error %@,GUID,%@", buf, 0x3Eu);

          }
          v32 = 0;
          v31 = v13;
        }

        ((void (**)(_QWORD, id, _BOOL8, id))v25)[2](v25, v32, v7, v31);
        objc_msgSend((id)v51[5], "conversation");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "receiverHandles");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v42) = v7;
        +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", v45, 0, 0, 1, 1, v13, -v24, v42, objc_msgSend(v35, "count"));

LABEL_26:
        goto LABEL_27;
      }
    }
    -[SMMadridMessenger processSessionStartMessageSendResultWithMessageUrl:guid:successful:withError:](self, "processSessionStartMessageSendResultWithMessageUrl:guid:successful:withError:", v11, v12, v7, v13);
    objc_msgSend((id)v51[5], "callback");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
    {
LABEL_27:

      _Block_object_dispose(&v50, 8);
      _Block_object_dispose(&v56, 8);

      goto LABEL_28;
    }
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl", buf, 2u);
  }
LABEL_28:

}

void __63__SMMadridMessenger_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  objc_class *v22;
  id v23;
  void *v24;
  const char *v25;
  objc_class *v26;
  id v27;
  void *v28;
  objc_class *v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  objc_class *v37;
  id v38;
  void *v39;
  uint64_t v40;
  _BOOL4 v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t buf[4];
  NSObject *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  _BOOL4 v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v7 = a5;
  v71 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: messageUrl";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_23;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_13;
  }
  v41 = v7;
  objc_msgSend(MEMORY[0x1E0D8B9A8], "sessionIDFromURL:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8B9A8], "messageIDFromURL:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = -1;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__16;
  v51 = __Block_byref_object_dispose__16;
  v52 = 0;
  -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __81__SMMadridMessenger_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  v43[3] = &unk_1E9298BB8;
  v42 = v15;
  v44 = v42;
  v45 = &v53;
  v46 = &v47;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v43);

  if (v54[3] == -1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v58 = v14;
      v59 = 2112;
      v60 = v27;
      v61 = 2112;
      v62 = v28;
      v63 = 2112;
      v64 = v42;
      v65 = 2112;
      v66 = v12;
      v67 = 1024;
      v68 = v41;
      v69 = 2112;
      v70 = v13;
      _os_log_error_impl(&dword_1D1A22000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,index not found,GUID,%@,success,%d,error,%@", buf, 0x44u);

    }
  }
  else
  {
    -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectAtIndex:", v54[3]);

    objc_msgSend((id)v48[5], "callback");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = v18 == 0;

    if ((_DWORD)v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v58 = v14;
        v59 = 2112;
        v60 = v30;
        v61 = 2112;
        v62 = v31;
        v63 = 2112;
        v64 = v42;
        _os_log_error_impl(&dword_1D1A22000, (os_log_t)v19, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,nil callback", buf, 0x2Au);

      }
    }
    else
    {
      objc_msgSend((id)v48[5], "callback");
      v19 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v41)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v58 = v14;
          v59 = 2112;
          v60 = v23;
          v61 = 2112;
          v62 = v24;
          v63 = 2112;
          v64 = v42;
          _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,scheduled successfully", buf, 0x2Au);

        }
        (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v19 + 16))(v19, v12, 1, 0);
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v58 = v14;
          v59 = 2112;
          v60 = v38;
          v61 = 2112;
          v62 = v39;
          v63 = 2112;
          v64 = v42;
          v65 = 2112;
          v66 = v13;
          _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,failed to schedule with error %@", buf, 0x34u);

        }
        (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v19 + 16))(v19, 0, 0, v13);
      }
      objc_msgSend((id)v48[5], "messageSentDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceNow");
      v34 = v33;
      objc_msgSend((id)v48[5], "conversation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "receiverHandles");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v40) = v41;
      +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 0, 1, 1, v13, -v34, v40, objc_msgSend(v36, "count"));

    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

LABEL_23:
}

void __81__SMMadridMessenger_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  id v29;
  void *v30;
  objc_class *v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  objc_class *v43;
  id v44;
  id v45;
  int v46;
  objc_class *v47;
  id v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint8_t *v54;
  uint8_t v55[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  int v74;
  uint64_t v75;

  v6 = a4;
  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = -1;
    *(_QWORD *)v55 = 0;
    v56 = v55;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__16;
    v59 = __Block_byref_object_dispose__16;
    v60 = 0;
    -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __73__SMMadridMessenger_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
    v51[3] = &unk_1E9298BB8;
    v12 = v9;
    v52 = v12;
    v53 = &v61;
    v54 = v55;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v51);

    if (v62[3] == -1)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v66 = v29;
        v67 = 2112;
        v68 = v30;
        v69 = 2112;
        v70 = v12;
        _os_log_error_impl(&dword_1D1A22000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,message not found for messageGUID %@", buf, 0x20u);

      }
    }
    else
    {
      -[SMMadridMessenger madridMessagesWaitingForAck](self, "madridMessagesWaitingForAck");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectAtIndex:", v62[3]);

      objc_msgSend(*((id *)v56 + 5), "callback");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = v14 == 0;

      if ((_DWORD)v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v66 = v32;
          v67 = 2112;
          v68 = v33;
          v69 = 2112;
          v70 = v12;
          _os_log_error_impl(&dword_1D1A22000, (os_log_t)v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,nil callback for %@", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(*((id *)v56 + 5), "callback");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v66 = v18;
            v67 = 2112;
            v68 = v19;
            v69 = 2112;
            v70 = v12;
            _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,cancel suceeded for %@", buf, 0x20u);

          }
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v15 + 16))(v15, 1, 0);
          v20 = objc_msgSend(*((id *)v56 + 5), "pendingRetryCount");
          v21 = objc_msgSend(*((id *)v56 + 5), "pendingRetryCount");
          objc_msgSend(*((id *)v56 + 5), "messageSentDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "timeIntervalSinceNow");
          v24 = v23;
          objc_msgSend(*((id *)v56 + 5), "conversation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "receiverHandles");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v50) = 1;
          +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 3 - v20, v21 == 0, 0, -v24, v50, objc_msgSend(v26, "count"));
        }
        else
        {
          v34 = objc_msgSend(*((id *)v56 + 5), "pendingRetryCount");
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
          if (v34)
          {
            if (v36)
            {
              v43 = (objc_class *)objc_opt_class();
              NSStringFromClass(v43);
              v44 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v45 = (id)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(*((id *)v56 + 5), "pendingRetryCount");
              *(_DWORD *)buf = 138413314;
              v66 = v44;
              v67 = 2112;
              v68 = v45;
              v69 = 2112;
              v70 = v12;
              v71 = 2112;
              v72 = v10;
              v73 = 1024;
              v74 = v46;
              _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,cancel failed for %@ with error %@ retries left %d", buf, 0x30u);

            }
            objc_msgSend(*((id *)v56 + 5), "conversation");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMMadridMessenger cancelMadridMessageSendForMessageGUID:toConversation:retryCount:completion:](self, "cancelMadridMessageSendForMessageGUID:toConversation:retryCount:completion:", v12, v37, objc_msgSend(*((id *)v56 + 5), "pendingRetryCount") - 1, v15);

            v38 = objc_msgSend(*((id *)v56 + 5), "pendingRetryCount");
            objc_msgSend(*((id *)v56 + 5), "messageSentDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "timeIntervalSinceNow");
            v40 = v39;
            objc_msgSend(*((id *)v56 + 5), "conversation");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "receiverHandles");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v50) = 0;
            +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 3 - v38, 0, v10, -v40, v50, objc_msgSend(v26, "count"));
          }
          else
          {
            if (v36)
            {
              v47 = (objc_class *)objc_opt_class();
              NSStringFromClass(v47);
              v48 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v66 = v48;
              v67 = 2112;
              v68 = v49;
              v69 = 2112;
              v70 = v12;
              v71 = 2112;
              v72 = v10;
              _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,cancel failed for %@ with error %@", buf, 0x2Au);

            }
            (*(void (**)(uint64_t, _QWORD, id))(v15 + 16))(v15, 0, v10);
            objc_msgSend(*((id *)v56 + 5), "messageSentDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "timeIntervalSinceNow");
            v42 = v41;
            objc_msgSend(*((id *)v56 + 5), "conversation");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "receiverHandles");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v50) = 0;
            +[SMMessagingService submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:](SMMessagingService, "submitCAMetricForMessageType:scheduledSend:cancelationAttempt:attemptNumber:wasFinalAttempt:timeToSendMessage:sendError:success:numReceivers:", 3, 1, 1, 3, 1, v10, -v42, v50, objc_msgSend(v26, "count"));
          }
        }

      }
    }

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v61, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageGUID", v55, 2u);
    }

  }
}

void __73__SMMadridMessenger_iMessageScheduledSendCancelFor_successful_withError___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  const char *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: messageUrl";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: handle";
    goto LABEL_12;
  }
  v12 = objc_msgSend(MEMORY[0x1E0D8B9A8], "messageTypeFromURL:", v9);
  if (objc_msgSend(MEMORY[0x1E0D8B9A8], "interfaceTypeFromMessageType:", v12) == 1)
  {
    v13 = objc_alloc(MEMORY[0x1E0D8B960]);
    v14 = objc_msgSend(v13, "initWithPrimaryHandle:secondaryHandles:", v11, MEMORY[0x1E0C9AA60]);
    objc_msgSend(MEMORY[0x1E0D8B9A8], "createMessageFromURL:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "sessionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "messageID");
        *(_DWORD *)buf = 138413570;
        v31 = v18;
        v32 = 2112;
        v33 = v29;
        v34 = 2112;
        v35 = v20;
        v36 = 2112;
        v37 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v37;
        v38 = 2112;
        v39 = v11;
        v40 = 2112;
        v41 = v15;
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,received message from %@,message,%@", buf, 0x3Eu);

      }
      -[SMMadridMessenger delegate](self, "delegate");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject receivedMessage:fromHandle:fromMe:](v17, "receivedMessage:fromHandle:fromMe:", v15, v14, v5);
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v31 = v27;
      v32 = 2112;
      v33 = v28;
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = (uint64_t)v9;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received message from %@ could not be converted to SMMessage,messageUrl,%@", buf, 0x2Au);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      v34 = 1024;
      LODWORD(v35) = v12;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,received unsupported message type %d over Madrid", buf, 0x1Cu);

    }
  }
LABEL_18:

}

- (void)iMessageDeletedFor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = v4;
  if (v4)
  {
    v5 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v29;
      v10 = 0x1E0D8B000uLL;
      *(_QWORD *)&v7 = 138412802;
      v25 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(*(id *)(v10 + 2472), "createMessageFromURL:", v12, v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v13, "sessionID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (objc_class *)objc_opt_class();
              NSStringFromClass(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "messageID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v33 = v16;
              v34 = 2112;
              v35 = v18;
              v36 = 2112;
              v37 = v19;
              v38 = 2112;
              v39 = v20;
              v40 = 2112;
              v41 = v13;
              _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@,deleted message,%@", buf, 0x34u);

              v5 = v26;
              v10 = 0x1E0D8B000;

            }
            -[SMMadridMessenger delegate](self, "delegate");
            v15 = objc_claimAutoreleasedReturnValue();
            -[NSObject deletedMessage:](v15, "deletedMessage:", v13);
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v33 = v22;
            v34 = 2112;
            v35 = v23;
            v36 = 2112;
            v37 = v12;
            _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@, deleted message could not be converted to SMMessage,messageUrl,%@", buf, 0x20u);

            v10 = 0x1E0D8B000;
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      }
      while (v8);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrls", buf, 2u);
    }

    v5 = 0;
  }

}

- (id)createMSMessage:(id)a3 summaryText:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v18[16];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CC6940]);
    objc_msgSend(v7, "setCaption:", v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6938]), "initWithAlternateLayout:", v7);
    v9 = objc_alloc(MEMORY[0x1E0CC6930]);
    v10 = objc_alloc(MEMORY[0x1E0CC6948]);
    objc_msgSend(v5, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithIdentifier:", v11);
    v13 = (void *)objc_msgSend(v9, "initWithSession:", v12);

    objc_msgSend(v13, "setLayout:", v8);
    objc_msgSend(v5, "outputToURLComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setURL:", v15);

    objc_msgSend(v13, "setSummaryText:", v6);
    objc_msgSend(v13, "setRequiresValidation:", 1);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: message", v18, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)getIMPluginPayloadFromMSMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Messages/iMessageApps/SafetyMonitorMessages.bundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("CheckInMessagesAppIcon_32"), CFSTR("png"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_pluginPayloadWithAppIconData:appName:allowDataPayloads:", v6, CFSTR("Check In"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: msMessage", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (void)processSessionStartMessageSendResultWithMessageUrl:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v7 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: messageUrl";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_13;
  }
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8BA68]), "initWithURL:", v11);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject sessionID](v14, "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v19;
      -[NSObject messageID](v14, "messageID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8B928], "convertLowPowerModeWarningStateToString:", -[NSObject lowPowerModeWarningState](v14, "lowPowerModeWarningState"));
      v20 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      v21 = CFSTR("failed");
      v31 = v17;
      if (v7)
        v21 = CFSTR("succeeded");
      v32 = 2112;
      v33 = v29;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v27;
      v38 = 2112;
      v39 = v20;
      v22 = (void *)v20;
      v40 = 2112;
      v41 = v21;
      v42 = 2112;
      v43 = v12;
      v44 = 2112;
      v45 = v13;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEFAULT, "#SafetyCache,sessionID:%@,%@,%@,messageID:%@, lowPowerModeWarningState, %@, start message send %@,GUID,%@,error,%@", buf, 0x52u);

    }
    -[SMMadridMessenger delegate](self, "delegate");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject receivedSessionStartMessageSendResultWithMessage:guid:successful:withError:](v16, "receivedSessionStartMessageSendResultWithMessage:guid:successful:withError:", v14, v12, v7, v13);
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = v25;
    v32 = 2112;
    v33 = v26;
    v34 = 2112;
    v35 = (uint64_t)v11;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to create SMSessionStartMessage from URL %@", buf, 0x20u);

  }
LABEL_17:

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

- (NSMutableArray)madridMessagesWaitingForAck
{
  return self->_madridMessagesWaitingForAck;
}

- (void)setMadridMessagesWaitingForAck:(id)a3
{
  objc_storeStrong((id *)&self->_madridMessagesWaitingForAck, a3);
}

- (NSMutableArray)resultsWaitingForProcessing
{
  return self->_resultsWaitingForProcessing;
}

- (void)setResultsWaitingForProcessing:(id)a3
{
  objc_storeStrong((id *)&self->_resultsWaitingForProcessing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsWaitingForProcessing, 0);
  objc_storeStrong((id *)&self->_madridMessagesWaitingForAck, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
