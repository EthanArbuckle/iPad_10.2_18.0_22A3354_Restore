@implementation SWCServiceDetails

void __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 8) & 0xFFFC | *(_BYTE *)(a1 + 56) & 3;

}

uint64_t __83___SWCServiceDetails_SWCServiceApproval__waitForSiteApprovalWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _SWCDomain *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[_SWCDomain initWithString:]([_SWCDomain alloc], "initWithString:", v7);
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

}

void __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

}

void __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __59___SWCServiceDetails_DeveloperMode__isDeveloperModeEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");
    v3 = v4;
  }

}

void __79___SWCServiceDetails_DeveloperMode__setDeveloperModeEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

}

void __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

@end
