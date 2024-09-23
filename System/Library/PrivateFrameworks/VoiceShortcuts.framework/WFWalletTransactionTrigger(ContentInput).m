@implementation WFWalletTransactionTrigger(ContentInput)

- (uint64_t)requiresEventInfoAsInput
{
  return 1;
}

- (void)eventInfoForEvent:()ContentInput completion:
{
  id v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "eventBody");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 0;
      goto LABEL_10;
    }
  }

  objc_msgSend(v6, "eventBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v34 = a1;
    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Found remote event converting to BMWalletTransaction", buf, 0xCu);
    }

    v12 = objc_alloc(MEMORY[0x1E0D02348]);
    objc_msgSend(v10, "passUniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "passLocalizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "transactionType");
    objc_msgSend(v10, "transactionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "merchantType");
    objc_msgSend(v10, "poiCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v12, "initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", v13, v14, v15, v16, v17, v18);

    if (v8)
    {
      v9 = 1;
      a1 = v34;
LABEL_10:
      objc_msgSend(v8, "transactionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (!v9)
        {
          +[WFWalletTransactionProvider sharedProvider](WFWalletTransactionProvider, "sharedProvider");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "transactionID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke_2;
          v35[3] = &unk_1E7AA8560;
          v35[4] = a1;
          v36 = v8;
          v37 = v7;
          v8 = v8;
          objc_msgSend(v31, "fetchLocalTransactionWithIdentifier:completion:", v32, v35);

          goto LABEL_26;
        }
        getWFTriggersLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "passUniqueID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "transactionID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
          v45 = 2112;
          v46 = v21;
          v47 = 2112;
          v48 = v22;
          _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Attempting to get remote transaction with passID: %@ transactionID: %@", buf, 0x20u);

        }
        +[WFWalletTransactionProvider sharedProvider](WFWalletTransactionProvider, "sharedProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "transactionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "passUniqueID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __73__WFWalletTransactionTrigger_ContentInput__eventInfoForEvent_completion___block_invoke;
        v38[3] = &unk_1E7AA8560;
        v38[4] = a1;
        v39 = v8;
        v40 = v7;
        v8 = v8;
        objc_msgSend(v23, "fetchRemoteTransactionWithIdentifier:passUniqueID:completion:", v24, v25, v38);

      }
      else
      {
        objc_msgSend(v8, "passLocalizedDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          getWFTriggersLogObject();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
            _os_log_impl(&dword_1C146A000, v33, OS_LOG_TYPE_ERROR, "%s No transaction identifier or pass description not creating input to trigger!", buf, 0xCu);
          }

          (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
          goto LABEL_26;
        }
        v41 = CFSTR("transaction");
        v28 = objc_alloc(MEMORY[0x1E0D140D8]);
        objc_msgSend(v8, "passLocalizedDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "initWithIdentifier:transactionDescription:merchant:currencyAmount:paymentMethod:", 0, v23, 0, 0, 0);
        v42 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v7 + 2))(v7, v30);

      }
LABEL_26:

      goto LABEL_27;
    }
  }
  else
  {

    getWFTriggersLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[WFWalletTransactionTrigger(ContentInput) eventInfoForEvent:completion:]";
      _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_DEFAULT, "%s No wallet transaction event received for trigger; not firing.",
        buf,
        0xCu);
    }

  }
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_27:

}

- (id)dictionaryWithTransaction:()ContentInput transactionEvent:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  getWFTriggersLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFWalletTransactionTrigger(ContentInput) dictionaryWithTransaction:transactionEvent:]";
    v38 = 2112;
    v39 = v5;
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEBUG, "%s Got transaction: %@", buf, 0x16u);
  }

  objc_msgSend(v5, "merchant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "category");

  if ((unint64_t)(v9 - 1) >= 7)
    v10 = 0;
  else
    v10 = v9;
  v11 = objc_alloc(MEMORY[0x1E0D140D0]);
  objc_msgSend(v5, "merchant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "merchant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "merchant");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logoImageURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v11, "initWithDisplayName:uniqueIdentifier:logoURL:merchantType:", v13, v15, v17, v10);

  v19 = objc_alloc(MEMORY[0x1E0CBD848]);
  objc_msgSend(v5, "amount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithAmount:currencyCode:", v20, v21);

  v23 = objc_alloc(MEMORY[0x1E0CBDA50]);
  objc_msgSend(v6, "passLocalizedDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithType:name:identificationHint:icon:", 0, v24, 0, 0);

  v26 = objc_alloc(MEMORY[0x1E0D140D8]);
  objc_msgSend(v6, "transactionID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "displayName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)objc_msgSend(v26, "initWithIdentifier:transactionDescription:merchant:currencyAmount:paymentMethod:", v27, v28, v18, v22, v25);
  }
  else
  {
    objc_msgSend(v5, "merchantProvidedTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithIdentifier:transactionDescription:merchant:currencyAmount:paymentMethod:", v27, v30, v18, v22, v25);

  }
  getWFTriggersLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFWalletTransactionTrigger(ContentInput) dictionaryWithTransaction:transactionEvent:]";
    v38 = 2112;
    v39 = v29;
    _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_DEBUG, "%s Finished with transactionItem: %@", buf, 0x16u);
  }

  v34 = CFSTR("transaction");
  v35 = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)contentCollectionWithEventInfo:()ContentInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transaction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D140E0], "itemWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D13EA8];
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionWithItems:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
