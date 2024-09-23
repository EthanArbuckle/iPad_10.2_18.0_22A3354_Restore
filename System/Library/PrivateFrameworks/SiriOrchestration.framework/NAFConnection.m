@implementation NAFConnection

- (NAFConnection)initWithTargetQueue:(id)a3 instanceContext:(id)a4
{
  const void *v4;
  uint64_t v5;
  id v8;
  id v9;
  NAFConnection *v10;
  NAFConnection *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  AFCallSiteInfo *initiationCallSiteInfo;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *targetQueue;
  OS_dispatch_queue *v22;
  id v23;
  AFInstanceContext *v24;
  AFInstanceContext *instanceContext;
  uint64_t v26;
  AFAnalytics *analytics;
  uint64_t v28;
  AFPreferences *preferences;
  NSObject *v30;
  AFInstanceContext *v31;
  AFCallSiteInfo *v32;
  _QWORD v34[4];
  id v35;
  id v36;
  objc_super v37;
  Dl_info v38;
  __int16 v39;
  AFCallSiteInfo *v40;
  uint64_t v41;

  v5 = (uint64_t)v4;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)NAFConnection;
  v10 = -[NAFConnection init](&v37, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_clientID = v10;
    if (v4)
    {
      memset(&v38, 0, sizeof(v38));
      if (dladdr(v4, &v38))
      {
        if (v38.dli_fname && *v38.dli_fname)
        {
          v12 = objc_alloc(MEMORY[0x24BDD17C8]);
          v13 = (void *)objc_msgSend(v12, "initWithUTF8String:", v38.dli_fname);
        }
        else
        {
          v13 = 0;
        }
        if (v38.dli_sname && *v38.dli_sname)
        {
          v14 = objc_alloc(MEMORY[0x24BDD17C8]);
          v15 = (void *)objc_msgSend(v14, "initWithUTF8String:", v38.dli_sname);
        }
        else
        {
          v15 = 0;
        }
        v16 = (void *)MEMORY[0x24BE09118];
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __53__NAFConnection_initWithTargetQueue_instanceContext___block_invoke;
        v34[3] = &unk_2518577C0;
        v35 = v13;
        v36 = v15;
        v17 = v15;
        v18 = v13;
        v5 = objc_msgSend(v16, "newWithBuilder:", v34);

      }
      else
      {
        v5 = 0;
      }
    }
    initiationCallSiteInfo = v11->_initiationCallSiteInfo;
    v11->_initiationCallSiteInfo = (AFCallSiteInfo *)v5;

    if (v8)
    {
      v20 = (OS_dispatch_queue *)v8;
      targetQueue = v11->_targetQueue;
      v11->_targetQueue = v20;
    }
    else
    {
      v22 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v23 = MEMORY[0x24BDAC9B8];
      targetQueue = v11->_targetQueue;
      v11->_targetQueue = v22;
    }

    *((_BYTE *)v11 + 216) |= 2u;
    if (v9)
    {
      v24 = (AFInstanceContext *)v9;
    }
    else
    {
      getAFInstanceContextClass();
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "defaultContext");
      v24 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v24;

    getAFAnalyticsClass();
    v26 = objc_msgSend(objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()), "initWithInstanceContext:", v9);
    analytics = v11->_analytics;
    v11->_analytics = (AFAnalytics *)v26;

    atomic_store(0, &v11->_activePlaybackCount);
    v11->_uufrID = 0;
    getAFPreferencesClass();
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "sharedPreferences");
    v28 = objc_claimAutoreleasedReturnValue();
    preferences = v11->_preferences;
    v11->_preferences = (AFPreferences *)v28;

    v30 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v31 = v11->_instanceContext;
      v32 = v11->_initiationCallSiteInfo;
      LODWORD(v38.dli_fname) = 136315906;
      *(const char **)((char *)&v38.dli_fname + 4) = "-[NAFConnection initWithTargetQueue:instanceContext:]";
      WORD2(v38.dli_fbase) = 2048;
      *(void **)((char *)&v38.dli_fbase + 6) = v11;
      HIWORD(v38.dli_sname) = 2112;
      v38.dli_saddr = v31;
      v39 = 2112;
      v40 = v32;
      _os_log_impl(&dword_246FF4000, v30, OS_LOG_TYPE_INFO, "%s %p (instanceContext = %@, caller = %@)", (uint8_t *)&v38, 0x2Au);
    }
  }

  return v11;
}

void __53__NAFConnection_initWithTargetQueue_instanceContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImagePath:", v3);
  objc_msgSend(v4, "setSymbolName:", *(_QWORD *)(a1 + 40));

}

- (NAFConnection)initWithTargetQueue:(id)a3
{
  return -[NAFConnection initWithTargetQueue:instanceContext:](self, "initWithTargetQueue:instanceContext:", a3, 0);
}

- (NAFConnection)init
{
  return -[NAFConnection initWithTargetQueue:](self, "initWithTargetQueue:", 0);
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  NAFConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFConnection _connectionFailedWithError:](self, "_connectionFailedWithError:", v3);
  -[NAFConnection _clearConnection](self, "_clearConnection");
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[NAFConnection dealloc]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)NAFConnection;
  -[NAFConnection dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = objc_storeWeak((id *)&self->_delegate, a3);
  v5 = a3;
  if (!a3)
  {
    -[NAFConnection _clearConnection](self, "_clearConnection");
    v5 = 0;
  }

}

- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3
{
  id v4;

  if (a3)
  {
    *((_BYTE *)self + 216) |= 4u;
    -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginListeningForClient:", self->_clientID);
  }
  else
  {
    -[NAFConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
    *((_BYTE *)self + 216) &= ~4u;
    -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endListeningForClient:", self->_clientID);
  }

}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 analyticsEventProvider:(id)a7
{
  -[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:", a3, a4, a5, a6, 0, a7);
}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 isBackgroundRequest:(BOOL)a7 analyticsEventProvider:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v12;
  NSString *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSString *outstandingRequestClass;
  int v22;
  const char *v23;
  __int16 v24;
  NAFConnection *v25;
  __int16 v26;
  NSString *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v9 = a7;
  v12 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v15 = (NSString *)a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136316418;
    v23 = "-[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroun"
          "dRequest:analyticsEventProvider:]";
    v24 = 2048;
    v25 = self;
    v26 = 2112;
    v27 = v15;
    v28 = 1024;
    v29 = v12;
    v30 = 2112;
    v31 = v16;
    v32 = 1024;
    v33 = v9;
    _os_log_impl(&dword_246FF4000, v19, OS_LOG_TYPE_DEFAULT, "%s %p (requestClass = %@, isSpeechRequest = %d (%@), isBackgroundRequest = %d)", (uint8_t *)&v22, 0x36u);
  }
  if (!v9)
  {
    -[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:", v12, v16, v17, v18);
    -[NAFConnection _tellDelegateRequestWillStart](self, "_tellDelegateRequestWillStart");
    if (!v12)
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAFConnection _scheduleRequestTimeoutForReason:durationInSeconds:](self, "_scheduleRequestTimeoutForReason:durationInSeconds:", v20, 0.0);
      -[NAFConnection _beginInterstitialsForReason:](self, "_beginInterstitialsForReason:", v20);

    }
  }
  *((_BYTE *)self + 216) |= 8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = v15;

}

- (void)_requestDidEnd
{
  NSObject *v4;
  NSString *outstandingRequestClass;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  NAFConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[NAFConnection _requestDidEnd]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v7, 0x16u);
  }
  *((_BYTE *)self + 216) &= ~8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = 0;

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v6);
  -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v6);

}

- (void)_startUIRequestWithText:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:startUIRequestWithText:completion:", self, v10, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:startUIRequestWithInfo:completion:", self, v10, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (void)_handleCommand:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  os_log_t *v8;
  NSObject *v9;
  Class *v10;
  id v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[NAFConnection _handleCommand:reply:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_246FF4000, v9, OS_LOG_TYPE_DEFAULT, "%s command = %@", (uint8_t *)&v13, 0x16u);
  }
  if (AFInterstitialIsCommandInterstitial())
  {
    if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType)
    {
      -[NAFConnection _enqueueInterstitialCommand:](self, "_enqueueInterstitialCommand:", v6);
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        -[NAFConnection _handleCommand:reply:].cold.2();
      v10 = (Class *)0x24BE811B8;
    }
    else
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        -[NAFConnection _handleCommand:reply:].cold.1();
      v10 = (Class *)0x24BE811B0;
    }
    v11 = objc_alloc_init(*v10);
    objc_msgSend(v6, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRefId:", v12);

    if (v7)
      v7[2](v7, v11, 0);

  }
  else
  {
    -[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:](self, "_dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:", v6, 0, 0, v7, 0.0);
  }

}

- (void)_dispatchCommand:(id)a3 isInterstitial:(BOOL)a4 interstitialPhase:(int64_t)a5 interstitialDelay:(double)a6 reply:(id)a7
{
  _BOOL4 v10;
  id v13;
  id v14;
  id WeakRetained;
  char v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  uint64_t v22;
  NSObject *targetQueue;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  void (**v30)(_QWORD);
  SEL v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  NAFConnection *v35;
  id v36;
  id v37;
  int64_t v38;
  SEL v39;
  double v40;
  BOOL v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  v10 = a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_opt_respondsToSelector();
  v17 = *MEMORY[0x24BE08FB0];
  if ((v16 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
      v44 = 2112;
      v45 = v13;
      v46 = 1024;
      v47 = v10;
      _os_log_impl(&dword_246FF4000, v17, OS_LOG_TYPE_DEFAULT, "%s command = %@, isInterstitial = %d", buf, 0x1Cu);
    }
    v18 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke;
    v33[3] = &unk_251857838;
    v19 = v13;
    v34 = v19;
    v35 = self;
    v41 = v10;
    v38 = a5;
    v39 = a2;
    v40 = a6;
    v36 = WeakRetained;
    v20 = v14;
    v37 = v20;
    v21 = (void (**)(_QWORD))MEMORY[0x2495703E0](v33);
    if (AFSpeechEventIsVoiceTrigger())
    {
      v22 = v18;
      targetQueue = self->_targetQueue;
      v27[0] = v22;
      v27[1] = 3221225472;
      v27[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_94;
      v27[3] = &unk_251857860;
      v32 = v10;
      v27[4] = self;
      v28 = v19;
      v29 = v20;
      v30 = v21;
      v31 = a2;
      dispatch_async(targetQueue, v27);

    }
    else
    {
      v21[2](v21);
      if (!v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSStringFromSelector(a2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v26);

        }
      }
    }

    v25 = v34;
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:].cold.1((uint64_t)WeakRetained, v17, v13);
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v24);

  if (!v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v25);
LABEL_15:

    }
  }

}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  os_log_t *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  double v39;
  double v40;
  NSObject *v41;
  double v42;
  double v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  char *v52;
  NSObject *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  char isKindOfClass;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  objc_class *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  os_signpost_id_t v95;
  char *v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  _QWORD v102[5];
  id v103;
  id v104;
  id v105;
  uint64_t v106;
  os_signpost_id_t v107;
  char v108;
  uint8_t buf[4];
  const char *v110;
  __int16 v111;
  const char *v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  AFAnalyticsContextCreateWithCommand();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 328), "logEventWithType:context:contextNoCopy:", 1421, v2, 1);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "encodedClassName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v7 = v4;
    objc_msgSend(v6, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _ConvertIdToSchemaUUID(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BE95670]);
      v11 = objc_alloc_init(MEMORY[0x24BE95678]);
      objc_msgSend(v11, "setRequestId:", v9);
      objc_msgSend(v10, "setEventMetadata:", v11);
      v100 = v2;
      v12 = objc_alloc_init(MEMORY[0x24BE95638]);
      v13 = objc_alloc_init(MEMORY[0x24BE95648]);
      objc_msgSend(v13, "setAceCommandType:", 2);
      objc_msgSend(v13, "setAceCommandName:", v7);
      objc_msgSend(v12, "setStartedOrChanged:", v13);
      _ConvertIdToSchemaUUID(v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAceId:", v14);

      objc_msgSend(v10, "setAceCommandContext:", v12);
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "emitMessage:", v10);

      v2 = v100;
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_2();
    }

  }
  v16 = (id *)MEMORY[0x24BE08FE0];
  v17 = os_signpost_id_generate((os_log_t)*MEMORY[0x24BE08FE0]);
  v18 = *v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 136315394;
    v110 = "SiriX";
    v111 = 2080;
    v112 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_246FF4000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "UICommandHandle", "%s %s", buf, 0x16u);
  }

  if (!*(_BYTE *)(a1 + 88))
  {
    v45 = *(_QWORD *)(a1 + 40);
    v46 = *(void **)(v45 + 200);
    if (!v46)
      goto LABEL_63;
    v47 = *(void **)(a1 + 32);
    v48 = *(id *)(v45 + 328);
    v49 = v47;
    v50 = v46;
    v51 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v49, "af_dialogPhase");
      v52 = (char *)objc_claimAutoreleasedReturnValue();
      v53 = *MEMORY[0x24BE08FB0];
      v101 = v2;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v110 = "_LogUUFRReadyConditionally";
        v111 = 2112;
        v112 = v52;
        _os_log_impl(&dword_246FF4000, v53, OS_LOG_TYPE_INFO, "%s Logging uufr for phase= %@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_62;
      }
      v101 = v2;
      v52 = 0;
    }
    v54 = objc_alloc_init(MEMORY[0x24BE95C08]);
    v96 = v52;
    objc_msgSend(v54, "setDialogPhase:", objc_msgSend(v52, "UEIUUFRReadyDialogPhase"));
    v97 = v51;
    v55 = v51;
    v99 = v49;
    v56 = v49;
    v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_opt_class();
    v98 = v50;
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v95 = v17;
      v58 = v48;
      v59 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v56, "groupIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "encodedClassName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", CFSTR("%@.%@"), v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v55, "objectForKey:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v63;
      if (v63)
      {
        objc_msgSend(v63, "objectForKey:", CFSTR("dialogIdentifiers"));
        v65 = objc_claimAutoreleasedReturnValue();

        v57 = (id)v65;
      }

      v48 = v58;
      v17 = v95;
    }

    objc_msgSend(v54, "setDialogIdentifiers:", v57);
    v66 = v55;
    v67 = v56;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v66, "objectForKey:", CFSTR("com.apple.ace.assistant.AddViews"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectForKey:", CFSTR("views"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70;
      if (v70 && objc_msgSend(v70, "count"))
      {
        objc_msgSend(v71, "objectAtIndex:", 0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        _ExtractAceViewId(v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v73 = 0;
      }

    }
    else
    {
      v73 = 0;
    }

    objc_msgSend(v54, "setAceViewId:", v73);
    objc_msgSend(v54, "setUufrReadySource:", 1);
    v86 = (objc_class *)objc_opt_class();
    NSStringFromClass(v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAceCommandClass:", v87);

    objc_msgSend(v67, "aceId");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    _ConvertIdToSchemaUUID(v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAceCommandId:", v89);

    v50 = v98;
    objc_msgSend(v48, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v54, mach_absolute_time(), v98);

    v49 = v99;
    v2 = v101;
    v51 = v97;
LABEL_62:

    if (!*(_BYTE *)(a1 + 88))
      goto LABEL_63;
  }
  v20 = (os_log_t *)MEMORY[0x24BE08FB0];
  v21 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v22 = v21;
    AFInterstitialPhaseGetName();
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
    v111 = 2112;
    v112 = v23;
    _os_log_impl(&dword_246FF4000, v22, OS_LOG_TYPE_INFO, "%s interstitialPhase = %@", buf, 0x16u);

  }
  v24 = *(void **)(a1 + 40);
  NSStringFromSelector(*(SEL *)(a1 + 72));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_pauseRequestTimeoutForReason:", v25);

  if (WL_AFIsInternalInstall() && *(_QWORD *)(a1 + 64) == 1)
  {
    mach_absolute_time();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v27 = v26;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "systemUptime");
    v30 = v29;

    *(double *)(*(_QWORD *)(a1 + 40) + 192) = v27;
    v31 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
    {
      v32 = *(const char **)(a1 + 80);
      *(_DWORD *)buf = 136315394;
      v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v111 = 2048;
      v112 = v32;
      _os_log_impl(&dword_246FF4000, v31, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (expected)", buf, 0x16u);
    }
    v33 = *(_QWORD *)(a1 + 40);
    v34 = *(_QWORD *)(v33 + 64);
    v35 = 0.0;
    if (v34 == 2)
    {
      v74 = *(double *)(v33 + 120);
      if (v74 > 0.0)
      {
        v75 = v30 - v74;
        v76 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v111 = 2048;
          v112 = *(const char **)&v75;
          _os_log_impl(&dword_246FF4000, v76, OS_LOG_TYPE_INFO, "%s durationFromRequestBegin = %f", buf, 0x16u);
        }
        v35 = fmax(v75, 0.0);
      }
    }
    else if (v34 == 1)
    {
      v36 = *(double *)(v33 + 176);
      if (v36 > 0.0)
      {
        v37 = v27 - v36;
        v38 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v111 = 2048;
          v112 = *(const char **)&v37;
          _os_log_impl(&dword_246FF4000, v38, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecordingEnd = %f", buf, 0x16u);
        }
        v35 = fmax(v37, 0.0);
        v33 = *(_QWORD *)(a1 + 40);
      }
      v39 = *(double *)(v33 + 184);
      if (v39 > 0.0)
      {
        v40 = v27 - v39;
        v41 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v111 = 2048;
          v112 = *(const char **)&v40;
          _os_log_impl(&dword_246FF4000, v41, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecognition = %f", buf, 0x16u);
        }
        v35 = fmax(v35, v40);
        v33 = *(_QWORD *)(a1 + 40);
      }
      if (*(_QWORD *)(v33 + 128))
      {
        AFMachAbsoluteTimeGetTimeInterval();
        v43 = v42;
        v44 = *v20;
        if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          v111 = 2048;
          v112 = *(const char **)&v43;
          _os_log_impl(&dword_246FF4000, v44, OS_LOG_TYPE_INFO, "%s durationFromSpeechEnd = %f", buf, 0x16u);
        }
        v35 = fmax(v35, v43);
      }
    }
    v77 = *v20;
    if (os_log_type_enabled(*v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v111 = 2048;
      v112 = *(const char **)&v35;
      _os_log_impl(&dword_246FF4000, v77, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (actual)", buf, 0x16u);
    }
    if (v35 < *(double *)(a1 + 80) + -0.2)
    {
      v78 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
        __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_1(v78, v79, v80, v81, v82, v83, v84, v85);
      objc_msgSend(*(id *)(a1 + 40), "reportIssueForType:subtype:context:", CFSTR("Interstitial"), CFSTR("Early Fire"), 0);
    }
  }
LABEL_63:
  v91 = *(_QWORD *)(a1 + 32);
  v90 = *(_QWORD *)(a1 + 40);
  v102[0] = MEMORY[0x24BDAC760];
  v102[1] = 3221225472;
  v102[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_91;
  v102[3] = &unk_251857810;
  v108 = *(_BYTE *)(a1 + 88);
  v92 = *(_QWORD *)(a1 + 72);
  v102[4] = v90;
  v106 = v92;
  v93 = *(void **)(a1 + 48);
  v105 = *(id *)(a1 + 56);
  v103 = v2;
  v104 = *(id *)(a1 + 32);
  v107 = v17;
  v94 = v2;
  objc_msgSend(v93, "assistantConnection:receivedCommand:completion:", v90, v91, v102);

}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2;
  block[3] = &unk_2518577E8;
  v17 = *(_BYTE *)(a1 + 80);
  block[4] = v4;
  v10 = *(_OWORD *)(a1 + 56);
  v6 = (id)v10;
  v15 = v10;
  v12 = v3;
  v13 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 72);
  v14 = v7;
  v16 = v8;
  v9 = v3;
  dispatch_async(v5, block);

}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(void **)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_resumeRequestTimeoutForReason:", v3);

  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 40), 0);
  v26[0] = *(_QWORD *)(a1 + 48);
  AFAnalyticsContextCreateWithCommand();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "logEventWithType:context:contextNoCopy:", 1422, v7, 1);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 56), "aceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ConvertIdToSchemaUUID(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc_init(MEMORY[0x24BE95670]);
      v14 = objc_alloc_init(MEMORY[0x24BE95678]);
      objc_msgSend(v14, "setRequestId:", v12);
      objc_msgSend(v13, "setEventMetadata:", v14);
      v15 = objc_alloc_init(MEMORY[0x24BE95638]);
      v16 = objc_alloc_init(MEMORY[0x24BE95640]);
      objc_msgSend(v16, "setExists:", 1);
      objc_msgSend(v16, "setAceCommandType:", 2);
      objc_msgSend(v15, "setEnded:", v16);
      _ConvertIdToSchemaUUID(v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAceId:", v17);

      objc_msgSend(v13, "setAceCommandContext:", v15);
      objc_msgSend(MEMORY[0x24BE909B0], "sharedStream");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "emitMessage:", v13);

    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_ERROR))
    {
      __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2_cold_1();
    }

  }
  v19 = (id)*MEMORY[0x24BE08FE0];
  v20 = v19;
  v21 = *(_QWORD *)(a1 + 80);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v22 = 136315394;
    v23 = "SiriX";
    v24 = 2080;
    v25 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_246FF4000, v20, OS_SIGNPOST_INTERVAL_END, v21, "UICommandHandle", "%s %s", (uint8_t *)&v22, 0x16u);
  }

}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_94(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 72) && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v2 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v9 = 136315394;
      v10 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s Drop command %@ because UUFR has been presented.", (uint8_t *)&v9, 0x16u);
    }
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 38);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);
LABEL_12:

    }
  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 136315394;
      v10 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_246FF4000, v6, OS_LOG_TYPE_INFO, "%s Dispatching command %@", (uint8_t *)&v9, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (!*(_BYTE *)(a1 + 72))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = *(void **)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_cancelRequestTimeoutForReason:", v5);
        goto LABEL_12;
      }
    }
  }
}

