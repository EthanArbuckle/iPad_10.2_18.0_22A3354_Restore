@implementation VTCoreSpeechKeepAliveHandler

void __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSpeakerActivated");

}

- (void)_handleSpeakerActivated
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Received Speaker Activated Event", v4, 2u);
  }
  self->_speakerStateActivated = 1;
  if (self->_voiceTriggerEnabled)
    -[VTCoreSpeechKeepAliveHandler _enableCoreSpeechDaemonKeepAlive](self, "_enableCoreSpeechDaemonKeepAlive");
}

- (VTCoreSpeechKeepAliveHandler)init
{
  VTCoreSpeechKeepAliveHandler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTCoreSpeechKeepAliveHandler;
  v2 = -[VTCoreSpeechKeepAliveHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("VTCoreSpeechKeepAliveHandler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_QWORD *)&v2->_activeNotificationToken = -1;
    *(_WORD *)&v2->_voiceTriggerEnabled = 0;
  }
  return v2;
}

- (void)dealloc
{
  int activeNotificationToken;
  int inactiveNotificationToken;
  objc_super v5;

  activeNotificationToken = self->_activeNotificationToken;
  if (activeNotificationToken != -1)
  {
    notify_cancel(activeNotificationToken);
    self->_activeNotificationToken = -1;
  }
  inactiveNotificationToken = self->_inactiveNotificationToken;
  if (inactiveNotificationToken != -1)
  {
    notify_cancel(inactiveNotificationToken);
    self->_inactiveNotificationToken = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)VTCoreSpeechKeepAliveHandler;
  -[VTCoreSpeechKeepAliveHandler dealloc](&v5, sel_dealloc);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__VTCoreSpeechKeepAliveHandler_start__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleSpeakerInactivated
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Received Speaker Inactivated Event", v4, 2u);
  }
  self->_speakerStateActivated = 0;
  -[VTCoreSpeechKeepAliveHandler _disableCoreSpeechDaemonKeepAlive](self, "_disableCoreSpeechDaemonKeepAlive");
}

- (void)voiceTriggerPolicyDidChange:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__VTCoreSpeechKeepAliveHandler_voiceTriggerPolicyDidChange___block_invoke;
  v4[3] = &unk_24C7F4D98;
  v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (void)_voiceTriggerPolicyEnabled
{
  self->_voiceTriggerEnabled = 1;
  if (+[VTUtilities isNano](VTUtilities, "isNano")
    || !+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman")
    && !+[VTUtilities supportBargeIn](VTUtilities, "supportBargeIn")
    && !+[VTUtilities isAlwaysOn](VTUtilities, "isAlwaysOn"))
  {
    -[VTCoreSpeechKeepAliveHandler _enableCoreSpeechDaemonKeepAlive](self, "_enableCoreSpeechDaemonKeepAlive");
  }
}

- (void)_voiceTriggerPolicyDisabled
{
  self->_voiceTriggerEnabled = 0;
  if (!+[VTUtilities isNano](VTUtilities, "isNano"))
    -[VTCoreSpeechKeepAliveHandler _disableCoreSpeechDaemonKeepAlive](self, "_disableCoreSpeechDaemonKeepAlive");
}

- (void)VTSiriEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__VTCoreSpeechKeepAliveHandler_VTSiriEnabledMonitor_didReceiveEnabled___block_invoke;
  v5[3] = &unk_24C7F4D98;
  v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)_enableCoreSpeechDaemonKeepAlive
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[VTCoreSpeechKeepAliveHandler _coreSpeechDaemonKeepAlived](self, "_coreSpeechDaemonKeepAlived"))
    return;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Library/VoiceTrigger"));

  if ((v3 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/VoiceTrigger"), 1, 0, &v13);
  v6 = v13;

  if (v5)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "createFileAtPath:contents:attributes:", CFSTR("/var/mobile/Library/VoiceTrigger/KeepAlive"), 0, 0);

    v9 = VTLogContextFacilityVoiceTrigger;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "Successfully make CoreSpeechDaemon as KeepAlive", buf, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = CFSTR("/var/mobile/Library/VoiceTrigger/KeepAlive");
      _os_log_error_impl(&dword_20D965000, v9, OS_LOG_TYPE_ERROR, "Failed to make CoreSpeechDaemon as KeepAlive : Cannot create file at %{public}@", buf, 0xCu);
    }
    return;
  }
  v10 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    objc_msgSend(v6, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = CFSTR("/var/mobile/Library/VoiceTrigger");
    v16 = 2114;
    v17 = v12;
    _os_log_error_impl(&dword_20D965000, v11, OS_LOG_TYPE_ERROR, "Cannot create directory at : %{public}@ : %{public}@", buf, 0x16u);

  }
}

