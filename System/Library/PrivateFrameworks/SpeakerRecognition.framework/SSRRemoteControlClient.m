@implementation SSRRemoteControlClient

- (SSRRemoteControlClient)initWithRemoteDeviceUUID:(id)a3
{
  id v4;
  SSRRemoteControlClient *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  CSDispatchGroup *v8;
  CSDispatchGroup *deviceWaitingGroup;
  OS_dispatch_queue *v10;
  void *v11;
  uint64_t v12;
  OS_remote_device *device;
  NSObject *v14;
  SSRRemoteControlClient *v15;
  NSObject *v16;
  id v18[5];
  id v19;
  id location;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE28488], "isDarwinOS") & 1) != 0)
  {
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  if (!v4)
  {
    v16 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[SSRRemoteControlClient initWithRemoteDeviceUUID:]";
      _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s invalid remote deviceUUIDString", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v21.receiver = self;
  v21.super_class = (Class)SSRRemoteControlClient;
  v5 = -[SSRRemoteControlClient init](&v21, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("SSRRemoteControlClient", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = (CSDispatchGroup *)objc_alloc_init(MEMORY[0x24BE28408]);
    deviceWaitingGroup = v5->_deviceWaitingGroup;
    v5->_deviceWaitingGroup = v8;

    objc_initWeak(&location, v5);
    v10 = v5->_queue;
    v26[0] = 0;
    v26[1] = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v4);
    objc_msgSend(v11, "getUUIDBytes:", v26);
    v12 = remote_device_copy_device_with_uuid();
    device = v5->_device;
    v5->_device = (OS_remote_device *)v12;

    -[CSDispatchGroup enter](v5->_deviceWaitingGroup, "enter");
    v18[1] = (id)MEMORY[0x24BDAC760];
    v18[2] = (id)3221225472;
    v18[3] = __51__SSRRemoteControlClient_initWithRemoteDeviceUUID___block_invoke;
    v18[4] = &unk_24CC85270;
    objc_copyWeak(&v19, &location);
    remote_device_set_connected_callback();
    objc_copyWeak(v18, &location);
    remote_device_set_disconnected_callback();
    v14 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[SSRRemoteControlClient initWithRemoteDeviceUUID:]";
      v24 = 2114;
      v25 = v4;
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating remoteControlClient for deviceUUID %{public}@", buf, 0x16u);
    }
    objc_destroyWeak(v18);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  self = v5;
  v15 = self;
LABEL_11:

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SSRRemoteControlClient dealloc]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc of SSRRemoteControlClient, it should close connection", buf, 0xCu);
  }
  if (self->_connection)
    xpc_remote_connection_cancel();
  if (self->_device)
    remote_device_cancel();
  v4.receiver = self;
  v4.super_class = (Class)SSRRemoteControlClient;
  -[SSRRemoteControlClient dealloc](&v4, sel_dealloc);
}

- (void)didDeviceConnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  SSRRemoteControlClient *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SSRRemoteControlClient didDeviceConnect:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SSRRemoteControlClient_didDeviceConnect___block_invoke;
  v8[3] = &unk_24CC85EE8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)didDeviceDisconnect:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SSRRemoteControlClient didDeviceDisconnect:]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SSRRemoteControlClient_didDeviceDisconnect___block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)waitingForConnection:(double)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = -[CSDispatchGroup waitWithTimeout:](self->_deviceWaitingGroup, "waitWithTimeout:", dispatch_time(0, (uint64_t)(a3 * 1000000000.0)));
  if (!v7)
  {
    if (-[SSRRemoteControlClient isConnected](self, "isConnected"))
    {
      v10 = 1;
      return !v7 && v10;
    }
    v11 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[SSRRemoteControlClient waitingForConnection:error:]";
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s Device is connected but RemoteXPC service is not connected", (uint8_t *)&v14, 0xCu);
      if (!a4)
        goto LABEL_14;
    }
    else if (!a4)
    {
      goto LABEL_14;
    }
    v9 = 1003;
    goto LABEL_10;
  }
  v8 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_FAULT))
  {
    v14 = 136315394;
    v15 = "-[SSRRemoteControlClient waitingForConnection:error:]";
    v16 = 2050;
    v17 = a3;
    _os_log_fault_impl(&dword_2117D4000, v8, OS_LOG_TYPE_FAULT, "%s Device connection waiting %{public}.3f seconds timed out", (uint8_t *)&v14, 0x16u);
    if (a4)
      goto LABEL_4;
  }
  else if (a4)
  {
LABEL_4:
    v9 = 1002;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), v9, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    *a4 = v12;
    return !v7 && v10;
  }
