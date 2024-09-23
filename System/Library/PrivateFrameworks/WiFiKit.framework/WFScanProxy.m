@implementation WFScanProxy

+ (id)scanProxyWithClient:(id)a3
{
  id v3;
  WFScanProxy *v4;

  v3 = a3;
  v4 = -[WFScanProxy initWithClient:]([WFScanProxy alloc], "initWithClient:", v3);

  return v4;
}

- (WFScanProxy)initWithClient:(id)a3
{
  id v5;
  WFScanProxy *v6;
  WFScanProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFScanProxy;
  v6 = -[WFScanProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_client, a3);

  return v7;
}

- (double)scanInterval
{
  return 10.0;
}

- (BOOL)isScanningAllowed
{
  void *v2;
  char v3;

  -[WFScanProxy client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "powered");

  return v3;
}

- (BOOL)isChannel6GHzPSC:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  if ((objc_msgSend(v3, "flags") & 0x2000) != 0)
  {
    v5 = objc_msgSend(v3, "channel");
    v6 = 0;
    do
    {
      v7 = isChannel6GHzPSC__pscChannels[v6];
      v4 = v5 == v7;
    }
    while (v5 != v7 && v6++ != 14);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSArray)scannableChannels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[WFScanProxy client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supported20MHzChannels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v12, "flags", (_QWORD)v14) & 0x2000) == 0
            || -[WFScanProxy isChannel6GHzPSC:](self, "isChannel6GHzPSC:", v12))
          {
            objc_msgSend(v6, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (void)initiateNoNetworksSoftError
{
  void *v2;
  id v3;

  -[WFScanProxy client](self, "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyNoNetworksFound");

}

- (void)performScanWithRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[WFScanProxy client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cScanParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__WFScanProxy_performScanWithRequest_reply___block_invoke;
  v12[3] = &unk_24DC35440;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "performScanWithParameters:reply:", v10, v12);

}

void __44__WFScanProxy_performScanWithRequest_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__2;
    v8[4] = __Block_byref_object_dispose__2;
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__WFScanProxy_performScanWithRequest_reply___block_invoke_3;
    v7[3] = &unk_24DC35528;
    v7[4] = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    _Block_object_dispose(v8, 8);

  }
}

void __44__WFScanProxy_performScanWithRequest_reply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  WFNetworkScanRecord *v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[WFNetworkScanRecord initWithScanResults:]([WFNetworkScanRecord alloc], "initWithScanResults:", v3);
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);
  }
  else
  {
    WFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      v7 = 136315394;
      v8 = "-[WFScanProxy performScanWithRequest:reply:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_219FC8000, v5, v6, "%s: unable to create WFNetworkScanRecord for %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (WFClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

@end
