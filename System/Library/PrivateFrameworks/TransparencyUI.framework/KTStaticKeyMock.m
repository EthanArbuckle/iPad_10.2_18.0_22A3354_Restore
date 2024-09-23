@implementation KTStaticKeyMock

+ (id)mockStaticKeyWithNotificationCenter:(id)a3
{
  id v3;
  KTStaticKeyMock *v4;
  void *v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  void *v8;
  KTStaticKeyMock *v9;

  v3 = a3;
  v4 = objc_alloc_init(KTStaticKeyMock);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBA7F8], "ktAccountPublicIDWithPKIString:error:", CFSTR("apple-ktpki:YYGzMIGwAgEBAgEBBEEEzJxLXIZEEoaCbsZDjEf3lyd1CXEzzmihWMdRIRaqb2osfA3PJfg6dEVWUChkxJvAqUZG5u5FOxHwQoADqkoNOqFlMGMEFNk5nRWE6ZOuRDPPUCgu5P4sN9TbAgEBBEgwRgIhAPNU82BqsYeOt3XF1ph1a3cLXuJc2qcPsCNDXJDsCxf3AiEA4iSOYBMONpNBZ7p4hz2cprQMT7P/fPZCuPtPrHWeDj5NiQ=="), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTStaticKeyMock setPeerID:](v4, "setPeerID:", v5);

    v6 = dispatch_queue_create("KTStaticKeyMock", 0);
    -[KTStaticKeyMock setMockQueue:](v4, "setMockQueue:", v6);

    v7 = dispatch_queue_create("KTStaticKeyMock-WorkQueue", 0);
    -[KTStaticKeyMock setMockWork:](v4, "setMockWork:", v7);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTStaticKeyMock setMockHandles:](v4, "setMockHandles:", v8);

    -[KTStaticKeyMock setNotificationCenter:](v4, "setNotificationCenter:", v3);
    -[KTStaticKeyMock setDelayCode:](v4, "setDelayCode:", 0);
    -[KTStaticKeyMock setCodeFailure:](v4, "setCodeFailure:", 0);
    v9 = v4;
  }

  return v4;
}

- (void)postNotification:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v11 = *MEMORY[0x24BEBA8C0];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BEBA8C8]);
  -[KTStaticKeyMock notificationCenter](self, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:deliverImmediately:", *MEMORY[0x24BEBA8B8], 0, v9, 0);

}

- (void)codeAvailable:(id)a3 code:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[KTStaticKeyMock mockQueue](self, "mockQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[KTStaticKeyMock codeFailure](self, "codeFailure"))
  {
    objc_msgSend(v9, "setState:", *MEMORY[0x24BEBA8D8]);
  }
  else
  {
    objc_msgSend(v9, "setState:", *MEMORY[0x24BEBA8D0]);
    objc_msgSend(v9, "setSasCode:", CFSTR("123456"));
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 600.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionExpire:", v6);

  }
  objc_msgSend(v9, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTStaticKeyMock postNotification:state:](self, "postNotification:state:", v7, v8);

}

- (void)setupCode:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[KTStaticKeyMock mockQueue](self, "mockQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[KTStaticKeyMock delayCode](self, "delayCode"))
  {
    v6 = dispatch_time(0, 1000000000);
    -[KTStaticKeyMock mockQueue](self, "mockQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29__KTStaticKeyMock_setupCode___block_invoke;
    v8[3] = &unk_251A5AD78;
    v8[4] = self;
    v9 = v4;
    dispatch_after(v6, v7, v8);

  }
  else
  {
    -[KTStaticKeyMock codeAvailable:code:](self, "codeAvailable:code:", v4, CFSTR("123456"));
  }

}

uint64_t __29__KTStaticKeyMock_setupCode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "codeAvailable:code:", *(_QWORD *)(a1 + 40), CFSTR("123456"));
}

- (void)setupKTSession:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  KTStaticKeyMock *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 1000000000);
  -[KTStaticKeyMock mockQueue](self, "mockQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__KTStaticKeyMock_setupKTSession_complete___block_invoke;
  block[3] = &unk_251A5ADC8;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_after(v8, v9, block);

}

