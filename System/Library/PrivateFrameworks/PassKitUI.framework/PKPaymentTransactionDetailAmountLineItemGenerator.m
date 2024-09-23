@implementation PKPaymentTransactionDetailAmountLineItemGenerator

- (id)lineItemsForTransaction:(id)a3 transactionSourceCollection:(id)a4 associatedTransaction:(id)a5 associatedReceipt:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDecimalNumber *v18;
  NSDecimalNumber *v19;
  char v20;
  uint64_t v21;
  PKPaymentTransactionDetailAmountLineItemTotal *v22;
  NSString *v23;
  void *v24;
  PKPaymentTransactionDetailAmountLineCompletionDate *v25;
  PKPaymentTransactionDetailAmountLineCompletionDate **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  PKPaymentTransactionDetailAmountLineItemTotal *v32;
  NSDecimalNumber *v33;
  NSString *v34;
  void *v35;
  PKPaymentTransactionDetailAmountLineItemTotal *v36;
  PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  __CFString *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  PKPaymentTransactionDetailAmountLineItemGeneric *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  PKPaymentTransactionDetailAmountLineItemGeneric *v68;
  void *v69;
  void *v70;
  PKPaymentTransactionDetailAmountLineItemGeneric *v71;
  void *v72;
  uint64_t v73;
  PKPaymentTransactionDetailAmountLineItemGeneric *v74;
  void *v75;
  PKPaymentTransactionDetailAmountLineItemGeneric *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  PKPaymentTransactionDetailAmountLineItemGeneric *v81;
  void *v82;
  PKPaymentTransactionDetailAmountLineItemGeneric *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  uint64_t v89;
  void *v90;
  PKPaymentTransactionDetailAmountLineItemGeneric *v91;
  void *v92;
  PKPaymentTransactionDetailAmountLineItemGeneric *v93;
  PKPaymentTransactionDetailAmountLineItemPaymentTotal *v94;
  void *v95;
  PKPaymentTransactionDetailAmountLineItemPaymentTotal *v96;
  int v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  void *v105;
  NSDecimalNumber *v106;
  NSString *v107;
  id obj;
  id obja;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  PKPaymentTransactionDetailAmountLineItemPaymentTotal *v123;
  PKPaymentTransactionDetailAmountLineCompletionDate *v124;
  PKPaymentTransactionDetailAmountLineCompletionDate *v125;
  PKPaymentTransactionDetailAmountLineItemTotal *v126;
  _QWORD v127[2];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 0;
  v15 = objc_msgSend(v10, "transactionType");
  switch(v15)
  {
    case 0:
      -[PKPaymentTransactionDetailAmountLineItemGenerator _lineItemsForPurchaseTransaction:transactionSourceCollection:associatedReceipt:](self, "_lineItemsForPurchaseTransaction:transactionSourceCollection:associatedReceipt:", v10, v11, v13);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_70;
    case 1:
      v32 = [PKPaymentTransactionDetailAmountLineItemTotal alloc];
      objc_msgSend(v10, "amount");
      v33 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currencyCode");
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:](v32, "initWithAmount:totalType:", v35, 4);

      if (v12)
      {
        v37 = -[PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment initWithAssociatedTransaction:]([PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment alloc], "initWithAssociatedTransaction:", v12);
        -[PKPaymentTransactionDetailAmountLineItemDailyCashAdjustment setHasTrailingLineSeperator:](v37, "setHasTrailingLineSeperator:", 1);
        v127[0] = v36;
        v127[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[PKPaymentTransactionDetailAmountLineItemTotal setHasTrailingLineSeperator:](v36, "setHasTrailingLineSeperator:", 1);
        v126 = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 2:
      objc_msgSend(v10, "amount");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pk_absoluteValue");
      v106 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      v98 = v38;
      v97 = objc_msgSend(v38, "pk_isNegativeNumber");
      objc_msgSend(v11, "paymentPass");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currencyCode");
      v107 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v107)
      {
        objc_msgSend(v110, "devicePrimaryContactlessPaymentApplication");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "appletCurrencyCode");
        v107 = (NSString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v10, "amounts");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "plans");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v10, "transitType");
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v104 = v10;
      v105 = v41;
      v101 = v13;
      v102 = v12;
      v103 = v11;
      v99 = v42;
      v100 = v40;
      if (v40)
      {
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        obj = v40;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v120;
          do
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v120 != v46)
                objc_enumerationMutation(obj);
              v48 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
              objc_msgSend(v48, "amount");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "absoluteValue");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "formattedStringValue");
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v49, "amount");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "pk_isNegativeNumber");

              if (v53)
              {
                PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v51);
                v54 = objc_claimAutoreleasedReturnValue();

                v55 = CFSTR("TRANSACTION_DEFAULT_CREDIT");
                v51 = (void *)v54;
              }
              else
              {
                v55 = CFSTR("TRANSACTION_DEFAULT_AMOUNT");
              }
              PKLocalizedPaymentString(&v55->isa);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "label");
              v57 = objc_claimAutoreleasedReturnValue();
              v58 = (void *)v57;
              if (v57)
                v59 = (void *)v57;
              else
                v59 = v56;
              v60 = v59;

              v61 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:]([PKPaymentTransactionDetailAmountLineItemGeneric alloc], "initWithLabel:value:", v60, v51);
              -[PKPaymentTransactionDetailAmountLineItemGeneric setHasTrailingLineSeperator:](v61, "setHasTrailingLineSeperator:", 1);
              -[PKPaymentTransactionDetailAmountLineItemGeneric setIsEmphasized:](v61, "setIsEmphasized:", 0);
              objc_msgSend(v43, "addObject:", v61);

            }
            v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
          }
          while (v45);
        }

        v11 = v103;
        v13 = v101;
        v12 = v102;
        v42 = v99;
        v40 = v100;
        v41 = v105;
      }
      if (v41)
      {
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v62 = v41;
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v116;
          do
          {
            for (j = 0; j != v64; ++j)
            {
              if (*(_QWORD *)v116 != v65)
                objc_enumerationMutation(v62);
              v67 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
              v68 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
              objc_msgSend(v67, "label");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              PKPassLocalizedStringWithFormat();
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v68, "initWithLabel:value:", v69, v70, 0);

              -[PKPaymentTransactionDetailAmountLineItemGeneric setHasTrailingLineSeperator:](v71, "setHasTrailingLineSeperator:", 1);
              -[PKPaymentTransactionDetailAmountLineItemGeneric setIsEmphasized:](v71, "setIsEmphasized:", 0);
              objc_msgSend(v43, "addObject:", v71);

            }
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
          }
          while (v64);
        }

        v11 = v103;
        v10 = v104;
        v13 = v101;
        v12 = v102;
        v42 = v99;
        v40 = v100;
        v41 = v105;
      }
      if (v42 == 517 && (objc_msgSend(v110, "shouldSuppressNoChargeAmount") & 1) == 0)
      {
        objc_msgSend(v110, "devicePrimaryPaymentApplication");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "paymentNetworkIdentifier");

        if (v73 == 131)
        {
          v74 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
          PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAIL_STATUS_SUBTITLE_PAID_WITH_NAVIGO_DASH_EXPLANATION"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v74, "initWithLabel:value:", v75, &stru_1E3E7D690);

          -[PKPaymentTransactionDetailAmountLineItemGeneric setHasTrailingLineSeperator:](v76, "setHasTrailingLineSeperator:", 1);
          -[PKPaymentTransactionDetailAmountLineItemGeneric setIsEmphasized:](v76, "setIsEmphasized:", 0);
          objc_msgSend(v43, "addObject:", v76);

        }
      }
      if ((objc_msgSend(v10, "enRoute") & 1) == 0 && v42 != 1025 && v106 && v107)
      {
        PKCurrencyAmountCreate(v106, v107);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "formattedStringValue");
        v78 = objc_claimAutoreleasedReturnValue();
        v79 = (void *)v78;
        if (v97)
        {
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v78);
          v80 = objc_claimAutoreleasedReturnValue();

          v79 = (void *)v80;
        }
        v81 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
        PKLocalizedPaymentString(CFSTR("TRANSACTION_DEFAULT_BALANCE"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v81, "initWithLabel:value:", v82, v79);

        -[PKPaymentTransactionDetailAmountLineItemGeneric setHasTrailingLineSeperator:](v83, "setHasTrailingLineSeperator:", 1);
        -[PKPaymentTransactionDetailAmountLineItemGeneric setIsEmphasized:](v83, "setIsEmphasized:", 1);
        objc_msgSend(v43, "addObject:", v83);

        v41 = v105;
        v42 = v99;
      }
      if ((objc_msgSend(v10, "enRoute") & 1) == 0 && v42 != 1025 && (unint64_t)objc_msgSend(v40, "count") >= 2)
      {
        objc_msgSend(v10, "dictionaryOfFormattedMultipleAmountTotalsByRealCurrency");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        objc_msgSend(v84, "keyEnumerator");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
        if (v85)
        {
          v86 = v85;
          v87 = *(_QWORD *)v112;
          do
          {
            for (k = 0; k != v86; ++k)
            {
              if (*(_QWORD *)v112 != v87)
                objc_enumerationMutation(obja);
              v89 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * k);
              PKLocalizedPaymentString(CFSTR("TRANSACTION_TOTAL_FOR_TRANSIT_BALANCES"), CFSTR("%@"), v89);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
              objc_msgSend(v84, "objectForKeyedSubscript:", v89);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v91, "initWithLabel:value:", v90, v92);

              -[PKPaymentTransactionDetailAmountLineItemGeneric setHasTrailingLineSeperator:](v93, "setHasTrailingLineSeperator:", 1);
              -[PKPaymentTransactionDetailAmountLineItemGeneric setIsEmphasized:](v93, "setIsEmphasized:", 1);
              objc_msgSend(v43, "addObject:", v93);

            }
            v86 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
          }
          while (v86);
        }

        v11 = v103;
        v10 = v104;
        v13 = v101;
        v12 = v102;
        v40 = v100;
        v41 = v105;
      }
      v14 = (void *)objc_msgSend(v43, "copy");

      break;
    case 3:
      -[PKPaymentTransactionDetailAmountLineItemGenerator _lineItemsForPeerPaymentTransaction:transactionSourceCollection:](self, "_lineItemsForPeerPaymentTransaction:transactionSourceCollection:", v10, v11);
      v31 = objc_claimAutoreleasedReturnValue();
      goto LABEL_70;
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      objc_msgSend(v10, "transfers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 && objc_msgSend(v10, "transactionStatus") != 2)
      {
        v27 = objc_msgSend(v17, "fundsAreAvailable");
        objc_msgSend(v17, "expectedCompletionDate");
        v28 = objc_claimAutoreleasedReturnValue();
        v19 = (NSDecimalNumber *)v28;
        if ((v27 & 1) != 0 || !v28)
        {
          objc_msgSend(v10, "transactionStatusChangedDate");
          v29 = objc_claimAutoreleasedReturnValue();

          v19 = (NSDecimalNumber *)v29;
        }
        v25 = -[PKPaymentTransactionDetailAmountLineCompletionDate initWithDate:completed:]([PKPaymentTransactionDetailAmountLineCompletionDate alloc], "initWithDate:completed:", v19, v27);
        -[PKPaymentTransactionDetailAmountLineCompletionDate setHasTrailingLineSeperator:](v25, "setHasTrailingLineSeperator:", 1);
        v125 = v25;
        v26 = &v125;
      }
      else
      {
        objc_msgSend(v10, "amount");
        v18 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = -[NSDecimalNumber pk_isNegativeNumber](v18, "pk_isNegativeNumber");
          if (v15 == 11 && (v20 & 1) == 0 && objc_msgSend(v10, "featureIdentifier") == 5)
          {
            -[NSDecimalNumber pk_negativeValue](v19, "pk_negativeValue");
            v21 = objc_claimAutoreleasedReturnValue();

            v19 = (NSDecimalNumber *)v21;
          }
        }
        v22 = [PKPaymentTransactionDetailAmountLineItemTotal alloc];
        objc_msgSend(v10, "currencyCode");
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v19, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:](v22, "initWithAmount:totalType:", v24, 4);

        -[PKPaymentTransactionDetailAmountLineCompletionDate setHasTrailingLineSeperator:](v25, "setHasTrailingLineSeperator:", 1);
        v124 = v25;
        v26 = &v124;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 5:
      -[PKPaymentTransactionDetailAmountLineItemGenerator _lineItemsForWithdrawalTransaction:transactionSourceCollection:](self, "_lineItemsForWithdrawalTransaction:transactionSourceCollection:", v10, v11);
      v31 = objc_claimAutoreleasedReturnValue();
