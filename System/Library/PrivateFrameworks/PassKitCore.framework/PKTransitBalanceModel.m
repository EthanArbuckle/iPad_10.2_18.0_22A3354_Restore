@implementation PKTransitBalanceModel

- (PKTransitBalanceModel)initWithPass:(id)a3
{
  id v5;
  PKTransitBalanceModel *v6;
  PKTransitBalanceModel *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *balanceFields;
  uint64_t v12;
  NSArray *transitCommutePlans;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKTransitBalanceModel;
  v6 = -[PKTransitBalanceModel init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pass, a3);
    v8 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v5, "balanceFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    balanceFields = v7->_balanceFields;
    v7->_balanceFields = (NSMutableArray *)v10;

    objc_msgSend(v5, "transitCommutePlans");
    v12 = objc_claimAutoreleasedReturnValue();
    transitCommutePlans = v7->_transitCommutePlans;
    v7->_transitCommutePlans = (NSArray *)v12;

    -[PKTransitBalanceModel _updateBalancesAndPlans](v7, "_updateBalancesAndPlans");
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  PKTransitPassProperties *transitProperties;
  PKTransitPassProperties *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSArray *dynamicPlans;
  NSArray *v17;
  NSMutableDictionary *dynamicPlansByUniqueId;
  NSMutableDictionary *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    transitProperties = self->_transitProperties;
    v7 = (PKTransitPassProperties *)*((_QWORD *)v5 + 2);
    if (transitProperties && v7)
    {
      if (!-[PKStoredValuePassProperties isEqual:](transitProperties, "isEqual:"))
        goto LABEL_21;
    }
    else if (transitProperties != v7)
    {
LABEL_21:
      v8 = 0;
LABEL_22:

      goto LABEL_23;
    }
    if (!-[NSDictionary isEqualToDictionary:](self->_balancesByID, "isEqualToDictionary:", *((_QWORD *)v5 + 1))
      || !-[NSArray isEqualToArray:](self->_displayableBalances, "isEqualToArray:", *((_QWORD *)v5 + 6))
      || !-[NSArray isEqualToArray:](self->_displayableCommutePlans, "isEqualToArray:", *((_QWORD *)v5 + 11))
      || !-[NSArray isEqualToArray:](self->_displayableCommutePlanBalances, "isEqualToArray:", *((_QWORD *)v5 + 9))
      || !-[NSArray isEqualToArray:](self->_displayableCurrencyBalances, "isEqualToArray:", *((_QWORD *)v5 + 7))
      || !-[NSArray isEqualToArray:](self->_displayablePointsBalances, "isEqualToArray:", *((_QWORD *)v5 + 8))
      || !-[NSArray isEqualToArray:](self->_transitCommutePlans, "isEqualToArray:", *((_QWORD *)v5 + 10))
      || !-[NSArray isEqualToArray:](self->_displayableCommutePlanActions, "isEqualToArray:", *((_QWORD *)v5 + 12)))
    {
      goto LABEL_21;
    }
    -[PKObject uniqueID](self->_pass, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v5 + 5), "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    v13 = v12;
    if (v11 == v12)
    {

    }
    else
    {
      if (!v11 || !v12)
      {

        goto LABEL_31;
      }
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v14)
        goto LABEL_31;
    }
    dynamicPlans = self->_dynamicPlans;
    v17 = (NSArray *)*((_QWORD *)v5 + 3);
    if (dynamicPlans && v17)
    {
      if ((-[NSArray isEqual:](dynamicPlans, "isEqual:") & 1) != 0)
        goto LABEL_33;
    }
    else if (dynamicPlans == v17)
    {
LABEL_33:
      dynamicPlansByUniqueId = self->_dynamicPlansByUniqueId;
      v19 = (NSMutableDictionary *)*((_QWORD *)v5 + 4);
      if (dynamicPlansByUniqueId && v19)
        v8 = -[NSMutableDictionary isEqual:](dynamicPlansByUniqueId, "isEqual:");
      else
        v8 = dynamicPlansByUniqueId == v19;
      goto LABEL_32;
    }
LABEL_31:
    v8 = 0;
LABEL_32:

    goto LABEL_22;
  }
  v8 = 0;
