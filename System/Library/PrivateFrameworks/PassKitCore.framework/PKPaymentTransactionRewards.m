@implementation PKPaymentTransactionRewards

- (PKPaymentTransactionRewards)initWithRewardsItems:(id)a3
{
  id v5;
  void *v6;
  PKPaymentTransactionRewards *v7;
  PKPaymentTransactionRewards *v8;
  PKPaymentTransactionRewards *v9;
  objc_super v11;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)PKPaymentTransactionRewards;
    v7 = -[PKPaymentTransactionRewards init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_rewardsItems, a3);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKPaymentTransactionRewards)initWithJsonString:(id)a3
{
  id v4;
  void *v5;
  PKPaymentTransactionRewards *v6;
  PKPaymentTransactionRewards *v7;
  PKPaymentTransactionRewards *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_rewardsItemsSetFromJsonString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PKPaymentTransactionRewards;
    v6 = -[PKPaymentTransactionRewards init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_rewardsItems, v5);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)jsonArrayRepresentation
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_rewardsItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "jsonDictionaryRepresentation", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)jsonString
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKPaymentTransactionRewards jsonArrayRepresentation](self, "jsonArrayRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 2, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error forming rewards array for CloudKit with error: %@", buf, 0xCu);
      }

      v6 = 0;
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)containsItemOfType:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_rewardsItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "type", (_QWORD)v11) == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)promotionalRewardsItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSArray pk_objectsPassingTest:](self->_rewardsItems, "pk_objectsPassingTest:", &__block_literal_global_27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  if (v3)
    v5 = v3;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);
  -[PKPaymentTransactionRewards enhancedMerchantRewardsItems](self, "enhancedMerchantRewardsItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minusSet:", v7);
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

uint64_t __54__PKPaymentTransactionRewards_promotionalRewardsItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  unint64_t v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "type");
  v4 = objc_msgSend(v2, "state");

  if ((unint64_t)(v3 - 5) < 2)
    return (v4 < 5) & (6u >> v4);
  else
    return 0;
}

- (id)enhancedMerchantRewardsItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *rewardsItems;
  uint64_t v10;
  id v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[NSArray pk_objectsPassingTest:](self->_rewardsItems, "pk_objectsPassingTest:", &__block_literal_global_169);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  if (v3)
    v5 = v3;
  else
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);
  objc_msgSend(MEMORY[0x1E0CB3598], "one");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithMantissa:exponent:isNegative:", 2, 0, 0);
  rewardsItems = self->_rewardsItems;
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_3;
  v22[3] = &unk_1E2AC3830;
  v24 = &__block_literal_global_168;
  v11 = v8;
  v23 = v11;
  -[NSArray pk_firstObjectPassingTest:](rewardsItems, "pk_firstObjectPassingTest:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = self->_rewardsItems;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_4;
    v19[3] = &unk_1E2AC3830;
    v21 = &__block_literal_global_168;
    v20 = v7;
    -[NSArray pk_firstObjectPassingTest:](v13, "pk_firstObjectPassingTest:", v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      v25[0] = v12;
      v25[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v16);

    }
  }
  else
  {
    v15 = 0;
  }
  v17 = (void *)objc_msgSend(v6, "copy");

  return v17;
}

uint64_t __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a2;
  v7 = a4;
  if ((unint64_t)(objc_msgSend(v6, "state") - 1) <= 1
    && objc_msgSend(v6, "type") == a3
    && objc_msgSend(v6, "eligibleValueUnit") == 1)
  {
    objc_msgSend(v6, "eligibleValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToNumber:", v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

uint64_t __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, 2, *(_QWORD *)(a1 + 32));
}

uint64_t __59__PKPaymentTransactionRewards_enhancedMerchantRewardsItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "promotionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  objc_msgSend(v3, "programIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() ^ 1;
  if (v5)
    v8 = 1;
  v9 = v8 ^ 1u;
  if ((v8 & 1) == 0 && v7)
    v9 = objc_msgSend(v3, "hasEnhancedMerchantProgramIdentifier");

  return v9;
}

- (PKPaymentTransactionRewards)initWithCloudStoreCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Not supported. Use initWithCloudStoreCoder:property:"));
  return -[PKPaymentTransactionRewards init](self, "init");
}

