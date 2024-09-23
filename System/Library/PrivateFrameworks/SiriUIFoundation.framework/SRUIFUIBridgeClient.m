@implementation SRUIFUIBridgeClient

- (SRUIFUIBridgeClient)initWithStateHandler:(id)a3
{
  id v5;
  SRUIFUIBridgeClient *v6;
  NSObject *v7;
  uint64_t v8;
  SUIBUIBridgeClient *client;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SRUIFUIBridgeClient;
  v6 = -[SRUIFUIBridgeClient init](&v13, sel_init);
  objc_storeStrong((id *)&v6->_stateHandler, a3);
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SRUIFUIBridgeClient initWithStateHandler:]";
    _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - creating UIBridge client", buf, 0xCu);
  }
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEA85A0]), "initWithDelegate:", v6);
  client = v6->_client;
  v6->_client = (SUIBUIBridgeClient *)v8;

  -[SUIBUIBridgeClient preheat](v6->_client, "preheat");
  v10 = dispatch_queue_create("com.apple.siri.attendingQueue", 0);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v10;

  return v6;
}

- (SRUIFUIBridgeClient)initWithStateHandler:(id)a3 delegateQueue:(id)a4
{
  id v7;
  id v8;
  SRUIFUIBridgeClient *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  SUIBUIBridgeClient *client;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SRUIFUIBridgeClient;
  v8 = a4;
  v9 = -[SRUIFUIBridgeClient init](&v17, sel_init);
  objc_storeStrong((id *)&v9->_stateHandler, a3);
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SRUIFUIBridgeClient initWithStateHandler:delegateQueue:]";
    _os_log_impl(&dword_219F26000, v10, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - creating UIBridge client with delegate queue", buf, 0xCu);
  }
  v11 = objc_alloc(MEMORY[0x24BEA85A0]);
  v12 = objc_msgSend(v11, "initWithDelegate:delegateQueue:", v9, v8, v17.receiver, v17.super_class);

  client = v9->_client;
  v9->_client = (SUIBUIBridgeClient *)v12;

  -[SUIBUIBridgeClient preheat](v9->_client, "preheat");
  v14 = dispatch_queue_create("com.apple.siri.attendingQueue", 0);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v14;

  return v9;
}

- (void)idleAndQuietDidChange:(BOOL)a3
{
  id v4;

  if (a3)
  {
    if (-[SRUIFUIBridgeClient isAttending](self, "isAttending"))
    {
      -[SRUIFUIBridgeClient _stateHandler](self, "_stateHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performTransitionForEvent:", 9);

    }
  }
}

- (void)endForReason:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SRUIFUIBridgeClient endForReason:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_219F26000, v7, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - end for reason %@", (uint8_t *)&v9, 0x16u);

  }
  -[SUIBUIBridgeClient stopAttendingForReason:](self->_client, "stopAttendingForReason:", 1);
  -[SUIBUIBridgeClient siriDismissed](self->_client, "siriDismissed");
  -[SRUIFUIBridgeClient _setIsAttending:](self, "_setIsAttending:", 0);
}

- (void)stopAttending
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFUIBridgeClient stopAttending]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - stop attending", (uint8_t *)&v4, 0xCu);
  }
  -[SUIBUIBridgeClient stopAttendingForReason:](self->_client, "stopAttendingForReason:", 1);
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 10);
  -[SRUIFUIBridgeClient _setIsAttending:](self, "_setIsAttending:", 0);
}

- (void)_setIsAttending:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SRUIFUIBridgeClient__setIsAttending___block_invoke;
  block[3] = &unk_24DC1ADB0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_sync(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__SRUIFUIBridgeClient__setIsAttending___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  int v3;
  id *v4;
  id v5;
  char v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    if (*((unsigned __int8 *)WeakRetained + 24) != v3)
    {
      *((_BYTE *)WeakRetained + 24) = v3;
      v4 = WeakRetained + 4;
      v8 = WeakRetained;
      v5 = objc_loadWeakRetained(WeakRetained + 4);
      v6 = objc_opt_respondsToSelector();

      WeakRetained = v8;
      if ((v6 & 1) != 0)
      {
        v7 = objc_loadWeakRetained(v4);
        objc_msgSend(v7, "attendingStatusChanged:", *((unsigned __int8 *)v8 + 24));

        WeakRetained = v8;
      }
    }
  }

}