LABEL_70:
      v14 = (void *)v31;
      break;
    case 10:
      v94 = [PKPaymentTransactionDetailAmountLineItemPaymentTotal alloc];
      objc_msgSend(v10, "currencyAmount");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = -[PKPaymentTransactionDetailAmountLineItemPaymentTotal initWithAmount:](v94, "initWithAmount:", v95);

      -[PKPaymentTransactionDetailAmountLineItemPaymentTotal setHasTrailingLineSeperator:](v96, "setHasTrailingLineSeperator:", 1);
      v123 = v96;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return v14;
}

- (id)lineItemsForInstallmentPlan:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  NSDecimalNumber *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  PKPaymentTransactionDetailAmountLineItemTotal *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  PKPaymentTransactionDetailAmountLineItemTotal *v55;
  NSDecimalNumber *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v65;
  uint64_t v66;
  BOOL v68;
  NSString *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[4];
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  id v89;
  uint64_t v90;
  BOOL v91;
  _QWORD v92[4];
  id v93;
  id v94;
  uint64_t v95;
  BOOL v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "lineItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v3;
  objc_msgSend(v3, "currencyCode");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v98 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "type");
        v15 = v6;
        if (v14 != 1)
        {
          v16 = objc_msgSend(v13, "type");
          v15 = v7;
          if (v16 != 5)
            continue;
        }
        objc_msgSend(v15, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v97, v103, 16);
    }
    while (v10);
  }
  v72 = v4;

  v17 = objc_msgSend(v6, "count");
  v68 = v17 != 0;
  v18 = objc_msgSend(v7, "count");
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = MEMORY[0x1E0C809B0];
  v74 = v19;
  v70 = v17;
  if (v17)
  {
    v21 = v19;
    objc_msgSend(v8, "pk_arrayByRemovingObjectsInArray:", v6);
    v65 = objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v6, "count");
    v23 = v20;
    v92[0] = v20;
    v92[1] = 3221225472;
    v92[2] = __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke;
    v92[3] = &unk_1E3E7A858;
    v93 = v75;
    v96 = v18 != 0;
    v94 = v21;
    v95 = v22;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v92);

    v8 = (id)v65;
  }
  else
  {
    v23 = MEMORY[0x1E0C809B0];
  }
  if (v18)
  {
    objc_msgSend(v8, "pk_arrayByRemovingObjectsInArray:", v7);
    v66 = objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v7, "count");
    v87[0] = v23;
    v87[1] = 3221225472;
    v87[2] = __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_2;
    v87[3] = &unk_1E3E7A858;
    v25 = v75;
    v88 = v25;
    v26 = v74;
    v27 = v74;
    v91 = v68;
    v89 = v27;
    v90 = v24;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v87);

    if (v70)
    {
      v69 = (NSString *)v25;
      v71 = v27;
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v28 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v29 = v6;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v84;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v84 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
            objc_msgSend(v34, "amount");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              objc_msgSend(v34, "amount");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDecimalNumber decimalNumberByAdding:](v28, "decimalNumberByAdding:", v36);
              v37 = objc_claimAutoreleasedReturnValue();

              v28 = (NSDecimalNumber *)v37;
            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
        }
        while (v31);
      }

      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v38 = v7;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v80;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v80 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
            objc_msgSend(v43, "amount");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v43, "amount");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDecimalNumber decimalNumberBySubtracting:](v28, "decimalNumberBySubtracting:", v45);
              v46 = objc_claimAutoreleasedReturnValue();

              v28 = (NSDecimalNumber *)v46;
            }
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
        }
        while (v40);
      }

      v47 = 0;
      if (v28)
      {
        v48 = v74;
        v23 = MEMORY[0x1E0C809B0];
        if (v69)
        {
          PKCurrencyAmountCreate(v28, v69);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v48 = v74;
        v23 = MEMORY[0x1E0C809B0];
      }
      v49 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:]([PKPaymentTransactionDetailAmountLineItemTotal alloc], "initWithAmount:totalType:", v47, 5);
      -[PKPaymentTransactionDetailAmountLineItemTotal setHasTrailingLineSeperator:](v49, "setHasTrailingLineSeperator:", 1);
      objc_msgSend(v71, "addObject:", v49);

      v8 = (id)v66;
      v26 = v48;
    }
    else
    {
      v8 = (id)v66;
    }
  }
  else
  {
    v26 = v74;
  }
  objc_msgSend(v72, "addObjectsFromArray:", v26);
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v76[0] = v23;
  v76[1] = 3221225472;
  v76[2] = __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_3;
  v76[3] = &unk_1E3E7A880;
  v51 = v75;
  v77 = v51;
  v52 = v50;
  v78 = v52;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v76);
  objc_msgSend(v52, "lastObject");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setHasTrailingLineSeperator:", 1);

  objc_msgSend(v72, "addObjectsFromArray:", v52);
  v54 = v73;
  if (v51)
  {
    objc_msgSend(v73, "totalAmount");
    v55 = (PKPaymentTransactionDetailAmountLineItemTotal *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v73, "totalAmount");
      v56 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v56, (NSString *)v51);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:]([PKPaymentTransactionDetailAmountLineItemTotal alloc], "initWithAmount:totalType:", v57, 6);
      objc_msgSend(v72, "addObject:", v55);

    }
    objc_msgSend(v73, "rewards");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      -[PKPaymentTransactionDetailAmountLineItemGenerator _rewardsLineItemsForRewards:currencyCode:](self, "_rewardsLineItemsForRewards:currencyCode:", v58, v51);
      v59 = v8;
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "lastObject");
      v61 = v51;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setHasTrailingLineSeperator:", 1);

      objc_msgSend(v72, "addObjectsFromArray:", v60);
      v26 = v74;
      v51 = v61;
      v8 = v59;
      v54 = v73;
    }
    else
    {
      -[PKPaymentTransactionDetailAmountLineItemTotal setHasTrailingLineSeperator:](v55, "setHasTrailingLineSeperator:", 1);
    }

  }
  v63 = (void *)objc_msgSend(v72, "copy");

  return v63;
}