LABEL_14:
  v10 = 0;
  return !v7 && v10;
}

- (BOOL)isConnected
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__SSRRemoteControlClient_isConnected__block_invoke;
  v5[3] = &unk_24CC864E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_handleServerEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (MEMORY[0x212BE1BA4](v4) == MEMORY[0x24BDACFB8])
    {
      v5 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v7 = 136315138;
        v8 = "-[SSRRemoteControlClient _handleServerEvent:]";
        _os_log_error_impl(&dword_2117D4000, v5, OS_LOG_TYPE_ERROR, "%s remoteXPC connection get failed", (uint8_t *)&v7, 0xCu);
      }
      -[SSRRemoteControlClient _handleServerError:](self, "_handleServerError:", v4);
    }
  }
  else
  {
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[SSRRemoteControlClient _handleServerEvent:]";
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s cannot handle server event since event is nil", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)_handleServerError:(id)a3
{
  id v4;
  NSObject *v6;
  const char *string;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (v4 == (id)MEMORY[0x24BDACF38] || v4 == (id)MEMORY[0x24BDACF30])
    {
      v6 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[SSRRemoteControlClient _handleServerError:]";
        _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s connection disconnected", (uint8_t *)&v10, 0xCu);
      }
      if (self->_device)
        remote_device_cancel();
    }
    else
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x24BDACF40]);
      v8 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v10 = 136315394;
        v11 = "-[SSRRemoteControlClient _handleServerError:]";
        v12 = 2082;
        v13 = string;
        _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v10, 0x16u);
      }
    }
  }

}

- (void)addImplicitTrainingUtteranceToRemoteFilePath:(id)a3 forVoiceProfileId:(id)a4 withVoiceTriggerCtxt:(id)a5 locale:(id)a6 withOtherCtxt:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  os_log_t *v20;
  NSObject *v21;
  void *v22;
  NSObject *queue;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  objc_msgSend(v13, "lastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("VoiceTrigger/SAT_implicit/audio/"), "stringByAppendingPathComponent:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (os_log_t *)MEMORY[0x24BE284B8];
  v21 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v37 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt:l"
          "ocale:withOtherCtxt:completion:]";
    v38 = 2114;
    v39 = v13;
    v40 = 2114;
    v41 = v14;
    _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@, voiceProfileId %{public}@", buf, 0x20u);
  }
  if (v13 && v19)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "fileExistsAtPath:", v13) & 1) != 0)
    {
      if (v16)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke;
        block[3] = &unk_24CC84F18;
        block[4] = self;
        v30 = v14;
        v31 = v16;
        v35 = v17;
        v32 = v15;
        v33 = v19;
        v34 = v13;
        dispatch_async(queue, block);

LABEL_17:
        goto LABEL_18;
      }
      v27 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCt"
              "xt:locale:withOtherCtxt:completion:]";
        _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s Invalid locale", buf, 0xCu);
        if (!v17)
          goto LABEL_17;
      }
      else if (!v17)
      {
        goto LABEL_17;
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = &unk_24CC99F28;
    }
    else
    {
      v24 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCt"
              "xt:locale:withOtherCtxt:completion:]";
        v38 = 2114;
        v39 = v13;
        _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s File does not exists : %{public}@", buf, 0x16u);
        if (!v17)
          goto LABEL_17;
      }
      else if (!v17)
      {
        goto LABEL_17;
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = &unk_24CC99F00;
    }
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 113, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v17 + 2))(v17, v28);

    goto LABEL_17;
  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 113, &unk_24CC99ED8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v17 + 2))(v17, v22);
    goto LABEL_17;
  }
