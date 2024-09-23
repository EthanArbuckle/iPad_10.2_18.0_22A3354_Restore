@implementation RTTCall

- (RTTCall)initWithCall:(id)a3
{
  id v4;
  RTTCall *v5;
  RTTCall *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *callQueue;
  uint64_t v13;
  AXDispatchTimer *incomingMessageTimeout;
  uint64_t v15;
  AXDispatchTimer *outgoingMessageTimeout;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTTCall;
  v5 = -[RTTCall init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[RTTCall setCall:](v5, "setCall:", v4);
    +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationForCallUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[RTTConversation conversationWithCall:](RTTConversation, "conversationWithCall:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "saveConversation:", v9);

    }
    -[RTTCall setConversation:](v6, "setConversation:", v9);
    v11 = dispatch_queue_create("tty-call-queue", 0);
    callQueue = v6->_callQueue;
    v6->_callQueue = (OS_dispatch_queue *)v11;

    -[RTTCall setSubstitutions:](v6, "setSubstitutions:", &unk_24D209C08);
    -[RTTCall registerNotifications](v6, "registerNotifications");
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v6->_callQueue);
    incomingMessageTimeout = v6->_incomingMessageTimeout;
    v6->_incomingMessageTimeout = (AXDispatchTimer *)v13;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v6->_incomingMessageTimeout, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v6->_callQueue);
    outgoingMessageTimeout = v6->_outgoingMessageTimeout;
    v6->_outgoingMessageTimeout = (AXDispatchTimer *)v15;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v6->_outgoingMessageTimeout, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[RTTCall setDelegate:](self, "setDelegate:", 0);
  -[RTTCall setCall:](self, "setCall:", 0);
  -[RTTCall stop](self, "stop");
  v4.receiver = self;
  v4.super_class = (Class)RTTCall;
  -[RTTCall dealloc](&v4, sel_dealloc);
}

- (void)registerNotifications
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_recreateTTYDevice_, *MEMORY[0x24BEB4AF0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_recreateTTYDevice_, *MEMORY[0x24BEB4B00], 0);

  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (uint64_t *)MEMORY[0x24BE64908];
  v14[0] = *MEMORY[0x24BE64908];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v7, *MEMORY[0x24BE64930], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *v6;
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_mediaServerDied, v9, v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_audioSessionWasInterrupted_, *MEMORY[0x24BDB15D8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_callStatusDidChange_, *MEMORY[0x24BEB4AB8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_callStatusDidChange_, *MEMORY[0x24BEB4AA8], 0);

}

- (void)audioSessionWasInterrupted:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Media server interrupted %@", buf, 0xCu);
  }

  v5 = v3;
  AXPerformBlockOnMainThread();

}

void __38__RTTCall_audioSessionWasInterrupted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x24BDB15F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  if (!v4)
    objc_msgSend(*(id *)(a1 + 40), "recreateTTYDevice:", 0);
}

- (void)mediaServerDied
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Media server died.", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTTCall performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_registerNotifications, 0, 2.0);
  -[RTTCall recreateTTYDevice:](self, "recreateTTYDevice:", 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)RTTCall;
  -[RTTCall description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTCall call](self, "call");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTCall conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ = %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isLocallyHosted
{
  return 1;
}

- (void)callStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTCall call](self, "call");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "callUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if (v11)
    {
      AXLogRTT();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[RTTCall conversation](self, "conversation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v13;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Call status changed, saving conversation to database. %@ - %@", (uint8_t *)&v16, 0x16u);

      }
      +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTCall conversation](self, "conversation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "saveConversation:", v15);

    }
  }

}

- (void)recreateTTYDevice:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  id *v26;
  uint64_t v27;
  id v28;
  int64_t v29;
  NSObject *v30;
  int64_t ttyMode;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  int64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v4, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTCall call](self, "call");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  AXLogRTT();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v11 & 1) != 0)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Recreating TTY device with updated call", buf, 2u);
    }

    -[RTTCall setCall:](self, "setCall:", v7);