- (void)_setShouldSpeak:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  char v6;
  NSObject *targetQueue;
  _QWORD block[5];

  v3 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[NAFConnection _setShouldSpeak:].cold.1(v3, v5);
  if (-[NAFConnection shouldSpeak](self, "shouldSpeak") != v3)
  {
    if (v3)
      v6 = 2;
    else
      v6 = 0;
    *((_BYTE *)self + 216) = *((_BYTE *)self + 216) & 0xFD | v6;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__NAFConnection__setShouldSpeak___block_invoke;
    block[3] = &unk_251857888;
    block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

uint64_t __33__NAFConnection__setShouldSpeak___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellDelegateShouldSpeakChanged:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 216) >> 1) & 1);
}

- (void)_aceConnectionWillRetryOnError:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryError, a3);
}

- (BOOL)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  AFAudioPowerUpdater *v8;
  AFAudioPowerUpdater *inputAudioPowerUpdater;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NAFConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
  if (v4
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate),
        v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0))
  {
    getAFAudioPowerXPCProviderClass();
    v7 = (void *)objc_msgSend(objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()), "initWithXPCWrapper:", v4);
    getAFAudioPowerUpdaterClass();
    v8 = (AFAudioPowerUpdater *)objc_msgSend(objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue()), "initWithProvider:queue:frequency:delegate:", v7, self->_targetQueue, 1, self);
    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v8;

    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[NAFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]";
      _os_log_impl(&dword_246FF4000, v10, OS_LOG_TYPE_INFO, "%s Prepared for input audio power updates. Waiting for _speechCallbackGroup...", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__NAFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke;
    v13[3] = &unk_2518578B0;
    objc_copyWeak(&v14, (id *)buf);
    -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __60__NAFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 30);
    if (v3)
    {
      objc_msgSend(v3, "beginUpdate");
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v5 = 136315138;
        v6 = "-[NAFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]_block_invoke";
        _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s Started input audio power updates.", (uint8_t *)&v5, 0xCu);
      }
    }
  }

}

- (void)_stopInputAudioPowerUpdates
{
  AFAudioPowerUpdater *inputAudioPowerUpdater;
  AFAudioPowerUpdater *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  if (inputAudioPowerUpdater)
  {
    -[AFAudioPowerUpdater endUpdate](inputAudioPowerUpdater, "endUpdate");
    -[AFAudioPowerUpdater invalidate](self->_inputAudioPowerUpdater, "invalidate");
    v4 = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = 0;

    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[NAFConnection _stopInputAudioPowerUpdates]";
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s Stopped input audio power updates.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  NSObject *targetQueue;
  _QWORD block[5];

  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[NAFConnection _setAudioSessionID:].cold.1();
  if (self->_audioSessionID != a3)
  {
    self->_audioSessionID = a3;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__NAFConnection__setAudioSessionID___block_invoke;
    block[3] = &unk_251857888;
    block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

uint64_t __36__NAFConnection__setAudioSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellDelegateAudioSessionIDChanged:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 220));
}

- (void)_setRecordRoute:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *recordRoute;
  NSString *v7;
  NSString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[NAFConnection _setRecordRoute:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v9, 0x16u);
  }
  recordRoute = self->_recordRoute;
  if (recordRoute != v4 && !-[NSString isEqualToString:](recordRoute, "isEqualToString:", v4))
  {
    v7 = (NSString *)-[NSString copy](v4, "copy");
    v8 = self->_recordRoute;
    self->_recordRoute = v7;

  }
}

- (void)_markIsDucking
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s Unable to mark isDucking because the active request is not a speech request. (_activeRequestType = %zd, _activeRequestUUID = %@)", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_markIsTwoShot
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s Unable to mark isTwoShot because the active request is not a speech request. (_activeRequestType = %zd, _activeRequestUUID = %@)", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_markSpeechRecognized
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s Unable to mark speech recognized because the active request is not a speech request. (_activeRequestType = %ld, _activeRequestUUID = %@)", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_markNetworkDidBecomeActive
{
  id v3;
  void *v4;

  self->_connectionHadActiveNetwork = 1;
  if ((WL_AFIsVision() & 1) == 0)
  {
    if (!WL_AFDeviceSupportsSiriUOD()
      || (getAFFeatureFlagsClass(),
          v3 = (id)objc_claimAutoreleasedReturnValue(),
          +[NAFConnection currentLanguageCode](NAFConnection, "currentLanguageCode"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v3) = objc_msgSend(v3, "isSiriUODAvailableForLanguage:", v4),
          v4,
          (v3 & 1) == 0))
    {
      -[NAFConnection _extendExpiringRequestTimeout](self, "_extendExpiringRequestTimeout");
    }
  }
}

- (void)_updateSpeechEndHostTime:(unint64_t)a3
{
  os_log_t *v4;
  unint64_t activeRequestNumberOfPresentedInterstitials;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (self->_activeRequestType == 1)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      -[NAFConnection _updateSpeechEndHostTime:].cold.3();
    if (self->_activeRequestSpeechEndHostTime != a3)
    {
      self->_activeRequestSpeechEndHostTime = a3;
      getAFFeatureFlagsClass();
      if (objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "isStateFeedbackEnabled"))
      {
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __42__NAFConnection__updateSpeechEndHostTime___block_invoke;
        v18[3] = &unk_2518578D8;
        v18[4] = self;
        v18[5] = a3;
        -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v18);
      }
      else
      {
        activeRequestNumberOfPresentedInterstitials = self->_activeRequestNumberOfPresentedInterstitials;
        if (activeRequestNumberOfPresentedInterstitials == 1)
        {
          v10 = *v4;
          if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
            -[NAFConnection _updateSpeechEndHostTime:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
        }
        else if (activeRequestNumberOfPresentedInterstitials)
        {
          if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
            -[NAFConnection _updateSpeechEndHostTime:].cold.1();
        }
        else
        {
          v8 = *v4;
          if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v20 = "-[NAFConnection _updateSpeechEndHostTime:]";
            v21 = 2048;
            v22 = a3;
            _os_log_impl(&dword_246FF4000, v8, OS_LOG_TYPE_INFO, "%s No interstitial has been presented yet, adjusting timings based on updated speech end host time %llu.", buf, 0x16u);
          }
          NSStringFromSelector(a2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NAFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v9);
          -[NAFConnection _beginInterstitialsForReason:](self, "_beginInterstitialsForReason:", v9);

        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    -[NAFConnection _updateSpeechEndHostTime:].cold.4();
  }
}

void __42__NAFConnection__updateSpeechEndHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionUpdatedSpeechEndEstimate:speechEndEstimate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_siriClientStateManager
{
  AFSiriClientStateManager *siriClientStateManager;
  AFSiriClientStateManager *v4;
  AFSiriClientStateManager *v5;

  siriClientStateManager = self->_siriClientStateManager;
  if (!siriClientStateManager)
  {
    objc_msgSend(MEMORY[0x24BE092D8], "sharedManager");
    v4 = (AFSiriClientStateManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_siriClientStateManager;
    self->_siriClientStateManager = v4;

    siriClientStateManager = self->_siriClientStateManager;
  }
  return siriClientStateManager;
}

- (int64_t)_getActiveSpeechEvent
{
  return self->_activeRequestSpeechEvent;
}

- (void)_tellDelegateRequestWillStart
{
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "assistantConnectionRequestWillStart:", self);

  }
}

- (void)_completeRequestWithUUID:(id)a3 forReason:(int64_t)a4 error:(id)a5
{
  NSUUID *v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  NSUUID *activeTurnIdentifier;
  int64_t activeRequestType;
  int v14;
  id *p_activeRequestUUID;
  id WeakRetained;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSUUID *activeRequestUUID;
  NSUUID *v22;
  id v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  NSUUID *v27;
  NSUUID *v28;
  int v29;
  const char *v30;
  __int16 v31;
  NSUUID *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = (NSUUID *)a3;
  v9 = a5;
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    activeTurnIdentifier = self->_activeTurnIdentifier;
    v29 = 136316162;
    v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = (int64_t)activeTurnIdentifier;
    v35 = 2048;
    v36 = a4;
    v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_246FF4000, v11, OS_LOG_TYPE_INFO, "%s requestUUID = %@, turnId = %@, reason %ld, error = %@", (uint8_t *)&v29, 0x34u);
  }
  activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    v14 = -[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v8);
    if (self->_activeRequestType)
      goto LABEL_5;
LABEL_10:
    v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      v29 = 136315138;
      v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      _os_log_impl(&dword_246FF4000, v19, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is complete", (uint8_t *)&v29, 0xCu);
    }
    p_activeRequestUUID = (id *)&self->_activeRequestUUID;
    if ((-[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v8) & 1) != 0)
      goto LABEL_18;
LABEL_13:
    v20 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      v22 = self->_activeTurnIdentifier;
      v29 = 136315906;
      v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      v31 = 2112;
      v32 = activeRequestUUID;
      v33 = 2112;
      v34 = (int64_t)v8;
      v35 = 2112;
      v36 = (int64_t)v22;
      _os_log_impl(&dword_246FF4000, v20, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is different (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v29, 0x2Au);
    }
    goto LABEL_18;
  }
  v14 = 0;
  if (!activeRequestType)
    goto LABEL_10;
LABEL_5:
  p_activeRequestUUID = (id *)&self->_activeRequestUUID;
  if ((-[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v8) & 1) == 0)
    goto LABEL_13;
  if (v9)
  {
    -[NAFConnection _willFailRequestWithError:](self, "_willFailRequestWithError:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "assistantConnection:requestFailedWithError:requestClass:", self, v9, self->_outstandingRequestClass);
LABEL_17:

    }
  }
  else
  {
    -[NAFConnection _willCompleteRequest](self, "_willCompleteRequest");
    v23 = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "assistantConnectionRequestFinished:", self);
      goto LABEL_17;
    }
  }
LABEL_18:
  if (*p_activeRequestUUID && !objc_msgSend(*p_activeRequestUUID, "isEqual:", v8))
  {
    v26 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      v27 = self->_activeRequestUUID;
      v28 = self->_activeTurnIdentifier;
      v29 = 136315906;
      v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      v31 = 2112;
      v32 = v27;
      v33 = 2112;
      v34 = (int64_t)v8;
      v35 = 2112;
      v36 = (int64_t)v28;
      _os_log_impl(&dword_246FF4000, v26, OS_LOG_TYPE_INFO, "%s Not ending the ongoing request because the active request ID is different than the completed request ID: (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v29, 0x2Au);
    }
  }
  else
  {
    -[NAFConnection _requestDidEnd](self, "_requestDidEnd");
  }
  if (v14)
  {
    v25 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      v29 = 136315650;
      v30 = "-[NAFConnection _completeRequestWithUUID:forReason:error:]";
      v31 = 2112;
      v32 = v8;
      v33 = 2048;
      v34 = a4;
      _os_log_impl(&dword_246FF4000, v25, OS_LOG_TYPE_INFO, "%s Resetting isCapturingSpeech for %@ for reason: %ld", (uint8_t *)&v29, 0x20u);
    }
    -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  }

}

- (void)_tellDelegateShouldSpeakChanged:(BOOL)a3
{
  _BOOL8 v3;
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:shouldSpeak:", self, v3);

  }
}

- (void)_tellDelegateAudioSessionIDChanged:(unsigned int)a3
{
  uint64_t v3;
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:didChangeAudioSessionID:", self, v3);

  }
}

