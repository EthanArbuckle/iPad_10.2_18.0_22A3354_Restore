@implementation PKPaymentTransaction

+ (PKPaymentTransaction)paymentTransactionWithSource:(unint64_t)a3
{
  PKPaymentTransaction *v4;

  v4 = objc_alloc_init(PKPaymentTransaction);
  -[PKPaymentTransaction setTransactionSource:](v4, "setTransactionSource:", a3);
  return v4;
}

+ (PKPaymentTransaction)paymentTransactionWithSource:(unint64_t)a3 dictionary:(id)a4 unitDictionary:(id)a5 balanceLabelDictionary:(id)a6 planLabelDictionary:(id)a7 hasNotificationServiceData:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  PKMerchant *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  NSDecimalNumber *v62;
  __CFString *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  NSString *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  PKCurrencyAmount *v74;
  PKTransactionAmount *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  uint64_t v84;
  PKTransactionCommutePlanUnit *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  PKTransactionAuthenticationContext *v91;
  void *v92;
  PKTransactionAuthenticationContext *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  id v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  id obj;
  _QWORD v128[4];
  id v129;
  _QWORD v130[4];
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  uint8_t v141[128];
  uint8_t buf[4];
  id v143;
  uint64_t v144;

  v8 = a8;
  v144 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v124 = a5;
  v121 = a6;
  v123 = a7;
  objc_msgSend(a1, "paymentTransactionWithSource:", a3);
  v119 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v15, "valueForKey:", CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", CFSTR("transactionIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("identifier"));
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("serviceIdentifier"));
    v19 = v119;
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FC92000, v20, OS_LOG_TYPE_ERROR, "Transaction payload received from a provider without an 'identifier'. Please file a Radar.", buf, 2u);
    }

    v19 = v119;
    if (PKTransactionDebugDetailsEnabled())
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v143 = v15;
        _os_log_error_impl(&dword_18FC92000, v20, OS_LOG_TYPE_ERROR, "Invalid Transaction Payload: %{public}@", buf, 0xCu);
      }

    }
  }
  if (v18)
  {
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("transactionIdentifier"));
    objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("paymentHash"));
  }
  v21 = (void *)objc_msgSend(v16, "copy");

  objc_msgSend(v21, "PKStringForKey:", CFSTR("serviceIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "PKStringForKey:", CFSTR("paymentHash"));
  v23 = objc_claimAutoreleasedReturnValue();
  v113 = v22;
  objc_msgSend(v22, "uppercaseString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setServiceIdentifier:", v24);

  v112 = (void *)v23;
  objc_msgSend(v19, "setPaymentHash:", v23);
  objc_msgSend(v21, "PKStringForKey:", CFSTR("currencyCode"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCurrencyCode:", v25);

  objc_msgSend(v21, "PKDateForKey:", CFSTR("transactionDate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTransactionDate:", v26);

  objc_msgSend(v21, "PKDateForKey:", CFSTR("transactionStatusChangedDate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTransactionStatusChangedDate:", v27);

  objc_msgSend(v19, "setHasNotificationServiceData:", v8);
  objc_msgSend(v21, "PKStringForKey:", CFSTR("panIdentifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPANIdentifier:", v28);

  objc_msgSend(v21, "PKStringForKey:", CFSTR("merchantName"));
  v29 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "PKStringForKey:", CFSTR("rawMerchantName"));
  v30 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "PKStringForKey:", CFSTR("industryCategory"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v21;
  objc_msgSend(v21, "PKNumberForKey:", CFSTR("industryCode"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v30;
  v117 = (void *)v29;
  if (v29 | v30)
  {
    v31 = objc_alloc_init(PKMerchant);
    -[PKMerchant setName:](v31, "setName:", v117);
    -[PKMerchant setRawName:](v31, "setRawName:", v30);
    -[PKMerchant setIndustryCategory:](v31, "setIndustryCategory:", v115);
    if (v114)
      -[PKMerchant setIndustryCode:](v31, "setIndustryCode:", objc_msgSend(v114, "integerValue"));
    objc_msgSend(v19, "setMerchant:", v31);

  }
  objc_msgSend(v21, "PKStringForKey:", CFSTR("transactionType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "PKStringForKey:", CFSTR("transactionStatus"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v19, "setTransactionType:", PKPaymentTransactionTypeFromString(v32));
  v111 = v32;
  if (v33)
    objc_msgSend(v19, "setTransactionStatus:", PKPaymentTransactionStatusFromString(v33));
  v110 = v33;
  if (objc_msgSend(v19, "transactionType") == 2)
  {
    objc_msgSend(v21, "PKStringForKey:", CFSTR("transitSubtype"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTransitType:", PKPaymentTransactionTransitSubtypeFromString(v34));

    objc_msgSend(v21, "PKStringForKey:", CFSTR("stationCodeProvider"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStationCodeProvider:", v35);

    objc_msgSend(v21, "PKNumberForKey:", CFSTR("cityCode"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCityCode:", v36);

    objc_msgSend(v21, "PKStringForKey:", CFSTR("startStationCode"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pk_decodeHexadecimal");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStartStationCode:", v38);

    objc_msgSend(v21, "PKStringForKey:", CFSTR("endStationCode"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "pk_decodeHexadecimal");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEndStationCode:", v40);

    objc_msgSend(v21, "PKStringForKey:", CFSTR("startStation"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStartStation:", v41);

    objc_msgSend(v21, "PKStringForKey:", CFSTR("endStation"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEndStation:", v42);

    objc_msgSend(v19, "startStation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v19, "endStation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
        goto LABEL_26;
      objc_msgSend(v19, "endStationCode");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_26;
    }
    objc_msgSend(v19, "endStation");
    v45 = objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      if (v43)
      {

      }
      goto LABEL_29;
    }
    v46 = (void *)v45;
    objc_msgSend(v19, "startStation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47)
    {
      objc_msgSend(v19, "startStationCode");
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {

      }
      if (v108)
        goto LABEL_29;
      goto LABEL_28;
    }

    v44 = v40;
    if (v43)
LABEL_26:

LABEL_28:
    objc_msgSend(v19, "setProcessedForStations:", 1);
LABEL_29:
    objc_msgSend(v19, "setEnRoute:", objc_msgSend(v21, "PKBoolForKey:", CFSTR("isInStation")));
    objc_msgSend(v21, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("transitModifiers"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      if (objc_msgSend(v48, "containsObject:", CFSTR("TransferDiscount")))
        v50 = 2;
      else
        v50 = 0;
      v51 = v50 | objc_msgSend(v49, "containsObject:", CFSTR("CommuteDiscount"));
      if (objc_msgSend(v49, "containsObject:", CFSTR("FareCapped")))
        v51 |= 4uLL;
      if (objc_msgSend(v49, "containsObject:", CFSTR("FareAdjustment")))
        v51 |= 8uLL;
      if (objc_msgSend(v49, "containsObject:", CFSTR("FareRebate")))
        v52 = v51 | 0x10;
      else
        v52 = v51;
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v19, "setTransitModifiers:", v52);

  }
  objc_msgSend(v21, "PKDecimalNumberForKey:", CFSTR("amount"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "PKDecimalNumberForKey:", CFSTR("amountAddedToAuth"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    PKCurrencyDecimalAmountRound(v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAmount:", v54);

  }
  v109 = v53;
  if (v118)
  {
    PKCurrencyDecimalAmountRound(v118);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAmountAddedToAuth:", v55);

  }
  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v21, "PKArrayForKey:", CFSTR("amounts"));
  v122 = v56;
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v141, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v137;
      v126 = *(_QWORD *)v137;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v137 != v59)
            objc_enumerationMutation(obj);
          v61 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v61, "PKDecimalNumberForKey:", CFSTR("amount"));
            v62 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            if (!v62)
            {
              objc_msgSend(v61, "PKDecimalNumberForKey:", CFSTR("value"));
              v62 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v61, "PKStringForKey:", CFSTR("currency"));
            v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (!v63)
            {
              objc_msgSend(v61, "PKStringForKey:", CFSTR("currencyCode"));
              v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (!v63)
                v63 = CFSTR("XXX");
            }
            v64 = objc_msgSend(v61, "PKIntegerForKey:", CFSTR("exponent"));
            objc_msgSend(v61, "PKStringForKey:", CFSTR("identifier"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "PKStringForKey:", CFSTR("label"));
            v66 = objc_claimAutoreleasedReturnValue();
            if (v66)
            {
              v67 = (void *)v66;
              goto LABEL_60;
            }
            objc_msgSend(v61, "PKStringForKey:", CFSTR("localizedTitle"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67 || !v65)
            {
LABEL_60:
              if (v65)
                goto LABEL_61;
            }
            else
            {
              objc_msgSend(v121, "objectForKeyedSubscript:", v65);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v67)
              {
                objc_msgSend(v123, "objectForKeyedSubscript:", v65);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
              }
LABEL_61:
              objc_msgSend(v124, "objectForKeyedSubscript:", v65);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if (v68)
              {
                v69 = v68;
                PKLocalizedPaymentUnitKeyForType(objc_msgSend(v68, "integerValue"));
                v125 = v64;
                v70 = (NSString *)objc_claimAutoreleasedReturnValue();
                -[NSDecimalNumber pk_absoluteValue](v62, "pk_absoluteValue");
                v71 = v58;
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                PKLocalizedPaymentString(v70, CFSTR("%lu"), objc_msgSend(v72, "unsignedLongValue"));
                v73 = (void *)objc_claimAutoreleasedReturnValue();

                v58 = v71;
                v74 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:]([PKCurrencyAmount alloc], "initWithAmount:exponent:preformattedString:", v62, v125, v73);

                v56 = v122;
                if (!v74)
                {
LABEL_72:
                  v75 = 0;
                  goto LABEL_73;
                }
LABEL_66:
                v75 = -[PKTransactionAmount initWithCurrencyAmount:label:]([PKTransactionAmount alloc], "initWithCurrencyAmount:label:", v74, v67);
LABEL_73:
                objc_msgSend(v56, "safelyAddObject:", v75);

                v59 = v126;
                continue;
              }
            }
            if (!v62)
            {
              v74 = 0;
              v69 = 0;
              goto LABEL_72;
            }
            PKCurrencyAmountCreate(v62, &v63->isa, v64);
            v74 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
            v69 = 0;
            if (!v74)
              goto LABEL_72;
            goto LABEL_66;
          }
        }
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v141, 16);
      }
      while (v58);
    }
  }
  v76 = (void *)objc_msgSend(v56, "copy");
  objc_msgSend(v119, "setAmounts:", v76);

  v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v120, "PKArrayForKey:", CFSTR("plans"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (v78)
  {
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v133;
      do
      {
        for (j = 0; j != v81; ++j)
        {
          if (*(_QWORD *)v133 != v82)
            objc_enumerationMutation(v79);
          v84 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v85 = -[PKTransactionCommutePlanUnit initWithDictionary:]([PKTransactionCommutePlanUnit alloc], "initWithDictionary:", v84);
            -[PKTransactionCommutePlanUnit label](v85, "label");
            v86 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v86)
            {
              -[PKTransactionCommutePlanUnit identifier](v85, "identifier");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "objectForKeyedSubscript:", v87);
              v88 = (void *)objc_claimAutoreleasedReturnValue();

              if (v88)
                -[PKTransactionCommutePlanUnit setLabel:](v85, "setLabel:", v88);

            }
            objc_msgSend(v77, "safelyAddObject:", v85);

          }
        }
        v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
      }
      while (v81);
    }
  }
  v89 = (void *)objc_msgSend(v77, "copy");
  objc_msgSend(v119, "setPlans:", v89);

  objc_msgSend(v120, "PKStringForKey:", CFSTR("barcodeIdentifier"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setBarcodeIdentifier:", v90);

  v91 = [PKTransactionAuthenticationContext alloc];
  objc_msgSend(v120, "PKDictionaryForKey:", CFSTR("authenticationDetails"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = -[PKTransactionAuthenticationContext initWithDictionary:](v91, "initWithDictionary:", v92);
  objc_msgSend(v119, "setAuthenticationContext:", v93);

  objc_msgSend(v120, "PKStringForKey:", CFSTR("primaryFundingSourceDescription"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setPrimaryFundingSourceDescription:", v94);

  objc_msgSend(v120, "PKDecimalNumberForKey:", CFSTR("nominalAmount"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95)
  {
    PKCurrencyDecimalAmountRound(v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "setNominalAmount:", v97);

  }
  objc_msgSend(v119, "setHasAdditionalOffers:", objc_msgSend(v120, "PKBoolForKey:", CFSTR("hasAdditionalOffers")));
  v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v120, "PKArrayForKey:", CFSTR("awards"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = MEMORY[0x1E0C809B0];
  if (v99)
  {
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke;
    v130[3] = &unk_1E2AD53C0;
    v101 = v98;
    v131 = v101;
    objc_msgSend(v99, "enumerateObjectsUsingBlock:", v130);
    v102 = (void *)objc_msgSend(v101, "copy");
    objc_msgSend(v119, "setAwards:", v102);

  }
  v103 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v120, "PKArrayForKey:", CFSTR("amountModifiers"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v104)
  {
    v128[0] = v100;
    v128[1] = 3221225472;
    v128[2] = __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke_2;
    v128[3] = &unk_1E2AD53C0;
    v105 = v103;
    v129 = v105;
    objc_msgSend(v104, "enumerateObjectsUsingBlock:", v128);
    v106 = (void *)objc_msgSend(v105, "copy");
    objc_msgSend(v119, "setAmountModifiers:", v106);

  }
  return (PKPaymentTransaction *)v119;
}

void __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentTransactionAward *v4;

  v3 = a2;
  v4 = -[PKPaymentTransactionAward initWithDictionary:]([PKPaymentTransactionAward alloc], "initWithDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v4);
}

void __149__PKPaymentTransaction_paymentTransactionWithSource_dictionary_unitDictionary_balanceLabelDictionary_planLabelDictionary_hasNotificationServiceData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentTransactionAmountModifier *v4;

  v3 = a2;
  v4 = -[PKPaymentTransactionAmountModifier initWithDictionary:]([PKPaymentTransactionAmountModifier alloc], "initWithDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v4);
}

- (PKPaymentTransaction)init
{
  PKPaymentTransaction *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentTransaction;
  v2 = -[PKPaymentTransaction init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDate *transactionDate;
  void *v10;
  NSDate *transactionStatusChangedDate;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  unint64_t accountType;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t secondaryFundingSourceType;
  const __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  NSDate *locationDate;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  void *v81;
  unint64_t rewardsEligibilityReason;
  const __CFString *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  const __CFString *v95;
  unint64_t topUpType;
  __CFString *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  const __CFString *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  void *v109;
  void *v110;
  PKPayLaterFinancingPlan *associatedFinancingPlan;
  void *v112;
  void *v113;
  NSURL *issuerInstallmentManagementURL;
  void *v115;
  PKPaymentRewardsRedemption *paymentRewardsRedemption;
  void *v117;
  void *v118;
  NSArray *associatedStatementIdentifiers;
  void *v120;
  int64_t paymentNetworkIdentifier;
  void *v122;
  void *v123;
  void *v124;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_paymentHash, CFSTR("paymentHash"));
  -[NSDecimalNumber stringValue](self->_amount, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("amount"));

  -[NSDecimalNumber stringValue](self->_subtotalAmount, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subtotalAmount"));

  -[NSDecimalNumber stringValue](self->_amountAddedToAuth, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("amountAddedToAuth"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_currencyCode, CFSTR("currencyCode"));
  -[NSArray pk_arrayByApplyingBlock:](self->_amounts, "pk_arrayByApplyingBlock:", &__block_literal_global_204);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("amounts"));

  -[NSArray pk_arrayByApplyingBlock:](self->_plans, "pk_arrayByApplyingBlock:", &__block_literal_global_652);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("plans"));

  transactionDate = self->_transactionDate;
  if (transactionDate)
  {
    PKW3CDateStringFromDate(transactionDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("transactionDate"));

  }
  transactionStatusChangedDate = self->_transactionStatusChangedDate;
  if (transactionStatusChangedDate)
  {
    PKW3CDateStringFromDate(transactionStatusChangedDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("transactionStatusChangedDate"));

  }
  PKW3CDateStringFromDate(self->_expirationDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("expirationDate"));

  -[PKMerchant jsonDictionaryRepresentation](self->_merchant, "jsonDictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("merchant"));

  if (self->_transitType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("transitType"));

  }
  if (self->_transitModifiers)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("transitModifiers"));

  }
  if (self->_enRoute)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("enRoute"));

  }
  if (self->_shouldSuppressDate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("shouldSuppressDate"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_stationCodeProvider, CFSTR("stationCodeProvider"));
  -[NSData hexEncoding](self->_startStationCode, "hexEncoding");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("startStationCode"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_startStation, CFSTR("startStation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startStationLatitude);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("startStationLatitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startStationLongitude);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("startStationLongitude"));

  -[NSData hexEncoding](self->_endStationCode, "hexEncoding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("endStationCode"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_endStation, CFSTR("endStation"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endStationLatitude);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("endStationLatitude"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endStationLongitude);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("endStationLongitude"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cityCode, CFSTR("cityCode"));
  switch(self->_adjustmentType)
  {
    case 0:
      v25 = v3;
      v26 = 0;
      goto LABEL_37;
    case 1:
      v26 = CFSTR("provisionalDispute");
      goto LABEL_36;
    case 2:
      v26 = CFSTR("provisionalDisputeReversal");
      goto LABEL_36;
    case 3:
      v26 = CFSTR("disputeFinal");
      goto LABEL_36;
    case 4:
      v26 = CFSTR("chargebackCredit");
      goto LABEL_36;
    case 5:
      v26 = CFSTR("merchantAdjustment");
      goto LABEL_36;
    case 6:
      v26 = CFSTR("balanceWriteoff");
      goto LABEL_36;
    case 7:
      v26 = CFSTR("courtesy");
      goto LABEL_36;
    case 8:
      v26 = CFSTR("forfeiture");
      goto LABEL_36;
    case 9:
      v26 = CFSTR("withdrawalReversal");
      goto LABEL_36;
    case 0xALL:
      v26 = CFSTR("checkIssued");
      goto LABEL_36;
    case 0xBLL:
      v26 = CFSTR("feeReversal");
      goto LABEL_36;
    case 0xCLL:
      v26 = CFSTR("interestReversal");
      goto LABEL_36;
    case 0xDLL:
      v26 = CFSTR("credit");
      goto LABEL_36;
    case 0xELL:
      v26 = CFSTR("creditReversal");
      goto LABEL_36;
    case 0xFLL:
      v26 = CFSTR("refund");
      goto LABEL_36;
    case 0x10:
      v26 = CFSTR("refundReversal");
      goto LABEL_36;
    case 0x11:
      v26 = CFSTR("other");
      goto LABEL_36;
    case 0x12:
      v26 = CFSTR("debitReversal");
      goto LABEL_36;
    case 0x13:
      v26 = CFSTR("redemptionReversal");
      goto LABEL_36;
    case 0x14:
      v26 = CFSTR("debit");
      goto LABEL_36;
    default:
      v26 = CFSTR("unknown");
LABEL_36:
      v25 = v3;
LABEL_37:
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("adjustmentType"));
      accountType = self->_accountType;
      v28 = CFSTR("unknown");
      if (accountType <= 4)
        v28 = off_1E2ADADF0[accountType];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("accountType"));
      v29 = CFSTR("send");
      switch(self->_peerPaymentType)
      {
        case 0:
          v30 = v3;
          v29 = 0;
          goto LABEL_48;
        case 1:
          goto LABEL_47;
        case 2:
          v29 = CFSTR("receive");
          goto LABEL_47;
        case 3:
          v29 = CFSTR("request");
          goto LABEL_47;
        case 4:
          v29 = CFSTR("upcomingPayment");
          goto LABEL_47;
        case 5:
          v29 = CFSTR("recurringPayment");
          goto LABEL_47;
        case 6:
          v29 = CFSTR("thresholdTopUp");
          goto LABEL_47;
        default:
          v29 = CFSTR("unknown");
LABEL_47:
          v30 = v3;
LABEL_48:
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("peerPaymentType"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_peerPaymentCounterpartHandle, CFSTR("peerPaymentCounterpartHandle"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_peerPaymentMemo, CFSTR("peerPaymentMemo"));
          PKW3CDateStringFromDate(self->_peerPaymentMessageReceivedDate);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("peerPaymentMessageReceivedDate"));

          -[PKPaymentTransactionForeignExchangeInformation jsonDictionaryRepresentation](self->_foreignExchangeInformation, "jsonDictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("foreignExchangeInformation"));

          -[PKPaymentTransactionFees jsonArrayRepresentation](self->_fees, "jsonArrayRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("fees"));

          -[NSDecimalNumber stringValue](self->_primaryFundingSourceAmount, "stringValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("primaryFundingSourceAmount"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_primaryFundingSourceCurrencyCode, CFSTR("primaryFundingSourceCurrencyCode"));
          -[NSDecimalNumber stringValue](self->_secondaryFundingSourceAmount, "stringValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("secondaryFundingSourceAmount"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_secondaryFundingSourceCurrencyCode, CFSTR("secondaryFundingSourceCurrencyCode"));
          PKPaymentNetworkNameForPaymentCredentialType(self->_secondaryFundingSourceNetwork);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("secondaryFundingSourceNetwork"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_secondaryFundingSourceDPANSuffix, CFSTR("secondaryFundingSourceDPANSuffix"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_secondaryFundingSourceFPANIdentifier, CFSTR("secondaryFundingSourceFPANIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_secondaryFundingSourceDescription, CFSTR("secondaryFundingSourceDescription"));
          secondaryFundingSourceType = self->_secondaryFundingSourceType;
          v38 = CFSTR("bankAccount");
          if (secondaryFundingSourceType == 2)
            v38 = CFSTR("debit");
          if (secondaryFundingSourceType)
            v39 = (__CFString *)v38;
          else
            v39 = CFSTR("unknown");
          v40 = v39;
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("secondaryFundingSourceType"));

          -[NSUUID UUIDString](self->_requestDeviceScoreIdentifier, "UUIDString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("requestDeviceScoreIdentifier"));

          -[NSUUID UUIDString](self->_sendDeviceScoreIdentifier, "UUIDString");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("sendDeviceScoreIdentifier"));

          if (self->_deviceScoreIdentifiersRequired)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("deviceScoreIdentifiersRequired"));

          }
          if (self->_deviceScoreIdentifiersSubmitted)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("deviceScoreIdentifiersSubmitted"));

          }
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_merchantProvidedDescription, CFSTR("merchantProvidedDescription"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_merchantProvidedTitle, CFSTR("merchantProvidedTitle"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_metadata, CFSTR("metadata"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_processedForLocation);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("processedForLocation"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_processedForMerchantCleanup);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("processedForMerchantCleanup"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresMerchantReprocessing);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("requiresMerchantReprocessing"));

          PKW3CDateStringFromDate(self->_lastMerchantReprocessingDate);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("lastMerchantReprocessingDate"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_processedForStations);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("processedForStations"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAssociatedPaymentApplication);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("hasAssociatedPaymentApplication"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasNotificationServiceData);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("hasNotificationServiceData"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPaymentTransaction hasBackingData](self, "hasBackingData"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("hasBackingData"));

          PKPaymentTransactionStatusToString(self->_transactionStatus);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("transactionStatus"));

          PKPaymentTransactionDeclinedReasonToString(self->_transactionDeclinedReason);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("transactionDeclinedReason"));

          PKPaymentTransactionTypeToString(self->_transactionType);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("transactionType"));

          if (self->_technologyType)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("technologyType"));

          }
          if (self->_transactionSource)
          {
            -[PKPaymentTransaction _transactionSourceString](self, "_transactionSourceString");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("transactionSource"));

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_updateReasons);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("updateReasons"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedTypeDescription, CFSTR("localizedTypeDescription"));
          -[NSURL absoluteString](self->_bankConnectDigitalServicingURL, "absoluteString");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("bankConnectDigitalServicingURL"));

          -[NSURL absoluteString](self->_bankConnectPayNowURL, "absoluteString");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("bankConnectPayNowURL"));

          -[NSURL absoluteString](self->_bankConnectTransferFundsURL, "absoluteString");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("bankConnectTransferFundsURL"));

          -[NSURL absoluteString](self->_bankConnectPostInstallmentURL, "absoluteString");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("bankConnectPostInstallmentURL"));

          -[NSURL absoluteString](self->_bankConnectRedeemRewardsURL, "absoluteString");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("bankConnectRedeemRewardsURL"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBankConnectTransaction);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("isBankConnectTransaction"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_bankConnectTransactionWasClassifiedByMaps);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("bankConnectTransactionWasClassifiedByMaps"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_bankConnectCreditDebitIndicator);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("bankConnectCreditDebitIndicator"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_bankConnectRoundTransactionDate);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("bankConnectRoundTransactionDate"));

          if (self->_locationLatitude != 0.0
            || self->_locationLongitude != 0.0
            || self->_locationDate
            || self->_administrativeArea
            || self->_locality
            || self->_locationHorizontalAccuracy != 0.0
            || self->_locationVerticalAccuracy != 0.0
            || self->_timeZone)
          {
            v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            locationDate = self->_locationDate;
            if (locationDate)
            {
              PKW3CDateStringFromDate(locationDate);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v70, CFSTR("locationDate"));

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationLatitude);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v71, CFSTR("locationLatitude"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationLongitude);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v72, CFSTR("locationLongitude"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationAltitude);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v73, CFSTR("locationAltitude"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationHorizontalAccuracy);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v74, CFSTR("locationHorizontalAccuracy"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationVerticalAccuracy);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v75, CFSTR("locationVerticalAccuracy"));

            objc_msgSend(v68, "setObject:forKeyedSubscript:", self->_administrativeArea, CFSTR("administrativeArea"));
            objc_msgSend(v68, "setObject:forKeyedSubscript:", self->_locality, CFSTR("locality"));
            -[NSTimeZone name](self->_timeZone, "name");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v76, CFSTR("timeZone"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_coarseLocation);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v77, CFSTR("isCoarseLocation"));

            v78 = (void *)objc_msgSend(v68, "copy");
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("location"));

          }
          if (self->_requiresLocation)
            v79 = CFSTR("YES");
          else
            v79 = CFSTR("NO");
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("requiresLocation"));
          -[PKPaymentTransactionRewards jsonArrayRepresentation](self->_rewards, "jsonArrayRepresentation");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v80, CFSTR("rewards"));

          -[NSDecimalNumber stringValue](self->_rewardsTotalAmount, "stringValue");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("rewardsTotalAmount"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_rewardsTotalCurrencyCode, CFSTR("rewardsTotalCurrencyCode"));
          rewardsEligibilityReason = self->_rewardsEligibilityReason;
          if (rewardsEligibilityReason > 2)
            v83 = CFSTR("unknown");
          else
            v83 = off_1E2ADACD0[rewardsEligibilityReason];
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("rewardsEligibilityReason"));
          PKAccountRewardRedemptionTypeToString(self->_redemptionType);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("redemptionType"));

          -[PKPaymentTransactionRewards jsonArrayRepresentation](self->_rewardsInProgress, "jsonArrayRepresentation");
          v85 = objc_claimAutoreleasedReturnValue();
          v86 = (void *)v85;
          if (v85)
            v87 = v85;
          else
            v87 = MEMORY[0x1E0C9AA60];
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v87, CFSTR("rewardsInProgress"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cardType);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v88, CFSTR("cardType"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountIdentifier, CFSTR("accountIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_altDSID, CFSTR("altDSID"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_originatedByDevice);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v89, CFSTR("originatedByDevice"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fuzzyMatched);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v90, CFSTR("isFuzzyMatched"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_receiptProviderIdentifier, CFSTR("receiptProviderIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_receiptIdentifier, CFSTR("receiptIdentifier"));
          -[NSURL absoluteString](self->_receiptProviderURL, "absoluteString");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v91, CFSTR("receiptProviderURL"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_issueReportIdentifier, CFSTR("issueReportIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_lifecycleIdentifier, CFSTR("lifecycleIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_authNetworkData, CFSTR("authNetworkData"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_clearingNetworkData, CFSTR("clearingNetworkData"));
          -[NSSet pk_setByApplyingBlock:](self->_questions, "pk_setByApplyingBlock:", &__block_literal_global_673);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "allObjects");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v93, CFSTR("questions"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardIdentifier, CFSTR("cardIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_panIdentifier, CFSTR("panIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_isMerchantTokenTransaction, CFSTR("isMerchantTokenTransaction"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardNumberSuffix, CFSTR("cardNumberSuffix"));
          v94 = self->_adjustmentTypeReason - 1;
          if (v94 > 9)
            v95 = CFSTR("unknown");
          else
            v95 = off_1E2ADAD58[v94];
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v95, CFSTR("adjustmentTypeReason"));
          topUpType = self->_topUpType;
          if (topUpType > 8)
            v97 = 0;
          else
            v97 = off_1E2ADADA8[topUpType];
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v97, CFSTR("topUpType"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_referenceIdentifier, CFSTR("referenceIdentifier"));
          PKFeatureIdentifierToString(self->_associatedFeatureIdentifier);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v98, CFSTR("associatedFeatureIdentifier"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_suppressBehavior);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v99, CFSTR("suppressBehavior"));

          if (self->_suppressNotifications)
            v100 = CFSTR("YES");
          else
            v100 = CFSTR("NO");
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v100, CFSTR("suppressNotifications"));
          if (self->_recurring)
            v101 = CFSTR("YES");
          else
            v101 = CFSTR("NO");
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v101, CFSTR("recurring"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_barcodeIdentifier, CFSTR("barcodeIdentifier"));
          -[PKTransactionAuthenticationContext dictionaryRepresentation](self->_authenticationContext, "dictionaryRepresentation");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v102, CFSTR("authenticationContext"));

          objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_primaryFundingSourceDescription, CFSTR("primaryFundingSourceDescription"));
          -[NSDecimalNumber stringValue](self->_nominalAmount, "stringValue");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v103, CFSTR("nominalAmount"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAdditionalOffers);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v104, CFSTR("hasAdditionalOffers"));

          -[NSArray pk_arrayByApplyingBlock:](self->_awards, "pk_arrayByApplyingBlock:", &__block_literal_global_687_0);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v105, CFSTR("awards"));

          -[NSArray pk_arrayByApplyingBlock:](self->_amountModifiers, "pk_arrayByApplyingBlock:", &__block_literal_global_689);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v106, CFSTR("amountModifiers"));

          switch(self->_topUpType)
          {
            case 0:
              goto LABEL_104;
            case 1:
              v107 = CFSTR("directDeposit");
              goto LABEL_103;
            case 2:
              v107 = CFSTR("atm");
              goto LABEL_103;
            case 3:
              v107 = CFSTR("transfer");
              goto LABEL_103;
            case 4:
              v107 = CFSTR("check");
              goto LABEL_103;
            case 5:
              v107 = CFSTR("inWallet");
              goto LABEL_103;
            case 6:
              v107 = CFSTR("inStore");
              goto LABEL_103;
            case 7:
              v107 = CFSTR("amp");
              goto LABEL_103;
            case 8:
              v107 = CFSTR("redemption");
              goto LABEL_103;
            default:
              v107 = 0;
LABEL_103:
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v107, CFSTR("topUpType"));
LABEL_104:
              -[PKTransactionReleasedData dictionaryRepresentation](self->_releasedData, "dictionaryRepresentation");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v108, CFSTR("releasedData"));

              -[NSArray pk_arrayByApplyingBlock:](self->_transfers, "pk_arrayByApplyingBlock:", &__block_literal_global_691);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v109, CFSTR("transfers"));

              -[PKPeerPaymentRecurringPayment description](self->_recurringPeerPayment, "description");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v110, CFSTR("recurringPeerPayment"));

              associatedFinancingPlan = self->_associatedFinancingPlan;
              if (associatedFinancingPlan)
              {
                -[PKPayLaterFinancingPlan dictionaryRepresentation](associatedFinancingPlan, "dictionaryRepresentation");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v112, CFSTR("associatedFinancingPlan"));

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isIssuerInstallmentTransaction);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v113, CFSTR("isIssuerInstallmentTransaction"));

              issuerInstallmentManagementURL = self->_issuerInstallmentManagementURL;
              if (issuerInstallmentManagementURL)
              {
                -[NSURL absoluteString](issuerInstallmentManagementURL, "absoluteString");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v115, CFSTR("issuerInstallmentManagementURL"));

              }
              paymentRewardsRedemption = self->_paymentRewardsRedemption;
              if (paymentRewardsRedemption)
              {
                -[PKPaymentRewardsRedemption dictionaryRepresentation](paymentRewardsRedemption, "dictionaryRepresentation");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v117, CFSTR("paymentRewardsRedemption"));

              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_interestReassessment);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v118, CFSTR("interestReassessment"));

              associatedStatementIdentifiers = self->_associatedStatementIdentifiers;
              if (associatedStatementIdentifiers)
              {
                -[NSArray componentsJoinedByString:](associatedStatementIdentifiers, "componentsJoinedByString:", CFSTR(","));
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v120, CFSTR("associatedStatementIdentifiers"));

              }
              paymentNetworkIdentifier = self->_paymentNetworkIdentifier;
              if (paymentNetworkIdentifier)
              {
                PKPaymentNetworkNameForPaymentCredentialType(paymentNetworkIdentifier);
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v122, CFSTR("paymentNetworkIdentifier"));

              }
              else
              {
                objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("paymentNetworkIdentifier"));
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_peerPaymentPaymentMode);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v123, CFSTR("peerPaymentPaymentMode"));

              objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_peerPaymentCounterpartImageRecordIdentifier, CFSTR("peerPaymentCounterpartImageRecordIdentifier"));
              v124 = (void *)objc_msgSend(v3, "copy");

              return v124;
          }
      }
  }
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __48__PKPaymentTransaction_dictionaryRepresentation__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;
  unint64_t v32;
  int64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  unint64_t v47;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_serviceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentHash);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_subtotalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_amountAddedToAuth);
  objc_msgSend(v3, "safelyAddObject:", self->_amounts);
  objc_msgSend(v3, "safelyAddObject:", self->_plans);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionDate);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionStatusChangedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_locationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_merchant);
  objc_msgSend(v3, "safelyAddObject:", self->_locality);
  objc_msgSend(v3, "safelyAddObject:", self->_administrativeArea);
  objc_msgSend(v3, "safelyAddObject:", self->_timeZone);
  objc_msgSend(v3, "safelyAddObject:", self->_startStationCode);
  objc_msgSend(v3, "safelyAddObject:", self->_endStationCode);
  objc_msgSend(v3, "safelyAddObject:", self->_startStation);
  objc_msgSend(v3, "safelyAddObject:", self->_endStation);
  objc_msgSend(v3, "safelyAddObject:", self->_cityCode);
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentCounterpartHandle);
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentMemo);
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentMessageReceivedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_fees);
  objc_msgSend(v3, "safelyAddObject:", self->_foreignExchangeInformation);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryFundingSourceAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryFundingSourceCurrencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryFundingSourceAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryFundingSourceCurrencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryFundingSourceDPANSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryFundingSourceFPANIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_secondaryFundingSourceDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_requestDeviceScoreIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_sendDeviceScoreIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantProvidedDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantProvidedTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_metadata);
  objc_msgSend(v3, "safelyAddObject:", self->_lastMerchantReprocessingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_issueReportIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_rewards);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsTotalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsTotalCurrencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsInProgress);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTypeDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectDigitalServicingURL);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectPayNowURL);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectTransferFundsURL);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectPostInstallmentURL);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectRedeemRewardsURL);
  objc_msgSend(v3, "safelyAddObject:", self->_bankConnectMetadata);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_lifecycleIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionSourceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_authNetworkData);
  objc_msgSend(v3, "safelyAddObject:", self->_clearingNetworkData);
  objc_msgSend(v3, "safelyAddObject:", self->_questions);
  objc_msgSend(v3, "safelyAddObject:", self->_cardIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_dpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_panIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_isMerchantTokenTransaction);
  objc_msgSend(v3, "safelyAddObject:", self->_cardNumberSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_referenceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_receiptProviderURL);
  objc_msgSend(v3, "safelyAddObject:", self->_receiptProviderIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_receiptIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_barcodeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_authenticationContext);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryFundingSourceDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_nominalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_awards);
  objc_msgSend(v3, "safelyAddObject:", self->_amountModifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_releasedData);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedFinancingPlan);
  objc_msgSend(v3, "safelyAddObject:", self->_issuerInstallmentManagementURL);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentRewardsRedemption);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedStatementIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_peerPaymentCounterpartImageRecordIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_transactionType - v4 + 32 * v4;
  v6 = self->_transactionSource - v5 + 32 * v5;
  v7 = self->_transactionStatus - v6 + 32 * v6;
  v8 = self->_transactionDeclinedReason - v7 + 32 * v7;
  v9 = self->_technologyType - v8 + 32 * v8;
  v10 = self->_hasAssociatedPaymentApplication - v9 + 32 * v9;
  v11 = self->_processedForLocation - v10 + 32 * v10;
  v12 = self->_processedForStations - v11 + 32 * v11;
  v13 = self->_processedForMerchantCleanup - v12 + 32 * v12;
  v14 = self->_requiresMerchantReprocessing - v13 + 32 * v13;
  v15 = (unint64_t)self->_locationLatitude - v14 + 32 * v14;
  v16 = (unint64_t)self->_locationLongitude - v15 + 32 * v15;
  v17 = (unint64_t)self->_locationAltitude - v16 + 32 * v16;
  v18 = (unint64_t)self->_locationHorizontalAccuracy - v17 + 32 * v17;
  v19 = (unint64_t)self->_locationVerticalAccuracy - v18 + 32 * v18;
  v20 = self->_coarseLocation - v19 + 32 * v19;
  v21 = self->_transitType - v20 + 32 * v20;
  v22 = self->_transitModifiers - v21 + 32 * v21;
  v23 = self->_enRoute - v22 + 32 * v22;
  v24 = self->_peerPaymentType - v23 + 32 * v23;
  v25 = self->_secondaryFundingSourceNetwork - v24 + 32 * v24;
  v26 = self->_deviceScoreIdentifiersRequired - v25 + 32 * v25;
  v27 = self->_deviceScoreIdentifiersSubmitted - v26 + 32 * v26;
  v28 = self->_originatedByDevice - v27 + 32 * v27;
  v29 = self->_fuzzyMatched - v28 + 32 * v28;
  v30 = self->_secondaryFundingSourceType - v29 + 32 * v29;
  v31 = self->_cardType - v30 + 32 * v30;
  v32 = self->_rewardsEligibilityReason - v31 + 32 * v31;
  v33 = self->_adjustmentTypeReason - v32 + 32 * v32;
  v34 = self->_topUpType - v33 + 32 * v33;
  v35 = self->_suppressBehavior - v34 + 32 * v34;
  v36 = self->_accountType - v35 + 32 * v35;
  v37 = self->_associatedFeatureIdentifier - v36 + 32 * v36;
  v38 = self->_hasAdditionalOffers - v37 + 32 * v37;
  v39 = self->_recurring - v38 + 32 * v38;
  v40 = self->_isBankConnectTransaction - v39 + 32 * v39;
  v41 = self->_bankConnectTransactionWasClassifiedByMaps - v40 + 32 * v40;
  v42 = self->_bankConnectCreditDebitIndicator - v41 + 32 * v41;
  v43 = self->_bankConnectRoundTransactionDate - v42 + 32 * v42;
  v44 = self->_interestReassessment - v43 + 32 * v43;
  v45 = self->_paymentNetworkIdentifier - v44 + 32 * v44;
  v46 = self->_isIssuerInstallmentTransaction - v45 + 32 * v45;
  v47 = self->_peerPaymentPaymentMode - v46 + 32 * v46;

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransaction *v4;
  PKPaymentTransaction *v5;
  BOOL v6;

  v4 = (PKPaymentTransaction *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransaction isEqualToPaymentTransaction:](self, "isEqualToPaymentTransaction:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentTransaction:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  char v8;
  NSString *serviceIdentifier;
  NSString *v10;
  NSString *paymentHash;
  NSString *v12;
  NSDecimalNumber *amount;
  NSDecimalNumber *v14;
  NSDecimalNumber *subtotalAmount;
  NSDecimalNumber *v16;
  NSDecimalNumber *amountAddedToAuth;
  NSDecimalNumber *v18;
  NSArray *amounts;
  NSArray *v20;
  NSArray *plans;
  NSArray *v22;
  NSString *currencyCode;
  NSString *v24;
  NSDate *transactionDate;
  NSDate *v26;
  NSDate *transactionStatusChangedDate;
  NSDate *v28;
  NSDate *expirationDate;
  NSDate *v30;
  PKMerchant *merchant;
  PKMerchant *v32;
  NSData *startStationCode;
  NSData *v34;
  NSData *endStationCode;
  NSData *v36;
  NSString *startStation;
  NSString *v38;
  NSString *endStation;
  NSString *v40;
  NSNumber *cityCode;
  NSNumber *v42;
  NSString *peerPaymentCounterpartHandle;
  NSString *v44;
  NSDate *peerPaymentMessageReceivedDate;
  NSDate *v46;
  PKPaymentTransactionForeignExchangeInformation *foreignExchangeInformation;
  PKPaymentTransactionForeignExchangeInformation *v48;
  PKPaymentTransactionFees *fees;
  PKPaymentTransactionFees *v50;
  NSDecimalNumber *primaryFundingSourceAmount;
  NSDecimalNumber *v52;
  NSString *primaryFundingSourceCurrencyCode;
  NSString *v54;
  NSDecimalNumber *secondaryFundingSourceAmount;
  NSDecimalNumber *v56;
  NSString *secondaryFundingSourceCurrencyCode;
  NSString *v58;
  NSString *secondaryFundingSourceDPANSuffix;
  NSString *v60;
  NSString *merchantProvidedDescription;
  NSString *v62;
  NSString *merchantProvidedTitle;
  NSString *v64;
  void *v65;
  NSString *v66;
  NSString *v67;
  NSString *v68;
  _BOOL4 v69;
  void *v70;
  NSString *v71;
  _BOOL4 v72;
  NSURL *receiptProviderURL;
  NSURL *v74;
  NSString *localizedTypeDescription;
  NSString *v76;
  NSURL *bankConnectDigitalServicingURL;
  NSURL *v78;
  NSURL *bankConnectPayNowURL;
  NSURL *v80;
  NSURL *bankConnectTransferFundsURL;
  NSURL *v82;
  NSURL *bankConnectPostInstallmentURL;
  NSURL *v84;
  NSURL *bankConnectRedeemRewardsURL;
  NSURL *v86;
  PKPaymentTransactionBankConnectMetadata *bankConnectMetadata;
  PKPaymentTransactionBankConnectMetadata *v88;
  NSString *issueReportIdentifier;
  NSString *v90;
  PKPaymentTransactionRewards *rewards;
  PKPaymentTransactionRewards *v92;
  NSDecimalNumber *rewardsTotalAmount;
  NSDecimalNumber *v94;
  NSString *rewardsTotalCurrencyCode;
  NSString *v96;
  PKPaymentTransactionRewards *rewardsInProgress;
  PKPaymentTransactionRewards *v98;
  NSString *accountIdentifier;
  NSString *v100;
  NSString *altDSID;
  NSString *v102;
  NSString *lifecycleIdentifier;
  NSString *v104;
  NSString *authNetworkData;
  NSString *v106;
  NSString *transactionSourceIdentifier;
  NSString *v108;
  NSString *clearingNetworkData;
  NSString *v110;
  NSSet *questions;
  NSSet *v112;
  NSString *cardIdentifier;
  NSString *v114;
  NSString *dpanIdentifier;
  NSString *v116;
  NSString *panIdentifier;
  NSString *v118;
  NSNumber *isMerchantTokenTransaction;
  NSNumber *v120;
  NSString *cardNumberSuffix;
  NSString *v122;
  NSString *referenceIdentifier;
  NSString *v124;
  NSString *secondaryFundingSourceDescription;
  NSString *v126;
  void *v127;
  NSString *v128;
  _BOOL4 v129;
  PKTransactionAuthenticationContext *authenticationContext;
  PKTransactionAuthenticationContext *v131;
  void *v132;
  NSString *v133;
  _BOOL4 v134;
  BOOL v135;
  NSDecimalNumber *nominalAmount;
  NSDecimalNumber *v138;
  NSArray *awards;
  NSArray *v140;
  NSArray *amountModifiers;
  NSArray *v142;
  PKTransactionReleasedData *releasedData;
  PKTransactionReleasedData *v144;
  PKPayLaterFinancingPlan *associatedFinancingPlan;
  PKPayLaterFinancingPlan *v146;
  NSURL *issuerInstallmentManagementURL;
  NSURL *v148;
  PKPaymentRewardsRedemption *paymentRewardsRedemption;
  PKPaymentRewardsRedemption *v150;
  NSArray *associatedStatementIdentifiers;
  NSArray *v152;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[4];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_339;
  }
  else
  {
    v8 = -[NSString isEqual:](identifier, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_339;
  }
  serviceIdentifier = self->_serviceIdentifier;
  v10 = (NSString *)v4[5];
  if (serviceIdentifier && v10)
  {
    if ((-[NSString isEqual:](serviceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (serviceIdentifier != v10)
  {
    goto LABEL_339;
  }
  paymentHash = self->_paymentHash;
  v12 = (NSString *)v4[6];
  if (paymentHash && v12)
  {
    if ((-[NSString isEqual:](paymentHash, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (paymentHash != v12)
  {
    goto LABEL_339;
  }
  amount = self->_amount;
  v14 = (NSDecimalNumber *)v4[7];
  if (amount && v14)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (amount != v14)
  {
    goto LABEL_339;
  }
  subtotalAmount = self->_subtotalAmount;
  v16 = (NSDecimalNumber *)v4[8];
  if (subtotalAmount && v16)
  {
    if ((-[NSDecimalNumber isEqual:](subtotalAmount, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (subtotalAmount != v16)
  {
    goto LABEL_339;
  }
  amountAddedToAuth = self->_amountAddedToAuth;
  v18 = (NSDecimalNumber *)v4[10];
  if (amountAddedToAuth && v18)
  {
    if ((-[NSDecimalNumber isEqual:](amountAddedToAuth, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (amountAddedToAuth != v18)
  {
    goto LABEL_339;
  }
  amounts = self->_amounts;
  v20 = (NSArray *)v4[11];
  if (amounts && v20)
  {
    if ((-[NSArray isEqual:](amounts, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (amounts != v20)
  {
    goto LABEL_339;
  }
  plans = self->_plans;
  v22 = (NSArray *)v4[12];
  if (plans && v22)
  {
    if ((-[NSArray isEqual:](plans, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (plans != v22)
  {
    goto LABEL_339;
  }
  currencyCode = self->_currencyCode;
  v24 = (NSString *)v4[9];
  if (currencyCode && v24)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (currencyCode != v24)
  {
    goto LABEL_339;
  }
  transactionDate = self->_transactionDate;
  v26 = (NSDate *)v4[13];
  if (transactionDate && v26)
  {
    if ((-[NSDate isEqual:](transactionDate, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (transactionDate != v26)
  {
    goto LABEL_339;
  }
  transactionStatusChangedDate = self->_transactionStatusChangedDate;
  v28 = (NSDate *)v4[14];
  if (transactionStatusChangedDate && v28)
  {
    if ((-[NSDate isEqual:](transactionStatusChangedDate, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (transactionStatusChangedDate != v28)
  {
    goto LABEL_339;
  }
  expirationDate = self->_expirationDate;
  v30 = (NSDate *)v4[15];
  if (expirationDate && v30)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (expirationDate != v30)
  {
    goto LABEL_339;
  }
  merchant = self->_merchant;
  v32 = (PKMerchant *)v4[16];
  if (merchant && v32)
  {
    if (!-[PKMerchant isEqual:](merchant, "isEqual:"))
      goto LABEL_339;
  }
  else if (merchant != v32)
  {
    goto LABEL_339;
  }
  if (self->_transactionStatus != v4[113]
    || self->_transactionDeclinedReason != v4[117]
    || self->_transactionType != v4[114]
    || self->_hasNotificationServiceData != *((unsigned __int8 *)v4 + 22)
    || self->_processedForStations != *((unsigned __int8 *)v4 + 20)
    || self->_transitType != v4[26]
    || self->_transitModifiers != v4[27]
    || self->_enRoute == (*((_BYTE *)v4 + 9) == 0)
    || self->_shouldSuppressDate == (*((_BYTE *)v4 + 10) == 0))
  {
    goto LABEL_339;
  }
  startStationCode = self->_startStationCode;
  v34 = (NSData *)v4[30];
  if (startStationCode && v34)
  {
    if ((-[NSData isEqual:](startStationCode, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (startStationCode != v34)
  {
    goto LABEL_339;
  }
  endStationCode = self->_endStationCode;
  v36 = (NSData *)v4[34];
  if (endStationCode && v36)
  {
    if ((-[NSData isEqual:](endStationCode, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (endStationCode != v36)
  {
    goto LABEL_339;
  }
  startStation = self->_startStation;
  v38 = (NSString *)v4[31];
  if (startStation && v38)
  {
    if ((-[NSString isEqual:](startStation, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (startStation != v38)
  {
    goto LABEL_339;
  }
  endStation = self->_endStation;
  v40 = (NSString *)v4[35];
  if (endStation && v40)
  {
    if ((-[NSString isEqual:](endStation, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (endStation != v40)
  {
    goto LABEL_339;
  }
  cityCode = self->_cityCode;
  v42 = (NSNumber *)v4[29];
  if (cityCode && v42)
  {
    if ((-[NSNumber isEqual:](cityCode, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (cityCode != v42)
  {
    goto LABEL_339;
  }
  if (self->_peerPaymentType != v4[41])
    goto LABEL_339;
  peerPaymentCounterpartHandle = self->_peerPaymentCounterpartHandle;
  v44 = (NSString *)v4[43];
  if (peerPaymentCounterpartHandle && v44)
  {
    if ((-[NSString isEqual:](peerPaymentCounterpartHandle, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (peerPaymentCounterpartHandle != v44)
  {
    goto LABEL_339;
  }
  peerPaymentMessageReceivedDate = self->_peerPaymentMessageReceivedDate;
  v46 = (NSDate *)v4[45];
  if (peerPaymentMessageReceivedDate && v46)
  {
    if ((-[NSDate isEqual:](peerPaymentMessageReceivedDate, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (peerPaymentMessageReceivedDate != v46)
  {
    goto LABEL_339;
  }
  foreignExchangeInformation = self->_foreignExchangeInformation;
  v48 = (PKPaymentTransactionForeignExchangeInformation *)v4[46];
  if (foreignExchangeInformation && v48)
  {
    if (!-[PKPaymentTransactionForeignExchangeInformation isEqual:](foreignExchangeInformation, "isEqual:"))
      goto LABEL_339;
  }
  else if (foreignExchangeInformation != v48)
  {
    goto LABEL_339;
  }
  fees = self->_fees;
  v50 = (PKPaymentTransactionFees *)v4[47];
  if (fees && v50)
  {
    if (!-[PKPaymentTransactionFees isEqual:](fees, "isEqual:"))
      goto LABEL_339;
  }
  else if (fees != v50)
  {
    goto LABEL_339;
  }
  primaryFundingSourceAmount = self->_primaryFundingSourceAmount;
  v52 = (NSDecimalNumber *)v4[56];
  if (primaryFundingSourceAmount && v52)
  {
    if ((-[NSDecimalNumber isEqual:](primaryFundingSourceAmount, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (primaryFundingSourceAmount != v52)
  {
    goto LABEL_339;
  }
  primaryFundingSourceCurrencyCode = self->_primaryFundingSourceCurrencyCode;
  v54 = (NSString *)v4[57];
  if (primaryFundingSourceCurrencyCode && v54)
  {
    if ((-[NSString isEqual:](primaryFundingSourceCurrencyCode, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (primaryFundingSourceCurrencyCode != v54)
  {
    goto LABEL_339;
  }
  secondaryFundingSourceAmount = self->_secondaryFundingSourceAmount;
  v56 = (NSDecimalNumber *)v4[58];
  if (secondaryFundingSourceAmount && v56)
  {
    if ((-[NSDecimalNumber isEqual:](secondaryFundingSourceAmount, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (secondaryFundingSourceAmount != v56)
  {
    goto LABEL_339;
  }
  secondaryFundingSourceCurrencyCode = self->_secondaryFundingSourceCurrencyCode;
  v58 = (NSString *)v4[59];
  if (secondaryFundingSourceCurrencyCode && v58)
  {
    if ((-[NSString isEqual:](secondaryFundingSourceCurrencyCode, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (secondaryFundingSourceCurrencyCode != v58)
  {
    goto LABEL_339;
  }
  if (self->_secondaryFundingSourceNetwork != v4[60])
    goto LABEL_339;
  secondaryFundingSourceDPANSuffix = self->_secondaryFundingSourceDPANSuffix;
  v60 = (NSString *)v4[61];
  if (secondaryFundingSourceDPANSuffix && v60)
  {
    if ((-[NSString isEqual:](secondaryFundingSourceDPANSuffix, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (secondaryFundingSourceDPANSuffix != v60)
  {
    goto LABEL_339;
  }
  merchantProvidedDescription = self->_merchantProvidedDescription;
  v62 = (NSString *)v4[68];
  if (merchantProvidedDescription && v62)
  {
    if ((-[NSString isEqual:](merchantProvidedDescription, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (merchantProvidedDescription != v62)
  {
    goto LABEL_339;
  }
  merchantProvidedTitle = self->_merchantProvidedTitle;
  v64 = (NSString *)v4[67];
  if (merchantProvidedTitle && v64)
  {
    if ((-[NSString isEqual:](merchantProvidedTitle, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (merchantProvidedTitle != v64)
  {
    goto LABEL_339;
  }
  if (self->_originatedByDevice != *((unsigned __int8 *)v4 + 23)
    || self->_fuzzyMatched != *((unsigned __int8 *)v4 + 24))
  {
    goto LABEL_339;
  }
  v65 = (void *)v4[103];
  v66 = self->_receiptProviderIdentifier;
  v67 = v65;
  if (v66 == v67)
  {

  }
  else
  {
    v68 = v67;
    if (!v66 || !v67)
      goto LABEL_338;
    v69 = -[NSString isEqualToString:](v66, "isEqualToString:", v67);

    if (!v69)
      goto LABEL_339;
  }
  v70 = (void *)v4[104];
  v66 = self->_receiptIdentifier;
  v71 = v70;
  if (v66 == v71)
  {

  }
  else
  {
    v68 = v71;
    if (!v66 || !v71)
      goto LABEL_338;
    v72 = -[NSString isEqualToString:](v66, "isEqualToString:", v71);

    if (!v72)
      goto LABEL_339;
  }
  receiptProviderURL = self->_receiptProviderURL;
  v74 = (NSURL *)v4[105];
  if (receiptProviderURL && v74)
  {
    if ((-[NSURL isEqual:](receiptProviderURL, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (receiptProviderURL != v74)
  {
    goto LABEL_339;
  }
  localizedTypeDescription = self->_localizedTypeDescription;
  v76 = (NSString *)v4[48];
  if (localizedTypeDescription && v76)
  {
    if ((-[NSString isEqual:](localizedTypeDescription, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (localizedTypeDescription != v76)
  {
    goto LABEL_339;
  }
  bankConnectDigitalServicingURL = self->_bankConnectDigitalServicingURL;
  v78 = (NSURL *)v4[49];
  if (bankConnectDigitalServicingURL && v78)
  {
    if ((-[NSURL isEqual:](bankConnectDigitalServicingURL, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (bankConnectDigitalServicingURL != v78)
  {
    goto LABEL_339;
  }
  bankConnectPayNowURL = self->_bankConnectPayNowURL;
  v80 = (NSURL *)v4[50];
  if (bankConnectPayNowURL && v80)
  {
    if ((-[NSURL isEqual:](bankConnectPayNowURL, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (bankConnectPayNowURL != v80)
  {
    goto LABEL_339;
  }
  bankConnectTransferFundsURL = self->_bankConnectTransferFundsURL;
  v82 = (NSURL *)v4[51];
  if (bankConnectTransferFundsURL && v82)
  {
    if ((-[NSURL isEqual:](bankConnectTransferFundsURL, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (bankConnectTransferFundsURL != v82)
  {
    goto LABEL_339;
  }
  bankConnectPostInstallmentURL = self->_bankConnectPostInstallmentURL;
  v84 = (NSURL *)v4[52];
  if (bankConnectPostInstallmentURL && v84)
  {
    if ((-[NSURL isEqual:](bankConnectPostInstallmentURL, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (bankConnectPostInstallmentURL != v84)
  {
    goto LABEL_339;
  }
  bankConnectRedeemRewardsURL = self->_bankConnectRedeemRewardsURL;
  v86 = (NSURL *)v4[53];
  if (bankConnectRedeemRewardsURL && v86)
  {
    if ((-[NSURL isEqual:](bankConnectRedeemRewardsURL, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (bankConnectRedeemRewardsURL != v86)
  {
    goto LABEL_339;
  }
  if (self->_isBankConnectTransaction != *((unsigned __int8 *)v4 + 12)
    || self->_bankConnectTransactionWasClassifiedByMaps != *((unsigned __int8 *)v4 + 13)
    || self->_bankConnectCreditDebitIndicator != v4[54]
    || self->_bankConnectRoundTransactionDate != *((unsigned __int8 *)v4 + 14))
  {
    goto LABEL_339;
  }
  bankConnectMetadata = self->_bankConnectMetadata;
  v88 = (PKPaymentTransactionBankConnectMetadata *)v4[55];
  if (bankConnectMetadata && v88)
  {
    if (!-[PKPaymentTransactionBankConnectMetadata isEqual:](bankConnectMetadata, "isEqual:"))
      goto LABEL_339;
  }
  else if (bankConnectMetadata != v88)
  {
    goto LABEL_339;
  }
  issueReportIdentifier = self->_issueReportIdentifier;
  v90 = (NSString *)v4[112];
  if (issueReportIdentifier && v90)
  {
    if ((-[NSString isEqual:](issueReportIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (issueReportIdentifier != v90)
  {
    goto LABEL_339;
  }
  rewards = self->_rewards;
  v92 = (PKPaymentTransactionRewards *)v4[72];
  if (rewards && v92)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewards, "isEqual:"))
      goto LABEL_339;
  }
  else if (rewards != v92)
  {
    goto LABEL_339;
  }
  rewardsTotalAmount = self->_rewardsTotalAmount;
  v94 = (NSDecimalNumber *)v4[69];
  if (rewardsTotalAmount && v94)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsTotalAmount, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (rewardsTotalAmount != v94)
  {
    goto LABEL_339;
  }
  rewardsTotalCurrencyCode = self->_rewardsTotalCurrencyCode;
  v96 = (NSString *)v4[70];
  if (rewardsTotalCurrencyCode && v96)
  {
    if ((-[NSString isEqual:](rewardsTotalCurrencyCode, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (rewardsTotalCurrencyCode != v96)
  {
    goto LABEL_339;
  }
  if (self->_rewardsEligibilityReason != v4[71])
    goto LABEL_339;
  rewardsInProgress = self->_rewardsInProgress;
  v98 = (PKPaymentTransactionRewards *)v4[73];
  if (rewardsInProgress && v98)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewardsInProgress, "isEqual:"))
      goto LABEL_339;
  }
  else if (rewardsInProgress != v98)
  {
    goto LABEL_339;
  }
  if (self->_cardType != v4[74])
    goto LABEL_339;
  accountIdentifier = self->_accountIdentifier;
  v100 = (NSString *)v4[75];
  if (accountIdentifier && v100)
  {
    if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (accountIdentifier != v100)
  {
    goto LABEL_339;
  }
  altDSID = self->_altDSID;
  v102 = (NSString *)v4[76];
  if (altDSID && v102)
  {
    if ((-[NSString isEqual:](altDSID, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (altDSID != v102)
  {
    goto LABEL_339;
  }
  lifecycleIdentifier = self->_lifecycleIdentifier;
  v104 = (NSString *)v4[77];
  if (lifecycleIdentifier && v104)
  {
    if ((-[NSString isEqual:](lifecycleIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (lifecycleIdentifier != v104)
  {
    goto LABEL_339;
  }
  authNetworkData = self->_authNetworkData;
  v106 = (NSString *)v4[78];
  if (authNetworkData && v106)
  {
    if ((-[NSString isEqual:](authNetworkData, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (authNetworkData != v106)
  {
    goto LABEL_339;
  }
  transactionSourceIdentifier = self->_transactionSourceIdentifier;
  v108 = (NSString *)v4[119];
  if (transactionSourceIdentifier && v108)
  {
    if ((-[NSString isEqual:](transactionSourceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (transactionSourceIdentifier != v108)
  {
    goto LABEL_339;
  }
  clearingNetworkData = self->_clearingNetworkData;
  v110 = (NSString *)v4[79];
  if (clearingNetworkData && v110)
  {
    if ((-[NSString isEqual:](clearingNetworkData, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (clearingNetworkData != v110)
  {
    goto LABEL_339;
  }
  questions = self->_questions;
  v112 = (NSSet *)v4[90];
  if (questions && v112)
  {
    if ((-[NSSet isEqual:](questions, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (questions != v112)
  {
    goto LABEL_339;
  }
  cardIdentifier = self->_cardIdentifier;
  v114 = (NSString *)v4[80];
  if (cardIdentifier && v114)
  {
    if ((-[NSString isEqual:](cardIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (cardIdentifier != v114)
  {
    goto LABEL_339;
  }
  dpanIdentifier = self->_dpanIdentifier;
  v116 = (NSString *)v4[81];
  if (dpanIdentifier && v116)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (dpanIdentifier != v116)
  {
    goto LABEL_339;
  }
  panIdentifier = self->_panIdentifier;
  v118 = (NSString *)v4[83];
  if (panIdentifier && v118)
  {
    if ((-[NSString isEqual:](panIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (panIdentifier != v118)
  {
    goto LABEL_339;
  }
  isMerchantTokenTransaction = self->_isMerchantTokenTransaction;
  v120 = (NSNumber *)v4[84];
  if (isMerchantTokenTransaction && v120)
  {
    if ((-[NSNumber isEqual:](isMerchantTokenTransaction, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (isMerchantTokenTransaction != v120)
  {
    goto LABEL_339;
  }
  cardNumberSuffix = self->_cardNumberSuffix;
  v122 = (NSString *)v4[85];
  if (cardNumberSuffix && v122)
  {
    if ((-[NSString isEqual:](cardNumberSuffix, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (cardNumberSuffix != v122)
  {
    goto LABEL_339;
  }
  if (self->_adjustmentTypeReason != v4[39] || self->_topUpType != v4[40])
    goto LABEL_339;
  referenceIdentifier = self->_referenceIdentifier;
  v124 = (NSString *)v4[86];
  if (referenceIdentifier && v124)
  {
    if ((-[NSString isEqual:](referenceIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (referenceIdentifier != v124)
  {
    goto LABEL_339;
  }
  if (self->_associatedFeatureIdentifier != v4[89]
    || self->_suppressBehavior != v4[87]
    || self->_accountType != v4[42]
    || !-[PKPaymentTransaction isCloudArchivableDeviceDataEqual:](self, "isCloudArchivableDeviceDataEqual:", v4))
  {
    goto LABEL_339;
  }
  if (-[PKPaymentTransaction _supportsServerFundingDescription](self, "_supportsServerFundingDescription"))
  {
    secondaryFundingSourceDescription = self->_secondaryFundingSourceDescription;
    v126 = (NSString *)v4[63];
    if (secondaryFundingSourceDescription && v126)
    {
      if ((-[NSString isEqual:](secondaryFundingSourceDescription, "isEqual:") & 1) == 0)
        goto LABEL_339;
    }
    else if (secondaryFundingSourceDescription != v126)
    {
      goto LABEL_339;
    }
  }
  v127 = (void *)v4[106];
  v66 = self->_barcodeIdentifier;
  v128 = v127;
  if (v66 == v128)
  {

  }
  else
  {
    v68 = v128;
    if (!v66 || !v128)
      goto LABEL_338;
    v129 = -[NSString isEqualToString:](v66, "isEqualToString:", v128);

    if (!v129)
      goto LABEL_339;
  }
  authenticationContext = self->_authenticationContext;
  v131 = (PKTransactionAuthenticationContext *)v4[107];
  if (authenticationContext && v131)
  {
    if (!-[PKTransactionAuthenticationContext isEqual:](authenticationContext, "isEqual:"))
      goto LABEL_339;
  }
  else if (authenticationContext != v131)
  {
    goto LABEL_339;
  }
  v132 = (void *)v4[108];
  v66 = self->_primaryFundingSourceDescription;
  v133 = v132;
  if (v66 != v133)
  {
    v68 = v133;
    if (v66 && v133)
    {
      v134 = -[NSString isEqualToString:](v66, "isEqualToString:", v133);

      if (!v134)
        goto LABEL_339;
      goto LABEL_342;
    }
LABEL_338:

    goto LABEL_339;
  }

LABEL_342:
  nominalAmount = self->_nominalAmount;
  v138 = (NSDecimalNumber *)v4[109];
  if (nominalAmount && v138)
  {
    if ((-[NSDecimalNumber isEqual:](nominalAmount, "isEqual:") & 1) == 0)
      goto LABEL_339;
  }
  else if (nominalAmount != v138)
  {
    goto LABEL_339;
  }
  if (self->_hasAdditionalOffers == *((unsigned __int8 *)v4 + 26))
  {
    awards = self->_awards;
    v140 = (NSArray *)v4[110];
    if (awards && v140)
    {
      if ((-[NSArray isEqual:](awards, "isEqual:") & 1) == 0)
        goto LABEL_339;
    }
    else if (awards != v140)
    {
      goto LABEL_339;
    }
    amountModifiers = self->_amountModifiers;
    v142 = (NSArray *)v4[111];
    if (amountModifiers && v142)
    {
      if ((-[NSArray isEqual:](amountModifiers, "isEqual:") & 1) == 0)
        goto LABEL_339;
    }
    else if (amountModifiers != v142)
    {
      goto LABEL_339;
    }
    releasedData = self->_releasedData;
    v144 = (PKTransactionReleasedData *)v4[120];
    if (releasedData && v144)
    {
      if (!-[PKTransactionReleasedData isEqual:](releasedData, "isEqual:"))
        goto LABEL_339;
    }
    else if (releasedData != v144)
    {
      goto LABEL_339;
    }
    associatedFinancingPlan = self->_associatedFinancingPlan;
    v146 = (PKPayLaterFinancingPlan *)v4[121];
    if (associatedFinancingPlan && v146)
    {
      if (!-[PKPayLaterFinancingPlan isEqual:](associatedFinancingPlan, "isEqual:"))
        goto LABEL_339;
    }
    else if (associatedFinancingPlan != v146)
    {
      goto LABEL_339;
    }
    issuerInstallmentManagementURL = self->_issuerInstallmentManagementURL;
    v148 = (NSURL *)v4[123];
    if (issuerInstallmentManagementURL && v148)
    {
      if ((-[NSURL isEqual:](issuerInstallmentManagementURL, "isEqual:") & 1) == 0)
        goto LABEL_339;
    }
    else if (issuerInstallmentManagementURL != v148)
    {
      goto LABEL_339;
    }
    if (self->_isIssuerInstallmentTransaction == *((unsigned __int8 *)v4 + 31))
    {
      paymentRewardsRedemption = self->_paymentRewardsRedemption;
      v150 = (PKPaymentRewardsRedemption *)v4[124];
      if (paymentRewardsRedemption && v150)
      {
        if (!-[PKPaymentRewardsRedemption isEqual:](paymentRewardsRedemption, "isEqual:"))
          goto LABEL_339;
      }
      else if (paymentRewardsRedemption != v150)
      {
        goto LABEL_339;
      }
      if (self->_recurring == *((unsigned __int8 *)v4 + 29))
      {
        associatedStatementIdentifiers = self->_associatedStatementIdentifiers;
        v152 = (NSArray *)v4[102];
        if (associatedStatementIdentifiers && v152)
        {
          if ((-[NSArray isEqual:](associatedStatementIdentifiers, "isEqual:") & 1) == 0)
            goto LABEL_339;
        }
        else if (associatedStatementIdentifiers != v152)
        {
          goto LABEL_339;
        }
        if (self->_interestReassessment == *((unsigned __int8 *)v4 + 25))
        {
          v135 = self->_paymentNetworkIdentifier == v4[82];
          goto LABEL_340;
        }
      }
    }
  }
LABEL_339:
  v135 = 0;
LABEL_340:

  return v135;
}

- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3
{
  double *v4;
  NSDate *locationDate;
  NSDate *v6;
  BOOL v7;
  char v8;
  NSString *locality;
  NSString *v10;
  NSString *administrativeArea;
  NSString *v12;
  NSTimeZone *timeZone;
  NSTimeZone *v14;
  NSString *secondaryFundingSourceFPANIdentifier;
  NSString *v16;
  NSString *peerPaymentMemo;
  NSString *v18;
  NSString *secondaryFundingSourceDescription;
  NSString *v20;
  NSUUID *requestDeviceScoreIdentifier;
  NSUUID *v22;
  NSUUID *sendDeviceScoreIdentifier;
  NSUUID *v24;
  NSDictionary *metadata;
  NSDictionary *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  PKMerchant *merchant;
  PKMerchant *v33;
  NSString *peerPaymentCounterpartImageRecordIdentifier;
  NSString *v35;

  v4 = (double *)a3;
  locationDate = self->_locationDate;
  v6 = (NSDate *)*((_QWORD *)v4 + 20);
  if (locationDate)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (locationDate != v6)
      goto LABEL_69;
  }
  else
  {
    v8 = -[NSDate isEqual:](locationDate, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_69;
  }
  if (self->_locationLatitude != v4[21]
    || self->_locationLongitude != v4[22]
    || self->_locationAltitude != v4[23]
    || self->_locationHorizontalAccuracy != v4[24]
    || self->_locationVerticalAccuracy != v4[25]
    || self->_coarseLocation != *((unsigned __int8 *)v4 + 8))
  {
    goto LABEL_69;
  }
  locality = self->_locality;
  v10 = (NSString *)*((_QWORD *)v4 + 17);
  if (locality && v10)
  {
    if ((-[NSString isEqual:](locality, "isEqual:") & 1) == 0)
      goto LABEL_69;
  }
  else if (locality != v10)
  {
    goto LABEL_69;
  }
  administrativeArea = self->_administrativeArea;
  v12 = (NSString *)*((_QWORD *)v4 + 18);
  if (administrativeArea && v12)
  {
    if ((-[NSString isEqual:](administrativeArea, "isEqual:") & 1) == 0)
      goto LABEL_69;
  }
  else if (administrativeArea != v12)
  {
    goto LABEL_69;
  }
  timeZone = self->_timeZone;
  v14 = (NSTimeZone *)*((_QWORD *)v4 + 19);
  if (timeZone && v14)
  {
    if ((-[NSTimeZone isEqual:](timeZone, "isEqual:") & 1) == 0)
      goto LABEL_69;
  }
  else if (timeZone != v14)
  {
    goto LABEL_69;
  }
  if (self->_technologyType == *((_QWORD *)v4 + 115))
  {
    secondaryFundingSourceFPANIdentifier = self->_secondaryFundingSourceFPANIdentifier;
    v16 = (NSString *)*((_QWORD *)v4 + 62);
    if (secondaryFundingSourceFPANIdentifier && v16)
    {
      if ((-[NSString isEqual:](secondaryFundingSourceFPANIdentifier, "isEqual:") & 1) == 0)
        goto LABEL_69;
    }
    else if (secondaryFundingSourceFPANIdentifier != v16)
    {
      goto LABEL_69;
    }
    if (!-[PKPaymentTransaction _supportsServerFundingDescription](self, "_supportsServerFundingDescription"))
    {
      secondaryFundingSourceDescription = self->_secondaryFundingSourceDescription;
      v20 = (NSString *)*((_QWORD *)v4 + 63);
      if (secondaryFundingSourceDescription && v20)
      {
        if ((-[NSString isEqual:](secondaryFundingSourceDescription, "isEqual:") & 1) == 0)
          goto LABEL_69;
      }
      else if (secondaryFundingSourceDescription != v20)
      {
        goto LABEL_69;
      }
    }
    if (self->_transactionSource == *((_QWORD *)v4 + 116))
    {
      peerPaymentMemo = self->_peerPaymentMemo;
      v18 = (NSString *)*((_QWORD *)v4 + 44);
      if (peerPaymentMemo && v18)
      {
        if ((-[NSString isEqual:](peerPaymentMemo, "isEqual:") & 1) == 0)
          goto LABEL_69;
      }
      else if (peerPaymentMemo != v18)
      {
        goto LABEL_69;
      }
      requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
      v22 = (NSUUID *)*((_QWORD *)v4 + 65);
      if (requestDeviceScoreIdentifier && v22)
      {
        if ((-[NSUUID isEqual:](requestDeviceScoreIdentifier, "isEqual:") & 1) == 0)
          goto LABEL_69;
      }
      else if (requestDeviceScoreIdentifier != v22)
      {
        goto LABEL_69;
      }
      sendDeviceScoreIdentifier = self->_sendDeviceScoreIdentifier;
      v24 = (NSUUID *)*((_QWORD *)v4 + 66);
      if (sendDeviceScoreIdentifier && v24)
      {
        if ((-[NSUUID isEqual:](sendDeviceScoreIdentifier, "isEqual:") & 1) == 0)
          goto LABEL_69;
      }
      else if (sendDeviceScoreIdentifier != v24)
      {
        goto LABEL_69;
      }
      if (self->_deviceScoreIdentifiersRequired != *((unsigned __int8 *)v4 + 15)
        || self->_deviceScoreIdentifiersSubmitted != *((unsigned __int8 *)v4 + 16))
      {
        goto LABEL_69;
      }
      metadata = self->_metadata;
      v26 = (NSDictionary *)*((_QWORD *)v4 + 100);
      if (metadata && v26)
      {
        if ((-[NSDictionary isEqual:](metadata, "isEqual:") & 1) != 0)
        {
LABEL_64:
          -[PKPaymentTransaction answeredQuestionsOnThisDevice](self, "answeredQuestionsOnThisDevice");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "answeredQuestionsOnThisDevice");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          if (v27 && v28)
          {
            if ((objc_msgSend(v27, "isEqual:", v28) & 1) == 0)
              goto LABEL_81;
          }
          else if (v27 != (void *)v28)
          {
            goto LABEL_81;
          }
          merchant = self->_merchant;
          v33 = (PKMerchant *)*((_QWORD *)v4 + 16);
          if (merchant && v33)
          {
            if (!-[PKMerchant isEqual:](merchant, "isEqual:"))
            {
              merchant = self->_merchant;
              v33 = (PKMerchant *)*((_QWORD *)v4 + 16);
              goto LABEL_77;
            }
          }
          else if (merchant != v33)
          {
LABEL_77:
            if (-[PKMerchant isCloudArchivableDeviceDataEqual:](merchant, "isCloudArchivableDeviceDataEqual:", v33))
              goto LABEL_78;
LABEL_81:
            v30 = 0;
LABEL_82:

            goto LABEL_70;
          }
LABEL_78:
          peerPaymentCounterpartImageRecordIdentifier = self->_peerPaymentCounterpartImageRecordIdentifier;
          v35 = (NSString *)*((_QWORD *)v4 + 96);
          if (peerPaymentCounterpartImageRecordIdentifier && v35)
            v30 = -[NSString isEqual:](peerPaymentCounterpartImageRecordIdentifier, "isEqual:");
          else
            v30 = peerPaymentCounterpartImageRecordIdentifier == v35;
          goto LABEL_82;
        }
      }
      else if (metadata == v26)
      {
        goto LABEL_64;
      }
    }
  }
LABEL_69:
  v30 = 0;
LABEL_70:

  return v30;
}

- (BOOL)hasCloudArchivableDeviceData
{
  void *v3;
  BOOL v4;
  BOOL v6;

  if (self->_locationDate
    || self->_locationLatitude != 0.0
    || self->_locationLongitude != 0.0
    || self->_locationAltitude != 0.0
    || self->_locationHorizontalAccuracy != 0.0
    || self->_locationVerticalAccuracy != 0.0
    || self->_coarseLocation
    || self->_locality
    || self->_administrativeArea
    || self->_timeZone
    || self->_technologyType
    || self->_secondaryFundingSourceFPANIdentifier
    || !-[PKPaymentTransaction _supportsServerFundingDescription](self, "_supportsServerFundingDescription")
    && self->_secondaryFundingSourceDescription
    || self->_transactionSource
    || self->_peerPaymentMemo
    || self->_requestDeviceScoreIdentifier
    || self->_sendDeviceScoreIdentifier
    || self->_deviceScoreIdentifiersSubmitted
    || self->_metadata)
  {
    return 1;
  }
  -[PKPaymentTransaction answeredQuestionsOnThisDevice](self, "answeredQuestionsOnThisDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count")
    || -[PKMerchant hasCloudArchivableDeviceData](self->_merchant, "hasCloudArchivableDeviceData")
    || self->_peerPaymentCounterpartImageRecordIdentifier != 0;
  v6 = v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransaction)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransaction *v5;
  void *v6;
  uint64_t v7;
  NSDecimalNumber *amount;
  uint64_t v9;
  NSDecimalNumber *subtotalAmount;
  uint64_t v11;
  NSDecimalNumber *amountAddedToAuth;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *serviceIdentifier;
  uint64_t v17;
  NSString *paymentHash;
  uint64_t v19;
  NSString *currencyCode;
  uint64_t v21;
  NSDate *transactionDate;
  uint64_t v23;
  NSDate *transactionStatusChangedDate;
  uint64_t v25;
  NSDate *expirationDate;
  uint64_t v27;
  NSDate *locationDate;
  uint64_t v29;
  PKMerchant *merchant;
  uint64_t v31;
  NSString *locality;
  uint64_t v33;
  NSString *administrativeArea;
  uint64_t v35;
  NSTimeZone *timeZone;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *amounts;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSArray *plans;
  uint64_t v47;
  NSDate *lastMerchantReprocessingDate;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  NSString *stationCodeProvider;
  uint64_t v57;
  NSNumber *cityCode;
  uint64_t v59;
  NSData *startStationCode;
  uint64_t v61;
  NSString *startStation;
  double v63;
  double v64;
  uint64_t v65;
  NSData *endStationCode;
  uint64_t v67;
  NSString *endStation;
  double v69;
  double v70;
  uint64_t v71;
  NSString *peerPaymentCounterpartHandle;
  uint64_t v73;
  NSString *peerPaymentMemo;
  uint64_t v75;
  NSDate *peerPaymentMessageReceivedDate;
  uint64_t v77;
  PKPaymentTransactionFees *fees;
  uint64_t v79;
  PKPaymentTransactionForeignExchangeInformation *foreignExchangeInformation;
  uint64_t v81;
  NSDecimalNumber *primaryFundingSourceAmount;
  uint64_t v83;
  NSString *primaryFundingSourceCurrencyCode;
  uint64_t v85;
  NSDecimalNumber *secondaryFundingSourceAmount;
  uint64_t v87;
  NSString *secondaryFundingSourceCurrencyCode;
  uint64_t v89;
  NSString *secondaryFundingSourceDPANSuffix;
  uint64_t v91;
  NSString *secondaryFundingSourceFPANIdentifier;
  uint64_t v93;
  NSString *secondaryFundingSourceDescription;
  int v95;
  uint64_t v96;
  uint64_t v97;
  NSUUID *requestDeviceScoreIdentifier;
  uint64_t v99;
  NSUUID *sendDeviceScoreIdentifier;
  uint64_t v101;
  NSString *merchantProvidedDescription;
  uint64_t v103;
  NSString *merchantProvidedTitle;
  uint64_t v105;
  PKPaymentTransactionRewards *rewards;
  uint64_t v107;
  NSDecimalNumber *rewardsTotalAmount;
  uint64_t v109;
  NSString *rewardsTotalCurrencyCode;
  uint64_t v111;
  PKPaymentTransactionRewards *rewardsInProgress;
  uint64_t v113;
  NSString *accountIdentifier;
  uint64_t v115;
  NSString *altDSID;
  uint64_t v117;
  NSString *lifecycleIdentifier;
  uint64_t v119;
  NSString *authNetworkData;
  uint64_t v121;
  NSString *clearingNetworkData;
  uint64_t v123;
  NSString *cardIdentifier;
  uint64_t v125;
  NSString *dpanIdentifier;
  uint64_t v127;
  NSString *panIdentifier;
  uint64_t v129;
  NSNumber *isMerchantTokenTransaction;
  uint64_t v131;
  NSString *cardNumberSuffix;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  NSSet *questions;
  uint64_t v138;
  NSString *referenceIdentifier;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  NSOrderedSet *servicingEvents;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  NSArray *payments;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  NSArray *transfers;
  uint64_t v155;
  PKPeerPaymentRecurringPayment *recurringPeerPayment;
  void *v157;
  uint64_t v158;
  PKAccountEvent *redemptionEvent;
  uint64_t v160;
  PKCreditInstallmentPlanPayment *installmentPayment;
  uint64_t v162;
  PKCreditInstallmentPlan *installmentPlan;
  uint64_t v164;
  NSDictionary *metadata;
  uint64_t v166;
  NSString *transactionSourceIdentifier;
  uint64_t v168;
  NSURL *receiptProviderURL;
  uint64_t v170;
  NSString *receiptProviderIdentifier;
  uint64_t v172;
  NSString *receiptIdentifier;
  uint64_t v174;
  NSString *issueReportIdentifier;
  uint64_t v176;
  NSString *localizedTypeDescription;
  uint64_t v178;
  NSURL *bankConnectDigitalServicingURL;
  uint64_t v180;
  NSURL *bankConnectPayNowURL;
  uint64_t v182;
  NSURL *bankConnectTransferFundsURL;
  uint64_t v184;
  NSURL *bankConnectPostInstallmentURL;
  uint64_t v186;
  NSURL *bankConnectRedeemRewardsURL;
  uint64_t v188;
  PKPaymentTransactionBankConnectMetadata *bankConnectMetadata;
  uint64_t v190;
  NSString *barcodeIdentifier;
  uint64_t v192;
  PKTransactionAuthenticationContext *authenticationContext;
  uint64_t v194;
  NSString *primaryFundingSourceDescription;
  uint64_t v196;
  NSDecimalNumber *nominalAmount;
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  NSArray *awards;
  void *v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  NSArray *amountModifiers;
  uint64_t v208;
  PKTransactionReleasedData *releasedData;
  uint64_t v210;
  PKPayLaterFinancingPlan *associatedFinancingPlan;
  uint64_t v212;
  NSURL *issuerInstallmentManagementURL;
  uint64_t v214;
  PKPaymentRewardsRedemption *paymentRewardsRedemption;
  void *v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  NSArray *associatedStatementIdentifiers;
  uint64_t v221;
  NSString *peerPaymentCounterpartImageRecordIdentifier;
  objc_super v224;

  v4 = a3;
  v224.receiver = self;
  v224.super_class = (Class)PKPaymentTransaction;
  v5 = -[PKPaymentTransaction init](&v224, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v7 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtotalAmount"));
    v9 = objc_claimAutoreleasedReturnValue();
    subtotalAmount = v5->_subtotalAmount;
    v5->_subtotalAmount = (NSDecimalNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountAddedToAuth"));
    v11 = objc_claimAutoreleasedReturnValue();
    amountAddedToAuth = v5->_amountAddedToAuth;
    v5->_amountAddedToAuth = (NSDecimalNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentHash"));
    v17 = objc_claimAutoreleasedReturnValue();
    paymentHash = v5->_paymentHash;
    v5->_paymentHash = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v19 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDate"));
    v21 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionStatusChangedDate"));
    v23 = objc_claimAutoreleasedReturnValue();
    transactionStatusChangedDate = v5->_transactionStatusChangedDate;
    v5->_transactionStatusChangedDate = (NSDate *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v25 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationDate"));
    v27 = objc_claimAutoreleasedReturnValue();
    locationDate = v5->_locationDate;
    v5->_locationDate = (NSDate *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchant"));
    v29 = objc_claimAutoreleasedReturnValue();
    merchant = v5->_merchant;
    v5->_merchant = (PKMerchant *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locality"));
    v31 = objc_claimAutoreleasedReturnValue();
    locality = v5->_locality;
    v5->_locality = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("administrativeArea"));
    v33 = objc_claimAutoreleasedReturnValue();
    administrativeArea = v5->_administrativeArea;
    v5->_administrativeArea = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v35 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("amounts"));
    v40 = objc_claimAutoreleasedReturnValue();
    amounts = v5->_amounts;
    v5->_amounts = (NSArray *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v43 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("plans"));
    v45 = objc_claimAutoreleasedReturnValue();
    plans = v5->_plans;
    v5->_plans = (NSArray *)v45;

    v5->_suppressNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockNotification"));
    v5->_recurring = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("recurring"));
    v5->_transactionStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionStatus"));
    v5->_transactionDeclinedReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionDeclinedReason"));
    v5->_transactionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionType"));
    v5->_technologyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("technologyType"));
    v5->_transactionSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transactionSource"));
    v5->_hasNotificationServiceData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasNotificationServiceData"));
    v5->_hasAssociatedPaymentApplication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAssociatedPaymentApplication"));
    v5->_processedForLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("processedForLocation"));
    v5->_processedForMerchantCleanup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("processedForMerchantCleanup"));
    v5->_requiresMerchantReprocessing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresClearingMerchantCleanup"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastMerchantReprocessingDate"));
    v47 = objc_claimAutoreleasedReturnValue();
    lastMerchantReprocessingDate = v5->_lastMerchantReprocessingDate;
    v5->_lastMerchantReprocessingDate = (NSDate *)v47;

    v5->_processedForStations = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("processedForStations"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationLatitude"));
    v5->_locationLatitude = v49;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationLongitude"));
    v5->_locationLongitude = v50;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationAltitude"));
    v5->_locationAltitude = v51;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationHorizontalAccuracy"));
    v5->_locationHorizontalAccuracy = v52;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locationVerticalAccuracy"));
    v5->_locationVerticalAccuracy = v53;
    v5->_coarseLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCoarseLocation"));
    v5->_transitType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transitType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transitModifiers"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_transitModifiers = objc_msgSend(v54, "unsignedIntegerValue");

    v5->_enRoute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enRoute"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stationCodeProvider"));
    v55 = objc_claimAutoreleasedReturnValue();
    stationCodeProvider = v5->_stationCodeProvider;
    v5->_stationCodeProvider = (NSString *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cityCode"));
    v57 = objc_claimAutoreleasedReturnValue();
    cityCode = v5->_cityCode;
    v5->_cityCode = (NSNumber *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startStationCode"));
    v59 = objc_claimAutoreleasedReturnValue();
    startStationCode = v5->_startStationCode;
    v5->_startStationCode = (NSData *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startStation"));
    v61 = objc_claimAutoreleasedReturnValue();
    startStation = v5->_startStation;
    v5->_startStation = (NSString *)v61;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startStationLatitude"));
    v5->_startStationLatitude = v63;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startStationLongitude"));
    v5->_startStationLongitude = v64;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endStationCode"));
    v65 = objc_claimAutoreleasedReturnValue();
    endStationCode = v5->_endStationCode;
    v5->_endStationCode = (NSData *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endStation"));
    v67 = objc_claimAutoreleasedReturnValue();
    endStation = v5->_endStation;
    v5->_endStation = (NSString *)v67;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("endStationLatitude"));
    v5->_endStationLatitude = v69;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ednStationLongitude"));
    v5->_endStationLongitude = v70;
    v5->_shouldSuppressDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppressDate"));
    v5->_adjustmentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("adjustmentType"));
    v5->_peerPaymentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("peerPaymentType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentCounterpartHandle"));
    v71 = objc_claimAutoreleasedReturnValue();
    peerPaymentCounterpartHandle = v5->_peerPaymentCounterpartHandle;
    v5->_peerPaymentCounterpartHandle = (NSString *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentMemo"));
    v73 = objc_claimAutoreleasedReturnValue();
    peerPaymentMemo = v5->_peerPaymentMemo;
    v5->_peerPaymentMemo = (NSString *)v73;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentMessageReceivedDate"));
    v75 = objc_claimAutoreleasedReturnValue();
    peerPaymentMessageReceivedDate = v5->_peerPaymentMessageReceivedDate;
    v5->_peerPaymentMessageReceivedDate = (NSDate *)v75;

    v5->_accountType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("feature"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fees"));
    v77 = objc_claimAutoreleasedReturnValue();
    fees = v5->_fees;
    v5->_fees = (PKPaymentTransactionFees *)v77;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foreignExchangeInformation"));
    v79 = objc_claimAutoreleasedReturnValue();
    foreignExchangeInformation = v5->_foreignExchangeInformation;
    v5->_foreignExchangeInformation = (PKPaymentTransactionForeignExchangeInformation *)v79;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryFundingSourceAmount"));
    v81 = objc_claimAutoreleasedReturnValue();
    primaryFundingSourceAmount = v5->_primaryFundingSourceAmount;
    v5->_primaryFundingSourceAmount = (NSDecimalNumber *)v81;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryFundingSourceCurrencyCode"));
    v83 = objc_claimAutoreleasedReturnValue();
    primaryFundingSourceCurrencyCode = v5->_primaryFundingSourceCurrencyCode;
    v5->_primaryFundingSourceCurrencyCode = (NSString *)v83;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryFundingSourceAmount"));
    v85 = objc_claimAutoreleasedReturnValue();
    secondaryFundingSourceAmount = v5->_secondaryFundingSourceAmount;
    v5->_secondaryFundingSourceAmount = (NSDecimalNumber *)v85;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryFundingSourceCurrencyCode"));
    v87 = objc_claimAutoreleasedReturnValue();
    secondaryFundingSourceCurrencyCode = v5->_secondaryFundingSourceCurrencyCode;
    v5->_secondaryFundingSourceCurrencyCode = (NSString *)v87;

    v5->_secondaryFundingSourceNetwork = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("secondaryFundingSourceNetwork"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryFundingSourceDPANSuffix"));
    v89 = objc_claimAutoreleasedReturnValue();
    secondaryFundingSourceDPANSuffix = v5->_secondaryFundingSourceDPANSuffix;
    v5->_secondaryFundingSourceDPANSuffix = (NSString *)v89;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryFundingSourceFPANIdentifier"));
    v91 = objc_claimAutoreleasedReturnValue();
    secondaryFundingSourceFPANIdentifier = v5->_secondaryFundingSourceFPANIdentifier;
    v5->_secondaryFundingSourceFPANIdentifier = (NSString *)v91;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryFundingSourceDescription"));
    v93 = objc_claimAutoreleasedReturnValue();
    secondaryFundingSourceDescription = v5->_secondaryFundingSourceDescription;
    v5->_secondaryFundingSourceDescription = (NSString *)v93;

    v95 = objc_msgSend(v4, "containsValueForKey:", CFSTR("secondaryFundingSourceType"));
    if (v5->_transactionType != 5 || v95)
      v96 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("secondaryFundingSourceType"));
    else
      v96 = 1;
    v5->_secondaryFundingSourceType = v96;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestDeviceScoreIdentifier"));
    v97 = objc_claimAutoreleasedReturnValue();
    requestDeviceScoreIdentifier = v5->_requestDeviceScoreIdentifier;
    v5->_requestDeviceScoreIdentifier = (NSUUID *)v97;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sendDeviceScoreIdentifier"));
    v99 = objc_claimAutoreleasedReturnValue();
    sendDeviceScoreIdentifier = v5->_sendDeviceScoreIdentifier;
    v5->_sendDeviceScoreIdentifier = (NSUUID *)v99;

    v5->_deviceScoreIdentifiersRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceScoreIdentifiersRequired"));
    v5->_deviceScoreIdentifiersSubmitted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceScoreIdentifiersSubmitted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantProvidedDescription"));
    v101 = objc_claimAutoreleasedReturnValue();
    merchantProvidedDescription = v5->_merchantProvidedDescription;
    v5->_merchantProvidedDescription = (NSString *)v101;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantProvidedTitle"));
    v103 = objc_claimAutoreleasedReturnValue();
    merchantProvidedTitle = v5->_merchantProvidedTitle;
    v5->_merchantProvidedTitle = (NSString *)v103;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewards"));
    v105 = objc_claimAutoreleasedReturnValue();
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v105;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsTotalAmount"));
    v107 = objc_claimAutoreleasedReturnValue();
    rewardsTotalAmount = v5->_rewardsTotalAmount;
    v5->_rewardsTotalAmount = (NSDecimalNumber *)v107;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsTotalCurrencyCode"));
    v109 = objc_claimAutoreleasedReturnValue();
    rewardsTotalCurrencyCode = v5->_rewardsTotalCurrencyCode;
    v5->_rewardsTotalCurrencyCode = (NSString *)v109;

    v5->_redemptionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("redemptionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsInProgress"));
    v111 = objc_claimAutoreleasedReturnValue();
    rewardsInProgress = v5->_rewardsInProgress;
    v5->_rewardsInProgress = (PKPaymentTransactionRewards *)v111;

    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    v5->_rewardsEligibilityReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rewardsEligibilityReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v113 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v113;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v115 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v115;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lifecycleIdentifier"));
    v117 = objc_claimAutoreleasedReturnValue();
    lifecycleIdentifier = v5->_lifecycleIdentifier;
    v5->_lifecycleIdentifier = (NSString *)v117;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authNetworkData"));
    v119 = objc_claimAutoreleasedReturnValue();
    authNetworkData = v5->_authNetworkData;
    v5->_authNetworkData = (NSString *)v119;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clearingNetworkData"));
    v121 = objc_claimAutoreleasedReturnValue();
    clearingNetworkData = v5->_clearingNetworkData;
    v5->_clearingNetworkData = (NSString *)v121;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardIdentifier"));
    v123 = objc_claimAutoreleasedReturnValue();
    cardIdentifier = v5->_cardIdentifier;
    v5->_cardIdentifier = (NSString *)v123;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanIdentifier"));
    v125 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v125;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("panIdentifier"));
    v127 = objc_claimAutoreleasedReturnValue();
    panIdentifier = v5->_panIdentifier;
    v5->_panIdentifier = (NSString *)v127;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isMerchantTokenTransaction"));
    v129 = objc_claimAutoreleasedReturnValue();
    isMerchantTokenTransaction = v5->_isMerchantTokenTransaction;
    v5->_isMerchantTokenTransaction = (NSNumber *)v129;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("last4Digits"));
    v131 = objc_claimAutoreleasedReturnValue();
    cardNumberSuffix = v5->_cardNumberSuffix;
    v5->_cardNumberSuffix = (NSString *)v131;

    v5->_adjustmentTypeReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("adjustmentTypeReason"));
    v5->_topUpType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("topUpType"));
    v133 = (void *)MEMORY[0x1E0C99E60];
    v134 = objc_opt_class();
    objc_msgSend(v133, "setWithObjects:", v134, objc_opt_class(), 0);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v135, CFSTR("issuerQuestions"));
    v136 = objc_claimAutoreleasedReturnValue();
    questions = v5->_questions;
    v5->_questions = (NSSet *)v136;

    v5->_associatedFeatureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("associatedFeatureIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceIdentifier"));
    v138 = objc_claimAutoreleasedReturnValue();
    referenceIdentifier = v5->_referenceIdentifier;
    v5->_referenceIdentifier = (NSString *)v138;

    v5->_suppressBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supressBehavior"));
    v140 = (void *)MEMORY[0x1E0C99E60];
    v141 = objc_opt_class();
    objc_msgSend(v140, "setWithObjects:", v141, objc_opt_class(), 0);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v142, CFSTR("servicingEvents"));
    v143 = objc_claimAutoreleasedReturnValue();
    servicingEvents = v5->_servicingEvents;
    v5->_servicingEvents = (NSOrderedSet *)v143;

    v145 = (void *)MEMORY[0x1E0C99E60];
    v146 = objc_opt_class();
    objc_msgSend(v145, "setWithObjects:", v146, objc_opt_class(), 0);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v147, CFSTR("payments"));
    v148 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSArray *)v148;

    v150 = (void *)MEMORY[0x1E0C99E60];
    v151 = objc_opt_class();
    objc_msgSend(v150, "setWithObjects:", v151, objc_opt_class(), 0);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v152, CFSTR("transfers"));
    v153 = objc_claimAutoreleasedReturnValue();
    transfers = v5->_transfers;
    v5->_transfers = (NSArray *)v153;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurringPeerPayment"));
    v155 = objc_claimAutoreleasedReturnValue();
    recurringPeerPayment = v5->_recurringPeerPayment;
    v5->_recurringPeerPayment = (PKPeerPaymentRecurringPayment *)v155;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v157, CFSTR("redemptionEvent"));
    v158 = objc_claimAutoreleasedReturnValue();
    redemptionEvent = v5->_redemptionEvent;
    v5->_redemptionEvent = (PKAccountEvent *)v158;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentPayment"));
    v160 = objc_claimAutoreleasedReturnValue();
    installmentPayment = v5->_installmentPayment;
    v5->_installmentPayment = (PKCreditInstallmentPlanPayment *)v160;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installment"));
    v162 = objc_claimAutoreleasedReturnValue();
    installmentPlan = v5->_installmentPlan;
    v5->_installmentPlan = (PKCreditInstallmentPlan *)v162;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("metadata"));
    v164 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v164;

    v5->_updateReasons = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateReasons"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v166 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v166;

    v5->_originatedByDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("originatedByDevice"));
    v5->_fuzzyMatched = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fuzzyMatched"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiptProviderURL"));
    v168 = objc_claimAutoreleasedReturnValue();
    receiptProviderURL = v5->_receiptProviderURL;
    v5->_receiptProviderURL = (NSURL *)v168;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiptProviderIdentifier"));
    v170 = objc_claimAutoreleasedReturnValue();
    receiptProviderIdentifier = v5->_receiptProviderIdentifier;
    v5->_receiptProviderIdentifier = (NSString *)v170;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiptIdentifier"));
    v172 = objc_claimAutoreleasedReturnValue();
    receiptIdentifier = v5->_receiptIdentifier;
    v5->_receiptIdentifier = (NSString *)v172;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issueReportIdentifier"));
    v174 = objc_claimAutoreleasedReturnValue();
    issueReportIdentifier = v5->_issueReportIdentifier;
    v5->_issueReportIdentifier = (NSString *)v174;

    v5->_requiresLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresLocation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTypeDescription"));
    v176 = objc_claimAutoreleasedReturnValue();
    localizedTypeDescription = v5->_localizedTypeDescription;
    v5->_localizedTypeDescription = (NSString *)v176;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankConnectDigitalServicingURL"));
    v178 = objc_claimAutoreleasedReturnValue();
    bankConnectDigitalServicingURL = v5->_bankConnectDigitalServicingURL;
    v5->_bankConnectDigitalServicingURL = (NSURL *)v178;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankConnectPayNowURL"));
    v180 = objc_claimAutoreleasedReturnValue();
    bankConnectPayNowURL = v5->_bankConnectPayNowURL;
    v5->_bankConnectPayNowURL = (NSURL *)v180;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankConnectTransferFundsURL"));
    v182 = objc_claimAutoreleasedReturnValue();
    bankConnectTransferFundsURL = v5->_bankConnectTransferFundsURL;
    v5->_bankConnectTransferFundsURL = (NSURL *)v182;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankConnectPostInstallmentURL"));
    v184 = objc_claimAutoreleasedReturnValue();
    bankConnectPostInstallmentURL = v5->_bankConnectPostInstallmentURL;
    v5->_bankConnectPostInstallmentURL = (NSURL *)v184;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankConnectRedeemRewardsURL"));
    v186 = objc_claimAutoreleasedReturnValue();
    bankConnectRedeemRewardsURL = v5->_bankConnectRedeemRewardsURL;
    v5->_bankConnectRedeemRewardsURL = (NSURL *)v186;

    v5->_isBankConnectTransaction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBankConnectTransaction"));
    v5->_bankConnectTransactionWasClassifiedByMaps = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bankConnectTransactionWasClassifiedByMaps"));
    v5->_bankConnectCreditDebitIndicator = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bankConnectCreditDebitIndicator"));
    v5->_bankConnectRoundTransactionDate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bankConnectRoundTransactionDate"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankConnectMetadata"));
    v188 = objc_claimAutoreleasedReturnValue();
    bankConnectMetadata = v5->_bankConnectMetadata;
    v5->_bankConnectMetadata = (PKPaymentTransactionBankConnectMetadata *)v188;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcodeIdentifier"));
    v190 = objc_claimAutoreleasedReturnValue();
    barcodeIdentifier = v5->_barcodeIdentifier;
    v5->_barcodeIdentifier = (NSString *)v190;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationDetails"));
    v192 = objc_claimAutoreleasedReturnValue();
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (PKTransactionAuthenticationContext *)v192;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryFundingSourceDescription"));
    v194 = objc_claimAutoreleasedReturnValue();
    primaryFundingSourceDescription = v5->_primaryFundingSourceDescription;
    v5->_primaryFundingSourceDescription = (NSString *)v194;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nominalAmount"));
    v196 = objc_claimAutoreleasedReturnValue();
    nominalAmount = v5->_nominalAmount;
    v5->_nominalAmount = (NSDecimalNumber *)v196;

    v5->_hasAdditionalOffers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAdditionalOffers"));
    v198 = (void *)MEMORY[0x1E0C99E60];
    v199 = objc_opt_class();
    objc_msgSend(v198, "setWithObjects:", v199, objc_opt_class(), 0);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v200, CFSTR("awards"));
    v201 = objc_claimAutoreleasedReturnValue();
    awards = v5->_awards;
    v5->_awards = (NSArray *)v201;

    v203 = (void *)MEMORY[0x1E0C99E60];
    v204 = objc_opt_class();
    objc_msgSend(v203, "setWithObjects:", v204, objc_opt_class(), 0);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v205, CFSTR("amountModifiers"));
    v206 = objc_claimAutoreleasedReturnValue();
    amountModifiers = v5->_amountModifiers;
    v5->_amountModifiers = (NSArray *)v206;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releasedData"));
    v208 = objc_claimAutoreleasedReturnValue();
    releasedData = v5->_releasedData;
    v5->_releasedData = (PKTransactionReleasedData *)v208;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedFinancingPlan"));
    v210 = objc_claimAutoreleasedReturnValue();
    associatedFinancingPlan = v5->_associatedFinancingPlan;
    v5->_associatedFinancingPlan = (PKPayLaterFinancingPlan *)v210;

    v5->_isIssuerInstallmentTransaction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIssuerInstallmentTransaction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerInstallmentManagementURL"));
    v212 = objc_claimAutoreleasedReturnValue();
    issuerInstallmentManagementURL = v5->_issuerInstallmentManagementURL;
    v5->_issuerInstallmentManagementURL = (NSURL *)v212;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentRewardsRedemption"));
    v214 = objc_claimAutoreleasedReturnValue();
    paymentRewardsRedemption = v5->_paymentRewardsRedemption;
    v5->_paymentRewardsRedemption = (PKPaymentRewardsRedemption *)v214;

    v216 = (void *)MEMORY[0x1E0C99E60];
    v217 = objc_opt_class();
    objc_msgSend(v216, "setWithObjects:", v217, objc_opt_class(), 0);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v218, CFSTR("associatedStatementIdentifiers"));
    v219 = objc_claimAutoreleasedReturnValue();
    associatedStatementIdentifiers = v5->_associatedStatementIdentifiers;
    v5->_associatedStatementIdentifiers = (NSArray *)v219;

    v5->_interestReassessment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("interestReassessment"));
    v5->_paymentNetworkIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentNetworkIdentifier"));
    v5->_peerPaymentPaymentMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("peerPaymentPaymentMode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentCounterpartImageRecordIdentifier"));
    v221 = objc_claimAutoreleasedReturnValue();
    peerPaymentCounterpartImageRecordIdentifier = v5->_peerPaymentCounterpartImageRecordIdentifier;
    v5->_peerPaymentCounterpartImageRecordIdentifier = (NSString *)v221;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  void *v5;
  id v6;

  amount = self->_amount;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_subtotalAmount, CFSTR("subtotalAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_amountAddedToAuth, CFSTR("amountAddedToAuth"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_serviceIdentifier, CFSTR("serviceIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_paymentHash, CFSTR("paymentHash"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_amounts, CFSTR("amounts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_plans, CFSTR("plans"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_transactionStatusChangedDate, CFSTR("transactionStatusChangedDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locationDate, CFSTR("locationDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_merchant, CFSTR("merchant"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_locality, CFSTR("locality"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_administrativeArea, CFSTR("administrativeArea"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_suppressNotifications, CFSTR("blockNotification"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_recurring, CFSTR("recurring"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_transactionStatus, CFSTR("transactionStatus"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_transactionDeclinedReason, CFSTR("transactionDeclinedReason"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_transactionType, CFSTR("transactionType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_technologyType, CFSTR("technologyType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_transactionSource, CFSTR("transactionSource"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasNotificationServiceData, CFSTR("hasNotificationServiceData"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasAssociatedPaymentApplication, CFSTR("hasAssociatedPaymentApplication"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_processedForLocation, CFSTR("processedForLocation"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_processedForMerchantCleanup, CFSTR("processedForMerchantCleanup"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_requiresMerchantReprocessing, CFSTR("requiresClearingMerchantCleanup"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastMerchantReprocessingDate, CFSTR("lastMerchantReprocessingDate"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_processedForStations, CFSTR("processedForStations"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("locationLatitude"), self->_locationLatitude);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("locationLongitude"), self->_locationLongitude);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("locationAltitude"), self->_locationAltitude);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("locationHorizontalAccuracy"), self->_locationHorizontalAccuracy);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("locationVerticalAccuracy"), self->_locationVerticalAccuracy);
  objc_msgSend(v6, "encodeBool:forKey:", self->_coarseLocation, CFSTR("isCoarseLocation"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_transitType, CFSTR("transitType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_transitModifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("transitModifiers"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_enRoute, CFSTR("enRoute"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_stationCodeProvider, CFSTR("stationCodeProvider"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cityCode, CFSTR("cityCode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startStationCode, CFSTR("startStationCode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_startStation, CFSTR("startStation"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("startStationLatitude"), self->_startStationLatitude);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("startStationLongitude"), self->_startStationLongitude);
  objc_msgSend(v6, "encodeObject:forKey:", self->_endStationCode, CFSTR("endStationCode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_endStation, CFSTR("endStation"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("endStationLatitude"), self->_endStationLatitude);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("ednStationLongitude"), self->_endStationLongitude);
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldSuppressDate, CFSTR("shouldSuppressDate"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_adjustmentType, CFSTR("adjustmentType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_accountType, CFSTR("feature"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_peerPaymentType, CFSTR("peerPaymentType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_peerPaymentCounterpartHandle, CFSTR("peerPaymentCounterpartHandle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_peerPaymentMemo, CFSTR("peerPaymentMemo"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_peerPaymentMessageReceivedDate, CFSTR("peerPaymentMessageReceivedDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_fees, CFSTR("fees"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_foreignExchangeInformation, CFSTR("foreignExchangeInformation"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_primaryFundingSourceAmount, CFSTR("primaryFundingSourceAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_primaryFundingSourceCurrencyCode, CFSTR("primaryFundingSourceCurrencyCode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_secondaryFundingSourceAmount, CFSTR("secondaryFundingSourceAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_secondaryFundingSourceCurrencyCode, CFSTR("secondaryFundingSourceCurrencyCode"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_secondaryFundingSourceNetwork, CFSTR("secondaryFundingSourceNetwork"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_secondaryFundingSourceDPANSuffix, CFSTR("secondaryFundingSourceDPANSuffix"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_secondaryFundingSourceFPANIdentifier, CFSTR("secondaryFundingSourceFPANIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_secondaryFundingSourceDescription, CFSTR("secondaryFundingSourceDescription"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_secondaryFundingSourceType, CFSTR("secondaryFundingSourceType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_requestDeviceScoreIdentifier, CFSTR("requestDeviceScoreIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sendDeviceScoreIdentifier, CFSTR("sendDeviceScoreIdentifier"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_deviceScoreIdentifiersRequired, CFSTR("deviceScoreIdentifiersRequired"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_deviceScoreIdentifiersSubmitted, CFSTR("deviceScoreIdentifiersSubmitted"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_merchantProvidedDescription, CFSTR("merchantProvidedDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_merchantProvidedTitle, CFSTR("merchantProvidedTitle"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_rewards, CFSTR("rewards"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_rewardsTotalAmount, CFSTR("rewardsTotalAmount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_rewardsTotalCurrencyCode, CFSTR("rewardsTotalCurrencyCode"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_rewardsEligibilityReason, CFSTR("rewardsEligibilityReason"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_redemptionType, CFSTR("redemptionType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_rewardsInProgress, CFSTR("rewardsInProgress"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_lifecycleIdentifier, CFSTR("lifecycleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_authNetworkData, CFSTR("authNetworkData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clearingNetworkData, CFSTR("clearingNetworkData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cardIdentifier, CFSTR("cardIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_panIdentifier, CFSTR("panIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_isMerchantTokenTransaction, CFSTR("isMerchantTokenTransaction"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_cardNumberSuffix, CFSTR("last4Digits"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_adjustmentTypeReason, CFSTR("adjustmentTypeReason"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_topUpType, CFSTR("topUpType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_questions, CFSTR("issuerQuestions"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_referenceIdentifier, CFSTR("referenceIdentifier"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_associatedFeatureIdentifier, CFSTR("associatedFeatureIdentifier"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_suppressBehavior, CFSTR("supressBehavior"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_servicingEvents, CFSTR("servicingEvents"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_redemptionEvent, CFSTR("redemptionEvent"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_payments, CFSTR("payments"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_transfers, CFSTR("transfers"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_recurringPeerPayment, CFSTR("recurringPeerPayment"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_installmentPayment, CFSTR("installmentPayment"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_installmentPlan, CFSTR("installment"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_updateReasons, CFSTR("updateReasons"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_originatedByDevice, CFSTR("originatedByDevice"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_fuzzyMatched, CFSTR("fuzzyMatched"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_issueReportIdentifier, CFSTR("issueReportIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_receiptProviderURL, CFSTR("receiptProviderURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_receiptIdentifier, CFSTR("receiptIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_receiptProviderIdentifier, CFSTR("receiptProviderIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_requiresLocation, CFSTR("requiresLocation"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedTypeDescription, CFSTR("localizedTypeDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bankConnectDigitalServicingURL, CFSTR("bankConnectDigitalServicingURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bankConnectPayNowURL, CFSTR("bankConnectPayNowURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bankConnectTransferFundsURL, CFSTR("bankConnectTransferFundsURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bankConnectPostInstallmentURL, CFSTR("bankConnectPostInstallmentURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bankConnectRedeemRewardsURL, CFSTR("bankConnectRedeemRewardsURL"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isBankConnectTransaction, CFSTR("isBankConnectTransaction"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_bankConnectTransactionWasClassifiedByMaps, CFSTR("bankConnectTransactionWasClassifiedByMaps"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_bankConnectCreditDebitIndicator, CFSTR("bankConnectCreditDebitIndicator"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_bankConnectRoundTransactionDate, CFSTR("bankConnectRoundTransactionDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bankConnectMetadata, CFSTR("bankConnectMetadata"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_barcodeIdentifier, CFSTR("barcodeIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_authenticationContext, CFSTR("authenticationDetails"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_primaryFundingSourceDescription, CFSTR("primaryFundingSourceDescription"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nominalAmount, CFSTR("nominalAmount"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasAdditionalOffers, CFSTR("hasAdditionalOffers"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_awards, CFSTR("awards"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_amountModifiers, CFSTR("amountModifiers"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_releasedData, CFSTR("releasedData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_associatedFinancingPlan, CFSTR("associatedFinancingPlan"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_issuerInstallmentManagementURL, CFSTR("issuerInstallmentManagementURL"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isIssuerInstallmentTransaction, CFSTR("isIssuerInstallmentTransaction"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_paymentRewardsRedemption, CFSTR("paymentRewardsRedemption"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_associatedStatementIdentifiers, CFSTR("associatedStatementIdentifiers"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_interestReassessment, CFSTR("interestReassessment"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_paymentNetworkIdentifier, CFSTR("paymentNetworkIdentifier"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_peerPaymentPaymentMode, CFSTR("peerPaymentPaymentMode"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_peerPaymentCounterpartImageRecordIdentifier, CFSTR("peerPaymentCounterpartImageRecordIdentifier"));

}

- (PKPaymentTransaction)initWithCloudStoreCoder:(id)a3
{
  id v4;
  PKPaymentTransaction *v5;
  PKMerchant *v6;
  PKMerchant *merchant;
  PKPaymentTransactionFees *v8;
  PKPaymentTransactionFees *fees;
  PKPaymentTransactionForeignExchangeInformation *v10;
  PKPaymentTransactionForeignExchangeInformation *foreignExchangeInformation;
  PKPaymentTransactionRewards *v12;
  PKPaymentTransactionRewards *rewards;
  PKPaymentTransactionRewards *v14;
  PKPaymentTransactionRewards *rewardsInProgress;

  v4 = a3;
  v5 = -[PKPaymentTransaction init](self, "init");
  if (v5)
  {
    v6 = -[PKMerchant initWithCloudStoreCoder:]([PKMerchant alloc], "initWithCloudStoreCoder:", v4);
    merchant = v5->_merchant;
    v5->_merchant = v6;

    v8 = -[PKPaymentTransactionFees initWithCloudStoreCoder:]([PKPaymentTransactionFees alloc], "initWithCloudStoreCoder:", v4);
    fees = v5->_fees;
    v5->_fees = v8;

    v10 = -[PKPaymentTransactionForeignExchangeInformation initWithCloudStoreCoder:]([PKPaymentTransactionForeignExchangeInformation alloc], "initWithCloudStoreCoder:", v4);
    foreignExchangeInformation = v5->_foreignExchangeInformation;
    v5->_foreignExchangeInformation = v10;

    v12 = -[PKPaymentTransactionRewards initWithCloudStoreCoder:property:]([PKPaymentTransactionRewards alloc], "initWithCloudStoreCoder:property:", v4, 0);
    rewards = v5->_rewards;
    v5->_rewards = v12;

    v14 = -[PKPaymentTransactionRewards initWithCloudStoreCoder:property:]([PKPaymentTransactionRewards alloc], "initWithCloudStoreCoder:property:", v4, 1);
    rewardsInProgress = v5->_rewardsInProgress;
    v5->_rewardsInProgress = v14;

    -[PKPaymentTransaction applyPropertiesFromCloudStoreRecord:](v5, "applyPropertiesFromCloudStoreRecord:", v4);
  }

  return v5;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4;
  PKMerchant *merchant;
  PKMerchant *v6;
  PKMerchant *v7;
  PKPaymentTransactionFees *fees;
  PKPaymentTransactionFees *v9;
  PKPaymentTransactionFees *v10;
  PKPaymentTransactionForeignExchangeInformation *foreignExchangeInformation;
  PKPaymentTransactionForeignExchangeInformation *v12;
  PKPaymentTransactionForeignExchangeInformation *v13;
  PKPaymentTransactionRewards *rewards;
  PKPaymentTransactionRewards *v15;
  PKPaymentTransactionRewards *v16;
  PKPaymentTransactionRewards *rewardsInProgress;
  PKPaymentTransactionRewards *v18;
  PKPaymentTransactionRewards *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *serviceIdentifier;
  void *v24;
  NSString *v25;
  NSString *paymentHash;
  NSDecimalNumber *v27;
  NSDecimalNumber *amount;
  NSDecimalNumber *v29;
  NSDecimalNumber *subtotalAmount;
  NSString *v31;
  NSString *currencyCode;
  NSDate *v33;
  NSDate *transactionDate;
  NSDate *v35;
  NSDate *transactionStatusChangedDate;
  NSDate *v37;
  NSDate *expirationDate;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSString *v45;
  NSString *peerPaymentCounterpartHandle;
  NSDecimalNumber *v47;
  NSDecimalNumber *primaryFundingSourceAmount;
  NSString *v49;
  NSString *primaryFundingSourceCurrencyCode;
  NSDecimalNumber *v51;
  NSDecimalNumber *secondaryFundingSourceAmount;
  NSString *v53;
  NSString *secondaryFundingSourceCurrencyCode;
  void *v55;
  NSString *v56;
  NSString *secondaryFundingSourceDPANSuffix;
  void *v58;
  int64_t v59;
  void *v60;
  void *v61;
  int v62;
  NSDecimalNumber *v63;
  NSDecimalNumber *rewardsTotalAmount;
  NSString *v65;
  NSString *rewardsTotalCurrencyCode;
  void *v67;
  NSString *v68;
  NSString *merchantProvidedDescription;
  NSString *v70;
  NSString *merchantProvidedTitle;
  NSString *v72;
  NSString *altDSID;
  NSString *v74;
  NSString *accountIdentifier;
  NSString *v76;
  NSString *v77;
  NSString *v78;
  NSString *lifecycleIdentifier;
  NSString *v80;
  NSString *authNetworkData;
  NSString *v82;
  NSString *clearingNetworkData;
  NSString *v84;
  NSString *cardIdentifier;
  NSString *v86;
  NSString *dpanIdentifier;
  NSString *v88;
  NSString *panIdentifier;
  NSNumber *v90;
  NSNumber *isMerchantTokenTransaction;
  NSString *v92;
  NSString *cardNumberSuffix;
  void *v94;
  __CFString *v95;
  __CFString *v96;
  char v97;
  int64_t v98;
  __CFString *v99;
  __CFString *v100;
  char v101;
  __CFString *v102;
  __CFString *v103;
  char v104;
  __CFString *v105;
  __CFString *v106;
  char v107;
  __CFString *v108;
  __CFString *v109;
  char v110;
  __CFString *v111;
  __CFString *v112;
  char v113;
  __CFString *v114;
  __CFString *v115;
  char v116;
  __CFString *v117;
  __CFString *v118;
  int v119;
  void *v120;
  NSString *v121;
  NSString *referenceIdentifier;
  void *v123;
  NSURL *v124;
  NSURL *receiptProviderURL;
  NSString *v126;
  NSString *receiptProviderIdentifier;
  NSString *v128;
  NSString *receiptIdentifier;
  void *v130;
  NSArray *v131;
  NSArray *associatedStatementIdentifiers;
  void *v133;
  void *v134;
  void *v135;
  NSDecimalNumber *v136;
  NSDecimalNumber *amountAddedToAuth;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  NSDate *v144;
  NSDate *locationDate;
  NSString *v146;
  NSString *locality;
  NSString *v148;
  NSString *administrativeArea;
  PKPaymentTransaction *v150;
  void *v151;
  uint64_t v152;
  NSTimeZone *timeZone;
  uint64_t v154;
  NSString *secondaryFundingSourceFPANIdentifier;
  uint64_t v156;
  uint64_t v157;
  int64_t transactionType;
  uint64_t v159;
  NSString *peerPaymentMemo;
  uint64_t v161;
  NSUUID *requestDeviceScoreIdentifier;
  uint64_t v163;
  NSUUID *sendDeviceScoreIdentifier;
  uint64_t v165;
  NSDictionary *metadata;
  void *v167;
  void *v168;
  uint64_t v169;
  NSString *peerPaymentCounterpartImageRecordIdentifier;
  id v171;
  id v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t i;
  PKPaymentTransactionQuestion *v177;
  PKPaymentTransaction *v178;
  uint64_t v179;
  NSSet *questions;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t j;
  uint64_t v185;
  NSSet *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  NSSet *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  id obj;
  PKPaymentTransaction *v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  uint64_t v214;

  v214 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  merchant = self->_merchant;
  if (merchant)
  {
    -[PKMerchant applyPropertiesFromCloudStoreRecord:](merchant, "applyPropertiesFromCloudStoreRecord:", v4);
  }
  else
  {
    v6 = -[PKMerchant initWithCloudStoreCoder:]([PKMerchant alloc], "initWithCloudStoreCoder:", v4);
    v7 = self->_merchant;
    self->_merchant = v6;

  }
  fees = self->_fees;
  if (fees)
  {
    -[PKPaymentTransactionFees applyPropertiesFromCloudStoreRecord:](fees, "applyPropertiesFromCloudStoreRecord:", v4);
  }
  else
  {
    v9 = -[PKPaymentTransactionFees initWithCloudStoreCoder:]([PKPaymentTransactionFees alloc], "initWithCloudStoreCoder:", v4);
    v10 = self->_fees;
    self->_fees = v9;

  }
  foreignExchangeInformation = self->_foreignExchangeInformation;
  if (foreignExchangeInformation)
  {
    -[PKPaymentTransactionForeignExchangeInformation applyPropertiesFromCloudStoreRecord:](foreignExchangeInformation, "applyPropertiesFromCloudStoreRecord:", v4);
  }
  else
  {
    v12 = -[PKPaymentTransactionForeignExchangeInformation initWithCloudStoreCoder:]([PKPaymentTransactionForeignExchangeInformation alloc], "initWithCloudStoreCoder:", v4);
    v13 = self->_foreignExchangeInformation;
    self->_foreignExchangeInformation = v12;

  }
  rewards = self->_rewards;
  if (rewards)
  {
    -[PKPaymentTransactionRewards applyPropertiesFromCloudStoreRecord:property:](rewards, "applyPropertiesFromCloudStoreRecord:property:", v4, 0);
  }
  else
  {
    v15 = -[PKPaymentTransactionRewards initWithCloudStoreCoder:property:]([PKPaymentTransactionRewards alloc], "initWithCloudStoreCoder:property:", v4, 0);
    v16 = self->_rewards;
    self->_rewards = v15;

  }
  rewardsInProgress = self->_rewardsInProgress;
  if (rewardsInProgress)
  {
    -[PKPaymentTransactionRewards applyPropertiesFromCloudStoreRecord:property:](rewardsInProgress, "applyPropertiesFromCloudStoreRecord:property:", v4, 1);
  }
  else
  {
    v18 = -[PKPaymentTransactionRewards initWithCloudStoreCoder:property:]([PKPaymentTransactionRewards alloc], "initWithCloudStoreCoder:property:", v4, 1);
    v19 = self->_rewardsInProgress;
    self->_rewardsInProgress = v18;

  }
  objc_msgSend(v4, "recordsWithRecordType:", CFSTR("Transaction"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v60 = 0;
    v61 = 0;
    goto LABEL_58;
  }
  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("identifier"));
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  serviceIdentifier = self->_serviceIdentifier;
  self->_serviceIdentifier = v22;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("paymentHash"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uppercaseString");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  paymentHash = self->_paymentHash;
  self->_paymentHash = v25;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", CFSTR("amount"));
  v27 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  amount = self->_amount;
  self->_amount = v27;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", CFSTR("subtotalAmount"));
  v29 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  subtotalAmount = self->_subtotalAmount;
  self->_subtotalAmount = v29;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  currencyCode = self->_currencyCode;
  self->_currencyCode = v31;

  objc_msgSend(v21, "pk_encryptedDateForKey:", CFSTR("transactionDate"));
  v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
  transactionDate = self->_transactionDate;
  self->_transactionDate = v33;

  objc_msgSend(v21, "pk_encryptedDateForKey:", CFSTR("transactionStatusChangedDate"));
  v35 = (NSDate *)objc_claimAutoreleasedReturnValue();
  transactionStatusChangedDate = self->_transactionStatusChangedDate;
  self->_transactionStatusChangedDate = v35;

  objc_msgSend(v21, "pk_encryptedDateForKey:", CFSTR("expirationDate"));
  v37 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v37;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("transactionStatus"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  self->_transactionStatus = PKPaymentTransactionStatusFromString(v39);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("transactionDeclinedReason"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  self->_transactionDeclinedReason = PKPaymentTransactionDeclinedReasonFromString(v40);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("transactionType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  self->_transactionType = PKPaymentTransactionTypeFromString(v41);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("adjustmentType"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  self->_adjustmentType = PKPaymentTransactionAdjustmentSubtypeFromString(v42);

  self->_suppressNotifications = objc_msgSend(v21, "pk_encryptedBoolForKey:", CFSTR("blockNotification"));
  self->_recurring = objc_msgSend(v21, "pk_encryptedBoolForKey:", CFSTR("recurring"));
  objc_msgSend(v21, "pk_stringForKey:", CFSTR("feature"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  self->_accountType = PKPaymentTransactionAccountTypeFromString(v43);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("peerPaymentType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  self->_peerPaymentType = PKPaymentTransactionPeerPaymentSubtypeFromString(v44);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("peerPaymentCounterpartHandle"));
  v45 = (NSString *)objc_claimAutoreleasedReturnValue();
  peerPaymentCounterpartHandle = self->_peerPaymentCounterpartHandle;
  self->_peerPaymentCounterpartHandle = v45;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", CFSTR("primaryFundingSourceAmount"));
  v47 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  primaryFundingSourceAmount = self->_primaryFundingSourceAmount;
  self->_primaryFundingSourceAmount = v47;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("primaryFundingSourceCurrencyCode"));
  v49 = (NSString *)objc_claimAutoreleasedReturnValue();
  primaryFundingSourceCurrencyCode = self->_primaryFundingSourceCurrencyCode;
  self->_primaryFundingSourceCurrencyCode = v49;

  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", CFSTR("secondaryFundingSourceAmount"));
  v51 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  secondaryFundingSourceAmount = self->_secondaryFundingSourceAmount;
  self->_secondaryFundingSourceAmount = v51;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("secondaryFundingSourceCurrencyCode"));
  v53 = (NSString *)objc_claimAutoreleasedReturnValue();
  secondaryFundingSourceCurrencyCode = self->_secondaryFundingSourceCurrencyCode;
  self->_secondaryFundingSourceCurrencyCode = v53;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("secondaryFundingSourceNetwork"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  self->_secondaryFundingSourceNetwork = PKPaymentCredentialTypeForPaymentNetworkName(v55);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("secondaryFundingSourceDPANSuffix"));
  v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  secondaryFundingSourceDPANSuffix = self->_secondaryFundingSourceDPANSuffix;
  self->_secondaryFundingSourceDPANSuffix = v56;

  self->_deviceScoreIdentifiersRequired = objc_msgSend(v21, "pk_BOOLForKey:", CFSTR("deviceScoreIdentifiersRequired"));
  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("secondaryFundingSourceType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("bankAccount"), "isEqualToString:", v58) & 1) != 0)
  {
    v59 = 1;
  }
  else
  {
    v62 = objc_msgSend(CFSTR("debit"), "isEqualToString:", v58);
    v59 = 2;
    if (!v62)
      v59 = 0;
  }
  self->_secondaryFundingSourceType = v59;
  if (self->_transactionType == 5 && !v58 && !v59)
    self->_secondaryFundingSourceType = 1;
  if (-[PKPaymentTransaction _supportsServerFundingDescription](self, "_supportsServerFundingDescription"))
  {
    objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("secondaryFundingSourceDescription"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = 0;
  }
  objc_msgSend(v21, "pk_encryptedDecimalNumberForKey:", CFSTR("rewardsTotalAmount"));
  v63 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  rewardsTotalAmount = self->_rewardsTotalAmount;
  self->_rewardsTotalAmount = v63;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("rewardsTotalCurrencyCode"));
  v65 = (NSString *)objc_claimAutoreleasedReturnValue();
  rewardsTotalCurrencyCode = self->_rewardsTotalCurrencyCode;
  self->_rewardsTotalCurrencyCode = v65;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("cardType"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cardType = PKPaymentTransactionSourceFromString(v67);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("merchantProvidedDescription"));
  v68 = (NSString *)objc_claimAutoreleasedReturnValue();
  merchantProvidedDescription = self->_merchantProvidedDescription;
  self->_merchantProvidedDescription = v68;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("merchantProvidedTitle"));
  v70 = (NSString *)objc_claimAutoreleasedReturnValue();
  merchantProvidedTitle = self->_merchantProvidedTitle;
  self->_merchantProvidedTitle = v70;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("altDSID"));
  v72 = (NSString *)objc_claimAutoreleasedReturnValue();
  altDSID = self->_altDSID;
  self->_altDSID = v72;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("accountIdentifier"));
  v74 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v74;

  if (!self->_accountIdentifier)
  {
    objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("peerPaymentAccountIdentifier"));
    v76 = (NSString *)objc_claimAutoreleasedReturnValue();
    v77 = self->_accountIdentifier;
    self->_accountIdentifier = v76;

  }
  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("lifecycleIdentifier"));
  v78 = (NSString *)objc_claimAutoreleasedReturnValue();
  lifecycleIdentifier = self->_lifecycleIdentifier;
  self->_lifecycleIdentifier = v78;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("authNetworkData"));
  v80 = (NSString *)objc_claimAutoreleasedReturnValue();
  authNetworkData = self->_authNetworkData;
  self->_authNetworkData = v80;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("clearingNetworkData"));
  v82 = (NSString *)objc_claimAutoreleasedReturnValue();
  clearingNetworkData = self->_clearingNetworkData;
  self->_clearingNetworkData = v82;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("cardIdentifier"));
  v84 = (NSString *)objc_claimAutoreleasedReturnValue();
  cardIdentifier = self->_cardIdentifier;
  self->_cardIdentifier = v84;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("dpanIdentifier"));
  v86 = (NSString *)objc_claimAutoreleasedReturnValue();
  dpanIdentifier = self->_dpanIdentifier;
  self->_dpanIdentifier = v86;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("panIdentifier"));
  v88 = (NSString *)objc_claimAutoreleasedReturnValue();
  panIdentifier = self->_panIdentifier;
  self->_panIdentifier = v88;

  objc_msgSend(v21, "pk_encryptedObjectForKey:ofClass:", CFSTR("isMerchantTokenTransaction"), objc_opt_class());
  v90 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  isMerchantTokenTransaction = self->_isMerchantTokenTransaction;
  self->_isMerchantTokenTransaction = v90;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("last4Digits"));
  v92 = (NSString *)objc_claimAutoreleasedReturnValue();
  cardNumberSuffix = self->_cardNumberSuffix;
  self->_cardNumberSuffix = v92;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("adjustmentTypeReason"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  self->_adjustmentTypeReason = PKPaymentTransactionAdjustmentSubtypeReasonFromString(v94);

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("topUpType"));
  v95 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v96 = v95;
  if (v95 == CFSTR("directDeposit"))
    goto LABEL_34;
  if (!v95)
  {
LABEL_56:
    v98 = 0;
    goto LABEL_57;
  }
  v97 = -[__CFString isEqualToString:](v95, "isEqualToString:", CFSTR("directDeposit"));

  if ((v97 & 1) == 0)
  {
    v99 = v96;
    if (v99 == CFSTR("atm")
      || (v100 = v99,
          v101 = -[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR("atm")),
          v100,
          (v101 & 1) != 0))
    {
      v98 = 2;
      goto LABEL_57;
    }
    v102 = v100;
    if (v102 == CFSTR("transfer")
      || (v103 = v102,
          v104 = -[__CFString isEqualToString:](v102, "isEqualToString:", CFSTR("transfer")),
          v103,
          (v104 & 1) != 0))
    {
      v98 = 3;
      goto LABEL_57;
    }
    v105 = v103;
    if (v105 == CFSTR("check")
      || (v106 = v105,
          v107 = -[__CFString isEqualToString:](v105, "isEqualToString:", CFSTR("check")),
          v106,
          (v107 & 1) != 0))
    {
      v98 = 4;
      goto LABEL_57;
    }
    v108 = v106;
    if (v108 == CFSTR("inWallet")
      || (v109 = v108,
          v110 = -[__CFString isEqualToString:](v108, "isEqualToString:", CFSTR("inWallet")),
          v109,
          (v110 & 1) != 0))
    {
      v98 = 5;
      goto LABEL_57;
    }
    v111 = v109;
    if (v111 == CFSTR("inStore")
      || (v112 = v111,
          v113 = -[__CFString isEqualToString:](v111, "isEqualToString:", CFSTR("inStore")),
          v112,
          (v113 & 1) != 0))
    {
      v98 = 6;
      goto LABEL_57;
    }
    v114 = v112;
    if (v114 == CFSTR("amp")
      || (v115 = v114,
          v116 = -[__CFString isEqualToString:](v114, "isEqualToString:", CFSTR("amp")),
          v115,
          (v116 & 1) != 0))
    {
      v98 = 7;
      goto LABEL_57;
    }
    v117 = v115;
    if (v117 == CFSTR("redemption")
      || (v118 = v117,
          v119 = -[__CFString isEqualToString:](v117, "isEqualToString:", CFSTR("redemption")),
          v118,
          v119))
    {
      v98 = 8;
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_34:
  v98 = 1;
LABEL_57:

  self->_topUpType = v98;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pk_encryptedArrayOfClasses:forKey:", v120, CFSTR("issuerQuestions"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("referenceIdentifier"));
  v121 = (NSString *)objc_claimAutoreleasedReturnValue();
  referenceIdentifier = self->_referenceIdentifier;
  self->_referenceIdentifier = v121;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("associatedFeatureIdentifier"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  self->_associatedFeatureIdentifier = PKFeatureIdentifierFromString(v123);

  objc_msgSend(v21, "pk_encryptedUrlForKey:", CFSTR("receiptProviderURL"));
  v124 = (NSURL *)objc_claimAutoreleasedReturnValue();
  receiptProviderURL = self->_receiptProviderURL;
  self->_receiptProviderURL = v124;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("receiptProviderIdentifier"));
  v126 = (NSString *)objc_claimAutoreleasedReturnValue();
  receiptProviderIdentifier = self->_receiptProviderIdentifier;
  self->_receiptProviderIdentifier = v126;

  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("receiptIdentifier"));
  v128 = (NSString *)objc_claimAutoreleasedReturnValue();
  receiptIdentifier = self->_receiptIdentifier;
  self->_receiptIdentifier = v128;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pk_encryptedArrayOfClasses:forKey:", v130, CFSTR("associatedStatementIdentifiers"));
  v131 = (NSArray *)objc_claimAutoreleasedReturnValue();
  associatedStatementIdentifiers = self->_associatedStatementIdentifiers;
  self->_associatedStatementIdentifiers = v131;

  self->_interestReassessment = objc_msgSend(v21, "pk_encryptedBoolForKey:", CFSTR("interestReassessment"));
  objc_msgSend(v21, "pk_encryptedStringForKey:", CFSTR("peerPaymentPaymentMode"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  self->_peerPaymentPaymentMode = PKPeerPaymentPaymentModeFromString(v133);

LABEL_58:
  objc_msgSend(v4, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "firstObject");
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v198 = self;
  if (v135)
  {
    objc_msgSend(v135, "pk_encryptedDecimalNumberForKey:", CFSTR("amountAddedToAuth"));
    v136 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    amountAddedToAuth = self->_amountAddedToAuth;
    self->_amountAddedToAuth = v136;

    objc_msgSend(v135, "pk_encryptedLocationForKey:", CFSTR("location"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "coordinate");
    self->_locationLatitude = v139;
    objc_msgSend(v138, "coordinate");
    self->_locationLongitude = v140;
    objc_msgSend(v138, "altitude");
    self->_locationAltitude = v141;
    objc_msgSend(v138, "horizontalAccuracy");
    self->_locationHorizontalAccuracy = v142;
    objc_msgSend(v138, "verticalAccuracy");
    self->_locationVerticalAccuracy = v143;
    objc_msgSend(v138, "timestamp");
    v144 = (NSDate *)objc_claimAutoreleasedReturnValue();
    locationDate = self->_locationDate;
    self->_locationDate = v144;

    self->_coarseLocation = objc_msgSend(v135, "pk_encryptedBoolForKey:", CFSTR("isCoarseLocation"));
    objc_msgSend(v135, "pk_encryptedStringForKey:", CFSTR("placemarkLocality"));
    v146 = (NSString *)objc_claimAutoreleasedReturnValue();
    locality = self->_locality;
    self->_locality = v146;

    objc_msgSend(v135, "pk_encryptedStringForKey:", CFSTR("placemarkAdministrativeArea"));
    v148 = (NSString *)objc_claimAutoreleasedReturnValue();
    administrativeArea = self->_administrativeArea;
    self->_administrativeArea = v148;

    objc_msgSend(v135, "pk_encryptedStringForKey:", CFSTR("timeZone"));
    v150 = self;
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    if (v151)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v151);
      v152 = objc_claimAutoreleasedReturnValue();
      timeZone = v150->_timeZone;
      v150->_timeZone = (NSTimeZone *)v152;

    }
    v150->_processedForLocation = objc_msgSend(v135, "pk_encryptedBoolForKey:", CFSTR("processedForLocation"));
    v150->_processedForMerchantCleanup = objc_msgSend(v135, "pk_encryptedBoolForKey:", CFSTR("processedForMerchantCleanup"));
    v150->_technologyType = objc_msgSend(v135, "pk_encryptedUnsignedIntegerForKey:", CFSTR("technologyType"));
    objc_msgSend(v135, "pk_encryptedStringForKey:", CFSTR("secondaryFundingSourceFPANIdentifier"));
    v154 = objc_claimAutoreleasedReturnValue();
    secondaryFundingSourceFPANIdentifier = v150->_secondaryFundingSourceFPANIdentifier;
    v150->_secondaryFundingSourceFPANIdentifier = (NSString *)v154;

    if (!objc_msgSend(v60, "length"))
    {
      objc_msgSend(v135, "pk_encryptedStringForKey:", CFSTR("secondaryFundingSourceDescription"));
      v156 = objc_claimAutoreleasedReturnValue();

      v60 = (void *)v156;
    }
    v157 = objc_msgSend(v135, "pk_encryptedUnsignedIntegerForKey:", CFSTR("transactionSource"));
    v198->_transactionSource = v157;
    if (!v157)
    {
      transactionType = v198->_transactionType;
      if (transactionType == 8 || transactionType == 1)
        v198->_transactionSource = 4;
    }
    objc_msgSend(v135, "pk_encryptedStringForKey:", CFSTR("peerPaymentMemo"));
    v159 = objc_claimAutoreleasedReturnValue();
    peerPaymentMemo = v198->_peerPaymentMemo;
    v198->_peerPaymentMemo = (NSString *)v159;

    objc_msgSend(v135, "pk_encryptedUUIDForKey:", CFSTR("requestDeviceScoreIdentifier"));
    v161 = objc_claimAutoreleasedReturnValue();
    requestDeviceScoreIdentifier = v198->_requestDeviceScoreIdentifier;
    v198->_requestDeviceScoreIdentifier = (NSUUID *)v161;

    objc_msgSend(v135, "pk_encryptedUUIDForKey:", CFSTR("sendDeviceScoreIdentifier"));
    v163 = objc_claimAutoreleasedReturnValue();
    sendDeviceScoreIdentifier = v198->_sendDeviceScoreIdentifier;
    v198->_sendDeviceScoreIdentifier = (NSUUID *)v163;

    v198->_deviceScoreIdentifiersSubmitted = objc_msgSend(v135, "pk_encryptedBoolForKey:", CFSTR("deviceScoreIdentifiersSubmitted"));
    objc_msgSend(v135, "pk_encryptedDictionaryForKey:", CFSTR("metadata"));
    v165 = objc_claimAutoreleasedReturnValue();
    metadata = v198->_metadata;
    v198->_metadata = (NSDictionary *)v165;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "pk_encryptedArrayOfClasses:forKey:", v167, CFSTR("issuerQuestionsAnswered"));
    v168 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v135, "pk_encryptedStringForKey:", CFSTR("peerPaymentCounterpartImageRecordIdentifier"));
    v169 = objc_claimAutoreleasedReturnValue();
    peerPaymentCounterpartImageRecordIdentifier = v198->_peerPaymentCounterpartImageRecordIdentifier;
    v198->_peerPaymentCounterpartImageRecordIdentifier = (NSString *)v169;

  }
  else
  {
    v168 = 0;
  }
  if (objc_msgSend(v60, "length"))
    objc_storeStrong((id *)&v198->_secondaryFundingSourceDescription, v60);
  v194 = v135;
  v195 = v60;
  v196 = v4;
  v171 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v172 = v61;
  v173 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v207, v213, 16);
  if (v173)
  {
    v174 = v173;
    v175 = *(_QWORD *)v208;
    do
    {
      for (i = 0; i != v174; ++i)
      {
        if (*(_QWORD *)v208 != v175)
          objc_enumerationMutation(v172);
        v177 = -[PKPaymentTransactionQuestion initWithDictionary:]([PKPaymentTransactionQuestion alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * i));
        objc_msgSend(v171, "addObject:", v177);

      }
      v174 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v207, v213, 16);
    }
    while (v174);
  }
  v193 = v172;

  v178 = v198;
  if (objc_msgSend(v171, "count"))
  {
    v179 = objc_msgSend(v171, "copy", v172, v194, v60, v196);
    questions = v198->_questions;
    v198->_questions = (NSSet *)v179;

  }
  v205 = 0u;
  v206 = 0u;
  v203 = 0u;
  v204 = 0u;
  obj = v168;
  v181 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v212, 16);
  if (v181)
  {
    v182 = v181;
    v183 = *(_QWORD *)v204;
    do
    {
      for (j = 0; j != v182; ++j)
      {
        if (*(_QWORD *)v204 != v183)
          objc_enumerationMutation(obj);
        v185 = PKPaymentTransactionQuestionTypeFromString(*(void **)(*((_QWORD *)&v203 + 1) + 8 * j));
        v199 = 0u;
        v200 = 0u;
        v201 = 0u;
        v202 = 0u;
        v186 = v178->_questions;
        v187 = -[NSSet countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v199, v211, 16);
        if (v187)
        {
          v188 = v187;
          v189 = *(_QWORD *)v200;
LABEL_87:
          v190 = 0;
          while (1)
          {
            if (*(_QWORD *)v200 != v189)
              objc_enumerationMutation(v186);
            v191 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * v190);
            if (objc_msgSend(v191, "type", v193) == v185)
              break;
            if (v188 == ++v190)
            {
              v188 = -[NSSet countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v199, v211, 16);
              if (v188)
                goto LABEL_87;
              v178 = v198;
              goto LABEL_96;
            }
          }
          v192 = v191;

          v178 = v198;
          if (!v192)
            continue;
          -[NSSet setAnswered:](v192, "setAnswered:", 1);
          v186 = v192;
        }
LABEL_96:

      }
      v182 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v212, 16);
    }
    while (v182);
  }

}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    v7 = v6;
    -[PKPaymentTransaction _encodeDeviceDataWithCloudStoreCoder:codingType:](self, "_encodeDeviceDataWithCloudStoreCoder:codingType:", v6, a4);
    v6 = v7;
  }
  if (a4 - 1 <= 1)
  {
    v8 = v6;
    -[PKPaymentTransaction _encodeServerDataWithCloudStoreCoder:codingType:](self, "_encodeServerDataWithCloudStoreCoder:codingType:", v6, a4);
    v6 = v8;
  }

}

- (void)_encodeDeviceDataWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSString *serviceIdentifier;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSDictionary *metadata;
  void *v30;
  void *v31;
  id v32;
  NSSet *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKMerchant encodeWithCloudStoreCoder:codingType:](self->_merchant, "encodeWithCloudStoreCoder:codingType:", v6, a4);
  -[PKPaymentTransactionFees encodeWithCloudStoreCoder:codingType:](self->_fees, "encodeWithCloudStoreCoder:codingType:", v6, a4);
  -[PKPaymentTransactionRewards encodeWithCloudStoreCoder:codingType:property:](self->_rewards, "encodeWithCloudStoreCoder:codingType:property:", v6, a4, 0);
  -[PKPaymentTransactionRewards encodeWithCloudStoreCoder:codingType:property:](self->_rewardsInProgress, "encodeWithCloudStoreCoder:codingType:property:", v6, a4, 1);
  -[PKPaymentTransactionForeignExchangeInformation encodeWithCloudStoreCoder:codingType:](self->_foreignExchangeInformation, "encodeWithCloudStoreCoder:codingType:", v6, a4);
  objc_msgSend(v6, "recordsWithRecordType:", CFSTR("TransactionDeviceData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0C95070]);
  serviceIdentifier = self->_serviceIdentifier;
  objc_msgSend(v8, "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "zoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "initWithRecordName:zoneID:", serviceIdentifier, v13);

  v44 = (void *)v14;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("Transaction"), v14);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecord:action:", v43, 0);
  objc_msgSend(v8, "setObject:forKey:", v42, CFSTR("transactionRecord"));
  -[NSDecimalNumber description](self->_amountAddedToAuth, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("amountAddedToAuth"));

  -[PKPaymentTransaction location](self, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("location"));

  objc_msgSend(v9, "setObject:forKey:", self->_locality, CFSTR("placemarkLocality"));
  objc_msgSend(v9, "setObject:forKey:", self->_administrativeArea, CFSTR("placemarkAdministrativeArea"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_processedForLocation);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("processedForLocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_processedForMerchantCleanup);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("processedForMerchantCleanup"));

  -[NSTimeZone name](self->_timeZone, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("timeZone"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_technologyType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("technologyType"));

  objc_msgSend(v9, "setObject:forKey:", self->_secondaryFundingSourceFPANIdentifier, CFSTR("secondaryFundingSourceFPANIdentifier"));
  if (!-[PKPaymentTransaction _supportsServerFundingDescription](self, "_supportsServerFundingDescription"))
    objc_msgSend(v9, "setObject:forKey:", self->_secondaryFundingSourceDescription, CFSTR("secondaryFundingSourceDescription"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_transactionSource);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("transactionSource"));

  objc_msgSend(v9, "setObject:forKey:", self->_peerPaymentMemo, CFSTR("peerPaymentMemo"));
  -[NSUUID UUIDString](self->_requestDeviceScoreIdentifier, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("requestDeviceScoreIdentifier"));

  -[NSUUID UUIDString](self->_sendDeviceScoreIdentifier, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("sendDeviceScoreIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deviceScoreIdentifiersSubmitted);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v24, CFSTR("deviceScoreIdentifiersSubmitted"));

  -[NSTimeZone name](self->_timeZone, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v25, CFSTR("timeZone"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_coarseLocation);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v26, CFSTR("isCoarseLocation"));

  objc_msgSend(v9, "setObject:forKey:", self->_peerPaymentCounterpartImageRecordIdentifier, CFSTR("peerPaymentCounterpartImageRecordIdentifier"));
  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", CFSTR("originDeviceID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v28, CFSTR("originDeviceID"));

  metadata = self->_metadata;
  if (metadata)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", metadata, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v30, 4);

  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v9, "setObject:forKey:", v31, CFSTR("metadata"));
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v33 = self->_questions;
  v34 = -[NSSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v38, "answered"))
        {
          PKPaymentTransactionQuestionTypeToString(objc_msgSend(v38, "type"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v39);

        }
      }
      v35 = -[NSSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v35);
  }

  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v32, 0, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v40, 4);
    objc_msgSend(v9, "setObject:forKey:", v41, CFSTR("issuerQuestionsAnswered"));

  }
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t secondaryFundingSourceType;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  const __CFString *v29;
  unint64_t topUpType;
  __CFString *v31;
  id v32;
  NSSet *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t accountType;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKMerchant encodeWithCloudStoreCoder:codingType:](self->_merchant, "encodeWithCloudStoreCoder:codingType:", v6, a4);
  -[PKPaymentTransactionFees encodeWithCloudStoreCoder:codingType:](self->_fees, "encodeWithCloudStoreCoder:codingType:", v6, a4);
  -[PKPaymentTransactionForeignExchangeInformation encodeWithCloudStoreCoder:codingType:](self->_foreignExchangeInformation, "encodeWithCloudStoreCoder:codingType:", v6, a4);
  -[PKPaymentTransactionRewards encodeWithCloudStoreCoder:codingType:property:](self->_rewards, "encodeWithCloudStoreCoder:codingType:property:", v6, a4, 0);
  -[PKPaymentTransactionRewards encodeWithCloudStoreCoder:codingType:property:](self->_rewardsInProgress, "encodeWithCloudStoreCoder:codingType:property:", v6, a4, 1);
  objc_msgSend(v6, "recordsWithRecordType:", CFSTR("Transaction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", self->_serviceIdentifier, CFSTR("identifier"));
  -[NSString uppercaseString](self->_paymentHash, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("paymentHash"));

  PKPaymentTransactionTypeToString(self->_transactionType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("transactionType"));

  -[NSDecimalNumber description](self->_amount, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("amount"));

  -[NSDecimalNumber description](self->_subtotalAmount, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("subtotalAmount"));

  objc_msgSend(v9, "setObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v9, "setObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));
  objc_msgSend(v9, "setObject:forKey:", self->_transactionStatusChangedDate, CFSTR("transactionStatusChangedDate"));
  objc_msgSend(v9, "setObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  PKPaymentTransactionStatusToString(self->_transactionStatus);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("transactionStatus"));

  PKPaymentTransactionTypeToString(self->_transactionType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("transactionType"));

  v16 = self->_peerPaymentType - 1;
  v17 = CFSTR("unknown");
  v18 = CFSTR("unknown");
  if (v16 <= 5)
    v18 = off_1E2ADACE8[v16];
  objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("peerPaymentType"));
  objc_msgSend(v9, "setObject:forKey:", self->_peerPaymentCounterpartHandle, CFSTR("peerPaymentCounterpartHandle"));
  -[NSDecimalNumber description](self->_primaryFundingSourceAmount, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("primaryFundingSourceAmount"));

  objc_msgSend(v9, "setObject:forKey:", self->_primaryFundingSourceCurrencyCode, CFSTR("primaryFundingSourceCurrencyCode"));
  -[NSDecimalNumber description](self->_secondaryFundingSourceAmount, "description");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("secondaryFundingSourceAmount"));

  objc_msgSend(v9, "setObject:forKey:", self->_secondaryFundingSourceCurrencyCode, CFSTR("secondaryFundingSourceCurrencyCode"));
  PKPaymentNetworkNameForPaymentCredentialType(self->_secondaryFundingSourceNetwork);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("secondaryFundingSourceNetwork"));

  objc_msgSend(v9, "setObject:forKey:", self->_secondaryFundingSourceDPANSuffix, CFSTR("secondaryFundingSourceDPANSuffix"));
  objc_msgSend(v9, "setObject:forKey:", self->_merchantProvidedDescription, CFSTR("merchantProvidedDescription"));
  objc_msgSend(v9, "setObject:forKey:", self->_merchantProvidedTitle, CFSTR("merchantProvidedTitle"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suppressNotifications);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v22, CFSTR("blockNotification"));

  secondaryFundingSourceType = self->_secondaryFundingSourceType;
  v24 = CFSTR("bankAccount");
  if (secondaryFundingSourceType == 2)
    v24 = CFSTR("debit");
  if (secondaryFundingSourceType)
    v25 = v24;
  else
    v25 = CFSTR("unknown");
  objc_msgSend(v9, "setObject:forKey:", v25, CFSTR("secondaryFundingSourceType"));
  -[NSDecimalNumber description](self->_rewardsTotalAmount, "description");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v26, CFSTR("rewardsTotalAmount"));

  objc_msgSend(v9, "setObject:forKey:", self->_rewardsTotalCurrencyCode, CFSTR("rewardsTotalCurrencyCode"));
  v27 = self->_cardType - 1;
  if (v27 <= 7)
    v17 = off_1E2ADAD18[v27];
  objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("cardType"));
  objc_msgSend(v9, "setObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v9, "setObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v9, "setObject:forKey:", self->_lifecycleIdentifier, CFSTR("lifecycleIdentifier"));
  objc_msgSend(v9, "setObject:forKey:", self->_authNetworkData, CFSTR("authNetworkData"));
  objc_msgSend(v9, "setObject:forKey:", self->_clearingNetworkData, CFSTR("clearingNetworkData"));
  objc_msgSend(v9, "setObject:forKey:", self->_cardIdentifier, CFSTR("cardIdentifier"));
  objc_msgSend(v9, "setObject:forKey:", self->_cardNumberSuffix, CFSTR("last4Digits"));
  v28 = self->_adjustmentTypeReason - 1;
  if (v28 > 9)
    v29 = CFSTR("unknown");
  else
    v29 = off_1E2ADAD58[v28];
  objc_msgSend(v9, "setObject:forKey:", v29, CFSTR("adjustmentTypeReason"));
  topUpType = self->_topUpType;
  if (topUpType > 8)
    v31 = 0;
  else
    v31 = off_1E2ADADA8[topUpType];
  objc_msgSend(v9, "setObject:forKey:", v31, CFSTR("topUpType"));
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v33 = self->_questions;
  v34 = -[NSSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v66;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v66 != v36)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v37), "dictionaryRepresentation", (_QWORD)v65);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v38);

        ++v37;
      }
      while (v35 != v37);
      v35 = -[NSSet countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v35);
  }

  if (objc_msgSend(v32, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v32, 0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v39, 4);
    objc_msgSend(v9, "setObject:forKey:", v40, CFSTR("issuerQuestions"));

  }
  objc_msgSend(v9, "setObject:forKey:", self->_referenceIdentifier, CFSTR("referenceIdentifier"), (_QWORD)v65);
  PKFeatureIdentifierToString(self->_associatedFeatureIdentifier);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v41, CFSTR("associatedFeatureIdentifier"));

  -[NSURL absoluteString](self->_receiptProviderURL, "absoluteString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v42, CFSTR("receiptProviderURL"));

  objc_msgSend(v9, "setObject:forKey:", self->_receiptIdentifier, CFSTR("receiptIdentifier"));
  objc_msgSend(v9, "setObject:forKey:", self->_receiptProviderIdentifier, CFSTR("receiptProviderIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deviceScoreIdentifiersRequired);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v43, CFSTR("deviceScoreIdentifiersRequired"));

  accountType = self->_accountType;
  if (accountType > 4)
    v45 = CFSTR("unknown");
  else
    v45 = off_1E2ADADF0[accountType];
  objc_msgSend(v8, "setObject:forKey:", v45, CFSTR("feature"));
  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKey:", CFSTR("cloudVersion"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v47, CFSTR("cloudVersion"));

  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKey:", CFSTR("dpanIdentifier"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v49, CFSTR("dpanIdentifier"));

  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKey:", CFSTR("panIdentifier"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v51, CFSTR("panIdentifier"));

  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:", CFSTR("isMerchantTokenTransaction"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v53, CFSTR("isMerchantTokenTransaction"));

  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKey:", CFSTR("fpanIdentifier"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v55, CFSTR("fpanIdentifier"));

  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "objectForKey:", CFSTR("passSerialNumber"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v57, CFSTR("passSerialNumber"));

  objc_msgSend(v6, "cloudStoreSpecificKeys");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKey:", CFSTR("passTypeIdentifier"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v59, CFSTR("passTypeIdentifier"));

  if (PKApplePayContainerEnvironment() == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_recurring);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v60, CFSTR("recurring"));

  }
  if (self->_associatedStatementIdentifiers)
  {
    v61 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", self->_associatedStatementIdentifiers, 0, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v61, "initWithData:encoding:", v62, 4);

    objc_msgSend(v9, "setObject:forKey:", v63, CFSTR("associatedStatementIdentifiers"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_interestReassessment);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v64, CFSTR("interestReassessment"));

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "recordTypesAndNamesForCodingType:serviceIdentifier:", a3, self->_serviceIdentifier);
}

+ (id)recordTypesAndNamesForCodingType:(unint64_t)a3 serviceIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v6;
    if (a3 - 1 <= 1)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("Transaction"));
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "recordNamePrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("TransactionDeviceData"));

    }
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return CFSTR("device-");
}

- (id)primaryIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)hasPendingAmounts
{
  void *v2;
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
  -[PKPaymentTransaction amounts](self, "amounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isPending") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)transactionAmountsForMultipleAmounts
{
  id v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSDecimalNumber *v17;
  void *v18;
  PKTransactionAmount *v19;
  PKCurrencyAmount *v20;
  void *v21;
  PKCurrencyAmount *v22;
  PKTransactionAmount *v23;
  void *v24;
  PKTransactionAmount *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PKTransactionAmount *v30;
  void *v31;
  PKTransactionAmount *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  id v45;
  id v46;
  uint64_t v47;
  id obj;
  id v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  -[PKPaymentTransaction amounts](self, "amounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v50)
  {
    v4 = *(_QWORD *)v59;
    v47 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v59 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v6, "amount", v45);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currency");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "amount");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "exponent");
        v10 = objc_msgSend(v6, "isPending");
        v11 = v8;
        v12 = v11;
        if (v11 == CFSTR("XXX"))
        {

        }
        else
        {
          v13 = 0;
          if (CFSTR("XXX") && v11)
            v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("XXX"));

          if ((v13 & 1) == 0 && v12)
          {
            if (objc_msgSend(v49, "containsObject:", v12))
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "amount");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "amount");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "decimalNumberByAdding:", v51);
              v17 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
              PKCurrencyAmountCreate(v17, &v12->isa, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[PKTransactionAmount initWithCurrencyAmount:]([PKTransactionAmount alloc], "initWithCurrencyAmount:", v18);
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v19, v12);

              v4 = v47;
            }
            else
            {
              v14 = (void *)objc_msgSend(v6, "copy");
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v14, v12);
            }

            objc_msgSend(v49, "addObject:", v12);
            goto LABEL_21;
          }
        }
        v20 = [PKCurrencyAmount alloc];
        if (v10)
        {
          objc_msgSend(v7, "preformattedString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:](v20, "initWithAmount:exponent:preformattedString:", v51, v9, v21);

          v23 = [PKTransactionAmount alloc];
          objc_msgSend(v6, "unitIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[PKTransactionAmount initWithPendingCurrencyAmount:unitIdentifier:](v23, "initWithPendingCurrencyAmount:unitIdentifier:", v22, v24);
        }
        else
        {
          objc_msgSend(v6, "amount");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "absoluteValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "formattedStringValue");
          v28 = v3;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:](v20, "initWithAmount:exponent:preformattedString:", v51, v9, v29);

          v3 = v28;
          v30 = [PKTransactionAmount alloc];
          objc_msgSend(v6, "label");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "unitIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v30;
          v4 = v47;
          v25 = -[PKTransactionAmount initWithCurrencyAmount:label:unitIdentifier:](v32, "initWithCurrencyAmount:label:unitIdentifier:", v22, v24, v31);

        }
        objc_msgSend(v3, "addObject:", v25);

LABEL_21:
      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v50);
  }

  objc_msgSend(v49, "allObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __60__PKPaymentTransaction_transactionAmountsForMultipleAmounts__block_invoke;
  v56[3] = &unk_1E2ACF9A8;
  v34 = v49;
  v57 = v34;
  objc_msgSend(v33, "sortedArrayUsingComparator:", v56);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v36 = v35;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  v38 = v45;
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(v36);
        objc_msgSend(v46, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), v45);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
          objc_msgSend(v38, "addObject:", v42);

      }
      v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v39);
  }

  if (objc_msgSend(v3, "count"))
    objc_msgSend(v38, "addObjectsFromArray:", v3);
  v43 = (void *)objc_msgSend(v38, "copy", v45);

  return v43;
}

uint64_t __60__PKPaymentTransaction_transactionAmountsForMultipleAmounts__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  if (v7 > v8)
    return -1;
  else
    return v7 < v8;
}

- (id)dictionaryOfFormattedMultipleAmountTotalsByRealCurrency
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
  void *v13;
  void *v14;
  void *v15;
  NSDecimalNumber *amount;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NSString *v23;
  NSDecimalNumber *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[PKPaymentTransaction transactionAmountsForMultipleAmounts](self, "transactionAmountsForMultipleAmounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v9, "amount");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currency");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("XXX")) & 1) == 0)
        {
          objc_msgSend(v9, "amount");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "amount");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v6);
  }

  if (self->_amount && self->_currencyCode)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    amount = self->_amount;
    if (v14)
    {
      objc_msgSend(v14, "decimalNumberByAdding:", amount);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, self->_currencyCode);

    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", amount, self->_currencyCode);
    }

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v3, "keyEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v23 = *(NSString **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v3, "objectForKeyedSubscript:", v23);
        v24 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v24, v23, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "absoluteValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "formattedStringValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "amount");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "pk_isNegativeNumber");

        if (v29)
        {
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v27);
          v30 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v30;
        }
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v27, v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }

  v31 = (void *)objc_msgSend(v33, "copy");
  return v31;
}

- (id)formattedStringForMultipleAmountsForPass:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  uint64_t v35;

  v4 = a3;
  -[PKPaymentTransaction transactionAmountsForMultipleAmounts](self, "transactionAmountsForMultipleAmounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = -[NSArray count](self->_plans, "count");
  if (!(v6 | v7))
    goto LABEL_23;
  v13 = v7;
  if (v6 < 2)
  {
    if (v6 == 1)
    {
      objc_msgSend(v5, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction _formatBalanceAdjustmentTransactionAmount:](self, "_formatBalanceAdjustmentTransactionAmount:", v14);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 <= 1)
      {
        if (v13 != 1)
          goto LABEL_19;
        v34 = CFSTR("TRANSACTION_MULTIPLE_AMOUNTS_PLUS_COMMUTE_PLAN");
      }
      else
      {
        v34 = CFSTR("TRANSACTION_MULTIPLE_AMOUNTS_PLUS_COMMUTE_PLANS");
      }
      PKPassLocalizedStringWithFormat(v34, v4, CFSTR("%@"), v28, v29, v30, v31, v32, (uint64_t)v33);
      v35 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v35;
      goto LABEL_19;
    }
    if (v7 >= 2)
    {
      PKPassLocalizedStringWithFormat(CFSTR("TRANSACTION_COMMUTE_PLANS_USED"), v4, 0, v8, v9, v10, v11, v12, 0);
LABEL_22:
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    if (v7 == 1)
    {
      PKPassLocalizedStringWithFormat(CFSTR("TRANSACTION_COMMUTE_PLAN_USED"), v4, 0, v8, v9, v10, v11, v12, 0);
      goto LABEL_22;
    }
LABEL_23:
    v33 = 0;
    goto LABEL_24;
  }
  -[PKPaymentTransaction _preformattedStringForMultipleAmounts](self, "_preformattedStringForMultipleAmounts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKPassLocalizedStringWithFormat(CFSTR("TRANSACTION_MULTIPLE_AMOUNTS_JOIN_STRING"), v4, 0, v15, v16, v17, v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (unint64_t)objc_msgSend(v14, "count") >= 2)
  {
    v27 = v21;
LABEL_14:
    v33 = v27;
    goto LABEL_15;
  }
  if (!v13)
  {
    PKPassLocalizedStringWithFormat(CFSTR("TRANSACTION_MULTIPLE_AMOUNTS_PLUS_OTHER"), v4, CFSTR("%@"), v22, v23, v24, v25, v26, (uint64_t)v21);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v33 = 0;
LABEL_15:

LABEL_19:
LABEL_24:

  return v33;
}

- (id)_preformattedStringForMultiplePlans
{
  id v3;
  void *v4;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKPaymentTransaction plans](self, "plans", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "safelyAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_preformattedStringForMultipleAmounts
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentTransaction transactionAmountsForMultipleAmounts](self, "transactionAmountsForMultipleAmounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "amount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "formattedStringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = v10;
          if (v11 != &stru_1E2ADF4C0)
          {
            v12 = v11;
            v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", &stru_1E2ADF4C0);

            if ((v13 & 1) == 0)
              objc_msgSend(v3, "addObject:", v12);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (BOOL)isZeroTransaction
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PKPaymentTransaction amount](self, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "pk_isZeroNumber"))
  {
    v6 = 0;
  }
  else
  {
    -[PKPaymentTransaction amounts](self, "amounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") == 0;

  }
  return v6;
}

- (NSString)displayLocation
{
  unint64_t v3;
  void *v4;

  v3 = -[PKPaymentTransaction effectiveTransactionSource](self, "effectiveTransactionSource");
  if (v3 <= 8 && (((1 << v3) & 0x1D8) != 0 || v3 == 2 && (!self->_releasedData || !self->_requiresLocation)))
  {
    v4 = 0;
  }
  else
  {
    PKMerchantFormattedLocationForTransaction(self->_merchant, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (CLLocation)location
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  -[PKPaymentTransaction locationLatitude](self, "locationLatitude");
  v4 = v3;
  -[PKPaymentTransaction locationLongitude](self, "locationLongitude");
  v6 = CLLocationCoordinate2DMake(v4, v5);
  -[PKPaymentTransaction locationAltitude](self, "locationAltitude");
  v8 = v7;
  -[PKPaymentTransaction locationHorizontalAccuracy](self, "locationHorizontalAccuracy");
  v10 = v9;
  -[PKPaymentTransaction locationVerticalAccuracy](self, "locationVerticalAccuracy");
  v12 = v11;
  -[PKPaymentTransaction locationDate](self, "locationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6.latitude == 0.0 && v6.longitude == 0.0)
  {
    v14 = 0;
  }
  else
  {
    v14 = 0;
    if (CLLocationCoordinate2DIsValid(v6) && v10 > 0.0 && v13)
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v13, v6.latitude, v6.longitude, v8, v10, v12);
  }

  return (CLLocation *)v14;
}

- (void)setLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  -[PKPaymentTransaction setLocationLatitude:](self, "setLocationLatitude:");
  -[PKPaymentTransaction setLocationLongitude:](self, "setLocationLongitude:", v6);
  objc_msgSend(v4, "altitude");
  -[PKPaymentTransaction setLocationAltitude:](self, "setLocationAltitude:");
  objc_msgSend(v4, "horizontalAccuracy");
  -[PKPaymentTransaction setLocationHorizontalAccuracy:](self, "setLocationHorizontalAccuracy:");
  objc_msgSend(v4, "verticalAccuracy");
  -[PKPaymentTransaction setLocationVerticalAccuracy:](self, "setLocationVerticalAccuracy:");
  objc_msgSend(v4, "timestamp");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaymentTransaction setLocationDate:](self, "setLocationDate:", v7);
}

- (NSDecimalNumber)rewardsTotalAmount
{
  NSDecimalNumber *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = self->_rewardsTotalAmount;
  -[PKPaymentTransactionRewards rewardsItems](self->_rewards, "rewardsItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPaymentTransactionRewards rewardsItems](self->_rewards, "rewardsItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v5 = (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10++), "state") == 3) & v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSDecimalNumber compare:](v3, "compare:", v11);

    if (v12 == 1)
    {
      -[NSDecimalNumber pk_negativeValue](v3, "pk_negativeValue");
      v13 = objc_claimAutoreleasedReturnValue();

      v3 = (NSDecimalNumber *)v13;
    }
  }
  return v3;
}

- (CLLocation)preferredLocation
{
  unint64_t v3;
  void *v4;
  void *v5;

  if (-[PKMerchant useRawMerchantData](self->_merchant, "useRawMerchantData"))
  {
    v3 = -[PKPaymentTransaction effectiveTransactionSource](self, "effectiveTransactionSource");
  }
  else
  {
    -[PKMerchant mapsMerchant](self->_merchant, "mapsMerchant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = -[PKPaymentTransaction effectiveTransactionSource](self, "effectiveTransactionSource");
    if (v5)
      return (CLLocation *)v5;
  }
  if (v3 == 5)
  {
    v5 = 0;
  }
  else
  {
    -[PKPaymentTransaction location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CLLocation *)v5;
}

- (void)setPaymentHash:(id)a3
{
  NSString *v4;
  NSString *paymentHash;

  objc_msgSend(a3, "uppercaseString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  paymentHash = self->_paymentHash;
  self->_paymentHash = v4;

}

- (BOOL)hasTransactionSource
{
  return -[PKPaymentTransaction transactionSource](self, "transactionSource") != 0;
}

- (unint64_t)effectiveTransactionSource
{
  unint64_t result;

  result = self->_transactionSource;
  if (!result)
    return self->_cardType;
  return result;
}

- (BOOL)hasEffectiveTransactionSource
{
  return -[PKPaymentTransaction effectiveTransactionSource](self, "effectiveTransactionSource") != 0;
}

- (BOOL)hasBackingData
{
  unint64_t transactionType;

  transactionType = self->_transactionType;
  if (transactionType > 0xF)
    return 0;
  if (((1 << transactionType) & 0x1FFB) != 0)
    return self->_hasNotificationServiceData;
  return 1;
}

- (BOOL)supportsFuzzyMatching
{
  unint64_t v3;
  unint64_t transactionType;
  BOOL result;
  BOOL v6;
  BOOL v7;

  v3 = -[PKPaymentTransaction effectiveTransactionSource](self, "effectiveTransactionSource");
  result = (v3 == 7 || !v3)
        && (transactionType = self->_transactionType, transactionType - 3 >= 0x14)
        && (transactionType >= 3 ? (v6 = v3 == 7) : (v6 = 1), !v6 ? (v7 = v3 == 0) : (v7 = 1), v7)
        && self->_hasNotificationServiceData;
  return result;
}

- (BOOL)fullyProcessed
{
  return self->_processedForLocation && self->_processedForStations && self->_processedForMerchantCleanup;
}

- (NSString)associatedReceiptUniqueID
{
  NSString *receiptIdentifier;
  void *receiptProviderIdentifier;

  receiptIdentifier = self->_receiptIdentifier;
  if (receiptIdentifier)
  {
    receiptProviderIdentifier = self->_receiptProviderIdentifier;
    if (receiptProviderIdentifier)
    {
      PKGenerateTransactionReceiptUniqueID(receiptProviderIdentifier, receiptIdentifier);
      receiptProviderIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    receiptProviderIdentifier = 0;
  }
  return (NSString *)receiptProviderIdentifier;
}

- (BOOL)updateReasonIsInitialDownload
{
  return objc_msgSend((id)objc_opt_class(), "updateReasonIsInitialDownload:", self->_updateReasons);
}

+ (BOOL)updateReasonIsInitialDownload:(unint64_t)a3
{
  return (a3 & 0x10024) != 0;
}

- (void)addUpdateReasons:(unint64_t)a3
{
  self->_updateReasons |= a3;
}

- (id)updateReasonsDescription
{
  id v3;
  unint64_t updateReasons;
  int v5;
  uint64_t i;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  updateReasons = self->_updateReasons;
  if (updateReasons)
  {
    v5 = 1;
    for (i = 1; i <= updateReasons; i = 1 << v5++)
    {
      if ((i & updateReasons) != 0)
      {
        if (i > 511)
        {
          if (i < 0x2000)
          {
            if (i > 2047)
            {
              if (i == 2048)
              {
                v7 = CFSTR("TransitAppletState");
                goto LABEL_42;
              }
              if (i == 4096)
              {
                v7 = CFSTR("InitialNotificationServiceUpdate");
                goto LABEL_42;
              }
            }
            else
            {
              if (i == 512)
              {
                v7 = CFSTR("PeerPaymentMessageReceivedDate");
                goto LABEL_42;
              }
              if (i == 1024)
              {
                v7 = CFSTR("FelicaAppletState");
                goto LABEL_42;
              }
            }
          }
          else if (i < 0x8000)
          {
            if (i == 0x2000)
            {
              v7 = CFSTR("AnsweredQuestion");
              goto LABEL_42;
            }
            if (i == 0x4000)
            {
              v7 = CFSTR("MapsReprocessing");
              goto LABEL_42;
            }
          }
          else
          {
            switch(i)
            {
              case 0x8000:
                v7 = CFSTR("TransactionAuthentication");
                goto LABEL_42;
              case 0x10000:
                goto LABEL_14;
              case 0x20000:
                objc_msgSend(v3, "addObject:", CFSTR("BarcodeDisplay"));
LABEL_14:
                v7 = CFSTR("UploadAfterReset");
LABEL_42:
                objc_msgSend(v3, "addObject:", v7);
                updateReasons = self->_updateReasons;
                break;
            }
          }
        }
        else
        {
          if (i <= 31)
          {
            v7 = CFSTR("ContactlessInterfaceData");
            switch(i)
            {
              case 1:
                goto LABEL_42;
              case 2:
                v7 = CFSTR("InAppAuthorizationData");
                goto LABEL_42;
              case 3:
              case 5:
              case 6:
              case 7:
                continue;
              case 4:
                v7 = CFSTR("InitialCloudKitSync");
                goto LABEL_42;
              case 8:
                v7 = CFSTR("CloudKitDeviceDataRecordChange");
                goto LABEL_42;
              default:
                if (i != 16)
                  continue;
                v7 = CFSTR("CloudKitTransactionRecordChange");
                break;
            }
            goto LABEL_42;
          }
          if (i > 127)
          {
            if (i == 128)
            {
              v7 = CFSTR("TransactionProcessor");
              goto LABEL_42;
            }
            if (i == 256)
            {
              v7 = CFSTR("PeerPaymentMemo");
              goto LABEL_42;
            }
          }
          else
          {
            if (i == 32)
            {
              v7 = CFSTR("CloudKitFetchAllRecords");
              goto LABEL_42;
            }
            if (i == 64)
            {
              v7 = CFSTR("NotificationServiceUpdate");
              goto LABEL_42;
            }
          }
        }
      }
    }
  }
  objc_msgSend(v3, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  if (PKTransactionDetailedLoggingEnabled())
  {
    -[PKPaymentTransaction dictionaryRepresentation](self, "dictionaryRepresentation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    else
      v5 = 0;
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v17, self, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v6 = (void *)MEMORY[0x19400CFE8]();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; Identifier: %@, Service Identifier: %@, Payment Hash: %@"),
      v8,
      self,
      self->_identifier,
      self->_serviceIdentifier,
      self->_paymentHash);

    -[PKPaymentTransaction _transactionTypeString](self, "_transactionTypeString");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      objc_msgSend(v3, "appendFormat:", CFSTR(", Type: %@"), v9);
    -[PKPaymentTransaction _transitSubtypeString](self, "_transitSubtypeString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v3, "appendFormat:", CFSTR(", Subtype: %@"), v11);
    PKPaymentTransactionStatusToString(-[PKPaymentTransaction transactionStatus](self, "transactionStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v3, "appendFormat:", CFSTR(", Status: %@"), v12);
    -[PKPaymentTransaction _transactionSourceString](self, "_transactionSourceString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v3, "appendFormat:", CFSTR(", Source: %@"), v13);
    if (self->_currencyCode)
      objc_msgSend(v3, "appendFormat:", CFSTR(", Currency: %@"), self->_currencyCode);
    if (self->_requestDeviceScoreIdentifier)
      objc_msgSend(v3, "appendFormat:", CFSTR(", Request Device Score Identifier: %@"), self->_requestDeviceScoreIdentifier);
    if (self->_sendDeviceScoreIdentifier)
      objc_msgSend(v3, "appendFormat:", CFSTR(", Send Device Score Identifier: %@"), self->_sendDeviceScoreIdentifier);
    objc_msgSend(v3, "appendString:", CFSTR(">"));

    objc_autoreleasePoolPop(v6);
    v14 = (void *)objc_msgSend(v3, "copy");
  }

  return v14;
}

- (id)_transactionSourceString
{
  unint64_t transactionSource;

  transactionSource = self->_transactionSource;
  if (transactionSource > 8)
    return 0;
  else
    return off_1E2ADAE18[transactionSource];
}

- (id)_transactionTypeString
{
  unint64_t v2;

  v2 = -[PKPaymentTransaction transactionType](self, "transactionType");
  if (v2 > 0x16)
    return 0;
  else
    return off_1E2ADAE60[v2];
}

- (id)_transitSubtypeString
{
  uint64_t v3;
  id result;
  __CFString *v5;

  if (-[PKPaymentTransaction transactionType](self, "transactionType") != 2)
    return 0;
  v3 = -[PKPaymentTransaction transitType](self, "transitType");
  if (v3 <= 512)
  {
    switch(v3)
    {
      case 0:
        result = CFSTR("unknown");
        break;
      case 1:
        result = CFSTR("transit");
        break;
      case 2:
        result = CFSTR("metro");
        break;
      case 3:
        result = CFSTR("bus");
        break;
      case 4:
        result = CFSTR("train");
        break;
      case 5:
        result = CFSTR("other");
        break;
      case 6:
        result = CFSTR("special");
        break;
      case 7:
        result = CFSTR("lightrail");
        break;
      case 8:
        result = CFSTR("cableCar");
        break;
      default:
        switch(v3)
        {
          case 257:
            result = CFSTR("shinkansen");
            break;
          case 258:
            result = CFSTR("maglev");
            break;
          case 259:
            result = CFSTR("taxi");
            break;
          case 260:
            result = CFSTR("ferry");
            break;
          case 261:
            result = CFSTR("bike");
            break;
          default:
            return 0;
        }
        break;
    }
  }
  else
  {
    switch(v3)
    {
      case 513:
        result = CFSTR("deposit");
        break;
      case 514:
        result = CFSTR("refund");
        break;
      case 515:
        result = CFSTR("purchase");
        break;
      case 516:
        result = CFSTR("withdrawal");
        break;
      case 517:
        result = CFSTR("cardRead");
        break;
      case 518:
        result = CFSTR("renewal");
        break;
      default:
        v5 = CFSTR("metroUpgrade");
        if (v3 != 1026)
          v5 = 0;
        if (v3 == 1025)
          result = CFSTR("greenCar");
        else
          result = v5;
        break;
    }
  }
  return result;
}

+ (id)transactionNotificationStatusStringForTransaction:(id)a3 personContact:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  __CFString *v13;

  v5 = a3;
  objc_msgSend(a4, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "transactionStatus");
  if ((unint64_t)(v7 + 1) > 9)
  {
    v9 = 0;
    goto LABEL_12;
  }
  if (((1 << (v7 + 1)) & 0x3E7) == 0)
  {
    if (v7 == 2)
    {
      if (v6)
      {
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_DECLINED"), CFSTR("%@"), v6);
        goto LABEL_10;
      }
      v13 = CFSTR("PAYMENT_TRANSACTION_DECLINED");
    }
    else
    {
      if (v6)
      {
        PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_REFUNDED"), CFSTR("%@"), v6);
        goto LABEL_10;
      }
      v13 = CFSTR("PAYMENT_TRANSACTION_REFUND");
    }
    PKLocalizedPaymentString(&v13->isa, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v8 = objc_msgSend(v5, "transactionType");
  v9 = 0;
  v10 = v8 == 13 || v8 == 0;
  if (v10 && v6)
  {
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_TRANSACTION_NOTIFICATION_FAMILY_MEMBER_PURCHASE_BY"), CFSTR("%@"), v6);
LABEL_10:
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v9 = (void *)v11;
  }
LABEL_12:

  return v9;
}

- (PKCurrencyAmount)currencyAmount
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *amount;
  void *v5;

  if (!self->_amount)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_currencyCode, "length");
  if (v3)
  {
    amount = self->_amount;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(amount) = -[NSDecimalNumber isEqualToNumber:](amount, "isEqualToNumber:", v5);

    if ((amount & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_amount, self->_currencyCode, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (PKCurrencyAmount)nominalCurrencyAmount
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *nominalAmount;
  void *v5;

  if (!self->_nominalAmount)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_currencyCode, "length");
  if (v3)
  {
    nominalAmount = self->_nominalAmount;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(nominalAmount) = -[NSDecimalNumber isEqualToNumber:](nominalAmount, "isEqualToNumber:", v5);

    if ((nominalAmount & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_nominalAmount, self->_currencyCode, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (PKCurrencyAmount)subtotalCurrencyAmount
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *subtotalAmount;
  void *v5;

  if (!self->_subtotalAmount)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_currencyCode, "length");
  if (v3)
  {
    subtotalAmount = self->_subtotalAmount;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(subtotalAmount) = -[NSDecimalNumber isEqualToNumber:](subtotalAmount, "isEqualToNumber:", v5);

    if ((subtotalAmount & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_subtotalAmount, self->_currencyCode, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (PKCurrencyAmount)primaryFundingSourceCurrencyAmount
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *primaryFundingSourceAmount;
  void *v5;

  if (!self->_primaryFundingSourceAmount)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_primaryFundingSourceCurrencyCode, "length");
  if (v3)
  {
    primaryFundingSourceAmount = self->_primaryFundingSourceAmount;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(primaryFundingSourceAmount) = -[NSDecimalNumber isEqualToNumber:](primaryFundingSourceAmount, "isEqualToNumber:", v5);

    if ((primaryFundingSourceAmount & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_primaryFundingSourceAmount, self->_primaryFundingSourceCurrencyCode, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (PKCurrencyAmount)secondaryFundingSourceCurrencyAmount
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *secondaryFundingSourceAmount;
  void *v5;

  if (!self->_secondaryFundingSourceAmount)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_secondaryFundingSourceCurrencyCode, "length");
  if (v3)
  {
    secondaryFundingSourceAmount = self->_secondaryFundingSourceAmount;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(secondaryFundingSourceAmount) = -[NSDecimalNumber isEqualToNumber:](secondaryFundingSourceAmount, "isEqualToNumber:", v5);

    if ((secondaryFundingSourceAmount & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_secondaryFundingSourceAmount, self->_secondaryFundingSourceCurrencyCode, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (PKCurrencyAmount)rewardsTotalCurrencyAmount
{
  PKCurrencyAmount *v3;
  NSDecimalNumber *rewardsTotalAmount;
  void *v5;

  if (!self->_rewardsTotalAmount)
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  v3 = -[NSString length](self->_rewardsTotalCurrencyCode, "length");
  if (v3)
  {
    rewardsTotalAmount = self->_rewardsTotalAmount;
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(rewardsTotalAmount) = -[NSDecimalNumber isEqualToNumber:](rewardsTotalAmount, "isEqualToNumber:", v5);

    if ((rewardsTotalAmount & 1) == 0)
    {
      v3 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", self->_rewardsTotalAmount, self->_rewardsTotalCurrencyCode, 0);
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (id)formattedAwards
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_barcodeIdentifier && -[NSArray count](self->_awards, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_awards;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v3, "length", (_QWORD)v13))
            objc_msgSend(v3, "appendString:", CFSTR("\n"));
          objc_msgSend(v9, "formattedStringValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v10);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    v11 = (void *)objc_msgSend(v3, "copy");
    return v11;
  }
  else if (self->_paymentRewardsRedemption)
  {
    PKLocalizedPayWithPointsString(CFSTR("TRANSACTION_NOTIFICATION_REWARDS_BADGE_TEXT"), 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
}

- (NSString)formattedBalanceAdjustmentAmount
{
  void *v3;
  void *v4;

  -[PKPaymentTransaction currencyAmount](self, "currencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction _formatBalanceAdjustmentAmount:](self, "_formatBalanceAdjustmentAmount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)formattedBalanceAdjustmentSubtotalAmount
{
  void *v3;
  void *v4;

  -[PKPaymentTransaction subtotalCurrencyAmount](self, "subtotalCurrencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction _formatBalanceAdjustmentAmount:](self, "_formatBalanceAdjustmentAmount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)formattedBalanceAdjustmentAbsoluteAmount
{
  void *v3;
  void *v4;
  NSDecimalNumber *v5;
  NSString *v6;
  void *v7;
  void *v8;

  -[PKPaymentTransaction currencyAmount](self, "currencyAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_absoluteValue");
  v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currency");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentTransaction _formatBalanceAdjustmentAmount:](self, "_formatBalanceAdjustmentAmount:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (id)formattedBalanceAdjustmentForAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return (id)objc_msgSend(a1, "formattedBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:featureIdentifier:isBankConnectTransaction:bankConnectCreditDebitIndicator:pending:", a3, a4, a5, a6, 0, 0, 1, v7);
}

+ (id)formattedBalanceAdjustmentForTransactionAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 isBankConnectTransaction:(BOOL)a7 bankConnectCreditDebitIndicator:(int64_t)a8 featureIdentifier:(unint64_t)a9
{
  _BOOL8 v10;
  id v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v20;

  v10 = a7;
  v15 = a3;
  objc_msgSend(v15, "amount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isPending");

  LOBYTE(v20) = v17;
  objc_msgSend(a1, "formattedBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:featureIdentifier:isBankConnectTransaction:bankConnectCreditDebitIndicator:pending:", v16, a4, a5, a6, a9, v10, a8, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)isPositiveBalanceAdjustmentForCurrencyAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 isBankConnectTransaction:(BOOL)a7 bankConnectCreditDebitIndicator:(int64_t)a8 featureIdentifier:(unint64_t)a9
{
  _BOOL4 v10;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int64_t v20;

  v10 = a7;
  v14 = a3;
  v15 = v14;
  if (v10)
  {
    v16 = a8 == 1;
LABEL_3:
    LOBYTE(a4) = v16;
  }
  else
  {
    objc_msgSend(v14, "amount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "compare:", v18);

    if (v19 == -1 || a4 == 3 && a6 == 2)
    {
      LOBYTE(a4) = 1;
    }
    else
    {
      v20 = a4 - 6;
      LOBYTE(a4) = 1;
      switch(v20)
      {
        case 0:
        case 2:
        case 3:
        case 4:
          break;
        case 1:
          if ((unint64_t)a5 >= 0x13)
            LOBYTE(a4) = 0;
          else
            LODWORD(a4) = (0x43A9Au >> a5) & 1;
          break;
        case 5:
          v16 = a9 == 5;
          goto LABEL_3;
        default:
          LOBYTE(a4) = 0;
          break;
      }
    }
  }

  return a4;
}

+ (id)formattedBalanceAdjustmentForCurrencyAmount:(id)a3 transactionType:(int64_t)a4 adjustmentType:(int64_t)a5 peerPaymentType:(int64_t)a6 featureIdentifier:(unint64_t)a7 isBankConnectTransaction:(BOOL)a8 bankConnectCreditDebitIndicator:(int64_t)a9 pending:(BOOL)a10
{
  _BOOL8 v10;
  id v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v26;

  v10 = a8;
  v15 = a3;
  if (!v15)
    return 0;
  v16 = v15;
  v17 = +[PKPaymentTransaction isPositiveBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:isBankConnectTransaction:bankConnectCreditDebitIndicator:featureIdentifier:](PKPaymentTransaction, "isPositiveBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:isBankConnectTransaction:bankConnectCreditDebitIndicator:featureIdentifier:", v15, a4, a5, a6, v10, a9, a7);
  objc_msgSend(v16, "amount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "compare:", v19);

  if (v20 == -1)
  {
    objc_msgSend(v16, "negativeValue");
    v21 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v21;
  }
  objc_msgSend(v16, "formattedStringValue");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (!a10)
  {
    if (v17)
    {
      if (a7 == 5)
        goto LABEL_12;
      PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v22);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a7 != 5)
        goto LABEL_12;
      objc_msgSend(v16, "negativeValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "formattedStringValue");
      v24 = objc_claimAutoreleasedReturnValue();

      v23 = v26;
    }

    v23 = (void *)v24;
  }
LABEL_12:

  return v23;
}

- (id)_formatBalanceAdjustmentTransactionAmount:(id)a3
{
  int64_t transactionType;
  int64_t adjustmentType;
  int64_t peerPaymentType;
  _BOOL8 isBankConnectTransaction;
  int64_t bankConnectCreditDebitIndicator;
  id v9;
  void *v10;

  transactionType = self->_transactionType;
  adjustmentType = self->_adjustmentType;
  peerPaymentType = self->_peerPaymentType;
  isBankConnectTransaction = self->_isBankConnectTransaction;
  bankConnectCreditDebitIndicator = self->_bankConnectCreditDebitIndicator;
  v9 = a3;
  +[PKPaymentTransaction formattedBalanceAdjustmentForTransactionAmount:transactionType:adjustmentType:peerPaymentType:isBankConnectTransaction:bankConnectCreditDebitIndicator:featureIdentifier:](PKPaymentTransaction, "formattedBalanceAdjustmentForTransactionAmount:transactionType:adjustmentType:peerPaymentType:isBankConnectTransaction:bankConnectCreditDebitIndicator:featureIdentifier:", v9, transactionType, adjustmentType, peerPaymentType, isBankConnectTransaction, bankConnectCreditDebitIndicator, -[PKPaymentTransaction featureIdentifier](self, "featureIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_formatBalanceAdjustmentAmount:(id)a3
{
  int64_t transactionType;
  int64_t adjustmentType;
  int64_t peerPaymentType;
  id v7;
  void *v8;
  uint64_t v10;

  transactionType = self->_transactionType;
  adjustmentType = self->_adjustmentType;
  peerPaymentType = self->_peerPaymentType;
  v7 = a3;
  LOBYTE(v10) = 0;
  +[PKPaymentTransaction formattedBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:featureIdentifier:isBankConnectTransaction:bankConnectCreditDebitIndicator:pending:](PKPaymentTransaction, "formattedBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:featureIdentifier:isBankConnectTransaction:bankConnectCreditDebitIndicator:pending:", v7, transactionType, adjustmentType, peerPaymentType, -[PKPaymentTransaction featureIdentifier](self, "featureIdentifier"), self->_isBankConnectTransaction, self->_bankConnectCreditDebitIndicator, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CLLocation)startStationLocation
{
  void *v2;

  if (!self->_startStationCode || self->_startStationLatitude == 0.0 || self->_startStationLongitude == 0.0)
    v2 = 0;
  else
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", self->_startStationLatitude, self->_startStationLongitude);
  return (CLLocation *)v2;
}

- (void)setStartStationLocation:(id)a3
{
  double v4;
  double v5;

  objc_msgSend(a3, "coordinate");
  self->_startStationLatitude = v4;
  self->_startStationLongitude = v5;
}

- (CLLocation)endStationLocation
{
  void *v2;

  if (!self->_endStationCode || self->_endStationLatitude == 0.0 || self->_endStationLongitude == 0.0)
    v2 = 0;
  else
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", self->_endStationLatitude, self->_endStationLongitude);
  return (CLLocation *)v2;
}

- (void)setEndStationLocation:(id)a3
{
  double v4;
  double v5;

  objc_msgSend(a3, "coordinate");
  self->_endStationLatitude = v4;
  self->_endStationLongitude = v5;
}

- (id)_commutePlanInformationForPass:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_plans)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = self->_plans;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v10), "label");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "safelyAddObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count") == 1)
      v17 = CFSTR("TRANSACTION_COMMUTE_NAMED_PLAN_USED");
    else
      v17 = CFSTR("TRANSACTION_COMMUTE_NAMED_PLANS_USED");
    PKPassLocalizedStringWithFormat(v17, v4, 0, v12, v13, v14, v15, v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKPassLocalizedStringWithFormat(CFSTR("TRANSACTION_COMMUTE_PLAN_LOCALIZED_JOINING_CHARACTER"), v4, 0, v19, v20, v21, v22, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    PKStringWithValidatedFormat(v18, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)formattedTransitTransactionMessageForPass:(id)a3 suppressNoChargeAmount:(BOOL)a4
{
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  id v18;
  __CFString *v19;
  __CFString *v20;

  v6 = a3;
  v7 = -[PKPaymentTransaction isZeroTransaction](self, "isZeroTransaction");
  v8 = -[PKPaymentTransaction transitType](self, "transitType");
  -[PKPaymentTransaction startStation](self, "startStation");
  v9 = objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction endStation](self, "endStation");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    PKLocalizedPaymentString(CFSTR("TRANSIT_TRANSACTION_STATIONS_FORMAT"), CFSTR("%1$@%2$@"), v9, v10);
LABEL_4:
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v14 = v12;
    goto LABEL_11;
  }
  if (v9 | v10)
  {
    if (v9)
      v13 = (void *)v9;
    else
      v13 = (void *)v10;
    v12 = v13;
    goto LABEL_10;
  }
  if (!v7)
    goto LABEL_27;
  v14 = 0;
  if (v8 <= 256)
  {
    if ((unint64_t)(v8 - 1) >= 8)
      goto LABEL_11;
LABEL_17:
    -[PKPaymentTransaction _commutePlanInformationForPass:](self, "_commutePlanInformationForPass:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPaymentTransaction enRoute](self, "enRoute") || !v17)
    {
      if (self->_transactionStatus)
      {
        v14 = 0;
        if (-[PKPaymentTransaction enRoute](self, "enRoute") || a4)
          goto LABEL_31;
        v19 = CFSTR("TRANSIT_NOTIFICATION_NO_CHARGE");
      }
      else
      {
        v19 = CFSTR("TRANSIT_NOTIFICATION_PENDING");
      }
      PKLocalizedPaymentString(&v19->isa, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v17;
    }
    v14 = v18;
LABEL_31:

    goto LABEL_11;
  }
  if ((unint64_t)(v8 - 257) < 5)
    goto LABEL_17;
  if (v8 != 515)
  {
    if (v8 != 517)
      goto LABEL_11;
    if (a4)
    {
LABEL_27:
      v14 = 0;
      goto LABEL_11;
    }
  }
  if (!self->_transactionStatus)
  {
    v20 = CFSTR("TRANSIT_NOTIFICATION_PENDING");
    goto LABEL_37;
  }
  v14 = 0;
  if (!-[PKPaymentTransaction enRoute](self, "enRoute") && !a4)
  {
    v20 = CFSTR("TRANSIT_NOTIFICATION_NO_CHARGE");
LABEL_37:
    PKLocalizedPaymentString(&v20->isa, 0);
    goto LABEL_4;
  }
LABEL_11:
  v15 = v14;

  return v15;
}

- (NSSet)answeredQuestionsOnThisDevice
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_questions;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "answered", (_QWORD)v12)
          && objc_msgSend(v9, "answeredOnThisDevice"))
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = (void *)objc_msgSend(v3, "copy");
  else
    v10 = 0;

  return (NSSet *)v10;
}

- (NSSet)unansweredQuestions
{
  id v3;
  void *v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSDate *expirationDate;
  double v12;
  double v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_questions;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
    goto LABEL_14;
  v7 = v6;
  v8 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if ((objc_msgSend(v10, "answered", (_QWORD)v16) & 1) == 0)
      {
        expirationDate = self->_expirationDate;
        if (expirationDate)
        {
          -[NSDate timeIntervalSinceDate:](expirationDate, "timeIntervalSinceDate:", v4);
          if (v12 >= 0.0)
            continue;
          if (self->_expirationDate)
            goto LABEL_11;
        }
        objc_msgSend(v4, "timeIntervalSinceDate:", self->_transactionDate);
        if (v13 <= 259200.0)
LABEL_11:
          objc_msgSend(v3, "addObject:", v10);
      }
    }
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);
LABEL_14:

  if (objc_msgSend(v3, "count"))
    v14 = (void *)objc_msgSend(v3, "copy");
  else
    v14 = 0;

  return (NSSet *)v14;
}

- (void)answeredQuestion:(unint64_t)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
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
  v5 = self->_questions;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v11) == a3)
        {
          objc_msgSend(v10, "setAnswered:", 1);
          objc_msgSend(v10, "setAnsweredOnThisDevice:", 1);
        }
      }
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[PKPaymentTransaction addUpdateReasons:](self, "addUpdateReasons:", 0x2000);
}

- (BOOL)reviewed
{
  NSSet *v2;
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
  v2 = self->_questions;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "answered", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)disputeStatus
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKPaymentTransaction latestDisputeEvent](self, "latestDisputeEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "status");
  else
    v4 = 0;

  return v4;
}

- (PKAccountServicingEventStatusDetails)disputeStatusDetails
{
  void *v2;
  void *v3;

  -[PKPaymentTransaction latestDisputeEvent](self, "latestDisputeEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKAccountServicingEventStatusDetails *)v3;
}

- (unint64_t)disputeType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKPaymentTransaction latestDisputeEvent](self, "latestDisputeEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "activityType");
  else
    v4 = 0;

  return v4;
}

- (NSDate)disputeOpenDate
{
  void *v2;
  void *v3;

  -[PKPaymentTransaction latestDisputeEvent](self, "latestDisputeEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)disputeLastUpdatedDate
{
  void *v2;
  void *v3;

  -[PKPaymentTransaction latestDisputeEvent](self, "latestDisputeEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastUpdatedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (PKAccountServicingEvent)latestDisputeEvent
{
  NSOrderedSet *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_servicingEvents;
  v3 = (void *)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "type", (_QWORD)v9) == 4)
        {
          objc_msgSend(v6, "items");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "anyObject");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (PKAccountServicingEvent *)v3;
}

- (NSNumber)isMerchantTokenTransaction
{
  return self->_isMerchantTokenTransaction;
}

- (BOOL)impactsPromotionProgress
{
  unint64_t transactionType;
  BOOL v4;
  uint64_t v5;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  transactionType = self->_transactionType;
  v4 = transactionType > 0xE;
  v5 = (1 << transactionType) & 0x4003;
  v7 = !v4 && v5 != 0 && (self->_transactionStatus & 0xFFFFFFFFFFFFFFFDLL) == 1;
  -[PKPaymentTransactionRewards promotionalRewardsItems](self->_rewards, "promotionalRewardsItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[PKPaymentTransactionRewards rewardsItems](self->_rewards, "rewardsItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pk_containsObjectPassingTest:", &__block_literal_global_848);

  -[PKPaymentTransactionRewards rewardsItems](self->_rewardsInProgress, "rewardsItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v7)
    return 0;
  if (v9)
    v14 = 1;
  else
    v14 = v11;
  return v13 || v14;
}

BOOL __48__PKPaymentTransaction_impactsPromotionProgress__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

- (unint64_t)featureIdentifier
{
  unint64_t v2;

  v2 = self->_accountType - 1;
  if (v2 > 3)
    return 0;
  else
    return qword_190456300[v2];
}

- (BOOL)isDeletable
{
  return self->_transactionType == 15;
}

- (BOOL)_supportsServerFundingDescription
{
  return self->_recurring;
}

- (BOOL)isUnknownNearbyPeerPayment
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)subtotalAmount
{
  return self->_subtotalAmount;
}

- (void)setSubtotalAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDecimalNumber)amountAddedToAuth
{
  return self->_amountAddedToAuth;
}

- (void)setAmountAddedToAuth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)amounts
{
  return self->_amounts;
}

- (void)setAmounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)plans
{
  return self->_plans;
}

- (void)setPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)transactionStatusChangedDate
{
  return self->_transactionStatusChangedDate;
}

- (void)setTransactionStatusChangedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSDate)locationDate
{
  return self->_locationDate;
}

- (void)setLocationDate:(id)a3
{
  objc_storeStrong((id *)&self->_locationDate, a3);
}

- (double)locationLatitude
{
  return self->_locationLatitude;
}

- (void)setLocationLatitude:(double)a3
{
  self->_locationLatitude = a3;
}

- (double)locationLongitude
{
  return self->_locationLongitude;
}

- (void)setLocationLongitude:(double)a3
{
  self->_locationLongitude = a3;
}

- (double)locationAltitude
{
  return self->_locationAltitude;
}

- (void)setLocationAltitude:(double)a3
{
  self->_locationAltitude = a3;
}

- (double)locationHorizontalAccuracy
{
  return self->_locationHorizontalAccuracy;
}

- (void)setLocationHorizontalAccuracy:(double)a3
{
  self->_locationHorizontalAccuracy = a3;
}

- (double)locationVerticalAccuracy
{
  return self->_locationVerticalAccuracy;
}

- (void)setLocationVerticalAccuracy:(double)a3
{
  self->_locationVerticalAccuracy = a3;
}

- (BOOL)isCoarseLocation
{
  return self->_coarseLocation;
}

- (void)setCoarseLocation:(BOOL)a3
{
  self->_coarseLocation = a3;
}

- (int64_t)transitType
{
  return self->_transitType;
}

- (void)setTransitType:(int64_t)a3
{
  self->_transitType = a3;
}

- (unint64_t)transitModifiers
{
  return self->_transitModifiers;
}

- (void)setTransitModifiers:(unint64_t)a3
{
  self->_transitModifiers = a3;
}

- (BOOL)enRoute
{
  return self->_enRoute;
}

- (void)setEnRoute:(BOOL)a3
{
  self->_enRoute = a3;
}

- (NSString)stationCodeProvider
{
  return self->_stationCodeProvider;
}

- (void)setStationCodeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)cityCode
{
  return self->_cityCode;
}

- (void)setCityCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSData)startStationCode
{
  return self->_startStationCode;
}

- (void)setStartStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)startStation
{
  return self->_startStation;
}

- (void)setStartStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (double)startStationLatitude
{
  return self->_startStationLatitude;
}

- (void)setStartStationLatitude:(double)a3
{
  self->_startStationLatitude = a3;
}

- (double)startStationLongitude
{
  return self->_startStationLongitude;
}

- (void)setStartStationLongitude:(double)a3
{
  self->_startStationLongitude = a3;
}

- (NSData)endStationCode
{
  return self->_endStationCode;
}

- (void)setEndStationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)endStation
{
  return self->_endStation;
}

- (void)setEndStation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (double)endStationLatitude
{
  return self->_endStationLatitude;
}

- (void)setEndStationLatitude:(double)a3
{
  self->_endStationLatitude = a3;
}

- (double)endStationLongitude
{
  return self->_endStationLongitude;
}

- (void)setEndStationLongitude:(double)a3
{
  self->_endStationLongitude = a3;
}

- (BOOL)shouldSuppressDate
{
  return self->_shouldSuppressDate;
}

- (void)setShouldSuppressDate:(BOOL)a3
{
  self->_shouldSuppressDate = a3;
}

- (BOOL)suppressNotifications
{
  return self->_suppressNotifications;
}

- (void)setSuppressNotifications:(BOOL)a3
{
  self->_suppressNotifications = a3;
}

- (int64_t)adjustmentType
{
  return self->_adjustmentType;
}

- (void)setAdjustmentType:(int64_t)a3
{
  self->_adjustmentType = a3;
}

- (int64_t)adjustmentTypeReason
{
  return self->_adjustmentTypeReason;
}

- (void)setAdjustmentTypeReason:(int64_t)a3
{
  self->_adjustmentTypeReason = a3;
}

- (int64_t)topUpType
{
  return self->_topUpType;
}

- (void)setTopUpType:(int64_t)a3
{
  self->_topUpType = a3;
}

- (int64_t)peerPaymentType
{
  return self->_peerPaymentType;
}

- (void)setPeerPaymentType:(int64_t)a3
{
  self->_peerPaymentType = a3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)peerPaymentCounterpartHandle
{
  return self->_peerPaymentCounterpartHandle;
}

- (void)setPeerPaymentCounterpartHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)peerPaymentMemo
{
  return self->_peerPaymentMemo;
}

- (void)setPeerPaymentMemo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSDate)peerPaymentMessageReceivedDate
{
  return self->_peerPaymentMessageReceivedDate;
}

- (void)setPeerPaymentMessageReceivedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (PKPaymentTransactionForeignExchangeInformation)foreignExchangeInformation
{
  return self->_foreignExchangeInformation;
}

- (void)setForeignExchangeInformation:(id)a3
{
  objc_storeStrong((id *)&self->_foreignExchangeInformation, a3);
}

- (PKPaymentTransactionFees)fees
{
  return self->_fees;
}

- (void)setFees:(id)a3
{
  objc_storeStrong((id *)&self->_fees, a3);
}

- (NSString)localizedTypeDescription
{
  return self->_localizedTypeDescription;
}

- (void)setLocalizedTypeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTypeDescription, a3);
}

- (NSURL)bankConnectDigitalServicingURL
{
  return self->_bankConnectDigitalServicingURL;
}

- (void)setBankConnectDigitalServicingURL:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectDigitalServicingURL, a3);
}

- (NSURL)bankConnectPayNowURL
{
  return self->_bankConnectPayNowURL;
}

- (void)setBankConnectPayNowURL:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectPayNowURL, a3);
}

- (NSURL)bankConnectTransferFundsURL
{
  return self->_bankConnectTransferFundsURL;
}

- (void)setBankConnectTransferFundsURL:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectTransferFundsURL, a3);
}

- (NSURL)bankConnectPostInstallmentURL
{
  return self->_bankConnectPostInstallmentURL;
}

- (void)setBankConnectPostInstallmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectPostInstallmentURL, a3);
}

- (NSURL)bankConnectRedeemRewardsURL
{
  return self->_bankConnectRedeemRewardsURL;
}

- (void)setBankConnectRedeemRewardsURL:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectRedeemRewardsURL, a3);
}

- (BOOL)isBankConnectTransaction
{
  return self->_isBankConnectTransaction;
}

- (void)setIsBankConnectTransaction:(BOOL)a3
{
  self->_isBankConnectTransaction = a3;
}

- (BOOL)bankConnectTransactionWasClassifiedByMaps
{
  return self->_bankConnectTransactionWasClassifiedByMaps;
}

- (void)setBankConnectTransactionWasClassifiedByMaps:(BOOL)a3
{
  self->_bankConnectTransactionWasClassifiedByMaps = a3;
}

- (int64_t)bankConnectCreditDebitIndicator
{
  return self->_bankConnectCreditDebitIndicator;
}

- (void)setBankConnectCreditDebitIndicator:(int64_t)a3
{
  self->_bankConnectCreditDebitIndicator = a3;
}

- (BOOL)bankConnectRoundTransactionDate
{
  return self->_bankConnectRoundTransactionDate;
}

- (void)setBankConnectRoundTransactionDate:(BOOL)a3
{
  self->_bankConnectRoundTransactionDate = a3;
}

- (PKPaymentTransactionBankConnectMetadata)bankConnectMetadata
{
  return self->_bankConnectMetadata;
}

- (void)setBankConnectMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectMetadata, a3);
}

- (NSDecimalNumber)primaryFundingSourceAmount
{
  return self->_primaryFundingSourceAmount;
}

- (void)setPrimaryFundingSourceAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)primaryFundingSourceCurrencyCode
{
  return self->_primaryFundingSourceCurrencyCode;
}

- (void)setPrimaryFundingSourceCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSDecimalNumber)secondaryFundingSourceAmount
{
  return self->_secondaryFundingSourceAmount;
}

- (void)setSecondaryFundingSourceAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)secondaryFundingSourceCurrencyCode
{
  return self->_secondaryFundingSourceCurrencyCode;
}

- (void)setSecondaryFundingSourceCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (int64_t)secondaryFundingSourceNetwork
{
  return self->_secondaryFundingSourceNetwork;
}

- (void)setSecondaryFundingSourceNetwork:(int64_t)a3
{
  self->_secondaryFundingSourceNetwork = a3;
}

- (NSString)secondaryFundingSourceDPANSuffix
{
  return self->_secondaryFundingSourceDPANSuffix;
}

- (void)setSecondaryFundingSourceDPANSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSString)secondaryFundingSourceFPANIdentifier
{
  return self->_secondaryFundingSourceFPANIdentifier;
}

- (void)setSecondaryFundingSourceFPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (NSString)secondaryFundingSourceDescription
{
  return self->_secondaryFundingSourceDescription;
}

- (void)setSecondaryFundingSourceDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (int64_t)secondaryFundingSourceType
{
  return self->_secondaryFundingSourceType;
}

- (void)setSecondaryFundingSourceType:(int64_t)a3
{
  self->_secondaryFundingSourceType = a3;
}

- (NSUUID)requestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier;
}

- (void)setRequestDeviceScoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSUUID)sendDeviceScoreIdentifier
{
  return self->_sendDeviceScoreIdentifier;
}

- (void)setSendDeviceScoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (BOOL)deviceScoreIdentifiersRequired
{
  return self->_deviceScoreIdentifiersRequired;
}

- (void)setDeviceScoreIdentifiersRequired:(BOOL)a3
{
  self->_deviceScoreIdentifiersRequired = a3;
}

- (BOOL)deviceScoreIdentifiersSubmitted
{
  return self->_deviceScoreIdentifiersSubmitted;
}

- (void)setDeviceScoreIdentifiersSubmitted:(BOOL)a3
{
  self->_deviceScoreIdentifiersSubmitted = a3;
}

- (NSString)merchantProvidedTitle
{
  return self->_merchantProvidedTitle;
}

- (void)setMerchantProvidedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSString)merchantProvidedDescription
{
  return self->_merchantProvidedDescription;
}

- (void)setMerchantProvidedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void)setRewardsTotalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsTotalAmount, a3);
}

- (NSString)rewardsTotalCurrencyCode
{
  return self->_rewardsTotalCurrencyCode;
}

- (void)setRewardsTotalCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsTotalCurrencyCode, a3);
}

- (unint64_t)rewardsEligibilityReason
{
  return self->_rewardsEligibilityReason;
}

- (void)setRewardsEligibilityReason:(unint64_t)a3
{
  self->_rewardsEligibilityReason = a3;
}

- (PKPaymentTransactionRewards)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
  objc_storeStrong((id *)&self->_rewards, a3);
}

- (PKPaymentTransactionRewards)rewardsInProgress
{
  return self->_rewardsInProgress;
}

- (void)setRewardsInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsInProgress, a3);
}

- (unint64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(unint64_t)a3
{
  self->_cardType = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (NSString)lifecycleIdentifier
{
  return self->_lifecycleIdentifier;
}

- (void)setLifecycleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (NSString)authNetworkData
{
  return self->_authNetworkData;
}

- (void)setAuthNetworkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (NSString)clearingNetworkData
{
  return self->_clearingNetworkData;
}

- (void)setClearingNetworkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (void)setCardIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cardIdentifier, a3);
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dpanIdentifier, a3);
}

- (int64_t)paymentNetworkIdentifier
{
  return self->_paymentNetworkIdentifier;
}

- (void)setPaymentNetworkIdentifier:(int64_t)a3
{
  self->_paymentNetworkIdentifier = a3;
}

- (NSString)panIdentifier
{
  return self->_panIdentifier;
}

- (void)setPANIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_panIdentifier, a3);
}

- (void)setIsMerchantTokenTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_isMerchantTokenTransaction, a3);
}

- (NSString)cardNumberSuffix
{
  return self->_cardNumberSuffix;
}

- (void)setCardNumberSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_cardNumberSuffix, a3);
}

- (NSString)referenceIdentifier
{
  return self->_referenceIdentifier;
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (unint64_t)suppressBehavior
{
  return self->_suppressBehavior;
}

- (void)setSuppressBehavior:(unint64_t)a3
{
  self->_suppressBehavior = a3;
}

- (unint64_t)redemptionType
{
  return self->_redemptionType;
}

- (void)setRedemptionType:(unint64_t)a3
{
  self->_redemptionType = a3;
}

- (unint64_t)associatedFeatureIdentifier
{
  return self->_associatedFeatureIdentifier;
}

- (void)setAssociatedFeatureIdentifier:(unint64_t)a3
{
  self->_associatedFeatureIdentifier = a3;
}

- (NSSet)questions
{
  return self->_questions;
}

- (void)setQuestions:(id)a3
{
  objc_storeStrong((id *)&self->_questions, a3);
}

- (NSOrderedSet)servicingEvents
{
  return self->_servicingEvents;
}

- (void)setServicingEvents:(id)a3
{
  objc_storeStrong((id *)&self->_servicingEvents, a3);
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_storeStrong((id *)&self->_payments, a3);
}

- (NSArray)transfers
{
  return self->_transfers;
}

- (void)setTransfers:(id)a3
{
  objc_storeStrong((id *)&self->_transfers, a3);
}

- (PKPeerPaymentRecurringPayment)recurringPeerPayment
{
  return self->_recurringPeerPayment;
}

- (void)setRecurringPeerPayment:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPeerPayment, a3);
}

- (unint64_t)peerPaymentPaymentMode
{
  return self->_peerPaymentPaymentMode;
}

- (void)setPeerPaymentPaymentMode:(unint64_t)a3
{
  self->_peerPaymentPaymentMode = a3;
}

- (NSString)peerPaymentCounterpartImageRecordIdentifier
{
  return self->_peerPaymentCounterpartImageRecordIdentifier;
}

- (void)setPeerPaymentCounterpartImageRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentCounterpartImageRecordIdentifier, a3);
}

- (PKAccountEvent)redemptionEvent
{
  return self->_redemptionEvent;
}

- (void)setRedemptionEvent:(id)a3
{
  objc_storeStrong((id *)&self->_redemptionEvent, a3);
}

- (PKCreditInstallmentPlanPayment)installmentPayment
{
  return self->_installmentPayment;
}

- (void)setInstallmentPayment:(id)a3
{
  objc_storeStrong((id *)&self->_installmentPayment, a3);
}

- (PKCreditInstallmentPlan)installmentPlan
{
  return self->_installmentPlan;
}

- (void)setInstallmentPlan:(id)a3
{
  objc_storeStrong((id *)&self->_installmentPlan, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (BOOL)processedForLocation
{
  return self->_processedForLocation;
}

- (void)setProcessedForLocation:(BOOL)a3
{
  self->_processedForLocation = a3;
}

- (BOOL)processedForMerchantCleanup
{
  return self->_processedForMerchantCleanup;
}

- (void)setProcessedForMerchantCleanup:(BOOL)a3
{
  self->_processedForMerchantCleanup = a3;
}

- (BOOL)requiresMerchantReprocessing
{
  return self->_requiresMerchantReprocessing;
}

- (void)setRequiresMerchantReprocessing:(BOOL)a3
{
  self->_requiresMerchantReprocessing = a3;
}

- (NSDate)lastMerchantReprocessingDate
{
  return self->_lastMerchantReprocessingDate;
}

- (void)setLastMerchantReprocessingDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMerchantReprocessingDate, a3);
}

- (BOOL)processedForStations
{
  return self->_processedForStations;
}

- (void)setProcessedForStations:(BOOL)a3
{
  self->_processedForStations = a3;
}

- (BOOL)hasAssociatedPaymentApplication
{
  return self->_hasAssociatedPaymentApplication;
}

- (void)setHasAssociatedPaymentApplication:(BOOL)a3
{
  self->_hasAssociatedPaymentApplication = a3;
}

- (BOOL)hasNotificationServiceData
{
  return self->_hasNotificationServiceData;
}

- (void)setHasNotificationServiceData:(BOOL)a3
{
  self->_hasNotificationServiceData = a3;
}

- (BOOL)originatedByDevice
{
  return self->_originatedByDevice;
}

- (void)setOriginatedByDevice:(BOOL)a3
{
  self->_originatedByDevice = a3;
}

- (BOOL)isFuzzyMatched
{
  return self->_fuzzyMatched;
}

- (void)setFuzzyMatched:(BOOL)a3
{
  self->_fuzzyMatched = a3;
}

- (NSArray)associatedStatementIdentifiers
{
  return self->_associatedStatementIdentifiers;
}

- (void)setAssociatedStatementIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (BOOL)interestReassessment
{
  return self->_interestReassessment;
}

- (void)setInterestReassessment:(BOOL)a3
{
  self->_interestReassessment = a3;
}

- (NSString)receiptProviderIdentifier
{
  return self->_receiptProviderIdentifier;
}

- (void)setReceiptProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (void)setReceiptIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (NSURL)receiptProviderURL
{
  return self->_receiptProviderURL;
}

- (void)setReceiptProviderURL:(id)a3
{
  objc_storeStrong((id *)&self->_receiptProviderURL, a3);
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (PKTransactionAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (NSString)primaryFundingSourceDescription
{
  return self->_primaryFundingSourceDescription;
}

- (void)setPrimaryFundingSourceDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 864);
}

- (NSDecimalNumber)nominalAmount
{
  return self->_nominalAmount;
}

- (void)setNominalAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 872);
}

- (BOOL)hasAdditionalOffers
{
  return self->_hasAdditionalOffers;
}

- (void)setHasAdditionalOffers:(BOOL)a3
{
  self->_hasAdditionalOffers = a3;
}

- (NSArray)awards
{
  return self->_awards;
}

- (void)setAwards:(id)a3
{
  objc_storeStrong((id *)&self->_awards, a3);
}

- (NSArray)amountModifiers
{
  return self->_amountModifiers;
}

- (void)setAmountModifiers:(id)a3
{
  objc_storeStrong((id *)&self->_amountModifiers, a3);
}

- (NSString)issueReportIdentifier
{
  return self->_issueReportIdentifier;
}

- (void)setIssueReportIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 896);
}

- (int64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(int64_t)a3
{
  self->_transactionStatus = a3;
}

- (int64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(int64_t)a3
{
  self->_transactionType = a3;
}

- (int64_t)technologyType
{
  return self->_technologyType;
}

- (void)setTechnologyType:(int64_t)a3
{
  self->_technologyType = a3;
}

- (unint64_t)transactionSource
{
  return self->_transactionSource;
}

- (void)setTransactionSource:(unint64_t)a3
{
  self->_transactionSource = a3;
}

- (int64_t)transactionDeclinedReason
{
  return self->_transactionDeclinedReason;
}

- (void)setTransactionDeclinedReason:(int64_t)a3
{
  self->_transactionDeclinedReason = a3;
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 952);
}

- (BOOL)isCloudKitArchived
{
  return self->_isCloudKitArchived;
}

- (void)setIsCloudKitArchived:(BOOL)a3
{
  self->_isCloudKitArchived = a3;
}

- (PKTransactionReleasedData)releasedData
{
  return self->_releasedData;
}

- (void)setReleasedData:(id)a3
{
  objc_storeStrong((id *)&self->_releasedData, a3);
}

- (BOOL)requiresLocation
{
  return self->_requiresLocation;
}

- (void)setRequiresLocation:(BOOL)a3
{
  self->_requiresLocation = a3;
}

- (PKPayLaterFinancingPlan)associatedFinancingPlan
{
  return self->_associatedFinancingPlan;
}

- (void)setAssociatedFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_associatedFinancingPlan, a3);
}

- (BOOL)isRecurring
{
  return self->_recurring;
}

- (void)setRecurring:(BOOL)a3
{
  self->_recurring = a3;
}

- (int64_t)updateSequenceNumber
{
  return self->_updateSequenceNumber;
}

- (void)setUpdateSequenceNumber:(int64_t)a3
{
  self->_updateSequenceNumber = a3;
}

- (BOOL)needsSyncWithFinance
{
  return self->_needsSyncWithFinance;
}

- (void)setNeedsSyncWithFinance:(BOOL)a3
{
  self->_needsSyncWithFinance = a3;
}

- (BOOL)isIssuerInstallmentTransaction
{
  return self->_isIssuerInstallmentTransaction;
}

- (void)setIsIssuerInstallmentTransaction:(BOOL)a3
{
  self->_isIssuerInstallmentTransaction = a3;
}

- (NSURL)issuerInstallmentManagementURL
{
  return self->_issuerInstallmentManagementURL;
}

- (void)setIssuerInstallmentManagementURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (PKPaymentRewardsRedemption)paymentRewardsRedemption
{
  return self->_paymentRewardsRedemption;
}

- (void)setPaymentRewardsRedemption:(id)a3
{
  objc_storeStrong((id *)&self->_paymentRewardsRedemption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentRewardsRedemption, 0);
  objc_storeStrong((id *)&self->_issuerInstallmentManagementURL, 0);
  objc_storeStrong((id *)&self->_associatedFinancingPlan, 0);
  objc_storeStrong((id *)&self->_releasedData, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_issueReportIdentifier, 0);
  objc_storeStrong((id *)&self->_amountModifiers, 0);
  objc_storeStrong((id *)&self->_awards, 0);
  objc_storeStrong((id *)&self->_nominalAmount, 0);
  objc_storeStrong((id *)&self->_primaryFundingSourceDescription, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_barcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptProviderURL, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedStatementIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastMerchantReprocessingDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_installmentPlan, 0);
  objc_storeStrong((id *)&self->_installmentPayment, 0);
  objc_storeStrong((id *)&self->_redemptionEvent, 0);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartImageRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPeerPayment, 0);
  objc_storeStrong((id *)&self->_transfers, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_servicingEvents, 0);
  objc_storeStrong((id *)&self->_questions, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_cardNumberSuffix, 0);
  objc_storeStrong((id *)&self->_isMerchantTokenTransaction, 0);
  objc_storeStrong((id *)&self->_panIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
  objc_storeStrong((id *)&self->_clearingNetworkData, 0);
  objc_storeStrong((id *)&self->_authNetworkData, 0);
  objc_storeStrong((id *)&self->_lifecycleIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_rewardsInProgress, 0);
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_rewardsTotalCurrencyCode, 0);
  objc_storeStrong((id *)&self->_rewardsTotalAmount, 0);
  objc_storeStrong((id *)&self->_merchantProvidedDescription, 0);
  objc_storeStrong((id *)&self->_merchantProvidedTitle, 0);
  objc_storeStrong((id *)&self->_sendDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceDescription, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceFPANIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceDPANSuffix, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceCurrencyCode, 0);
  objc_storeStrong((id *)&self->_secondaryFundingSourceAmount, 0);
  objc_storeStrong((id *)&self->_primaryFundingSourceCurrencyCode, 0);
  objc_storeStrong((id *)&self->_primaryFundingSourceAmount, 0);
  objc_storeStrong((id *)&self->_bankConnectMetadata, 0);
  objc_storeStrong((id *)&self->_bankConnectRedeemRewardsURL, 0);
  objc_storeStrong((id *)&self->_bankConnectPostInstallmentURL, 0);
  objc_storeStrong((id *)&self->_bankConnectTransferFundsURL, 0);
  objc_storeStrong((id *)&self->_bankConnectPayNowURL, 0);
  objc_storeStrong((id *)&self->_bankConnectDigitalServicingURL, 0);
  objc_storeStrong((id *)&self->_localizedTypeDescription, 0);
  objc_storeStrong((id *)&self->_fees, 0);
  objc_storeStrong((id *)&self->_foreignExchangeInformation, 0);
  objc_storeStrong((id *)&self->_peerPaymentMessageReceivedDate, 0);
  objc_storeStrong((id *)&self->_peerPaymentMemo, 0);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
  objc_storeStrong((id *)&self->_endStation, 0);
  objc_storeStrong((id *)&self->_endStationCode, 0);
  objc_storeStrong((id *)&self->_startStation, 0);
  objc_storeStrong((id *)&self->_startStationCode, 0);
  objc_storeStrong((id *)&self->_cityCode, 0);
  objc_storeStrong((id *)&self->_stationCodeProvider, 0);
  objc_storeStrong((id *)&self->_locationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_transactionStatusChangedDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_plans, 0);
  objc_storeStrong((id *)&self->_amounts, 0);
  objc_storeStrong((id *)&self->_amountAddedToAuth, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_subtotalAmount, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (FKPaymentTransaction)fkPaymentTransaction
{
  void *v3;
  unint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v23 = objc_alloc((Class)getFKPaymentTransactionClass[0]());
  -[PKPaymentTransaction identifier](self, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction _fkAmount](self, "_fkAmount");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction foreignExchangeInformation](self, "foreignExchangeInformation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fkForeignAmount");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction foreignExchangeInformation](self, "foreignExchangeInformation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "exchangeRate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction transactionDate](self, "transactionDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction transactionStatusChangedDate](self, "transactionStatusChangedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PKPaymentTransaction _fkPaymentTransactionType](self, "_fkPaymentTransactionType");
  v17 = -[PKPaymentTransaction _fkPaymentTransactionStatus](self, "_fkPaymentTransactionStatus");
  -[PKPaymentTransaction merchant](self, "merchant");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction merchant](self, "merchant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction localizedTypeDescription](self, "localizedTypeDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaymentTransaction _fkCreditDebitIndicator](self, "_fkCreditDebitIndicator");
  -[PKPaymentTransaction _fkActions](self, "_fkActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentTransaction isBankConnectTransaction](self, "isBankConnectTransaction");
  -[PKPaymentTransaction merchant](self, "merchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "industryCode");
  v9 = -[PKPaymentTransaction hasNotificationServiceData](self, "hasNotificationServiceData");
  -[PKPaymentTransaction paymentHash](self, "paymentHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction _fkTransactionInsights](self, "_fkTransactionInsights");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = v9;
  LOBYTE(v13) = v6;
  v24 = (void *)objc_msgSend(v23, "initWithTransactionIdentifier:amount:foreignAmount:foreignCurrencyExchangeRate:transactionDate:transactionStatusChangedDate:type:status:transactionDescription:originalTransactionDescription:localizedTypeDescription:creditDebitIndicator:actions:isBankConnectTransaction:merchantCategoryCode:hasNotificationServiceData:paymentHash:altDSID:insights:", v29, v30, v25, v22, v21, v19, v18, v17, v15, v3, v16, v4, v5, v13,
                  v8,
                  v14,
                  v10,
                  0,
                  v11);

  return (FKPaymentTransaction *)v24;
}

- (id)_fkAmount
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)getFKAmountClass_0[0]());
  -[PKPaymentTransaction amount](self, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_absoluteValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction currencyCode](self, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithDecimalNumber:currency:", v5, v6);

  return v7;
}

- (id)_fkActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc((Class)getFKActionsClass[0]());
  -[PKPaymentTransaction bankConnectDigitalServicingURL](self, "bankConnectDigitalServicingURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction bankConnectPayNowURL](self, "bankConnectPayNowURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction bankConnectTransferFundsURL](self, "bankConnectTransferFundsURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction bankConnectPostInstallmentURL](self, "bankConnectPostInstallmentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction bankConnectRedeemRewardsURL](self, "bankConnectRedeemRewardsURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithDigitalServicingURL:payNowURL:transferFundsURL:postInstallmentURL:redeemRewardsURL:", v4, v5, v6, v7, v8);

  return v9;
}

- (unint64_t)_fkCreditDebitIndicator
{
  int64_t v3;
  void *v5;
  _BOOL4 v6;

  v3 = -[PKPaymentTransaction bankConnectCreditDebitIndicator](self, "bankConnectCreditDebitIndicator");
  if (v3)
    return v3 == 2;
  -[PKPaymentTransaction currencyAmount](self, "currencyAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PKPaymentTransaction isPositiveBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:isBankConnectTransaction:bankConnectCreditDebitIndicator:featureIdentifier:](PKPaymentTransaction, "isPositiveBalanceAdjustmentForCurrencyAmount:transactionType:adjustmentType:peerPaymentType:isBankConnectTransaction:bankConnectCreditDebitIndicator:featureIdentifier:", v5, -[PKPaymentTransaction transactionType](self, "transactionType"), -[PKPaymentTransaction adjustmentType](self, "adjustmentType"), -[PKPaymentTransaction peerPaymentType](self, "peerPaymentType"), -[PKPaymentTransaction isBankConnectTransaction](self, "isBankConnectTransaction"), -[PKPaymentTransaction bankConnectCreditDebitIndicator](self, "bankConnectCreditDebitIndicator"), -[PKPaymentTransaction featureIdentifier](self, "featureIdentifier"));

  return !v6;
}

- (unint64_t)_fkMerchantCategoryFromPKMerchantCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8)
    return 0;
  else
    return a3;
}

- (id)_fkMapsTransactionInsight
{
  PKPaymentTransaction *v2;
  void *v3;
  void *v4;
  PKPaymentTransaction *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  PKPaymentTransaction *v48;
  unsigned int v49;
  void *v50;

  v2 = self;
  -[PKPaymentTransaction merchant](self, "merchant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapsMerchant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v38 = objc_alloc(_MergedGlobals_185());
    v36 = objc_msgSend(v4, "identifier");
    v49 = objc_msgSend(v4, "resultProviderIdentifier");
    objc_msgSend(v4, "name");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heroImageURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heroImageAttributionName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2;
    v6 = -[PKPaymentTransaction _fkMerchantCategoryFromPKMerchantCategory:](v2, "_fkMerchantCategoryFromPKMerchantCategory:", objc_msgSend(v4, "category"));
    objc_msgSend(v4, "detailedCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stylingInfoData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "businessChatURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastProcessedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v4, "locationLatitude");
    v11 = v10;
    objc_msgSend(v4, "locationLongitude");
    v13 = (void *)objc_msgSend(v9, "initWithLatitude:longitude:", v11, v12);
    objc_msgSend(v4, "postalAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v6;
    v2 = v5;
    v50 = (void *)objc_msgSend(v38, "initWithMUID:resultProviderIdentifier:name:phoneNumber:url:heroImageURL:heroImageAttributionName:category:mapsCategoryIdentifier:encodedStylingInfo:businessChatURL:lastProcessedDate:location:postalAddress:", v36, v49, v47, v44, v42, v40, v34, v29, v7, v32, v30, v8, v13, v14);

  }
  else
  {
    v50 = 0;
  }
  -[PKPaymentTransaction merchant](v2, "merchant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mapsBrand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v37 = objc_alloc(off_1ECF21C40());
    v17 = objc_msgSend(v16, "identifier");
    v45 = objc_msgSend(v16, "resultProviderIdentifier");
    objc_msgSend(v16, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "phoneNumber");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "url");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heroImageURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heroImageAttributionName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKPaymentTransaction _fkMerchantCategoryFromPKMerchantCategory:](v2, "_fkMerchantCategoryFromPKMerchantCategory:", objc_msgSend(v16, "category"));
    objc_msgSend(v16, "detailedCategory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stylingInfoData");
    v48 = v2;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "businessChatURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastProcessedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logoURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v37, "initWithMUID:resultProviderIdentifier:name:phoneNumber:url:heroImageURL:heroImageAttributionName:category:mapsCategoryIdentifier:encodedStylingInfo:businessChatURL:lastProcessedDate:logoURL:", v17, v45, v43, v41, v39, v35, v33, v18, v31, v19, v20, v21, v22);

    v2 = v48;
    v23 = (void *)v46;

  }
  else
  {
    v23 = 0;
  }
  -[PKPaymentTransaction merchant](v2, "merchant");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "fallbackcategory");

  if (v50 || v23 || v25)
  {
    v27 = -[PKPaymentTransaction _fkMerchantCategoryFromPKMerchantCategory:](v2, "_fkMerchantCategoryFromPKMerchantCategory:", v25);
    v26 = (void *)objc_msgSend(objc_alloc(off_1ECF21C48()), "initWithUpdatedAt:fallbackCategory:merchant:brand:", 0, v27, v50, v23);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)_fkTransactionInsights
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)getFKPaymentTransactionInsightsClass[0]());
  -[PKPaymentTransaction _fkApplePayTransactionInsight](self, "_fkApplePayTransactionInsight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction _fkMapsTransactionInsight](self, "_fkMapsTransactionInsight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction _fkContactTransactionInsight](self, "_fkContactTransactionInsight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithApplePayInsight:bankMerchantInformationInsight:mapsInsight:contactInsight:", v4, 0, v5, v6);

  return v7;
}

- (id)_fkApplePayTransactionInsight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  -[PKPaymentTransaction merchant](self, "merchant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction clearingNetworkData](self, "clearingNetworkData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36D8];
    -[PKPaymentTransaction clearingNetworkData](self, "clearingNetworkData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentTransaction authNetworkData](self, "authNetworkData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v5 = (void *)MEMORY[0x1E0CB36D8];
    -[PKPaymentTransaction authNetworkData](self, "authNetworkData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "JSONObjectWithData:options:error:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DE048"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v11, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v12, 4);

  }
  else
  {
    v30 = 0;
  }
  if (-[PKPaymentTransaction paymentNetworkIdentifier](self, "paymentNetworkIdentifier"))
  {
    PKPaymentNetworkNameForPaymentCredentialType(-[PKPaymentTransaction paymentNetworkIdentifier](self, "paymentNetworkIdentifier"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  v28 = objc_alloc((Class)getFKApplePayTransactionInsightClass[0]());
  -[PKPaymentTransaction paymentHash](self, "paymentHash");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawName");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "industryCategory");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "industryCode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DE018"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DE019"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DE041"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPaymentTransaction isCoarseLocation](self, "isCoarseLocation"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction location](self, "location");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "merchantIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawCANL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawCity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawCountry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "city");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zip");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "cleanConfidenceLevel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "adamIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webMerchantIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webMerchantName");
  v25 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "initWithPaymentHash:merchantName:merchantRawName:industryCategory:industryCode:merchantType:merchantCountryCode:terminalIdentifier:merchantAdditionalData:paymentNetwork:isCoarseLocation:location:merchantIdentifier:merchantRawCANL:merchantRawCity:merchantRawState:merchantRawCountry:merchantCity:merchantZip:merchantState:merchantCleanConfidenceLevel:adamIdentifier:webURL:webMerchantIdentifier:webMerchantName:", v41, v40, v38, v37, v27, v26, v36, v35, v30, v39, v34, v33, v32, v31,
                  v23,
                  v24,
                  v22,
                  v20,
                  v21,
                  v19,
                  v13,
                  v14,
                  v15,
                  v16,
                  v17);

  return v29;
}

- (unint64_t)_fkPaymentTransactionType
{
  unint64_t result;

  result = -[PKPaymentTransaction transactionType](self, "transactionType");
  if (result - 1 >= 0x16)
    return 0;
  return result;
}

- (int64_t)_fkPaymentTransactionStatus
{
  int64_t result;

  result = -[PKPaymentTransaction transactionStatus](self, "transactionStatus");
  if ((unint64_t)result >= 9)
    return -1;
  return result;
}

- (id)_fkContactTransactionInsight
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(getFKContactTransactionInsightClass());
  -[PKPaymentTransaction peerPaymentCounterpartHandle](self, "peerPaymentCounterpartHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPeerPaymentCounterpartHandle:", v4);

  return v5;
}

+ (void)augmentTransactionsIfNeeded:(id)a3 usingDataProvider:(id)a4
{
  id v5;
  PKPaymentDefaultDataProvider *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (PKPaymentDefaultDataProvider *)a4;
  if (_os_feature_enabled_impl() && !PKHideCardBenefitRewards())
  {
    if (!v6)
      v6 = objc_alloc_init(PKPaymentDefaultDataProvider);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "paymentHash", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "transactionType"))
            v14 = objc_msgSend(v12, "transactionType") == 16;
          else
            v14 = 1;
          if (!objc_msgSend(v12, "transactionStatus")
            || objc_msgSend(v12, "transactionStatus") == 1
            || objc_msgSend(v12, "transactionStatus") == -1)
          {
            v15 = 1;
            if (!v13)
              goto LABEL_25;
          }
          else
          {
            v15 = objc_msgSend(v12, "transactionStatus") == 8;
            if (!v13)
              goto LABEL_25;
          }
          if (v14 && v15)
          {
            -[PKPaymentDefaultDataProvider paymentRewardsRedemptionForPaymentHash:](v6, "paymentRewardsRedemptionForPaymentHash:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16 && objc_msgSend(v16, "isInGoodStanding"))
              objc_msgSend(v12, "setPaymentRewardsRedemption:", v17);

          }
LABEL_25:

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
}

@end