LABEL_6:
    objc_msgSend(MEMORY[0x24BDFD9D0], "stopAudioSession");
    -[RTTCall ttyDevice](self, "ttyDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stop");

    -[RTTCall setTtyDevice:](self, "setTtyDevice:", 0);
    -[RTTCall call](self, "call");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsTTYWithVoice");

    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFD9D0], "setAudioSessionProperties:", &unk_24D209C58);
      objc_msgSend(MEMORY[0x24BDFD9D0], "startAudioSession");
    }
    self->_ttyMode = 0;
    -[RTTCall call](self, "call");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "supportsTTYWithVoice");

    if (v18)
    {
      self->_ttyMode = 3;
      -[RTTCall call](self, "call");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "providerContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AXTTYTextStreamToken();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");

    }
    else
    {
      -[RTTCall call](self, "call");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isUsingBaseband");

      if (v25)
      {
        self->_ttyMode = 1;
        goto LABEL_17;
      }
      v23 = 0;
    }
    if (self->_ttyMode == 3)
    {
      v35 = 0;
      v26 = (id *)&v35;
      v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDFDA48]), "initWithStreamToken:error:", v23, &v35);
LABEL_18:
      v12 = v27;
      v7 = *v26;
      -[NSObject setDelegate:](v12, "setDelegate:", self);
      AXLogRTT();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        ttyMode = self->_ttyMode;
        -[RTTCall call](self, "call");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v37 = ttyMode;
        v38 = 2112;
        v39 = v7;
        v40 = 2112;
        v41 = v4;
        v42 = 2112;
        v43 = v32;
        _os_log_impl(&dword_21473C000, v30, OS_LOG_TYPE_INFO, "Creating TTY %ld, %@ = %@ = %@", buf, 0x2Au);

      }
      -[RTTCall setTtyDevice:](self, "setTtyDevice:", v12);
      -[RTTCall ttyDevice](self, "ttyDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "start");

      goto LABEL_21;
    }
LABEL_17:
    v28 = objc_alloc(MEMORY[0x24BDFDA48]);
    v29 = self->_ttyMode;
    v34 = 0;
    v26 = (id *)&v34;
    v27 = objc_msgSend(v28, "initWithMode:error:", v29, &v34);
    goto LABEL_18;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "Call UUID did not match current call. Ignoring call update", buf, 2u);
  }
LABEL_21:

}

- (void)toggleSystemOutputMute:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "Requesting to toggle mute: %d", (uint8_t *)v5, 8u);
  }

  RTTSetDownlinkMute(v3);
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  uint8_t buf[16];

  -[RTTCall ttyDevice](self, "ttyDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTTCall ttyDevice](self, "ttyDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "start");

  }
  else
  {
    -[RTTCall recreateTTYDevice:](self, "recreateTTYDevice:", 0);
  }
  -[RTTCall call](self, "call");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmergency");

  if (v6)
  {
    AXLogRTT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Sending emergency announce", buf, 2u);
    }

    v8 = 15;
    do
    {
      -[RTTCall sendString:](self, "sendString:", CFSTR(" "));
      --v8;
    }
    while (v8);
  }
  else
  {
    -[RTTCall call](self, "call");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isTTY") & 1) != 0)
    {
      -[RTTCall call](self, "call");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "supportsTTYWithVoice");

      if ((v11 & 1) == 0)
        -[RTTCall toggleSystemOutputMute:](self, "toggleSystemOutputMute:", 1);
    }
    else
    {

    }
  }
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTCall call](self, "call");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "answerRTTCallAsMutedForCall:", v13);

  if ((v14 & 1) == 0)
    AXPerformBlockAsynchronouslyOnMainThread();
}

void __16__RTTCall_start__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "call");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUplinkMuted:", 0);

}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDFD9D0], "stopAudioSession");
  -[RTTCall toggleSystemOutputMute:](self, "toggleSystemOutputMute:", 0);
  -[RTTCall ttyDevice](self, "ttyDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[RTTCall setTtyDevice:](self, "setTtyDevice:", 0);
  +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTCall conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveConversation:", v4);

}