- (void)_tellDelegateWillStartAcousticIDRequest
{
  id WeakRetained;
  char v4;
  id v5;

  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1916, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "assistantConnectionWillStartAcousticIDRequest:", self);

  }
}

- (void)_tellDelegateDidDetectMusic
{
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "assistantConnectionDidDetectMusic:", self);

  }
}

- (void)_tellDelegateDidFinishAcousticIDRequestWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  AFAnalytics *analytics;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x24BDAC8D0];
  analytics = self->_analytics;
  v10 = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1917, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:didFinishAcousticIDRequestWithSuccess:", self, v3);

  }
}

- (void)_tellDelegateSetUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:setUserActivtiyInfoAndMakeCurrent:webpageURL:", self, v10, v6);

  }
}

- (void)_tellDelegateInvalidateCurrentUserActivity
{
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "assistantConnectionInvalidateCurrentUserActivity:", self);

  }
}

- (void)_tellDelegateCacheImage:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "assistantConnection:wantsToCacheImage:", self, v7);

  }
}

- (void)_tellDelegateExtensionRequestWillStartForApplication:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "assistantConnection:extensionRequestWillStartForApplication:", self, v7);

  }
}

- (void)_tellDelegateExtensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:extensionRequestFinishedForApplication:error:", self, v10, v6);

  }
}

- (void)_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  char v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "assistantConnectionAudioSessionDidBeginInterruption:userInfo:", self, v9);
LABEL_5:

    goto LABEL_6;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "assistantConnectionAudioSessionDidBeginInterruption:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_tellDelegateAudioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;
  id v9;
  char v10;
  id v11;

  v4 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "assistantConnectionAudioSessionDidEndInterruption:shouldResume:userInfo:", self, v4, v11);
LABEL_5:

    goto LABEL_6;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnectionAudioSessionDidEndInterruption:shouldResume:", self, v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_tellDelegateAudioPlaybackRequestWillStart:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "assistantConnection:willStartAudioPlaybackRequest:", self, v7);

  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStart:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "assistantConnection:didStartAudioPlaybackRequest:", self, v7);

  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStop:(id)a3 error:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "assistantConnection:didStopAudioPlaybackRequest:error:", self, v10, v6);

  }
}

- (void)_tellDelegateWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, uint64_t);
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  id v15;

  v15 = a4;
  v8 = (void (**)(id, uint64_t, uint64_t))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "assistantConnection:willProcessStartPlayback:intent:completion:", self, a3, v15, v8);

  }
  else
  {
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "assistantConnection:willProcessStartPlayback:", self, a3);

    }
    if (v8)
      v8[2](v8, 1, 1);
  }

}

- (void)_tellDelegateStartPlaybackDidFail:(int64_t)a3
{
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:startPlaybackDidFail:", self, a3);

  }
}

- (void)_tellDelegateAudioSessionWillBecomeActive:(BOOL)a3
{
  _BOOL8 v3;
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:audioSessionWillBecomeActive:", self, v3);

  }
}

- (void)_tellDelegateAudioSessionDidBecomeActive:(BOOL)a3
{
  _BOOL8 v3;
  NAFAssistantUIService **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "assistantConnection:audioSessionDidBecomeActive:", self, v3);

  }
}

- (void)_tellDelegateWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "assistantConnection:willProcessAppLaunchWithBundleIdentifier:", self, v7);

  }
}

- (void)_tellDelegateFailedToLaunchAppWithBundleIdentifier:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "assistantConnection:appLaunchFailedWithBundleIdentifier:", self, v7);

  }
}

- (void)_dispatchCallbackGroupBlock:(id)a3
{
  id v4;
  NSObject *speechCallbackGroup;
  NSObject *targetQueue;
  id WeakRetained;
  _QWORD block[4];
  id v9;
  id v10;
  id to;

  v4 = a3;
  if (v4)
  {
    if (self->_speechCallbackGroup)
    {
      objc_copyWeak(&to, (id *)&self->_speechDelegate);
      speechCallbackGroup = self->_speechCallbackGroup;
      targetQueue = self->_targetQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__NAFConnection__dispatchCallbackGroupBlock___block_invoke;
      block[3] = &unk_251857900;
      v9 = v4;
      objc_copyWeak(&v10, &to);
      dispatch_group_notify(speechCallbackGroup, targetQueue, block);
      objc_destroyWeak(&v10);

      objc_destroyWeak(&to);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
      (*((void (**)(id, id))v4 + 2))(v4, WeakRetained);

    }
  }

}

void __45__NAFConnection__dispatchCallbackGroupBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

- (void)_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__NAFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v6[3] = &unk_251857928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

void __84__NAFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnection:speechRecordingWillBeginWithInputAudioPowerXPCWrapper:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnectionSpeechRecordingWillBegin:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unsigned int v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__NAFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v8[3] = &unk_251857950;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v8);

}

void __84__NAFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnection:speechRecordingDidBeginOnAVRecordRoute:audioSessionID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assistantConnection:speechRecordingDidBeginOnAVRecordRoute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (void)_tellSpeechDelegateRecordingDidChangeAVRecordRoute:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__NAFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke;
  v6[3] = &unk_251857928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

void __68__NAFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecordingDidChangeAVRecordRoute:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_tellSpeechDelegateRecordingDidDetectStartpoint
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __64__NAFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke;
  v2[3] = &unk_251857978;
  v2[4] = self;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

void __64__NAFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionSpeechRecordingDidDetectStartpoint:", *(_QWORD *)(a1 + 32));

}

- (void)_tellSpeechDelegateToPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke;
  v8[3] = &unk_2518579C8;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v8);

}

void __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 64);
  if (v5 == 1 && !*(_QWORD *)(v4 + 72))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2;
      v13[3] = &unk_2518579A0;
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 48);
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v3, "assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:", v10, v11, v13);

      goto LABEL_6;
    }
    v6 = *(_QWORD *)(a1 + 40);
    if (!v6)
      goto LABEL_6;
    v7 = (void *)MEMORY[0x24BE091D8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Speech delegate %@ is incapable of performing two-shot prompt."), v3, v12);
    goto LABEL_5;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BE091D8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Active request type is %ld and active request UUFR type is %ld, two-shot prompt is ignored."), v5, *(_QWORD *)(v4 + 72));
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithCode:description:underlyingError:", 15, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, double, double))(v6 + 16))(v6, v9, 0.0, 0.0);

  }
LABEL_6:

}

uint64_t __73__NAFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_tellSpeechDelegateRecordingDidEnd
{
  double v3;
  _QWORD v4[5];

  if (self->_activeRequestType == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_activeRequestSpeechRecordingEndTimeInterval = v3;
  }
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__NAFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke;
  v4[3] = &unk_251857978;
  v4[4] = self;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v4);
}

void __51__NAFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionSpeechRecordingDidEnd:", *(_QWORD *)(a1 + 32));

}

- (void)_tellSpeechDelegateRecordingDidCancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__NAFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke;
  v2[3] = &unk_251857978;
  v2[4] = self;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v2);
}

void __54__NAFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnectionSpeechRecordingDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)_tellSpeechDelegateRecordingDidFail:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__NAFConnection__tellSpeechDelegateRecordingDidFail___block_invoke;
  v6[3] = &unk_251857928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

void __53__NAFConnection__tellSpeechDelegateRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecordingDidFail:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_tellSpeechDelegateSpeechRecognized:(id)a3
{
  id v4;
  double v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self->_activeRequestType == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_activeRequestSpeechRecognitionTimeInterval = v5;
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__NAFConnection__tellSpeechDelegateSpeechRecognized___block_invoke;
  v7[3] = &unk_251857928;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v7);

}

void __53__NAFConnection__tellSpeechDelegateSpeechRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecognized:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__NAFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke;
  v10[3] = &unk_2518579F0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v10);

}

void __83__NAFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:recognizedAdditionalSpeechInterpretation:refId:", a1[4], a1[5], a1[6]);

}

- (void)_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__NAFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v14[3] = &unk_251857A18;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v14);

}

void __90__NAFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:recognitionUpdateWithPhrases:utterances:refId:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)_tellSpeechDelegateRecognitionUpdateWillBeginForTask:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__NAFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke;
  v6[3] = &unk_251857928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

void __70__NAFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:recognitionUpdateWillBeginForTask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_tellSpeechDelegateSpeechRecognizedPartialResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__NAFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke;
  v6[3] = &unk_251857928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

void __66__NAFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecognizedPartialResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__NAFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke;
  v6[3] = &unk_251857928;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[NAFConnection _dispatchCallbackGroupBlock:](self, "_dispatchCallbackGroupBlock:", v6);

}

void __55__NAFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assistantConnection:speechRecognitionDidFail:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  NAFSpeechDelegate **p_speechDelegate;
  id WeakRetained;
  char v8;
  id v9;

  if (self->_inputAudioPowerUpdater == a3)
  {
    p_speechDelegate = &self->_speechDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_speechDelegate);
      objc_msgSend(v9, "assistantConnectionDidChangeAudioRecordingPower:", self);

    }
  }
}

- (void)accessibilityObserver:(id)a3 stateDidChangeFrom:(id)a4 to:(id)a5
{
  id v6;
  NSObject *targetQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  targetQueue = self->_targetQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__NAFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke;
  v9[3] = &unk_251857720;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(targetQueue, v9);

}

uint64_t __61__NAFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessibilityState:", *(_QWORD *)(a1 + 40));
}

- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4
{
  NSObject *targetQueue;
  _QWORD v5[6];

  targetQueue = self->_targetQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__NAFConnection_deviceRingerObserver_didChangeState___block_invoke;
  v5[3] = &unk_251857A40;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(targetQueue, v5);
}

uint64_t __53__NAFConnection_deviceRingerObserver_didChangeState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeviceRingerSwitchState:", *(_QWORD *)(a1 + 40));
}

- (void)interstitialProvider:(id)a3 handlePhase:(int64_t)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *targetQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  int64_t v33;
  double v34;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  targetQueue = self->_targetQueue;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __109__NAFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke;
  v27[3] = &unk_251857A68;
  v32 = v20;
  v33 = a4;
  v27[4] = self;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v34 = a7;
  v31 = v19;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  dispatch_async(targetQueue, v27);

}

uint64_t __109__NAFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  getAFFeatureFlagsClass();
  if ((objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "isStateFeedbackEnabled") & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(double *)(a1 + 88));
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_connectionFailedWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = a3;
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginTransaction");

  v6 = *((_BYTE *)self + 216);
  *((_BYTE *)self + 216) = v6 & 0xFE;
  *((_BYTE *)self + 272) &= ~1u;
  if ((v6 & 4) != 0)
  {
    *((_BYTE *)self + 216) = v6 & 0xFA;
    WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);

    if (WeakRetained)
    {
      v8 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        -[NAFConnection _connectionFailedWithError:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      -[NAFConnection _tellSpeechDelegateRecordingDidFail:](self, "_tellSpeechDelegateRecordingDidFail:", v4);
    }
    if (!_AFConnectionIsErrorDeallocation(v4))
    {
      -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endListeningForClient:", self->_clientID);

    }
  }
  -[NAFConnection _completeRequestWithUUID:forReason:error:](self, "_completeRequestWithUUID:forReason:error:", self->_activeRequestUUID, 4, v4);
  -[NAFConnection _stopInputAudioPowerUpdates](self, "_stopInputAudioPowerUpdates");
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endTransaction");

}

- (void)_clearConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;

  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection invalidate](connection, "invalidate");
    v4 = self->_connection;
    self->_connection = 0;

  }
}

- (id)_connection
{
  NSXPCConnection *connection;
  AFInstanceContext *instanceContext;
  AFInstanceContext *v5;
  AFInstanceContext *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  OS_dispatch_queue *v9;
  NSXPCConnection *v10;
  uint64_t v11;
  OS_dispatch_queue *v12;
  NSXPCConnection *v13;
  OS_dispatch_queue *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  NSXPCConnection *v18;
  void *v19;
  NSXPCConnection *v20;
  void *v21;
  NSXPCConnection *v22;
  NAFConnectionClientServiceDelegate *v23;
  _QWORD v25[4];
  OS_dispatch_queue *v26;
  id v27;
  _QWORD v28[4];
  OS_dispatch_queue *v29;
  id v30;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (instanceContext)
    {
      v5 = instanceContext;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
      v5 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    -[AFInstanceContext createXPCConnectionWithMachServiceName:options:](v5, "createXPCConnectionWithMachServiceName:options:", *MEMORY[0x24BE094D0], 0);
    v7 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_connection;
    self->_connection = v7;

    objc_initWeak(&location, self);
    v9 = self->_targetQueue;
    v10 = self->_connection;
    v11 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __28__NAFConnection__connection__block_invoke;
    v28[3] = &unk_251857AB8;
    v12 = v9;
    v29 = v12;
    objc_copyWeak(&v30, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v28);
    v13 = self->_connection;
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __28__NAFConnection__connection__block_invoke_199;
    v25[3] = &unk_251857AB8;
    v14 = v12;
    v26 = v14;
    objc_copyWeak(&v27, &location);
    -[NSXPCConnection setInterruptionHandler:](v13, "setInterruptionHandler:", v25);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.siri.SiriOrchestration.NAFConnection", v16);
    -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", v17);
    v18 = self->_connection;
    AFClientServiceXPCInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v18, "setRemoteObjectInterface:", v19);

    v20 = self->_connection;
    AFClientServiceDelegateXPCInterface();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v20, "setExportedInterface:", v21);

    v22 = self->_connection;
    v23 = -[NAFConnectionClientServiceDelegate initWithConnection:targetQueue:]([NAFConnectionClientServiceDelegate alloc], "initWithConnection:targetQueue:", self, self->_targetQueue);
    -[NSXPCConnection setExportedObject:](v22, "setExportedObject:", v23);

    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  return connection;
}

void __28__NAFConnection__connection__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__NAFConnection__connection__block_invoke_2;
  block[3] = &unk_251857A90;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __28__NAFConnection__connection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[NAFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s Connection invalidated", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_connectionFailedWithError:", v3);

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "_clearConnection");

}

void __28__NAFConnection__connection__block_invoke_199(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__NAFConnection__connection__block_invoke_2_200;
  block[3] = &unk_251857A90;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __28__NAFConnection__connection__block_invoke_2_200(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id *v4;
  id WeakRetained;
  id v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[NAFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s Connection interrupted", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_connectionFailedWithError:", v3);

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "_updateState");

  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v7, "_updateClientConfiguration");

}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  void *v6;

  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEBUG))
    -[NAFConnection requestDidAskForTimeoutExtension:].cold.1();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", v6, a3);

}

- (void)_scheduleRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  id v6;
  void *v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v6);
  if (!self->_requestTimeoutTimer)
  {
    if (a4 == 0.0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.assistant"));
      objc_msgSend(v7, "doubleForKey:", CFSTR("defaultTimeout"));
      if (v8 == 0.0)
      {
        a4 = 12.0;
        if (WL_AFDeviceSupportsSAE())
        {
          v9 = *MEMORY[0x24BE08FB0];
          a4 = 20.0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
            -[NAFConnection _scheduleRequestTimeoutForReason:durationInSeconds:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
      else
      {
        a4 = v8;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
          -[NAFConnection _scheduleRequestTimeoutForReason:durationInSeconds:].cold.1();
      }

    }
    -[NAFConnection _startRequestTimeoutTimerWithTimeInterval:reason:](self, "_startRequestTimeoutTimerWithTimeInterval:reason:", v6, a4);
  }

}

- (void)_startRequestTimeoutTimerWithTimeInterval:(double)a3 reason:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  OS_dispatch_queue *targetQueue;
  uint64_t v11;
  id *p_requestTimeoutTimer;
  AFWatchdogTimer *requestTimeoutTimer;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18[2];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[NAFConnection _startRequestTimeoutTimerWithTimeInterval:reason:]";
    v21 = 2048;
    v22 = a3;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_246FF4000, v8, OS_LOG_TYPE_DEFAULT, "%s Scheduling request timeout for %f seconds for reason %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v9 = objc_alloc(MEMORY[0x24BE093A8]);
  targetQueue = self->_targetQueue;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __66__NAFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke;
  v17 = &unk_251857AE0;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a2;
  v11 = objc_msgSend(v9, "initWithTimeoutInterval:onQueue:timeoutHandler:", targetQueue, &v14, a3);
  requestTimeoutTimer = self->_requestTimeoutTimer;
  p_requestTimeoutTimer = (id *)&self->_requestTimeoutTimer;
  *p_requestTimeoutTimer = (id)v11;

  objc_msgSend(*p_requestTimeoutTimer, "start", v14, v15, v16, v17);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);

}

