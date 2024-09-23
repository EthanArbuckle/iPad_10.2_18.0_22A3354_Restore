@implementation SidecarStream

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("status"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SidecarStream;
    v6 = objc_msgSendSuper2(&v8, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SidecarStream)initWithIdentifier:(id)a3 rapportStream:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SidecarStream *v11;
  SidecarStream *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("-[%@] called with without supplying an identifier"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v10 = v9;
  v18.receiver = self;
  v18.super_class = (Class)SidecarStream;
  v11 = -[SidecarStream init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_rapportStream, a4);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[SidecarStream invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SidecarStream;
  -[SidecarStream dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%@>"), v5, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (RPStreamSession)rapportStream
{
  return self->_rapportStream;
}

- (int64_t)fileDescriptor
{
  RPStreamSession *rapportStream;

  rapportStream = self->_rapportStream;
  if (rapportStream)
    return (int)-[RPStreamSession streamSocket](rapportStream, "streamSocket");
  else
    return -1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SidecarSession)session
{
  return (SidecarSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (unint64_t)status
{
  return atomic_load(&self->_status);
}

- (void)setStatus:(unint64_t)a3
{
  SidecarStream *v5;
  uint64_t v6;
  SidecarStream *v7;

  if (-[SidecarStream status](self, "status") != a3)
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = self;
    v5 = self;
    -[SidecarStream willChangeValueForKey:](v5, "willChangeValueForKey:", CFSTR("status"), v6, 3221225472, __27__SidecarStream_setStatus___block_invoke, &unk_24E5E15F0, v7, a3);
    __27__SidecarStream_setStatus___block_invoke((uint64_t)&v6);
    -[SidecarStream didChangeValueForKey:](v5, "didChangeValueForKey:", CFSTR("status"));

  }
}

- (int64_t)transport
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SidecarStream session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "transport");
  else
    v4 = 0;

  return v4;
}

- (int64_t)type
{
  int v2;
  uint64_t v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = -[RPStreamSession streamType](self->_rapportStream, "streamType");
  v3 = (v2 - 1);
  if (v3 < 3)
    return v3 + 1;
  v5 = v2;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = "?";
    if (!v5)
      v8 = "Invalid";
    v9 = 136446466;
    v10 = v8;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_220044000, v7, OS_LOG_TYPE_ERROR, "unexpected RPStreamType: %{public}s (%d)", (uint8_t *)&v9, 0x12u);
  }

  return 0;
}

- (unint64_t)flags
{
  return -[RPStreamSession streamFlags](self->_rapportStream, "streamFlags") & 2;
}

- ($DCF20CAD073027CB89FDEFA7A9A33809)nwClientID
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  $DCF20CAD073027CB89FDEFA7A9A33809 result;

  v5 = 0;
  v6 = 0;
  -[RPStreamSession nwClientID](self->_rapportStream, "nwClientID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getUUIDBytes:", &v5);

  v3 = v5;
  v4 = v6;
  result.var8 = v4;
  result.var9 = BYTE1(v4);
  result.var10 = BYTE2(v4);
  result.var11 = BYTE3(v4);
  result.var12 = BYTE4(v4);
  result.var13 = BYTE5(v4);
  result.var14 = BYTE6(v4);
  result.var15 = HIBYTE(v4);
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  result.var6 = BYTE6(v3);
  result.var7 = HIBYTE(v3);
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v5;
  BOOL *p_activated;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  RPStreamSession *rapportStream;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;

  v5 = a3;
  p_activated = &self->_activated;
  do
    v7 = __ldaxr((unsigned __int8 *)p_activated);
  while (__stlxr(1u, (unsigned __int8 *)p_activated));
  if ((v7 & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCAB0];
    -[SidecarStream description](self, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("%@ already activated"), v10);

  }
  rapportStream = self->_rapportStream;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__SidecarStream_activateWithCompletion___block_invoke;
  v13[3] = &unk_24E5E1618;
  v14 = v5;
  v15 = a2;
  v13[4] = self;
  v12 = v5;
  -[RPStreamSession activateWithCompletion:](rapportStream, "activateWithCompletion:", v13);

}

