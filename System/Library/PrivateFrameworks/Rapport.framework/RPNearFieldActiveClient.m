@implementation RPNearFieldActiveClient

- (void)startDiscoveryWithApplicationLabel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = -[RPNearFieldClient _ensureXPCStarted](self, "_ensureXPCStarted");
  -[RPNearFieldClient xpcCnx](self, "xpcCnx");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke;
  v18[3] = &unk_1E5F4ED20;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke_2;
  v15[3] = &unk_1E5F4F3E8;
  v16 = v6;
  v17 = v11;
  v13 = v11;
  v14 = v6;
  objc_msgSend(v12, "startActiveDiscoveryWithApplicationLabel:completion:", v14, v15);

}

void __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = MEMORY[0x1AF45BE48](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __73__RPNearFieldActiveClient_startDiscoveryWithApplicationLabel_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (gLogCategory_RPNearFieldClient <= 90
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearFieldClient <= 40
         && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v3 = MEMORY[0x1AF45BE48](*(_QWORD *)(a1 + 40));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3
{
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end