- (PKPaymentTransactionRewards)initWithCloudStoreCoder:(id)a3 property:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  PKPaymentTransactionRewards *v9;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentTransactionRewards _rewardItemsFromRecord:property:](self, "_rewardItemsFromRecord:property:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentTransactionRewards initWithRewardsItems:](self, "initWithRewardsItems:", v8);

  return v9;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Not supported. Use applyPropertiesFromCloudStoreRecord:property:"));
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3 property:(unint64_t)a4
{
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *rewardsItems;
  id v10;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v10;
  if (v10)
  {
    -[PKPaymentTransactionRewards _rewardItemsFromRecord:property:](self, "_rewardItemsFromRecord:property:", v10, a4);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    rewardsItems = self->_rewardsItems;
    self->_rewardsItems = v8;

    v7 = v10;
  }

}

- (id)_rewardItemsFromRecord:(id)a3 property:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_cloudRecordKeyForRewardsProperty:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_encryptedStringForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_rewardsItemsSetFromJsonString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Not supported. Use encodeWithCloudStoreCoder:codingType:property:"));
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4 property:(unint64_t)a5
{
  if (a4 - 1 <= 1)
    -[PKPaymentTransactionRewards _encodeServerDataWithCloudStoreCoder:property:](self, "_encodeServerDataWithCloudStoreCoder:property:", a3, a5);
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3 property:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("Transaction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "encryptedValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionRewards jsonString](self, "jsonString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_cloudRecordKeyForRewardsProperty:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v9);

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return 0;
}

+ (id)_cloudRecordKeyForRewardsProperty:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("rewardsInProgress");
  else
    return CFSTR("rewards");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionRewards)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionRewards *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *rewardsItems;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentTransactionRewards;
  v5 = -[PKPaymentTransactionRewards init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rewards"));
    v10 = objc_claimAutoreleasedReturnValue();
    rewardsItems = v5->_rewardsItems;
    v5->_rewardsItems = (NSArray *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_rewardsItems, CFSTR("rewards"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_rewardsItems;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = objc_msgSend(v6, "copy");
  v14 = (void *)v5[1];
  v5[1] = v13;

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsItems);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionRewards *v4;
  PKPaymentTransactionRewards *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionRewards *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionRewards isEqualToRewards:](self, "isEqualToRewards:", v5);

  return v6;
}

- (BOOL)isEqualToRewards:(id)a3
{
  void *v3;
  NSArray *rewardsItems;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  char v12;

  v3 = (void *)MEMORY[0x1E0C99E60];
  rewardsItems = self->_rewardsItems;
  v5 = a3;
  objc_msgSend(v3, "setWithArray:", rewardsItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = v5[1];

  objc_msgSend(v7, "setWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v6)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
    v12 = v6 == (void *)v9;
  else
    v12 = objc_msgSend(v6, "isEqual:", v9);

  return v12;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_rewardsItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        objc_msgSend(v3, "appendString:", CFSTR("\n"));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)totalEligibleValueForUnit:(unint64_t)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_rewardsItems;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v11, "state", (_QWORD)v15) - 5) <= 0xFFFFFFFFFFFFFFFDLL
          && objc_msgSend(v11, "eligibleValueUnit") == a3)
        {
          objc_msgSend(v11, "eligibleValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "decimalNumberByAdding:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v13;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)totalAmountForUnit:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSString *v7;
  NSDecimalNumber *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NSArray firstObject](self->_rewardsItems, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currency");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v8, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = self->_rewardsItems;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((unint64_t)(objc_msgSend(v15, "state", (_QWORD)v20) - 5) <= 0xFFFFFFFFFFFFFFFDLL
            && objc_msgSend(v15, "eligibleValueUnit") == a3)
          {
            objc_msgSend(v15, "currencyAmount");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(v15, "currencyAmount");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "currencyAmountByAddingCurrencyAmount:", v17);
              v18 = objc_claimAutoreleasedReturnValue();

              v9 = (void *)v18;
            }

          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_rewardsItemsSetFromJsonString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  PKPaymentTransactionRewardsItem *v15;
  PKPaymentTransactionRewardsItem *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    if (v5)
    {
      v6 = v5;
      PKLogFacilityTypeGetObject(0xBuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Cannot decode PKPaymentTransactionRewards json string with error: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v4;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v7 = objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = v9;
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v6);
              v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              v15 = [PKPaymentTransactionRewardsItem alloc];
              v16 = -[PKPaymentTransactionRewardsItem initWithDictionary:](v15, "initWithDictionary:", v14, (_QWORD)v18);
              if (v16)
                -[NSObject addObject:](v7, "addObject:", v16);

            }
            v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          }
          while (v11);
        }

        if (-[NSObject count](v7, "count"))
        {
          v8 = -[NSObject copy](v7, "copy");
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Decoded PKPaymentTransactionRewards json string is not of type array", buf, 2u);
        }
        v6 = 0;
      }
    }
    v8 = 0;
    goto LABEL_22;
  }
  v8 = 0;
LABEL_23:

  return v8;
}

- (NSArray)rewardsItems
{
  return self->_rewardsItems;
}

- (void)setRewardsItems:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsItems, 0);
}

@end
