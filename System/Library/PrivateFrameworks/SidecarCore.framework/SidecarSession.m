@implementation SidecarSession

- (SidecarSession)init
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("*** initialization method -[%@] not supported with class %@"), v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (SidecarSession)initWithRemote:(id)a3 device:(id)a4 dataLink:(int)a5 service:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  SidecarSession *v16;
  int64_t v17;
  uint64_t v18;
  SidecarService *v19;
  SidecarService *service;
  SidecarService *v21;
  uint64_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  uint64_t v25;
  SidecarSession *v26;
  SidecarSession *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  SidecarSession *v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SidecarSession;
  v16 = -[SidecarSession init](&v32, sel_init);
  if (!v16)
  {
LABEL_8:
    v27 = v16;
    goto LABEL_12;
  }
  v33 = 0;
  v34 = 0;
  objc_msgSend(v13, "getUUIDBytes:", &v33);
  v17 = bswap32(v33);
  +[SidecarService serviceWithIdentifier:](SidecarService, "serviceWithIdentifier:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (SidecarService *)v18;
    objc_storeStrong((id *)&v16->_device, a4);
    service = v16->_service;
    v16->_service = v19;
    v21 = v19;

    v16->_dataLink = a5;
    v16->_handle = v17;
    *((_BYTE *)v16 + 64) |= 1u;
    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v22;

    v24 = 3;
    if (a5 == 4)
      v24 = 1;
    v25 = 2;
    if ((a5 & 0xFFFFFFFE) != 8)
      v25 = v24;
    v16->_transport = v25;
    objc_storeStrong((id *)&v16->_uuid, a3);
    SidecarSessionSetState(v16, 2);
    v33 = MEMORY[0x24BDAC760];
    v34 = 3221225472;
    v35 = __SidecarSessionAddToRemoteMapTable_block_invoke;
    v36 = &unk_24E5E1260;
    v37 = v16;
    v38 = v17;
    v26 = v16;
    SidecarSessionWithRemoteMapTable(&v33);

    goto LABEL_8;
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SidecarErrorDomain"), -103, 0);
  v29 = v28;
  if (a7)
    *a7 = objc_retainAutorelease(v28);
  SidecarRelayProxyAsync(0, &__block_literal_global_45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "relaySessionClose:error:completion:", v17, v29, &__block_literal_global_45);
  objc_msgSend(v30, "relaySessionDealloc:completion:", v13, &__block_literal_global_45);

  v27 = 0;
LABEL_12:

  return v27;
}

- (SidecarSession)initWithService:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  SidecarSession *v9;
  SidecarSession *v10;
  SidecarSession *v11;
  NSUUID *v12;
  uint64_t v13;
  OS_dispatch_queue *queue;
  NSUUID *uuid;
  NSUUID *v16;
  objc_super v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SidecarSession;
  v9 = -[SidecarSession init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a4);
    objc_storeStrong((id *)&v10->_service, a3);
    v11 = v10;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__638;
    v24 = __Block_byref_object_dispose__639;
    v25 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __SidecarSessionAddToLocalMapTable_block_invoke;
    v19[3] = &unk_24E5E1288;
    v19[4] = v11;
    v19[5] = &v20;
    SidecarSessionWithLocalMapTable(v19);
    v12 = (NSUUID *)(id)v21[5];
    _Block_object_dispose(&v20, 8);

    v20 = 0;
    v21 = 0;
    -[NSUUID getUUIDBytes:](v12, "getUUIDBytes:", &v20);
    v11->_handle = bswap32(v20);
    *((_BYTE *)v11 + 64) &= ~1u;
    dispatch_get_global_queue(21, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    uuid = v11->_uuid;
    v11->_uuid = v12;
    v16 = v12;

    SidecarSessionSetState(v11, 0);
  }

  return v10;
}