- (void)promptedUserForInput
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFUIBridgeClient promptedUserForInput]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation", (uint8_t *)&v4, 0xCu);
  }
  -[SUIBUIBridgeClient siriPrompted](self->_client, "siriPrompted");
}

- (void)newRequestWillStart
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SRUIFUIBridgeClient newRequestWillStart]";
    _os_log_impl(&dword_219F26000, v2, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation", (uint8_t *)&v3, 0xCu);
  }
}

- (void)uiBridgeServiceWillStartAttending
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFUIBridgeClient uiBridgeServiceWillStartAttending]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - will start attending", (uint8_t *)&v4, 0xCu);
  }
  -[SRUIFUIBridgeClient _setIsAttending:](self, "_setIsAttending:", 1);
}

- (void)uiBridgeServiceDidStartAttending
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFUIBridgeClient uiBridgeServiceDidStartAttending]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - did start attending", (uint8_t *)&v4, 0xCu);
  }
  -[SRUIFUIBridgeClient _setIsAttending:](self, "_setIsAttending:", 1);
}

- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRUIFUIBridgeClient uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:]";
    _os_log_impl(&dword_219F26000, v4, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - did stop attending", (uint8_t *)&v5, 0xCu);
  }
  -[SRUIFUIBridgeClient _setIsAttending:](self, "_setIsAttending:", 0);
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 10);
}

- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  double v10;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SRUIFUIBridgeClient _stateHandler](self, "_stateHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SRUIFSiriSessionStateGetDescription(objc_msgSend(v7, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[SRUIFUIBridgeClient uiBridgeServiceDetectedSpeechStart:]";
    v13 = 1024;
    v14 = v3;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_219F26000, v6, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - speech start detected, shouldDuckTTS: %d, currentState: %@", (uint8_t *)&v11, 0x1Cu);

  }
  -[SRUIFSiriSessionStateHandler performTransitionForEvent:](self->_stateHandler, "performTransitionForEvent:", 11);
  if (v3)
  {
    self->_didDuckTTS = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LODWORD(v10) = 1036831949;
    objc_msgSend(WeakRetained, "duckTTSToVolume:rampTime:completion:", &__block_literal_global_8, v10, 0.5);

  }
}

void __58__SRUIFUIBridgeClient_uiBridgeServiceDetectedSpeechStart___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __58__SRUIFUIBridgeClient_uiBridgeServiceDetectedSpeechStart___block_invoke_cold_1(v3, v4, v5);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SRUIFUIBridgeClient uiBridgeServiceDetectedSpeechStart:]_block_invoke";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - successfully ducked TTS", (uint8_t *)&v6, 0xCu);
  }

}

- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3
{
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id WeakRetained;
  double v12;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedSpeechMitigationResult:]";
    v15 = 2048;
    v16 = a3;
    _os_log_impl(&dword_219F26000, v6, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - mitigationResult: %ld", (uint8_t *)&v13, 0x16u);
  }
  if (a3 == 3)
  {
    -[SRUIFUIBridgeClient _stateHandler](self, "_stateHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 12;
  }
  else
  {
    if (a3 != 1)
      goto LABEL_8;
    -[SRUIFUIBridgeClient _stateHandler](self, "_stateHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 13;
  }
  objc_msgSend(v7, "performTransitionForEvent:", v9);

LABEL_8:
  if (self->_didDuckTTS)
  {
    self->_didDuckTTS = 0;
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedSpeechMitigationResult:]";
      _os_log_impl(&dword_219F26000, v10, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - unducking TTS", (uint8_t *)&v13, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LODWORD(v12) = 1.0;
    objc_msgSend(WeakRetained, "duckTTSToVolume:rampTime:completion:", &__block_literal_global_6, v12, 0.5);

  }
}

void __69__SRUIFUIBridgeClient_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __69__SRUIFUIBridgeClient_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke_cold_1(v3, v4, v5);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedSpeechMitigationResult:]_block_invoke";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - successfully unducked TTS", (uint8_t *)&v6, 0xCu);
  }

}

- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt
{
  NSObject *v3;
  id WeakRetained;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedShowAssetsDownloadPrompt]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation - Received Show Assets Download notification prompt.", (uint8_t *)&v5, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "showAssetsDownloadNotificationPrompt");

}

- (void)uiBridgeServiceReceivedShowPhotoSelectionWithSearchString:(id)a3
{
  SRUIFUIBridgeClientDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "requestPhotoSelectionWithSearchString:completion:", v4, &__block_literal_global_8);

}

- (void)uiBridgeServiceReceivedCancelPhotoSelectionWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cancelPhotoSelectionWithAnimation:", v3);

}

- (void)uiBridgeServiceDidReceiveTasks:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "taskId", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "recievedOrchestrationTaskswithIDs:", v5);

}

- (void)uiBridgeServiceTaskDidEnd:(id)a3
{
  SRUIFUIBridgeClientDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "orchestrationTaskEnded:", v4);

}

- (void)uiBridgeServiceTaskDidCancel:(id)a3
{
  SRUIFUIBridgeClientDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "orchestrationTaskWasCancelled:", v4);

}

- (void)uiBridgeServiceReceivedSiriResponse:(id)a3
{
  void *v4;
  id WeakRetained;

  objc_msgSend(a3, "inAppResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "orchestrationDidPresentResponseFullyInApp");

  }
}

- (void)uiBridgeServiceReceivedRequestProgress:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "progressType");
  if (v4 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "intelligenceFlowActionSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFUIBridgeClient buildLatencyTextFromActionFlow:](self, "buildLatencyTextFromActionFlow:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "receivedRequestProgressUpdate:", v7);
    goto LABEL_5;
  }
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "nlRouterSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rewrittenUtterance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(WeakRetained, "receivedRequestProgressUpdate:", v8);

LABEL_5:
  }

}

- (id)buildLatencyTextFromActionFlow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[4];
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "formatString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "parameterMatches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v21 = &v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        objc_msgSend(v3, "parameterSummaries", v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "captured");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = *MEMORY[0x24BE08FB0];
          v16 = &stru_24DC1C4B0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
            -[SRUIFUIBridgeClient buildLatencyTextFromActionFlow:].cold.1(v27, v21, v17);
        }
        v18 = objc_msgSend(v12, "range");
        objc_msgSend(v5, "replaceCharactersInRange:withString:", v18, v19, v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v9);
  }

  return v5;
}

uint64_t __54__SRUIFUIBridgeClient_buildLatencyTextFromActionFlow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "range");
  v6 = objc_msgSend(v4, "range");

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

- (SRUIFUIBridgeClientDelegate)delegate
{
  return (SRUIFUIBridgeClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAttending
{
  return self->_isAttending;
}

- (SRUIFSiriSessionStateHandler)_stateHandler
{
  return (SRUIFSiriSessionStateHandler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStateHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SUIBUIBridgeClient)_client
{
  return (SUIBUIBridgeClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __58__SRUIFUIBridgeClient_uiBridgeServiceDetectedSpeechStart___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SRUIFUIBridgeClient uiBridgeServiceDetectedSpeechStart:]_block_invoke";
  OUTLINED_FUNCTION_0_2(&dword_219F26000, a1, a3, "%s #IntuitiveConversation - failed to duck TTS", (uint8_t *)&v3);
}

void __69__SRUIFUIBridgeClient_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[SRUIFUIBridgeClient uiBridgeServiceReceivedSpeechMitigationResult:]_block_invoke";
  OUTLINED_FUNCTION_0_2(&dword_219F26000, a1, a3, "%s #IntuitiveConversation - failed to unduck TTS", (uint8_t *)&v3);
}

- (void)buildLatencyTextFromActionFlow:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[SRUIFUIBridgeClient buildLatencyTextFromActionFlow:]";
  OUTLINED_FUNCTION_0_2(&dword_219F26000, a3, (uint64_t)a3, "%s #SiriUIBridge sent match with no corresponding parameter summary", a1);
}

@end
