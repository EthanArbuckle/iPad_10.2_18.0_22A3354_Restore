@implementation WiFiAwarePublisher

- (WiFiAwarePublisher)initWithConfiguration:(id)a3
{
  id v4;
  WiFiAwarePublisher *v5;
  uint64_t v6;
  WiFiAwarePublishConfiguration *configuration;
  NSMutableArray *v8;
  NSMutableArray *dataSessionHandles;
  WiFiP2PXPCConnection *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  uint64_t v13;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WiFiAwarePublisher;
  v5 = -[WiFiAwarePublisher init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (WiFiAwarePublishConfiguration *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    dataSessionHandles = v5->_dataSessionHandles;
    v5->_dataSessionHandles = v8;

    v10 = [WiFiP2PXPCConnection alloc];
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiAwarePublisher", 0, v11);
    v13 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v10, "initWithEndpointType:queue:retryTimeout:", 1, v12, +[WiFiP2PXPCConnection defaultRetryTimeout](WiFiP2PXPCConnection, "defaultRetryTimeout"));
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (WiFiP2PXPCConnection *)v13;

    -[WiFiP2PXPCConnection setDelegate:](v5->_xpcConnection, "setDelegate:", v5);
  }

  return v5;
}

- (void)handleError:(int64_t)a3
{
  void *v5;
  NSNumber *publishID;
  id v7;

  -[WiFiAwarePublisher delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (self->_publishID)
    objc_msgSend(v5, "publisher:terminatedWithReason:", self, -1);
  else
    objc_msgSend(v5, "publisher:failedToStartWithError:", self, a3);
  publishID = self->_publishID;
  self->_publishID = 0;

}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4EC0);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A2C58);
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WiFiAwarePublisher delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_dataSessionHandles;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "publisher:dataTerminatedForHandle:reason:", self, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), -1, (_QWORD)v15);
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_dataSessionHandles, "removeAllObjects");
  -[WiFiAwarePublisher configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createPublishWithConfiguration:completionHandler:", v14, v7);

}

- (void)start
{
  -[WiFiP2PXPCConnection start](self->_xpcConnection, "start");
}

- (void)stop
{
  -[WiFiP2PXPCConnection withRemoteObjectProxy:](self->_xpcConnection, "withRemoteObjectProxy:", &__block_literal_global_5);
}

uint64_t __26__WiFiAwarePublisher_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)sendMessage:(id)a3 toPeerAddress:(id)a4 withInstanceID:(unsigned __int8)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  WiFiP2PXPCConnection *xpcConnection;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unsigned __int8 v18;

  v10 = a3;
  v11 = a4;
  xpcConnection = self->_xpcConnection;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__WiFiAwarePublisher_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke;
  v15[3] = &unk_1E6E1EA50;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v15, a6);

}

uint64_t __81__WiFiAwarePublisher_sendMessage_toPeerAddress_withInstanceID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "sendMessage:toPeerAddress:withInstanceID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), a3);
}

- (void)terminateDataSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  WiFiP2PXPCConnection *xpcConnection;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__WiFiAwarePublisher_terminateDataSession_completionHandler___block_invoke;
  v9[3] = &unk_1E6E1EA78;
  v10 = v6;
  v8 = v6;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v9, a4);

}

uint64_t __61__WiFiAwarePublisher_terminateDataSession_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "terminateDataSession:completionHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (void)updateServiceSpecificInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  WiFiAwarePublisher *v7;
  WiFiP2PXPCConnection *xpcConnection;
  WiFiAwarePublisher *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WiFiAwarePublisher *v13;

  v6 = a3;
  v7 = self;
  xpcConnection = v7->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke;
  v11[3] = &unk_1E6E1EAC8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v11, a4);

}

void __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6E1EAA0;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v7 = v5;
  objc_msgSend(a2, "updateServiceSpecificInfo:completionHandler:", v6, v8);

}

void __66__WiFiAwarePublisher_updateServiceSpecificInfo_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v4;
  id *v5;

  v4 = (id *)*(id *)(a1 + 32);
  v5 = v4;
  if (!a2 && v4)
    objc_msgSend(v4[5], "setServiceSpecificInfo:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)updateDatapathServiceSpecificInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  WiFiAwarePublisher *v7;
  WiFiP2PXPCConnection *xpcConnection;
  WiFiAwarePublisher *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WiFiAwarePublisher *v13;

  v6 = a3;
  v7 = self;
  xpcConnection = v7->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke;
  v11[3] = &unk_1E6E1EAC8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v11, a4);

}