void __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  PKInstallmentPlanDetailLineItem *v6;

  v5 = a2;
  v6 = -[PKInstallmentPlanDetailLineItem initWithLineItem:currencyCode:]([PKInstallmentPlanDetailLineItem alloc], "initWithLineItem:currencyCode:", v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  if (!*(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 48) - 1 == a3)
    -[PKInstallmentPlanDetailLineItem setHasTrailingLineSeperator:](v6, "setHasTrailingLineSeperator:", 1);

}

void __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  PKInstallmentPlanDetailLineItem *v6;

  v5 = a2;
  v6 = -[PKInstallmentPlanDetailLineItem initWithLineItem:currencyCode:]([PKInstallmentPlanDetailLineItem alloc], "initWithLineItem:currencyCode:", v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  if (!*(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 48) - 1 == a3)
    -[PKInstallmentPlanDetailLineItem setHasTrailingLineSeperator:](v6, "setHasTrailingLineSeperator:", 1);

}

void __81__PKPaymentTransactionDetailAmountLineItemGenerator_lineItemsForInstallmentPlan___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  PKInstallmentPlanDetailLineItem *v4;

  v3 = a2;
  v4 = -[PKInstallmentPlanDetailLineItem initWithLineItem:currencyCode:]([PKInstallmentPlanDetailLineItem alloc], "initWithLineItem:currencyCode:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

- (id)_lineItemsForWithdrawalTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v5;
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
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  PKPaymentTransactionDetailAmountLineCompletionDate *v20;
  void *v21;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "fees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[PKPaymentTransactionDetailAmountLineItemGenerator _totalTransferredItemForTransaction:](self, "_totalTransferredItemForTransaction:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);
    -[PKPaymentTransactionDetailAmountLineItemGenerator _feeLineItemsForFees:](self, "_feeLineItemsForFees:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasTrailingLineSeperator:", 1);

    objc_msgSend(v6, "addObjectsFromArray:", v11);
    -[PKPaymentTransactionDetailAmountLineItemGenerator _totalPaidLineItemForTransaction:isUnqualified:](self, "_totalPaidLineItemForTransaction:isUnqualified:", v5, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHasTrailingLineSeperator:", 1);
    objc_msgSend(v6, "addObject:", v13);

  }
  objc_msgSend(v5, "transfers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && objc_msgSend(v5, "transactionStatus") != 2)
  {
    v16 = objc_msgSend(v15, "fundsAreAvailable");
    objc_msgSend(v15, "expectedCompletionDate");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if ((v16 & 1) != 0 || !v17)
    {
      objc_msgSend(v5, "transactionStatusChangedDate");
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }
    if (v16)
    {
      v20 = -[PKPaymentTransactionDetailAmountLineCompletionDate initWithDate:completed:]([PKPaymentTransactionDetailAmountLineCompletionDate alloc], "initWithDate:completed:", v18, 1);
      -[PKPaymentTransactionDetailAmountLineCompletionDate setHasTrailingLineSeperator:](v20, "setHasTrailingLineSeperator:", 1);
      objc_msgSend(v6, "addObject:", v20);

    }
  }
  if (objc_msgSend(v6, "count"))
    v21 = (void *)objc_msgSend(v6, "copy");
  else
    v21 = 0;

  return v21;
}

