@implementation PKTransitAppletHistory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransitAppletHistory)init
{
  PKTransitAppletHistory *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTransitAppletHistory;
  result = -[PKTransitAppletHistory init](&v3, sel_init);
  if (result)
    result->_source = 0;
  return result;
}

- (PKTransitAppletHistory)initWithDictionary:(id)a3 source:(int64_t)a4
{
  id v6;
  void *v7;
  PKTransitAppletHistory *v8;
  PKTransitAppletHistory *v9;
  uint64_t v10;
  NSString *serviceProvider;
  void *v12;
  PKTransitAppletHistory *v13;
  uint64_t v14;
  NSSet *enrouteTransitTypes;
  void *v16;
  uint64_t v17;
  NSDecimalNumber *balance;
  uint64_t v19;
  NSString *currency;
  void *v21;
  uint64_t v22;
  NSNumber *loyaltyBalance;
  void *v24;
  uint64_t v25;
  NSDate *expirationDate;
  void *v27;
  uint64_t v28;
  NSNumber *serverRefreshIdentifier;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  PKTransitAppletBalance *v37;
  uint64_t v38;
  NSArray *balances;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  PKTransitAppletCommutePlan *v47;
  uint64_t v48;
  NSArray *commutePlans;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  PKTransitAppletHistoryRecord *v58;
  uint64_t v59;
  NSArray *historyRecords;
  void *v62;
  PKTransitAppletHistory *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  objc_super v80;
  _BYTE v81[128];
  uint64_t v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("State"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v80.receiver = self;
    v80.super_class = (Class)PKTransitAppletHistory;
    v8 = -[PKTransitAppletHistory init](&v80, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_source = a4;
      objc_msgSend(v7, "PKStringForKey:", CFSTR("SP"));
      v10 = objc_claimAutoreleasedReturnValue();
      serviceProvider = v9->_serviceProvider;
      v9->_serviceProvider = (NSString *)v10;

      objc_msgSend(v7, "PKNumberForKey:", CFSTR("CardDenyListed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_blacklisted = objc_msgSend(v12, "BOOLValue");

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
      v13 = (PKTransitAppletHistory *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v9->_inStationDetails, v13);
      v63 = v13;
      PKEnrouteTransitTypesForTransactionsInProgress(v13);
      v14 = objc_claimAutoreleasedReturnValue();
      enrouteTransitTypes = v9->_enrouteTransitTypes;
      v9->_enrouteTransitTypes = (NSSet *)v14;

      objc_msgSend(v7, "PKDecimalNumberForKey:", CFSTR("Balance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      balance = v9->_balance;
      v9->_balance = (NSDecimalNumber *)v17;

      objc_msgSend(v7, "PKStringForKey:", CFSTR("CardCurrency"));
      v19 = objc_claimAutoreleasedReturnValue();
      currency = v9->_currency;
      v9->_currency = (NSString *)v19;

      objc_msgSend(v7, "PKNumberForKey:", CFSTR("PointBalance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "copy");
      loyaltyBalance = v9->_loyaltyBalance;
      v9->_loyaltyBalance = (NSNumber *)v22;

      objc_msgSend(v7, "PKDateComponentsForKey:", CFSTR("CardExpirationDate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PKDateFromDateComponents(v24);
      v25 = objc_claimAutoreleasedReturnValue();
      expirationDate = v9->_expirationDate;
      v9->_expirationDate = (NSDate *)v25;

      objc_msgSend(v7, "PKNumberForKey:", CFSTR("ServerRefreshRequired"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "copy");
      serverRefreshIdentifier = v9->_serverRefreshIdentifier;
      v9->_serverRefreshIdentifier = (NSNumber *)v28;

      objc_msgSend(v7, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("Balances"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v65 = v30;
      v66 = v7;
      if (v30)
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v32 = v30;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v77 != v35)
                objc_enumerationMutation(v32);
              v37 = -[PKTransitAppletBalance initWithDictionary:]([PKTransitAppletBalance alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i));
              if (v37)
                objc_msgSend(v31, "addObject:", v37);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          }
          while (v34);
        }

        v38 = objc_msgSend(v31, "copy");
        balances = v9->_balances;
        v9->_balances = (NSArray *)v38;

      }
      objc_msgSend(v7, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("CommutePlans"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v67 = v6;
      v64 = v40;
      if (v40)
      {
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v42 = v40;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v73;
          do
          {
            for (j = 0; j != v44; ++j)
            {
              if (*(_QWORD *)v73 != v45)
                objc_enumerationMutation(v42);
              v47 = -[PKTransitAppletCommutePlan initWithDictionary:]([PKTransitAppletCommutePlan alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j));
              if (v47)
                objc_msgSend(v41, "addObject:", v47);

            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
          }
          while (v44);
        }

        v48 = objc_msgSend(v41, "copy");
        commutePlans = v9->_commutePlans;
        v9->_commutePlans = (NSArray *)v48;

        v6 = v67;
      }
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("Transaction"));
      v50 = objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        v82 = v50;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1, v50);
      }
      else
      {
        objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("TransactionHistory"), 0);
      }
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v53 = v51;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v69;
        do
        {
          for (k = 0; k != v55; ++k)
          {
            if (*(_QWORD *)v69 != v56)
              objc_enumerationMutation(v53);
            v58 = -[PKTransitAppletHistoryRecord initWithDictionary:]([PKTransitAppletHistoryRecord alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k));
            if (v58)
              objc_msgSend(v52, "addObject:", v58);

          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
        }
        while (v55);
      }

      v59 = objc_msgSend(v52, "copy");
      historyRecords = v9->_historyRecords;
      v9->_historyRecords = (NSArray *)v59;

      v7 = v66;
      v6 = v67;
      self = v63;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKTransitAppletHistory)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletHistory *v5;
  uint64_t v6;
  NSString *serviceProvider;
  uint64_t v8;
  NSString *currency;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *inStationDetails;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSSet *enrouteTransitTypes;
  uint64_t v20;
  NSNumber *serverRefreshIdentifier;
  NSArray *v22;
  uint64_t v23;
  NSSet *v24;
  void *v25;
  uint64_t v26;
  NSSet *v27;
  uint64_t v28;
  NSDecimalNumber *balance;
  uint64_t v30;
  NSNumber *loyaltyBalance;
  uint64_t v32;
  NSDate *expirationDate;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSArray *historyRecords;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSArray *balances;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSArray *commutePlans;
  objc_super v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKTransitAppletHistory;
  v5 = -[PKTransitAppletHistory init](&v50, sel_init);
  if (v5)
  {
    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceProvider"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceProvider = v5->_serviceProvider;
    v5->_serviceProvider = (NSString *)v6;

    v5->_blacklisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blacklisted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currency"));
    v8 = objc_claimAutoreleasedReturnValue();
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("inStationDetails"));
    v13 = objc_claimAutoreleasedReturnValue();
    inStationDetails = v5->_inStationDetails;
    v5->_inStationDetails = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("enrouteFlagsKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    enrouteTransitTypes = v5->_enrouteTransitTypes;
    v5->_enrouteTransitTypes = (NSSet *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverRefreshIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    serverRefreshIdentifier = v5->_serverRefreshIdentifier;
    v5->_serverRefreshIdentifier = (NSNumber *)v20;

    if (!v5->_enrouteTransitTypes)
    {
      v22 = v5->_inStationDetails;
      if (v22)
      {
        PKEnrouteTransitTypesForTransactionsInProgress(v22);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v5->_enrouteTransitTypes;
        v5->_enrouteTransitTypes = (NSSet *)v23;

      }
    }
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inStation"))
      && !-[NSSet count](v5->_enrouteTransitTypes, "count"))
    {
      v51[0] = CFSTR("TransitMetro");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      PKEnrouteTransitTypesForTransactionsInProgress(v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v5->_enrouteTransitTypes;
      v5->_enrouteTransitTypes = (NSSet *)v26;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v28 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loyaltyBalance"));
    v30 = objc_claimAutoreleasedReturnValue();
    loyaltyBalance = v5->_loyaltyBalance;
    v5->_loyaltyBalance = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v32;

    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("historyRecords"));
    v37 = objc_claimAutoreleasedReturnValue();
    historyRecords = v5->_historyRecords;
    v5->_historyRecords = (NSArray *)v37;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v40 = objc_opt_class();
    objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("balances"));
    v42 = objc_claimAutoreleasedReturnValue();
    balances = v5->_balances;
    v5->_balances = (NSArray *)v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("commutePlans"));
    v47 = objc_claimAutoreleasedReturnValue();
    commutePlans = v5->_commutePlans;
    v5->_commutePlans = (NSArray *)v47;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKTransitAppletHistory;
  -[PKTransitAppletHistory dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceProvider, CFSTR("serviceProvider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverRefreshIdentifier, CFSTR("serverRefreshIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_blacklisted, CFSTR("blacklisted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loyaltyBalance, CFSTR("loyaltyBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_historyRecords, CFSTR("historyRecords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inStationDetails, CFSTR("inStationDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enrouteTransitTypes, CFSTR("enrouteFlagsKey"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PKTransitAppletHistory isInStation](self, "isInStation"), CFSTR("inStation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balances, CFSTR("balances"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commutePlans, CFSTR("commutePlans"));

}

- (BOOL)isInStation
{
  return -[NSSet count](self->_enrouteTransitTypes, "count") != 0;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)serverRefreshIdentifier
{
  return self->_serverRefreshIdentifier;
}

- (void)setServerRefreshIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isBlacklisted
{
  return self->_blacklisted;
}

- (void)setBlacklisted:(BOOL)a3
{
  self->_blacklisted = a3;
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)loyaltyBalance
{
  return self->_loyaltyBalance;
}

- (void)setLoyaltyBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSArray)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)commutePlans
{
  return self->_commutePlans;
}

- (NSArray)historyRecords
{
  return self->_historyRecords;
}

- (void)setHistoryRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)inStationDetails
{
  return self->_inStationDetails;
}

- (void)setInStationDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSSet)enrouteTransitTypes
{
  return self->_enrouteTransitTypes;
}

- (void)setEnrouteTransitTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrouteTransitTypes, 0);
  objc_storeStrong((id *)&self->_inStationDetails, 0);
  objc_storeStrong((id *)&self->_historyRecords, 0);
  objc_storeStrong((id *)&self->_commutePlans, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_loyaltyBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_serverRefreshIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

- (id)felicaHistory
{
  PKTransitAppletHistory *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

@end
