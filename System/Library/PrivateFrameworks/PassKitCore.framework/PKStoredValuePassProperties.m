@implementation PKStoredValuePassProperties

- (PKStoredValuePassProperties)initWithTransitAppletState:(id)a3 paymentApplication:(id)a4 fieldCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKStoredValuePassProperties *v11;
  void *v12;
  uint64_t v13;
  NSString *appletFormat;
  NSDecimalNumber *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  uint64_t v21;
  PKCurrencyAmount *balanceAmount;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  PKStoredValuePassBalance *v35;
  void *v36;
  char v37;
  PKStoredValuePassBalance *v38;
  NSArray *v39;
  uint64_t v40;
  NSArray *balances;
  PKStoredValuePassBalance *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSDate *expirationDate;
  void *v47;
  uint64_t v48;
  NSArray *enrouteTransitTypes;
  NSString *v51;
  NSDecimalNumber *v52;
  id v53;
  PKStoredValuePassProperties *v54;
  id v55;
  id v56;
  PKStoredValuePassBalance *obj;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSArray *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  PKStoredValuePassBalance *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v71.receiver = self;
  v71.super_class = (Class)PKStoredValuePassProperties;
  v11 = -[PKStoredValuePassProperties init](&v71, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "appletDataFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    appletFormat = v11->_appletFormat;
    v11->_appletFormat = (NSString *)v13;

    objc_msgSend(v8, "balance");
    v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balances");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currency");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v9, "appletCurrencyCode");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;

    if (v15 && v20)
    {
      PKCurrencyAmountCreate(v15, v20, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      balanceAmount = v11->_balanceAmount;
      v11->_balanceAmount = (PKCurrencyAmount *)v21;

    }
    if (objc_msgSend(v16, "count"))
    {
      v51 = v20;
      v52 = v15;
      v54 = v11;
      v55 = v9;
      v56 = v8;
      v53 = v10;
      objc_msgSend(v10, "balanceFields");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v23;
      v60 = -[PKStoredValuePassBalance countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (v60)
      {
        v58 = *(_QWORD *)v68;
        v59 = v16;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v68 != v58)
              objc_enumerationMutation(obj);
            v61 = v24;
            v25 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v24);
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v26 = v16;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v64;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v64 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                  objc_msgSend(v25, "foreignReferenceIdentifiers");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "identifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v32, "containsObject:", v33);

                  if (v34)
                  {
                    v35 = -[PKStoredValuePassBalance initWithTransitAppletBalance:balanceField:]([PKStoredValuePassBalance alloc], "initWithTransitAppletBalance:balanceField:", v31, v25);
                    -[PKStoredValuePassBalance balanceType](v35, "balanceType");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.wallet.storedvaluepassbalancetype.unknown"));

                    if ((v37 & 1) == 0)
                      -[NSArray safelyAddObject:](v62, "safelyAddObject:", v35);

                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
              }
              while (v28);
            }

            v24 = v61 + 1;
            v16 = v59;
          }
          while (v61 + 1 != v60);
          v60 = -[PKStoredValuePassBalance countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        }
        while (v60);
      }
      v38 = obj;

      v39 = v62;
      v40 = -[NSArray copy](v62, "copy");
      v11 = v54;
      balances = v54->_balances;
      v54->_balances = (NSArray *)v40;

      v9 = v55;
      v8 = v56;
      v15 = v52;
      v10 = v53;
      v20 = v51;
    }
    else
    {
      v42 = -[PKStoredValuePassBalance initWithCurrencyAmount:]([PKStoredValuePassBalance alloc], "initWithCurrencyAmount:", v11->_balanceAmount);
      v38 = v42;
      if (v42)
      {
        v72 = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v39 = v11->_balances;
        v11->_balances = (NSArray *)v43;
      }
      else
      {
        v39 = v11->_balances;
        v11->_balances = (NSArray *)MEMORY[0x1E0C9AA60];
      }
    }

    v11->_blocked = objc_msgSend(v8, "isBlacklisted");
    objc_msgSend(v8, "expirationDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "copy");
    expirationDate = v11->_expirationDate;
    v11->_expirationDate = (NSDate *)v45;

    objc_msgSend(v8, "enrouteTransitTypes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "copy");
    enrouteTransitTypes = v11->_enrouteTransitTypes;
    v11->_enrouteTransitTypes = (NSArray *)v48;

  }
  return v11;
}

+ (PKStoredValuePassProperties)passPropertiesForPass:(PKPass *)pass
{
  void *v3;
  void *v4;

  -[PKPass paymentPass](pass, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKStoredValuePassProperties *)v4;
}

