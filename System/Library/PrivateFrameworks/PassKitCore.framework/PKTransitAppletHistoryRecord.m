@implementation PKTransitAppletHistoryRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)paymentTransactionType
{
  return 2;
}

- (int64_t)transitTransactionSubtype
{
  uint64_t v3;
  uint64_t v4;
  int64_t result;
  BOOL v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = -[PKTransitAppletHistoryRecord subtype](self, "subtype");
  if (v3 > 65)
  {
    if ((unint64_t)(v3 - 128) >= 3)
    {
      if (v3 == 66)
      {
        return 514;
      }
      else if (v3 == 67)
      {
        return 518;
      }
      else
      {
LABEL_10:
        v9 = -[PKTransitAppletHistoryRecord type](self, "type");
        if (v9 > 4)
          return 1;
        else
          return qword_190454180[v9];
      }
    }
    else
    {
      return 513;
    }
  }
  else
  {
    v4 = v3 - 1;
    result = 8;
    switch(v4)
    {
      case 0:
        v6 = -[PKTransitAppletHistoryRecord detail](self, "detail") == 64;
        v7 = 2;
        v8 = 1026;
        goto LABEL_21;
      case 1:
        return 3;
      case 2:
        v11 = -[PKTransitAppletHistoryRecord detail](self, "detail");
        v7 = 258;
        v8 = 4;
        v12 = 4;
        if (v11 == 129)
          v12 = 257;
        if (v11 != 128)
          v7 = v12;
        v6 = v11 == 0;
LABEL_21:
        if (v6)
          return v8;
        else
          return v7;
      case 3:
        v10 = -[PKTransitAppletHistoryRecord detail](self, "detail");
        if (v10 <= 192)
        {
          if (v10 == 192)
            return 259;
          return 5;
        }
        if (v10 != 194)
        {
          if (v10 == 193)
            return 260;
          return 5;
        }
        result = 261;
        break;
      case 4:
        if (-[PKTransitAppletHistoryRecord detail](self, "detail") - 256 >= 2)
          return 6;
        else
          return 1025;
      case 5:
        return 7;
      case 6:
        return result;
      default:
        goto LABEL_10;
    }
  }
  return result;
}

- (unint64_t)transitTransactionModifier
{
  return self->_transitModifiers;
}

- (id)_transactionCommutePlanUnitsWithPlanLabels:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PKTransactionCommutePlanUnit *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_plans;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "commutePlanIdentifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PKTransactionCommutePlanUnit initWithTimedPlanIdentifier:label:]([PKTransactionCommutePlanUnit alloc], "initWithTimedPlanIdentifier:label:", v11, v12);
          objc_msgSend(v5, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)_transactionAmountsWithBalanceLabels:(id)a3 planLabels:(id)a4 unitDictionary:(id)a5
{
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  void *v24;
  void *v25;
  PKCurrencyAmount *v26;
  void *v27;
  PKTransactionAmount *v28;
  PKTransactionAmount *v29;
  void *v30;
  id v32;
  NSArray *obj;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v32 = a4;
  v35 = a5;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = self->_amounts;
  v38 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v9, "balanceIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v36, "objectForKeyedSubscript:", v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (!v11 || (v13 = objc_msgSend(v11, "length"), v12, !v13))
          {
            objc_msgSend(v32, "objectForKeyedSubscript:", v10);
            v14 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v14;
          }
          objc_msgSend(v35, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "integerValue");
          objc_msgSend(v9, "amount");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "currency");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v9, "exponent");
          PKLocalizedPaymentUnitKeyForType(v16);
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          v21 = v18;
          v22 = v21;
          if (v21 == CFSTR("XXX"))
          {

            if (!v15)
              goto LABEL_18;
LABEL_15:
            if (!v20)
              goto LABEL_20;
            objc_msgSend(v17, "pk_absoluteValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedPaymentString(v20, CFSTR("%lu"), objc_msgSend(v24, "unsignedLongValue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:]([PKCurrencyAmount alloc], "initWithAmount:exponent:preformattedString:", v17, v19, v25);
          }
          else
          {
            if (CFSTR("XXX") && v21)
            {
              v23 = -[__CFString isEqualToString:](v21, "isEqualToString:");

              if (v23)
              {
                if (v15)
                  goto LABEL_15;
LABEL_18:
                PKLocalizedPaymentString(CFSTR("TRANSACTION_PENDING_AMOUNT"), 0);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:]([PKCurrencyAmount alloc], "initWithAmount:exponent:preformattedString:", v17, v19, v27);

                v28 = -[PKTransactionAmount initWithPendingCurrencyAmount:unitIdentifier:]([PKTransactionAmount alloc], "initWithPendingCurrencyAmount:unitIdentifier:", v26, v10);
LABEL_22:
                v29 = v28;
                objc_msgSend(v34, "addObject:", v28);

                goto LABEL_23;
              }
            }
            else
            {

            }
