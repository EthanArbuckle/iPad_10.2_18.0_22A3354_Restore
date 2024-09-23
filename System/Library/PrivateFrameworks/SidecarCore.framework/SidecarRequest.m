@implementation SidecarRequest

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("cancelled"), CFSTR("data"), CFSTR("devices"), CFSTR("error"), CFSTR("finished"), CFSTR("items"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SidecarRequest;
    v6 = objc_msgSendSuper2(&v8, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v6;
}

- (SidecarRequest)initWithService:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  SidecarRequest *v8;
  SidecarRequest *v9;
  _QWORD v11[4];
  SidecarRequest *v12;
  id v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SidecarRequest;
  v8 = -[SidecarRequest init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__SidecarRequest_initWithService_device___block_invoke;
    v11[3] = &unk_24E5E0C20;
    v12 = v8;
    v13 = v7;
    v14 = v6;
    SidecarTransferLocked((os_unfair_lock_s *)v12, v11);

  }
  return v9;
}

- (SidecarRequest)initWithSession:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  SidecarRequest *v8;
  SidecarRequest *v9;
  _QWORD v11[4];
  SidecarRequest *v12;
  id v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SidecarRequest;
  v8 = -[SidecarRequest init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__SidecarRequest_initWithSession_message___block_invoke;
    v11[3] = &unk_24E5E0C20;
    v12 = v8;
    v13 = v6;
    v14 = v7;
    SidecarTransferLocked((os_unfair_lock_s *)v12, v11);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  SidecarRequestDisconnectSession(self);
  v3.receiver = self;
  v3.super_class = (Class)SidecarRequest;
  -[SidecarRequest dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarRequest uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 0;
  v9[1] = 0;
  objc_msgSend(v6, "getUUIDBytes:", v9);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%lX>"), v5, bswap32(v9[0]));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSProgress)progress
{
  NSProgress *progress;
  NSProgress *v4;
  NSProgress *v5;

  progress = self->_progress;
  if (!progress)
  {
    objc_msgSend(MEMORY[0x24BDD1768], "discreteProgressWithTotalUnitCount:", -1);
    v4 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    v5 = self->_progress;
    self->_progress = v4;

    -[NSProgress setCancellable:](self->_progress, "setCancellable:", 0);
    -[NSProgress setPausable:](self->_progress, "setPausable:", 0);
    progress = self->_progress;
  }
  return progress;
}

- (SidecarService)service
{
  return self->_service;
}

- (BOOL)didStart
{
  int64_t v2;

  v2 = atomic_load((unint64_t *)&self->_state);
  return v2 > 0;
}

- (BOOL)isCancelled
{
  unint64_t v2;

  v2 = atomic_load((unint64_t *)&self->_state);
  return v2 == 5;
}

- (BOOL)isFinished
{
  int64_t v2;

  v2 = atomic_load((unint64_t *)&self->_state);
  return v2 > 3;
}

- (SidecarDevice)device
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__103;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __24__SidecarRequest_device__block_invoke;
  v4[3] = &unk_24E5E0C48;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SidecarDevice *)v2;
}

- (NSArray)devices
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__103;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__SidecarRequest_devices__block_invoke;
  v4[3] = &unk_24E5E0C48;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (void)setDevices:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  SidecarRequest *v8;
  uint64_t v9;
  SidecarRequest *v10;

  v4 = a3;
  -[SidecarRequest devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v4, "copy");

    v9 = MEMORY[0x24BDAC760];
    v10 = self;
    v4 = v7;
    v8 = self;
    -[SidecarRequest willChangeValueForKey:](v8, "willChangeValueForKey:", CFSTR("devices"), v9, 3221225472, __29__SidecarRequest_setDevices___block_invoke, &unk_24E5E1640, v10, v4);
    __29__SidecarRequest_setDevices___block_invoke((uint64_t)&v9);
    -[SidecarRequest didChangeValueForKey:](v8, "didChangeValueForKey:", CFSTR("devices"));

  }
}

