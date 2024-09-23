@implementation STSXPCClientNotificationListener

- (STSXPCClientNotificationListener)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  STSXPCClientNotificationListener *v8;
  STSXPCClientNotificationListener *v9;
  void **p_callbackQueue;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *delayWork;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)STSXPCClientNotificationListener;
  v8 = -[STSXPCClientNotificationListener init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    p_callbackQueue = (void **)&v9->_callbackQueue;
    objc_storeStrong((id *)&v9->_callbackQueue, a4);
    if (!v9->_callbackQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = dispatch_queue_create("STSHelperNotificaitonListener", v12);
      v14 = *p_callbackQueue;
      *p_callbackQueue = v13;

    }
    v9->_xpcUpdateLock._os_unfair_lock_opaque = 0;
    v15 = objc_opt_new();
    delayWork = v9->_delayWork;
    v9->_delayWork = (NSMutableArray *)v15;

  }
  return v9;
}

- (BOOL)connected
{
  os_unfair_lock_s *p_xpcUpdateLock;
  void *v3;
  _QWORD v5[5];

  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2158BC458;
  v5[3] = &unk_24D3A7388;
  v5[4] = self;
  os_unfair_lock_lock(&self->_xpcUpdateLock);
  sub_2158BC458((uint64_t)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_xpcUpdateLock);
  LOBYTE(p_xpcUpdateLock) = objc_msgSend(v3, "BOOLValue");

  return (char)p_xpcUpdateLock;
}

- (void)_executeWhenXPCAvailable:(id)a3
{
  id v4;
  os_unfair_lock_s *p_xpcUpdateLock;
  void (**v6)(_QWORD);
  _QWORD *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  STSXPCClientNotificationListener *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = sub_2158BC5A8;
  v10 = &unk_24D3A73B0;
  v11 = self;
  v13 = &v14;
  v6 = (void (**)(_QWORD))v4;
  v12 = v6;
  v7 = v8;
  os_unfair_lock_lock(p_xpcUpdateLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_xpcUpdateLock);

  if (*((_BYTE *)v15 + 24))
    v6[2](v6);

  _Block_object_dispose(&v14, 8);
}

- (void)alternativerCarrierSend:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_2158BC6E0;
  v11[3] = &unk_24D3A7428;
  v13 = v8;
  v14 = a2;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  v10 = v8;
  -[STSXPCClientNotificationListener _executeWhenXPCAvailable:](self, "_executeWhenXPCAvailable:", v11);

}

- (void)sendConnectionHandoverStarted
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_2158BC9E4;
  v2[3] = &unk_24D3A6F58;
  v2[4] = self;
  -[STSXPCClientNotificationListener _executeWhenXPCAvailable:](self, "_executeWhenXPCAvailable:", v2);
}

- (void)sendConnectionHandoverCompleted
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_2158BCAE0;
  v2[3] = &unk_24D3A6F58;
  v2[4] = self;
  -[STSXPCClientNotificationListener _executeWhenXPCAvailable:](self, "_executeWhenXPCAvailable:", v2);
}