- (void)dealloc
{
  int64_t handle;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  objc_super v8;
  _QWORD block[5];
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *);
  void *v13;
  int64_t v14;

  handle = self->_handle;
  v4 = MEMORY[0x24BDAC760];
  if ((*((_BYTE *)self + 64) & 1) != 0)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __SidecarSessionRemoveFromRemoteMapTable_block_invoke;
    v13 = &__block_descriptor_40_e25_v16__0__SidecarMapTable_8l;
    v14 = handle;
    SidecarSessionWithRemoteMapTable(&v10);
  }
  else
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __SidecarSessionRemoveFromLocalMapTable_block_invoke;
    v13 = &__block_descriptor_40_e25_v16__0__SidecarMapTable_8l;
    v14 = handle;
    SidecarSessionWithLocalMapTable(&v10);
  }
  v5 = atomic_load((unint64_t *)&self->_state);
  if (v5 >= 1)
  {
    -[SidecarSession uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SidecarQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __25__SidecarSession_dealloc__block_invoke;
    block[3] = &unk_24E5E1578;
    block[4] = v6;
    dispatch_async(v7, block);

  }
  v8.receiver = self;
  v8.super_class = (Class)SidecarSession;
  -[SidecarSession dealloc](&v8, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUUID *uuid;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  v9[0] = 0;
  v9[1] = 0;
  -[NSUUID getUUIDBytes:](uuid, "getUUIDBytes:", v9);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%lX>"), v5, bswap32(v9[0]));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SidecarDevice)device
{
  return self->_device;
}

- (int64_t)handle
{
  return self->_handle;
}

- (SidecarService)service
{
  return self->_service;
}

- (int64_t)transport
{
  return self->_transport;
}

- (int)dataLink
{
  return self->_dataLink;
}

- (void)_closeWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (SidecarSessionSetState(self, 3))
  {
    -[SidecarSession delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sidecarSession:closedWithError:", self, v5);

  }
}

- (void)connectWithTransport:(int64_t)a3 reconnectToSession:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  SEL v13;

  v7 = a4;
  if ((SidecarSessionSetState(self, 1) & 1) != 0)
  {
    SidecarQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke;
    v10[3] = &unk_24E5E1128;
    v12 = a3;
    v13 = a2;
    v10[4] = self;
    v11 = v7;
    v9 = v7;
    dispatch_async(v8, v10);

  }
  else
  {
    __break(1u);
  }
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  SidecarQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__SidecarSession_sendMessage_completion___block_invoke;
  v12[3] = &unk_24E5E1150;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  SEL v13;

  v7 = a3;
  v8 = a4;
  if (SidecarSessionSetState(self, 3))
  {
    SidecarQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__SidecarSession_closeWithError_completion___block_invoke;
    v10[3] = &unk_24E5E1150;
    v10[4] = self;
    v13 = a2;
    v12 = v8;
    v11 = v7;
    dispatch_async(v9, v10);

  }
}

- (void)timeSyncWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  SidecarQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke;
  block[3] = &unk_24E5E11F0;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (SidecarSessionDelegate)delegate
{
  return (SidecarSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __41__SidecarSession_timeSyncWithCompletion___block_invoke(_QWORD *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];

  v2 = (_QWORD *)a1[4];
  v1 = (void *)a1[5];
  v3 = v2[7];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = -1;
  v4 = a1[6];
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke_2;
  v9[3] = &unk_24E5E1178;
  v10 = v1;
  v11 = v12;
  sessionCompletion(v2, v4, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SidecarRelayProxyAsync(0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke_3;
  v8[3] = &unk_24E5E11C8;
  v8[4] = v6;
  v8[5] = v12;
  objc_msgSend(v7, "relaySession:timeSyncWithCompletion:", v3, v8);

  _Block_object_dispose(v12, 8);
}

uint64_t __41__SidecarSession_timeSyncWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a2);
  return result;
}

void __41__SidecarSession_timeSyncWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;
  uint64_t v11;

  v5 = a3;
  SidecarQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__SidecarSession_timeSyncWithCompletion___block_invoke_4;
  v8[3] = &unk_24E5E11A0;
  v11 = a2;
  v10 = *(_OWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __41__SidecarSession_timeSyncWithCompletion___block_invoke_4(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a1[7];
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4]);
}

void __44__SidecarSession_closeWithError_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[7];
  sessionCompletion(v2, *(_QWORD *)(a1 + 56), *(void **)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  SidecarRelayProxyAsync(0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relaySessionClose:error:completion:", v3, *(_QWORD *)(a1 + 40), v5);

}

void __41__SidecarSession_sendMessage_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[7];
  sessionCompletion(v2, *(_QWORD *)(a1 + 56), *(void **)(a1 + 48));
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v9 = 0;
  SidecarOPACKEncode(v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v7)
  {
    ((void (**)(_QWORD, id))v4)[2](v4, v7);
  }
  else
  {
    SidecarRelayProxyAsync(0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relaySession:sendOPACKData:completion:", v3, v6, v4);

  }
}

void __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke_2;
  v10[3] = &unk_24E5E1100;
  v10[4] = v4;
  sessionCompletion(v4, v5, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SidecarRelayProxyAsync(0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relaySessionOpen:reconnect:serviceIdentifier:destination:transport:completion:", v8, v9, v3, v2, *(_QWORD *)(a1 + 48), v6);

}

void __58__SidecarSession_connectWithTransport_reconnectToSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unint64_t **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v5, "_closeWithError:", v3);
  }
  else
  {
    v6 = v5 + 9;
    v7 = atomic_load(v5 + 9);
    if (v7 <= 1)
    {
      while (1)
      {
        v8 = __ldaxr(v6);
        if (v8 != v7)
          break;
        if (!__stlxr(2uLL, v6))
        {
          objc_msgSend(v4, "sidecarSessionStarted:", *(_QWORD *)(a1 + 32));
          goto LABEL_10;
        }
      }
      __clrex();
    }
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = atomic_load((unint64_t *)(v11 + 72));
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      _os_log_impl(&dword_220044000, v10, OS_LOG_TYPE_ERROR, "%{public}@: set state failed (%ld)", (uint8_t *)&v13, 0x16u);
    }

  }
