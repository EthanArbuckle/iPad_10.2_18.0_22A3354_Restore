@implementation PKMerchantTokenDemoData

+ (id)responseForSingleMerchantToken
{
  void *v2;
  PKRetrieveMerchantTokensResponse *v3;

  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", &unk_1E2C3DF00);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKRetrieveMerchantTokensResponse initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:]([PKRetrieveMerchantTokensResponse alloc], "initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:", v2, &unk_1E2C3EC20, &unk_1E2C3EC38, &unk_1E2C3EC20, &unk_1E2C3EC20);

  return v3;
}

+ (id)responseForSingleAMPMerchantToken
{
  void *v2;
  PKRetrieveMerchantTokensResponse *v3;

  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", &unk_1E2C3DF18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKRetrieveMerchantTokensResponse initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:]([PKRetrieveMerchantTokensResponse alloc], "initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:", v2, &unk_1E2C3EC20, &unk_1E2C3EC38, &unk_1E2C3EC20, &unk_1E2C3EC20);

  return v3;
}

+ (id)responseForSingleCashMerchantToken
{
  void *v2;
  PKRetrieveMerchantTokensResponse *v3;

  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", &unk_1E2C3DF30);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKRetrieveMerchantTokensResponse initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:]([PKRetrieveMerchantTokensResponse alloc], "initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:", v2, &unk_1E2C3EC20, &unk_1E2C3EC38, &unk_1E2C3EC20, &unk_1E2C3EC20);

  return v3;
}

+ (id)responseForSinglePage
{
  void *v2;
  PKRetrieveMerchantTokensResponse *v3;
  void *v4;
  PKRetrieveMerchantTokensResponse *v5;

  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", MEMORY[0x1E0C9AA60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [PKRetrieveMerchantTokensResponse alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKRetrieveMerchantTokensResponse initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:](v3, "initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:", v2, v4, &unk_1E2C3EC38, &unk_1E2C3EC20, &unk_1E2C3EC20);

  return v5;
}

+ (id)responseForPageNumber:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  PKRetrieveMerchantTokensResponse *v20;
  PKRetrieveMerchantTokensResponse *v21;
  void *v22;
  PKRetrieveMerchantTokensResponse *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[7];

  v36[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MEMORY[0x1E0C9AA60];
  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", MEMORY[0x1E0C9AA60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v6;
  +[PKMerchantTokenDemoData _generateTokensWithIdsUsing:](PKMerchantTokenDemoData, "_generateTokensWithIdsUsing:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v5;
  v36[1] = v9;
  v36[2] = v7;
  v36[3] = v8;
  v36[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "integerValue");
  v13 = v12 - 1;
  if (v12 < 1 || v13 >= objc_msgSend(v11, "count"))
  {
    v20 = [PKRetrieveMerchantTokensResponse alloc];
    v21 = -[PKRetrieveMerchantTokensResponse initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:](v20, "initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:", MEMORY[0x1E0C9AA60], &unk_1E2C3EC50, &unk_1E2C3EC38, &unk_1E2C3EC20, &unk_1E2C3EC20);
  }
  else
  {
    v28 = v9;
    v29 = v5;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    v30 = v3;
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v14);
          v17 += objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "count");
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }

    objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = [PKRetrieveMerchantTokensResponse alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PKRetrieveMerchantTokensResponse initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:](v23, "initWithMerchantTokens:totalMerchantTokens:pageSize:totalPages:pageNumber:", v22, v24, v25, v26, v30);

    v3 = v30;
    v9 = v28;
    v5 = v29;
  }

  return v21;
}

+ (id)_generateTokensWithIdsUsing:(id)a3
{
  return (id)objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_67);
}

PKMerchantToken *__55__PKMerchantTokenDemoData__generateTokensWithIdsUsing___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  PKMerchantToken *v5;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("merchantTokenId"));

  v5 = -[PKMerchantToken initWithDictionary:]([PKMerchantToken alloc], "initWithDictionary:", v2);
  return v5;
}

@end