- (id)_lineItemsForPurchaseTransaction:(id)a3 transactionSourceCollection:(id)a4 associatedReceipt:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  PKPaymentTransactionDetailAmountLineItemGeneric *v34;
  void *v35;
  void *v36;
  PKPaymentTransactionDetailAmountLineItemGeneric *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  uint64_t v50;
  __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  PKPaymentTransactionDetailAmountLineItemGeneric *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  PKPaymentTransactionDetailAmountLineItemGeneric *v64;
  void *v65;
  void *v66;
  void *v67;
  PKPaymentTransactionDetailAmountLineItemGeneric *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  PKPaymentTransactionDetailAmountLineItemGenerator *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  PKPaymentTransactionDetailAmountLineItemGenerator *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v91 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "foreignExchangeInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_15;
  objc_msgSend(v9, "destinationCurrencyAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  v15 = v13;
  v16 = v15;
  if (v14 == v15)
  {

    goto LABEL_8;
  }
  if (v14 && v15)
  {
    v17 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v17 & 1) == 0)
      goto LABEL_11;
LABEL_8:
    objc_msgSend(v10, "exchangeRate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    if (v20 == 1.0)
      goto LABEL_15;
    goto LABEL_12;
  }

LABEL_11:
LABEL_12:
  objc_msgSend(v7, "foreignExchangeInformation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionDetailAmountLineItemGenerator _foreignExchangeLineItemsForExchangeInfo:](self, "_foreignExchangeLineItemsForExchangeInfo:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "lastObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHasTrailingLineSeperator:", 1);

  if (objc_msgSend(v22, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v22);

LABEL_15:
  if (v91)
  {
    objc_msgSend(v91, "lineItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pk_arrayByApplyingBlock:", &__block_literal_global_236);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHasTrailingLineSeperator:", 1);

    objc_msgSend(v8, "addObjectsFromArray:", v25);
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v91, "summaryItems");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "subtotalCurrencyAmount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "totalCurrencyAmount");
    v29 = objc_claimAutoreleasedReturnValue();
    v90 = v28;
    v88 = (void *)v29;
    if (v28)
    {
      v30 = (void *)v29;
      if (v29)
      {
        objc_msgSend(v28, "amount");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "amount");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "compare:", v32);

        if (v33)
        {
          v34 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
          PKLocalizedPaymentString(CFSTR("SUBTOTAL"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "formattedStringValue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v34, "initWithLabel:value:", v35, v36);

          -[PKPaymentTransactionDetailAmountLineItemGeneric setIsEmphasized:](v37, "setIsEmphasized:", 1);
          objc_msgSend(v27, "addObject:", v37);

        }
      }
    }
    v38 = v89;
    if (v89)
    {
      v83 = v25;
      v84 = self;
      v85 = v10;
      v86 = v8;
      v87 = v7;
      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v39 = v89;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v96;
LABEL_23:
        v43 = 0;
        while (2)
        {
          if (*(_QWORD *)v96 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v43);
          objc_msgSend(v44, "currencyAmount");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "formattedStringValue");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          switch(objc_msgSend(v44, "type"))
          {
            case 0:
              objc_msgSend(v44, "label");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
                goto LABEL_36;
              v48 = CFSTR("TRANSACTION_RECEIPT_OTHER");
              goto LABEL_42;
            case 1:
              objc_msgSend(v44, "label");
              v50 = objc_claimAutoreleasedReturnValue();
              if (!v50)
              {
                if (objc_msgSend(v91, "state") == 2)
                  v51 = CFSTR("TRANSACTION_RECEIPT_TAX");
                else
                  v51 = CFSTR("TRANSACTION_RECEIPT_ESTIMATED_TAX");
                PKLocalizedPaymentString(&v51->isa);
                v50 = objc_claimAutoreleasedReturnValue();
              }
              v49 = (void *)v50;
              goto LABEL_47;
            case 2:
              objc_msgSend(v44, "label");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
                goto LABEL_36;
              v48 = CFSTR("TRANSACTION_RECEIPT_SHIPPING");
              goto LABEL_42;
            case 3:
              objc_msgSend(v44, "label");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
              {
LABEL_36:
                v52 = v47;
              }
              else
              {
                v48 = CFSTR("TRANSACTION_RECEIPT_FEE");
LABEL_42:
                PKLocalizedPaymentString(&v48->isa);
                v52 = (id)objc_claimAutoreleasedReturnValue();
              }
              v49 = v52;

LABEL_47:
              v57 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:]([PKPaymentTransactionDetailAmountLineItemGeneric alloc], "initWithLabel:value:", v49, v46);
              objc_msgSend(v27, "addObject:", v57);

              if (v41 != ++v43)
                continue;
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
              if (!v41)
                goto LABEL_49;
              goto LABEL_23;
            case 4:
              objc_msgSend(v44, "label");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = v53;
              if (v53)
              {
                v55 = v53;
              }
              else
              {
                PKLocalizedPaymentString(CFSTR("TRANSACTION_RECEIPT_CREDIT"));
                v55 = (id)objc_claimAutoreleasedReturnValue();
              }
              v49 = v55;

              PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v46);
              v56 = objc_claimAutoreleasedReturnValue();

              v46 = (void *)v56;
              goto LABEL_47;
            default:
              v49 = 0;
              goto LABEL_47;
          }
        }
      }
