@implementation NSError

void __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(a2, "SSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_errorMessageForFailureReason:failingURLString:providerName:networkName:isUsingEthernetNetwork:", v4, v5, v6, v7, *(unsigned __int8 *)(a1 + 72));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E5447EE0;
    v6 = *(id *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v13 = v6;
    v9[4] = v7;
    v10 = v8;
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v14 = *(_BYTE *)(a1 + 80);
    objc_msgSend(v5, "getSubscriptionUserFacingName:completion:", a2, v9);

  }
}

void __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_errorMessageForFailureReason:failingURLString:providerName:networkName:isUsingEthernetNetwork:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, *(unsigned __int8 *)(a1 + 72));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

@end