LABEL_23:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PKStoredValuePassProperties copyWithZone:](self->_transitProperties, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_balancesByID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSMutableArray mutableCopyWithZone:](self->_balanceFields, "mutableCopyWithZone:", a3);
  v11 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v10;

  v12 = -[NSArray copyWithZone:](self->_displayableBalances, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSArray copyWithZone:](self->_displayableCurrencyBalances, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[NSArray copyWithZone:](self->_displayablePointsBalances, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[NSArray copyWithZone:](self->_transitCommutePlans, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSArray copyWithZone:](self->_displayableCommutePlanBalances, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = -[NSArray copyWithZone:](self->_displayableCommutePlans, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v22;

  v24 = -[NSArray copyWithZone:](self->_displayableCommutePlanActions, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v24;

  objc_storeStrong((id *)(v5 + 40), self->_pass);
  v26 = -[NSArray copyWithZone:](self->_dynamicPlans, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v26;

  v28 = -[NSMutableDictionary mutableCopyWithZone:](self->_dynamicPlansByUniqueId, "mutableCopyWithZone:", a3);
  v29 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v28;

  return (id)v5;
}

- (void)setDynamicBalances:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "identifiers", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_msgSend(v11, "isExpired") & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[PKTransitBalanceModel setDynamicBalancesByID:](self, "setDynamicBalancesByID:", v5);
  -[PKTransitBalanceModel _updateBalancesAndPlans](self, "_updateBalancesAndPlans");

}

- (void)updateWithDynamicBalances:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *balancesByID;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_balancesByID);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        objc_msgSend(v11, "identifiers", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (!-[NSDictionary isEqualToDictionary:](self->_balancesByID, "isEqualToDictionary:", v5))
  {
    v13 = (NSDictionary *)objc_msgSend(v5, "copy");
    balancesByID = self->_balancesByID;
    self->_balancesByID = v13;

    -[PKTransitBalanceModel _updateBalancesAndPlans](self, "_updateBalancesAndPlans");
  }

}

- (void)setDynamicBalancesByID:(id)a3
{
  id v4;
  BOOL v5;
  NSDictionary *v6;
  NSDictionary *balancesByID;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[NSDictionary isEqualToDictionary:](self->_balancesByID, "isEqualToDictionary:", v4);
    v4 = v8;
    if (!v5)
    {
      v6 = (NSDictionary *)objc_msgSend(v8, "copy");
      balancesByID = self->_balancesByID;
      self->_balancesByID = v6;

      -[PKTransitBalanceModel _updateBalancesAndPlans](self, "_updateBalancesAndPlans");
      v4 = v8;
    }
  }

}

- (NSDictionary)balancesAndCountPlansByID
{
  id v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  if (self->_balancesByID)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_displayableCommutePlanBalances;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifiers", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "count"))
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v12);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return (NSDictionary *)v13;
}

- (id)balanceForIdentifiers:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_balancesByID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)setTransitProperties:(id)a3
{
  -[PKTransitBalanceModel setTransitProperties:andApplyStoredValueBalances:](self, "setTransitProperties:andApplyStoredValueBalances:", a3, 0);
}

- (void)setTransitProperties:(id)a3 andApplyStoredValueBalances:(BOOL)a4
{
  _BOOL4 v4;
  PKTransitPassProperties *v7;
  PKTransitPassProperties *transitProperties;
  BOOL v9;
  PKTransitPassProperties *v10;

  v4 = a4;
  v7 = (PKTransitPassProperties *)a3;
  transitProperties = self->_transitProperties;
  v10 = v7;
  if (v7 && transitProperties)
  {
    v9 = -[PKStoredValuePassProperties isEqual:](transitProperties, "isEqual:", v7);
    v7 = v10;
    if (v9)
      goto LABEL_10;
  }
  else if (transitProperties == v7)
  {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_transitProperties, a3);
  if (v4)
    -[PKTransitBalanceModel applyStoredValueBalancesFromProperties:](self, "applyStoredValueBalancesFromProperties:", v10);
  else
    -[PKTransitBalanceModel _updateBalancesAndPlans](self, "_updateBalancesAndPlans");
  v7 = v10;
LABEL_10:

}