LABEL_49:

      v8 = v86;
      v7 = v87;
      self = v84;
      v10 = v85;
      v25 = v83;
      v38 = v89;
    }
    objc_msgSend(v27, "lastObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setHasTrailingLineSeperator:", 1);

    if (objc_msgSend(v27, "count"))
      objc_msgSend(v8, "addObjectsFromArray:", v27);

  }
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "nominalAmount");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    objc_msgSend(v7, "amountModifiers");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "count");

    if (v63)
    {
      v64 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
      PKLocalizedPaymentString(CFSTR("SUBTOTAL"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nominalCurrencyAmount");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "formattedStringValue");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v64, "initWithLabel:value:", v65, v67);

      -[PKPaymentTransactionDetailAmountLineItemGeneric setIsEmphasized:](v68, "setIsEmphasized:", 0);
      objc_msgSend(v59, "addObject:", v68);
      objc_msgSend(v7, "amountModifiers");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "count");
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __132__PKPaymentTransactionDetailAmountLineItemGenerator__lineItemsForPurchaseTransaction_transactionSourceCollection_associatedReceipt___block_invoke_2;
      v92[3] = &unk_1E3E7A8E8;
      v94 = v70 - 1;
      v71 = v59;
      v93 = v71;
      objc_msgSend(v69, "enumerateObjectsUsingBlock:", v92);
      if (objc_msgSend(v71, "count"))
        objc_msgSend(v8, "addObjectsFromArray:", v71);

    }
  }
  -[PKPaymentTransactionDetailAmountLineItemGenerator _totalPaidLineItemForTransaction:isUnqualified:](self, "_totalPaidLineItemForTransaction:isUnqualified:", v7, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v72);
  objc_msgSend(v7, "rewards");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend(v7, "rewards");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rewardsTotalCurrencyCode");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      -[PKPaymentTransactionDetailAmountLineItemGenerator _rewardsLineItemsForRewards:currencyCode:](self, "_rewardsLineItemsForRewards:currencyCode:", v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "currencyCode");
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = self;
      v79 = (void *)v77;
      -[PKPaymentTransactionDetailAmountLineItemGenerator _rewardsLineItemsForRewards:currencyCode:](v78, "_rewardsLineItemsForRewards:currencyCode:", v74, v77);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v76, "lastObject");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setHasTrailingLineSeperator:", 1);

    if (objc_msgSend(v76, "count"))
      objc_msgSend(v8, "addObjectsFromArray:", v76);
    else
      objc_msgSend(v72, "setHasTrailingLineSeperator:", 1);

  }
  else
  {
    objc_msgSend(v72, "setHasTrailingLineSeperator:", 1);
  }
  v81 = (void *)objc_msgSend(v8, "copy");

  return v81;
}