- (id)setRequestHandoverConfirmation:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_2158BCC68;
  v12 = sub_2158BCC78;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2158BCC80;
  v7[3] = &unk_24D3A7450;
  v7[4] = self;
  v7[5] = &v8;
  -[STSXPCClientNotificationListener _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestHandoverConfirmation:", v3);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)startHandoff
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_2158BCC68;
  v12 = sub_2158BCC78;
  v13 = 0;
  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2158BCDEC;
  v7[3] = &unk_24D3A7450;
  v7[4] = self;
  v7[5] = &v8;
  -[STSXPCClientNotificationListener _synchronousRemoteProxyWithErrorHandler:](self, "_synchronousRemoteProxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = sub_2158BCE50;
  v6[3] = &unk_24D3A7478;
  v6[4] = &v8;
  objc_msgSend(v3, "startHandoffWithCompletion:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)activateISO18013CredentialWithIdentifier:(id)a3 elementSelection:(id)a4 authData:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  SEL v20;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = sub_2158BF3F8((id *)[STSCredentialSelect alloc], v14, v13, v12);

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_2158BCF6C;
  v18[3] = &unk_24D3A73D8;
  v18[4] = self;
  v19 = v11;
  v20 = a2;
  v16 = v11;
  -[STSXPCClientNotificationListener _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendCredentialSelect:callback:", v15, v16);

}

- (void)sendISO18013SessionEstablishment:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_2158BD230;
  v15[3] = &unk_24D3A73D8;
  v15[4] = self;
  v9 = v7;
  v16 = v9;
  v17 = a2;
  v10 = a3;
  -[STSXPCClientNotificationListener _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = sub_2158BD400;
  v13[3] = &unk_24D3A7400;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "iso18013ReaderSendSessionEstablishment:callback:", v10, v13);

}

- (void)sendISO18013SessionData:(id)a3 status:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_2158BD514;
  v18[3] = &unk_24D3A73D8;
  v18[4] = self;
  v11 = v9;
  v19 = v11;
  v20 = a2;
  v12 = a4;
  v13 = a3;
  -[STSXPCClientNotificationListener _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = sub_2158BD6E4;
  v16[3] = &unk_24D3A7400;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "iso18013ReaderSendSessionData:status:callback:", v13, v12, v16);

}

- (void)testGetRemoteTransceiverProxyXPCEndpointWithType:(unint64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;

  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_2158BD7E0;
  v14[3] = &unk_24D3A73D8;
  v14[4] = self;
  v9 = v7;
  v15 = v9;
  v16 = a2;
  -[STSXPCClientNotificationListener _asynchronousRemoteProxyWithErrorHandler:](self, "_asynchronousRemoteProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = sub_2158BD9B4;
  v12[3] = &unk_24D3A74A0;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "getRemoteTransceiverProxyXPCEndpointWithType:callback:", a3 == 0, v12);

}

- (void)invalidateXPCConnection
{
  void *v3;

  -[STSXPCClientNotificationListener xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[STSXPCClientNotificationListener setXpcConnection:](self, "setXpcConnection:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STSXPCClientNotificationListener xpc](self, "xpc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)STSXPCClientNotificationListener;
  -[STSXPCClientNotificationListener dealloc](&v4, sel_dealloc);
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  STSXPCClientNotificationListener *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  -[STSXPCClientNotificationListener xpc](v2, "xpc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSXPCClientNotificationListener setXpc:](v2, "setXpc:", v4);

    -[STSXPCClientNotificationListener xpc](v2, "xpc");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v2);

    -[STSXPCClientNotificationListener xpc](v2, "xpc");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resume");

  }
  -[STSXPCClientNotificationListener xpc](v2, "xpc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSXPCListenerEndpoint *)v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  os_unfair_lock_s *p_xpcUpdateLock;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  STSXPCClientNotificationListener *v14;
  id v15;

  v5 = a4;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = sub_2158BDBE0;
  v13 = &unk_24D3A74F0;
  v14 = self;
  v15 = v5;
  v7 = v5;
  os_unfair_lock_lock(p_xpcUpdateLock);
  sub_2158BDBE0((uint64_t)&v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_xpcUpdateLock);
  LOBYTE(p_xpcUpdateLock) = objc_msgSend(v8, "BOOLValue", v10, v11, v12, v13, v14);

  return (char)p_xpcUpdateLock;
}

- (void)dummyStart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener dummyStart]", 285, self, CFSTR("Listener started"), v2, v3, v4);
}

- (void)transactionStarted:(unint64_t)a3
{
  uint64_t v3;
  id v4;

  if (a3 - 1 > 3)
    v3 = 0;
  else
    v3 = qword_2158DB838[a3 - 1];
  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionStarted:", v3);

}