- (void)applyStoredValueBalancesFromProperties:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSDecimalNumber *v14;
  NSString *v15;
  void *v16;
  PKPaymentBalance *v17;
  void *v18;
  PKPaymentBalance *v19;
  PKTransitBalanceModel *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v20 = self;
  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v3;
  objc_msgSend(v3, "balances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", v20);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(v10, "isCurrencyBalance");

          if (v13)
          {
            objc_msgSend(v10, "amount");
            v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "currencyCode");
            v15 = (NSString *)objc_claimAutoreleasedReturnValue();
            PKCurrencyAmountCreate(v14, v15, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = [PKPaymentBalance alloc];
            objc_msgSend(v10, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[PKPaymentBalance initWithIdentifier:forCurrencyAmount:](v17, "initWithIdentifier:forCurrencyAmount:", v18, v16);

            if (v19)
              objc_msgSend(v4, "addObject:", v19);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  -[PKTransitBalanceModel setDynamicBalances:](v20, "setDynamicBalances:", v4);
}

- (void)updateWithDynamicCommutePlans:(id)a3
{
  NSArray *v4;
  NSArray *dynamicPlans;
  NSMutableDictionary *v6;
  NSMutableDictionary *dynamicPlansByUniqueId;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  dynamicPlans = self->_dynamicPlans;
  self->_dynamicPlans = v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  dynamicPlansByUniqueId = self->_dynamicPlansByUniqueId;
  self->_dynamicPlansByUniqueId = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_dynamicPlans;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "uniqueIdentifier", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dynamicPlansByUniqueId, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[PKTransitBalanceModel _updateBalancesAndPlans](self, "_updateBalancesAndPlans");
}

- (BOOL)hasBalanceContent
{
  return -[NSArray count](self->_displayableBalances, "count") != 0;
}

- (BOOL)hasCurrencyBalance
{
  return -[NSArray count](self->_displayableCurrencyBalances, "count") != 0;
}

- (BOOL)hasPointsBalance
{
  return -[NSArray count](self->_displayablePointsBalances, "count") != 0;
}

- (BOOL)hasPositiveBalance
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  v2 = self->_displayableBalances;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "value", (_QWORD)v11);
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = (void *)v6;
          objc_msgSend(MEMORY[0x1E0CB3598], "zero");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "compare:", v7);

          if (v9 == -1)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)hasCommutePlanContent
{
  return -[NSArray count](self->_displayableCommutePlans, "count") != 0;
}

