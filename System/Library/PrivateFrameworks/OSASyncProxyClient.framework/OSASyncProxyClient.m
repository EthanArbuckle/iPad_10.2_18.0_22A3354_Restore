void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

:", &unk_254B53918);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v5->_connection, "resume");
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v5->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    synchRemoteObjectProxy = v5->_synchRemoteObjectProxy;
    v5->_synchRemoteObjectProxy = (OSASyncProxyServices *)v9;

  }
  return v5;
}

- (OSASyncProxyClient)init
{
  return -[OSASyncProxyClient initWithErrorHandler:](self, "initWithErrorHandler:", &__block_literal_global);
}

void __26__OSASyncProxyClient_init__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = a2;
    _os_log_impl(&dword_21257F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection error to ProxiedCrashCopier. Error: %{public}@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)OSASyncProxyClient;
  -[OSASyncProxyClient dealloc](&v3, sel_dealloc);
}

- (void)request:(id)a3 transferGroupWithOptions:(id)a4 onComplete:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_msgSend(&unk_24CDDACD0, "mutableCopy");
  objc_msgSend(v11, "addEntriesFromDictionary:", v9);

  -[OSASyncProxyServices request:transferGroupWithOptions:onComplete:](self->_synchRemoteObjectProxy, "request:transferGroupWithOptions:onComplete:", v10, v11, v8);
}

- (void)request:(id)a3 transferLog:(id)a4 withOptions:(id)a5 onComplete:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(&unk_24CDDACF8, "mutableCopy");
  v14 = v13;
  if (v11)
    objc_msgSend(v13, "addEntriesFromDictionary:", v11);
  -[OSASyncProxyServices request:transferLog:withOptions:onComplete:](self->_synchRemoteObjectProxy, "request:transferLog:withOptions:onComplete:", v15, v10, v14, v12);

}

- (void)request:(id)a3 transferLog:(id)a4 onComplete:(id)a5
{
  -[OSASyncProxyClient request:transferLog:withOptions:onComplete:](self, "request:transferLog:withOptions:onComplete:", a3, a4, 0, a5);
}

- (void)request:(id)a3 logListWithOptions:(id)a4 onComplete:(id)a5
{
  -[OSASyncProxyServices request:logListWithOptions:onComplete:](self->_synchRemoteObjectProxy, "request:logListWithOptions:onComplete:", a3, a4, a5);
}

- (void)request:(id)a3 logList:(id)a4
{
  -[OSASyncProxyClient request:logListWithOptions:onComplete:](self, "request:logListWithOptions:onComplete:", a3, 0, a4);
}

- (void)requestProxyMetadata:(id)a3 onComplete:(id)a4
{
  -[OSASyncProxyServices requestProxyMetadata:onComplete:](self->_synchRemoteObjectProxy, "requestProxyMetadata:onComplete:", a3, a4);
}

- (void)deliver:(id)a3 tasking:(id)a4 taskId:(id)a5 fromBlob:(id)a6
{
  -[OSASyncProxyServices deliver:tasking:taskId:fromBlob:](self->_synchRemoteObjectProxy, "deliver:tasking:taskId:fromBlob:", a3, a4, a5, a6);
}

- (void)synchronize:(id)a3 withOptions:(id)a4 onComplete:(id)a5
{
  -[OSASyncProxyServices synchronize:withOptions:onComplete:](self->_synchRemoteObjectProxy, "synchronize:withOptions:onComplete:", a3, a4, a5);
}

- (void)listDevices:(id)a3
{
  -[OSASyncProxyServices listDevices:](self->_synchRemoteObjectProxy, "listDevices:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchRemoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