- (void)sendString:(id)a3
{
  id v4;
  NSObject *callQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  callQueue = self->_callQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __22__RTTCall_sendString___block_invoke;
  v7[3] = &unk_24D203A08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callQueue, v7);

}

void __22__RTTCall_sendString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  +[RTTTelephonyUtilities sharedUtilityProvider](RTTTelephonyUtilities, "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactPathForCall:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTTUtterance utteranceWithContactPath:andText:](RTTUtterance, "utteranceWithContactPath:andText:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUtterance:", v5);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __22__RTTCall_sendString___block_invoke_2;
  v22[3] = &unk_24D2039E0;
  v22[4] = v7;
  objc_msgSend(v8, "afterDelay:processBlock:", v22, 3.0);
  AXLogRTT();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v24 = v10;
    *(_WORD *)&v24[8] = 2112;
    *(_QWORD *)&v24[10] = v5;
    _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Sending string[%@] with uttererance: %@", buf, 0x16u);
  }

  AXLogRTT();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v24 = v12;
    _os_log_impl(&dword_21473C000, v11, OS_LOG_TYPE_INFO, "Sending with convo: %@", buf, 0xCu);

  }
  v13 = *(_QWORD **)(a1 + 32);
  if (v13[1] == 3)
  {
    objc_msgSend(v13, "ttyDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "sendText:", *(_QWORD *)(a1 + 40));

    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(a1 + 40);
      v18 = objc_msgSend(v17, "length");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v24 = v15;
      *(_WORD *)&v24[4] = 2112;
      *(_QWORD *)&v24[6] = v17;
      *(_WORD *)&v24[14] = 2048;
      *(_QWORD *)&v24[16] = v18;
      _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "TTY send string %d = |%@| %lu", buf, 0x1Cu);
    }
  }
  else
  {
    v19 = objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", 0);
    AXLogRTT();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v24 = v19;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v19;
      _os_log_impl(&dword_21473C000, v20, OS_LOG_TYPE_INFO, "TTY send %C, |%x|", buf, 0xEu);
    }

    objc_msgSend(*(id *)(a1 + 32), "ttyDevice");
    v16 = objc_claimAutoreleasedReturnValue();
    v21 = (id)-[NSObject sendCharacter:](v16, "sendCharacter:", v19);
  }

}

uint64_t __22__RTTCall_sendString___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processMessageTimeoutForMe:", 1);
}

- (void)device:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v5 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109378;
    v8[1] = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "TTY Start %d %@", (uint8_t *)v8, 0x12u);
  }

}

- (void)deviceDidStop:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[RTTCall call](self, "call");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v5, "status");
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "TTY Stop %d", (uint8_t *)v8, 8u);

  }
  -[RTTCall call](self, "call");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "status");

  if ((v7 - 1) <= 1)
    -[RTTCall recreateTTYDevice:](self, "recreateTTYDevice:", 0);
}

- (BOOL)_handleInitialGarbageTextFromTTY:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  AXDispatchTimer *v8;
  AXDispatchTimer *garbageCharacterStripperTimer;
  NSMutableString *v10;
  NSMutableString *garbageCollection;
  uint64_t v12;
  NSMutableString *v13;
  BOOL v14;
  AXDispatchTimer *v15;
  _QWORD v17[5];
  NSMutableString *v18;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("O")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR(";"))
    && (-[NSMutableString isEqualToString:](self->_garbageCollection, "isEqualToString:", CFSTR("O")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("?"))
    && -[NSMutableString isEqualToString:](self->_garbageCollection, "isEqualToString:", CFSTR("O;")))
  {
    if (!self->_garbageCharacterStripperTimer)
    {
      v8 = (AXDispatchTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", self->_callQueue);
      garbageCharacterStripperTimer = self->_garbageCharacterStripperTimer;
      self->_garbageCharacterStripperTimer = v8;

      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v10 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
      garbageCollection = self->_garbageCollection;
      self->_garbageCollection = v10;

    }
    -[NSMutableString appendString:](self->_garbageCollection, "appendString:", v6);
    v12 = -[NSMutableString length](self->_garbageCollection, "length");
    -[AXDispatchTimer cancel](self->_garbageCharacterStripperTimer, "cancel");
    if (v12 == 3)
    {
      v13 = self->_garbageCollection;
      self->_garbageCollection = 0;
    }
    else
    {
      v15 = self->_garbageCharacterStripperTimer;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __51__RTTCall__handleInitialGarbageTextFromTTY_device___block_invoke;
      v17[3] = &unk_24D203A08;
      v17[4] = self;
      v18 = (NSMutableString *)v7;
      -[AXDispatchTimer afterDelay:processBlock:](v15, "afterDelay:processBlock:", v17, 1.0);
      v13 = v18;
    }

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __51__RTTCall__handleInitialGarbageTextFromTTY_device___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "device:didReceiveText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

- (void)_processMessageTimeoutForMe:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  -[RTTCall conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastUtteranceForMe:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasTimedOut"))
  {
    AXLogRTT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("incoming");
      if (v3)
        v8 = CFSTR("outgoing");
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "Last %@ utterance timed out, saving conversation to database", (uint8_t *)&v11, 0xCu);
    }

    +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTCall conversation](self, "conversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveConversation:", v10);

  }
}