- (void)processCredentialRequestList:(id)a3 readerAuthInfo:(id)a4
{
  id v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id *v21;
  id *v22;
  int v23;
  id v24;
  STS18013ReaderAnalyticsData *v25;
  _BOOL8 v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  STS18013ReaderAuthInfo *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  STS18013ReaderAuthInfo *v44;
  id *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  STS18013ReaderAnalyticsData *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (id *)a4;
  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v49 = v10;
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v50 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v53 != v17)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          if (v19 && *(_QWORD *)(v19 + 8))
          {
            sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener processCredentialRequestList:readerAuthInfo:]", 328, self, CFSTR("Unexpected type=%lu"), v14, v15, *(_QWORD *)(v19 + 8));
          }
          else
          {
            -[STSXPCClientNotificationListener _generateFromCredRequest:](self, "_generateFromCredRequest:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v11, "addObject:", v20);

          }
        }
        v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v16);
    }

    if (v7 && (v21 = (id *)v7[10]) != 0)
    {
      v22 = v21;
      v48 = v21[2];
      v23 = 0;
      v24 = v22[3];
    }
    else
    {
      v48 = 0;
      v22 = 0;
      v24 = 0;
      v23 = 1;
    }
    v47 = v24;
    v25 = [STS18013ReaderAnalyticsData alloc];
    if (v23)
    {
      v29 = 0;
      v27 = 0;
      v26 = 0;
      v28 = 0;
      v30 = 0;
    }
    else
    {
      v26 = *((_BYTE *)v22 + 8) != 0;
      v27 = v22[2];
      v28 = v22[3];
      v29 = v22[4];
      v30 = v22[5];
    }
    v31 = v30;
    v51 = -[STS18013ReaderAnalyticsData initWithTrusted:untrustedIdentifier:untrustedOrganization:untrustedIssuerIdentifier:untrustedIssuerOrganization:](v25, "initWithTrusted:untrustedIdentifier:untrustedOrganization:untrustedIssuerIdentifier:untrustedIssuerOrganization:", v26, v27, v28, v29, v31);

    v46 = (void *)objc_msgSend(v11, "copy");
    v44 = [STS18013ReaderAuthInfo alloc];
    v45 = v22;
    if (v7)
    {
      v32 = v7[1];
      v43 = v7[2];
      v42 = v7[3];
      v41 = v7[4];
      v40 = v7[5];
      v39 = v7[6];
      v33 = v7[7];
      v34 = v7[8];
      v35 = v7[9];
    }
    else
    {
      v34 = 0;
      v39 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v32 = 0;
      v40 = 0;
      v33 = 0;
      v35 = 0;
    }
    v36 = v35;
    v37 = -[STS18013ReaderAuthInfo initWithIdentifier:organization:organizationUnit:iconData:iconURL:iconMediaType:privacyPolicyURL:merchantCategoryCode:certificateData:readerAnalyticsData:](v44, "initWithIdentifier:organization:organizationUnit:iconData:iconURL:iconMediaType:privacyPolicyURL:merchantCategoryCode:certificateData:readerAnalyticsData:", v32, v43, v42, v41, v40, v39, v33, v34, v36, v51);

    v10 = v49;
    objc_msgSend(v49, "processISO18013CredentialProposals:readerAuthInfo:", v46, v37);

    v6 = v50;
  }
  else
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener processCredentialRequestList:readerAuthInfo:]", 321, self, CFSTR("Not implemented"), v8, v9, v38);
  }

}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transactionEndedWithIdentifier:error:", v7, v6);

}

