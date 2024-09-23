@implementation PKPrinterTool_Client

- (PKPrinterTool_Client)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPrinterTool_Client;
  return -[PKPrinterTool_Client init](&v3, sel_init);
}

+ (id)sharedClient
{
  if (+[PKPrinterTool_Client sharedClient]::sOnce != -1)
    dispatch_once(&+[PKPrinterTool_Client sharedClient]::sOnce, &__block_literal_global);
  return (id)+[PKPrinterTool_Client sharedClient]::sSharedClient;
}

- (id)ptConn
{
  PKPrinterTool_Client *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[PKPrinterTool_Client ptConn_locked](v2, "ptConn_locked");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)ptConn_locked
{
  NSXPCConnection *conn;
  void *v4;
  id v5;
  void *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSObject *v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  void *v12;
  NSXPCConnection *v13;
  uint64_t v14;
  NSXPCConnection *v15;
  NSXPCConnection *v16;
  _QWORD v18[4];
  NSXPCConnection *v19;
  id v20;
  _QWORD v21[4];
  NSXPCConnection *v22;
  id v23;
  id location;

  conn = self->_conn;
  if (!conn)
  {
    +[PKDefaults listenerProxy](PKDefaults, "listenerProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x24BDD1988]);
      objc_msgSend(v4, "endpoint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (NSXPCConnection *)objc_msgSend(v5, "initWithListenerEndpoint:", v6);
      v8 = self->_conn;
      self->_conn = v7;

      if (!self->_conn)
      {
        _PKLogCategory(PKLogCategoryDefault[0]);
        v9 = objc_claimAutoreleasedReturnValue();
        -[PKPrinterTool_Client ptConn_locked].cold.1(v9);

        abort();
      }
    }
    else
    {
      v10 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.PrintKit.PrinterTool"));
      v11 = self->_conn;
      self->_conn = v10;

    }
    getPrintdRPCProtocolInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", v12);

    v13 = self->_conn;
    objc_initWeak(&location, self);
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __37__PKPrinterTool_Client_ptConn_locked__block_invoke;
    v21[3] = &unk_24E6C0608;
    v15 = v13;
    v22 = v15;
    objc_copyWeak(&v23, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_conn, "setInvalidationHandler:", v21);
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __37__PKPrinterTool_Client_ptConn_locked__block_invoke_4;
    v18[3] = &unk_24E6C0608;
    v16 = v15;
    v19 = v16;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_conn, "setInterruptionHandler:", v18);
    -[NSXPCConnection activate](self->_conn, "activate");
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    conn = self->_conn;
  }
  return conn;
}

- (void)invalidate
{
  NSXPCConnection *conn;

  -[NSXPCConnection invalidate](self->_conn, "invalidate");
  conn = self->_conn;
  self->_conn = 0;

}

- (void)getRecentJobsCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  SEL v14;

  v5 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __55__PKPrinterTool_Client_getRecentJobsCompletionHandler___block_invoke;
  v12 = &unk_24E6C0630;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "getRecentJobsReply:", v7, v9, v10, v11, v12);
  else
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)getJobUpdateStatus:(int)a3 includeThumbnail:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  SEL v18;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v9 = a5;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __78__PKPrinterTool_Client_getJobUpdateStatus_includeThumbnail_completionHandler___block_invoke;
  v16 = &unk_24E6C0630;
  v18 = a2;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v12, "getJobUpdateStatus:includeThumbnail:reply:", v6, v5, v11, v13, v14, v15, v16);
  else
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);

}

- (void)cancelJob:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "cancelJob:", v3);

}

- (void)getLastUsedPrintersForCurrentNetworkCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  SEL v14;

  v5 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __78__PKPrinterTool_Client_getLastUsedPrintersForCurrentNetworkCompletionHandler___block_invoke;
  v12 = &unk_24E6C0630;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "getLastUsedPrintersForCurrentNetworkReply:", v7, v9, v10, v11, v12);
  else
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

}

- (void)setLastUsedPrintersForCurrentNetwork:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "setLastUsedPrintersForCurrentNetwork:", v6);

}

- (void)getiCloudPrintersWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  SEL v14;

  v5 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __63__PKPrinterTool_Client_getiCloudPrintersWithCompletionHandler___block_invoke;
  v12 = &unk_24E6C0630;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "getiCloudPrintersReply:", v7, v9, v10, v11, v12);
  else
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

}

- (void)addPrinterToiCloud:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "iCloudInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addPrinterToiCloudWithInfo:", v6);

  }
}

- (void)removePrinterFromiCloud:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "iCloudInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removePrinterFromiCloudWithInfo:", v6);

  }
}

