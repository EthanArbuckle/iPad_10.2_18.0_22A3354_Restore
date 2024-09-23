@implementation SYBacklinkIndicatorClient

+ (SYBacklinkIndicatorClient)clientWithLinkIdentifiers:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "addObject:", &stru_1E757CA18);
      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }
  objc_msgSend(a1, "clientWithDomainIdentifiers:linkIdentifiers:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (SYBacklinkIndicatorClient *)v7;
}

+ (SYBacklinkIndicatorClient)clientWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYBacklinkIndicatorClient.m"), 35, CFSTR("The domain identifiers count (%ld) does not match the link identifiers count (%ld)."), objc_msgSend(v7, "count"), objc_msgSend(v8, "count"));

  }
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setDomainIdentifiers:", v7);
  objc_msgSend(v10, "setLinkIdentifiers:", v8);
  objc_msgSend(v10, "setAction:", objc_msgSend(v8, "count") != 0);

  return (SYBacklinkIndicatorClient *)v10;
}

- (SYBacklinkIndicatorClient)init
{
  SYBacklinkIndicatorClient *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SYBacklinkIndicatorClient;
  v2 = -[SYBacklinkIndicatorClient init](&v5, sel_init);
  v3 = MEMORY[0x1E0C9AA60];
  -[SYBacklinkIndicatorClient setDomainIdentifiers:](v2, "setDomainIdentifiers:", MEMORY[0x1E0C9AA60]);
  -[SYBacklinkIndicatorClient setLinkIdentifiers:](v2, "setLinkIdentifiers:", v3);
  -[SYBacklinkIndicatorClient setDisplayID:](v2, "setDisplayID:", 0);
  -[SYBacklinkIndicatorClient setCorner:](v2, "setCorner:", -1);
  -[SYBacklinkIndicatorClient setAction:](v2, "setAction:", 1);
  return v2;
}

+ (void)toggleIndicator
{
  objc_msgSend(a1, "toggleIndicatorWithDisplayID:corner:", 0, -1);
}

+ (void)toggleIndicatorWithDisplayID:(unsigned int)a3 corner:(int64_t)a4
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)&a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setDisplayID:", v5);
  objc_msgSend(v6, "setCorner:", a4);
  objc_msgSend(v6, "setAction:", 2);
  objc_msgSend(v6, "requestIndicatorWithCompletion:", 0);

}

+ (void)hideIndicator
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setAction:", 0);
  objc_msgSend(v2, "requestIndicatorWithCompletion:", 0);

}

+ (void)hotCornerExited
{
  id v2;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setAction:", 3);
  objc_msgSend(v2, "requestIndicatorWithCompletion:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SYBacklinkIndicatorClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SYBacklinkIndicatorClient;
  -[SYBacklinkIndicatorClient dealloc](&v4, sel_dealloc);
}

- (void)_createConnectionIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[SYBacklinkIndicatorClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "_testingEndpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v6 = v5;
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "_testingEndpoint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithListenerEndpoint:", v7);
      -[SYBacklinkIndicatorClient setConnection:](self, "setConnection:", v8);

    }
    else
    {
      v7 = (void *)objc_msgSend(v5, "initWithMachServiceName:options:", CFSTR("com.apple.synapse.backlinkindicator"), 0);
      -[SYBacklinkIndicatorClient setConnection:](self, "setConnection:", v7);
    }

    -[SYBacklinkIndicatorClient _configureConnectionAndResume](self, "_configureConnectionAndResume");
  }
}

- (void)_configureConnectionAndResume
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[SYBacklinkIndicatorClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYBacklinkIndicatorClient.m"), 97, CFSTR("the XPC connection is unexpectedly nil"));

  }
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke;
  v14[3] = &unk_1E757B438;
  objc_copyWeak(&v15, &location);
  -[SYBacklinkIndicatorClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", v14);

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke_2;
  v12[3] = &unk_1E757B438;
  objc_copyWeak(&v13, &location);
  -[SYBacklinkIndicatorClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInterruptionHandler:", v12);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF498058);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYBacklinkIndicatorClient connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);

  -[SYBacklinkIndicatorClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnectionIfNecessary");

}

void __58__SYBacklinkIndicatorClient__configureConnectionAndResume__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnectionIfNecessary");

}

- (void)_resetConnectionIfNecessary
{
  void *v3;

  if (-[SYBacklinkIndicatorClient sentRequest](self, "sentRequest"))
  {
    -[SYBacklinkIndicatorClient connection](self, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    -[SYBacklinkIndicatorClient setConnection:](self, "setConnection:", 0);
    -[SYBacklinkIndicatorClient setSentRequest:](self, "setSentRequest:", 0);
  }
}

- (void)requestIndicatorWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[SYBacklinkIndicatorClient _shouldSendIndicatorRequest](self, "_shouldSendIndicatorRequest"))
  {
    -[SYBacklinkIndicatorClient _sendIndicatorRequestWithCompletion:](self, "_sendIndicatorRequestWithCompletion:", v4);
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }

}