- (BOOL)hasDeviceBoundCommutePlans
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_displayableCommutePlans;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDeviceBound", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)filteredActionsForDisplayableEntities
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKTransitBalanceModel displayableCommutePlans](self, "displayableCommutePlans");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PKSecureElementPass availableActions](self->_pass, "availableActions", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        if (objc_msgSend(v17, "type") == 1)
        {
          objc_msgSend(v3, "addObject:", v17);
        }
        else
        {
          objc_msgSend(v17, "associatedPlanIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "containsObject:", v18))
            objc_msgSend(v3, "addObject:", v17);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  v19 = (void *)objc_msgSend(v3, "copy");
  return v19;
}

- (void)_updateBalancesAndPlans
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t k;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  PKTransitBalanceModel *v48;
  uint64_t v49;
  unint64_t v50;
  PKPaymentBalance *v51;
  NSMutableArray *balanceFields;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  BOOL v61;
  void *v62;
  id v63;
  BOOL v64;
  char v65;
  NSArray *v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t n;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  PKPaymentBalance *v80;
  BOOL v81;
  NSArray *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t ii;
  void *v90;
  void *v91;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  NSArray *displayableBalances;
  NSArray *v98;
  NSArray *displayableCurrencyBalances;
  NSArray *v100;
  NSArray *displayablePointsBalances;
  NSArray *v102;
  NSArray *v103;
  NSArray *displayableCommutePlans;
  NSArray *displayableCommutePlanBalances;
  NSArray *v106;
  NSArray *v107;
  NSArray *displayableCommutePlanActions;
  void *v109;
  void *v110;
  void *v111;
  NSArray *v112;
  uint64_t v113;
  NSArray *v114;
  NSArray *v115;
  NSMutableArray *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  NSArray *v120;
  uint64_t v121;
  void *v122;
  NSArray *obj;
  id obja;
  uint64_t v125;
  uint64_t v126;
  id v127;
  PKTransitBalanceModel *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  id v138;
  id v139;
  _QWORD v140[4];
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[4];
  id v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  v120 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v114 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v112 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v115 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v129 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((unint64_t)(-[PKSecureElementPass passActivationState](self->_pass, "passActivationState") - 5) > 0xFFFFFFFFFFFFFFFDLL)
    goto LABEL_132;
  v138 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v127 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v139 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v175 = 0u;
  -[PKSecureElementPass availableActions](self->_pass, "availableActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v172, v183, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v173;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v173 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * i);
        objc_msgSend(v9, "associatedPlan");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "setObject:forKeyedSubscript:", v9, v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v172, v183, 16);
    }
    while (v6);
  }

  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  obj = self->_transitCommutePlans;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v168, v182, 16);
  v128 = self;
  v119 = v3;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v169;
    v117 = *(_QWORD *)v169;
    do
    {
      v16 = 0;
      v121 = v14;
      do
      {
        if (*(_QWORD *)v169 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v16);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "requiresAppletSourceOfTruth");
        objc_msgSend(v127, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = v17;
        objc_msgSend(v20, "setAssociatedPlan:", v17);
        if ((v19 & 1) != 0)
        {
          v125 = v16;
          v132 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v130 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v164 = 0u;
          v165 = 0u;
          v166 = 0u;
          v167 = 0u;
          -[NSMutableDictionary allValues](self->_dynamicPlansByUniqueId, "allValues");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v164, v181, 16);
          if (!v22)
            goto LABEL_39;
          v23 = v22;
          v24 = *(_QWORD *)v165;
          while (1)
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v165 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * j);
              objc_msgSend(v26, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v18;
              v29 = v27;
              if (v28 == v29)
              {

LABEL_28:
                objc_msgSend(v135, "updateWithCommutePlanDetail:", v26);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setAssociatedPlan:", v30);
                if (v20 && (objc_msgSend(v20, "isActionAvailable") & 1) != 0
                  || objc_msgSend(v30, "isPlanDisplayable"))
                {
                  if (objc_msgSend(v30, "hasExpiredPlanDate"))
                    v32 = v132;
                  else
                    v32 = v130;
                  objc_msgSend(v32, "addObject:", v30);
                  objc_msgSend(v129, "safelyAddObject:", v20);
                }
LABEL_36:

                continue;
              }
              v30 = v29;
              if (!v18 || !v29)
              {

                goto LABEL_36;
              }
              v31 = objc_msgSend(v28, "isEqualToString:", v29);

              if (v31)
                goto LABEL_28;
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v164, v181, 16);
            if (!v23)
            {
LABEL_39:

              if (objc_msgSend(v130, "count"))
                v33 = v130;
              else
                v33 = v132;
              v3 = v119;
              objc_msgSend(v119, "addObjectsFromArray:", v33);
              objc_msgSend(v135, "passFieldForKey:", CFSTR("amountRemaining"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "foreignReferenceIdentifiers");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              self = v128;
              -[NSDictionary objectForKeyedSubscript:](v128->_balancesByID, "objectForKeyedSubscript:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36
                && (v20 && (objc_msgSend(v20, "isActionAvailable") & 1) != 0
                 || objc_msgSend(v135, "isPlanDisplayable")))
              {
                objc_msgSend(v119, "addObject:", v135);
                objc_msgSend(v129, "safelyAddObject:", v20);
              }

              v15 = v117;
              v14 = v121;
              v16 = v125;
              goto LABEL_52;
            }
          }
        }
        if (v20 && (objc_msgSend(v20, "isActionAvailable") & 1) != 0
          || objc_msgSend(v17, "isPlanDisplayable"))
        {
          objc_msgSend(v3, "addObject:", v17);
          objc_msgSend(v129, "safelyAddObject:", v20);
        }