- (void)invalidate
{
  id WeakRetained;
  NSString *v4;
  NSObject *v5;
  _QWORD v6[6];

  -[RPStreamSession invalidate](self->_rapportStream, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  if (WeakRetained)
  {
    v4 = self->_identifier;
    SidecarQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __27__SidecarStream_invalidate__block_invoke;
    v6[3] = &unk_24E5E1640;
    v6[4] = WeakRetained;
    v6[5] = v4;
    dispatch_async(v5, v6);

  }
}

- (id)handler
{
  return (id)MEMORY[0x2207DCAD0](self->_handler, a2);
}

- (void)setHandler:(id)a3
{
  id v4;
  void *v5;
  id handler;
  RPStreamSession *rapportStream;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  handler = self->_handler;
  self->_handler = v5;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28__SidecarStream_setHandler___block_invoke;
  v9[3] = &unk_24E5E1668;
  v10 = v4;
  rapportStream = self->_rapportStream;
  v8 = v4;
  -[RPStreamSession setReceivedEventHandler:](rapportStream, "setReceivedEventHandler:", v9);

}

- (void)sendOPACK:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  RPStreamSession *rapportStream;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (self->_rapportStream)
  {
    v8 = atomic_load((unsigned __int8 *)&self->_activated);
    if ((v8 & 1) == 0)
    {
      v9 = (void *)MEMORY[0x24BDBCE88];
      v10 = *MEMORY[0x24BDBCAB0];
      -[SidecarStream description](self, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("%@ not activated"), v11);

    }
    v18 = 0;
    SidecarOPACKEncode(v6, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    if (v13)
    {
      v7[2](v7, v13);
    }
    else
    {
      rapportStream = self->_rapportStream;
      -[SidecarStream identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = &unk_24E5E6970;
      v20[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPStreamSession sendEventID:event:options:completion:](rapportStream, "sendEventID:event:options:completion:", v16, v17, 0, v7);

    }
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("SidecarErrorDomain"), -102, 0);
    v7[2](v7, v14);

  }
}

- (SidecarStream)initWithCoder:(id)a3
{
  id v4;
  SidecarStream *v5;
  SidecarStream *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *identifier;
  Class v10;
  uint64_t v11;
  RPStreamSession *rapportStream;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SidecarStream;
  v5 = -[SidecarStream init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    validateXPCCoder(v5, v4, (void *)*MEMORY[0x24BDD0E20]);
    v7 = objc_opt_class();
    decodeObject(v4, CFSTR("id"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v10 = NSClassFromString(CFSTR("RPStreamSession"));
    decodeObject(v4, CFSTR("rp"), (uint64_t)v10);
    v11 = objc_claimAutoreleasedReturnValue();
    rapportStream = v6->_rapportStream;
    v6->_rapportStream = (RPStreamSession *)v11;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;

  v4 = (void *)*MEMORY[0x24BDD0E18];
  v9 = a3;
  validateXPCCoder(self, v9, v4);
  v5 = atomic_load((unsigned __int8 *)&self->_activated);
  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v4, CFSTR("cannot encode activated %@"), v8, v9);

  }
  encodeObject(v9, CFSTR("id"), self->_identifier);
  encodeObject(v9, CFSTR("rp"), self->_rapportStream);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_rapportStream, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __28__SidecarStream_setHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *log;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_DEBUG);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    v24 = 2112;
    v25 = (uint64_t)v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_220044000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: %@, %@", buf, 0x20u);
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_24E5E6970);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0;
    SidecarOPACKDecode(v12, &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    if (v14)
    {
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        log = v15;
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        v15 = log;
        if (v16)
        {
          objc_msgSend(v14, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v14, "code");
          objc_msgSend(v14, "localizedDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v23 = v17;
          v24 = 2048;
          v25 = v18;
          v26 = 2113;
          v27 = v19;
          _os_log_impl(&dword_220044000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

          v15 = log;
        }
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __27__SidecarStream_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  SidecarRelayProxyAsync(0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relaySession:closeStream:", v2, *(_QWORD *)(a1 + 40));

}

void __40__SidecarStream_activateWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = (const char *)a1[6];
  v5 = a2;
  SidecarCoreLogObjCAPIError(v3, v4, v5);
  (*(void (**)(void))(a1[5] + 16))();

}

uint64_t __27__SidecarStream_setStatus___block_invoke(uint64_t result)
{
  atomic_store(*(_QWORD *)(result + 40), (unint64_t *)(*(_QWORD *)(result + 32) + 40));
  return result;
}

@end