LABEL_10:

}

void __25__SidecarSession_dealloc__block_invoke(uint64_t a1)
{
  id v2;

  SidecarRelayProxyAsync(0, &__block_literal_global_46);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relaySessionDealloc:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_46);

}

void __25__SidecarSession_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *log;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      log = v3;
      v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      v3 = log;
      if (v4)
      {
        objc_msgSend(v2, "domain");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v2, "code");
        objc_msgSend(v2, "localizedDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v10 = v5;
        v11 = 2048;
        v12 = v6;
        v13 = 2113;
        v14 = v7;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v3 = log;
      }
    }

  }
}

void __63__SidecarSession_initWithRemote_device_dataLink_service_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *log;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      log = v3;
      v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      v3 = log;
      if (v4)
      {
        objc_msgSend(v2, "domain");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v2, "code");
        objc_msgSend(v2, "localizedDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543875;
        v10 = v5;
        v11 = 2048;
        v12 = v6;
        v13 = 2113;
        v14 = v7;
        _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v3 = log;
      }
    }

  }
}

- (void)listenForStreamType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  SEL v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;

  v13 = a5;
  v14 = a7;
  SidecarQueue();
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke;
  block[3] = &unk_24E5E16E8;
  v20 = v14;
  v21 = a2;
  v22 = a3;
  v23 = a4;
  block[4] = self;
  v19 = v13;
  v24 = a6;
  v16 = v13;
  v17 = v14;
  dispatch_async(v15, block);

}

- (void)openStreamForType:(int64_t)a3 flags:(unint64_t)a4 identifier:(id)a5 processUniqueID:(unint64_t)a6 completion:(id)a7
{
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  SEL v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;

  v13 = a5;
  v14 = a7;
  SidecarQueue();
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke;
  block[3] = &unk_24E5E16E8;
  v20 = v14;
  v21 = a2;
  v22 = a3;
  v23 = a4;
  block[4] = self;
  v19 = v13;
  v24 = a6;
  v16 = v13;
  v17 = v14;
  dispatch_async(v15, block);

}

void __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  __int128 v15;
  _QWORD v16[5];
  __int128 v17;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_2;
  v16[3] = &unk_24E5E1618;
  v16[4] = v2;
  v12 = *(_OWORD *)(a1 + 48);
  v5 = (id)v12;
  v17 = v12;
  SidecarRelayProxyAsync(0, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 80);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_3;
  v14[3] = &unk_24E5E16C0;
  v10 = *(_QWORD *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 32);
  v11 = (id)v13;
  v15 = v13;
  objc_msgSend(v6, "relaySession:connectStreamType:flags:identifier:processUniqueID:completion:", v3, v7, v8, v10, v9, v14);

}

void __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  streamCompletion(*(void **)(a1 + 32), *(const char **)(a1 + 48), 0, a2, *(void **)(a1 + 40));
}

void __104__SidecarSession_SidecarStreamsInternal__openStreamForType_flags_identifier_processUniqueID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  streamCompletion(*(void **)(a1 + 32), *(const char **)(a1 + 48), a2, a3, *(void **)(a1 + 40));
}

void __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  __int128 v15;
  _QWORD v16[5];
  __int128 v17;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  v4 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_2;
  v16[3] = &unk_24E5E1618;
  v16[4] = v2;
  v12 = *(_OWORD *)(a1 + 48);
  v5 = (id)v12;
  v17 = v12;
  SidecarRelayProxyAsync(0, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 80);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_3;
  v14[3] = &unk_24E5E16C0;
  v10 = *(_QWORD *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 32);
  v11 = (id)v13;
  v15 = v13;
  objc_msgSend(v6, "relaySession:listenStreamType:flags:identifier:processUniqueID:completion:", v3, v7, v8, v10, v9, v14);

}

void __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  streamCompletion(*(void **)(a1 + 32), *(const char **)(a1 + 48), 0, a2, *(void **)(a1 + 40));
}

void __106__SidecarSession_SidecarStreamsInternal__listenForStreamType_flags_identifier_processUniqueID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  streamCompletion(*(void **)(a1 + 32), *(const char **)(a1 + 48), a2, a3, *(void **)(a1 + 40));
}

@end