LABEL_52:

        ++v16;
      }
      while (v16 != v14);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v168, v182, 16);
    }
    while (v14);
  }

  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v131 = v3;
  v136 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
  if (v136)
  {
    v133 = *(_QWORD *)v161;
    do
    {
      for (k = 0; k != v136; ++k)
      {
        if (*(_QWORD *)v161 != v133)
          objc_enumerationMutation(v131);
        v38 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * k);
        v156 = 0u;
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        objc_msgSend(v38, "details");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v157;
          do
          {
            for (m = 0; m != v41; ++m)
            {
              if (*(_QWORD *)v157 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * m);
              objc_msgSend(v44, "key");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("amountRemaining"));

              if (v46)
              {
                objc_msgSend(v138, "addObject:", v44);
                objc_msgSend(v44, "foreignReferenceIdentifiers");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "setObject:forKeyedSubscript:", v38, v47);

              }
            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v156, v179, 16);
          }
          while (v41);
        }

      }
      v136 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v160, v180, 16);
    }
    while (v136);
  }

  v48 = v128;
  -[PKStoredValuePassProperties balanceAmount](v128->_transitProperties, "balanceAmount");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = 0x1E0C99000uLL;
  v111 = (void *)v49;
  if (v49)
  {
    v51 = -[PKPaymentBalance initWithIdentifier:forCurrencyAmount:]([PKPaymentBalance alloc], "initWithIdentifier:forCurrencyAmount:", CFSTR("ApplicationStoredValueBalanceDefault"), v49);
    -[NSArray safelyAddObject:](v120, "safelyAddObject:", v51);
    -[NSArray safelyAddObject:](v114, "safelyAddObject:", v51);
  }
  else
  {
    if (!-[PKSecureElementPass hasLegacyBalanceModel](v128->_pass, "hasLegacyBalanceModel")
      || -[NSMutableArray count](v128->_balanceFields, "count"))
    {
      goto LABEL_75;
    }
    v51 = objc_alloc_init(PKPassField);
    PKLocalizedPaymentString(CFSTR("LEGACY_PASS_BALANCE_CELL_TITLE"), 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentBalance setLabel:](v51, "setLabel:", v109);

    -[PKPaymentBalance setKey:](v51, "setKey:", CFSTR("balance_identifier_field_storedvalue"));
    -[PKPaymentBalance setForeignReferenceType:](v51, "setForeignReferenceType:", 2);
    v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ApplicationStoredValueBalanceDefault"), 0, 0);
    -[PKPaymentBalance setForeignReferenceIdentifiers:](v51, "setForeignReferenceIdentifiers:", v110);

    -[PKPaymentBalance setCellStyle:](v51, "setCellStyle:", 1);
    -[NSMutableArray addObject:](v128->_balanceFields, "addObject:", v51);
  }

