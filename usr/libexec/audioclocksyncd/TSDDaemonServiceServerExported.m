@implementation TSDDaemonServiceServerExported

- (void)openDaemonClientWithRegistryEntryID:(unint64_t)a3 clientType:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5;
  void (**v8)(id, id, id);
  uint64_t processID;
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  unint64_t v14;

  v5 = *(_QWORD *)&a4;
  v8 = (void (**)(id, id, id))a5;
  if (qword_100047CF0)
  {
    processID = self->_processID;
    v12 = 0;
    v10 = objc_msgSend((id)qword_100047CF0, "openDaemonClient:withRegistryEntryID:clientType:error:", processID, a3, v5, &v12);
    v11 = v12;
    v8[2](v8, v10, v11);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open daemon client registryEntryID  %llu", buf, 0xCu);
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TSErrorDomain"), -536870201, 0));
    v8[2](v8, 0, v11);
  }

}

- (void)closeDaemonClient:(unsigned int)a3 reply:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t processID;
  void (**v8)(id, id, id);
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = (void *)qword_100047CF0;
  if (qword_100047CF0)
  {
    v6 = *(_QWORD *)&a3;
    processID = self->_processID;
    v13 = 0;
    v8 = (void (**)(id, id, id))a4;
    v9 = objc_msgSend(v5, "closeDaemonClient:daemonClientID:error:", processID, v6, &v13);
    v10 = v13;
    v8[2](v8, v9, v10);

  }
  else
  {
    v11 = a4;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TSErrorDomain"), -536870201, 0));
    (*((void (**)(id, _QWORD, id))a4 + 2))(v11, 0, v12);

  }
}

- (void)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(ScalarArgsArray *)a5 structInput:(id)a6 scalarOutputCount:(unsigned int)a7 reply:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t var1;
  void *v17;
  id v18;
  id v19;
  _OWORD *v20;
  uint64_t *v21;
  id v22;
  id v23;
  _OWORD *v24;
  id v25;
  _OWORD v26[8];
  uint64_t v27;

  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v13 = a6;
  v14 = a8;
  v15 = (void *)qword_100047CF0;
  if (!qword_100047CF0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TSErrorDomain"), -536870201, 0));
    (*((void (**)(id, _QWORD, _QWORD, void *))v14 + 2))(v14, 0, 0, v17);

    goto LABEL_26;
  }
  memset(v26, 0, sizeof(v26));
  v27 = a7;
  if (a5)
  {
    var1 = a5->var1;
    if (!(_DWORD)var1)
      a5 = 0;
  }
  else
  {
    var1 = 0;
  }
  if (!v13)
  {
    v18 = 0;
LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v13, "length"))
    v18 = objc_msgSend(objc_retainAutorelease(v13), "bytes");
  else
    v18 = 0;
  if (!objc_msgSend(v13, "length"))
    goto LABEL_15;
  v19 = objc_msgSend(v13, "length");
LABEL_16:
  if (a7)
    v20 = v26;
  else
    v20 = 0;
  if (a7)
    v21 = &v27;
  else
    v21 = 0;
  v25 = 0;
  v22 = objc_msgSend(v15, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", v12, v11, a5, var1, v18, v19, v20, v21, &v25);
  v23 = v25;
  if ((v22 & ((_DWORD)v27 != 0)) != 0)
    v24 = v26;
  else
    v24 = 0;
  (*((void (**)(id, id, _OWORD *, id))v14 + 2))(v14, v22, v24, v23);

LABEL_26:
}

- (void)propertyForRegistryEntryID:(unint64_t)a3 signpostID:(unint64_t)a4 key:(id)a5 reply:(id)a6
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  v8 = a5;
  v9 = (void (**)(id, void *))a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService entryIDMatching:](IOKService, "entryIDMatching:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "propertyForKey:", v8));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136316418;
      v14 = "service != nil";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/XPC/TSDDaemonServiceServer.m";
      v23 = 1024;
      v24 = 380;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v13, 0x3Au);
    }
    v12 = 0;
  }
  v9[2](v9, v12);

}

- (void)propertiesForRegistryEntryID:(unint64_t)a3 signpostID:(unint64_t)a4 reply:(id)a5
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  v6 = (void (**)(id, void *))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService entryIDMatching:](IOKService, "entryIDMatching:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IOKService matchingService:](IOKService, "matchingService:", v7));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "properties"));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = "service != nil";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/XPC/TSDDaemonServiceServer.m";
      v20 = 1024;
      v21 = 395;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
    }
    v9 = 0;
  }
  v6[2](v6, v9);

}

- (TSDDaemonServiceServer)object
{
  return (TSDDaemonServiceServer *)objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
}

@end