LABEL_18:

}

- (BOOL)_isImplicitTrainingRequiredForVoiceProfileId:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  void *v11;
  uint64_t v12;
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v9)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "COMMAND", "queryImplicitTrainingRequired");
    xpc_dictionary_set_string(v10, "languageCode", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    if (v8)
      xpc_dictionary_set_string(v10, "voiceProfileId", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    if (self->_connection)
    {
      v11 = (void *)xpc_remote_connection_send_message_with_reply_sync();
      v12 = MEMORY[0x212BE1BA4]();
      v13 = (os_log_t *)MEMORY[0x24BE284B8];
      if (v11 && xpc_dictionary_get_BOOL(v11, "replyResult"))
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1004, &unk_24CC99FC8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          v25 = 136315138;
          v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
          _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s Failed to fetch reply", (uint8_t *)&v25, 0xCu);
        }
      }
      if (v12 == MEMORY[0x24BDACFA0])
      {
        v21 = objc_alloc(MEMORY[0x24BDBCE70]);
        objc_msgSend(v21, "_cs_initWithXPCObject:", v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isImplicitTrainingRequiredReply"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isImplicitTrainingRequiredReply"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v16) = objc_msgSend(v23, "BOOLValue");

          }
        }
        else
        {
          LOBYTE(v16) = 0;
        }

        if (!a5)
          goto LABEL_18;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1005, &unk_24CC99FF0);
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          v25 = 136315138;
          v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
          _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s Wrong reply type received", (uint8_t *)&v25, 0xCu);
        }
        LOBYTE(v16) = 0;
        v14 = (void *)v18;
        if (!a5)
          goto LABEL_18;
      }
      *a5 = objc_retainAutorelease(v14);
LABEL_18:

LABEL_32:
      goto LABEL_33;
    }
    v20 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v25 = 136315138;
      v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s attempt to send message while connection does not exsit", (uint8_t *)&v25, 0xCu);
      if (a5)
        goto LABEL_21;
    }
    else if (a5)
    {
LABEL_21:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1003, &unk_24CC9A018);
      LOBYTE(v16) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    LOBYTE(v16) = 0;
    goto LABEL_32;
  }
  v15 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v25 = 136315138;
    v26 = "-[SSRRemoteControlClient _isImplicitTrainingRequiredForVoiceProfileId:locale:error:]";
    _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s Invalid locale", (uint8_t *)&v25, 0xCu);
    if (a5)
      goto LABEL_10;
LABEL_29:
    LOBYTE(v16) = 0;
    goto LABEL_33;
  }
  if (!a5)
    goto LABEL_29;
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 113, &unk_24CC99FA0);
  LOBYTE(v16) = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return (char)v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceWaitingGroup, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  const __CFString *v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v30 = 0;
  v5 = objc_msgSend(v2, "_isImplicitTrainingRequiredForVoiceProfileId:locale:error:", v3, v4, &v30);
  v6 = v30;
  v7 = (NSObject **)MEMORY[0x24BE284B8];
  v8 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("is not");
    if (v5)
      v9 = CFSTR("is");
    *(_DWORD *)buf = 136315394;
    v32 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt:l"
          "ocale:withOtherCtxt:completion:]_block_invoke";
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Implicit training %{public}@ required", buf, 0x16u);
  }
  if ((v5 & 1) != 0)
  {
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "COMMAND", "addImplicitTrainingUtterance");
    objc_msgSend(*(id *)(a1 + 56), "_cs_xpcObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v10, "voiceTriggerEventInfo", v11);

    xpc_dictionary_set_string(v10, "filePath", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String"));
    v12 = *(void **)(a1 + 40);
    if (v12)
      xpc_dictionary_set_string(v10, "voiceProfileId", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 72)), "UTF8String");
    v13 = MEMORY[0x24BDAC760];
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_38;
    v27 = &unk_24CC84EC8;
    v28 = *(id *)(a1 + 72);
    v29 = *(id *)(a1 + 80);
    v14 = (void *)xpc_file_transfer_create_with_path();
    if (v14)
    {
      xpc_dictionary_set_value(v10, "fileTx", v14);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(NSObject **)(v15 + 8);
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_48;
      v21[3] = &unk_24CC84EF0;
      v21[4] = v15;
      v22 = v10;
      v23 = *(id *)(a1 + 80);
      dispatch_async(v16, v21);

    }
    else
    {
      v18 = *v7;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCt"
              "xt:locale:withOtherCtxt:completion:]_block_invoke";
        _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s Failed to create xpc file transfer", buf, 0xCu);
      }
      v19 = *(_QWORD *)(a1 + 80);
      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1006, &unk_24CC99F50);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);

      }
    }

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 80);
    if (v17)
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v6);
  }

}

