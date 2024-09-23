@implementation PKTransitAppletState

- (PKFelicaTransitAppletState)felicaState
{
  PKTransitAppletState *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (PKFelicaTransitAppletState *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransitAppletState)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletState *v5;
  uint64_t v6;
  NSNumber *historySequenceNumber;
  uint64_t v8;
  NSNumber *serverRefreshIdentifier;
  void *v10;
  NSDecimalNumber *v11;
  id v12;
  NSDecimalNumber *balance;
  uint64_t v14;
  NSNumber *loyaltyBalance;
  uint64_t v16;
  NSDate *expirationDate;
  uint64_t v18;
  NSString *currency;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *enrouteTransitTypes;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *balances;
  _BYTE v31[20];
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKTransitAppletState;
  v5 = -[PKTransitAppletState init](&v32, sel_init);
  if (v5)
  {
    v5->_blacklisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blacklisted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("historySequenceNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    historySequenceNumber = v5->_historySequenceNumber;
    v5->_historySequenceNumber = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverRefreshIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverRefreshIdentifier = v5->_serverRefreshIdentifier;
    v5->_serverRefreshIdentifier = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
      }
      else
      {
        v12 = objc_alloc(MEMORY[0x1E0CB3598]);
        objc_msgSend(v10, "decimalValue");
        v11 = (NSDecimalNumber *)objc_msgSend(v12, "initWithDecimal:", v31);
      }
      balance = v5->_balance;
      v5->_balance = v11;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loyaltyBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    loyaltyBalance = v5->_loyaltyBalance;
    v5->_loyaltyBalance = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v18 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v18;

    v5->_needsStationProcessing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsStationProcessing"));
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("enrouteTransitTypes"));
    v23 = objc_claimAutoreleasedReturnValue();
    enrouteTransitTypes = v5->_enrouteTransitTypes;
    v5->_enrouteTransitTypes = (NSArray *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("balances"));
    v28 = objc_claimAutoreleasedReturnValue();
    balances = v5->_balances;
    v5->_balances = (NSArray *)v28;

    v5->_appletStateDirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appletStateDirty"));
    if (!v5->_enrouteTransitTypes && objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inStation")))
      -[PKTransitAppletState addEnrouteTransitType:](v5, "addEnrouteTransitType:", CFSTR("TransitMetro"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 blacklisted;
  id v5;

  blacklisted = self->_blacklisted;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", blacklisted, CFSTR("blacklisted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_historySequenceNumber, CFSTR("historySequenceNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverRefreshIdentifier, CFSTR("serverRefreshIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loyaltyBalance, CFSTR("loyaltyBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsStationProcessing, CFSTR("needsStationProcessing"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enrouteTransitTypes, CFSTR("enrouteTransitTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balances, CFSTR("balances"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appletStateDirty, CFSTR("appletStateDirty"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKTransitAppletState isInStation](self, "isInStation"), CFSTR("inStation"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 8) = self->_blacklisted;
  v6 = -[NSNumber copyWithZone:](self->_historySequenceNumber, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSNumber copyWithZone:](self->_serverRefreshIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_balance, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSNumber copyWithZone:](self->_loyaltyBalance, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[NSString copyWithZone:](self->_currency, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  *(_BYTE *)(v5 + 9) = self->_needsStationProcessing;
  v18 = -[NSArray copyWithZone:](self->_enrouteTransitTypes, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[NSArray copyWithZone:](self->_balances, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  *(_BYTE *)(v5 + 10) = self->_appletStateDirty;
  return (id)v5;
}

- (BOOL)isInStation
{
  return -[NSArray count](self->_enrouteTransitTypes, "count") != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  NSNumber *historySequenceNumber;
  NSNumber *v8;
  char v9;
  NSNumber *serverRefreshIdentifier;
  NSNumber *v12;
  NSDecimalNumber *balance;
  NSDecimalNumber *v14;
  NSNumber *loyaltyBalance;
  NSNumber *v16;
  NSDate *expirationDate;
  NSDate *v18;
  NSString *currency;
  NSString *v20;
  NSArray *enrouteTransitTypes;
  NSArray *v22;
  NSArray *balances;
  NSArray *v24;

  v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = 0;
    goto LABEL_10;
  }
  v5 = (unsigned __int8 *)v4;
  v6 = v5;
  if (self->_blacklisted != v5[8] || self->_appletStateDirty != v5[10])
    goto LABEL_10;
  historySequenceNumber = self->_historySequenceNumber;
  v8 = (NSNumber *)*((_QWORD *)v6 + 2);
  if (historySequenceNumber && v8)
  {
    if ((-[NSNumber isEqual:](historySequenceNumber, "isEqual:") & 1) == 0)
      goto LABEL_10;
  }
  else if (historySequenceNumber != v8)
  {
    goto LABEL_10;
  }
  serverRefreshIdentifier = self->_serverRefreshIdentifier;
  v12 = (NSNumber *)*((_QWORD *)v6 + 3);
  if (serverRefreshIdentifier && v12)
  {
    if ((-[NSNumber isEqual:](serverRefreshIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_10;
  }
  else if (serverRefreshIdentifier != v12)
  {
    goto LABEL_10;
  }
  balance = self->_balance;
  v14 = (NSDecimalNumber *)*((_QWORD *)v6 + 4);
  if (balance && v14)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0)
      goto LABEL_10;
  }
  else if (balance != v14)
  {
    goto LABEL_10;
  }
  loyaltyBalance = self->_loyaltyBalance;
  v16 = (NSNumber *)*((_QWORD *)v6 + 5);
  if (loyaltyBalance && v16)
  {
    if ((-[NSNumber isEqual:](loyaltyBalance, "isEqual:") & 1) == 0)
      goto LABEL_10;
  }
  else if (loyaltyBalance != v16)
  {
    goto LABEL_10;
  }
  expirationDate = self->_expirationDate;
  v18 = (NSDate *)*((_QWORD *)v6 + 7);
  if (expirationDate && v18)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
      goto LABEL_10;
  }
  else if (expirationDate != v18)
  {
    goto LABEL_10;
  }
  currency = self->_currency;
  v20 = (NSString *)*((_QWORD *)v6 + 6);
  if (currency && v20)
  {
    if ((-[NSString isEqual:](currency, "isEqual:") & 1) == 0)
      goto LABEL_10;
  }
  else if (currency != v20)
  {
    goto LABEL_10;
  }
  enrouteTransitTypes = self->_enrouteTransitTypes;
  v22 = (NSArray *)*((_QWORD *)v6 + 10);
  if (!enrouteTransitTypes || !v22)
  {
    if (enrouteTransitTypes == v22)
      goto LABEL_43;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  if ((-[NSArray isEqual:](enrouteTransitTypes, "isEqual:") & 1) == 0)
    goto LABEL_10;
LABEL_43:
  if (self->_needsStationProcessing != v6[9])
    goto LABEL_10;
  balances = self->_balances;
  v24 = (NSArray *)*((_QWORD *)v6 + 8);
  if (balances && v24)
    v9 = -[NSArray isEqual:](balances, "isEqual:");
  else
    v9 = balances == v24;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2* ((((2 * self->_needsStationProcessing) | (4 * self->_blacklisted)) | self->_appletStateDirty) & 0x7F));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[NSArray hash](self->_enrouteTransitTypes, "hash");
  v6 = v5 ^ -[NSNumber hash](self->_historySequenceNumber, "hash");
  v7 = v6 ^ -[NSNumber hash](self->_serverRefreshIdentifier, "hash");
  v8 = v7 ^ -[NSDecimalNumber hash](self->_balance, "hash");
  v9 = v8 ^ -[NSArray hash](self->_balances, "hash");
  return v9 ^ -[NSNumber hash](self->_loyaltyBalance, "hash") ^ v4;
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5
{
  return -[PKTransitAppletState processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:](self, "processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:", a3, a4, a5, 0, 0, 0, 0);
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6
{
  return -[PKTransitAppletState processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:](self, "processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:", a3, a4, a5, a6, 0, 0, 0);
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7
{
  return -[PKTransitAppletState processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:](self, "processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:", a3, a4, a5, a6, a7, 0, 0);
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7 unitDictionary:(id)a8
{
  return -[PKTransitAppletState processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:](self, "processUpdateWithAppletHistory:concreteTransactions:ephemeralTransaction:mutatedBalances:balanceLabelDictionary:unitDictionary:planLabelDictionary:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)processUpdateWithAppletHistory:(id)a3 concreteTransactions:(id *)a4 ephemeralTransaction:(id *)a5 mutatedBalances:(id *)a6 balanceLabelDictionary:(id)a7 unitDictionary:(id)a8 planLabelDictionary:(id)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  int v44;
  const __CFString *v45;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint8_t buf[4];
  const __CFString *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v49 = a7;
  v48 = a8;
  v47 = a9;
  v16 = (void *)-[PKTransitAppletState copy](self, "copy");
  objc_msgSend(v15, "sanitizeValuesWithState:", self);
  objc_msgSend(v15, "commutePlans");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCommutePlans:", v17);

  objc_msgSend(v16, "setBlacklisted:", objc_msgSend(v15, "isBlacklisted"));
  objc_msgSend(v15, "balance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBalance:", v18);

  objc_msgSend(v15, "balances");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBalances:", v19);

  objc_msgSend(v15, "loyaltyBalance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLoyaltyBalance:", v20);

  objc_msgSend(v15, "expirationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExpirationDate:", v21);

  objc_msgSend(v15, "currency");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCurrency:", v22);

  objc_msgSend(v15, "serverRefreshIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setServerRefreshIdentifier:", v23);

  if (a6)
  {
    objc_msgSend(v15, "balances");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      -[PKTransitAppletState balances](self, "balances");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v15, "balances");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __171__PKTransitAppletState_processUpdateWithAppletHistory_concreteTransactions_ephemeralTransaction_mutatedBalances_balanceLabelDictionary_unitDictionary_planLabelDictionary___block_invoke;
      v54[3] = &unk_1E2AC2DF0;
      v55 = v26;
      v56 = v27;
      v29 = v27;
      v30 = v26;
      objc_msgSend(v28, "enumerateObjectsUsingBlock:", v54);

      v31 = (void *)objc_msgSend(v29, "copy");
      v32 = *a6;
      *a6 = v31;

    }
  }
  objc_msgSend(v16, "enrouteTransitTypes");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enrouteTransitTypes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitAppletState updatedEnrouteTransitTypesFromExistingTypes:newTypes:](self, "updatedEnrouteTransitTypesFromExistingTypes:newTypes:", v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEnrouteTransitTypes:", v35);

  objc_msgSend(v15, "historyRecords");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "historySequenceNumber");
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v42 = (void *)v41;
          objc_msgSend(v16, "setHistorySequenceNumber:", v41);

          goto LABEL_14;
        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v38)
        continue;
      break;
    }
  }
LABEL_14:

  if ((unint64_t)a4 | (unint64_t)a5 && !-[PKTransitAppletState isEqual:](self, "isEqual:", v16))
  {
    -[PKTransitAppletState _resolveTransactionsFromState:toState:withHistoryRecords:concreteTransactions:ephemeralTransaction:balanceLabels:unitDictionary:planLabels:](self, "_resolveTransactionsFromState:toState:withHistoryRecords:concreteTransactions:ephemeralTransaction:balanceLabels:unitDictionary:planLabels:", self, v16, v36, a4, a5, v49, v48, v47);
    PKLogFacilityTypeGetObject(0xCuLL);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_msgSend(v16, "isInStation");
      v45 = &stru_1E2ADF4C0;
      if (v44)
        v45 = CFSTR("inStation ");
      *(_DWORD *)buf = 138412290;
      v58 = v45;
      _os_log_impl(&dword_18FC92000, v43, OS_LOG_TYPE_DEFAULT, "Resolved State is: %@", buf, 0xCu);
    }

  }
  return v16;
}

void __171__PKTransitAppletState_processUpdateWithAppletHistory_concreteTransactions_ephemeralTransaction_mutatedBalances_balanceLabelDictionary_unitDictionary_planLabelDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      objc_msgSend(v3, "identifier", (_QWORD)v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 && v11)
      {
        v13 = objc_msgSend(v10, "isEqual:", v11);

        if ((v13 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

        if (v10 == v12)
        {
LABEL_14:
          v14 = v9;

          if (!v3 || !v14)
            goto LABEL_18;
          v15 = objc_msgSend(v3, "isEqual:", v14);
          v16 = v14;
          if ((v15 & 1) == 0)
            goto LABEL_19;
          goto LABEL_20;
        }
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = 0;
LABEL_18:
  v16 = v3;
  if (v14 != v3)
  {
LABEL_19:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (_QWORD)v17);
    v16 = v14;
  }
LABEL_20:

}

- (id)updatedEnrouteTransitTypesFromExistingTypes:(id)a3 newTypes:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "count");
  if (v7)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    if (v7)
    {
      v8 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke;
      v15[3] = &unk_1E2AC2E18;
      v9 = v6;
      v16 = v9;
      v10 = v7;
      v17 = v10;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke_2;
      v13[3] = &unk_1E2AC2E40;
      v7 = v10;
      v14 = v7;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    }
  }
  if (objc_msgSend(v7, "count"))
    v11 = (void *)objc_msgSend(v7, "copy");
  else
    v11 = 0;

  return v11;
}

void __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __77__PKTransitAppletState_updatedEnrouteTransitTypesFromExistingTypes_newTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)_resolveTransactionsFromState:(id)a3 toState:(id)a4 withHistoryRecords:(id)a5 concreteTransactions:(id *)a6 ephemeralTransaction:(id *)a7 balanceLabels:(id)a8 unitDictionary:(id)a9 planLabels:(id)a10
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  BOOL v86;
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v97;
  void *v98;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[4];
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v97 = a5;
  v106 = a8;
  v109 = a9;
  v108 = a10;
  v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v13, "historySequenceNumber");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v110, "unsignedIntegerValue");
  objc_msgSend(v13, "enrouteTransitTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enrouteTransitTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v16;
  objc_msgSend(v16, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v17;
  objc_msgSend(v17, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v19;
  if (v19 && (v20 = v19, (objc_msgSend(v19, "isEqual:", v18) & 1) == 0))
    v104 = PKPaymentTransactionTransitSubtypeForTransactionDetailString(v20);
  else
    v104 = 0;
  objc_msgSend(v13, "serverRefreshIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serverRefreshIdentifier");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v13, "appletStateDirty");
  v100 = v21;
  if (!v21 && v101 || v21 && v101 && (objc_msgSend(v21, "isEqualToNumber:") & 1) == 0)
    v22 = 1;
  objc_msgSend(v14, "setAppletStateDirty:", v22);
  v103 = v14;
  v93 = v13;
  if (!v110
    || (objc_msgSend(v14, "historySequenceNumber"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "unsignedIntegerValue"),
        v23,
        v15 != v24))
  {
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v25 = v97;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v118;
      while (2)
      {
        v30 = 0;
        v31 = v28;
        do
        {
          if (*(_QWORD *)v118 != v29)
            objc_enumerationMutation(v25);
          v32 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v30);
          objc_msgSend(v32, "historySequenceNumber");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v28, "unsignedIntegerValue");
          if (v110 && v15 == v33)
          {

            v28 = v31;
            goto LABEL_27;
          }
          if (!v31 || v33 != objc_msgSend(v31, "unsignedIntegerValue"))
            objc_msgSend(v107, "addObject:", v32);

          ++v30;
          v31 = v28;
        }
        while (v27 != v30);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
        if (v27)
          continue;
        break;
      }
LABEL_27:

      v13 = v93;
      v14 = v103;
    }

  }
  objc_msgSend(v13, "balance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    v36 = v34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = v36;
  if ((unint64_t)a6 | (unint64_t)a7)
  {
    v105 = v36;
    v92 = v35;
    objc_msgSend(v14, "currency");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v107, "reverseObjectEnumerator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "nextObject");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v106;
    v102 = v40;
    if (v41)
    {
      v43 = (void *)v41;
      v91 = 0;
      do
      {
        objc_msgSend(v43, "concreteTransactionWithCurrency:balanceLabels:unitDictionary:planLabels:", v38, v42, v109, v108);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v44)
        {
          objc_msgSend(v44, "amount");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "zero");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v46, "compare:", v47);

            if (v48)
            {
              objc_msgSend(v105, "decimalNumberBySubtracting:", v46);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v49;
              if (v49)
              {
                v51 = v49;

                v105 = v51;
                v14 = v103;
              }
              if (!objc_msgSend(v45, "transitType"))
              {
                if (v48 == -1)
                  v52 = 513;
                else
                  v52 = 515;
                objc_msgSend(v45, "setTransitType:", v52);
              }

              v40 = v102;
            }
            v42 = v106;
          }
          v53 = objc_msgSend(v43, "recordType");
          if (v53)
          {
            if (v53 == 1)
            {
              if (v104)
              {
                if (objc_msgSend(v45, "transitType") == v104)
                {
                  objc_msgSend(v45, "endStation");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v54)
                  {
                    objc_msgSend(v45, "setEnRoute:", 1);
                    v55 = v45;

                    v91 = v55;
                  }
                }
              }
            }
          }
          else
          {
            objc_msgSend(v43, "historySequenceNumber");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (v56)
              objc_msgSend(v39, "addObject:", v45);
          }

        }
        objc_msgSend(v40, "nextObject");
        v57 = objc_claimAutoreleasedReturnValue();

        v43 = (void *)v57;
      }
      while (v57);
    }
    else
    {
      v91 = 0;
    }
    objc_msgSend(v14, "balance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (v59)
    {
      v61 = v59;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v61 = (id)objc_claimAutoreleasedReturnValue();
    }
    v62 = v61;
    v63 = a6;

    v64 = objc_msgSend(v105, "compare:", v62);
    v65 = v64;
    v66 = 0;
    if (v92)
    {
      v67 = v104;
      if (v64)
      {
        objc_msgSend(v105, "decimalNumberBySubtracting:", v62);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v68;
        if (v68)
          v69 = v68;

      }
    }
    else
    {
      v67 = v104;
    }
    if (!objc_msgSend(v39, "count") && v98)
    {
      v70 = v95;
      if (v95)
      {
        v70 = v95;
        if ((objc_msgSend(v95, "isEqual:", v98) & 1) != 0)
        {
          v63 = a6;
          goto LABEL_93;
        }
      }
      v89 = v62;
      if (objc_msgSend(v70, "count"))
      {
        v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v70);
        v115[0] = MEMORY[0x1E0C809B0];
        v115[1] = 3221225472;
        v115[2] = __163__PKTransitAppletState__resolveTransactionsFromState_toState_withHistoryRecords_concreteTransactions_ephemeralTransaction_balanceLabels_unitDictionary_planLabels___block_invoke;
        v115[3] = &unk_1E2ABD910;
        v116 = v71;
        v72 = v71;
        objc_msgSend(v98, "pk_objectsPassingTest:", v115);
        v73 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v73 = v98;
      }
      v88 = v65;
      v90 = v38;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v74 = v73;
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
      if (v75)
      {
        v76 = v75;
        v77 = *(_QWORD *)v112;
        do
        {
          v78 = 0;
          do
          {
            if (*(_QWORD *)v112 != v77)
              objc_enumerationMutation(v74);
            v79 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v78);
            +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setOriginatedByDevice:", 1);
            objc_msgSend(v80, "setTransactionType:", 2);
            objc_msgSend(v80, "setTransitType:", PKPaymentTransactionTransitSubtypeForTransactionDetailString(v79));
            if (v66)
            {
              if (v18 && v79)
              {
                if ((objc_msgSend(v79, "isEqual:", v18) & 1) == 0)
                  goto LABEL_87;
LABEL_86:
                objc_msgSend(v80, "setAmount:", v66);

                v66 = 0;
                goto LABEL_87;
              }
              if (v79 == v18)
                goto LABEL_86;
            }
LABEL_87:
            objc_msgSend(v39, "addObject:", v80);

            ++v78;
          }
          while (v76 != v78);
          v81 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v111, v121, 16);
          v76 = v81;
        }
        while (v81);
      }

      v63 = a6;
      v67 = v104;
      v62 = v89;
      v38 = v90;
      v65 = v88;
    }
