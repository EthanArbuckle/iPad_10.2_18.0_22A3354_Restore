@implementation WBSCreditCardData(SafariSharedUIExtras)

- (id)initWithCameraReaderOutput:()SafariSharedUIExtras
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v24 = a1;
  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v32;
    v10 = *MEMORY[0x1E0D182C8];
    v30 = *MEMORY[0x1E0D182B8];
    v29 = *MEMORY[0x1E0D182C0];
    v25 = v3;
    while (1)
    {
      v11 = 0;
      v26 = v5;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        objc_msgSend(v12, "type", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v10))
        {
          objc_msgSend(v12, "stringValue");
          v14 = v8;
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v13, "isEqualToString:", v30))
        {
          objc_msgSend(v12, "stringValue");
          v14 = v7;
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v13, "isEqualToString:", v29))
            goto LABEL_13;
          v27 = v7;
          v15 = v12;
          objc_msgSend(v15, "dayValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "integerValue");
          objc_msgSend(v15, "monthValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "integerValue");
          v28 = v8;
          objc_msgSend(v15, "yearValue");
          v17 = v10;
          v18 = v9;
          v19 = v6;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "integerValue");
          WBSExpirationDateWithDayMonthYear();
          v21 = objc_claimAutoreleasedReturnValue();

          v9 = v18;
          v10 = v17;
          v5 = v26;

          v7 = v27;
          v3 = v25;
          v6 = (void *)v21;
          v8 = v28;
        }

LABEL_13:
        ++v11;
      }
      while (v5 != v11);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (!v5)
        goto LABEL_17;
    }
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
LABEL_17:
  v22 = (id)objc_msgSend(v24, "initWithCardName:number:cardholderName:expirationDate:", 0, v8, v7, v6, v24);

  return v22;
}

- (id)virtualCardIcon
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getPKGlyphViewClass_softClass;
  v11 = getPKGlyphViewClass_softClass;
  if (!getPKGlyphViewClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getPKGlyphViewClass_block_invoke;
    v7[3] = &unk_1E54424C0;
    v7[4] = &v8;
    __getPKGlyphViewClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(a1, "virtualCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)virtualCardArtworkWithSize:()SafariSharedUIExtras completionHandler:
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(id, void *);
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D8A100], "creditCardDataController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "artworkCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "cardNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%zu, %zu x %zu"), objc_msgSend(v12, "hash"), (unint64_t)a2, (unint64_t)a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v8[2](v8, v14);
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v15 = (void *)getPKAddPassesViewControllerClass_softClass;
    v27 = getPKAddPassesViewControllerClass_softClass;
    v16 = MEMORY[0x1E0C809B0];
    if (!getPKAddPassesViewControllerClass_softClass)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __getPKAddPassesViewControllerClass_block_invoke;
      v23[3] = &unk_1E54424C0;
      v23[4] = &v24;
      __getPKAddPassesViewControllerClass_block_invoke((uint64_t)v23);
      v15 = (void *)v25[3];
    }
    v17 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v24, 8);
    objc_msgSend(a1, "virtualCard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __88__WBSCreditCardData_SafariSharedUIExtras__virtualCardArtworkWithSize_completionHandler___block_invoke;
    v19[3] = &unk_1E5442498;
    v19[4] = a1;
    v20 = v10;
    v21 = v13;
    v22 = v8;
    objc_msgSend(v18, "cardArtworkWithSize:completion:", v19, a2, a3);

  }
}

@end