void __66__NAFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invokeRequestTimeoutForReason:", v2);

}

- (void)_invokeRequestTimeoutForReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[NAFConnection _invokeRequestTimeoutForReason:]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoking request timeout for reason %{public}@", (uint8_t *)&v11, 0x16u);
  }
  -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v4);
  if (self->_connectionHadActiveNetwork
    || (WL_AFIsVision() & 1) != 0
    || WL_AFDeviceSupportsSiriUOD()
    && (getAFFeatureFlagsClass(),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)objc_opt_class(), "currentLanguageCode"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = objc_msgSend(v6, "isSiriUODAvailableForLanguage:", v7),
        v7,
        (_DWORD)v6))
  {
    v8 = 1;
  }
  else
  {
    v8 = 52;
  }
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", v8, 0, self->_lastRetryError);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFConnection _clientService](self, "_clientService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelRequestForReason:withError:", 4, v9);

  -[NAFConnection _completeRequestWithUUID:forReason:error:](self, "_completeRequestWithUUID:forReason:error:", self->_activeRequestUUID, 3, v9);
}

- (void)_pauseRequestTimeoutForReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_requestTimeoutTimer)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[NAFConnection _pauseRequestTimeoutForReason:]";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_DEFAULT, "%s Pausing request timeout for reason %{public}@", (uint8_t *)&v6, 0x16u);
    }
    -[AFWatchdogTimer stop](self->_requestTimeoutTimer, "stop");
  }

}

- (void)_resumeRequestTimeoutForReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_requestTimeoutTimer)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[NAFConnection _resumeRequestTimeoutForReason:]";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_DEFAULT, "%s Resuming request timeout for reason %{public}@", (uint8_t *)&v6, 0x16u);
    }
    -[AFWatchdogTimer start](self->_requestTimeoutTimer, "start");
  }

}

- (void)_cancelRequestTimeoutForReason:(id)a3
{
  id v4;
  NSObject *v5;
  AFWatchdogTimer *requestTimeoutTimer;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_requestTimeoutTimer)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[NAFConnection _cancelRequestTimeoutForReason:]";
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_DEFAULT, "%s Canceling request timeout for reason %{public}@", (uint8_t *)&v7, 0x16u);
    }
    -[AFWatchdogTimer cancel](self->_requestTimeoutTimer, "cancel");
    requestTimeoutTimer = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;

  }
}

- (void)_extendRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[NAFConnection _extendRequestTimeoutForReason:durationInSeconds:]";
    v10 = 2114;
    v11 = v6;
    v12 = 2050;
    v13 = a4;
    _os_log_impl(&dword_246FF4000, v7, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@, durationInSeconds: %{public}f", (uint8_t *)&v8, 0x20u);
  }
  -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v6);
  if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType)
    -[NAFConnection _scheduleRequestTimeoutForReason:durationInSeconds:](self, "_scheduleRequestTimeoutForReason:durationInSeconds:", v6, a4);

}

- (void)_extendExistingRequestTimeoutForReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[NAFConnection _extendExistingRequestTimeoutForReason:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (self->_requestTimeoutTimer)
    -[NAFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", v4, 0.0);

}

- (void)_extendExpiringRequestTimeout
{
  double v3;
  double v4;
  BOOL v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[AFWatchdogTimer timeRemaining](self->_requestTimeoutTimer, "timeRemaining");
  v4 = v3;
  if (self->_requestTimeoutTimer)
    v5 = v3 < 4.0;
  else
    v5 = 0;
  if (v5)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[NAFConnection _extendExpiringRequestTimeout]";
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_246FF4000, v6, OS_LOG_TYPE_DEFAULT, "%s Extending timeout with time remaining %.2f", (uint8_t *)&v7, 0x16u);
    }
    -[NAFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", CFSTR("ExtendOnlyIfExpiring"), 4.0);
  }
}

- (void)_updateStateIfNotInSync
{
  if ((*((_BYTE *)self + 216) & 1) == 0)
    -[NAFConnection _updateState](self, "_updateState");
}

- (void)_fetchShouldSpeak:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__NAFConnection__fetchShouldSpeak___block_invoke;
  v7[3] = &unk_251857B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestShouldSpeakStateWithReply:", v7);

}

void __35__NAFConnection__fetchShouldSpeak___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__NAFConnection__fetchShouldSpeak___block_invoke_2;
  block[3] = &unk_251857B08;
  v7 = a2;
  block[4] = v2;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __35__NAFConnection__fetchShouldSpeak___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t result;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = *(unsigned __int8 *)(a1 + 48);
    v5 = v2;
    objc_msgSend(v3, "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[NAFConnection _fetchShouldSpeak:]_block_invoke_2";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setShouldSpeak:", *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)_updateState
{
  void *v3;
  _QWORD v4[5];

  -[NAFConnection _clientService](self, "_clientService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__NAFConnection__updateState__block_invoke;
  v4[3] = &unk_251857B80;
  v4[4] = self;
  objc_msgSend(v3, "requestStateUpdateWithReply:", v4);

}

void __29__NAFConnection__updateState__block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  int v6;
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__NAFConnection__updateState__block_invoke_2;
  v5[3] = &unk_251857B58;
  v5[4] = v3;
  v7 = a2;
  v6 = a3;
  dispatch_async(v4, v5);
}

uint64_t __29__NAFConnection__updateState__block_invoke_2(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  os_log_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) |= 1u;
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = *(unsigned __int8 *)(a1 + 44);
    v6 = v3;
    objc_msgSend(v4, "numberWithBool:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[NAFConnection _updateState]_block_invoke_2";
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_246FF4000, v6, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setShouldSpeak:", *(unsigned __int8 *)(a1 + 44));
  v8 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    v10 = *(unsigned int *)(a1 + 40);
    v11 = v8;
    objc_msgSend(v9, "numberWithUnsignedInt:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[NAFConnection _updateState]_block_invoke";
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_246FF4000, v11, OS_LOG_TYPE_INFO, "%s Updated internal state. AudioSessionID %@", (uint8_t *)&v14, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", *(unsigned int *)(a1 + 40));
}

- (void)_updateClientConfiguration
{
  void *v3;
  void *v4;

  if ((*((_BYTE *)self + 272) & 1) == 0)
  {
    -[NAFConnection _clientService](self, "_clientService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setConfiguration:", v4);

    *((_BYTE *)self + 272) |= 1u;
  }
}

- (BOOL)_shouldEmitUEIRequestLinkForRequestInfo:(id)a3 speechRequestOptions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "activationEvent");
  v7 = objc_msgSend(v5, "activationEvent");

  return v6 == 6 || (unint64_t)(v6 - 9) < 2 || v7 == 17;
}

- (void)_willStartRequestWithSpeech:(BOOL)a3 speechRequestOptions:(id)a4 requestInfo:(id)a5 analyticsEventProvider:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NAFConnection *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  double v31;
  double v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  objc_class *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  NSObject *v58;
  NAFConnection *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  int64_t v65;
  double v66;
  double v67;
  NSError *lastRetryError;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSUUID *v76;
  uint64_t (**v77)(id, id);
  _BOOL4 v78;
  id obj;
  void *v80;
  id v81;
  const __CFString *v82;
  void *v83;
  _QWORD v84[2];
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[2];
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  NAFConnection *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  _BOOL4 v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v78 = a3;
  v98 = *MEMORY[0x24BDAC8D0];
  v81 = a4;
  v9 = a5;
  v77 = (uint64_t (**)(id, id))a6;
  v76 = self->_activeRequestUUID;
  v80 = v9;
  objc_msgSend(v9, "startRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v80, "startRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v80, "startRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "aceId");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v21 = (void *)v16;
      v22 = (void *)objc_msgSend(v14, "initWithUUIDString:", v16);

      goto LABEL_9;
    }
  }
  objc_msgSend(v80, "startLocalRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v80, "startLocalRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "aceId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      v14 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v80, "startLocalRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "aceId");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v22 = 0;
LABEL_9:
  objc_msgSend(v81, "intuitiveConversationRequestId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v81, "intuitiveConversationRequestId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      objc_msgSend(v24, "UUIDString");
      v27 = (NAFConnection *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v89 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      v90 = 2112;
      v91 = v27;
      _os_log_impl(&dword_246FF4000, v26, OS_LOG_TYPE_INFO, "%s Setting IntuitiveConversationRequestId = %@ from AFSpeechRequestOptions", buf, 0x16u);

    }
  }
  else
  {
    v24 = v22;
  }
  obj = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    obj = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "beginRequestWithUUID:forClient:", obj, self->_clientID);

  -[NAFConnection _willCancelRequest](self, "_willCancelRequest");
  -[NAFConnection _completeRequestWithUUID:forReason:error:](self, "_completeRequestWithUUID:forReason:error:", v76, 1, 0);
  v29 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v89 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
    v90 = 2048;
    v91 = self;
    v92 = 2112;
    v93 = obj;
    v94 = 1024;
    v95 = v78;
    v96 = 2112;
    v97 = v81;
    _os_log_impl(&dword_246FF4000, v29, OS_LOG_TYPE_INFO, "%s %p %@ %d (%@)", buf, 0x30u);
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "systemUptime");
  v32 = v31;

  if (v77 && (v34 = (void *)v77[2](v77, obj)) != 0)
  {
    v35 = v33;
  }
  else
  {
    v85[0] = CFSTR("isSpeechRequest");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v78);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v36;
    v85[1] = CFSTR("id");
    objc_msgSend(obj, "UUIDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v37;
    v85[2] = CFSTR("unixTime");
    v38 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "timeIntervalSince1970");
    objc_msgSend(v38, "numberWithDouble:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v40;
    v85[3] = CFSTR("systemVersion");
    WL_AFProductAndBuildVersion();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v41;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v42;
    -[NAFConnection _startRequestMetricSettings](self, "_startRequestMetricSettings");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge();
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (WL_AFIsInternalInstall())
    {
      v84[0] = v45;
      AFAnalyticsTurnContextCreateWithRequestInfo();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v46;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      AFAnalyticsContextsMerge();
      v48 = objc_claimAutoreleasedReturnValue();

      v45 = (void *)v48;
    }
    AFAnalyticsEventCreateCurrent();
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 3;
  }
  -[AFAnalytics logEvent:](self->_analytics, "logEvent:", v34);
  if (v78)
    v49 = v81;
  else
    v49 = v80;
  objc_msgSend(v49, "turnIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_activeTurnIdentifier, v50);
  v51 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:].cold.1(v51);
  v52 = obj;
  if (v50)
  {
    v53 = (objc_class *)MEMORY[0x24BE95C78];
    v54 = v50;
    v55 = (void *)objc_msgSend([v53 alloc], "initWithNSUUID:", v52);
    v56 = objc_alloc_init(MEMORY[0x24BE95BA8]);
    objc_msgSend(v56, "setMteRequestId:", v55);

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v56, mach_absolute_time(), v54);

  }
  if (-[NAFConnection _shouldEmitUEIRequestLinkForRequestInfo:speechRequestOptions:](self, "_shouldEmitUEIRequestLinkForRequestInfo:speechRequestOptions:", v80, v81))
  {
    v58 = (id)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      MEMORY[0x24957005C](v50);
      v59 = (NAFConnection *)(id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "UUIDString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v89 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      v90 = 2112;
      v91 = v59;
      v92 = 2112;
      v93 = v60;
      _os_log_impl(&dword_246FF4000, v58, OS_LOG_TYPE_INFO, "%s Emitting Request link message between turnID: %@ and RequestID: %@", buf, 0x20u);

    }
    objc_msgSend(v52, "UUIDString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x24957005C](v50);
    v62 = (id)objc_claimAutoreleasedReturnValue();
    ADCreateRequestLinkInfo();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    ADCreateRequestLinkInfo();
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    ADEmitRequestLinkEventMessage();
  }
  objc_storeStrong((id *)&self->_activeRequestUUID, obj);
  v65 = 1;
  if (!v78)
    v65 = 2;
  self->_activeRequestType = v65;
  self->_activeRequestSpeechEvent = objc_msgSend(v81, "activationEvent");
  self->_activeRequestActivationEvent = objc_msgSend(v80, "activationEvent");
  self->_activeRequestBeginTime = v32;
  self->_activeRequestTypeForRequestCategorization = v35;
  if (!v78)
  {
    self->_activeRequestStartSpeechTimeRequested = 0.0;
    self->_activeRequestStartSpeechTimeAPICalled = 0.0;
    goto LABEL_44;
  }
  self->_activeRequestStartSpeechTimeAPICalled = v32;
  if (!v81)
    goto LABEL_44;
  objc_msgSend(v81, "activationEventTime");
  if (v66 <= 0.0)
  {
    if (!objc_msgSend(v81, "activationEventMachAbsoluteTime"))
      goto LABEL_44;
    objc_msgSend(v81, "activationEventMachAbsoluteTime");
    AFMachAbsoluteTimeGetTimeInterval();
  }
  else
  {
    objc_msgSend(v81, "activationEventTime");
  }
  self->_activeRequestStartSpeechTimeRequested = v67;
LABEL_44:
  self->_activeRequestUsefulUserResultType = 0;
  *(_WORD *)&self->_activeRequestIsDucking = 0;
  self->_activeRequestSpeechEndHostTime = 0;
  self->_activeRequestNumberOfPresentedInterstitials = 0;
  *(_OWORD *)&self->_activeRequestStopSpeechTimeRequested = 0u;
  *(_OWORD *)&self->_activeRequestSpeechRecordingEndTimeInterval = 0u;
  self->_activeRequestInitialInterstitialBeginTimeInterval = 0.0;
  lastRetryError = self->_lastRetryError;
  self->_lastRetryError = 0;

  self->_uufrID = 0;
  -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
  _EmitHomePodLaunchContextTime(self->_analytics, self->_activeRequestUUID, self->_activeTurnIdentifier, v81);
  if (v78)
  {
    objc_msgSend(MEMORY[0x24BE090C0], "logSiriSpeechRequestStarted");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE090C0], "logSiriOtherRequestStarted");
    -[NAFConnection _updateStateIfNotInSync](self, "_updateStateIfNotInSync");
  }
  objc_msgSend(MEMORY[0x24BE09238], "currentCoordinator");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    objc_msgSend(v69, "setCurrentRequestId:", v52);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = CFSTR("requestId");
    objc_msgSend(v52, "UUIDString");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v72;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("RequestIdForMyriad"), 0, v73, 1);

  }
  objc_msgSend(MEMORY[0x24BE090B0], "sharedObserver");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addListener:", self);

  objc_msgSend(MEMORY[0x24BE091A0], "sharedObserver");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "addListener:", self);

}

- (void)_willEndSession
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  NAFConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[NAFConnection _willEndSession]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  if (self->_activeRequestUsefulUserResultType == 2)
    -[NAFConnection _willCompleteRequest](self, "_willCompleteRequest");
  else
    -[NAFConnection _willCancelRequest](self, "_willCancelRequest");
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSessionForClient:", self->_clientID);

}

- (void)_willCancelRequest
{
  int64_t *p_activeRequestType;
  NSObject *v5;
  NSUUID *activeRequestUUID;
  void *v7;
  AFAnalytics *analytics;
  NSUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUUID *activeTurnIdentifier;
  NSUUID *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NAFConnection *v22;
  __int16 v23;
  NSUUID *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  p_activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      v20 = "-[NAFConnection _willCancelRequest]";
      v21 = 2048;
      v22 = self;
      v23 = 2112;
      v24 = activeRequestUUID;
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v7);

    *p_activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    v9 = self->_activeRequestUUID;
    if (v9)
    {
      -[NSUUID UUIDString](v9, "UUIDString", CFSTR("id"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1912, v11);

    }
    else
    {
      -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1912, 0);
    }
    objc_msgSend(MEMORY[0x24BE090C0], "logSiriRequestCancelled");
    objc_msgSend(MEMORY[0x24BE091A0], "sharedObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeListener:", self);

    objc_msgSend(MEMORY[0x24BE090B0], "sharedObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeListener:", self);

    -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endRequestWithUUID:forClient:", self->_activeRequestUUID, self->_clientID);

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 1, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(int64_t *)((char *)&self->_activeRequestSpeechEvent + 7) = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    v16 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;

  }
}