- (BOOL)_coreSpeechDaemonKeepAlived
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Library/VoiceTrigger/KeepAlive"));

  return v3;
}

- (void)_disableCoreSpeechDaemonKeepAlive
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[VTCoreSpeechKeepAliveHandler _coreSpeechDaemonKeepAlived](self, "_coreSpeechDaemonKeepAlived"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v3 = objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/var/mobile/Library/VoiceTrigger/KeepAlive"), &v6);
    v4 = v6;

    v5 = VTLogContextFacilityVoiceTrigger;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Successfully make CoreSpeechDaemon as Non-KeepAlive", buf, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v8 = CFSTR("/var/mobile/Library/VoiceTrigger/KeepAlive");
      _os_log_error_impl(&dword_20D965000, v5, OS_LOG_TYPE_ERROR, "Failed to make CoreSpeechDaemon as Non-KeepAlive : Cannot remove file %{public}@", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __71__VTCoreSpeechKeepAliveHandler_VTSiriEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = +[VTUtilities isNano](VTUtilities, "isNano");
  if ((_DWORD)result)
  {
    v3 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
      return objc_msgSend(v3, "_enableCoreSpeechDaemonKeepAlive");
    else
      return objc_msgSend(v3, "_disableCoreSpeechDaemonKeepAlive");
  }
  return result;
}

uint64_t __60__VTCoreSpeechKeepAliveHandler_voiceTriggerPolicyDidChange___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "_voiceTriggerPolicyEnabled");
  else
    return objc_msgSend(v2, "_voiceTriggerPolicyDisabled");
}

void __37__VTCoreSpeechKeepAliveHandler_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int *v7;
  NSObject *v8;
  int *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD handler[4];
  id v14;
  id location;

  if (+[VTUtilities isNano](VTUtilities, "isNano"))
  {
    +[VTSiriEnabledMonitor sharedInstance](VTSiriEnabledMonitor, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObserver:", *(_QWORD *)(a1 + 32));

    +[VTSiriEnabledMonitor sharedInstance](VTSiriEnabledMonitor, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEnabled");

    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "_enableCoreSpeechDaemonKeepAlive");
      goto LABEL_6;
    }
  }
  else
  {
    v5 = *(void **)(a1 + 32);
  }
  objc_msgSend(v5, "_disableCoreSpeechDaemonKeepAlive");
LABEL_6:
  if (+[VTUtilities supportBargeIn](VTUtilities, "supportBargeIn"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (int *)(v6 + 8);
    if (*(_DWORD *)(v6 + 8) == -1)
    {
      v8 = *(NSObject **)(v6 + 16);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_2;
      handler[3] = &unk_24C7F41F8;
      objc_copyWeak(&v14, &location);
      notify_register_dispatch("com.apple.coreaudio.speaker.active", v7, v8, handler);
      objc_destroyWeak(&v14);
      v6 = *(_QWORD *)(a1 + 32);
    }
    v9 = (int *)(v6 + 12);
    if (*(_DWORD *)(v6 + 12) == -1)
    {
      v10 = *(NSObject **)(v6 + 16);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_3;
      v11[3] = &unk_24C7F41F8;
      objc_copyWeak(&v12, &location);
      notify_register_dispatch("com.apple.coreaudio.speaker.inactive", v9, v10, v11);
      objc_destroyWeak(&v12);
    }
    objc_destroyWeak(&location);
  }
}

void __37__VTCoreSpeechKeepAliveHandler_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSpeakerInactivated");

}

@end
