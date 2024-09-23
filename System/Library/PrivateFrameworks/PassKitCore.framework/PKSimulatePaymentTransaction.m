@implementation PKSimulatePaymentTransaction

void __PKSimulatePaymentTransaction_block_invoke(uint64_t a1)
{
  id v2;
  PKPaymentService *v3;
  unint64_t v4;
  PKMerchant *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  dispatch_time_t v23;
  NSObject *v24;
  __int128 v25;
  _QWORD block[4];
  PKMerchant *v27;
  id v28;
  PKPaymentService *v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  char v34;
  _QWORD v35[4];
  __int128 v36;

  v2 = *(id *)(a1 + 32);
  v3 = objc_alloc_init(PKPaymentService);
  v4 = objc_msgSend(*(id *)(a1 + 40), "transactionSource");
  objc_msgSend(*(id *)(a1 + 40), "merchant");
  v5 = (PKMerchant *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService defaultPaymentPassUniqueIdentifier](v3, "defaultPaymentPassUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passWithUniqueID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paymentPass");
    v2 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
LABEL_3:
      objc_msgSend(v2, "devicePrimaryPaymentApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_10;
LABEL_8:
      v13 = 0;
      goto LABEL_17;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 40), "setHasNotificationServiceData:", 1);
  objc_msgSend(*(id *)(a1 + 40), "addUpdateReasons:", 64);
  objc_msgSend(*(id *)(a1 + 40), "setTransactionStatus:", 1);
  if (objc_msgSend(*(id *)(a1 + 40), "transactionType"))
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServiceIdentifier:", v12);

    objc_msgSend(v2, "devicePrimaryPaymentApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setOriginatedByDevice:", 0);
    if (v5)
      goto LABEL_8;
  }
  else
  {
    v6 = 0;
    if (v5)
      goto LABEL_8;
  }
LABEL_10:
  v5 = objc_alloc_init(PKMerchant);
  _SimulatedPaymentTransactionMerchantName(v4, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    v15 = v4 == 0;
  else
    v15 = 1;
  v13 = !v15;
  -[PKMerchant setName:](v5, "setName:", v14);
  -[PKMerchant setRawName:](v5, "setRawName:", v14);
  objc_msgSend(*(id *)(a1 + 40), "setMerchant:", v5);

LABEL_17:
  if (v4 <= 4 && ((1 << v4) & 0x13) != 0)
    objc_msgSend(*(id *)(a1 + 40), "setMerchant:", 0);
  objc_msgSend(*(id *)(a1 + 40), "transactionDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTransactionDate:", v18);

  }
  v19 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "uniqueID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __PKSimulatePaymentTransaction_block_invoke_2;
  v35[3] = &unk_1E2AD7498;
  v25 = *(_OWORD *)(a1 + 56);
  v22 = (id)v25;
  v36 = v25;
  -[PKPaymentService insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:](v3, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v19, v20, v6, v35);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v23 = dispatch_time(0, 2000000000);
    v24 = *(NSObject **)(a1 + 48);
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __PKSimulatePaymentTransaction_block_invoke_3;
    block[3] = &unk_1E2AD74E8;
    v34 = v13;
    v33 = v4;
    v27 = v5;
    v28 = *(id *)(a1 + 40);
    v29 = v3;
    v30 = v2;
    v31 = v6;
    v32 = *(id *)(a1 + 56);
    dispatch_after(v23, v24, block);

  }
}

void __PKSimulatePaymentTransaction_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  NSLog(CFSTR("Simulated Transaction: %@"), a2);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
}

void __PKSimulatePaymentTransaction_block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  if (*(_BYTE *)(a1 + 88))
  {
    _SimulatedPaymentTransactionMerchantName(*(_QWORD *)(a1 + 80), 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setName:", v2);
    objc_msgSend(*(id *)(a1 + 32), "setRawName:", v2);

  }
  objc_msgSend(*(id *)(a1 + 40), "setMerchant:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v6);

  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServiceIdentifier:", v9);

  objc_msgSend(*(id *)(a1 + 40), "setTransactionSource:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setHasNotificationServiceData:", 1);
  objc_msgSend(*(id *)(a1 + 40), "addUpdateReasons:", 64);
  v11 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __PKSimulatePaymentTransaction_block_invoke_4;
  v14[3] = &unk_1E2AD74C0;
  v13 = *(_QWORD *)(a1 + 64);
  v15 = *(id *)(a1 + 72);
  objc_msgSend(v10, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v11, v12, v13, v14);

}

uint64_t __PKSimulatePaymentTransaction_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  NSLog(CFSTR("Simulated Transaction Update: %@"), a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
