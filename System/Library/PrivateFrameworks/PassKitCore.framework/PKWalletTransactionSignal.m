@implementation PKWalletTransactionSignal

+ (void)donateSignalForPass:(id)a3 transaction:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v12, "transactionType");
  if (v14 == 2)
    v15 = 3;
  else
    v15 = v14 == 0;
  if (v14 == 15)
    v16 = 6;
  else
    v16 = v15;
  objc_msgSend(v12, "merchant");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transactionDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v21, "category");
  objc_msgSend(v21, "detailedCategory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_donateSignalForPass:transactionType:transactionDate:transactionID:merchantCategory:merchantDetailedCategory:queue:completion:", v13, v16, v17, v18, v19, v20, v11, v10);

}

+ (void)donateSignalForPass:(id)a3 transactionType:(int)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v7;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = *(_QWORD *)&a4;
  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v10, "now");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_donateSignalForPass:transactionType:transactionDate:transactionID:merchantCategory:merchantDetailedCategory:queue:completion:", v13, v7, v14, 0, 0, 0, v12, v11);

}

+ (void)_donateSignalForPass:(id)a3 transactionType:(int)a4 transactionDate:(id)a5 transactionID:(id)a6 merchantCategory:(int64_t)a7 merchantDetailedCategory:(id)a8 queue:(id)a9 completion:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int64_t v27;
  int v28;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v17 = a10;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __155__PKWalletTransactionSignal__donateSignalForPass_transactionType_transactionDate_transactionID_merchantCategory_merchantDetailedCategory_queue_completion___block_invoke;
  v22[3] = &unk_1E2AD7938;
  v28 = a4;
  v26 = v17;
  v27 = a7;
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  dispatch_async((dispatch_queue_t)a9, v22);

}

void __155__PKWalletTransactionSignal__donateSignalForPass_transactionType_transactionDate_transactionID_merchantCategory_merchantDetailedCategory_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 72);
  switch((int)v2)
  {
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
      v3 = 0;
      v4 = 0;
      break;
    case 4:
      v4 = 0;
      v3 = 1;
      break;
    default:
      v3 = 0;
      v2 = 0;
      v4 = 1;
      break;
  }
  if ((unint64_t)(*(_QWORD *)(a1 + 64) - 1) < 7)
    v5 = *(unsigned int *)(a1 + 64);
  else
    v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3 && v7)
  {
    if ((objc_msgSend(v7, "isAccessPass") & 1) == 0)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v6;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKWalletTransactionSignal: Correcting transaction type of %@ for open loop transit", (uint8_t *)&v19, 0xCu);
      }

LABEL_14:
      v2 = 3;
      goto LABEL_19;
    }
LABEL_18:
    v2 = 4;
    goto LABEL_19;
  }
  if (!v4)
    goto LABEL_19;
  if ((objc_msgSend(v7, "isTransitPass") & 1) != 0)
    goto LABEL_14;
  if ((objc_msgSend(v8, "isAccessPass") & 1) != 0)
    goto LABEL_18;
  if ((objc_msgSend(v8, "isEMoneyPass") & 1) != 0)
  {
    v2 = 5;
  }
  else
  {
    v18 = objc_msgSend(v8, "isIdentityPass");
    if (v18)
      v2 = 6;
    else
      v2 = 1;
    if (!v8 && (v18 & 1) == 0)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "hasValidNFCPayload"))
        v2 = 2;
      else
        v2 = 0;
    }
  }
LABEL_19:
  BiomeLibrary();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Wallet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Transaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0D02348]);
  objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", v6, v15, v2, *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));

  objc_msgSend(v13, "sendEvent:", v16);
  v17 = *(_QWORD *)(a1 + 56);
  if (v17)
    (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, 0);

}

@end