- (BOOL)isEqual:(id)a3
{
  PKStoredValuePassProperties *v4;
  PKStoredValuePassProperties *v5;
  PKStoredValuePassProperties *v6;
  NSDate *expirationDate;
  NSDate *v8;
  char v9;
  NSString *appletFormat;
  NSString *v11;
  PKCurrencyAmount *balanceAmount;
  PKCurrencyAmount *v13;
  NSArray *enrouteTransitTypes;
  NSArray *v15;
  NSArray *balances;
  NSArray *v17;

  v4 = (PKStoredValuePassProperties *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "equalityClass");
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "equalityClass");
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v5;
          if (self->_blocked == v6->_blocked)
          {
            expirationDate = self->_expirationDate;
            v8 = v6->_expirationDate;
            if (expirationDate && v8)
            {
              if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
                goto LABEL_30;
            }
            else if (expirationDate != v8)
            {
              goto LABEL_30;
            }
            appletFormat = self->_appletFormat;
            v11 = v6->_appletFormat;
            if (appletFormat && v11)
            {
              if ((-[NSString isEqual:](appletFormat, "isEqual:") & 1) == 0)
                goto LABEL_30;
            }
            else if (appletFormat != v11)
            {
              goto LABEL_30;
            }
            balanceAmount = self->_balanceAmount;
            v13 = v6->_balanceAmount;
            if (balanceAmount && v13)
            {
              if (!-[PKCurrencyAmount isEqual:](balanceAmount, "isEqual:"))
                goto LABEL_30;
            }
            else if (balanceAmount != v13)
            {
              goto LABEL_30;
            }
            enrouteTransitTypes = self->_enrouteTransitTypes;
            v15 = v6->_enrouteTransitTypes;
            if (enrouteTransitTypes && v15)
            {
              if ((-[NSArray isEqual:](enrouteTransitTypes, "isEqual:") & 1) != 0)
              {
LABEL_26:
                balances = self->_balances;
                v17 = v6->_balances;
                if (balances && v17)
                  v9 = -[NSArray isEqual:](balances, "isEqual:");
                else
                  v9 = balances == v17;
                goto LABEL_31;
              }
            }
            else if (enrouteTransitTypes == v15)
            {
              goto LABEL_26;
            }
          }
LABEL_30:
          v9 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
    }
    v9 = 0;
  }
LABEL_32:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_appletFormat);
  objc_msgSend(v3, "safelyAddObject:", self->_balanceAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_enrouteTransitTypes);
  objc_msgSend(v3, "safelyAddObject:", self->_balances);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_blocked - v4 + 32 * v4;

  return v5;
}

+ (Class)equalityClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appletFormat, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_balanceAmount, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  *(_BYTE *)(v5 + 8) = self->_blocked;
  v12 = -[NSArray copyWithZone:](self->_enrouteTransitTypes, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSArray copyWithZone:](self->_balances, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKStoredValuePassProperties)initWithCoder:(id)a3
{
  id v4;
  PKStoredValuePassProperties *v5;
  uint64_t v6;
  NSString *appletFormat;
  uint64_t v8;
  PKCurrencyAmount *balanceAmount;
  uint64_t v10;
  NSDate *expirationDate;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *enrouteTransitTypes;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *balances;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKStoredValuePassProperties;
  v5 = -[PKStoredValuePassProperties init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletFormat = v5->_appletFormat;
    v5->_appletFormat = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v8 = objc_claimAutoreleasedReturnValue();
    balanceAmount = v5->_balanceAmount;
    v5->_balanceAmount = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v5->_blocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blocked"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("enrouteTransitTypes"));
    v15 = objc_claimAutoreleasedReturnValue();
    enrouteTransitTypes = v5->_enrouteTransitTypes;
    v5->_enrouteTransitTypes = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("storedBalances"));
    v20 = objc_claimAutoreleasedReturnValue();
    balances = v5->_balances;
    v5->_balances = (NSArray *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appletFormat;
  id v5;

  appletFormat = self->_appletFormat;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appletFormat, CFSTR("appletFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balanceAmount, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_blocked, CFSTR("blocked"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enrouteTransitTypes, CFSTR("enrouteTransitTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balances, CFSTR("storedBalances"));

}

- (NSDecimalNumber)balance
{
  void *v2;
  void *v3;

  -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDecimalNumber *)v3;
}

- (NSString)currencyCode
{
  void *v2;
  void *v3;

  -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)displayableBalance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDecimalNumber *v7;
  NSString *v8;
  void *v9;

  -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formattedStringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKStoredValuePassProperties primaryCashBalance](self, "primaryCashBalance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (v6)
    {
      objc_msgSend(v6, "amount");
      v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currencyCode");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v7, v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "formattedStringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (id)decimalBalance
{
  void *v2;
  void *v3;

  -[PKStoredValuePassProperties balanceAmount](self, "balanceAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isInStation
{
  return -[NSArray count](self->_enrouteTransitTypes, "count") != 0;
}

- (BOOL)isEnRoute
{
  return -[NSArray count](self->_enrouteTransitTypes, "count") != 0;
}

- (BOOL)isBlacklisted
{
  return self->_blocked;
}

- (id)balanceWithIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_balances;
    v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "identifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)primaryCashBalance
{
  void *v2;
  void *v3;

  -[PKStoredValuePassProperties balances](self, "balances");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_firstObjectPassingTest:", &__block_literal_global_174);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __49__PKStoredValuePassProperties_primaryCashBalance__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrencyBalance");
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (void)setBlocked:(BOOL)a3
{
  self->_blocked = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)balances
{
  return self->_balances;
}

- (void)setBalances:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)appletFormat
{
  return self->_appletFormat;
}

- (void)setAppletFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKCurrencyAmount)balanceAmount
{
  return self->_balanceAmount;
}

- (void)setBalanceAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setInStation:(BOOL)a3
{
  self->_inStation = a3;
}

- (NSDecimalNumber)decimalTransitBalance
{
  return self->_decimalTransitBalance;
}

- (NSArray)enrouteTransitTypes
{
  return self->_enrouteTransitTypes;
}

- (void)setEnrouteTransitTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrouteTransitTypes, 0);
  objc_storeStrong((id *)&self->_decimalTransitBalance, 0);
  objc_storeStrong((id *)&self->_balanceAmount, 0);
  objc_storeStrong((id *)&self->_appletFormat, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