- (id)_processText:(id)a3 withDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSMutableString *garbageCollection;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[RTTCall conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "utterances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
LABEL_9:
    v6 = v6;
    v12 = v6;
    goto LABEL_10;
  }
  if (!-[RTTCall _handleInitialGarbageTextFromTTY:device:](self, "_handleInitialGarbageTextFromTTY:device:", v6, v7))
  {
    if (-[NSMutableString length](self->_garbageCollection, "length"))
    {
      -[NSMutableString appendString:](self->_garbageCollection, "appendString:", v6);
      v13 = -[NSMutableString copy](self->_garbageCollection, "copy");

      v6 = (id)v13;
    }
    garbageCollection = self->_garbageCollection;
    self->_garbageCollection = 0;

    goto LABEL_9;
  }
  AXLogRTT();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_21473C000, v11, OS_LOG_TYPE_INFO, "not processing initial text because it looks like garbage: %@", (uint8_t *)&v16, 0xCu);
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (void)callDidReceiveText:(id)a3 forUtterance:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[RTTCall delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "Delegate handling call did receive: %@ for [%@]->%@", (uint8_t *)&v11, 0x20u);

  }
  -[RTTCall delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ttyCall:didReceiveString:forUtterance:", self, v6, v7);

}

- (void)saveTranscribedTextForConversation:(id)a3 isNew:(BOOL)a4
{
  id v6;
  NSObject *callQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  callQueue = self->_callQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__RTTCall_saveTranscribedTextForConversation_isNew___block_invoke;
  block[3] = &unk_24D2040D8;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(callQueue, block);

}

uint64_t __52__RTTCall_saveTranscribedTextForConversation_isNew___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (v2)
    v6 = (id)objc_msgSend(v3, "addTranscriptionFromOtherContactPath:", v5);
  else
    v7 = (id)objc_msgSend(v3, "updateTranscriptionFromOtherContactPath:", v5);

  +[RTTDatabaseManager sharedManager](RTTDatabaseManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveConversation:", v9);

  return objc_msgSend(*(id *)(a1 + 32), "_postLocalNotificationForText:", *(_QWORD *)(a1 + 40));
}

- (void)sendVoicemailTranscriptionText:(id)a3
{
  id v4;
  NSObject *callQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  callQueue = self->_callQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__RTTCall_sendVoicemailTranscriptionText___block_invoke;
  v7[3] = &unk_24D203A08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callQueue, v7);

}

void __42__RTTCall_sendVoicemailTranscriptionText___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "ttyDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sendText:", *(_QWORD *)(a1 + 40));

  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 40);
    v6[0] = 67109634;
    v6[1] = v3;
    v7 = 2112;
    v8 = v5;
    v9 = 2048;
    v10 = objc_msgSend(v5, "length");
    _os_log_impl(&dword_21473C000, v4, OS_LOG_TYPE_INFO, "TTY send voicemail transcription %d = |%@| %lu", (uint8_t *)v6, 0x1Cu);
  }

}

