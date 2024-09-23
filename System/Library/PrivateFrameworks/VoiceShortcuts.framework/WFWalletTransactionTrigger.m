@implementation WFWalletTransactionTrigger

void __101__WFWalletTransactionTrigger_BiomeContext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("transaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (*(_BYTE *)(a1 + 65))
    {
      objc_msgSend(*(id *)(a1 + 32), "selectedMerchantTypes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "merchant");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "merchantType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "containsObject:", v7);

    }
    if (*(_BYTE *)(a1 + 66))
    {
      objc_msgSend(*(id *)(a1 + 32), "selectedMerchants");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "merchant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "containsObject:", v9);

    }
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_BYTE *)(a1 + 64)
       && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
       && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 0;
  }
  else
  {
    getWFTriggersLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[WFWalletTransactionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Could not fetch transaction for wallet transaction event, ignoring merchant filtering.", (uint8_t *)&v13, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(unsigned __int8 *)(a1 + 64);
  }
  (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11);

}

void __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dictionaryWithTransaction:transactionEvent:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dictionaryWithTransaction:transactionEvent:", a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