void __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_38(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v16 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt"
            ":locale:withOtherCtxt:completion:]_block_invoke";
      v17 = 2114;
      v18 = v12;
      v19 = 1026;
      v20 = a2;
      _os_log_error_impl(&dword_2117D4000, v3, OS_LOG_TYPE_ERROR, "%s Transfer of file %{public}@ failed : %{public}d", buf, 0x1Cu);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2, CFSTR("reason"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1006, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v9);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v16 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt"
            ":locale:withOtherCtxt:completion:]_block_invoke";
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Transfer of file %{public}@ succeed", buf, 0x16u);
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }
}

void __142__SSRRemoteControlClient_addImplicitTrainingUtteranceToRemoteFilePath_forVoiceProfileId_withVoiceTriggerCtxt_locale_withOtherCtxt_completion___block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    xpc_remote_connection_send_message();
  }
  else
  {
    v2 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[SSRRemoteControlClient addImplicitTrainingUtteranceToRemoteFilePath:forVoiceProfileId:withVoiceTriggerCtxt:"
           "locale:withOtherCtxt:completion:]_block_invoke";
      _os_log_error_impl(&dword_2117D4000, v2, OS_LOG_TYPE_ERROR, "%s attempt to send message while connection does not exsit", (uint8_t *)&v5, 0xCu);
    }
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 1003, &unk_24CC99F78);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    }
  }
}

uint64_t __37__SSRRemoteControlClient_isConnected__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

void __46__SSRRemoteControlClient_didDeviceDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0;

}

void __43__SSRRemoteControlClient_didDeviceConnect___block_invoke(uint64_t a1)
{
  unsigned int type;
  void *v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _BYTE location[12];
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  type = remote_device_get_type();
  if (type == 11)
  {
    v3 = (void *)remote_device_copy_service();
    if (v3)
    {
      v4 = (void *)xpc_remote_connection_create_with_remote_service();
      objc_initWeak((id *)location, *(id *)(a1 + 40));
      objc_copyWeak(&v8, (id *)location);
      xpc_remote_connection_set_event_handler();
      xpc_remote_connection_activate();
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "leave");
      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v7 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "-[SSRRemoteControlClient didDeviceConnect:]_block_invoke";
        v10 = 2082;
        v11 = (unint64_t)"com.apple.corespeech.xpc.remote.control";
        _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s Service: %{public}s not found", location, 0x16u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "leave");
    }

  }
  else
  {
    v5 = type;
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[SSRRemoteControlClient didDeviceConnect:]_block_invoke";
      v10 = 2048;
      v11 = v5;
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s Connected to unexpected device type : %lu", location, 0x16u);
    }
  }
}

void __43__SSRRemoteControlClient_didDeviceConnect___block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleServerEvent:", v3);

}

void __51__SSRRemoteControlClient_initWithRemoteDeviceUUID___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didDeviceConnect:", v3);

}

void __51__SSRRemoteControlClient_initWithRemoteDeviceUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didDeviceDisconnect:", v3);

}

@end