- (NSArray)items
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__103;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __23__SidecarRequest_items__block_invoke;
  v4[3] = &unk_24E5E0C48;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (void)setItems:(id)a3
{
  id v4;
  SidecarRequest *v5;
  id v6;
  uint64_t v7;
  SidecarRequest *v8;
  id v9;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = self;
  v9 = v4;
  v5 = self;
  v6 = v4;
  -[SidecarRequest willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("items"), v7, 3221225472, __27__SidecarRequest_setItems___block_invoke, &unk_24E5E1640, v8, v9);
  __27__SidecarRequest_setItems___block_invoke((uint64_t)&v7);
  -[SidecarRequest didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("items"));

}

- (NSData)data
{
  void *v2;
  void *v3;
  void *v4;

  -[SidecarRequest items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NSString)uniformTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SidecarRequest items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSError)error
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__103;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __23__SidecarRequest_error__block_invoke;
  v4[3] = &unk_24E5E0C48;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

- (void)setError:(id)a3
{
  if (a3)
    SidecarRequestFinish(self, a3);
}

- (NSString)localizedDescription
{
  return (NSString *)&stru_24E5E1A30;
}

- (NSString)localizedItemName
{
  return (NSString *)&stru_24E5E1A30;
}

- (void)cancel
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x24BDD1540]);
  v4 = (id)objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
  -[SidecarRequest setError:](self, "setError:", v4);

}

- (SidecarSession)session
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__103;
  v9 = __Block_byref_object_dispose__104;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__SidecarRequest_session__block_invoke;
  v4[3] = &unk_24E5E0C48;
  v4[4] = self;
  v4[5] = &v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SidecarSession *)v2;
}

- (void)start
{
  -[SidecarRequest startWithTransport:](self, "startWithTransport:", 0);
}

- (void)startWithTransport:(int64_t)a3
{
  -[SidecarRequest startWithTransport:reconnectToRequest:](self, "startWithTransport:reconnectToRequest:", a3, 0);
}

- (void)startWithTransport:(int64_t)a3 reconnectToRequest:(id)a4
{
  NSObject *v4;
  id v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  os_unfair_lock_s *v14;
  uint64_t *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  SidecarRequest *v30;
  __int16 v31;
  os_unfair_lock_s *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (os_unfair_lock_s *)&v23;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__103;
  v27 = __Block_byref_object_dispose__104;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__103;
  v21 = __Block_byref_object_dispose__104;
  v22 = 0;
  if ((SidecarRequestSetState(self, 1) & 1) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke;
  v16[3] = &unk_24E5E0C48;
  v16[4] = self;
  v16[5] = &v23;
  SidecarTransferLocked((os_unfair_lock_s *)self, v16);
  if (v7)
  {
    v10 = v9;
    v11 = 3221225472;
    v12 = __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke_2;
    v13 = &unk_24E5E0C48;
    v15 = &v17;
    v8 = (os_unfair_lock_s *)v7;
    v14 = v8;
    SidecarTransferLocked(v8, &v10);
    if (v18[5])
    {
LABEL_6:

      goto LABEL_7;
    }
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_5:

      goto LABEL_6;
    }
LABEL_9:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_220044000, v4, OS_LOG_TYPE_ERROR, "%{public}@ reconnecting to %{public}@ with nil session", buf, 0x16u);
    }
    goto LABEL_5;
  }
LABEL_7:
  objc_msgSend((id)v24[5], "connectWithTransport:reconnectToSession:", a3, v18[5], v10, v11, v12, v13);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