- (void)_willFailRequestWithError:(id)a3
{
  void *v3;
  NSUUID *v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  NSObject *v16;
  NSUUID *v17;
  NSUUID *activeRequestUUID;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSUUID *v23;
  NSUUID *activeTurnIdentifier;
  AFAnalytics *v25;
  NSUUID *v26;
  NSUUID *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSUUID *v44;
  void *v45;
  NSUUID *v46;
  NSUUID *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  _QWORD v51[2];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  NSUUID *v55;
  __int16 v56;
  NSUUID *v57;
  __int16 v58;
  NSUUID *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = (NSUUID *)a3;
  if (self->_activeRequestType)
  {
    v7 = (os_log_t *)MEMORY[0x24BE08FB0];
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[NAFConnection _willFailRequestWithError:].cold.3((uint64_t)self, (uint64_t)v6, v8);
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v9);

    self->_activeRequestType = 0;
    self->_activeRequestUsefulUserResultType = 0;
    -[NSUUID domain](v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE09488]);

    if ((v11 & 1) == 0)
    {
      v12 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "-[NAFConnection _willFailRequestWithError:]";
        v54 = 2112;
        v55 = v6;
        _os_log_impl(&dword_246FF4000, v12, OS_LOG_TYPE_INFO, "%s Wrapping up non-siri error in generic error %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 0, 0, v6);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (NSUUID *)v13;
    }
    v14 = AFErrorSetUnderlyingError();
    v15 = 0;
    if (v14)
    {
      v16 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "-[NAFConnection _willFailRequestWithError:]";
        v54 = 2112;
        v55 = v6;
        _os_log_impl(&dword_246FF4000, v16, OS_LOG_TYPE_INFO, "%s Appending additional details to error %@", buf, 0x16u);
      }
      v17 = (NSUUID *)v15;

      v6 = v17;
    }
    activeRequestUUID = self->_activeRequestUUID;
    if (activeRequestUUID)
    {
      v49 = CFSTR("id");
      -[NSUUID UUIDString](activeRequestUUID, "UUIDString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDBD1B8];
    }
    v48 = v15;
    v51[0] = v19;
    AFAnalyticsContextCreateWithError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (activeRequestUUID)
    {

    }
    -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1913, v22);
    v23 = self->_activeRequestUUID;
    activeTurnIdentifier = self->_activeTurnIdentifier;
    v25 = self->_analytics;
    v26 = v23;
    v27 = activeTurnIdentifier;
    v6 = v6;
    if (v6)
    {
      v28 = *v7;
      v29 = *v7;
      if (v27)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v53 = "_EmitPNRFatalError";
          v54 = 2112;
          v55 = v26;
          v56 = 2112;
          v57 = v27;
          v58 = 2112;
          v59 = v6;
          _os_log_impl(&dword_246FF4000, v28, OS_LOG_TYPE_INFO, "%s Logging instrumentation for requestUUID = %@ turnId = %@ error = %@", buf, 0x2Au);
        }
        v30 = objc_alloc_init(MEMORY[0x24BE95B38]);
        _PNRFatalErrorInfo(v6);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setError:", v31);

        -[NSUUID userInfo](v6, "userInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *MEMORY[0x24BDD1398];
        objc_msgSend(v32, "objectForKey:", *MEMORY[0x24BDD1398]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          _PNRFatalErrorInfo(v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setUnderlyingError:", v35);

          objc_msgSend(v34, "userInfo");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKey:", v33);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            _PNRFatalErrorInfo(v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setUnderUnderlyingError:", v38);

          }
        }
        -[AFAnalytics logInstrumentation:machAbsoluteTime:turnIdentifier:](v25, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v30, mach_absolute_time(), v27);

      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        -[NAFConnection _willFailRequestWithError:].cold.2();
      }
    }
    else if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      -[NAFConnection _willFailRequestWithError:].cold.1();
    }

    objc_msgSend(MEMORY[0x24BE090C0], "logSiriRequestFailedWithError:", v6);
    if (WL_AFIsInternalInstall())
    {
      -[NAFConnection _clientService](self, "_clientService");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      AFSpeechEventGetDescription();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "reportIssueForError:type:subtype:context:", v6, 1913, v40, v22);

    }
    if (!_AFConnectionIsErrorDeallocation(v6))
    {
      objc_msgSend(MEMORY[0x24BE091A0], "sharedObserver");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removeListener:", self);

      objc_msgSend(MEMORY[0x24BE090B0], "sharedObserver");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "removeListener:", self);

      -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "endRequestWithUUID:forClient:", self->_activeRequestUUID, self->_clientID);

    }
    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 2, self->_activeRequestTypeForRequestCategorization);
    v44 = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestTypeForRequestCategorization = 0;
    if ((WL_AFIsHorseman() & 1) != 0
      || (WL_AFIsATV() & 1) != 0
      || (WL_AFIsPad() & 1) != 0
      || WL_AFIsMac())
    {
      -[NAFConnection _clientService](self, "_clientService");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "emitHomeMetricInvocationEvent");

    }
    *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
    self->_activeRequestIsTwoShot = 0;
    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    v46 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;

    v47 = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

  }
}

BOOL __43__NAFConnection__willFailRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  int v8;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE09018]);

  if (!v4)
  {
    objc_msgSend(v2, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE09488]);

    if (v8)
    {
      v6 = objc_msgSend(v2, "code") == 211;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v2, "code");
  if (v5 != 1 && v5 != 201 && v5 != 102)
    goto LABEL_8;
  v6 = 1;
LABEL_9:

  return v6;
}

id __43__NAFConnection__willFailRequestWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  double *v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  _AFConnectionGetBucketStringFromTimeIntervals(*(double *)(*(_QWORD *)(a1 + 32) + 152), *(double *)(*(_QWORD *)(a1 + 32) + 168));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double **)(a1 + 32);
  v4 = v3[18];
  if (v4 == 0.0)
    v4 = v3[19];
  v5 = v3[20];
  if (v5 == 0.0)
    v5 = v3[21];
  _AFConnectionGetBucketStringFromTimeIntervals(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v6))
    v7 = v2;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@,%@"), v2, v6);
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDD1540];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SpeechErrorHints[StartStopSpeechDelta:%@]"), v7);
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_willCompleteRequest
{
  int64_t *p_activeRequestType;
  NSObject *v5;
  NSUUID *activeRequestUUID;
  void *v7;
  AFAnalytics *analytics;
  NSUUID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUUID *activeTurnIdentifier;
  void *v17;
  NSUUID *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  NAFConnection *v24;
  __int16 v25;
  NSUUID *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      v22 = "-[NAFConnection _willCompleteRequest]";
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = activeRequestUUID;
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v7);

    *p_activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    v9 = self->_activeRequestUUID;
    if (v9)
    {
      -[NSUUID UUIDString](v9, "UUIDString", CFSTR("id"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1914, v11);

    }
    else
    {
      -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1914, 0);
    }
    objc_msgSend(MEMORY[0x24BE090C0], "logSiriRequestSucceeded");
    -[NAFConnection _clientService](self, "_clientService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordAWDSuccessMetrics");

    objc_msgSend(MEMORY[0x24BE091A0], "sharedObserver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeListener:", self);

    objc_msgSend(MEMORY[0x24BE090B0], "sharedObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeListener:", self);

    -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "endRequestWithUUID:forClient:", self->_activeRequestUUID, self->_clientID);

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 3, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestTypeForRequestCategorization = 0;
    if ((WL_AFIsHorseman() & 1) != 0
      || (WL_AFIsATV() & 1) != 0
      || (WL_AFIsPad() & 1) != 0
      || WL_AFIsMac())
    {
      -[NAFConnection _clientService](self, "_clientService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "emitHomeMetricInvocationEvent");

    }
    *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
    self->_activeRequestIsTwoShot = 0;
    self->_activeRequestActivationEvent = 0;
    self->_activeRequestSpeechEvent = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    v18 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;

  }
}

- (void)_willPresentUsefulUserResultWithType:(int64_t)a3
{
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  double v8;
  int v9;
  const char *v10;
  __int16 v11;
  NAFConnection *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v5);
  -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v5);
  if (self->_activeRequestType)
  {
    v6 = (os_log_t *)MEMORY[0x24BE08FB0];
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v9 = 136315650;
      v10 = "-[NAFConnection _willPresentUsefulUserResultWithType:]";
      v11 = 2048;
      v12 = self;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_246FF4000, v7, OS_LOG_TYPE_INFO, "%s %p %ld", (uint8_t *)&v9, 0x20u);
    }
    self->_activeRequestUsefulUserResultType = a3;
    if (WL_AFIsInternalInstall())
    {
      if (self->_activeRequestInitialInterstitialBeginTimeInterval > 0.0)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        if (v8 - self->_activeRequestInitialInterstitialBeginTimeInterval < 0.5)
        {
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
            -[NAFConnection _willPresentUsefulUserResultWithType:].cold.1();
          -[NAFConnection reportIssueForType:subtype:context:](self, "reportIssueForType:subtype:context:", CFSTR("Interstitial"), CFSTR("Near Fire before UUFR"), 0);
        }
      }
    }
  }
  else
  {
    self->_activeRequestUsefulUserResultType = 0;
  }

}

- (void)_enqueueInterstitialCommand:(id)a3
{
  id v4;
  AFQueue *interstitialCommandQueue;
  AFQueue *v6;
  AFQueue *v7;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[NAFConnection _enqueueInterstitialCommand:].cold.1();
  interstitialCommandQueue = self->_interstitialCommandQueue;
  if (!interstitialCommandQueue)
  {
    getAFQueueClass();
    v6 = (AFQueue *)objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
    v7 = self->_interstitialCommandQueue;
    self->_interstitialCommandQueue = v6;

    interstitialCommandQueue = self->_interstitialCommandQueue;
  }
  -[AFQueue enqueueObject:](interstitialCommandQueue, "enqueueObject:", v4);

}

- (void)_beginInterstitialsForReason:(id)a3
{
  id v4;
  uint64_t ForcedInterstitialStyle;
  NSObject *v6;
  id v7;
  AFInterstitialProvider *v8;
  AFInterstitialProvider *interstitialProvider;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_interstitialProvider
    && self->_activeRequestType
    && !self->_activeRequestUsefulUserResultType
    && AFInterstitialSupportsRequestWithEvent())
  {
    if (!WL_AFIsInternalInstall()
      || (ForcedInterstitialStyle = _AFPreferencesGetForcedInterstitialStyle()) == 0)
    {
      if ((WL_AFIsHorseman() & 1) != 0)
      {
        ForcedInterstitialStyle = 4;
      }
      else if ((AFRecordRouteIsHearst() & 1) != 0)
      {
        ForcedInterstitialStyle = 3;
      }
      else if ((-[AFClientConfiguration isDeviceInStarkMode](self->_clientConfiguration, "isDeviceInStarkMode") & 1) != 0)
      {
        ForcedInterstitialStyle = 6;
      }
      else if ((-[AFClientConfiguration isDeviceInCarDNDMode](self->_clientConfiguration, "isDeviceInCarDNDMode") & 1) != 0)
      {
        ForcedInterstitialStyle = 5;
      }
      else if ((AFPlaybackRouteIsHandsFree() & 1) != 0)
      {
        ForcedInterstitialStyle = 2;
      }
      else if (WL_AFIsNano())
      {
        ForcedInterstitialStyle = 8;
      }
      else
      {
        ForcedInterstitialStyle = 1;
      }
    }
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[NAFConnection _beginInterstitialsForReason:]";
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_246FF4000, v6, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", buf, 0x16u);
    }
    getAFInterstitialProviderClass();
    v7 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
    v8 = (AFInterstitialProvider *)objc_msgSend(v7, "initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:context:preferences:delegate:", ForcedInterstitialStyle, self->_recordRoute, AFSpeechEventIsVoiceTrigger(), self->_activeRequestIsDucking, self->_activeRequestIsTwoShot, self->_activeRequestSpeechEndHostTime, self->_activeRequestUUID, self->_preferences, self);
    interstitialProvider = self->_interstitialProvider;
    self->_interstitialProvider = v8;

  }
}

- (void)_handleInterstitialPhase:(int64_t)a3 fromProvider:(id)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  AFInterstitialProvider *v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  os_log_t *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  double v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v17 = (AFInterstitialProvider *)a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = (void (**)(_QWORD))a9;
  if (self->_interstitialProvider == v17 && (-[NSUUID isEqual:](self->_activeRequestUUID, "isEqual:", v20) & 1) != 0)
  {
    v22 = (os_log_t *)MEMORY[0x24BE08FB0];
    v23 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      AFInterstitialPhaseGetName();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v34 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
      v35 = 2112;
      v36 = v25;
      v37 = 2112;
      v38 = v18;
      v39 = 2112;
      v40 = v19;
      v41 = 2048;
      v42 = a7;
      v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_246FF4000, v24, OS_LOG_TYPE_INFO, "%s phase = %@, displayText = %@, speakableText = %@, expectedDelay = %f, context = %@", buf, 0x3Eu);

      v22 = (os_log_t *)MEMORY[0x24BE08FB0];
    }
    if ((unint64_t)(a3 - 1) >= 3)
    {
      if (a3 == 4)
      {
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NAFConnection _endInterstitialsForReason:](self, "_endInterstitialsForReason:", v29);
        -[NAFConnection _invokeRequestTimeoutForReason:](self, "_invokeRequestTimeoutForReason:", v29);

      }
    }
    else
    {
      -[AFQueue dequeueObject](self->_interstitialCommandQueue, "dequeueObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        if (objc_msgSend(v18, "length") || objc_msgSend(v19, "length"))
        {
          -[NSUUID UUIDString](self->_activeRequestUUID, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          AFInterstitialCreateCommand();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v30 = *v22;
          if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v34 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
            _os_log_impl(&dword_246FF4000, v30, OS_LOG_TYPE_INFO, "%s Unable to create an interstitial command because display text and speakable text are both empty.", buf, 0xCu);
          }
          v26 = 0;
        }
      }
      v28 = *v22;
      if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
        v35 = 2112;
        v36 = v26;
        _os_log_impl(&dword_246FF4000, v28, OS_LOG_TYPE_INFO, "%s interstitialCommand = %@", buf, 0x16u);
      }
      if (v26)
      {
        ++self->_activeRequestNumberOfPresentedInterstitials;
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke;
        v31[3] = &unk_251857C10;
        v32 = v21;
        -[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:](self, "_dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:", v26, 1, a3, v31, a7);

      }
      else if (v21)
      {
        v21[2](v21);
      }

    }
  }
  else if (v21)
  {
    v21[2](v21);
  }

}

void __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v5)
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v10 = 136315394;
      v11 = "-[NAFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:comple"
            "tion:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_246FF4000, v8, OS_LOG_TYPE_INFO, "%s interstitialReply = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v6 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke_cold_1();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

- (void)_endInterstitialsForReason:(id)a3
{
  id v4;
  NSObject *v5;
  AFInterstitialProvider *interstitialProvider;
  AFQueue *interstitialCommandQueue;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_interstitialProvider)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[NAFConnection _endInterstitialsForReason:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
    }
    getAFFeatureFlagsClass();
    -[NAFConnection stopAllAudioPlaybackRequests:](self, "stopAllAudioPlaybackRequests:", objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "isStateFeedbackEnabled") ^ 1);
    -[AFInterstitialProvider invalidate](self->_interstitialProvider, "invalidate");
    interstitialProvider = self->_interstitialProvider;
    self->_interstitialProvider = 0;

  }
  interstitialCommandQueue = self->_interstitialCommandQueue;
  self->_interstitialCommandQueue = 0;

}

+ (BOOL)assistantIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  if (WL_AFAssistantCapable())
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isLocaleIdentifierNativelySupported:", v5);

    if ((v7 & 1) != 0)
    {
      v8 = 0;
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    v9 = 401;
  }
  else
  {
    v9 = 400;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE09488], v9, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v8);
LABEL_9:

  return v8 == 0;
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 deviceProductVersion:(id)a4 error:(id *)a5
{
  return objc_msgSend(a1, "siriIsSupportedForLanguageCode:productName:productVersion:error:", a3, 0, a4, a5);
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 productName:(id)a4 productVersion:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9 || !v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE09488], 402, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a6)
      goto LABEL_7;
LABEL_6:
    *a6 = objc_retainAutorelease(v14);
    goto LABEL_7;
  }
  AFPreferencesSupportedLanguagesForRemote();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v9) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE09488], 401, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a6)
    goto LABEL_6;
LABEL_7:

  return v14 == 0;
}

+ (void)beginMonitoringAvailability
{
  NAFConnectionAvailabilityObserver *v2;
  void *v3;
  id v4;

  if (!sAvailabilityObserver)
  {
    v2 = objc_alloc_init(NAFConnectionAvailabilityObserver);
    v3 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = (uint64_t)v2;

    +[NAFNetworkAvailability sharedAvailability](NAFNetworkAvailability, "sharedAvailability");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", sAvailabilityObserver);

  }
}

+ (BOOL)isNetworkAvailable
{
  void *v2;
  char v3;

  if (!sAvailabilityObserver)
    objc_msgSend(a1, "beginMonitoringAvailability");
  +[NAFNetworkAvailability sharedAvailability](NAFNetworkAvailability, "sharedAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAvailable");

  return v3;
}