- (void)receivedRawDataFromAlternativeCarrier:(id)a3 dataPending:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "alternativeCarrierReceived:dataPending:", v7, v4);

}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  id v5;

  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "alternativeCarrierConnectedWithStatus:", -[STSXPCClientNotificationListener _translateFromCarrierConnectionStatus:](self, "_translateFromCarrierConnectionStatus:", a3));

}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  id v5;

  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "alternativeCarrierDisconnectedWithStatus:", -[STSXPCClientNotificationListener _translateFromCarrierConnectionStatus:](self, "_translateFromCarrierConnectionStatus:", a3));

}

- (void)iso18013DecryptedDeviceResponse:(id)a3 sessionDataStatus:(id)a4 mDocResponseStatus:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:", v14, v10, v11, v12);

}

- (void)sessionTranscriptGenerated:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STSXPCClientNotificationListener delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "sessionTranscriptGenerated:", v5);

}

- (id)_stsHandoverNotificationListenerProtocol
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DECB18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_processCredentialRequestList_readerAuthInfo_, 0, 0);

  return v2;
}

- (id)_stsHandoverNotificationListenerCallbackProtocol
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DF1558);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_sendCredentialSelect_callback_, 0, 0);

  return v2;
}

- (id)_generateFromCredRequest:(id)a3
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (v3[1])
    {
      v5 = 0;
      goto LABEL_10;
    }
    v5 = (void *)objc_opt_new();
    v6 = (void *)*((_QWORD *)v4 + 2);
  }
  else
  {
    v5 = (void *)objc_opt_new();
    v6 = 0;
  }
  v7 = v6;
  objc_msgSend(v5, "setCredentialIdentifier:", v7);

  if (v4)
  {
    v8 = *((id *)v4 + 4);
    objc_msgSend(v5, "setAuthenticationACL:", v8);

    v9 = (void *)*((_QWORD *)v4 + 6);
  }
  else
  {
    objc_msgSend(v5, "setAuthenticationACL:", 0);
    v9 = 0;
  }
  v10 = v9;
  objc_msgSend(v5, "setDocType:", v10);

  v11 = (void *)objc_opt_new();
  if (v4)
    v12 = (void *)*((_QWORD *)v4 + 3);
  else
    v12 = 0;
  v13 = v12;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_2158BEB08;
  v17[3] = &unk_24D3A7518;
  v18 = v11;
  v14 = v11;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v17);

  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v5, "setElementsByNamespace:", v15);

LABEL_10:
  return v5;
}

- (unint64_t)_translateFromCarrierConnectionStatus:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return qword_2158DB858[a3 - 1];
}

- (id)_synchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v5;
  os_unfair_lock_s *p_xpcUpdateLock;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v10[2] = sub_2158BED74;
  v10[3] = &unk_24D3A7540;
  v10[4] = self;
  v11 = v5;
  v12 = a2;
  v7 = v5;
  os_unfair_lock_lock(&self->_xpcUpdateLock);
  sub_2158BED74((uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_xpcUpdateLock);

  return v8;
}

- (id)_asynchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v5;
  os_unfair_lock_s *p_xpcUpdateLock;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v10[2] = sub_2158BF0A4;
  v10[3] = &unk_24D3A7540;
  v10[4] = self;
  v11 = v5;
  v12 = a2;
  v7 = v5;
  os_unfair_lock_lock(&self->_xpcUpdateLock);
  sub_2158BF0A4((uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_xpcUpdateLock);

  return v8;
}

- (STSXPCClientNotificationListenerDelegate)delegate
{
  return (STSXPCClientNotificationListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSXPCListener)xpc
{
  return self->_xpc;
}

- (void)setXpc:(id)a3
{
  objc_storeStrong((id *)&self->_xpc, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (os_unfair_lock_s)xpcUpdateLock
{
  return self->_xpcUpdateLock;
}

- (void)setXpcUpdateLock:(os_unfair_lock_s)a3
{
  self->_xpcUpdateLock = a3;
}

- (NSMutableArray)delayWork
{
  return self->_delayWork;
}

- (void)setDelayWork:(id)a3
{
  objc_storeStrong((id *)&self->_delayWork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayWork, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