- (void)sendItems:(id)a3 complete:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SidecarRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[6];
  id v15;
  uint64_t v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a4;
  v6 = a3;
  v7 = self;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__103;
  v22 = __Block_byref_object_dispose__104;
  v23 = 0;
  -[SidecarRequest session](v7, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarRequest uuid](v7, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __SidecarRequestCreateSendTransfer_block_invoke;
  v17[3] = &unk_24E5E0CE0;
  v17[4] = v7;
  v17[5] = v9;
  v17[6] = v8;
  v17[7] = &v18;
  SidecarTransferLocked((os_unfair_lock_s *)v7, v17);
  if (v4)
    v11 = 4;
  else
    v11 = 3;
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __37__SidecarRequest_sendItems_complete___block_invoke;
  v14[3] = &unk_24E5E0C70;
  v14[4] = v7;
  v14[5] = v12;
  v15 = v6;
  v16 = v11;
  v13 = v6;
  SidecarTransferLocked((os_unfair_lock_s *)v7, v14);

}

- (void)sendItems:(id)a3
{
  -[SidecarRequest sendItems:complete:](self, "sendItems:complete:", a3, 0);
}

- (void)_sendMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SidecarRequest session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  SidecarRequestSendMessage(self, v5, (uint64_t)v4);

}

- (void)sidecarTransfer:(id)a3 didComplete:(id)a4
{
  id v6;
  id v7;
  SidecarRequest *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = v6;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__103;
  v17 = __Block_byref_object_dispose__104;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __SidecarRequestTransferCompleted_block_invoke;
  v12[3] = &unk_24E5E0D30;
  v12[4] = v8;
  v12[5] = v9;
  v12[6] = &v13;
  SidecarTransferLocked((os_unfair_lock_s *)v8, v12);
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  if (!v10 || (v11 = objc_msgSend(v10, "type"), v7) || v11 == 4)
    SidecarRequestFinish(v8, v7);

}

- (void)sidecarTransfer:(id)a3 receivedItems:(id)a4 messageType:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = v7;
  if (a5 == 4)
  {
    -[SidecarRequest setItems:](self, "setItems:", v7);
  }
  else
  {
    -[SidecarRequest delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "sidecarRequest:receivedItems:", self, v9);

  }
}

- (void)_willConnect
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[SidecarRequest _registerStreamListeners](self, "_registerStreamListeners");
  -[SidecarRequest service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutableRequestMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SidecarRequest uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 0;
  v8[1] = 0;
  objc_msgSend(v5, "getUUIDBytes:", v8);
  v6 = bswap32(v8[0]);

  SidecarMessageSetRequestID(v4, v6);
  -[SidecarRequest session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SidecarRequestSendMessage(self, v7, (uint64_t)v4);

}

- (void)sidecarSessionStarted:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SidecarRequest session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SidecarRequest _willConnect](self, "_willConnect");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__SidecarRequest_sidecarSessionStarted___block_invoke;
    v8[3] = &unk_24E5E1578;
    v8[4] = self;
    SidecarTransferLocked((os_unfair_lock_s *)self, v8);
  }
  else
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_220044000, v7, OS_LOG_TYPE_ERROR, "unexpected session %{public}@", buf, 0xCu);
    }

  }
}

- (void)sidecarSession:(id)a3 receivedMessage:(id)a4
{
  id v6;
  id v7;
  uint64_t Type;
  id v9;
  SidecarRequest *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE buf[24];
  void *v30;
  SidecarRequest *v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Type = SidecarMessageGetType(v7);
  if ((unint64_t)(Type - 1) >= 4)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SidecarErrorDomain"), -1010, 0);
    if (v9)
    {
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "domain");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "code");
        objc_msgSend(v9, "localizedDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2113;
        v30 = v22;
        _os_log_impl(&dword_220044000, v19, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

      }
    }

    -[SidecarRequest setError:](self, "setError:", v9);
  }
  else
  {
    if (Type == 4)
    {
      self->_timeTransfer = SidecarAbsoluteTime();
    }
    else if (Type == 2)
    {
      self->_timeAccept = SidecarAbsoluteTime();
      goto LABEL_10;
    }
    if (SidecarMessageGetTransferID(v7))
    {
      v10 = self;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__103;
      v27 = __Block_byref_object_dispose__104;
      v28 = 0;
      -[SidecarRequest uuid](v10, "uuid", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v11, "getUUIDBytes:", buf);
      v12 = buf[0];
      v13 = buf[1];
      v14 = buf[2];
      v15 = buf[3];

      -[SidecarRequest session](v10, "session");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __SidecarRequestEnsureTransferReceiver_block_invoke;
      v30 = &unk_24E5E0D58;
      v31 = v10;
      v32 = v16;
      v33 = &v23;
      v34 = (v12 << 24) | (v13 << 16) | (v14 << 8) | v15;
      SidecarTransferLocked((os_unfair_lock_s *)v10, buf);
      v17 = (id)v24[5];

      _Block_object_dispose(&v23, 8);
      objc_msgSend(v17, "handleMessage:", v7);

    }
  }