LABEL_93:
    if (v66)
    {
      +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setOriginatedByDevice:", 1);
      objc_msgSend(v82, "setTransactionType:", 2);
      if (v65 == -1)
        v83 = 513;
      else
        v83 = 515;
      objc_msgSend(v82, "setTransitType:", v83);
      objc_msgSend(v82, "setAmount:", v66);
      objc_msgSend(v39, "addObject:", v82);

      v67 = v104;
    }
    if (!objc_msgSend(v39, "count"))
    {

      v39 = 0;
    }
    if (v63)
    {
      v84 = objc_msgSend(v39, "copy");
      v85 = *v63;
      *v63 = (id)v84;

    }
    if (a7)
      v86 = v91 == 0;
    else
      v86 = 0;
    v87 = !v86;
    if (v86 && v67)
    {
      +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setOriginatedByDevice:", 1);
      objc_msgSend(v58, "setTransactionType:", 2);
      objc_msgSend(v58, "setTransitType:", v67);
      objc_msgSend(v58, "setEnRoute:", 1);
      v14 = v103;
      v37 = v105;
      v13 = v93;
    }
    else
    {
      if (v87)
        v58 = v91;
      else
        v58 = 0;
      v14 = v103;
      v37 = v105;
      v13 = v93;
      if (!a7)
        goto LABEL_117;
    }
    objc_storeStrong(a7, v58);