PKPaymentTransactionDetailAmountLineItemReceipt *__132__PKPaymentTransactionDetailAmountLineItemGenerator__lineItemsForPurchaseTransaction_transactionSourceCollection_associatedReceipt___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPaymentTransactionDetailAmountLineItemReceipt *v3;

  v2 = a2;
  v3 = -[PKPaymentTransactionDetailAmountLineItemReceipt initWithReceiptLineItem:]([PKPaymentTransactionDetailAmountLineItemReceipt alloc], "initWithReceiptLineItem:", v2);

  return v3;
}

void __132__PKPaymentTransactionDetailAmountLineItemGenerator__lineItemsForPurchaseTransaction_transactionSourceCollection_associatedReceipt___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  PKPaymentTransactionDetailAmountLineItemGeneric *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentTransactionDetailAmountLineItemGeneric *v11;

  v5 = a2;
  v6 = [PKPaymentTransactionDetailAmountLineItemGeneric alloc];
  objc_msgSend(v5, "modifierDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formattedStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKPaymentTransactionDetailAmountLineItemGeneric initWithLabel:value:](v6, "initWithLabel:value:", v7, v10);

  if (*(_QWORD *)(a1 + 40) == a3)
    -[PKPaymentTransactionDetailAmountLineItemGeneric setHasTrailingLineSeperator:](v11, "setHasTrailingLineSeperator:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

- (id)_lineItemsForPeerPaymentTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "fees");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fees");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v6, "peerPaymentType");
  v13 = objc_msgSend(v11, "count");
  objc_msgSend(v6, "secondaryFundingSourceAmount");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v6, "secondaryFundingSourceCurrencyCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PKPaymentTransactionDetailAmountLineItemGenerator _primaryFundingSourceLineItemForTransaction:transactionSourceCollection:](self, "_primaryFundingSourceLineItemForTransaction:transactionSourceCollection:", v6, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v17);
      -[PKPaymentTransactionDetailAmountLineItemGenerator _secondaryFundingSourceLineItemForTransaction:](self, "_secondaryFundingSourceLineItemForTransaction:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHasTrailingLineSeperator:", 1);
      objc_msgSend(v8, "addObject:", v18);

    }
  }
  switch(v12)
  {
    case 0:
      -[PKPaymentTransactionDetailAmountLineItemGenerator _subtotalLineItemForTransaction:](self, "_subtotalLineItemForTransaction:", v6);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      -[PKPaymentTransactionDetailAmountLineItemGenerator _totalSentLineItemForTransaction:](self, "_totalSentLineItemForTransaction:", v6);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      -[PKPaymentTransactionDetailAmountLineItemGenerator _totalReceivedLineItemForTransaction:](self, "_totalReceivedLineItemForTransaction:", v6);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      -[PKPaymentTransactionDetailAmountLineItemGenerator _totalRequestedLineItemForTransaction:](self, "_totalRequestedLineItemForTransaction:", v6);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v20 = (void *)v19;
      if (v19)
        objc_msgSend(v8, "addObject:", v19);
      break;
    default:
      v20 = 0;
      break;
  }
  if (v13)
  {
    -[PKPaymentTransactionDetailAmountLineItemGenerator _feeLineItemsForFees:](self, "_feeLineItemsForFees:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHasTrailingLineSeperator:", 1);

    objc_msgSend(v8, "addObjectsFromArray:", v21);
    -[PKPaymentTransactionDetailAmountLineItemGenerator _totalPaidLineItemForTransaction:isUnqualified:](self, "_totalPaidLineItemForTransaction:isUnqualified:", v6, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHasTrailingLineSeperator:", 1);
    objc_msgSend(v8, "addObject:", v23);

  }
  else
  {
    objc_msgSend(v20, "setHasTrailingLineSeperator:", 1);
  }
  v24 = (void *)objc_msgSend(v8, "copy");

  return v24;
}

