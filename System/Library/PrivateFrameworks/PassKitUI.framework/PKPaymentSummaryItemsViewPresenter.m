@implementation PKPaymentSummaryItemsViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "summaryItemsView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentView:withDataItem:forPaymentRequest:", v12, v11, v10);

}

+ (void)presentView:(id)a3 withDataItem:(id)a4 forPaymentRequest:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  BOOL v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v11, "paymentSummaryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v13, "type");

  v14 = objc_msgSend(v9, "isPeerPaymentRequest");
  v15 = objc_msgSend(v9, "_isAMPPayment");
  v51 = v9;
  v53 = objc_msgSend(v9, "requestType");
  if (v53 == 5)
    v16 = 1;
  else
    v16 = v15;
  v54 = v14;
  v49 = v16;
  v17 = (v14 | v16) == 0;
  v18 = 2;
  if (!v17)
    v18 = 0;
  v48 = v18;
  v55 = v10;
  objc_msgSend(v10, "setShowsBoldValueText:", v15);
  objc_msgSend(v11, "paymentSummaryItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v11;
  objc_msgSend(v11, "paymentSummaryItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "subarrayWithRange:", 0, objc_msgSend(v20, "count") - 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v21;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v52)
  {
    v47 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v57 != v47)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (!(_DWORD)v15
          || (objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "localizedAmount"),
              (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          if (objc_msgSend(v23, "type"))
            v25 = v54;
          else
            v25 = 1;
          if (v25 == 1)
          {
            objc_msgSend(v23, "amount");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "currencyCode");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            PKFormattedCurrencyStringFromNumber();
            v24 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else if (v53 == 5
                 && (objc_msgSend(v23, "amount"),
                     v28 = (void *)objc_claimAutoreleasedReturnValue(),
                     objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
                     v29 = (void *)objc_claimAutoreleasedReturnValue(),
                     v30 = objc_msgSend(v28, "isEqualToNumber:", v29),
                     v29,
                     v28,
                     (v30 & 1) != 0))
          {
            v24 = 0;
          }
          else
          {
            PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_PENDING_AMOUNT_SUMMARY_ITEM"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        if (v54)
          v31 = objc_msgSend(v23, "type") == 1;
        else
          v31 = 0;
        objc_msgSend(v23, "label");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if ((v49 & 1) == 0)
        {
          objc_msgSend(v32, "pk_uppercaseStringForPreferredLocale");
          v34 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v34;
        }
        objc_msgSend(v51, "localizedSummaryItemsTitle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          v36 = v15;
        else
          v36 = 0;
        if (v36 == 1)
        {
          objc_msgSend(v55, "setTitle:", v35);
        }
        else if (v53 == 5)
        {
          PKLocalizedBeekmanString(CFSTR("INSTALLMENT_PRICE"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "pk_uppercaseStringForPreferredLocale");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setTitle:", v38);

        }
        if ((_DWORD)v15)
        {
          objc_msgSend(v23, "localizedTitle");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v23, "useDarkColor");
          if (v53 == 5)
            v41 = 1;
          else
            v41 = v40;
          v42 = objc_msgSend(v23, "useLargeFont");
        }
        else
        {
          v39 = 0;
          v42 = 0;
          v41 = v53 == 5;
        }
        if (v50 == 1)
          v43 = 1;
        else
          v43 = objc_msgSend(v23, "type");
        BYTE2(v44) = v42;
        BYTE1(v44) = v41;
        LOBYTE(v44) = v31;
        objc_msgSend(v55, "addLabel:value:title:itemType:maxLabelLines:maxValueLines:hasBottomPadding:useDarkColor:useLargeFont:", v33, v24, v39, v43, v48, v15 ^ 1, v44);

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v52);
  }

}

@end