+ (BOOL)isAvailable
{
  NSObject *v2;
  int v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_opt_class(), "isNetworkAvailable"))
  {
    v2 = *MEMORY[0x24BE08FB0];
    LOBYTE(v3) = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "+[NAFConnection isAvailable]";
      _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s Network is available. Evaluating NAFConnection as available.", (uint8_t *)&v10, 0xCu);
    }
    return v3;
  }
  if (WL_AFDeviceSupportsSiriUOD())
  {
    objc_msgSend((id)objc_opt_class(), "currentLanguageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getAFFeatureFlagsClass();
    v3 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "isSiriUODAvailableForLanguage:", v4);
    v5 = *MEMORY[0x24BE08FB0];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        v10 = 136315394;
        v11 = "+[NAFConnection isAvailable]";
        v12 = 2112;
        v13 = v4;
        v7 = "%s Network is not available but device supports Understanding On Device for %@. Evaluating NAFConnection as available.";
LABEL_13:
        _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, 0x16u);
      }
    }
    else if (v6)
    {
      v10 = 136315394;
      v11 = "+[NAFConnection isAvailable]";
      v12 = 2112;
      v13 = v4;
      v7 = "%s Network is not available and language %@ is not supported for Understanding On Device. Evaluating NAFConne"
           "ction as NOT available.";
      goto LABEL_13;
    }

    return v3;
  }
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "+[NAFConnection isAvailable]";
    _os_log_impl(&dword_246FF4000, v8, OS_LOG_TYPE_INFO, "%s Network is not available and device does not support Understanding On Device. Evaluating NAFConnection as NOT available.", (uint8_t *)&v10, 0xCu);
  }
  LOBYTE(v3) = 0;
  return v3;
}

+ (void)stopMonitoringAvailability
{
  void *v2;
  void *v3;

  if (sAvailabilityObserver)
  {
    +[NAFNetworkAvailability sharedAvailability](NAFNetworkAvailability, "sharedAvailability");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:", sAvailabilityObserver);

    v3 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = 0;

  }
}

+ (id)currentLanguageCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)outputVoice
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)endSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  NAFConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[NAFConnection endSession]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v7, 0x16u);
  }
  -[NAFConnection _willEndSession](self, "_willEndSession");
  objc_msgSend(MEMORY[0x24BE09238], "currentCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "endTask");
  -[NAFConnection _clientService](self, "_clientService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endSession");

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  NAFConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[NAFConnection invalidate]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  -[NAFConnection _clearConnection](self, "_clearConnection");
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateClient:", self->_clientID);

}

+ (void)defrost
{
  NSObject *v2;
  _xpc_connection_s *mach_service;
  xpc_object_t v4;
  uint64_t v5;
  _xpc_connection_s *v6;
  _QWORD barrier[4];
  _xpc_connection_s *v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "+[NAFConnection defrost]";
    _os_log_impl(&dword_246FF4000, v2, OS_LOG_TYPE_INFO, "%s Begin sending defrost XPC message.", buf, 0xCu);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.assistant.sync", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_240);
  xpc_connection_resume(mach_service);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "name", "defrost");
  v5 = mach_absolute_time();
  xpc_dictionary_set_uint64(v4, "mach_time", v5);
  xpc_connection_send_message(mach_service, v4);
  barrier[0] = MEMORY[0x24BDAC760];
  barrier[1] = 3221225472;
  barrier[2] = __24__NAFConnection_defrost__block_invoke_2;
  barrier[3] = &unk_251857888;
  v8 = mach_service;
  v6 = mach_service;
  xpc_connection_send_barrier(v6, barrier);

}

void __24__NAFConnection_defrost__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  v1 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "+[NAFConnection defrost]_block_invoke_2";
    _os_log_impl(&dword_246FF4000, v1, OS_LOG_TYPE_INFO, "%s End sending defrost XPC message.", (uint8_t *)&v2, 0xCu);
  }
}

- (void)preheatWithStyle:(int64_t)a3
{
  -[NAFConnection preheatWithStyle:forOptions:](self, "preheatWithStyle:forOptions:", a3, 0);
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  NAFConnection *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "-[NAFConnection preheatWithStyle:forOptions:]";
    v13 = 2048;
    v14 = self;
    v15 = 2048;
    v16 = a3;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_246FF4000, v7, OS_LOG_TYPE_INFO, "%s %p %ld %@", (uint8_t *)&v11, 0x2Au);
  }
  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1915, 0);
  -[NAFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preheatWithStyle:forOptions:", a3, v6);

  v9 = (id)objc_msgSend(MEMORY[0x24BE090B0], "sharedObserver");
  v10 = (id)objc_msgSend(MEMORY[0x24BE091A0], "sharedObserver");

}

- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  NAFConnection *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[NAFConnection boostedPreheatWithStyle:completion:]";
    v16 = 2048;
    v17 = self;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_246FF4000, v7, OS_LOG_TYPE_INFO, "%s %p %ld", buf, 0x20u);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__NAFConnection_boostedPreheatWithStyle_completion___block_invoke;
  v12[3] = &unk_251857C78;
  v13 = v6;
  v8 = v6;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v8;
  else
    v11 = &__block_literal_global_245;
  objc_msgSend(v9, "boostedPreheatWithStyle:completion:", a3, v11);

}

uint64_t __52__NAFConnection_boostedPreheatWithStyle_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)forceAudioSessionActive
{
  -[NAFConnection forceAudioSessionActiveWithOptions:completion:](self, "forceAudioSessionActiveWithOptions:completion:", 0, 0);
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[NAFConnection forceAudioSessionActiveWithOptions:reason:completion:](self, "forceAudioSessionActiveWithOptions:reason:completion:", a3, 0, a4);
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  -[NAFConnection forceAudioSessionActiveWithOptions:reason:speechRequestOptions:completion:](self, "forceAudioSessionActiveWithOptions:reason:speechRequestOptions:completion:", a3, a4, 0, a5);
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  unint64_t v21;
  int64_t v22;

  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BE092A8];
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke;
  v19[3] = &unk_251857CC0;
  v21 = a3;
  v22 = a4;
  v20 = v10;
  v14 = v10;
  v15 = (void *)objc_msgSend(v12, "newWithBuilder:", v19);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2;
  v17[3] = &unk_251857CE8;
  v18 = v11;
  v16 = v11;
  -[NAFConnection forceAudioSessionActiveWithContext:completion:](self, "forceAudioSessionActiveWithContext:completion:", v15, v17);

}

void __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[5];
  v4 = a2;
  objc_msgSend(v4, "setOptions:", v3);
  objc_msgSend(v4, "setReason:", a1[6]);
  objc_msgSend(v4, "setSpeechRequestOptions:", a1[4]);

}

void __91__NAFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "audioSessionID");
    objc_msgSend(v3, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NAFConnection *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[NAFConnection forceAudioSessionActiveWithContext:completion:]";
    v26 = 2048;
    v27 = self;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_246FF4000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  getAFOneArgumentSafetyBlockClass();
  v9 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke;
  v22[3] = &unk_251857D10;
  v22[4] = self;
  v23 = v7;
  v11 = (void *)MEMORY[0x24BE092B0];
  v12 = v7;
  v13 = (void *)objc_msgSend(v11, "newWithBuilder:", &__block_literal_global_252);
  v14 = (void *)objc_msgSend(v9, "initWithBlock:defaultValue:", v22, v13);

  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2;
  v20[3] = &unk_251857DA0;
  v15 = v14;
  v21 = v15;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_258;
  v18[3] = &unk_251857DC8;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "forceAudioSessionActiveWithContext:completion:", v6, v18);

}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 136315650;
    v8 = "-[NAFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke";
    v9 = 2048;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_250(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setAudioSessionID:", 0);
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:", 40, CFSTR("Safety completion of -forceAudioSessionActive is deallocated without invocation."));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setError:", v3);

}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[NAFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke_2";
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BE092B0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_255;
  v9[3] = &unk_251857D78;
  v10 = v3;
  v7 = v3;
  v8 = (void *)objc_msgSend(v6, "newWithBuilder:", v9);
  objc_msgSend(v5, "invokeWithValue:", v8);

}

void __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_255(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setAudioSessionID:", 0);
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 7, CFSTR("XPC connection encountered an error during -forceAudioSessionActive."), *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setError:", v4);

}

uint64_t __63__NAFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_258(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

- (void)acquireAudioSessionWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NAFConnection *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[NAFConnection acquireAudioSessionWithContext:completion:]";
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_246FF4000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke;
  v13[3] = &unk_251857E18;
  v13[4] = self;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  v10 = v9;
  v11 = v6;
  v12 = v7;
  -[NAFConnection forceAudioSessionActiveWithContext:completion:](self, "forceAudioSessionActiveWithContext:completion:", v11, v13);

}

void __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  unint64_t *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, id, _QWORD *);
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v25 = "-[NAFConnection acquireAudioSessionWithContext:completion:]_block_invoke";
    v26 = 2048;
    v27 = v5;
    v28 = 2114;
    v29 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "reason");
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    v9 = v6 == 3;
    if (v9 && !v7)
    {
      v10 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 344);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      if (!v11)
        objc_msgSend(*(id *)(a1 + 48), "beginSpeakingForClient:", *(_QWORD *)(a1 + 32));
    }
    getAFSafetyBlockClass();
    v12 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
    v13 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_259;
    v20[3] = &unk_251857DF0;
    v22 = v9;
    v23 = v8;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = *(id *)(a1 + 48);
    v14 = (void *)objc_msgSend(v12, "initWithBlock:", v20);
    v15 = *(_QWORD *)(a1 + 56);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_2;
    v18[3] = &unk_251857888;
    v19 = v14;
    v16 = *(void (**)(uint64_t, id, _QWORD *))(v15 + 16);
    v17 = v14;
    v16(v15, v3, v18);

  }
}

uint64_t __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_259(uint64_t result)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;

  if (*(_BYTE *)(result + 48) && !*(_BYTE *)(result + 49))
  {
    v1 = (unint64_t *)(*(_QWORD *)(result + 32) + 344);
    do
    {
      v2 = __ldaxr(v1);
      v3 = v2 - 1;
    }
    while (__stlxr(v3, v1));
    if (!v3)
      return objc_msgSend(*(id *)(result + 40), "endSpeakingForClient:", *(_QWORD *)(result + 32));
  }
  return result;
}

uint64_t __59__NAFConnection_acquireAudioSessionWithContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", 0);
}

- (void)forceAudioSessionInactive
{
  -[NAFConnection forceAudioSessionInactiveWithOptions:completion:](self, "forceAudioSessionInactiveWithOptions:completion:", 1, 0);
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NAFConnection *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[NAFConnection forceAudioSessionInactiveWithOptions:completion:]";
    v21 = 2048;
    v22 = self;
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_246FF4000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %lu", buf, 0x20u);
  }
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke;
  v17[3] = &unk_251857E40;
  v18 = v6;
  v9 = v6;
  v12 = v8;
  v13 = 3221225472;
  v14 = __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2;
  v15 = &unk_251857C78;
  v16 = (id)MEMORY[0x2495703E0](v17);
  v10 = v16;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forceAudioSessionInactiveWithOptions:completion:", a3, v10, v12, v13, v14, v15);

}

uint64_t __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__NAFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[NAFConnection forceAudioSessionInactiveWithOptions:completion:]_block_invoke_2";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2;

  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", &__block_literal_global_261);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeInterruptedAudioPlaybackIfNeeded");

}

void __55__NAFConnection_resumeInterruptedAudioPlaybackIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[NAFConnection resumeInterruptedAudioPlaybackIfNeeded]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)willPresentUI
{
  void *v3;
  id v4;

  -[NAFConnection _clientService](self, "_clientService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willPresentUIWithReply:", &__block_literal_global_262);

  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginSessionForClient:", self->_clientID);

}

void __30__NAFConnection_willPresentUI__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v1 = 136315138;
    v2 = "-[NAFConnection willPresentUI]_block_invoke";
    _os_log_impl(&dword_246FF4000, v0, OS_LOG_TYPE_INFO, "%s Received reply.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)didDismissUI
{
  void *v3;
  id v4;

  -[NAFConnection _clientService](self, "_clientService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissUI");

  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSessionForClient:", self->_clientID);

}

- (void)setLockState:(BOOL)a3 screenLocked:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLockState:showingLockScreen:", v5, v4);

}

- (void)setIsDeviceInStarkMode:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__NAFConnection_setIsDeviceInStarkMode___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

uint64_t __40__NAFConnection_setIsDeviceInStarkMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsDeviceInStarkMode:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__NAFConnection_setSupportsCarPlayVehicleData___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

uint64_t __47__NAFConnection_setSupportsCarPlayVehicleData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportsCarPlayVehicleData:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setCarDNDActive:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__NAFConnection_setCarDNDActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

uint64_t __33__NAFConnection_setCarDNDActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsDeviceInCarDNDMode:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setModesConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  getAFFeatureFlagsClass();
  if (objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "isResponseFrameworkEnabled"))
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[NAFConnection setModesConfiguration:]";
      _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s #modes set modesConfiguration", (uint8_t *)&v7, 0xCu);
    }
    -[NAFConnection _clientService](self, "_clientService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setModesConfiguration:", v4);

  }
}

- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__NAFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

uint64_t __75__NAFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAreAnnouncementRequestsPermittedByPresentationWhileActive:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setWatchAuthenticated:(BOOL)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[4];
  BOOL v9;

  -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__NAFConnection_setWatchAuthenticated___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  v9 = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

uint64_t __39__NAFConnection_setWatchAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsDeviceWatchAuthenticated:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setAccessibilityState:(id)a3
{
  id v4;
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__NAFConnection_setAccessibilityState___block_invoke;
  v9[3] = &unk_251857EE8;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v9);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");

}

uint64_t __39__NAFConnection_setAccessibilityState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAccessibilityState:", *(_QWORD *)(a1 + 32));
}

- (void)setDeviceRingerSwitchState:(int64_t)a3
{
  void *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *clientConfiguration;
  _QWORD v8[5];

  -[NAFConnection _clientConfiguration](self, "_clientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__NAFConnection_setDeviceRingerSwitchState___block_invoke;
  v8[3] = &__block_descriptor_40_e41_v16__0___AFClientConfigurationMutating__8l;
  v8[4] = a3;
  objc_msgSend(v5, "mutatedCopyWithMutator:", v8);
  v6 = (AFClientConfiguration *)objc_claimAutoreleasedReturnValue();
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((_BYTE *)self + 272) &= ~1u;
  if ((*((_BYTE *)self + 216) & 8) != 0)
    -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

uint64_t __44__NAFConnection_setDeviceRingerSwitchState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceRingerSwitchState:", *(_QWORD *)(a1 + 32));
}

- (void)setShouldWaitForMyriad:(BOOL)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[NAFConnection setShouldWaitForMyriad:]";
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setMyriadDecisionResult:(BOOL)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[NAFConnection setMyriadDecisionResult:]";
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setVoiceOverIsActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 272) = *((_BYTE *)self + 272) & 0xFD | v3;
}

- (void)setConfiguration:(id)a3
{
  AFClientConfiguration *v4;
  AFClientConfiguration *clientConfiguration;

  v4 = (AFClientConfiguration *)objc_msgSend(a3, "copy");
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v4;

  *((_BYTE *)self + 272) &= ~1u;
  -[NAFConnection _updateClientConfiguration](self, "_updateClientConfiguration");
}

- (void)startRequestWithText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  getAFRequestInfoClass();
  v5 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setActivationEvent:", 5);
  objc_msgSend(v5, "setText:", v4);

  -[NAFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v5);
}

- (void)startDirectActionRequestWithString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  getAFRequestInfoClass();
  v5 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setActivationEvent:", 2);
  objc_msgSend(v5, "setLegacyDirectActionIdentifier:", v4);

  -[NAFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v5);
}

- (void)startContinuationRequestWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  getAFRequestInfoClass();
  v6 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "objectForKey:", CFSTR("Data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHandoffRequestData:", v5);
  -[NAFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v6);

}