- (void)updateiCloudPrinterDisplayName:(id)a3 newDisplayName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "iCloudInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateiCloudPrinterDisplayName:newDisplayName:", v9, v6);

  }
}

- (void)updateiCloudPrinterLocation:(id)a3 location:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "iCloudInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateiCloudPrinterLocation:newLocation:", v9, v6);

  }
}

- (void)setiCloudPrinters:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "setiCloudPrinters:", v6);

}

- (void)resetPKCloudData
{
  void *v2;
  id v3;

  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "resetPKCloudData");

}

- (void)logiCloudPrintersCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  SEL v14;

  v5 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __59__PKPrinterTool_Client_logiCloudPrintersCompletionHandler___block_invoke;
  v12 = &unk_24E6C0630;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "logiCloudPrintersReply:", v7, v9, v10, v11, v12);
  else
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

}

- (void)browseInfoForPrinter:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a5;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __71__PKPrinterTool_Client_browseInfoForPrinter_timeout_completionHandler___block_invoke;
  v17 = &unk_24E6C0630;
  v19 = a2;
  v12 = v10;
  v18 = v12;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "browseInfoForPrinter:timeout:reply:", v9, v12, a4, v14, v15, v16, v17);
  else
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);

}

- (void)endpointResolve:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a5;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __66__PKPrinterTool_Client_endpointResolve_timeout_completionHandler___block_invoke;
  v17 = &unk_24E6C0630;
  v19 = a2;
  v12 = v10;
  v18 = v12;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "_endpointResolve:timeout:reply:", v9, v12, a4, v14, v15, v16, v17);
  else
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

}

- (void)printerTool_realPathForTmp:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  SEL v14;

  v5 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __51__PKPrinterTool_Client_printerTool_realPathForTmp___block_invoke;
  v12 = &unk_24E6C0630;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "_realPathForTmpReply:", v7, v9, v10, v11, v12);
  else
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

}

- (void)printerTool_removeKeychainItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "_removeKeychainItem:", v6);

}

- (void)printerTool_identifyPrinter:(id)a3 message:(id)a4 actions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "_identifyPrinter:message:actions:", v12, v8, v9);

}

- (void)printerTool_getPrinterDescription:(id)a3 assertReachability:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  SEL v19;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __95__PKPrinterTool_Client_printerTool_getPrinterDescription_assertReachability_completionHandler___block_invoke;
  v17 = &unk_24E6C0630;
  v19 = a2;
  v12 = v10;
  v18 = v12;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "_getPrinterDescription:assertReachability:reply:", v9, v6, v12, v14, v15, v16, v17);
  else
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

}

- (void)printerTool_queryPrinter:(id)a3 attributes:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke;
  v18[3] = &unk_24E6C0630;
  v20 = a2;
  v14 = v11;
  v19 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke_2;
    v16[3] = &unk_24E6C0658;
    v17 = v14;
    objc_msgSend(v15, "_queryPrinter:attributes:reply:", v9, v10, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v14 + 2))(v14, 0);
  }

}

- (void)printerTool_checkAccessState:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __71__PKPrinterTool_Client_printerTool_checkAccessState_completionHandler___block_invoke;
  v15 = &unk_24E6C0630;
  v17 = a2;
  v10 = v8;
  v16 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v11, "_checkAccessState:reply:", v7, v10, v12, v13, v14, v15);
  else
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 3);

}

- (void)startStreamingRequest:(id)a3 printSettings:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __78__PKPrinterTool_Client_startStreamingRequest_printSettings_completionHandler___block_invoke;
  v18 = &unk_24E6C0630;
  v20 = a2;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "startStreamingRequest:printSettings:reply:", v9, v10, v13, v15, v16, v17, v18);
  else
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);

}

- (void)finishRequestWithCancel:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v7;
  NSFileHandle *streamHandle;
  NSFileHandle *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  SEL v18;

  v4 = a3;
  v7 = a4;
  streamHandle = self->_streamHandle;
  if (streamHandle)
  {
    -[NSFileHandle closeFile](streamHandle, "closeFile");
    v9 = self->_streamHandle;
    self->_streamHandle = 0;

  }
  -[PKPrinterTool_Client ptConn](self, "ptConn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __66__PKPrinterTool_Client_finishRequestWithCancel_completionHandler___block_invoke;
  v16 = &unk_24E6C0630;
  v18 = a2;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v12, "finishRequestWithCancel:reply:", v4, v11, v13, v14, v15, v16);
  else
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamHandle, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)ptConn_locked
{
  uint8_t v2[16];

  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_220F9A000, a1, OS_LOG_TYPE_DEFAULT, "Couldn't create an XLC connection from proxy listener", v2, 2u);
  }
  OUTLINED_FUNCTION_0();
}

@end
