@implementation SidecarCoreProxy

- (void)relaySession:(int64_t)a3 closedWithError:(id)a4
{
  id v6;
  SidecarSessionDelegate *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = self->_delegate;
  SidecarSessionWithHandle(a3, v7 != 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    -[SidecarSessionDelegate sidecarSession:closedWithError:](self->_delegate, "sidecarSession:closedWithError:", v8, v6);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __SidecarSessionRemoveFromRemoteMapTable_block_invoke;
    v11[3] = &__block_descriptor_40_e25_v16__0__SidecarMapTable_8l;
    v11[4] = a3;
    SidecarSessionWithRemoteMapTable(v11);
  }
  objc_msgSend(v9, "_closeWithError:", v6);

}

- (void)relaySession:(id)a3 openedByDevice:(id)a4 dataLink:(int64_t)a5 service:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  SidecarSession *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  _BYTE buf[22];
  __int16 v29;
  id v30;
  __int16 v31;
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  objc_msgSend(v10, "getUUIDBytes:", buf);
  v13 = bswap32(*(unsigned int *)buf);
  SidecarSessionGetFromRemoteMapTable(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_220044000, v16, OS_LOG_TYPE_ERROR, "session %lX already open", buf, 0xCu);
    }
  }
  else
  {
    v27 = 0;
    v17 = -[SidecarSession initWithRemote:device:dataLink:service:error:]([SidecarSession alloc], "initWithRemote:device:dataLink:service:error:", v10, v11, a5, v12, &v27);
    v18 = v27;
    v16 = v18;
    if (v17)
    {
      SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v11;
        v29 = 2114;
        v30 = v12;
        v31 = 2048;
        v32 = a5;
        _os_log_impl(&dword_220044000, v20, OS_LOG_TYPE_INFO, "session %lX opened by device %{public}@ (%{public}@) [%ld]", buf, 0x2Au);
      }

      -[SidecarSessionDelegate sidecarSessionStarted:](self->_delegate, "sidecarSessionStarted:", v17);
    }
    else
    {
      v21 = v18;
      if (v21)
      {
        SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          -[NSObject domain](v21, "domain");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[NSObject code](v21, "code");
          -[NSObject localizedDescription](v21, "localizedDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v25;
          v29 = 2113;
          v30 = v26;
          _os_log_impl(&dword_220044000, v23, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        }
      }

    }
  }

}

- (void)relaySession:(int64_t)a3 receivedOPACKData:(id)a4 dataLink:(int64_t)a5
{
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  SidecarOPACKDecode(a4, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (v9)
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "code");
      objc_msgSend(v9, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v22 = (int64_t)v12;
      v23 = 2048;
      v24 = v13;
      v25 = 2113;
      v26 = v14;
      _os_log_impl(&dword_220044000, v11, OS_LOG_TYPE_ERROR, "proxy: %{public}@ (%ld) %{private}@", buf, 0x20u);

    }
  }
  else
  {
    SidecarSessionWithHandle(a3, self->_delegate != 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v15)
    {
      v15[6].isa = (Class)a5;
      v16 = 3;
      if ((_DWORD)a5 == 4)
        v16 = 1;
      v17 = 2;
      if ((a5 & 0xFFFFFFFE) != 8)
        v17 = v16;
      v15[4].isa = (Class)v17;
      -[NSObject delegate](v15, "delegate");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject sidecarSession:receivedMessage:](v18, "sidecarSession:receivedMessage:", v11, v8);
    }
    else
    {
      SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v19 = objc_claimAutoreleasedReturnValue();
      v18 = v19;
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v22 = a3;
        _os_log_impl(&dword_220044000, v18, OS_LOG_TYPE_ERROR, "unknown session %lX received OPACK", buf, 0xCu);
      }
    }

  }
}

- (void)relaySession:(int64_t)a3 stream:(id)a4 status:(unint64_t)a5
{
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = self->_delegate != 0;
  v8 = a4;
  SidecarSessionWithHandle(a3, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  SidecarSessionGetStreams(v12, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setStatus:", a5);
}

- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4
{
  -[SidecarServicePresenterDelegate sidecarServicePresenterStartServiceExtension:completion:](self->_presenterDelegate, "sidecarServicePresenterStartServiceExtension:completion:", a3, a4);
}

- (void)relayPresenterServiceExtensionReady:(id)a3
{
  -[SidecarServicePresenterDelegate sidecarServicePresenterServiceExtensionReady:](self->_presenterDelegate, "sidecarServicePresenterServiceExtensionReady:", a3);
}

- (void)relayTerminateService
{
  -[SidecarServicePresenterDelegate sidecarServicePresenterTerminate](self->_presenterDelegate, "sidecarServicePresenterTerminate");
  -[SidecarSessionDelegate sidecarServiceTerminate](self->_delegate, "sidecarServiceTerminate");
}

- (SidecarSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (SidecarServicePresenterDelegate)presenterDelegate
{
  return self->_presenterDelegate;
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_presenterDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

+ (SidecarCoreProxy)defaultProxy
{
  if (defaultProxy_once_692 != -1)
    dispatch_once(&defaultProxy_once_692, &__block_literal_global_693);
  return (SidecarCoreProxy *)(id)defaultProxy_proxy_694;
}

void __32__SidecarCoreProxy_defaultProxy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultProxy_proxy_694;
  defaultProxy_proxy_694 = v0;

}

@end
