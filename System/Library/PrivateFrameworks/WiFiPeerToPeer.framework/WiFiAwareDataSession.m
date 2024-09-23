@implementation WiFiAwareDataSession

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 passphrase:(id)a6 pmk:(id)a7 pmkID:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  WiFiAwareDataSession *v20;
  WiFiAwareDataSession *v21;
  uint64_t v22;
  WiFiAwarePublishDatapathServiceSpecificInfo *serviceSpecificInfo;
  uint64_t v24;
  NSString *passphrase;
  uint64_t v26;
  NSData *pmk;
  uint64_t v28;
  NSData *pmkID;
  WiFiP2PXPCConnection *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  uint64_t v33;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v36;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)WiFiAwareDataSession;
  v20 = -[WiFiAwareDataSession init](&v36, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_discoveryResult, a3);
    v21->_serviceType = a4;
    v22 = objc_msgSend(v16, "copy");
    serviceSpecificInfo = v21->_serviceSpecificInfo;
    v21->_serviceSpecificInfo = (WiFiAwarePublishDatapathServiceSpecificInfo *)v22;

    v24 = objc_msgSend(v17, "copy");
    passphrase = v21->_passphrase;
    v21->_passphrase = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    pmk = v21->_pmk;
    v21->_pmk = (NSData *)v26;

    v28 = objc_msgSend(v19, "copy");
    pmkID = v21->_pmkID;
    v21->_pmkID = (NSData *)v28;

    v30 = [WiFiP2PXPCConnection alloc];
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiAwareDataSession", 0, v31);
    v33 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v30, "initWithEndpointType:queue:retryTimeout:", 1, v32, 5000000000);
    xpcConnection = v21->_xpcConnection;
    v21->_xpcConnection = (WiFiP2PXPCConnection *)v33;

    -[WiFiP2PXPCConnection setDelegate:](v21->_xpcConnection, "setDelegate:", v21);
    v21->_internetSharingPolicy = 0;
  }

  return v21;
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5
{
  return -[WiFiAwareDataSession initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:](self, "initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:", a3, a4, a5, 0, 0, 0);
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 passphrase:(id)a6
{
  return -[WiFiAwareDataSession initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:](self, "initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:", a3, a4, a5, a6, 0, 0);
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 pmk:(id)a6
{
  return -[WiFiAwareDataSession initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:](self, "initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:", a3, a4, a5, 0, a6, 0);
}

- (WiFiAwareDataSession)initWithDiscoveryResult:(id)a3 serviceType:(int64_t)a4 serviceSpecificInfo:(id)a5 pmk:(id)a6 pmkID:(id)a7
{
  return -[WiFiAwareDataSession initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:](self, "initWithDiscoveryResult:serviceType:serviceSpecificInfo:passphrase:pmk:pmkID:", a3, a4, a5, 0, a6, a7);
}

- (void)handleError:(int64_t)a3
{
  void *v5;
  id v6;

  -[WiFiAwareDataSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_datapathID)
    objc_msgSend(v5, "dataSession:terminatedWithReason:", self, -1);
  else
    objc_msgSend(v5, "dataSession:failedToStartWithError:", self, a3);
  -[WiFiAwareDataSession resetState](self, "resetState");

}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4CE0);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A14E8);
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WiFiAwareDatapathConfiguration *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WiFiAwareDatapathConfiguration *v16;

  self->_internetSharingPolicy = 0;
  v6 = a4;
  v7 = a3;
  v8 = [WiFiAwareDatapathConfiguration alloc];
  -[WiFiAwareDataSession discoveryResult](self, "discoveryResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WiFiAwareDataSession serviceType](self, "serviceType");
  -[WiFiAwareDataSession passphrase](self, "passphrase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSession pmk](self, "pmk");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSession pmkID](self, "pmkID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSession serviceSpecificInfo](self, "serviceSpecificInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDataSession internetSharingConfiguration](self, "internetSharingConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WiFiAwareDatapathConfiguration initWithDiscoveryResult:serviceType:passphrase:pmk:pmkID:serviceSpecificInfo:internetSharingConfiguration:](v8, "initWithDiscoveryResult:serviceType:passphrase:pmk:pmkID:serviceSpecificInfo:internetSharingConfiguration:", v9, v10, v11, v12, v13, v14, v15);

  objc_msgSend(v7, "createDatapathWithConfiguration:completionHandler:", v16, v6);
}