LABEL_75:
  if (v128->_balancesByID)
  {
    balanceFields = v128->_balanceFields;
    if (balanceFields)
    {
      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      v53 = balanceFields;
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v153;
        v116 = v53;
        v113 = *(_QWORD *)v153;
        do
        {
          v57 = 0;
          v118 = v55;
          do
          {
            if (*(_QWORD *)v153 != v56)
              objc_enumerationMutation(v53);
            v58 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * v57);
            objc_msgSend(v58, "label");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "foreignReferenceIdentifiers");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v58, "foreignReferenceType");
            if (v59)
              v61 = (unint64_t)(v60 - 1) > 1;
            else
              v61 = 1;
            if (!v61)
            {
              if (objc_msgSend(v59, "count") == 1)
              {
                -[NSDictionary objectForKeyedSubscript:](v48->_balancesByID, "objectForKeyedSubscript:", v59);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                PKSetBalanceLocalizedStringIfNeeded(v62, v137);
                v150[0] = MEMORY[0x1E0C809B0];
                v150[1] = 3221225472;
                v150[2] = __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke;
                v150[3] = &unk_1E2ACF298;
                v63 = v62;
                v151 = v63;
                v64 = -[NSArray pk_containsObjectPassingTest:](v120, "pk_containsObjectPassingTest:", v150);
                v134 = v63;
                if (v63)
                {
                  if (!v64)
                  {
                    -[NSArray addObject:](v120, "addObject:", v63);
                    v65 = objc_msgSend(v63, "isCurrency");
                    v66 = v114;
                    if ((v65 & 1) != 0 || (v67 = objc_msgSend(v58, "unitType"), v66 = v112, v67 == 3))
                      -[NSArray addObject:](v66, "addObject:", v63);
                  }
                }
                v68 = v151;
              }
              else
              {
                v122 = v58;
                v126 = v57;
                v134 = (void *)objc_msgSend(objc_alloc(*(Class *)(v50 + 3560)), "initWithCapacity:", objc_msgSend(v59, "count"));
                v68 = objc_alloc_init(*(Class *)(v50 + 3560));
                v146 = 0u;
                v147 = 0u;
                v148 = 0u;
                v149 = 0u;
                obja = v59;
                v69 = v59;
                v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v146, v177, 16);
                if (v70)
                {
                  v71 = v70;
                  v72 = *(_QWORD *)v147;
                  do
                  {
                    for (n = 0; n != v71; ++n)
                    {
                      if (*(_QWORD *)v147 != v72)
                        objc_enumerationMutation(v69);
                      v74 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * n);
                      v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v74, 0);
                      -[NSDictionary objectForKeyedSubscript:](v128->_balancesByID, "objectForKeyedSubscript:", v75);
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      v77 = (void *)objc_msgSend(v76, "copy");

                      if (v77)
                      {
                        PKSetBalanceLocalizedStringIfNeeded(v77, v137);
                        -[PKStoredValuePassProperties balanceWithIdentifier:](v128->_transitProperties, "balanceWithIdentifier:", v74);
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v78, "isExpired"))
                          v79 = v68;
                        else
                          v79 = v134;
                        objc_msgSend(v79, "addObject:", v77);

                      }
                    }
                    v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v146, v177, 16);
                  }
                  while (v71);
                }

                v80 = -[PKPaymentBalance initWithComponentBalances:identifiers:expiredBalances:]([PKPaymentBalance alloc], "initWithComponentBalances:identifiers:expiredBalances:", v134, v69, v68);
                if (v80)
                {
                  -[NSArray addObject:](v120, "addObject:", v80);
                  v81 = -[PKPaymentBalance isCurrency](v80, "isCurrency");
                  v82 = v114;
                  if (v81 || (v83 = objc_msgSend(v122, "unitType"), v82 = v112, v83 == 3))
                    -[NSArray addObject:](v82, "addObject:", v80);
                }

                v48 = v128;
                v50 = 0x1E0C99000;
                v53 = v116;
                v55 = v118;
                v56 = v113;
                v59 = obja;
                v57 = v126;
              }

            }
            ++v57;
          }
          while (v57 != v55);
          v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
        }
        while (v55);
      }

    }
  }
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v84 = v138;
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v142, v176, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v143;
    v88 = MEMORY[0x1E0C809B0];
    do
    {
      for (ii = 0; ii != v86; ++ii)
      {
        if (*(_QWORD *)v143 != v87)
          objc_enumerationMutation(v84);
        v90 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * ii);
        objc_msgSend(v90, "foreignReferenceIdentifiers");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(objc_msgSend(v90, "foreignReferenceType") - 3) >= 0xFFFFFFFFFFFFFFFELL && v91 != 0)
        {
          -[NSDictionary objectForKeyedSubscript:](v128->_balancesByID, "objectForKeyedSubscript:", v91);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "label");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setLocalizedTitle:", v94);

          if (v93)
          {
            v140[0] = v88;
            v140[1] = 3221225472;
            v140[2] = __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke_2;
            v140[3] = &unk_1E2ACF298;
            v95 = v93;
            v141 = v95;
            if (!-[NSArray pk_containsObjectPassingTest:](v120, "pk_containsObjectPassingTest:", v140))
              -[NSArray addObject:](v115, "addObject:", v95);
            v96 = v141;
          }
          else
          {
            objc_msgSend(v139, "objectForKeyedSubscript:", v91);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "removeObject:", v96);
          }

        }
      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v142, v176, 16);
    }
    while (v86);
  }

  self = v128;
  v3 = v119;