LABEL_117:
    v35 = v92;
    goto LABEL_118;
  }
  v58 = 0;
LABEL_118:

}

uint64_t __163__PKTransitAppletState__resolveTransactionsFromState_toState_withHistoryRecords_concreteTransactions_ephemeralTransaction_balanceLabels_unitDictionary_planLabels___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3
{
  return -[PKTransitAppletState transitPassPropertiesWithPaymentApplication:pass:](self, "transitPassPropertiesWithPaymentApplication:pass:", a3, 0);
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 pass:(id)a4
{
  id v6;
  id v7;
  PKSecureElementPassFieldCollection *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[PKSecureElementPassFieldCollection initWithBalanceFieldsFromPass:]([PKSecureElementPassFieldCollection alloc], "initWithBalanceFieldsFromPass:", v6);

  -[PKTransitAppletState transitPassPropertiesWithPaymentApplication:fieldCollection:](self, "transitPassPropertiesWithPaymentApplication:fieldCollection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)transitPassPropertiesWithPaymentApplication:(id)a3 fieldCollection:(id)a4
{
  id v6;
  id v7;
  PKTransitPassProperties *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKStoredValuePassProperties initWithTransitAppletState:paymentApplication:fieldCollection:]([PKTransitPassProperties alloc], "initWithTransitAppletState:paymentApplication:fieldCollection:", self, v7, v6);

  return v8;
}

- (void)addEnrouteTransitType:(id)a3
{
  NSArray *enrouteTransitTypes;
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v9 = a3;
  if (!-[NSArray containsObject:](self->_enrouteTransitTypes, "containsObject:"))
  {
    enrouteTransitTypes = self->_enrouteTransitTypes;
    if (enrouteTransitTypes)
      v5 = (id)-[NSArray mutableCopy](enrouteTransitTypes, "mutableCopy");
    else
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = v5;
    objc_msgSend(v5, "addObject:", v9);
    v7 = (NSArray *)objc_msgSend(v6, "copy");
    v8 = self->_enrouteTransitTypes;
    self->_enrouteTransitTypes = v7;

  }
}

- (BOOL)isBlacklisted
{
  return self->_blacklisted;
}

- (void)setBlacklisted:(BOOL)a3
{
  self->_blacklisted = a3;
}

- (NSNumber)historySequenceNumber
{
  return self->_historySequenceNumber;
}

- (void)setHistorySequenceNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)serverRefreshIdentifier
{
  return self->_serverRefreshIdentifier;
}

- (void)setServerRefreshIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)loyaltyBalance
{
  return self->_loyaltyBalance;
}

- (void)setLoyaltyBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)commutePlans
{
  return self->_commutePlans;
}

- (void)setCommutePlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)enrouteTransitTypes
{
  return self->_enrouteTransitTypes;
}

- (void)setEnrouteTransitTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)needsStationProcessing
{
  return self->_needsStationProcessing;
}

- (void)setNeedsStationProcessing:(BOOL)a3
{
  self->_needsStationProcessing = a3;
}

- (BOOL)appletStateDirty
{
  return self->_appletStateDirty;
}

- (void)setAppletStateDirty:(BOOL)a3
{
  self->_appletStateDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrouteTransitTypes, 0);
  objc_storeStrong((id *)&self->_commutePlans, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_loyaltyBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_serverRefreshIdentifier, 0);
  objc_storeStrong((id *)&self->_historySequenceNumber, 0);
}

@end
