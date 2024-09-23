@implementation WBSUISafariSandboxBrokerConnection

- (void)loadLinkPresentationMetdataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke;
  v10[3] = &unk_1E5447FF0;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[WBSSafariSandboxBrokerConnection _connectionWithCompletionHandler:](self, "_connectionWithCompletionHandler:", v10);

}

void __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5447FC8;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadLinkPresentationMetdataForMessageWithGUID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __102__WBSUISafariSandboxBrokerConnection_loadLinkPresentationMetdataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getLinkMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke;
  v10[3] = &unk_1E5447FF0;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[WBSSafariSandboxBrokerConnection _connectionWithCompletionHandler:](self, "_connectionWithCompletionHandler:", v10);

}

void __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke_2;
    v6[3] = &unk_1E5447FC8;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getLinkMetadataForMessageWithGUID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __90__WBSUISafariSandboxBrokerConnection_getLinkMetadataForMessageWithGUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
