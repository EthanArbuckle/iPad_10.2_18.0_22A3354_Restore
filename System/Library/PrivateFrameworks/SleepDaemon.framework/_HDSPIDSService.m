@implementation _HDSPIDSService

- (_HDSPIDSService)initWithIsCloudService:(BOOL)a3 scheduler:(id)a4
{
  _BOOL4 v5;
  id v7;
  _HDSPIDSService *v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  IDSService *service;
  _HDSPIDSService *v13;
  objc_super v15;

  v5 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_HDSPIDSService;
  v8 = -[_HDSPIDSService init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE4FCB8]);
    if (v5)
      v10 = CFSTR("com.apple.private.alloy.avconference.avctester");
    else
      v10 = CFSTR("com.apple.private.alloy.sleep.classd");
    v11 = objc_msgSend(v9, "initWithService:", v10);
    service = v8->_service;
    v8->_service = (IDSService *)v11;

    v8->_isCloudService = v5;
    objc_storeStrong((id *)&v8->_scheduler, a4);
    v13 = v8;
  }

  return v8;
}

- (id)_loggingDescription
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self->_isCloudService)
    v5 = CFSTR("cloud");
  else
    v5 = CFSTR("local");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
}

- (void)setDelegate:(id)a3
{
  IDSService *service;
  id v5;

  objc_storeWeak((id *)&self->_delegate, a3);
  service = self->_service;
  -[HKSPQueueBackedScheduler queue](self->_scheduler, "queue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService addDelegate:queue:](service, "addDelegate:queue:", self, v5);

}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[_HDSPIDSService _loggingDescription](self, "_loggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v9;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending message %{public}@", buf, 0x16u);

  }
  v10 = objc_alloc_init(MEMORY[0x24BEA9880]);
  v17 = 0;
  v11 = objc_msgSend(v10, "serialize:error:", v6, &v17);
  v12 = v17;
  if (v11)
  {
    objc_msgSend(v10, "serializedDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HDSPIDSService _sendSerializedMessage:identifier:completion:](self, "_sendSerializedMessage:identifier:completion:", v13, v14, v7);

  }
  else
  {
    HKSPLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[_HDSPIDSService _loggingDescription](self, "_loggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v6;
      v22 = 2114;
      v23 = v12;
      _os_log_error_impl(&dword_21610C000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] failed to serialize message %{public}@ with error %{public}@", buf, 0x20u);

    }
    v7[2](v7, 0, v12);
  }

}

- (void)_sendSerializedMessage:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSPQueueBackedScheduler *scheduler;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  scheduler = self->_scheduler;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64___HDSPIDSService__sendSerializedMessage_identifier_completion___block_invoke;
  v15[3] = &unk_24D4E5E38;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  -[HKSPQueueBackedScheduler performBlock:](scheduler, "performBlock:", v15);

}

- (id)_localDestinations
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4F9C8]);
}

- (id)_cloudDestinations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IDSService devices](self->_service, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_206_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSString *v14;
  Class v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[_HDSPIDSService _loggingDescription](self, "_loggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] received incoming message %{public}@", buf, 0x16u);

  }
  v11 = objc_alloc(MEMORY[0x24BEA9878]);
  +[HDSPIDSServiceManager _allowedMessageClasses](HDSPIDSServiceManager, "_allowedMessageClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithAllowedClasses:serializedDictionary:", v12, v8);

  objc_msgSend(v8, "hksp_serializedClassName");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = NSClassFromString(v14);

  v20 = 0;
  objc_msgSend(v13, "deserializeObjectOfClass:error:", v15, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  if (v16)
  {
    -[_HDSPIDSService delegate](self, "delegate");
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject service:didReceiveMessage:](v18, "service:didReceiveMessage:", self, v16);
  }
  else
  {
    HKSPLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[_HDSPIDSService _loggingDescription](self, "_loggingDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      v23 = 2114;
      v24 = v17;
      _os_log_error_impl(&dword_21610C000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] failed to deserialize incoming message with error %{public}@", buf, 0x16u);

    }
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v9;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v9 = a6;
  v22 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a7;
  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v9)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    -[_HDSPIDSService _loggingDescription](self, "_loggingDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v15;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_21610C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] failed to send message %{public}@ with error %{public}@", (uint8_t *)&v16, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[_HDSPIDSService _loggingDescription](self, "_loggingDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v15;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully sent message %{public}@", (uint8_t *)&v16, 0x16u);
LABEL_4:

  }
LABEL_6:

}

- (BOOL)isCloudService
{
  return self->_isCloudService;
}

- (HDSPIDSServiceDelegate)delegate
{
  return (HDSPIDSServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