- (void)startRequestWithAceCommand:(id)a3
{
  -[NAFConnection _startRequestWithAceCommand:turnIdentifier:suppressAlert:](self, "_startRequestWithAceCommand:turnIdentifier:suppressAlert:", a3, 0, 0);
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5
{
  -[NAFConnection startRequestWithCorrectedText:forSpeechIdentifier:userSelectionResults:turnIdentifier:](self, "startRequestWithCorrectedText:forSpeechIdentifier:userSelectionResults:turnIdentifier:", a3, a4, a5, 0);
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  getAFRequestInfoClass();
  v14 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setActivationEvent:", 4);
  objc_msgSend(v14, "setCorrectedSpeech:", v13);

  objc_msgSend(v14, "setCorrectedSpeechContext:", v12);
  objc_msgSend(v14, "setTurnIdentifier:", v11);

  v24 = v10;
  objc_msgSend(v24, "combinedRank");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCombinedRank:", v15);

  objc_msgSend(v24, "combinedScore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCombinedScore:", v16);

  objc_msgSend(v24, "interactionId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInteractionId:", v17);

  objc_msgSend(v24, "onDeviceUtterancesPresent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOnDeviceUtterancesPresent:", v18);

  objc_msgSend(v24, "originalRank");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOriginalRank:", v19);

  objc_msgSend(v24, "originalScore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOriginalScore:", v20);

  objc_msgSend(v24, "previousUtterance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreviousUtterance:", v21);

  objc_msgSend(v24, "sessionId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSessionId:", v22);

  objc_msgSend(v24, "utteranceSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setUtteranceSource:", v23);
  -[NAFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v14);

}

- (void)startRequestWithInfo:(id)a3 activationEvent:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    AFActivationEventGetDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[NAFConnection startRequestWithInfo:activationEvent:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_246FF4000, v8, OS_LOG_TYPE_INFO, "%s Overriding activation event in info %@ %@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(v6, "setActivationEvent:", a4);
  -[NAFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v6);

}

- (void)_startRequestWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSUUID *v10;
  NSUUID *v11;
  void *v12;
  NSUUID *v13;
  _QWORD v14[5];
  NSUUID *v15;
  _QWORD v16[5];
  NSUUID *v17;
  _QWORD v18[4];
  id v19;
  NAFConnection *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  NAFConnection *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[NAFConnection _startRequestWithInfo:]";
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  if (objc_msgSend(v4, "activationEvent") == 2)
  {
    objc_msgSend(v4, "speechRequestOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activationEvent");

    if (v7 == 9)
      kdebug_trace();
  }
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __39__NAFConnection__startRequestWithInfo___block_invoke;
  v18[3] = &unk_251857F30;
  v19 = v4;
  v20 = self;
  v9 = v4;
  -[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 0, 0, v9, v18);
  v10 = self->_activeRequestUUID;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_2;
  v16[3] = &unk_251857F80;
  v16[4] = self;
  v11 = v10;
  v17 = v11;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_2_270;
  v14[3] = &unk_251857F80;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "startRequestWithInfo:completion:", v9, v14);

}

uint64_t __39__NAFConnection__startRequestWithInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activationEvent");
  AFAnalyticsContextCreateWithRequestInfo();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v20[0] = CFSTR("unixTime");
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  v20[1] = CFSTR("id");
  objc_msgSend(v18, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  v20[2] = CFSTR("systemVersion");
  WL_AFProductAndBuildVersion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (WL_AFIsInternalInstall())
  {
    v19[0] = v12;
    AFAnalyticsTurnContextCreateWithRequestInfo();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge();
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  AFAnalyticsEventCreateCurrent();
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activationEvent");

  return v16;
}

void __39__NAFConnection__startRequestWithInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[NAFConnection _startRequestWithInfo:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_269;
  block[3] = &unk_251857F58;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __39__NAFConnection__startRequestWithInfo___block_invoke_269(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

void __39__NAFConnection__startRequestWithInfo___block_invoke_2_270(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  _QWORD block[5];
  id v11;
  __CFString *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = &stru_251858760;
    if (v3)
      v5 = v3;
    *(_DWORD *)buf = 136315394;
    v14 = "-[NAFConnection _startRequestWithInfo:]_block_invoke_2";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s Complete %@", buf, 0x16u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NAFConnection__startRequestWithInfo___block_invoke_273;
  block[3] = &unk_251857F58;
  block[4] = v6;
  v11 = v7;
  v12 = v3;
  v9 = v3;
  dispatch_async(v8, block);

}

uint64_t __39__NAFConnection__startRequestWithInfo___block_invoke_273(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

- (id)_startRequestMetricSettings
{
  id v3;
  AFPreferences *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = self->_preferences;
  -[AFPreferences languageCode](v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("siriInputLanguage"));
  if ((WL_AFIsHorseman() & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", WL_AFPreferencesTypeToSiriEnabled());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("typeToSiri"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AFPreferences alwaysShowRecognizedSpeech](v4, "alwaysShowRecognizedSpeech"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("showRecognizedSpeech"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AFPreferences siriResponseShouldAlwaysPrint](v4, "siriResponseShouldAlwaysPrint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("captionVoiceFeedback"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[AFPreferences alwaysObscureBackgroundContentWhenActive](v4, "alwaysObscureBackgroundContentWhenActive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("hideBackgroundContent"));

    -[NAFConnection _metricContextValueForUseDeviceSpeakerForTTS:](self, "_metricContextValueForUseDeviceSpeakerForTTS:", -[AFPreferences useDeviceSpeakerForTTS](v4, "useDeviceSpeakerForTTS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("useSpeakerForTTS"));
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("requestSettings"));

  }
  return v3;
}

- (id)_metricContextValueForUseDeviceSpeakerForTTS:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_251858310[a3 - 1];
}

- (void)_startRequestWithAceCommand:(id)a3 turnIdentifier:(id)a4 suppressAlert:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  getAFRequestInfoClass();
  v9 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setActivationEvent:", 0);
  objc_msgSend(v9, "setTurnIdentifier:", v8);

  if (v5)
    objc_msgSend(v9, "setOptions:", 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "setStartLocalRequest:", v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setStartRequest:", v10);
  }
  -[NAFConnection _startRequestWithInfo:](self, "_startRequestWithInfo:", v9);

}

- (void)startSpeechRequestWithOptions:(id)a3
{
  void (**v3)(void);

  -[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:](self, "startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;

  v6 = (void (**)(id, id))a4;
  -[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:](self, "startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (id)startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t pendingSpeechRequestCounter;
  NSUUID *v10;
  NSUUID *v11;
  void *v12;
  NSUUID *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  OS_dispatch_group *speechCallbackGroup;
  OS_dispatch_group *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  NAFConnection *v27;
  id v28;
  unint64_t v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD v32[5];
  NSUUID *v33;
  _QWORD v34[5];
  NSUUID *v35;
  _QWORD v36[4];
  id v37;
  NAFConnection *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  NAFConnection *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]";
    v41 = 2048;
    v42 = self;
    v43 = 2112;
    v44 = v4;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BE090C0], "logSiriInvokedVia:", objc_msgSend(v4, "activationEvent"));
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");

  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  v7 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke;
  v36[3] = &unk_251857F30;
  v8 = v4;
  v37 = v8;
  v38 = self;
  -[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, v8, 0, v36);
  pendingSpeechRequestCounter = self->_pendingSpeechRequestCounter;
  self->_pendingSpeechRequestCounter = pendingSpeechRequestCounter + 1;
  v10 = self->_activeRequestUUID;
  kdebug_trace();
  v34[0] = v7;
  v34[1] = 3221225472;
  v34[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2;
  v34[3] = &unk_251857F80;
  v34[4] = self;
  v11 = v10;
  v35 = v11;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_284;
  v32[3] = &unk_251857F80;
  v32[4] = self;
  v13 = v11;
  v33 = v13;
  objc_msgSend(v12, "startRecordingForPendingSpeechRequestWithOptions:requestId:sessionUUID:completion:", v8, pendingSpeechRequestCounter, v13, v32);

  if (objc_msgSend(v8, "pendCallbacksUntilAfterContinuation"))
  {
    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v15 = objc_alloc(MEMORY[0x24BE09290]);
    v30[0] = v7;
    v30[1] = 3221225472;
    v30[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4;
    v30[3] = &unk_251857FA8;
    v16 = v14;
    v31 = v16;
    v17 = (void *)objc_msgSend(v15, "initWithBlock:", v30);
    speechCallbackGroup = self->_speechCallbackGroup;
    self->_speechCallbackGroup = (OS_dispatch_group *)v16;
    v19 = v16;

  }
  else
  {
    v17 = 0;
    v19 = self->_speechCallbackGroup;
    self->_speechCallbackGroup = 0;
  }

  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endTransaction");

  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5;
  v25[3] = &unk_251857FD0;
  v26 = v8;
  v27 = self;
  v28 = v17;
  v29 = pendingSpeechRequestCounter;
  v21 = v17;
  v22 = v8;
  v23 = (void *)MEMORY[0x2495703E0](v25);

  return v23;
}

uint64_t __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AFAnalyticsContextCreateWithSpeechRequestOptions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v19[0] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("id");
  v20[0] = v7;
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (WL_AFIsInternalInstall())
  {
    v18[0] = v12;
    AFAnalyticsTurnContextCreateWithSpeechRequestOptions();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge();
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  AFAnalyticsEventCreateCurrent();
  v16 = objc_claimAutoreleasedReturnValue();

  return v16;
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_283;
  block[3] = &unk_251857F58;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_283(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_284(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3;
  block[3] = &unk_251857F58;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v12 = "-[NAFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_5";
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s Continuing pending speech request %p", buf, 0x16u);
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_286;
  v9[3] = &unk_251857DA0;
  v7 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v7, "_clientServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "continuePendingSpeechRequestWithId:fromTimestamp:", *(_QWORD *)(a1 + 56), v4);

  objc_msgSend(*(id *)(a1 + 48), "invoke");
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_286(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_286_cold_1();

}

- (void)startSpeechPronunciationRequestWithOptions:(id)a3 pronunciationContext:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSUUID *v13;
  NSUUID *v14;
  void *v15;
  NSUUID *v16;
  _QWORD v17[5];
  NSUUID *v18;
  _QWORD v19[5];
  NSUUID *v20;
  _QWORD v21[4];
  id v22;
  NAFConnection *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[NAFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]";
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_246FF4000, v9, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  objc_msgSend(v7, "serverCommandId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFConnection _extendRequestTimeoutForReason:durationInSeconds:](self, "_extendRequestTimeoutForReason:durationInSeconds:", v12, 0.0);
  }
  else
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke;
    v21[3] = &unk_251857F30;
    v22 = v7;
    v23 = self;
    -[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, v22, 0, v21);
    v12 = v22;
  }

  v13 = self->_activeRequestUUID;
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2;
  v19[3] = &unk_251857F80;
  v19[4] = self;
  v14 = v13;
  v20 = v14;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_288;
  v17[3] = &unk_251857F80;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "startSpeechPronunciationRequestWithOptions:context:completion:", v7, v8, v17);

}

uint64_t __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AFAnalyticsContextCreateWithSpeechRequestOptions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v19[0] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("id");
  v20[0] = v7;
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (WL_AFIsInternalInstall())
  {
    v18[0] = v12;
    AFAnalyticsTurnContextCreateWithSpeechRequestOptions();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge();
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  AFAnalyticsEventCreateCurrent();
  v16 = objc_claimAutoreleasedReturnValue();

  return v16;
}

void __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[NAFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_287;
  block[3] = &unk_251857F58;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_287(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

void __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_288(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3;
  block[3] = &unk_251857F58;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __81__NAFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

- (void)startAcousticIDRequestWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSUUID *v7;
  NSUUID *v8;
  void *v9;
  NSUUID *v10;
  _QWORD v11[5];
  NSUUID *v12;
  _QWORD v13[5];
  NSUUID *v14;
  _QWORD v15[4];
  id v16;
  NAFConnection *v17;

  v4 = a3;
  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke;
  v15[3] = &unk_251857F30;
  v16 = v4;
  v17 = self;
  v6 = v4;
  -[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, v6, 0, v15);
  v7 = self->_activeRequestUUID;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2;
  v13[3] = &unk_251857F80;
  v13[4] = self;
  v8 = v7;
  v14 = v8;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2_290;
  v11[3] = &unk_251857F80;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "startAcousticIDRequestWithOptions:context:completion:", v6, 0, v11);

}

uint64_t __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AFAnalyticsContextCreateWithSpeechRequestOptions();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v19[0] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("id");
  v20[0] = v7;
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(*(id *)(a1 + 40), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (WL_AFIsInternalInstall())
  {
    v18[0] = v12;
    AFAnalyticsTurnContextCreateWithSpeechRequestOptions();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsContextsMerge();
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  AFAnalyticsEventCreateCurrent();
  v16 = objc_claimAutoreleasedReturnValue();

  return v16;
}

void __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[NAFConnection startAcousticIDRequestWithOptions:]_block_invoke_2";
    v15 = 2114;
    v16 = v3;
    _os_log_impl(&dword_246FF4000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 7, 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_289;
  block[3] = &unk_251857F58;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_289(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 4, *(_QWORD *)(a1 + 48));
}

void __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_2_290(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_3;
  block[3] = &unk_251857F58;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __51__NAFConnection_startAcousticIDRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequestWithUUID:forReason:error:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

- (void)cancelSpeech
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NAFConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[NAFConnection cancelSpeech]";
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  -[NAFConnection cancelRequest](self, "cancelRequest");
}

- (void)cancelRequest
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NAFConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[NAFConnection cancelRequest]";
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_246FF4000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  -[NAFConnection cancelRequestForReason:](self, "cancelRequestForReason:", 13);
}

- (void)cancelRequestForReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[NAFConnection cancelRequestForReason:]";
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s reason = %ld", (uint8_t *)&v9, 0x16u);
  }
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransaction");

  -[NAFConnection _willCancelRequest](self, "_willCancelRequest");
  -[NAFConnection _requestDidEnd](self, "_requestDidEnd");
  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  -[NAFConnection _clientService](self, "_clientService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelRequestForReason:withError:", a3, 0);

  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endTransaction");

}

- (void)failRequestWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[NAFConnection failRequestWithError:].cold.1();
  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginTransaction");

  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE09488];
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE09488]))
    goto LABEL_8;
  v8 = objc_msgSend(v4, "code");

  if (v8 == 1)
  {
    if (self->_lastRetryError)
    {
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD1398]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 1, v7, self->_lastRetryError);
        v6 = v4;
        v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

      }
    }
  }
  -[NAFConnection _willFailRequestWithError:](self, "_willFailRequestWithError:", v4);
  -[NAFConnection _requestDidEnd](self, "_requestDidEnd");
  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  -[NAFConnection _clientService](self, "_clientService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelRequestForReason:withError:", 3, v4);

  -[NAFConnection _siriClientStateManager](self, "_siriClientStateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endTransaction");

}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  if (WL_AFIsInternalInstall())
  {
    -[NAFConnection _clientService](self, "_clientService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportIssueForError:type:context:", v10, a4, v8);

  }
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a5;
  v11 = a6;
  if (WL_AFIsInternalInstall())
  {
    -[NAFConnection _clientService](self, "_clientService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportIssueForError:type:subtype:context:", v13, a4, v10, v11);

  }
}

- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (WL_AFIsInternalInstall())
  {
    -[NAFConnection _clientService](self, "_clientService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportIssueForType:subtype:context:", v11, v8, v9);

  }
}

- (void)stopSpeech
{
  -[NAFConnection stopSpeechWithOptions:](self, "stopSpeechWithOptions:", 0);
}

- (void)stopSpeechWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  AFAnalytics *analytics;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  int v13;
  const char *v14;
  __int16 v15;
  NAFConnection *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[NAFConnection stopSpeechWithOptions:]";
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v13, 0x20u);
  }
  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  analytics = self->_analytics;
  AFAnalyticsContextCreateWithSpeechRequestOptions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:contextNoCopy:](analytics, "logEventWithType:context:contextNoCopy:", 1910, v7, 0);

  -[NAFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopSpeechWithOptions:", v4);

  if (self->_activeRequestType == 1 && self->_activeRequestStopSpeechTimeAPICalled == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    self->_activeRequestStopSpeechTimeAPICalled = v10;

    if (v4)
    {
      if (objc_msgSend(v4, "stopRecordingHostTime"))
      {
        objc_msgSend(v4, "stopRecordingHostTime");
      }
      else
      {
        objc_msgSend(v4, "activationEventTime");
        if (v12 > 0.0)
        {
          objc_msgSend(v4, "activationEventTime");
          goto LABEL_11;
        }
        if (!objc_msgSend(v4, "activationEventMachAbsoluteTime"))
          goto LABEL_12;
        objc_msgSend(v4, "activationEventMachAbsoluteTime");
      }
      AFMachAbsoluteTimeGetTimeInterval();
LABEL_11:
      self->_activeRequestStopSpeechTimeRequested = v11;
    }
  }
LABEL_12:

}

- (void)updateSpeechOptions:(id)a3
{
  id v4;
  NSObject *v5;
  AFAnalytics *analytics;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NAFConnection *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[NAFConnection updateSpeechOptions:]";
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_246FF4000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v9, 0x20u);
  }
  analytics = self->_analytics;
  AFAnalyticsContextCreateWithSpeechRequestOptions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:contextNoCopy:](analytics, "logEventWithType:context:contextNoCopy:", 1909, v7, 0);

  -[NAFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSpeechOptions:", v4);

}