- (id)_secondaryFundingSourceLineItemForTransaction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPaymentTransactionDetailAmountLineItemFundingSource *v12;
  void *v13;
  PKPaymentTransactionDetailAmountLineItemFundingSource *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  PKPaymentTransactionDetailAmountLineItemFundingSource *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int16 v23;
  uint8_t buf[2];

  v3 = a3;
  objc_msgSend(v3, "secondaryFundingSourceAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryFundingSourceCurrencyCode");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v4, v5, 0);
  objc_msgSend(v3, "secondaryFundingSourceFPANIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 0;
      v16 = "Transaction alternative funding source does not contain an FPAN ID, falling back to pass description in transaction";
      v17 = (uint8_t *)&v23;
LABEL_11:
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
    }
LABEL_12:

    v18 = [PKPaymentTransactionDetailAmountLineItemFundingSource alloc];
    v19 = objc_msgSend(v3, "secondaryFundingSourceNetwork");
    objc_msgSend(v3, "secondaryFundingSourceDPANSuffix");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "secondaryFundingSourceDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKPaymentTransactionDetailAmountLineItemFundingSource initWithAmount:credentialType:dpanSuffix:cardDescription:](v18, "initWithAmount:credentialType:dpanSuffix:cardDescription:", v7, v19, v20, v21);

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "passWithFPANIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Pass matching alternative funding source FPAN ID not found in library, falling back to pass description in transaction";
      v17 = buf;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v10);
  v12 = [PKPaymentTransactionDetailAmountLineItemFundingSource alloc];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67738]), "initWithTransactionSource:", v11);
  v14 = -[PKPaymentTransactionDetailAmountLineItemFundingSource initWithAmount:transactionSourceCollection:](v12, "initWithAmount:transactionSourceCollection:", v7, v13);

LABEL_13:
  return v14;
}

- (id)_primaryFundingSourceLineItemForTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentTransactionDetailAmountLineItemFundingSource *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "primaryFundingSourceAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryFundingSourceCurrencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v7 && v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v7, v8, 0);
  v10 = -[PKPaymentTransactionDetailAmountLineItemFundingSource initWithAmount:transactionSourceCollection:]([PKPaymentTransactionDetailAmountLineItemFundingSource alloc], "initWithAmount:transactionSourceCollection:", v9, v5);

  return v10;
}

- (id)_totalPaidLineItemForTransaction:(id)a3 isUnqualified:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PKPaymentTransactionDetailAmountLineItemTotal *v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v6 && v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v6, v7, 0);
  if (v4)
    v9 = 4;
  else
    v9 = 0;
  v10 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:]([PKPaymentTransactionDetailAmountLineItemTotal alloc], "initWithAmount:totalType:", v8, v9);

  return v10;
}

- (id)_totalTransferredItemForTransaction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  PKPaymentTransactionDetailAmountLineItemTransferSource *v14;

  v3 = a3;
  objc_msgSend(v3, "subtotalAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v4, v5, 0);
  objc_msgSend(v3, "secondaryFundingSourceFPANIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "passWithFPANIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D67738]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67730]), "initWithPaymentPass:", v10);
    v13 = (void *)objc_msgSend(v11, "initWithTransactionSource:", v12);

  }
  else
  {
    v13 = 0;
  }
  v14 = -[PKPaymentTransactionDetailAmountLineItemTransferSource initWithAmount:transactionSourceCollection:]([PKPaymentTransactionDetailAmountLineItemTransferSource alloc], "initWithAmount:transactionSourceCollection:", v7, v13);

  return v14;
}

- (id)_totalSentLineItemForTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PKPaymentTransactionDetailAmountLineItemTotal *v7;

  v3 = a3;
  objc_msgSend(v3, "subtotalAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v4, v5, 0);
  v7 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:]([PKPaymentTransactionDetailAmountLineItemTotal alloc], "initWithAmount:totalType:", v6, 1);

  return v7;
}

- (id)_totalReceivedLineItemForTransaction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PKPaymentTransactionDetailAmountLineItemTotal *v9;

  v3 = a3;
  objc_msgSend(v3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v4, v5, 0);
  if ((objc_msgSend(v3, "transactionStatus") & 0xFFFFFFFFFFFFFFFELL) == 6)
    v8 = 3;
  else
    v8 = 2;
  v9 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:]([PKPaymentTransactionDetailAmountLineItemTotal alloc], "initWithAmount:totalType:", v7, v8);

  return v9;
}