void __43__KTStaticKeyMock_setupKTSession_complete___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = objc_alloc_init(MEMORY[0x24BEBA800]);
  objc_msgSend(a1[4], "peer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPeerHandle:", v3);

  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a1[4], "peer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "otherNamesForPeer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExpectedPeerHandles:", v8);

  objc_msgSend(a1[5], "mockHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v2, v10);

  objc_msgSend(a1[5], "peerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPeerAccountIdentity:", v11);

  objc_msgSend(a1[5], "codeAvailable:code:", v2, CFSTR("123456"));
  objc_msgSend(a1[5], "mockWork");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__KTStaticKeyMock_setupKTSession_complete___block_invoke_2;
  v15[3] = &unk_251A5ADA0;
  v13 = a1[6];
  v16 = v2;
  v17 = v13;
  v14 = v2;
  dispatch_async(v12, v15);

}

uint64_t __43__KTStaticKeyMock_setupKTSession_complete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)deleteKTSession:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 2000000000);
  -[KTStaticKeyMock mockQueue](self, "mockQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke;
  block[3] = &unk_251A5ADC8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_after(v8, v9, block);

}

void __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  objc_msgSend(*(id *)(a1 + 32), "mockHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "mockHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

    objc_msgSend(v3, "setState:", *MEMORY[0x24BEBA8E0]);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotification:state:", v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "mockWork");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke_2;
  v9[3] = &unk_251A5ADF0;
  v10 = *(id *)(a1 + 48);
  v11 = v3 != 0;
  dispatch_async(v8, v9);

}

uint64_t __44__KTStaticKeyMock_deleteKTSession_complete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)listKTSessions:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = dispatch_time(0, 3000000000);
  -[KTStaticKeyMock mockQueue](self, "mockQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__KTStaticKeyMock_listKTSessions___block_invoke;
  v8[3] = &unk_251A5AE18;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, v6, v8);

}

void __34__KTStaticKeyMock_listKTSessions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mockWork");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__KTStaticKeyMock_listKTSessions___block_invoke_2;
  v4[3] = &unk_251A5ADA0;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __34__KTStaticKeyMock_listKTSessions___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "mockHandles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

- (void)getKTSessionByHandle:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 1000000000);
  -[KTStaticKeyMock mockQueue](self, "mockQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke;
  block[3] = &unk_251A5ADC8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_after(v8, v9, block);

}

void __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mockHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "mockHandles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "expectedPeerHandles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(a1 + 40));

        if (v12)
          objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "mockWork");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke_2;
  v16[3] = &unk_251A5ADA0;
  v14 = *(id *)(a1 + 48);
  v17 = v2;
  v18 = v14;
  v15 = v2;
  dispatch_async(v13, v16);

}

uint64_t __49__KTStaticKeyMock_getKTSessionByHandle_complete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getKTSessionByID:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_time(0, 1000000000);
  -[KTStaticKeyMock mockQueue](self, "mockQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke;
  block[3] = &unk_251A5AE68;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_after(v8, v9, block);

}

void __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "mockWork");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke_2;
  block[3] = &unk_251A5AE40;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  block[4] = v4;
  v7 = v5;
  dispatch_async(v2, block);

}

void __45__KTStaticKeyMock_getKTSessionByID_complete___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "mockHandles");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

- (OS_dispatch_queue)mockQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMockQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)mockWork
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMockWork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)mockHandles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMockHandles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (KTNotificationCenter)notificationCenter
{
  return (KTNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTAccountPublicID)peerID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)delayCode
{
  return self->_delayCode;
}

- (void)setDelayCode:(BOOL)a3
{
  self->_delayCode = a3;
}

- (BOOL)codeFailure
{
  return self->_codeFailure;
}

- (void)setCodeFailure:(BOOL)a3
{
  self->_codeFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mockHandles, 0);
  objc_storeStrong((id *)&self->_mockWork, 0);
  objc_storeStrong((id *)&self->_mockQueue, 0);
}

@end
