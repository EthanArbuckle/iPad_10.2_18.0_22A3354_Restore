@implementation TURTCCallReporter

- (TURTCCallReporter)initWithCallCenter:(id)a3
{
  id v5;
  TURTCCallReporter *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *callUUIDToConversation;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TURTCCallReporter;
  v6 = -[TURTCCallReporter init](&v13, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.telephonyutilities.rtcreporting", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    callUUIDToConversation = v6->_callUUIDToConversation;
    v6->_callUUIDToConversation = v9;

    objc_storeStrong((id *)&v6->_callCenter, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_callStatusChangedNotification_, CFSTR("TUCallCenterCallStatusChangedNotification"), 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_callStatusChangedNotification_, CFSTR("TUCallCenterVideoCallStatusChangedNotification"), 0);

  }
  return v6;
}

- (void)callStatusChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = (id)objc_opt_class();
    v22 = 2112;
    v23 = v4;
    v6 = v21;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "RTCReporter: %@ is handling %@", buf, 0x16u);

  }
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v7;
      v12 = v11;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "%@ is ignoring notification because callUUID is nil: %@", buf, 0x16u);

    }
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "status") != 6)
  {
    if (!objc_msgSend(v7, "isConversation"))
      goto LABEL_13;
    -[TURTCCallReporter callCenter](self, "callCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeConversationForCall:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[TURTCCallReporter queue](self, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__TURTCCallReporter_callStatusChangedNotification___block_invoke_2;
      v15[3] = &unk_1E38A19B8;
      v15[4] = self;
      v16 = v7;
      v17 = v10;
      dispatch_async(v14, v15);

    }
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v7, "disconnectedReason") == 11)
  {
    -[TURTCCallReporter queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__TURTCCallReporter_callStatusChangedNotification___block_invoke;
    block[3] = &unk_1E38A1388;
    block[4] = self;
    v19 = v7;
    dispatch_async(v9, block);

  }
LABEL_13:

}

void __51__TURTCCallReporter_callStatusChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "callUUIDToConversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "callUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "report:withConversation:", v3, v6);

  objc_msgSend(*(id *)(a1 + 32), "callUUIDToConversation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "callUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v7);

}

void __51__TURTCCallReporter_callStatusChangedNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "callUUIDToConversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "callUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, v3);

}

- (void)report:(id)a3 withConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[TURTCCallReporter queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[TURTCCallReporter reportingSessionForCall:withConversation:](self, "reportingSessionForCall:withConversation:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TURTCCallReporter rtcCallInfoDictionary:withConversation:](self, "rtcCallInfoDictionary:withConversation:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "RTCReporter: Reporting message with session %@ userInfo %@", buf, 0x16u);
  }

  v14 = 0;
  objc_msgSend(v9, "sendMessageWithDictionary:error:", v10, &v14);
  v12 = v14;
  if (v12)
  {
    TUDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_19A50D000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] RTCReporter: Error while sending message with error: %@", buf, 0xCu);
    }

  }
}

- (id)rtcCallInfoDictionary:(id)a3 withConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[10];
  _QWORD v76[12];

  v76[10] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TURTCCallReporter queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1E0C99E08];
  v75[0] = *MEMORY[0x1E0D838B8];
  -[TURTCCallReporter serviceName:withConversation:](self, "serviceName:withConversation:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v10;
  v75[1] = CFSTR("callUUID");
  objc_msgSend(v6, "callUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v11;
  v75[2] = CFSTR("endReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "disconnectedReason"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v12;
  v75[3] = CFSTR("incoming");
  v13 = objc_msgSend(v6, "isIncoming");
  v14 = MEMORY[0x1E0C9AAA0];
  v15 = MEMORY[0x1E0C9AAB0];
  if (v13)
    v16 = MEMORY[0x1E0C9AAB0];
  else
    v16 = MEMORY[0x1E0C9AAA0];
  v76[3] = v16;
  v75[4] = CFSTR("connected");
  if (objc_msgSend(v6, "isConnected"))
    v17 = v15;
  else
    v17 = v14;
  v76[4] = v17;
  v75[5] = CFSTR("currentlyGrouped");
  if (objc_msgSend(v6, "isConferenced"))
    v18 = v15;
  else
    v18 = v14;
  v76[5] = v18;
  v75[6] = CFSTR("relay");
  if (objc_msgSend(v6, "isHostedOnCurrentDevice"))
    v19 = v14;
  else
    v19 = v15;
  v76[6] = v19;
  v75[7] = CFSTR("isConversation");
  if (objc_msgSend(v6, "isConversation"))
    v20 = v15;
  else
    v20 = v14;
  v76[7] = v20;
  v75[8] = CFSTR("fromLink");
  if (objc_msgSend(v6, "joinedFromLink"))
    v21 = v15;
  else
    v21 = v14;
  v76[8] = v21;
  v75[9] = CFSTR("originatingUIType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "originatingUIType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76[9] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "provider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isTelephonyProvider");

  if ((v26 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "callDuration");
    objc_msgSend(v27, "numberWithDouble:", v28 * 1000.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("durationMs"));

    objc_msgSend(v6, "dateSentInvitation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "dateSentInvitation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateCreated");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceDate:", v33);
      objc_msgSend(v31, "numberWithDouble:", v34 * 1000.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v35, CFSTR("setupTimeMs"));

      objc_msgSend(v6, "dateConnected");
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = (void *)v36;
        objc_msgSend(v6, "dateStartedConnecting");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "dateConnected");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dateStartedConnecting");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "timeIntervalSinceDate:", v41);
          objc_msgSend(v39, "numberWithDouble:", v42 * 1000.0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v43, CFSTR("connectionTimeMs"));

        }
      }
      objc_msgSend(v7, "report");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "timebase");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend(v6, "dateEnded");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v46)
        {
          v48 = v46;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        v58 = v48;

        v59 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "dateConnected");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "report");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "timebase");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "timeIntervalSinceDate:", v62);
        objc_msgSend(v59, "numberWithDouble:");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v63, CFSTR("relativeStart"));

        v64 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "report");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "timebase");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "timeIntervalSinceDate:", v66);
        objc_msgSend(v64, "numberWithDouble:");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v67, CFSTR("relativeEnd"));

      }
      objc_msgSend(v7, "report");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "conversationID");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "UUIDString");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v69, CFSTR("CID"));

      goto LABEL_38;
    }
    objc_msgSend(v6, "callDuration");
    if (v49 <= 10.0)
    {
      v56 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "callDuration");
      objc_msgSend(v56, "numberWithDouble:");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v57, CFSTR("bucketedDuration"));