- (id)_totalRequestedLineItemForTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PKPaymentTransactionDetailAmountLineItemTotal *v7;

  v3 = a3;
  objc_msgSend(v3, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v4, v5, 0);
  v7 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:]([PKPaymentTransactionDetailAmountLineItemTotal alloc], "initWithAmount:totalType:", v6, 7);

  return v7;
}

- (id)_subtotalLineItemForTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PKPaymentTransactionDetailAmountLineItemTotal *v7;

  v3 = a3;
  objc_msgSend(v3, "subtotalAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C88]), "initWithAmount:currency:exponent:", v4, v5, 0);
  v7 = -[PKPaymentTransactionDetailAmountLineItemTotal initWithAmount:totalType:]([PKPaymentTransactionDetailAmountLineItemTotal alloc], "initWithAmount:totalType:", v6, 4);

  return v7;
}

- (id)_feeLineItemsForFees:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PKPaymentTransactionDetailAmountLineItemFee *v11;
  PKPaymentTransactionDetailAmountLineItemFee *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [PKPaymentTransactionDetailAmountLineItemFee alloc];
        v12 = -[PKPaymentTransactionDetailAmountLineItemFee initWithFeeItem:](v11, "initWithFeeItem:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_272);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __74__PKPaymentTransactionDetailAmountLineItemGenerator__feeLineItemsForFees___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)_rewardsLineItemsForRewards:(id)a3 currencyCode:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  PKPaymentTransactionDetailAmountLineItemRewards *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  NSDecimalNumber *v32;
  void *v33;
  PKPaymentTransactionDetailAmountLineItemRewards *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  PKPaymentTransactionDetailAmountLineItemRewards *v38;
  void *v39;
  unsigned int v41;
  void *v42;
  void *v43;
  NSDecimalNumber *v44;
  void *v45;
  id v46;
  NSString *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47 = (NSString *)a4;
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "totalEligibleValueForUnit:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v44 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "promotionalRewardsItems");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v45, "pk_hasObjectPassingTest:", &__block_literal_global_274_1);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v42 = v5;
  objc_msgSend(v5, "rewardsItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "state");
        if (v13 != 3)
        {
          v14 = v13;
          if (objc_msgSend(v12, "eligibleValueUnit") == 1)
          {
            objc_msgSend(v12, "currencyAmount");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v12, "currencyAmount");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "amount");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDecimalNumber decimalNumberByAdding:](v44, "decimalNumberByAdding:", v17);
              v18 = objc_claimAutoreleasedReturnValue();

              v44 = (NSDecimalNumber *)v18;
            }
          }
          v9 |= v14 == 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v43, "isEqualToNumber:", v19);

  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NSDecimalNumber isEqualToNumber:](v44, "isEqualToNumber:", v21);

    v23 = 0;
    if (v47 && (v22 & 1) == 0)
    {
      PKCurrencyAmountCreate(v44, v47);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = -[PKPaymentTransactionDetailAmountLineItemRewards initWithRewardsValueUnit:eligibleValue:isEligible:totalAmount:hasPromotionalReward:promotionName:]([PKPaymentTransactionDetailAmountLineItemRewards alloc], "initWithRewardsValueUnit:eligibleValue:isEligible:totalAmount:hasPromotionalReward:promotionName:", 1, v43, v9 & 1, v23, v41, 0);
    objc_msgSend(v46, "addObject:", v24);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v42, "rewardsItems");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v49 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        if (objc_msgSend(v30, "eligibleValueUnit") == 2)
        {
          v31 = objc_msgSend(v30, "state");
          objc_msgSend(v30, "eligibleValue");
          v32 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
          PKCurrencyAmountCreate(v32, v47);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = [PKPaymentTransactionDetailAmountLineItemRewards alloc];
          objc_msgSend(v30, "eligibleValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v45, "containsObject:", v30);
          objc_msgSend(v30, "promotionName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[PKPaymentTransactionDetailAmountLineItemRewards initWithRewardsValueUnit:eligibleValue:isEligible:totalAmount:hasPromotionalReward:promotionName:](v34, "initWithRewardsValueUnit:eligibleValue:isEligible:totalAmount:hasPromotionalReward:promotionName:", 2, v35, v31 == 1, v33, v36, v37);
          objc_msgSend(v46, "addObject:", v38);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v27);
  }

  v39 = (void *)objc_msgSend(v46, "copy");
  return v39;
}

BOOL __94__PKPaymentTransactionDetailAmountLineItemGenerator__rewardsLineItemsForRewards_currencyCode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eligibleValueUnit") == 1;
}

- (id)_foreignExchangeLineItemsForExchangeInfo:(id)a3
{
  id v3;
  PKPaymentTransactionDetailAmountLineItemForeignExchange *v4;
  PKPaymentTransactionDetailAmountLineItemForeignExchange *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PKPaymentTransactionDetailAmountLineItemForeignExchange initWithForeignExchangeInformation:type:]([PKPaymentTransactionDetailAmountLineItemForeignExchange alloc], "initWithForeignExchangeInformation:type:", v3, 0);
  v5 = -[PKPaymentTransactionDetailAmountLineItemForeignExchange initWithForeignExchangeInformation:type:]([PKPaymentTransactionDetailAmountLineItemForeignExchange alloc], "initWithForeignExchangeInformation:type:", v3, 1);

  v8[0] = v4;
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