LABEL_132:
  displayableBalances = self->_displayableBalances;
  self->_displayableBalances = v120;
  v98 = v120;

  displayableCurrencyBalances = self->_displayableCurrencyBalances;
  self->_displayableCurrencyBalances = v114;
  v100 = v114;

  displayablePointsBalances = self->_displayablePointsBalances;
  self->_displayablePointsBalances = v112;
  v102 = v112;

  v103 = (NSArray *)objc_msgSend(v3, "copy");
  displayableCommutePlans = self->_displayableCommutePlans;
  self->_displayableCommutePlans = v103;

  displayableCommutePlanBalances = self->_displayableCommutePlanBalances;
  self->_displayableCommutePlanBalances = v115;
  v106 = v115;

  v107 = (NSArray *)objc_msgSend(v129, "copy");
  displayableCommutePlanActions = self->_displayableCommutePlanActions;
  self->_displayableCommutePlanActions = v107;

}

uint64_t __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = v4 == v5;
  else
    v7 = objc_msgSend(v4, "isEqual:", v5);

  return v7;
}

uint64_t __48__PKTransitBalanceModel__updateBalancesAndPlans__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    v7 = v4 == v5;
  else
    v7 = objc_msgSend(v4, "isEqual:", v5);

  return v7;
}

- (NSString)primaryDisplayableBalance
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_displayableBalances, "count"))
  {
    -[NSArray firstObject](self->_displayableBalances, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formattedValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)displayableListOfBalances
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_displayableBalances, "count"))
    return (NSString *)0;
  if (-[NSArray count](self->_displayableBalances, "count") == 1)
  {
    -[PKTransitBalanceModel primaryDisplayableBalance](self, "primaryDisplayableBalance");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_displayableBalances, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_displayableBalances;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "formattedValue", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "safelyAddObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v11;
  }
}

- (NSString)displayableCommutePlanCount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSArray count](self->_displayableCommutePlans, "count");
  if (v3)
  {
    PKPassLocalizedStringWithFormat(CFSTR("NUMBER_OF_COMMUTE_PLANS"), self->_pass, CFSTR("%lu"), v4, v5, v6, v7, v8, (uint64_t)v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (void)getDisplayableCommutePlanDetailsForTitle:(id *)a3 value:(id *)a4 subtitle:(id *)a5 isExpired:(BOOL *)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;

  v23 = self->_displayableCommutePlans;
  if (-[NSArray count](v23, "count") < 2)
  {
    -[NSArray firstObject](v23, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "label");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "value");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "properties");
      if ((v19 & 3) == 1)
      {
        objc_msgSend(v17, "formattedDateString");
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "hasExpiredPlanDate"))
          *a6 = 1;
      }
      else if ((v19 & 4) != 0)
      {
        objc_msgSend(v17, "passFieldForKey:", CFSTR("amountRemaining"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)(objc_msgSend(v20, "foreignReferenceType") - 1) <= 1)
        {
          objc_msgSend(v20, "foreignReferenceIdentifiers");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTransitBalanceModel balanceForIdentifiers:](self, "balanceForIdentifiers:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "formattedValue");
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
  }
  else
  {
    PKPassLocalizedStringWithFormat(CFSTR("COMMUTE_PLANS"), self->_pass, 0, v11, v12, v13, v14, v15, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTransitBalanceModel displayableCommutePlanCount](self, "displayableCommutePlanCount");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (NSArray)displayableBalances
{
  return self->_displayableBalances;
}

- (NSArray)displayableCurrencyBalances
{
  return self->_displayableCurrencyBalances;
}

- (NSArray)displayablePointsBalances
{
  return self->_displayablePointsBalances;
}

- (NSArray)displayableCommutePlanBalances
{
  return self->_displayableCommutePlanBalances;
}

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (NSArray)displayableCommutePlans
{
  return self->_displayableCommutePlans;
}

- (NSArray)displayableCommutePlanActions
{
  return self->_displayableCommutePlanActions;
}

- (NSMutableArray)balanceFields
{
  return self->_balanceFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_displayableCommutePlanActions, 0);
  objc_storeStrong((id *)&self->_displayableCommutePlans, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
  objc_storeStrong((id *)&self->_displayableCommutePlanBalances, 0);
  objc_storeStrong((id *)&self->_displayablePointsBalances, 0);
  objc_storeStrong((id *)&self->_displayableCurrencyBalances, 0);
  objc_storeStrong((id *)&self->_displayableBalances, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_dynamicPlansByUniqueId, 0);
  objc_storeStrong((id *)&self->_dynamicPlans, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
  objc_storeStrong((id *)&self->_balancesByID, 0);
}

@end