LABEL_10:

}

- (void)sidecarSession:(id)a3 closedWithError:(id)a4
{
  _QWORD *v6;
  id v7;
  _QWORD *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SidecarRequest session](self, "session");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    SidecarRequestFinish(self, v7);
  }
  else
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = v6[7];
      v12 = 134217984;
      v13 = v11;
      _os_log_impl(&dword_220044000, v10, OS_LOG_TYPE_ERROR, "unexpected session[%lX]", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (id)sessionForDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[SidecarRequest session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (SidecarRequestDelegate)delegate
{
  return (SidecarRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SidecarMessage)message
{
  return self->_message;
}

- (double)timeStart
{
  return self->_timeStart;
}

- (void)setTimeStart:(double)a3
{
  self->_timeStart = a3;
}

- (double)timeAccept
{
  return self->_timeAccept;
}

- (void)setTimeAccept:(double)a3
{
  self->_timeAccept = a3;
}

- (double)timeTransfer
{
  return self->_timeTransfer;
}

- (void)setTimeTransfer:(double)a3
{
  self->_timeTransfer = a3;
}

- (double)timeFinish
{
  return self->_timeFinish;
}

- (void)setTimeFinish:(double)a3
{
  self->_timeFinish = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sendTransfers, 0);
  objc_storeStrong((id *)&self->_transferReceiver, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sessionZombie, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_devices_deprecated, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __40__SidecarRequest_sidecarSessionStarted___block_invoke(uint64_t a1)
{
  unsigned int *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void **AssociatedObject;
  void **v7;
  void **v8;
  void *v9;
  void *v10;
  unsigned int *v11;
  unsigned int *v12;
  int v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[6];
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v2 = 0;
  v26 = *MEMORY[0x24BDAC8D0];
  v3 = SidecarRequestTransferEnqueue;
  v4 = MEMORY[0x24BDAC760];
  while (1)
  {
    v5 = *(id *)(a1 + 32);
    AssociatedObject = (void **)objc_getAssociatedObject(v5, SidecarRequestTransferEnqueue);
    if (AssociatedObject)
    {
      v7 = AssociatedObject;
      v8 = (void **)*AssociatedObject;
      if (!v8)
        goto LABEL_25;
      v10 = *v8;
      v9 = v8[1];
      *v7 = v9;
      if (!v9)
        v7[1] = v7;
      free(v8);
      if (!*v7)
        _SidecarAssociatedQueueDealloc(v5, SidecarRequestTransferEnqueue, v7);
    }
    else
    {
      v10 = 0;
    }

    if (!v10)
      break;
    v11 = v10;
    v2 = v11;
    v12 = v11 + 10;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (v13 == 1)
    {
      v14 = v11;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v23 = __Block_byref_object_copy__60;
      v24 = __Block_byref_object_dispose__61;
      v25 = 0;
      v21[0] = v4;
      v21[1] = 3221225472;
      v21[2] = __SidecarTransferDequeueMessages_block_invoke;
      v21[3] = &unk_24E5E0C48;
      v21[4] = v14;
      v21[5] = buf;
      SidecarTransferLocked(v14, v21);
      v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v15)
        (*(void (**)(void))(v15 + 16))();
      _Block_object_dispose(buf, 8);

    }
    else if (v13 <= 0)
    {
LABEL_25:
      __break(1u);
LABEL_26:
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = atomic_load((unint64_t *)(v19 + 112));
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_220044000, v3, OS_LOG_TYPE_ERROR, "%{public}@: set state failed (%ld)", buf, 0x16u);
      }
      goto LABEL_24;
    }

  }
  v16 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 112);
  v17 = atomic_load(v16);
  if (v17 <= 1)
  {
    while (1)
    {
      v18 = __ldaxr(v16);
      if (v18 != v17)
        break;
      if (!__stlxr(2uLL, v16))
        return;
    }
    __clrex();
  }
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_26;
LABEL_24:

}