- (void)rollbackClearContext
{
  id v2;

  -[NAFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackClearContext");

}

- (void)rollbackRequest
{
  void *v3;
  id v4;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v3);

  -[NAFConnection _clientService](self, "_clientService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rollbackRequest");

}

- (BOOL)isRecording
{
  return (*((unsigned __int8 *)self + 216) >> 2) & 1;
}

- (BOOL)hasActiveRequest
{
  return self->_activeRequestType != 0;
}

- (BOOL)shouldSpeak
{
  return (*((unsigned __int8 *)self + 216) >> 1) & 1;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (float)averagePower
{
  float result;

  -[AFAudioPowerUpdater _unsafeAveragePower](self->_inputAudioPowerUpdater, "_unsafeAveragePower");
  return result;
}

- (float)peakPower
{
  float result;

  -[AFAudioPowerUpdater _unsafePeakPower](self->_inputAudioPowerUpdater, "_unsafePeakPower");
  return result;
}

- (void)sendGenericAceCommand:(id)a3
{
  -[NAFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:](self, "sendGenericAceCommand:turnIdentifier:conflictHandler:", a3, 0, 0);
}

- (void)sendGenericAceCommand:(id)a3 conflictHandler:(id)a4
{
  -[NAFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:](self, "sendGenericAceCommand:turnIdentifier:conflictHandler:", a3, 0, a4);
}

- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  id v34;
  id obj;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v34 = a4;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[NAFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
        v46 = 2112;
        v47 = v12;
        _os_log_impl(&dword_246FF4000, v13, OS_LOG_TYPE_INFO, "%s passed command without ACE ID; inventing one (%@)",
          buf,
          0x16u);
      }
      objc_msgSend(v8, "setAceId:", v12);

    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v30 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "commands");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      v33 = *MEMORY[0x24BE825F8];
      v31 = *MEMORY[0x24BE825F0];
      v32 = isKindOfClass & 1;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(obj);
          v20 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v20, "encodedClassName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v20;
            objc_opt_class();
            LOBYTE(v23) = objc_opt_isKindOfClass();
          }
          else
          {
            if ((objc_msgSend(v21, "isEqualToString:", v33) & 1) == 0
              && !objc_msgSend(v21, "isEqualToString:", v31))
            {
              LOBYTE(v23) = 0;
LABEL_22:
              v22 = 0;
              goto LABEL_25;
            }
            v23 = objc_opt_class();
            if (!v23)
              goto LABEL_22;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = v20;
            }
            else
            {
              v24 = objc_alloc((Class)v23);
              objc_msgSend(v20, "dictionary");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (id)objc_msgSend(v24, "initWithDictionary:", v25);

            }
            LOBYTE(v23) = 0;
          }
LABEL_25:

          if (!v22 || (v23 & 1) != 0)
          {
            if ((v23 & 1) != 0)
            {
              v26 = *MEMORY[0x24BE08FB0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v45 = "-[NAFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
                _os_log_impl(&dword_246FF4000, v26, OS_LOG_TYPE_INFO, "%s Performing BackgroundUpdateRequest outside normal request processing flow.", buf, 0xCu);
              }
              objc_msgSend(v20, "encodedClassName");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackgroundRequest:analyticsEventProvider:", v27, 0, 0, 0, 1, 0);

            }
            -[NAFConnection _clientService](self, "_clientService");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dictionary");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = MEMORY[0x24BDAC760];
            v36[1] = 3221225472;
            v36[2] = __70__NAFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke;
            v36[3] = &unk_251857FF8;
            v37 = v9;
            objc_msgSend(v28, "performGenericAceCommand:interruptOutstandingRequest:reply:", v29, v9 == 0, v36);

          }
          else
          {
            -[NAFConnection _startRequestWithAceCommand:turnIdentifier:suppressAlert:](self, "_startRequestWithAceCommand:turnIdentifier:suppressAlert:", v22, v34, v32);
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v17);
    }

    v8 = v30;
  }

}

uint64_t __70__NAFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendReplyCommand:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "refId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_replyHandlerForAceId, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
      -[NSMutableDictionary removeObjectForKey:](self->_replyHandlerForAceId, "removeObjectForKey:", v4);
    }

  }
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getDeferredObjectsWithIdentifiers:completion:", v7, v6);

}

- (void)getCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__NAFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke;
  v10[3] = &unk_251858020;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getSerializedCachedObjectsWithIdentifiers:completion:", v7, v10);

}

uint64_t __60__NAFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke;
    v11[3] = &unk_251857C78;
    v7 = v4;
    v12 = v7;
    -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2;
    v9[3] = &unk_251858048;
    v10 = v7;
    objc_msgSend(v8, "getRemoteClockTimerSnapshotWithCompletion:", v9);

  }
}

uint64_t __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__NAFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearContext
{
  id v2;

  -[NAFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearContext");

}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willSetApplicationContextWithRefId:", v4);

}

- (void)setApplicationContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationContext:", v4);

}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchAppicationContextForApplicationInfo:supplementalContext:refID:", v10, v9, v8);

}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAppicationContextForApplicationInfo:supplementalContext:refID:", v7, 0, v6);

}

- (void)setApplicationContextForApplicationInfos:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAppicationContextForApplicationInfo:supplementalContext:refID:", v4, 0, 0);

}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverriddenApplicationContext:withContext:", v7, v6);

}

- (void)setAlertContextWithBulletins:(id)a3
{
  NSArray *v4;
  NSArray *cachedBulletins;
  id v6;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  cachedBulletins = self->_cachedBulletins;
  self->_cachedBulletins = v4;

  -[NAFConnection _clientService](self, "_clientService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlertContextDirty");

}

- (void)prepareForPhoneCall
{
  id v2;

  -[NAFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForPhoneCall");

}

- (void)telephonyRequestCompleted
{
  id v2;

  -[NAFConnection _clientService](self, "_clientService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "telephonyRequestCompleted");

}

- (void)usefulUserResultWillPresent
{
  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 1420, 0);
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3
{
  -[NAFConnection willPresentUsefulUserResultWithType:forCommand:](self, "willPresentUsefulUserResultWithType:forCommand:", a3, 0);
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3 forCommand:(id)a4
{
  AFAnalytics *analytics;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t uufrID;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  analytics = self->_analytics;
  AFAnalyticsContextCreateWithCommand();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 1420, v7);

  if (self->_uufrID && self->_activeRequestUUID && self->_activeRequestType)
  {
    v8 = (id)*MEMORY[0x24BE08FB0];
    v9 = v8;
    uufrID = self->_uufrID;
    if (uufrID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v11 = 136315394;
      v12 = "SiriX";
      v13 = 2080;
      v14 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_246FF4000, v9, OS_SIGNPOST_INTERVAL_END, uufrID, "UsefulUserFacingResults", "%s %s", (uint8_t *)&v11, 0x16u);
    }

  }
  -[NAFConnection _willPresentUsefulUserResultWithType:](self, "_willPresentUsefulUserResultWithType:", a3);
}

- (void)checkLanguageReady:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke;
  v16 = &unk_251858070;
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startAudioPlaybackRequest:options:reply:", v11, a4, v10, v13, v14, v15, v16);

}

void __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopAudioPlaybackRequest:immediately:", v6, v4);

}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAllAudioPlaybackRequests:", v3);

}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSpeechSynthesisRecord:", v4);

}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adviseSessionArbiterToContinueWithPreviousWinner:", v3);

}

- (void)_speechRecordingDidFailWithError:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (self->_activeRequestType == 1)
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NAFConnection _cancelRequestTimeoutForReason:](self, "_cancelRequestTimeoutForReason:", v5);

  }
  -[NAFConnection _updateStateIfNotInSync](self, "_updateStateIfNotInSync");
  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 0);
  -[NAFConnection _tellSpeechDelegateRecordingDidFail:](self, "_tellSpeechDelegateRecordingDidFail:", v6);

}

- (void)_willStopRecordingWithSignpostID:(unint64_t)a3
{
  self->_uufrID = a3;
}

- (id)acquireUserInteractionAssertion
{
  return 0;
}

- (NAFAssistantUIService)delegate
{
  return (NAFAssistantUIService *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NAFSpeechDelegate)speechDelegate
{
  return (NAFSpeechDelegate *)objc_loadWeakRetained((id *)&self->_speechDelegate);
}

- (void)setSpeechDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_speechDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_speechDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_siriClientStateManager, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_speechCallbackGroup, 0);
  objc_storeStrong((id *)&self->_lastRetryError, 0);
  objc_storeStrong((id *)&self->_interstitialCommandQueue, 0);
  objc_storeStrong((id *)&self->_interstitialProvider, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_replyHandlerForAceId, 0);
  objc_storeStrong((id *)&self->_activeTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_activeRequestUUID, 0);
  objc_storeStrong((id *)&self->_cachedBulletins, 0);
  objc_storeStrong((id *)&self->_initiationCallSiteInfo, 0);
  objc_storeStrong((id *)&self->_outstandingRequestClass, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3
{
  -[NAFConnection startSpeechRequestWithSpeechFileAtURL:isNarrowBand:](self, "startSpeechRequestWithSpeechFileAtURL:isNarrowBand:", a3, 0);
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a4;
  v6 = a3;
  -[NAFConnection _checkAndSetIsCapturingSpeech:](self, "_checkAndSetIsCapturingSpeech:", 1);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__NAFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke;
  v8[3] = &unk_251858098;
  v9 = v4;
  v8[4] = self;
  -[NAFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:](self, "_requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:analyticsEventProvider:", 0, 1, 0, 0, v8);
  -[NAFConnection _clientService](self, "_clientService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_startSpeechWithURL:isNarrowBand:", v6, v4);

}

uint64_t __77__NAFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16[0] = CFSTR("File");
  v15[0] = CFSTR("speechEvent");
  v15[1] = CFSTR("isNarrowBand");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("unixTime");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("id");
  objc_msgSend(v3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(*(id *)(a1 + 32), "_startRequestMetricSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextsMerge();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsEventCreateCurrent();
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)requestBarrier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__NAFConnection_Private__requestBarrier___block_invoke;
  v7[3] = &unk_251857C78;
  v8 = v4;
  v5 = v4;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_requestBarrierWithReply:", v5);

}

uint64_t __41__NAFConnection_Private__requestBarrier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestBarrierIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__NAFConnection_Private__requestBarrierIfNecessary___block_invoke;
  v7[3] = &unk_251857C78;
  v8 = v4;
  v5 = v4;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_requestBarrierIfNecessaryWithReply:", v5);

}

uint64_t __52__NAFConnection_Private__requestBarrierIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)broadcastCommandDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_broadcastCommandDictionary:", v4);

}

- (id)_activeRequestUUID
{
  return self->_activeRequestUUID;
}

- (void)_barrier
{
  dispatch_semaphore_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;

  v3 = dispatch_semaphore_create(0);
  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__NAFConnection_Internal___barrier__block_invoke;
  v11[3] = &unk_251857DA0;
  v5 = v3;
  v12 = v5;
  -[NAFConnection _clientServiceWithErrorHandler:](self, "_clientServiceWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __35__NAFConnection_Internal___barrier__block_invoke_2;
  v9[3] = &unk_251857888;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "_barrierWithReply:", v9);

  v8 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v8);

}

intptr_t __35__NAFConnection_Internal___barrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __35__NAFConnection_Internal___barrier__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_clearAssistantInfoForAccountWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NAFConnection _clientService](self, "_clientService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_clearAssistantInfoForAccountIdentifier:", v4);

}

- (id)_clientService
{
  void *v2;
  void *v3;

  -[NAFConnection _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_clientServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NAFConnection _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cachedBulletins
{
  return self->_cachedBulletins;
}

- (id)_clientConfiguration
{
  AFClientConfiguration *clientConfiguration;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  AFClientConfiguration *v8;
  AFClientConfiguration *v9;
  uint64_t v11;

  clientConfiguration = self->_clientConfiguration;
  if (!clientConfiguration)
  {
    objc_msgSend(MEMORY[0x24BE090B0], "sharedObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE091A0], "sharedObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getAFClientConfigurationClass();
    v6 = objc_alloc((Class)(id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    v8 = (AFClientConfiguration *)objc_msgSend(v6, "initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:", v7, objc_msgSend(v5, "state"), 0, 0, 0, 0, 0.0, v11, 0, 0, 0, 0);
    v9 = self->_clientConfiguration;
    self->_clientConfiguration = v8;

    *((_BYTE *)self + 272) &= ~1u;
    clientConfiguration = self->_clientConfiguration;
  }
  return (id)-[AFClientConfiguration copy](clientConfiguration, "copy");
}

- (void)_handleCommand:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s Ignored command %@ because it is an interstitial but there's no active request or active request has presented UUFR already.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_handleCommand:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s Enqueued command %@ because it is an interstitial and active request has not presented UUFR yet.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_dispatchCommand:(void *)a3 isInterstitial:interstitialPhase:interstitialDelay:reply:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "encodedClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[NAFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_246FF4000, v5, OS_LOG_TYPE_ERROR, "%s no delegate method on %@ to handle command: %@", (uint8_t *)&v7, 0x20u);

  OUTLINED_FUNCTION_12();
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_246FF4000, a1, a3, "%s Initial interstitial fired too early!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_246FF4000, v0, v1, "%s The requestId=%@ is malformed, unable to log SELF command", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __91__NAFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_246FF4000, v0, v1, "%s The requestId=%@ is malformed, unable to log SELF command", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setShouldSpeak:(char)a1 .cold.1(char a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[NAFConnection _setShouldSpeak:]";
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_246FF4000, a2, OS_LOG_TYPE_DEBUG, "%s shouldSpeak = %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_setAudioSessionID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s audioSessionID = %lu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_updateSpeechEndHostTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_246FF4000, v0, v1, "%s Skipped timing adjustment because %lu interstitials have been presented.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_updateSpeechEndHostTime:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_246FF4000, a1, a3, "%s Skipped timing adjustment because 1 interstitial has been presented.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_updateSpeechEndHostTime:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s updating speech end host time: %llu", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_updateSpeechEndHostTime:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  OUTLINED_FUNCTION_11(*MEMORY[0x24BDAC8D0]);
  v2 = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s Unable to update speech end host time. (_activeRequestType = %zd, _activeRequestUUID = %@)", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_connectionFailedWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_246FF4000, a1, a3, "%s Reporting speech error on connection tear down", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)requestDidAskForTimeoutExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s durationInSeconds: %f", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleRequestTimeoutForReason:durationInSeconds:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s Using timeout interval of %f seconds based on UserDefaults", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_scheduleRequestTimeoutForReason:(uint64_t)a3 durationInSeconds:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_246FF4000, a1, a3, "%s Extending request timeout to %f seconds as IE is enabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_willStartRequestWithSpeech:(os_log_t)log speechRequestOptions:requestInfo:analyticsEventProvider:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[NAFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
  _os_log_debug_impl(&dword_246FF4000, log, OS_LOG_TYPE_DEBUG, "%s Logging TurnMTE From _willStartRequestWithSpeech", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_willFailRequestWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s error is nil. Instrumentation logging is skipped. requestUUID = %@ turnId = %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_willFailRequestWithError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s turnId is nil. Instrumentation logging is skipped. requestUUID = %@ error = %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_willFailRequestWithError:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 200);
  v5 = 136316162;
  v6 = "-[NAFConnection _willFailRequestWithError:]";
  v7 = 2048;
  v8 = a1;
  v9 = 2112;
  v10 = v3;
  v11 = 2112;
  v12 = v4;
  v13 = 2112;
  v14 = a2;
  _os_log_error_impl(&dword_246FF4000, log, OS_LOG_TYPE_ERROR, "%s %p activeRequestUUID = %@ turnId = %@ %@", (uint8_t *)&v5, 0x34u);
}

- (void)_willPresentUsefulUserResultWithType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_246FF4000, v0, v1, "%s Initial interstitial fired %f seconds right before UUFR!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_enqueueInterstitialCommand:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_246FF4000, v0, v1, "%s command = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __114__NAFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_246FF4000, v0, v1, "%s interstitialError = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __85__NAFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_286_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s Failed continuing pending speech request %p %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)failRequestWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s %p %@", v2);
  OUTLINED_FUNCTION_7();
}

void __62__NAFConnection_startAudioPlaybackRequest_options_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[NAFConnection startAudioPlaybackRequest:options:completion:]_block_invoke";
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_0(&dword_246FF4000, a2, a3, "%s Fail to start audio playback request %{public}@ due to error %{public}@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
  OUTLINED_FUNCTION_7();
}

@end