- (void)_postLocalNotificationForText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 buf;
  RTTCall *v42;
  void *v43;
  uint64_t *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[RTTCall isViewControllerVisible](self, "isViewControllerVisible"))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v5 = (void *)getAXSpringBoardServerClass_softClass;
    v40 = getAXSpringBoardServerClass_softClass;
    if (!getAXSpringBoardServerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v42 = (RTTCall *)__getAXSpringBoardServerClass_block_invoke;
      v43 = &unk_24D203C78;
      v44 = &v37;
      __getAXSpringBoardServerClass_block_invoke((uint64_t)&buf);
      v5 = (void *)v38[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v37, 8);
    objc_msgSend(v6, "server", v37);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "focusedApps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &__block_literal_global_3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = v10 != 0;

    AXLogRTT();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v10 != 0;
      _os_log_impl(&dword_21473C000, v12, OS_LOG_TYPE_INFO, "VC was visible, but was InCallService? %d", (uint8_t *)&buf, 8u);
    }

  }
  else
  {
    v11 = 0;
  }
  -[RTTCall call](self, "call");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isIncoming") & 1) != 0)
  {
    -[RTTCall call](self, "call");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isScreening");

    if (v15)
    {
      AXLogRTT();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21473C000, v16, OS_LOG_TYPE_INFO, "Skipping user notification for incoming call in screening state", (uint8_t *)&buf, 2u);
      }
LABEL_27:

      goto LABEL_28;
    }
  }
  else
  {

  }
  AXLogRTT();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    -[RTTCall call](self, "call");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEndpointOnCurrentDevice");
    LODWORD(buf) = 67109634;
    DWORD1(buf) = v19;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = !v11;
    HIWORD(buf) = 2112;
    v42 = self;
    _os_log_impl(&dword_21473C000, v17, OS_LOG_TYPE_INFO, "Generating user notification based on whether device is endpoint %d of call and view control is hidden: %d [%@]", (uint8_t *)&buf, 0x18u);

  }
  if (!v11)
  {
    -[RTTCall call](self, "call");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEndpointOnCurrentDevice");

    if (v21)
    {
      -[RTTCall call](self, "call");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayName");
      v16 = objc_claimAutoreleasedReturnValue();

      if (!-[NSObject length](v16, "length"))
      {
        v23 = (void *)MEMORY[0x24BDBACC0];
        v24 = (void *)MEMORY[0x24BDBACA0];
        -[RTTCall conversation](self, "conversation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "otherContactPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "contactForPhoneNumber:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringFromContact:style:", v27, 0);
        v28 = objc_claimAutoreleasedReturnValue();

        v16 = v28;
      }
      -[RTTCall conversation](self, "conversation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "utterances");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      AXLogRTT();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_21473C000, v32, OS_LOG_TYPE_INFO, "Generating user notification with utterance: %@", (uint8_t *)&buf, 0xCu);
      }

      v33 = objc_msgSend(v31, "isMe");
      if (v31)
        v34 = v33;
      else
        v34 = 1;
      if ((v34 & 1) == 0)
      {
        -[RTTCall call](self, "call");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "callUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        RTTGenerateUserNotificationForContact(v16, v4, v31, v36);

      }
      goto LABEL_27;
    }
  }
LABEL_28:

}

uint64_t __41__RTTCall__postLocalNotificationForText___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (_QWORD *)getAXInCallServiceNameSymbolLoc_ptr;
  v12 = getAXInCallServiceNameSymbolLoc_ptr;
  if (!getAXInCallServiceNameSymbolLoc_ptr)
  {
    v5 = (void *)AccessibilityUtilitiesLibrary();
    v4 = dlsym(v5, "AXInCallServiceName");
    v10[3] = (uint64_t)v4;
    getAXInCallServiceNameSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    v8 = (_Unwind_Exception *)__41__RTTCall__postLocalNotificationForText___block_invoke_cold_1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  v6 = objc_msgSend(v3, "isEqualToString:", *v4, v9);

  return v6;
}