LABEL_20:
            v26 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v17, v22, v19);
          }
          v28 = -[PKTransactionAmount initWithCurrencyAmount:label:]([PKTransactionAmount alloc], "initWithCurrencyAmount:label:", v26, v12);
          goto LABEL_22;
        }
LABEL_23:

      }
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v38);
  }

  v30 = (void *)objc_msgSend(v34, "copy");
  return v30;
}

- (PKTransitAppletHistoryRecord)initWithDictionary:(id)a3
{
  id v4;
  PKTransitAppletHistoryRecord *v5;
  PKTransitAppletHistoryRecord *v6;
  void *v7;
  uint64_t v8;
  NSNumber *historySequenceNumber;
  void *v10;
  uint64_t v11;
  NSDate *time;
  void *v13;
  uint64_t v14;
  NSDecimalNumber *balance;
  void *v16;
  uint64_t v17;
  NSNumber *loyaltyBalance;
  void *v19;
  uint64_t v20;
  NSNumber *cityCode;
  void *v22;
  uint64_t v23;
  NSString *transitDetail;
  void *v25;
  uint64_t v26;
  NSDecimalNumber *amount;
  void *v28;
  uint64_t v29;
  NSNumber *loyaltyAmount;
  uint64_t v31;
  NSData *startStation;
  uint64_t v33;
  NSData *endStation;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  PKTransitAppletAmount *v50;
  uint64_t v51;
  NSArray *amounts;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  PKTransitAppletPlan *v59;
  uint64_t v60;
  NSArray *plans;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PKTransitAppletHistoryRecord;
  v5 = -[PKTransitAppletHistoryRecord init](&v74, sel_init);
  v6 = v5;
  if (!v4 || !v5)
    goto LABEL_46;
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("SerialNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");
  historySequenceNumber = v6->_historySequenceNumber;
  v6->_historySequenceNumber = (NSNumber *)v8;

  objc_msgSend(v4, "PKDateComponentsForKey:", CFSTR("TransactionTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKDateFromDateComponents(v10);
  v11 = objc_claimAutoreleasedReturnValue();
  time = v6->_time;
  v6->_time = (NSDate *)v11;

  objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("FinalBalance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copy");
  balance = v6->_balance;
  v6->_balance = (NSDecimalNumber *)v14;

  objc_msgSend(v4, "PKNumberForKey:", CFSTR("PointsBalance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "copy");
  loyaltyBalance = v6->_loyaltyBalance;
  v6->_loyaltyBalance = (NSNumber *)v17;

  objc_msgSend(v4, "PKNumberForKey:", CFSTR("CityCode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "copy");
  cityCode = v6->_cityCode;
  v6->_cityCode = (NSNumber *)v20;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("TypeDetail"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "copy");
  transitDetail = v6->_transitDetail;
  v6->_transitDetail = (NSString *)v23;

  -[PKTransitAppletHistoryRecord _setTransactionHistoryDetailsFromString:](v6, "_setTransactionHistoryDetailsFromString:", v6->_transitDetail);
  objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("Amount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "copy");
  amount = v6->_amount;
  v6->_amount = (NSDecimalNumber *)v26;

  objc_msgSend(v4, "PKNumberForKey:", CFSTR("PointsAmount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "copy");
  loyaltyAmount = v6->_loyaltyAmount;
  v6->_loyaltyAmount = (NSNumber *)v29;

  objc_msgSend(v4, "PKDataForKey:", CFSTR("StartStation"));
  v31 = objc_claimAutoreleasedReturnValue();
  startStation = v6->_startStation;
  v6->_startStation = (NSData *)v31;

  objc_msgSend(v4, "PKDataForKey:", CFSTR("EndStation"));
  v33 = objc_claimAutoreleasedReturnValue();
  endStation = v6->_endStation;
  v6->_endStation = (NSData *)v33;

  v6->_recordType = 0;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("IgnoreReason"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((objc_msgSend(v35, "isEqual:", CFSTR("EnRoute")) & 1) != 0)
    {
      v37 = 1;
LABEL_15:
      v6->_recordType = v37;
      goto LABEL_16;
    }
    if ((objc_msgSend(v36, "isEqual:", CFSTR("Merged")) & 1) != 0)
    {
      v37 = 2;
      goto LABEL_15;
    }
    PKLogFacilityTypeGetObject(0xCuLL);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v36;
      v39 = "PKTransitAppletHistoryRecord: Unexpected ATL ignore reason: %@";
      v40 = v38;
      v41 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (-[NSString isEqualToString:](v6->_transitDetail, "isEqualToString:", CFSTR("PointsConversion")))
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v40 = v38;
      v41 = 2;
LABEL_13:
      _os_log_impl(&dword_18FC92000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    }
LABEL_14:

    v37 = -1;
    goto LABEL_15;
  }
LABEL_16:
  v64 = v36;
  v6->_transitModifiers = 0;
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("TypeModifiers"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    if (objc_msgSend(v42, "containsObject:", CFSTR("TransferDiscount")))
      v6->_transitModifiers |= 2uLL;
    if (objc_msgSend(v43, "containsObject:", CFSTR("CommuteDiscount")))
      v6->_transitModifiers |= 1uLL;
    if (objc_msgSend(v43, "containsObject:", CFSTR("FareCapped")))
      v6->_transitModifiers |= 4uLL;
    if (objc_msgSend(v43, "containsObject:", CFSTR("FareAdjustment")))
      v6->_transitModifiers |= 8uLL;
    if (objc_msgSend(v43, "containsObject:", CFSTR("FareRebate")))
      v6->_transitModifiers |= 0x10uLL;
  }
  v63 = v43;
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("Amounts"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v71 != v48)
          objc_enumerationMutation(v45);
        v50 = -[PKTransitAppletAmount initWithDictionary:]([PKTransitAppletAmount alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
        if (v50)
          objc_msgSend(v44, "addObject:", v50);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v47);
  }
  v51 = objc_msgSend(v44, "copy");
  amounts = v6->_amounts;
  v6->_amounts = (NSArray *)v51;

  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = v4;
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("CommutePlans"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v67 != v57)
          objc_enumerationMutation(v54);
        v59 = -[PKTransitAppletPlan initWithDictionary:]([PKTransitAppletPlan alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
        if (v59)
          objc_msgSend(v53, "addObject:", v59);

      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v56);
  }
  v60 = objc_msgSend(v53, "copy");
  plans = v6->_plans;
  v6->_plans = (NSArray *)v60;

  v4 = v65;
LABEL_46:

  return v6;
}

- (void)_setTransactionHistoryDetailsFromString:(id)a3
{
  id v4;
  unint64_t v5;
  int64x2_t v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  if (!v4)
    goto LABEL_70;
  v8 = v4;
  if (!objc_msgSend(v4, "isEqual:", CFSTR("Transit")))
  {
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitMetro")))
    {
      v6 = vdupq_n_s64(1uLL);
LABEL_7:
      *(int64x2_t *)&self->_type = v6;
      self->_detail = 0;
      goto LABEL_11;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitMetroUpgrade")))
    {
      *(int64x2_t *)&self->_type = vdupq_n_s64(1uLL);
      v7 = 64;
LABEL_10:
      self->_detail = v7;
      goto LABEL_11;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitLightRail")))
    {
      v6 = (int64x2_t)xmmword_190454240;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitBus")))
    {
      v6 = (int64x2_t)xmmword_19043CD00;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitTrain")))
    {
      v6 = (int64x2_t)xmmword_190436510;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitTrainMaglev")))
    {
      *(_OWORD *)&self->_type = xmmword_190436510;
      v7 = 128;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitTrainShinkansen")))
    {
      *(_OWORD *)&self->_type = xmmword_190436510;
      v7 = 129;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitOther")))
    {
      v6 = (int64x2_t)xmmword_190454230;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitOtherTaxi")))
    {
      *(_OWORD *)&self->_type = xmmword_190454230;
      v7 = 192;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitOtherFerry")))
    {
      *(_OWORD *)&self->_type = xmmword_190454230;
      v7 = 193;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitOtherBike")))
    {
      *(_OWORD *)&self->_type = xmmword_190454230;
      v7 = 194;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitSpecial")))
    {
      v6 = (int64x2_t)xmmword_190454210;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitSpecialGreenCarUsed")))
    {
      *(_OWORD *)&self->_type = xmmword_190454210;
      v7 = 256;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitOtherCableCar")))
    {
      v6 = (int64x2_t)xmmword_190454220;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TransitSpecialGreenCarSeated")))
    {
      *(_OWORD *)&self->_type = xmmword_190454210;
      v7 = 257;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("Purchase")))
    {
      v5 = 2;
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseRetail")))
    {
      v6 = (int64x2_t)xmmword_190454200;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseRetailMerchant")))
    {
      *(_OWORD *)&self->_type = xmmword_190454200;
      v7 = 320;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseRetailGasStation")))
    {
      *(_OWORD *)&self->_type = xmmword_190454200;
      v7 = 321;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseAdmission")))
    {
      v6 = (int64x2_t)xmmword_1904541F0;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseAdmissionParking")))
    {
      *(_OWORD *)&self->_type = xmmword_1904541F0;
      v7 = 384;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseAdmissionGarden")))
    {
      *(_OWORD *)&self->_type = xmmword_1904541F0;
      v7 = 385;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseRefund")))
    {
      v6 = (int64x2_t)xmmword_1904541E0;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseRefundReturn")))
    {
      *(_OWORD *)&self->_type = xmmword_1904541E0;
      v7 = 448;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("PurchaseRefundCancellation")))
    {
      *(_OWORD *)&self->_type = xmmword_1904541E0;
      v7 = 449;
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TopUp")))
      goto LABEL_59;
    if (objc_msgSend(v8, "isEqual:", CFSTR("TopUpContactless")))
    {
      v6 = (int64x2_t)xmmword_1904541D0;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TopUpAuto")))
    {
      v6 = (int64x2_t)xmmword_1904541C0;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("TopUpServer")))
    {
      v6 = (int64x2_t)xmmword_1904541B0;
      goto LABEL_7;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("Points")))
    {
LABEL_59:
      v5 = 3;
      goto LABEL_4;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("CardRead")))
    {
      v5 = 4;
      goto LABEL_4;
    }
    objc_msgSend(v8, "isEqual:", CFSTR("Unknown"));
    v4 = v8;
LABEL_70:
    self->_type = 0;
    self->_subtype = 0;
    self->_detail = 0;
    goto LABEL_71;
  }
  v5 = 1;
LABEL_4:
  self->_subtype = 0;
  self->_detail = 0;
  self->_type = v5;
LABEL_11:
  v4 = v8;
LABEL_71:

}

- (PKTransitAppletHistoryRecord)initWithCoder:(id)a3
{
  id v4;
  PKTransitAppletHistoryRecord *v5;
  uint64_t v6;
  NSNumber *historySequenceNumber;
  uint64_t v8;
  NSDate *time;
  uint64_t v10;
  NSString *transitDetail;
  uint64_t v12;
  NSDecimalNumber *balance;
  uint64_t v14;
  NSNumber *loyaltyBalance;
  uint64_t v16;
  NSDecimalNumber *amount;
  uint64_t v18;
  NSNumber *loyaltyAmount;
  uint64_t v20;
  NSData *startStation;
  uint64_t v22;
  NSData *endStation;
  uint64_t v24;
  NSNumber *cityCode;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *amounts;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSArray *plans;

  v4 = a3;
  v5 = -[PKTransitAppletHistoryRecord initWithDictionary:](self, "initWithDictionary:", 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("historySequenceNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    historySequenceNumber = v5->_historySequenceNumber;
    v5->_historySequenceNumber = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
    v8 = objc_claimAutoreleasedReturnValue();
    time = v5->_time;
    v5->_time = (NSDate *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionType"));
    v5->_subtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionSubtype"));
    v5->_detail = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionDetail"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transitDetail"));
    v10 = objc_claimAutoreleasedReturnValue();
    transitDetail = v5->_transitDetail;
    v5->_transitDetail = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v12 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loyaltyBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    loyaltyBalance = v5->_loyaltyBalance;
    v5->_loyaltyBalance = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v16 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loyaltyAmount"));
    v18 = objc_claimAutoreleasedReturnValue();
    loyaltyAmount = v5->_loyaltyAmount;
    v5->_loyaltyAmount = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startStation"));
    v20 = objc_claimAutoreleasedReturnValue();
    startStation = v5->_startStation;
    v5->_startStation = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endStation"));
    v22 = objc_claimAutoreleasedReturnValue();
    endStation = v5->_endStation;
    v5->_endStation = (NSData *)v22;

    v5->_recordType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recordType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cityCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    cityCode = v5->_cityCode;
    v5->_cityCode = (NSNumber *)v24;

    v5->_transitModifiers = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transitModifiers"));
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("amounts"));
    v29 = objc_claimAutoreleasedReturnValue();
    amounts = v5->_amounts;
    v5->_amounts = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("plans"));
    v34 = objc_claimAutoreleasedReturnValue();
    plans = v5->_plans;
    v5->_plans = (NSArray *)v34;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSNumber copyWithZone:](self->_historySequenceNumber, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDate copyWithZone:](self->_time, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v5[3] = self->_type;
  v5[4] = self->_subtype;
  v5[5] = self->_detail;
  v10 = -[NSString copyWithZone:](self->_transitDetail, "copyWithZone:", a3);
  v11 = (void *)v5[16];
  v5[16] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_balance, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSNumber copyWithZone:](self->_loyaltyBalance, "copyWithZone:", a3);
  v15 = (void *)v5[8];
  v5[8] = v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v17 = (void *)v5[9];
  v5[9] = v16;

  v18 = -[NSNumber copyWithZone:](self->_loyaltyAmount, "copyWithZone:", a3);
  v19 = (void *)v5[10];
  v5[10] = v18;

  v20 = -[NSData copyWithZone:](self->_startStation, "copyWithZone:", a3);
  v21 = (void *)v5[12];
  v5[12] = v20;

  v22 = -[NSData copyWithZone:](self->_endStation, "copyWithZone:", a3);
  v23 = (void *)v5[13];
  v5[13] = v22;

  v5[17] = self->_recordType;
  v24 = -[NSNumber copyWithZone:](self->_cityCode, "copyWithZone:", a3);
  v25 = (void *)v5[11];
  v5[11] = v24;

  v5[1] = self->_transitModifiers;
  v26 = -[NSArray copyWithZone:](self->_amounts, "copyWithZone:", a3);
  v27 = (void *)v5[14];
  v5[14] = v26;

  v28 = -[NSArray copyWithZone:](self->_plans, "copyWithZone:", a3);
  v29 = (void *)v5[15];
  v5[15] = v28;

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKTransitAppletHistoryRecord;
  -[PKTransitAppletHistoryRecord dealloc](&v2, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *historySequenceNumber;
  id v5;

  historySequenceNumber = self->_historySequenceNumber;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", historySequenceNumber, CFSTR("historySequenceNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("transactionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_subtype, CFSTR("transactionSubtype"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_detail, CFSTR("transactionDetail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transitDetail, CFSTR("transitDetail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loyaltyBalance, CFSTR("loyaltyBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loyaltyAmount, CFSTR("loyaltyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startStation, CFSTR("startStation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endStation, CFSTR("endStation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_recordType, CFSTR("recordType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cityCode, CFSTR("cityCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transitModifiers, CFSTR("transitModifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amounts, CFSTR("amounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_plans, CFSTR("plans"));

}

- (BOOL)isEqual:(id)a3
{
  PKTransitAppletHistoryRecord *v4;
  PKTransitAppletHistoryRecord *v5;
  BOOL v6;

  v4 = (PKTransitAppletHistoryRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransitAppletHistoryRecord isEqualToTransitAppletHistoryRecord:](self, "isEqualToTransitAppletHistoryRecord:", v5);

  return v6;
}

- (BOOL)isEqualToTransitAppletHistoryRecord:(id)a3
{
  _QWORD *v4;
  NSNumber *historySequenceNumber;
  NSNumber *v6;
  BOOL v7;
  char v8;
  NSDate *time;
  NSDate *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  _BOOL4 v15;
  NSDecimalNumber *balance;
  NSDecimalNumber *v17;
  NSNumber *loyaltyBalance;
  NSNumber *v19;
  NSDecimalNumber *amount;
  NSDecimalNumber *v21;
  NSNumber *loyaltyAmount;
  NSNumber *v23;
  NSData *startStation;
  NSData *v25;
  NSData *endStation;
  NSData *v27;
  NSNumber *cityCode;
  NSNumber *v29;
  NSArray *amounts;
  NSArray *v31;
  NSArray *plans;
  NSArray *v33;
  char v34;

  v4 = a3;
  historySequenceNumber = self->_historySequenceNumber;
  v6 = (NSNumber *)v4[2];
  if (historySequenceNumber)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (historySequenceNumber != v6)
      goto LABEL_68;
  }
  else
  {
    v8 = -[NSNumber isEqual:](historySequenceNumber, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_68;
  }
  time = self->_time;
  v10 = (NSDate *)v4[6];
  if (time && v10)
  {
    if ((-[NSDate isEqual:](time, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (time != v10)
  {
    goto LABEL_68;
  }
  if (self->_type != v4[3] || self->_subtype != v4[4] || self->_detail != v4[5])
    goto LABEL_68;
  v11 = (void *)v4[16];
  v12 = self->_transitDetail;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_68;
    }
    v15 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_68;
  }
  balance = self->_balance;
  v17 = (NSDecimalNumber *)v4[7];
  if (balance && v17)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (balance != v17)
  {
    goto LABEL_68;
  }
  loyaltyBalance = self->_loyaltyBalance;
  v19 = (NSNumber *)v4[8];
  if (loyaltyBalance && v19)
  {
    if ((-[NSNumber isEqual:](loyaltyBalance, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (loyaltyBalance != v19)
  {
    goto LABEL_68;
  }
  amount = self->_amount;
  v21 = (NSDecimalNumber *)v4[9];
  if (amount && v21)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (amount != v21)
  {
    goto LABEL_68;
  }
  loyaltyAmount = self->_loyaltyAmount;
  v23 = (NSNumber *)v4[10];
  if (loyaltyAmount && v23)
  {
    if ((-[NSNumber isEqual:](loyaltyAmount, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (loyaltyAmount != v23)
  {
    goto LABEL_68;
  }
  startStation = self->_startStation;
  v25 = (NSData *)v4[12];
  if (startStation && v25)
  {
    if ((-[NSData isEqual:](startStation, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (startStation != v25)
  {
    goto LABEL_68;
  }
  endStation = self->_endStation;
  v27 = (NSData *)v4[13];
  if (endStation && v27)
  {
    if ((-[NSData isEqual:](endStation, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (endStation != v27)
  {
    goto LABEL_68;
  }
  if (self->_recordType != v4[17])
    goto LABEL_68;
  cityCode = self->_cityCode;
  v29 = (NSNumber *)v4[11];
  if (cityCode && v29)
  {
    if ((-[NSNumber isEqual:](cityCode, "isEqual:") & 1) == 0)
      goto LABEL_68;
  }
  else if (cityCode != v29)
  {
    goto LABEL_68;
  }
  if (self->_transitModifiers != v4[1])
    goto LABEL_68;
  amounts = self->_amounts;
  v31 = (NSArray *)v4[14];
  if (!amounts || !v31)
  {
    if (amounts == v31)
      goto LABEL_64;
LABEL_68:
    v34 = 0;
    goto LABEL_69;
  }
  if ((-[NSArray isEqual:](amounts, "isEqual:") & 1) == 0)
    goto LABEL_68;
LABEL_64:
  plans = self->_plans;
  v33 = (NSArray *)v4[15];
  if (plans && v33)
    v34 = -[NSArray isEqual:](plans, "isEqual:");
  else
    v34 = plans == v33;
LABEL_69:

  return v34;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_historySequenceNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_time);
  objc_msgSend(v3, "safelyAddObject:", self->_transitDetail);
  objc_msgSend(v3, "safelyAddObject:", self->_balance);
  objc_msgSend(v3, "safelyAddObject:", self->_loyaltyBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_loyaltyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_startStation);
  objc_msgSend(v3, "safelyAddObject:", self->_endStation);
  objc_msgSend(v3, "safelyAddObject:", self->_cityCode);
  objc_msgSend(v3, "safelyAddObject:", self->_amounts);
  objc_msgSend(v3, "safelyAddObject:", self->_plans);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_subtype - v5 + 32 * v5;
  v7 = self->_detail - v6 + 32 * v6;
  v8 = self->_recordType - v7 + 32 * v7;
  v9 = self->_transitModifiers - v8 + 32 * v8;

  return v9;
}

- (NSNumber)historySequenceNumber
{
  return self->_historySequenceNumber;
}

- (void)setHistorySequenceNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (unint64_t)detail
{
  return self->_detail;
}

- (void)setDetail:(unint64_t)a3
{
  self->_detail = a3;
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)loyaltyBalance
{
  return self->_loyaltyBalance;
}

- (void)setLoyaltyBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)loyaltyAmount
{
  return self->_loyaltyAmount;
}

- (void)setLoyaltyAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)cityCode
{
  return self->_cityCode;
}

- (void)setCityCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)startStation
{
  return self->_startStation;
}

- (void)setStartStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)endStation
{
  return self->_endStation;
}

- (void)setEndStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)amounts
{
  return self->_amounts;
}

- (void)setAmounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)plans
{
  return self->_plans;
}

- (void)setPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)transitDetail
{
  return self->_transitDetail;
}

- (void)setTransitDetail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(int64_t)a3
{
  self->_recordType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitDetail, 0);
  objc_storeStrong((id *)&self->_plans, 0);
  objc_storeStrong((id *)&self->_amounts, 0);
  objc_storeStrong((id *)&self->_endStation, 0);
  objc_storeStrong((id *)&self->_startStation, 0);
  objc_storeStrong((id *)&self->_cityCode, 0);
  objc_storeStrong((id *)&self->_loyaltyAmount, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_loyaltyBalance, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_historySequenceNumber, 0);
}

- (id)concreteTransactionWithCurrency:(id)a3 balanceLabels:(id)a4 unitDictionary:(id)a5 planLabels:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOriginatedByDevice:", 1);
  objc_msgSend(v14, "setTransactionType:", 2);
  objc_msgSend(v14, "setTransitType:", -[PKTransitAppletHistoryRecord transitTransactionSubtype](self, "transitTransactionSubtype"));
  objc_msgSend(v14, "setTransitModifiers:", -[PKTransitAppletHistoryRecord transitTransactionModifier](self, "transitTransactionModifier"));
  -[PKTransitAppletHistoryRecord startStation](self, "startStation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStartStationCode:", v15);

  -[PKTransitAppletHistoryRecord endStation](self, "endStation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEndStationCode:", v16);

  -[PKTransitAppletHistoryRecord time](self, "time");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTransactionDate:", v17);

  -[PKTransitAppletHistoryRecord cityCode](self, "cityCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCityCode:", v18);

  objc_msgSend(v14, "setCurrencyCode:", v13);
  -[PKTransitAppletHistoryRecord _transactionAmountsWithBalanceLabels:planLabels:unitDictionary:](self, "_transactionAmountsWithBalanceLabels:planLabels:unitDictionary:", v12, v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAmounts:", v19);
  -[PKTransitAppletHistoryRecord _transactionCommutePlanUnitsWithPlanLabels:](self, "_transactionCommutePlanUnitsWithPlanLabels:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPlans:", v20);
  -[PKTransitAppletHistoryRecord amount](self, "amount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToNumber:", v22))
  {
    if (-[PKTransitAppletHistoryRecord recordType](self, "recordType") == 1)
    {

      goto LABEL_9;
    }
    v23 = -[PKTransitAppletHistoryRecord transitTransactionSubtype](self, "transitTransactionSubtype") == 1026;
  }
  else
  {
    v23 = 0;
  }

  if (v21 && !v23)
    objc_msgSend(v14, "setAmount:", v21);
LABEL_9:

  return v14;
}

- (id)felicaHistoryRecord
{
  PKTransitAppletHistoryRecord *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

@end