- (void)_sendIndicatorRequestWithCompletion:(id)a3
{
  void (**v4)(id, BOOL);
  void *v5;
  void *v6;
  int64_t v7;
  os_log_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, BOOL))a3;
  -[SYBacklinkIndicatorClient _createConnectionIfNeeded](self, "_createConnectionIfNeeded");
  if (!-[SYBacklinkIndicatorClient sentRequest](self, "sentRequest"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    -[SYBacklinkIndicatorClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke;
    v15[3] = &unk_1E757B6C0;
    v15[4] = &v16;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*((_BYTE *)v17 + 24))
    {
      v7 = -[SYBacklinkIndicatorClient _showIndicatorAction](self, "_showIndicatorAction");
      v8 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      v9 = v8;
      if (v7)
      {
        v10 = v8;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[SYBacklinkIndicatorClient linkIdentifiers](self, "linkIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");
          *(_DWORD *)buf = 134217984;
          v21 = v12;
          _os_log_impl(&dword_1BCC38000, v10, OS_LOG_TYPE_DEFAULT, "BacklinkIndicatorClient: Will call showIndicatorForBacklink on service. Link identifier count: %ld", buf, 0xCu);

        }
        -[SYBacklinkIndicatorClient _recordLastShowIndicatorRequestTimestamp](self, "_recordLastShowIndicatorRequestTimestamp");
        -[SYBacklinkIndicatorClient domainIdentifiers](self, "domainIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SYBacklinkIndicatorClient linkIdentifiers](self, "linkIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "showIndicatorForBacklinkWithDomainIdentifiers:linkIdentifiers:displayID:corner:action:", v13, v14, -[SYBacklinkIndicatorClient displayID](self, "displayID"), -[SYBacklinkIndicatorClient corner](self, "corner"), v7);

      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_DEFAULT, "BacklinkIndicatorClient: Will call hideIndicator on service.", buf, 2u);
        }

        -[SYBacklinkIndicatorClient _clearLastShowIndicatorRequestTimestamp](self, "_clearLastShowIndicatorRequestTimestamp");
        objc_msgSend(v6, "hideIndicator");
      }
      -[SYBacklinkIndicatorClient setSentRequest:](self, "setSentRequest:", 1);
    }

    _Block_object_dispose(&v16, 8);
  }
  if (v4)
    v4[2](v4, -[SYBacklinkIndicatorClient sentRequest](self, "sentRequest"));

}

void __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke_cold_1((uint64_t)v3, v4);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

- (int64_t)_showIndicatorAction
{
  void *v3;
  uint64_t v4;

  -[SYBacklinkIndicatorClient linkIdentifiers](self, "linkIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  else
    return -[SYBacklinkIndicatorClient action](self, "action");
}

- (void)_recordLastShowIndicatorRequestTimestamp
{
  double v2;
  double v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("lastShowIndicatorTime"), v3);

}

- (void)_clearLastShowIndicatorRequestTimestamp
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("lastShowIndicatorTime"));

}

- (BOOL)_shouldSendIndicatorRequest
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  __CFString *v8;
  NSObject *v9;
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[SYBacklinkIndicatorClient _showIndicatorAction](self, "_showIndicatorAction"))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("lastShowIndicatorTime"));
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5 - v4;
  if (v6 < 60.0)
    return 1;
  if (v4 <= 0.0)
  {
    v8 = &stru_1E757CA18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" Last was %0.1fs ago."), *(_QWORD *)&v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v9 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_INFO, "BacklinkIndicatorClient: Will not send request to service, no recent show indicator requests.%@", buf, 0xCu);
  }

  return 0;
}

- (NSArray)domainIdentifiers
{
  return self->_domainIdentifiers;
}

- (void)setDomainIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)linkIdentifiers
{
  return self->_linkIdentifiers;
}

- (void)setLinkIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (int64_t)corner
{
  return self->_corner;
}

- (void)setCorner:(int64_t)a3
{
  self->_corner = a3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)sentRequest
{
  return self->_sentRequest;
}

- (void)setSentRequest:(BOOL)a3
{
  self->_sentRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_linkIdentifiers, 0);
  objc_storeStrong((id *)&self->_domainIdentifiers, 0);
}

+ (NSXPCListenerEndpoint)_testingEndpoint
{
  return (NSXPCListenerEndpoint *)(id)__testingEndpoint;
}

+ (void)set_testingEndpoint:(id)a3
{
  objc_storeStrong((id *)&__testingEndpoint, a3);
}

void __65__SYBacklinkIndicatorClient__sendIndicatorRequestWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_ERROR, "Error creating remote object for backlink indicator: %@", (uint8_t *)&v2, 0xCu);
}

@end