- (void)device:(id)a3 didReceiveText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *callQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v7, "length");
    if (v9)
      LODWORD(v9) = objc_msgSend(v7, "characterAtIndex:", 0);
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 1024;
    v23 = v9;
    _os_log_impl(&dword_21473C000, v8, OS_LOG_TYPE_INFO, "TTY receive string '%@' [%d]", buf, 0x12u);
  }

  -[RTTCall substitutions](self, "substitutions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;

    AXLogRTT();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_21473C000, v13, OS_LOG_TYPE_INFO, "Replacing with |%@|", buf, 0xCu);
    }

  }
  else
  {
    v12 = v7;
  }
  callQueue = self->_callQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__RTTCall_device_didReceiveText___block_invoke;
  block[3] = &unk_24D204120;
  block[4] = self;
  v18 = v12;
  v19 = v6;
  v15 = v6;
  v16 = v12;
  dispatch_async(callQueue, block);

}

void __33__RTTCall_device_didReceiveText___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_processText:withDevice:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v4 = 0;
    *(_QWORD *)&v3 = 138412290;
    v16 = v3;
    do
    {
      v5 = objc_msgSend(v2, "rangeOfComposedCharacterSequenceAtIndex:", v4, v16);
      v7 = v6;
      objc_msgSend(v2, "substringWithRange:", v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogRTT();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v16;
        v19 = v8;
        _os_log_impl(&dword_21473C000, v9, OS_LOG_TYPE_INFO, "Processing individual substring: '%@'", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "conversation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendStringFromOtherContactPath:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = *(void **)(a1 + 32);
      objc_msgSend(v11, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "callDidReceiveText:forUtterance:", v8, v13);

      v4 += v7;
    }
    while (v4 < objc_msgSend(v2, "length"));
  }
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 40);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __33__RTTCall_device_didReceiveText___block_invoke_253;
  v17[3] = &unk_24D2039E0;
  v17[4] = v14;
  objc_msgSend(v15, "afterDelay:processBlock:", v17, 3.0);
  objc_msgSend(*(id *)(a1 + 32), "_postLocalNotificationForText:", *(_QWORD *)(a1 + 40));

}

uint64_t __33__RTTCall_device_didReceiveText___block_invoke_253(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processMessageTimeoutForMe:", 0);
}

- (void)device:(id)a3 didReceiveCharacter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v10 = v4;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_21473C000, v7, OS_LOG_TYPE_INFO, "TTY receive %C, |%x|", buf, 0xEu);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTCall device:didReceiveText:](self, "device:didReceiveText:", v6, v8);

}

- (RTTCallDelegate)delegate
{
  return (RTTCallDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (TUCall)call
{
  return self->_call;
}

- (void)setCall:(id)a3
{
  objc_storeStrong((id *)&self->_call, a3);
}

- (OS_dispatch_queue)callQueue
{
  return self->_callQueue;
}

- (BOOL)isViewControllerVisible
{
  return self->_isViewControllerVisible;
}

- (void)setIsViewControllerVisible:(BOOL)a3
{
  self->_isViewControllerVisible = a3;
}

- (AVCVirtualTTYDevice)ttyDevice
{
  return self->_ttyDevice;
}

- (void)setTtyDevice:(id)a3
{
  objc_storeStrong((id *)&self->_ttyDevice, a3);
}

- (NSDictionary)substitutions
{
  return self->_substitutions;
}

- (void)setSubstitutions:(id)a3
{
  objc_storeStrong((id *)&self->_substitutions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitutions, 0);
  objc_storeStrong((id *)&self->_ttyDevice, 0);
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outgoingMessageTimeout, 0);
  objc_storeStrong((id *)&self->_incomingMessageTimeout, 0);
  objc_storeStrong((id *)&self->_garbageCharacterStripperTimer, 0);
  objc_storeStrong((id *)&self->_garbageCollection, 0);
  objc_storeStrong((id *)&self->_callQueue, 0);
}

uint64_t __41__RTTCall__postLocalNotificationForText___block_invoke_cold_1()
{
  dlerror();
  abort_report_np();
  return __getAXSpringBoardServerClass_block_invoke_cold_1();
}

@end