LABEL_38:

      goto LABEL_39;
    }
    objc_msgSend(v6, "callDuration");
    if (v50 <= 30.0)
    {
      v55 = &unk_1E38E9010;
    }
    else
    {
      objc_msgSend(v6, "callDuration");
      if (v51 <= 60.0)
      {
        v55 = &unk_1E38E9028;
      }
      else
      {
        objc_msgSend(v6, "callDuration");
        if (v52 <= 300.0)
        {
          v55 = &unk_1E38E9040;
        }
        else
        {
          objc_msgSend(v6, "callDuration");
          if (v53 <= 1800.0)
          {
            v55 = &unk_1E38E9058;
          }
          else
          {
            objc_msgSend(v6, "callDuration");
            if (v54 <= 3600.0)
              v55 = &unk_1E38E9070;
            else
              v55 = &unk_1E38E9088;
          }
        }
      }
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v55, CFSTR("bucketedDuration"));
  }
LABEL_39:
  v70 = *MEMORY[0x1E0D83868];
  v73[0] = *MEMORY[0x1E0D83850];
  v73[1] = v70;
  v74[0] = &unk_1E38E90A0;
  v74[1] = &unk_1E38E90B8;
  v73[2] = *MEMORY[0x1E0D83860];
  v74[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

- (id)reportingSessionForCall:(id)a3 withConversation:(id)a4
{
  void *v4;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[5];
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[TURTCCallReporter queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = *MEMORY[0x1E0D83888];
  v36[0] = *MEMORY[0x1E0D83880];
  v36[1] = v11;
  v37[0] = &unk_1E38E90D0;
  v37[1] = CFSTR("0.1");
  v36[2] = *MEMORY[0x1E0D838A8];
  if (v8)
  {
    objc_msgSend(v8, "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
  }
  else
  {
    objc_msgSend(v7, "callUUID");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D83870];
  v37[2] = v12;
  v37[3] = MEMORY[0x1E0C9AAB0];
  v14 = *MEMORY[0x1E0D83878];
  v36[3] = v13;
  v36[4] = v14;
  v37[4] = CFSTR("com.apple.TelephonyUtilities");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

    v12 = v4;
  }

  objc_msgSend(v8, "report");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "report");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "conversationID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D838A0]);

  }
  -[TURTCCallReporter clientName:](self, "clientName:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TURTCCallReporter serviceName:withConversation:](self, "serviceName:withConversation:", v7, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0D838B8];
  v34[0] = *MEMORY[0x1E0D838B0];
  v34[1] = v23;
  v35[0] = v21;
  v35[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83848]), "initWithSessionInfo:userInfo:frameworksToCheck:", v16, v24, 0);
  TUDefaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412802;
    v29 = v25;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_19A50D000, v26, OS_LOG_TYPE_DEFAULT, "RTCReporter: Created reporting session %@ with sessionInfo: %@, userInfo: %@", (uint8_t *)&v28, 0x20u);
  }

  objc_msgSend(v25, "startConfigurationWithCompletionHandler:", &__block_literal_global_30);
  return v25;
}

void __62__TURTCCallReporter_reportingSessionForCall_withConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "RTCReporter: Received backends %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)clientName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  v4 = a3;
  -[TURTCCallReporter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("telephonyutilities");
  if (objc_msgSend(v6, "isFaceTimeProvider") && objc_msgSend(v4, "isConversation"))
    v7 = CFSTR("multiwayconference");
  v8 = v7;

  return v8;
}

- (id)serviceName:(id)a3 withConversation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  v6 = a3;
  v7 = a4;
  -[TURTCCallReporter queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFaceTimeProvider");

  if (v10)
  {
    if (objc_msgSend(v6, "isConversation"))
    {
      if (objc_msgSend(v7, "isOneToOneModeEnabled"))
        v11 = CFSTR("twoway");
      else
        v11 = CFSTR("session");
    }
    else
    {
      v11 = CFSTR("com.apple.telephonyutilites.facetime");
    }
  }
  else
  {
    v11 = CFSTR("com.apple.telephonyutilites.phone");
  }

  return (id)v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)callUUIDToConversation
{
  return self->_callUUIDToConversation;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_callUUIDToConversation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