void __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6E1EAA0;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v7 = v5;
  objc_msgSend(a2, "updateDatapathServiceSpecificInfo:completionHandler:", v6, v8);

}

void __74__WiFiAwarePublisher_updateDatapathServiceSpecificInfo_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v4;
  uint64_t v5;
  void *v6;
  id *v7;

  v4 = (id *)*(id *)(a1 + 32);
  v7 = v4;
  if (!a2 && v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4[5], "datapathConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setServiceSpecificInfo:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)reportIssue:(id)a3 forDataSession:(id)a4
{
  id v6;
  id v7;
  WiFiP2PXPCConnection *xpcConnection;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  xpcConnection = self->_xpcConnection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__WiFiAwarePublisher_reportIssue_forDataSession___block_invoke;
  v11[3] = &unk_1E6E1EAF0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:](xpcConnection, "withRemoteObjectProxy:", v11);

}

uint64_t __49__WiFiAwarePublisher_reportIssue_forDataSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reportIssue:forDataSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)updateLinkStatus:(int64_t)a3 forDataSession:(id)a4
{
  id v6;
  WiFiP2PXPCConnection *xpcConnection;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__WiFiAwarePublisher_updateLinkStatus_forDataSession___block_invoke;
  v9[3] = &unk_1E6E1EB18;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:](xpcConnection, "withRemoteObjectProxy:", v9);

}

uint64_t __54__WiFiAwarePublisher_updateLinkStatus_forDataSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateLinkStatus:forDataSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)generateStatisticsReportForDataSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WiFiP2PXPCConnection *xpcConnection;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    xpcConnection = self->_xpcConnection;
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke;
    v12[3] = &unk_1E6E1EB40;
    v13 = v6;
    v14 = v7;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_3;
    v10[3] = &unk_1E6E1E510;
    v11 = v14;
    -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v12, v10);

  }
}

void __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_2;
  v8[3] = &unk_1E6E1E4C0;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "generateStatisticsReportForDataSession:completionHandler:", v6, v8);

}

void __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79__WiFiAwarePublisher_generateStatisticsReportForDataSession_completionHandler___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)publishStartedWithInstanceID:(unsigned __int8)a3
{
  NSNumber *publishID;
  NSNumber *v5;
  NSNumber *v6;
  id v7;

  publishID = self->_publishID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v6 = self->_publishID;
  self->_publishID = v5;

  if (!publishID)
  {
    -[WiFiAwarePublisher delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publisherStarted:", self);

  }
}

- (void)publishDataConfirmedForHandle:(id)a3 localInterfaceIndex:(unsigned int)a4 serviceSpecificInfo:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v6 = *(_QWORD *)&a4;
  v10 = a3;
  v8 = a5;
  -[NSMutableArray addObject:](self->_dataSessionHandles, "addObject:", v10);
  -[WiFiAwarePublisher delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:", self, v10, v6, v8);

}

- (void)publishDataTerminatedForHandle:(id)a3 reason:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableArray removeObject:](self->_dataSessionHandles, "removeObject:");
  -[WiFiAwarePublisher delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "publisher:dataTerminatedForHandle:reason:", self, v7, a4);

}

- (void)publishFailedToStartWithError:(int64_t)a3
{
  NSNumber *publishID;
  void *v6;

  publishID = self->_publishID;
  self->_publishID = 0;

  -[WiFiAwarePublisher delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisher:failedToStartWithError:", self, a3);

  -[WiFiP2PXPCConnection stop](self->_xpcConnection, "stop");
}

- (void)publishReceivedMessage:(id)a3 fromSubscriberID:(unsigned __int8)a4 subscriberAddress:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  -[WiFiAwarePublisher delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "publisher:receivedMessage:fromSubscriberID:subscriberAddress:", self, v10, v6, v8);

}

- (void)publishTerminatedWithReason:(int64_t)a3
{
  NSNumber *publishID;
  void *v6;

  publishID = self->_publishID;
  self->_publishID = 0;

  -[WiFiAwarePublisher delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisher:terminatedWithReason:", self, a3);

  -[WiFiP2PXPCConnection stop](self->_xpcConnection, "stop");
}

- (NSString)description
{
  NSNumber *publishID;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  publishID = self->_publishID;
  if (publishID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), publishID);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("unset");
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwarePublisher configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<WiFiAwarePublisher: PublishID=%@, Service=%@>"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (WiFiAwarePublisherDelegate)delegate
{
  return (WiFiAwarePublisherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WiFiAwarePublishConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_publishID, 0);
  objc_storeStrong((id *)&self->_dataSessionHandles, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