- (void)resetState
{
  NSNumber *datapathID;
  WiFiMACAddress *initiatorDataAddress;

  datapathID = self->_datapathID;
  self->_datapathID = 0;

  initiatorDataAddress = self->_initiatorDataAddress;
  self->_initiatorDataAddress = 0;

  self->_localInterfaceIndex = 0;
}

- (void)start
{
  -[WiFiP2PXPCConnection start](self->_xpcConnection, "start");
}

- (void)stop
{
  -[WiFiP2PXPCConnection withRemoteObjectProxy:](self->_xpcConnection, "withRemoteObjectProxy:", &__block_literal_global);
}

uint64_t __28__WiFiAwareDataSession_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)reportIssue:(id)a3
{
  id v4;
  WiFiP2PXPCConnection *xpcConnection;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  xpcConnection = self->_xpcConnection;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__WiFiAwareDataSession_reportIssue___block_invoke;
  v7[3] = &unk_1E6E1E478;
  v8 = v4;
  v6 = v4;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:](xpcConnection, "withRemoteObjectProxy:", v7);

}

uint64_t __36__WiFiAwareDataSession_reportIssue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reportIssue:", *(_QWORD *)(a1 + 32));
}

- (void)updateLinkStatus:(int64_t)a3
{
  WiFiP2PXPCConnection *xpcConnection;
  _QWORD v4[5];

  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__WiFiAwareDataSession_updateLinkStatus___block_invoke;
  v4[3] = &__block_descriptor_40_e32_v16__0___WiFiAwareDatapathXPC__8l;
  v4[4] = a3;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:](xpcConnection, "withRemoteObjectProxy:", v4);
}

uint64_t __41__WiFiAwareDataSession_updateLinkStatus___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateLinkStatus:", *(_QWORD *)(a1 + 32));
}

- (void)generateStatisticsReportWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  WiFiP2PXPCConnection *xpcConnection;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    xpcConnection = self->_xpcConnection;
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E6E1E4E8;
    v11 = v4;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E6E1E510;
    v9 = v11;
    -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v10, v8);

  }
}

void __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E6E1E4C0;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(a2, "generateStatisticsReportWithCompletionHandler:", v7);

}

void __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __70__WiFiAwareDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)generateCurrentNetworkRecordForInternetSharingSession:(id)a3
{
  id v4;
  void *v5;
  WiFiP2PXPCConnection *xpcConnection;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    xpcConnection = self->_xpcConnection;
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke;
    v10[3] = &unk_1E6E1E4E8;
    v11 = v4;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_3;
    v8[3] = &unk_1E6E1E510;
    v9 = v11;
    -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v10, v8);

  }
}

void __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_2;
  v7[3] = &unk_1E6E1E538;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(a2, "generateCurrentNetworkRecordForInternetSharingSession:", v7);

}

void __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __78__WiFiAwareDataSession_generateCurrentNetworkRecordForInternetSharingSession___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)setWantsPeerRSSIUpdates:(BOOL)a3 withCompletionHandler:(id)a4
{
  WiFiP2PXPCConnection *xpcConnection;
  _QWORD v5[4];
  BOOL v6;

  xpcConnection = self->_xpcConnection;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__WiFiAwareDataSession_setWantsPeerRSSIUpdates_withCompletionHandler___block_invoke;
  v5[3] = &__block_descriptor_33_e42_v24__0___WiFiAwareDatapathXPC__8___v__q_16l;
  v6 = a3;
  -[WiFiP2PXPCConnection withRemoteObjectProxy:clientCompletionHandler:](xpcConnection, "withRemoteObjectProxy:clientCompletionHandler:", v5, a4);
}

uint64_t __70__WiFiAwareDataSession_setWantsPeerRSSIUpdates_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "setWantsPeerRSSIUpdates:withCompletionHandler:", *(unsigned __int8 *)(a1 + 32), a3);
}