unsigned int *__37__SidecarRequest_sendItems_complete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int *result;
  unsigned int *v4;
  unsigned int v5;

  v2 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 112));
  if (v2 > 1)
    return (unsigned int *)objc_msgSend(*(id *)(a1 + 40), "sendItems:messageType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  result = (unsigned int *)*(id *)(a1 + 40);
  v4 = result + 10;
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  if (v5 != 0x7FFFFFFF)
  {

    SidecarRequestTransferEnqueue(*(void **)(a1 + 32), *(void **)(a1 + 40));
    return (unsigned int *)objc_msgSend(*(id *)(a1 + 40), "sendItems:messageType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  __break(1u);
  return result;
}

void __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  *(double *)(*(_QWORD *)(a1 + 32) + 120) = SidecarAbsoluteTime();
}

void __56__SidecarRequest_startWithTransport_reconnectToRequest___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

void __25__SidecarRequest_session__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

void __23__SidecarRequest_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

void __27__SidecarRequest_setItems___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__SidecarRequest_setItems___block_invoke_2;
  v4[3] = &unk_24E5E1640;
  v1 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v2 = v1;
  v3 = v5;
  objc_msgSend(v3, "willChangeValueForKey:", CFSTR("data"), v4[0], 3221225472, __27__SidecarRequest_setItems___block_invoke_2, &unk_24E5E1640, v5, v2);
  __27__SidecarRequest_setItems___block_invoke_2((uint64_t)v4);
  objc_msgSend(v3, "didChangeValueForKey:", CFSTR("data"));

}

void __27__SidecarRequest_setItems___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__SidecarRequest_setItems___block_invoke_3;
  v4[3] = &unk_24E5E1640;
  v1 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v2 = v1;
  v3 = v5;
  objc_msgSend(v3, "willChangeValueForKey:", CFSTR("uniformTypeIdentifier"), v4[0], 3221225472, __27__SidecarRequest_setItems___block_invoke_3, &unk_24E5E1640, v5, v2);
  __27__SidecarRequest_setItems___block_invoke_3((uint64_t)v4);
  objc_msgSend(v3, "didChangeValueForKey:", CFSTR("uniformTypeIdentifier"));

}

void __27__SidecarRequest_setItems___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  os_unfair_lock_s *v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __27__SidecarRequest_setItems___block_invoke_4;
  v2[3] = &unk_24E5E1640;
  v1 = *(void **)(a1 + 40);
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  v4 = v1;
  SidecarTransferLocked(v3, v2);

}

void __27__SidecarRequest_setItems___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

void __23__SidecarRequest_items__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __29__SidecarRequest_setDevices___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  os_unfair_lock_s *v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __29__SidecarRequest_setDevices___block_invoke_2;
  v2[3] = &unk_24E5E1640;
  v1 = *(void **)(a1 + 40);
  v3 = *(os_unfair_lock_s **)(a1 + 32);
  v4 = v1;
  SidecarTransferLocked(v3, v2);

}

void __29__SidecarRequest_setDevices___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < 2)
    v5 = 0;
  else
    v5 = *(void **)(a1 + 40);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v5);
}

void __25__SidecarRequest_devices__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 32);
    if (v5)
    {
      v6[0] = v5;
      v4 = 1;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
      v3 = (void *)MEMORY[0x24BDBD1A8];
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v4)

}