- (WiFiMACAddress)localDataAddress
{
  return self->_initiatorDataAddress;
}

- (NSString)description
{
  NSNumber *datapathID;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t localInterfaceIndex;
  void *v8;
  void *v9;

  datapathID = self->_datapathID;
  if (datapathID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), datapathID);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("unset");
  }
  if (self->_initiatorDataAddress)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_initiatorDataAddress);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("unset");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  localInterfaceIndex = self->_localInterfaceIndex;
  -[WiFiAwareDataSession discoveryResult](self, "discoveryResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<WiFiAwareDataSession: datapathID=%@, initiator=%@, localIdx=%u, discoveryResult=%@>"), v4, v5, localInterfaceIndex, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)datapathStartedWithInstanceID:(unsigned __int8)a3 initiatorDataAddress:(id)a4 localInterfaceIndex:(unsigned int)a5
{
  uint64_t v6;
  WiFiMACAddress *v8;
  NSNumber *datapathID;
  NSNumber *v10;
  NSNumber *v11;
  WiFiMACAddress *initiatorDataAddress;
  id v13;

  v6 = a3;
  v8 = (WiFiMACAddress *)a4;
  datapathID = self->_datapathID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
  v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v11 = self->_datapathID;
  self->_datapathID = v10;

  initiatorDataAddress = self->_initiatorDataAddress;
  self->_initiatorDataAddress = v8;

  self->_localInterfaceIndex = a5;
  if (!datapathID)
  {
    -[WiFiAwareDataSession delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSessionRequestStarted:", self);

  }
}

- (void)datapathConfirmedForPeerDataAddress:(id)a3 serviceSpecificInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WiFiAwareDataSession delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:", self, v7, v6);

}

- (void)datapathReceivedControlDataAddress:(id)a3 serviceSpecificInfo:(id)a4 onInterfaceIndex:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = a3;
  v8 = a4;
  -[WiFiAwareDataSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "dataSession:receivedControlDataAddress:serviceSpecificInfo:onInterfaceIndex:", self, v10, v8, v5);

}

- (int64_t)internetSharingPolicy
{
  return self->_internetSharingPolicy;
}

- (void)datapathUpdatedInternetSharingPolicy:(int64_t)a3
{
  self->_internetSharingPolicy = a3;
}

- (void)datapathUpdatedPeerRSSI:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[WiFiAwareDataSession delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "dataSession:updatedPeerRSSI:", self, v3);

}

- (void)datapathFailedToStartWithError:(int64_t)a3
{
  void *v5;

  -[WiFiAwareDataSession resetState](self, "resetState");
  -[WiFiAwareDataSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSession:failedToStartWithError:", self, a3);

  -[WiFiP2PXPCConnection stop](self->_xpcConnection, "stop");
}

- (void)datapathTerminatedWithReason:(int64_t)a3
{
  void *v5;

  -[WiFiAwareDataSession resetState](self, "resetState");
  -[WiFiAwareDataSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSession:terminatedWithReason:", self, a3);

  -[WiFiP2PXPCConnection stop](self->_xpcConnection, "stop");
}

- (WiFiAwareDiscoveryResult)discoveryResult
{
  return self->_discoveryResult;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (WiFiAwarePublishDatapathServiceSpecificInfo)serviceSpecificInfo
{
  return self->_serviceSpecificInfo;
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSData)pmk
{
  return self->_pmk;
}

- (NSData)pmkID
{
  return self->_pmkID;
}

- (WiFiAwareInternetSharingConfiguration)internetSharingConfiguration
{
  return self->_internetSharingConfiguration;
}

- (void)setInternetSharingConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (WiFiAwareDataSessionDelegate)delegate
{
  return (WiFiAwareDataSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internetSharingConfiguration, 0);
  objc_storeStrong((id *)&self->_pmkID, 0);
  objc_storeStrong((id *)&self->_pmk, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_serviceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_discoveryResult, 0);
  objc_storeStrong((id *)&self->_initiatorDataAddress, 0);
  objc_storeStrong((id *)&self->_datapathID, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