void __24__SidecarRequest_device__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void __42__SidecarRequest_initWithSession_message___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int RequestID;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[4];
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "device");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "service");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  RequestID = SidecarMessageGetRequestID(*(void **)(a1 + 48));
  v12[0] = HIBYTE(RequestID);
  v12[1] = BYTE2(RequestID);
  v12[2] = BYTE1(RequestID);
  v12[3] = RequestID;
  v13 = -1;
  v14 = -1;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v12);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 152);
  *(_QWORD *)(v10 + 152) = v9;

}

void __41__SidecarRequest_initWithService_device___block_invoke(uint64_t a1)
{
  SidecarSession *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  SidecarSession *v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 48));
  v2 = -[SidecarSession initWithService:device:]([SidecarSession alloc], "initWithService:device:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;
  v8 = v2;

  -[SidecarSession uuid](v8, "uuid");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v5;

  -[SidecarSession setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)_registerStreamListeners
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(self, &_SidecarRequestStreamRegistrations);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
          -[SidecarRequest session](self, "session");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    objc_setAssociatedObject(self, &_SidecarRequestStreamRegistrations, 0, (void *)0x301);
  }

}

- (void)listenForStreamType:(int64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[SidecarRequest listenForStreamType:flags:identifier:processUniqueID:completion:](self, "listenForStreamType:flags:identifier:processUniqueID:completion:", a3, 0, v9, SidecarGetProcessUniqueID(), v8);

}

- (void)listenForStreamType:(int64_t)a3 identifier:(id)a4 processUniqueID:(unint64_t)a5 completion:(id)a6
{
  -[SidecarRequest listenForStreamType:flags:identifier:processUniqueID:completion:](self, "listenForStreamType:flags:identifier:processUniqueID:completion:", a3, 0, a4, a5, a6);
}

- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;

  v12 = a5;
  v13 = a7;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __98__SidecarRequest_SidecarStreams__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke;
  v20[3] = &unk_24E5E1698;
  v23 = a3;
  v24 = a4;
  v14 = v12;
  v21 = v14;
  v25 = a6;
  v15 = v13;
  v22 = v15;
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207DCAD0](v20);
  if (-[SidecarRequest didStart](self, "didStart"))
  {
    -[SidecarRequest session](self, "session");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v16)[2](v16, v17);
  }
  else
  {
    objc_getAssociatedObject(self, &_SidecarRequestStreamRegistrations);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_setAssociatedObject(self, &_SidecarRequestStreamRegistrations, v17, (void *)0x301);
    }
    v18 = (void *)objc_msgSend(v16, "copy");
    v19 = (void *)MEMORY[0x2207DCAD0]();
    objc_msgSend(v17, "addObject:", v19);

  }
}

- (void)openStreamForType:(int64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[SidecarRequest openStreamForType:flags:identifier:processUniqueID:completion:](self, "openStreamForType:flags:identifier:processUniqueID:completion:", a3, 0, v9, SidecarGetProcessUniqueID(), v8);

}

- (void)openStreamForType:(int64_t)a3 identifier:(id)a4 processUniqueID:(unint64_t)a5 completion:(id)a6
{
  -[SidecarRequest openStreamForType:flags:identifier:processUniqueID:completion:](self, "openStreamForType:flags:identifier:processUniqueID:completion:", a3, 0, a4, a5, a6);
}

- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  v13 = (void (**)(id, _QWORD, void *))a7;
  -[SidecarRequest session](self, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "openStreamForType:flags:identifier:processUniqueID:completion:", a3, a4, v17, a6, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SidecarErrorDomain"), -1020, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SidecarCoreLogObjCAPIError(self, a2, v16);
    v13[2](v13, 0, v16);

  }
}

uint64_t __98__SidecarRequest_SidecarStreams__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "listenForStreamType:flags:identifier:processUniqueID:completion:", a1[6], a1[7], a1[4], a1[8], a1[5]);
}

@end
