@implementation PKPaymentRequest

- (BOOL)isPayLaterPaymentRequest
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)payLaterPaymentRequest
{
  PKPaymentRequest *v3;

  if (-[PKPaymentRequest isPayLaterPaymentRequest](self, "isPayLaterPaymentRequest"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)disbursementPaymentRequest
{
  PKPaymentRequest *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (PKPaymentRequest)requestWithProtobuf:(id)a3
{
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  int v7;
  __objc2_class **v8;
  id v9;
  void *v10;
  void *v11;
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
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "requestType") == 10;
  objc_msgSend(v3, "summaryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasDisbursementSummaryItem");

  v8 = off_1E2A9EA10;
  if ((v4 & v7) == 0)
    v8 = off_1E2A9FA78;
  v9 = objc_alloc_init(*v8);
  objc_msgSend(v9, "setAPIType:", objc_msgSend(v3, "apiType"));
  objc_msgSend(v3, "merchantIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMerchantIdentifier:", v10);

  objc_msgSend(v3, "countryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCountryCode:", v11);

  objc_msgSend(v3, "currencyCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrencyCode:", v12);

  objc_msgSend(v3, "supportedNetworks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSupportedNetworks:", v13);

  objc_msgSend(v9, "setMerchantCapabilities:", objc_msgSend(v3, "merchantCapabilities"));
  objc_msgSend(v9, "setRequiredBillingAddressFields:", objc_msgSend(v3, "requiredBillingAddressFields"));
  objc_msgSend(v9, "setRequiredShippingAddressFields:", objc_msgSend(v3, "requiredShippingAddressFields"));
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "requiredShippingContactFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequiredShippingContactFields:", v16);

  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "requiredBillingContactFields");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequiredBillingContactFields:", v19);

  objc_msgSend(v3, "applicationData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setApplicationData:", v20);

  v21 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "originatingURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "URLWithString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOriginatingURL:", v23);

  v24 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "supportedCountries");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSupportedCountries:", v26);

  objc_msgSend(v3, "userAgent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserAgent:", v27);

  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(v3, "thumbnailURLs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v95;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v95 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v33));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
    }
    while (v31);
  }

  if (objc_msgSend(v28, "count"))
  {
    v35 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v9, "setThumbnailURLs:", v35);

  }
  if (objc_msgSend(v3, "hasMerchantSession"))
  {
    objc_msgSend(v3, "merchantSession");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentMerchantSession paymentMerchantSessionWithProtobuf:](PKPaymentMerchantSession, "paymentMerchantSessionWithProtobuf:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMerchantSession:", v37);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend(v3, "summaryItems");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v91;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v91 != v42)
          objc_enumerationMutation(v39);
        +[PKPaymentSummaryItem itemWithProtobuf:](PKPaymentSummaryItem, "itemWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v43));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v44);

        ++v43;
      }
      while (v41 != v43);
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    }
    while (v41);
  }

  objc_msgSend(v9, "setPaymentSummaryItems:", v38);
  if (objc_msgSend(v3, "hasAvailableShippingMethods"))
  {
    objc_msgSend(v3, "availableShippingMethods");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKShippingMethods shippingMethodsWithProtobuf:](PKShippingMethods, "shippingMethodsWithProtobuf:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAvailableShippingMethods:", v46);

  }
  else
  {
    objc_msgSend(v3, "shippingMethods");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (!v48)
      goto LABEL_33;
    v85 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend(v3, "shippingMethods");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v87;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v87 != v52)
            objc_enumerationMutation(v49);
          +[PKShippingMethod shippingMethodWithProtobuf:](PKShippingMethod, "shippingMethodWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v53));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v54);

          ++v53;
        }
        while (v51 != v53);
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
      }
      while (v51);
    }

    v9 = v85;
    objc_msgSend(v85, "setShippingMethods:", v45);
  }

LABEL_33:
  objc_msgSend(v3, "billingContact");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    v56 = (void *)MEMORY[0x1E0CB3710];
    v57 = objc_opt_class();
    objc_msgSend(v3, "billingContact");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "unarchivedObjectOfClass:fromData:error:", v57, v58, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBillingContact:", v59);

  }
  objc_msgSend(v3, "shippingContact");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    v61 = (void *)MEMORY[0x1E0CB3710];
    v62 = objc_opt_class();
    objc_msgSend(v3, "shippingContact");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "unarchivedObjectOfClass:fromData:error:", v62, v63, 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShippingContact:", v64);

  }
  objc_msgSend(v3, "multiTokenContexts");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "pk_arrayByApplyingBlock:", &__block_literal_global_113);
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v66;
  v68 = (void *)MEMORY[0x1E0C9AA60];
  if (v66)
    v68 = (void *)v66;
  v69 = v68;

  objc_msgSend(v9, "setMultiTokenContexts:", v69);
  objc_msgSend(v3, "recurringPaymentRequest");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(v3, "recurringPaymentRequest");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKRecurringPaymentRequest recurringPaymentRequestWithProtobuf:](PKRecurringPaymentRequest, "recurringPaymentRequestWithProtobuf:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRecurringPaymentRequest:", v72);

  }
  objc_msgSend(v3, "automaticReloadPaymentRequest");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    objc_msgSend(v3, "automaticReloadPaymentRequest");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKAutomaticReloadPaymentRequest automaticReloadPaymentRequestWithProtobuf:](PKAutomaticReloadPaymentRequest, "automaticReloadPaymentRequestWithProtobuf:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutomaticReloadPaymentRequest:", v75);

  }
  objc_msgSend(v3, "deferredPaymentRequest");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v3, "deferredPaymentRequest");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDeferredPaymentRequest deferredPaymentRequestWithProtobuf:](PKDeferredPaymentRequest, "deferredPaymentRequestWithProtobuf:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeferredPaymentRequest:", v78);

  }
  objc_msgSend(v3, "contentItems");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "pk_arrayByApplyingBlock:", &__block_literal_global_119);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPaymentContentItems:", v80);
  objc_msgSend(v3, "localizedNavigationTitle");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalizedNavigationTitle:", v81);

  objc_msgSend(v3, "localizedSummaryItemsTitle");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalizedSummaryItemsTitle:", v82);

  objc_msgSend(v9, "setSuppressTotal:", objc_msgSend(v3, "suppressTotal"));
  objc_msgSend(v9, "setPaymentSummaryPinned:", objc_msgSend(v3, "summaryPinned"));
  objc_msgSend(v9, "setRequestor:", (int)objc_msgSend(v3, "requestor"));
  objc_msgSend(v9, "setConfirmationStyle:", (int)objc_msgSend(v3, "confirmationStyle"));
  objc_msgSend(v9, "setRequestType:", (int)objc_msgSend(v3, "requestType"));
  objc_msgSend(v9, "setRespectSupportedNetworksOrder:", objc_msgSend(v3, "respectSupportedNetworksOrder"));
  objc_msgSend(v9, "setRequestorDeviceType:", (int)objc_msgSend(v3, "requestorDeviceType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "merchantCategoryCode"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMerchantCategoryCode:", objc_msgSend(v83, "shortValue"));

  return (PKPaymentRequest *)v9;
}

PKPaymentTokenContext *__50__PKPaymentRequest_Protobuf__requestWithProtobuf___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PKPaymentTokenContext contextWithProtobuf:](PKPaymentTokenContext, "contextWithProtobuf:", a2);
}

PKPaymentContentItem *__50__PKPaymentRequest_Protobuf__requestWithProtobuf___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PKPaymentContentItem itemWithProtobuf:](PKPaymentContentItem, "itemWithProtobuf:", a2);
}

- (id)protobuf
{
  PKProtobufPaymentRequest *v3;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PKProtobufPaymentRequest);
  -[PKProtobufPaymentRequest setApiType:](v3, "setApiType:", -[PKPaymentRequest APIType](self, "APIType"));
  -[PKPaymentRequest merchantIdentifier](self, "merchantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setMerchantIdentifier:](v3, "setMerchantIdentifier:", v4);

  -[PKPaymentRequest countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setCountryCode:](v3, "setCountryCode:", v5);

  -[PKPaymentRequest currencyCode](self, "currencyCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setCurrencyCode:](v3, "setCurrencyCode:", v6);

  -[PKPaymentRequest supportedNetworks](self, "supportedNetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[PKProtobufPaymentRequest setSupportedNetworks:](v3, "setSupportedNetworks:", v8);

  -[PKProtobufPaymentRequest setMerchantCapabilities:](v3, "setMerchantCapabilities:", -[PKPaymentRequest merchantCapabilities](self, "merchantCapabilities"));
  -[PKProtobufPaymentRequest setRequiredBillingAddressFields:](v3, "setRequiredBillingAddressFields:", -[PKPaymentRequest requiredBillingAddressFields](self, "requiredBillingAddressFields"));
  -[PKProtobufPaymentRequest setRequiredShippingAddressFields:](v3, "setRequiredShippingAddressFields:", -[PKPaymentRequest requiredShippingAddressFields](self, "requiredShippingAddressFields"));
  -[PKPaymentRequest requiredBillingContactFields](self, "requiredBillingContactFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[PKProtobufPaymentRequest setRequiredBillingContactFields:](v3, "setRequiredBillingContactFields:", v11);

  -[PKPaymentRequest requiredShippingContactFields](self, "requiredShippingContactFields");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  -[PKProtobufPaymentRequest setRequiredShippingContactFields:](v3, "setRequiredShippingContactFields:", v14);

  -[PKPaymentRequest applicationData](self, "applicationData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setApplicationData:](v3, "setApplicationData:", v15);

  -[PKPaymentRequest originatingURL](self, "originatingURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setOriginatingURL:](v3, "setOriginatingURL:", v17);

  -[PKProtobufPaymentRequest setExpectsMerchantSession:](v3, "setExpectsMerchantSession:", -[PKPaymentRequest shouldUseMerchantSession](self, "shouldUseMerchantSession"));
  -[PKPaymentRequest supportedCountries](self, "supportedCountries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  -[PKProtobufPaymentRequest setSupportedCountries:](v3, "setSupportedCountries:", v20);

  -[PKPaymentRequest userAgent](self, "userAgent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setUserAgent:](v3, "setUserAgent:", v21);

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[PKPaymentRequest thumbnailURLs](self, "thumbnailURLs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v93;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v93 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v26), "absoluteString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentRequest addThumbnailURLs:](v3, "addThumbnailURLs:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
    }
    while (v24);
  }

  -[PKPaymentRequest merchantSession](self, "merchantSession");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[PKPaymentRequest merchantSession](self, "merchantSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "protobuf");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentRequest setMerchantSession:](v3, "setMerchantSession:", v30);

  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[PKPaymentRequest paymentSummaryItems](self, "paymentSummaryItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v89;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v89 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v35), "summaryItemProtobuf");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentRequest addSummaryItems:](v3, "addSummaryItems:", v36);

        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    }
    while (v33);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[PKPaymentRequest shippingMethods](self, "shippingMethods");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v85;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v85 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * v41), "shippingMethodProtobuf");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentRequest addShippingMethods:](v3, "addShippingMethods:", v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    }
    while (v39);
  }

  -[PKPaymentRequest availableShippingMethods](self, "availableShippingMethods");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "protobuf");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setAvailableShippingMethods:](v3, "setAvailableShippingMethods:", v44);

  -[PKPaymentRequest billingContact](self, "billingContact");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    v46 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPaymentRequest billingContact](self, "billingContact");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "archivedDataWithRootObject:requiringSecureCoding:error:", v47, 1, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentRequest setBillingContact:](v3, "setBillingContact:", v48);

  }
  -[PKPaymentRequest shippingContact](self, "shippingContact");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    v50 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPaymentRequest shippingContact](self, "shippingContact");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "archivedDataWithRootObject:requiringSecureCoding:error:", v51, 1, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentRequest setShippingContact:](v3, "setShippingContact:", v52);

  }
  -[PKPaymentRequest multiTokenContexts](self, "multiTokenContexts");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "count");

  if (v54)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[PKPaymentRequest multiTokenContexts](self, "multiTokenContexts");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v81;
      do
      {
        v59 = 0;
        do
        {
          if (*(_QWORD *)v81 != v58)
            objc_enumerationMutation(v55);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * v59), "protobuf");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKProtobufPaymentRequest addMultiTokenContexts:](v3, "addMultiTokenContexts:", v60);

          ++v59;
        }
        while (v57 != v59);
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
      }
      while (v57);
    }

  }
  -[PKPaymentRequest recurringPaymentRequest](self, "recurringPaymentRequest");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "protobuf");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setRecurringPaymentRequest:](v3, "setRecurringPaymentRequest:", v62);

  -[PKPaymentRequest automaticReloadPaymentRequest](self, "automaticReloadPaymentRequest");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "protobuf");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setAutomaticReloadPaymentRequest:](v3, "setAutomaticReloadPaymentRequest:", v64);

  -[PKPaymentRequest deferredPaymentRequest](self, "deferredPaymentRequest");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "protobuf");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setDeferredPaymentRequest:](v3, "setDeferredPaymentRequest:", v66);

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  -[PKPaymentRequest paymentContentItems](self, "paymentContentItems", 0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v77;
    do
    {
      v71 = 0;
      do
      {
        if (*(_QWORD *)v77 != v70)
          objc_enumerationMutation(v67);
        objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * v71), "protobuf");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentRequest addContentItems:](v3, "addContentItems:", v72);

        ++v71;
      }
      while (v69 != v71);
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
    }
    while (v69);
  }

  -[PKPaymentRequest localizedNavigationTitle](self, "localizedNavigationTitle");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setLocalizedNavigationTitle:](v3, "setLocalizedNavigationTitle:", v73);

  -[PKPaymentRequest localizedSummaryItemsTitle](self, "localizedSummaryItemsTitle");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentRequest setLocalizedSummaryItemsTitle:](v3, "setLocalizedSummaryItemsTitle:", v74);

  -[PKProtobufPaymentRequest setSuppressTotal:](v3, "setSuppressTotal:", -[PKPaymentRequest suppressTotal](self, "suppressTotal"));
  -[PKProtobufPaymentRequest setSummaryPinned:](v3, "setSummaryPinned:", -[PKPaymentRequest isPaymentSummaryPinned](self, "isPaymentSummaryPinned"));
  -[PKProtobufPaymentRequest setRequestor:](v3, "setRequestor:", -[PKPaymentRequest requestor](self, "requestor"));
  -[PKProtobufPaymentRequest setConfirmationStyle:](v3, "setConfirmationStyle:", -[PKPaymentRequest confirmationStyle](self, "confirmationStyle"));
  -[PKProtobufPaymentRequest setRequestType:](v3, "setRequestType:", -[PKPaymentRequest requestType](self, "requestType"));
  -[PKProtobufPaymentRequest setRespectSupportedNetworksOrder:](v3, "setRespectSupportedNetworksOrder:", -[PKPaymentRequest respectSupportedNetworksOrder](self, "respectSupportedNetworksOrder"));
  -[PKProtobufPaymentRequest setRequestorDeviceType:](v3, "setRequestorDeviceType:", -[PKPaymentRequest requestorDeviceType](self, "requestorDeviceType"));
  -[PKProtobufPaymentRequest setMerchantCategoryCode:](v3, "setMerchantCategoryCode:", -[PKPaymentRequest merchantCategoryCode](self, "merchantCategoryCode"));
  return v3;
}

- (BOOL)isServiceProviderPaymentRequest
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)serviceProviderPaymentRequest
{
  PKPaymentRequest *v3;

  if (-[PKPaymentRequest isServiceProviderPaymentRequest](self, "isServiceProviderPaymentRequest"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isAccountServiceTransferRequest
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)accountServiceTransferRequest
{
  PKPaymentRequest *v3;

  if (-[PKPaymentRequest isAccountServiceTransferRequest](self, "isAccountServiceTransferRequest"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isPeerPaymentRequest
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)peerPaymentRequest
{
  PKPaymentRequest *v3;

  if (-[PKPaymentRequest isPeerPaymentRequest](self, "isPeerPaymentRequest"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isVirtualCardRequest
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isVirtualCardEnrollmentRequest
{
  _BOOL4 v3;

  v3 = -[PKPaymentRequest isVirtualCardRequest](self, "isVirtualCardRequest");
  if (v3)
    LOBYTE(v3) = -[PKPaymentRequest requestType](self, "requestType") == 12;
  return v3;
}

- (BOOL)isVirtualCardRefreshRequest
{
  _BOOL4 v3;

  v3 = -[PKPaymentRequest isVirtualCardRequest](self, "isVirtualCardRequest");
  if (v3)
    LOBYTE(v3) = -[PKPaymentRequest requestType](self, "requestType") == 14;
  return v3;
}

- (id)virtualCardEnrollmentRequest
{
  PKPaymentRequest *v3;

  if (-[PKPaymentRequest isVirtualCardEnrollmentRequest](self, "isVirtualCardEnrollmentRequest"))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (NSArray)availableNetworks
{
  _QWORD v3[30];

  v3[29] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AmEx");
  v3[1] = CFSTR("Bancomat");
  v3[2] = CFSTR("PagoBancomat");
  v3[3] = CFSTR("Bancontact");
  v3[4] = CFSTR("CarteBancaire");
  v3[5] = CFSTR("CarteBancaires");
  v3[6] = CFSTR("CartesBancaires");
  v3[7] = CFSTR("ChinaUnionPay");
  v3[8] = CFSTR("Dankort");
  v3[9] = CFSTR("Discover");
  v3[10] = CFSTR("Eftpos");
  v3[11] = CFSTR("Electron");
  v3[12] = CFSTR("Elo");
  v3[13] = CFSTR("girocard");
  v3[14] = CFSTR("Interac");
  v3[15] = CFSTR("iD");
  v3[16] = CFSTR("JCB");
  v3[17] = CFSTR("mada");
  v3[18] = CFSTR("Maestro");
  v3[19] = CFSTR("MasterCard");
  v3[20] = CFSTR("Meeza");
  v3[21] = CFSTR("Mir");
  v3[22] = CFSTR("NAPAS");
  v3[23] = CFSTR("BankAxept");
  v3[24] = CFSTR("PostFinanceAG");
  v3[25] = CFSTR("PrivateLabel");
  v3[26] = CFSTR("QUICPay");
  v3[27] = CFSTR("Visa");
  v3[28] = CFSTR("VPay");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 29);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)version
{
  return 4;
}

- (PKPaymentRequest)init
{
  PKPaymentRequest *v2;
  PKPaymentRequest *v3;
  NSSet *v4;
  NSSet *requiredBillingContactFields;
  NSSet *v6;
  NSSet *requiredShippingContactFields;
  NSArray *multiTokenContexts;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentRequest;
  v2 = -[PKPaymentRequest init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shippingContactEditingMode = 1;
    v2->_applePayLaterAvailability = 0;
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    requiredBillingContactFields = v3->_requiredBillingContactFields;
    v3->_requiredBillingContactFields = v4;

    v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    requiredShippingContactFields = v3->_requiredShippingContactFields;
    v3->_requiredShippingContactFields = v6;

    v3->_respectSupportedNetworksOrder = 1;
    multiTokenContexts = v3->_multiTokenContexts;
    v3->_multiTokenContexts = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (PKPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKPaymentRequest *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *countryCode;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *supportedNetworks;
  void *v15;
  uint64_t v16;
  PKAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  uint64_t v18;
  PKRecurringPaymentRequest *recurringPaymentRequest;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PKDeferredPaymentRequest *deferredPaymentRequest;
  uint64_t v28;
  NSString *currencyCode;
  uint64_t v30;
  NSData *applicationData;
  uint64_t v32;
  NSString *couponCode;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSArray *paymentSummaryItems;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSSet *requiredBillingContactFields;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSSet *requiredShippingContactFields;
  void *v50;
  uint64_t v51;
  NSString *shippingEditableMessage;
  void *v53;
  uint64_t v54;
  PKContact *shippingContact;
  uint64_t v56;
  PKContact *billingContact;
  void *v58;
  uint64_t v59;
  NSString *remoteNetworkRequestPaymentTopicID;
  void *v61;
  uint64_t v62;
  NSString *passTypeIdentifier;
  uint64_t v64;
  NSString *passSerialNumber;
  uint64_t v66;
  NSURL *originatingURL;
  uint64_t v68;
  PKPaymentMerchantSession *merchantSession;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSArray *thumbnailURLs;
  uint64_t v75;
  NSString *userAgent;
  double v77;
  uint64_t v78;
  PKApplePayTrustSignatureRequest *applePayTrustSignatureRequest;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  NSArray *bankAccounts;
  uint64_t v85;
  NSDate *paymentDate;
  uint64_t v87;
  NSTimeZone *paymentTimeZone;
  uint64_t v89;
  NSString *sourceApplicationBundleIdentifier;
  uint64_t v91;
  NSString *sourceApplicationSecondaryIdentifier;
  uint64_t v93;
  NSString *CTDataConnectionServiceType;
  uint64_t v95;
  NSString *boundInterfaceIdentifier;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  NSSet *supportedCountries;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  NSArray *paymentContentItems;
  uint64_t v107;
  NSData *externalizedContext;
  uint64_t v109;
  AKAppleIDAuthenticationContext *appleIDAuthenticationContext;
  uint64_t v111;
  NSString *clientViewSourceIdentifier;
  uint64_t v113;
  NSDictionary *clientViewSourceParameter;
  uint64_t v115;
  NSString *localizedNavigationTitle;
  uint64_t v117;
  NSString *localizedConfirmationTitle;
  uint64_t v119;
  NSString *localizedBiometricConfirmationTitle;
  uint64_t v121;
  NSString *localizedPasswordButtonTitle;
  uint64_t v123;
  NSString *localizedSummaryItemsTitle;
  uint64_t v125;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  uint64_t v127;
  NSString *localizedErrorMessage;
  uint64_t v129;
  NSString *localizedAuthorizingTitle;
  uint64_t v131;
  NSString *localizedCallbackErrorTitle;
  uint64_t v133;
  NSString *localizedCallbackErrorMessage;
  uint64_t v135;
  NSString *localizedBiometricRetryMessage;
  uint64_t v137;
  NSString *localizedUnboundBiometricMessage;
  uint64_t v139;
  NSDictionary *clientAnalyticsParameters;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  PKShippingMethods *availableShippingMethods;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  PKShippingMethods *v150;
  PKShippingMethods *v151;
  void *v152;
  uint64_t v153;
  NSObject *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint8_t buf[8];
  uint64_t v161;
  objc_super v162;

  v4 = a3;
  v162.receiver = self;
  v162.super_class = (Class)PKPaymentRequest;
  v5 = -[PKPaymentRequest init](&v162, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("supportedNetworks"));
    v13 = objc_claimAutoreleasedReturnValue();
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSArray *)v13;

    v5->_respectSupportedNetworksOrder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("respectSupportedNetworksOrder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCapabilities"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_merchantCapabilities = objc_msgSend(v15, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automaticReloadPaymentRequest"));
    v16 = objc_claimAutoreleasedReturnValue();
    automaticReloadPaymentRequest = v5->_automaticReloadPaymentRequest;
    v5->_automaticReloadPaymentRequest = (PKAutomaticReloadPaymentRequest *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurringPaymentRequest"));
    v18 = objc_claimAutoreleasedReturnValue();
    recurringPaymentRequest = v5->_recurringPaymentRequest;
    v5->_recurringPaymentRequest = (PKRecurringPaymentRequest *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("multiTokenContexts"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (void *)v23;
    else
      v25 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_multiTokenContexts, v25);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deferredPaymentRequest"));
    v26 = objc_claimAutoreleasedReturnValue();
    deferredPaymentRequest = v5->_deferredPaymentRequest;
    v5->_deferredPaymentRequest = (PKDeferredPaymentRequest *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v28 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationData"));
    v30 = objc_claimAutoreleasedReturnValue();
    applicationData = v5->_applicationData;
    v5->_applicationData = (NSData *)v30;

    v5->_supportsCouponCode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsCouponCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("couponCode"));
    v32 = objc_claimAutoreleasedReturnValue();
    couponCode = v5->_couponCode;
    v5->_couponCode = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCategoryCode"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_merchantCategoryCode = objc_msgSend(v34, "shortValue");
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("paymentSummaryItems"));
    v38 = objc_claimAutoreleasedReturnValue();
    paymentSummaryItems = v5->_paymentSummaryItems;
    v5->_paymentSummaryItems = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("requiredBillingContactFields"));
    v43 = objc_claimAutoreleasedReturnValue();
    requiredBillingContactFields = v5->_requiredBillingContactFields;
    v5->_requiredBillingContactFields = (NSSet *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("requiredShippingContactFields"));
    v48 = objc_claimAutoreleasedReturnValue();
    requiredShippingContactFields = v5->_requiredShippingContactFields;
    v5->_requiredShippingContactFields = (NSSet *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingType"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_shippingType = objc_msgSend(v50, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingEditableMessage"));
    v51 = objc_claimAutoreleasedReturnValue();
    shippingEditableMessage = v5->_shippingEditableMessage;
    v5->_shippingEditableMessage = (NSString *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingContactEditingMode"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_shippingContactEditingMode = objc_msgSend(v53, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingContact"));
    v54 = objc_claimAutoreleasedReturnValue();
    shippingContact = v5->_shippingContact;
    v5->_shippingContact = (PKContact *)v54;

    -[PKContact sanitizePostalAddressCountry](v5->_shippingContact, "sanitizePostalAddressCountry");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingContact"));
    v56 = objc_claimAutoreleasedReturnValue();
    billingContact = v5->_billingContact;
    v5->_billingContact = (PKContact *)v56;

    -[PKContact sanitizePostalAddressCountry](v5->_billingContact, "sanitizePostalAddressCountry");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applePayLaterAvailability"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_applePayLaterAvailability = objc_msgSend(v58, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteNetworkRequestPaymentTopicID"));
    v59 = objc_claimAutoreleasedReturnValue();
    remoteNetworkRequestPaymentTopicID = v5->_remoteNetworkRequestPaymentTopicID;
    v5->_remoteNetworkRequestPaymentTopicID = (NSString *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresAddressPrecision"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiresAddressPrecision = objc_msgSend(v61, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v62 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passSerialNumber"));
    v64 = objc_claimAutoreleasedReturnValue();
    passSerialNumber = v5->_passSerialNumber;
    v5->_passSerialNumber = (NSString *)v64;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingURL"));
    v66 = objc_claimAutoreleasedReturnValue();
    originatingURL = v5->_originatingURL;
    v5->_originatingURL = (NSURL *)v66;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantSession"));
    v68 = objc_claimAutoreleasedReturnValue();
    merchantSession = v5->_merchantSession;
    v5->_merchantSession = (PKPaymentMerchantSession *)v68;

    v70 = (void *)MEMORY[0x1E0C99E60];
    v71 = objc_opt_class();
    objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v72, CFSTR("thumbnailURLs"));
    v73 = objc_claimAutoreleasedReturnValue();
    thumbnailURLs = v5->_thumbnailURLs;
    v5->_thumbnailURLs = (NSArray *)v73;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userAgent"));
    v75 = objc_claimAutoreleasedReturnValue();
    userAgent = v5->_userAgent;
    v5->_userAgent = (NSString *)v75;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("clientCallbackTimeout"));
    v5->_clientCallbackTimeout = v77;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applePayTrustSignatureRequest"));
    v78 = objc_claimAutoreleasedReturnValue();
    applePayTrustSignatureRequest = v5->_applePayTrustSignatureRequest;
    v5->_applePayTrustSignatureRequest = (PKApplePayTrustSignatureRequest *)v78;

    v80 = (void *)MEMORY[0x1E0C99E60];
    v81 = objc_opt_class();
    objc_msgSend(v80, "setWithObjects:", v81, objc_opt_class(), 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v82, CFSTR("bankAccounts"));
    v83 = objc_claimAutoreleasedReturnValue();
    bankAccounts = v5->_bankAccounts;
    v5->_bankAccounts = (NSArray *)v83;

    v5->_accountPaymentSupportsPeerPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accountPaymentSupportsPeerPayment"));
    v5->_deviceSupportsPeerPaymentAccountPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceSupportsPeerPaymentAccountPayment"));
    v5->_accountPaymentUsePeerPaymentBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accountPaymentUsePeerPaymentBalance"));
    v5->_paymentFrequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentFrequency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDate"));
    v85 = objc_claimAutoreleasedReturnValue();
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v85;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentTimeZone"));
    v87 = objc_claimAutoreleasedReturnValue();
    paymentTimeZone = v5->_paymentTimeZone;
    v5->_paymentTimeZone = (NSTimeZone *)v87;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplicationBundleIdentifier"));
    v89 = objc_claimAutoreleasedReturnValue();
    sourceApplicationBundleIdentifier = v5->_sourceApplicationBundleIdentifier;
    v5->_sourceApplicationBundleIdentifier = (NSString *)v89;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceApplicationSecondaryIdentifier"));
    v91 = objc_claimAutoreleasedReturnValue();
    sourceApplicationSecondaryIdentifier = v5->_sourceApplicationSecondaryIdentifier;
    v5->_sourceApplicationSecondaryIdentifier = (NSString *)v91;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CTDataConnectionServiceType"));
    v93 = objc_claimAutoreleasedReturnValue();
    CTDataConnectionServiceType = v5->_CTDataConnectionServiceType;
    v5->_CTDataConnectionServiceType = (NSString *)v93;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boundInterfaceIdentifier"));
    v95 = objc_claimAutoreleasedReturnValue();
    boundInterfaceIdentifier = v5->_boundInterfaceIdentifier;
    v5->_boundInterfaceIdentifier = (NSString *)v95;

    v97 = (void *)MEMORY[0x1E0C99E60];
    v98 = objc_opt_class();
    objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v99, CFSTR("supportedCountries"));
    v100 = objc_claimAutoreleasedReturnValue();
    supportedCountries = v5->_supportedCountries;
    v5->_supportedCountries = (NSSet *)v100;

    v102 = (void *)MEMORY[0x1E0C99E60];
    v103 = objc_opt_class();
    objc_msgSend(v102, "setWithObjects:", v103, objc_opt_class(), 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v104, CFSTR("paymentContentItems"));
    v105 = objc_claimAutoreleasedReturnValue();
    paymentContentItems = v5->_paymentContentItems;
    v5->_paymentContentItems = (NSArray *)v105;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalizedContext"));
    v107 = objc_claimAutoreleasedReturnValue();
    externalizedContext = v5->_externalizedContext;
    v5->_externalizedContext = (NSData *)v107;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleIDAuthenticationContext"));
    v109 = objc_claimAutoreleasedReturnValue();
    appleIDAuthenticationContext = v5->_appleIDAuthenticationContext;
    v5->_appleIDAuthenticationContext = (AKAppleIDAuthenticationContext *)v109;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientViewSourceIdentifier"));
    v111 = objc_claimAutoreleasedReturnValue();
    clientViewSourceIdentifier = v5->_clientViewSourceIdentifier;
    v5->_clientViewSourceIdentifier = (NSString *)v111;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("clientViewSourceParameter"));
    v113 = objc_claimAutoreleasedReturnValue();
    clientViewSourceParameter = v5->_clientViewSourceParameter;
    v5->_clientViewSourceParameter = (NSDictionary *)v113;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedNavigationTitle"));
    v115 = objc_claimAutoreleasedReturnValue();
    localizedNavigationTitle = v5->_localizedNavigationTitle;
    v5->_localizedNavigationTitle = (NSString *)v115;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedConfirmationTitle"));
    v117 = objc_claimAutoreleasedReturnValue();
    localizedConfirmationTitle = v5->_localizedConfirmationTitle;
    v5->_localizedConfirmationTitle = (NSString *)v117;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedBiometricConfirmationTitle"));
    v119 = objc_claimAutoreleasedReturnValue();
    localizedBiometricConfirmationTitle = v5->_localizedBiometricConfirmationTitle;
    v5->_localizedBiometricConfirmationTitle = (NSString *)v119;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedPasswordButtonTitle"));
    v121 = objc_claimAutoreleasedReturnValue();
    localizedPasswordButtonTitle = v5->_localizedPasswordButtonTitle;
    v5->_localizedPasswordButtonTitle = (NSString *)v121;

    v5->_suppressTotal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressTotal"));
    v5->_paymentSummaryPinned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("paymentSummaryPinned"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentSummaryItemsTitle"));
    v123 = objc_claimAutoreleasedReturnValue();
    localizedSummaryItemsTitle = v5->_localizedSummaryItemsTitle;
    v5->_localizedSummaryItemsTitle = (NSString *)v123;

    v5->_confirmationStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("confirmationStyle"));
    v5->_APIType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("APIType"));
    v5->_supportsInstantFundsIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsInstantFundsIn"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentConfiguration"));
    v125 = objc_claimAutoreleasedReturnValue();
    installmentConfiguration = v5->_installmentConfiguration;
    v5->_installmentConfiguration = (PKPaymentInstallmentConfiguration *)v125;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedErrorMessage"));
    v127 = objc_claimAutoreleasedReturnValue();
    localizedErrorMessage = v5->_localizedErrorMessage;
    v5->_localizedErrorMessage = (NSString *)v127;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAutorizingTitle"));
    v129 = objc_claimAutoreleasedReturnValue();
    localizedAuthorizingTitle = v5->_localizedAuthorizingTitle;
    v5->_localizedAuthorizingTitle = (NSString *)v129;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedCallbackErrorTitle"));
    v131 = objc_claimAutoreleasedReturnValue();
    localizedCallbackErrorTitle = v5->_localizedCallbackErrorTitle;
    v5->_localizedCallbackErrorTitle = (NSString *)v131;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedCallbackErrorMessage"));
    v133 = objc_claimAutoreleasedReturnValue();
    localizedCallbackErrorMessage = v5->_localizedCallbackErrorMessage;
    v5->_localizedCallbackErrorMessage = (NSString *)v133;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedBiometricRetryMessage"));
    v135 = objc_claimAutoreleasedReturnValue();
    localizedBiometricRetryMessage = v5->_localizedBiometricRetryMessage;
    v5->_localizedBiometricRetryMessage = (NSString *)v135;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedUnboundBiometricMessage"));
    v137 = objc_claimAutoreleasedReturnValue();
    localizedUnboundBiometricMessage = v5->_localizedUnboundBiometricMessage;
    v5->_localizedUnboundBiometricMessage = (NSString *)v137;

    v5->_disablePasscodeFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disablePasscodeFallback"));
    v5->_useLocationBasedAuthorization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLocationBasedAuthorization"));
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("clientAnalyticsParameters"));
    v139 = objc_claimAutoreleasedReturnValue();
    clientAnalyticsParameters = v5->_clientAnalyticsParameters;
    v5->_clientAnalyticsParameters = (NSDictionary *)v139;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_requestor = objc_msgSend(v141, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestType"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_requestType = objc_msgSend(v142, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestorDeviceType"));
    v143 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_requestorDeviceType = objc_msgSend(v143, "integerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableShippingMethods"));
    v144 = objc_claimAutoreleasedReturnValue();
    availableShippingMethods = v5->_availableShippingMethods;
    v5->_availableShippingMethods = (PKShippingMethods *)v144;

    v146 = (void *)MEMORY[0x1E0C99E60];
    v147 = objc_opt_class();
    objc_msgSend(v146, "setWithObjects:", v147, objc_opt_class(), 0);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v148, CFSTR("shippingMethods"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5->_availableShippingMethods && v149)
    {
      v150 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v149);
      v151 = v5->_availableShippingMethods;
      v5->_availableShippingMethods = v150;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessControlRef"));
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    if (v152)
    {
      v161 = 0;
      v153 = SecAccessControlCreateFromData();
      if (v153)
      {
        v5->_accesssControlRef = (__SecAccessControl *)v153;
      }
      else
      {
        PKLogFacilityTypeGetObject(0);
        v154 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v154, OS_LOG_TYPE_DEFAULT, "Error decoding access control ref", buf, 2u);
        }

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingAddress"));
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v155;
    if (v155)
      v5->_shippingAddress = (void *)objc_msgSend(v155, "ABPerson");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingAddress"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v157;
    if (v157)
      v5->_billingAddress = (void *)objc_msgSend(v157, "ABPerson");

  }
  return v5;
}

- (void)dealloc
{
  __SecAccessControl *accesssControlRef;
  objc_super v4;

  accesssControlRef = self->_accesssControlRef;
  if (accesssControlRef)
    CFRelease(accesssControlRef);
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentRequest;
  -[PKPaymentRequest dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
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
  id v18;

  v18 = a3;
  objc_msgSend(v18, "encodeObject:forKey:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_supportedNetworks, CFSTR("supportedNetworks"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_respectSupportedNetworksOrder, CFSTR("respectSupportedNetworksOrder"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_merchantCapabilities);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v4, CFSTR("merchantCapabilities"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_automaticReloadPaymentRequest, CFSTR("automaticReloadPaymentRequest"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_recurringPaymentRequest, CFSTR("recurringPaymentRequest"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_deferredPaymentRequest, CFSTR("deferredPaymentRequest"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_multiTokenContexts, CFSTR("multiTokenContexts"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_supportsCouponCode, CFSTR("supportsCouponCode"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_couponCode, CFSTR("couponCode"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_paymentSummaryItems, CFSTR("paymentSummaryItems"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->_merchantCategoryCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("merchantCategoryCode"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_applicationData, CFSTR("applicationData"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_requiredShippingContactFields, CFSTR("requiredShippingContactFields"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_requiredBillingContactFields, CFSTR("requiredBillingContactFields"));
  -[PKShippingMethods legacyShippingMethods](self->_availableShippingMethods, "legacyShippingMethods");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("shippingMethods"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_availableShippingMethods, CFSTR("availableShippingMethods"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_shippingType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("shippingType"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_shippingEditableMessage, CFSTR("shippingEditableMessage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_shippingContactEditingMode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("shippingContactEditingMode"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_shippingContact, CFSTR("shippingContact"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_billingContact, CFSTR("billingContact"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPaymentRequest requiresAddressPrecision](self, "requiresAddressPrecision"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("requiresAddressPrecision"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_applePayLaterAvailability);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("applePayLaterAvailability"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_passSerialNumber, CFSTR("passSerialNumber"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_originatingURL, CFSTR("originatingURL"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_merchantSession, CFSTR("merchantSession"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_thumbnailURLs, CFSTR("thumbnailURLs"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_userAgent, CFSTR("userAgent"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_remoteNetworkRequestPaymentTopicID, CFSTR("remoteNetworkRequestPaymentTopicID"));
  objc_msgSend(v18, "encodeDouble:forKey:", CFSTR("clientCallbackTimeout"), self->_clientCallbackTimeout);
  objc_msgSend(v18, "encodeObject:forKey:", self->_applePayTrustSignatureRequest, CFSTR("applePayTrustSignatureRequest"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_bankAccounts, CFSTR("bankAccounts"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_accountPaymentSupportsPeerPayment, CFSTR("accountPaymentSupportsPeerPayment"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_deviceSupportsPeerPaymentAccountPayment, CFSTR("deviceSupportsPeerPaymentAccountPayment"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_accountPaymentUsePeerPaymentBalance, CFSTR("accountPaymentUsePeerPaymentBalance"));
  objc_msgSend(v18, "encodeInteger:forKey:", self->_paymentFrequency, CFSTR("paymentFrequency"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_paymentDate, CFSTR("paymentDate"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_paymentTimeZone, CFSTR("paymentTimeZone"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_sourceApplicationBundleIdentifier, CFSTR("sourceApplicationBundleIdentifier"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_sourceApplicationSecondaryIdentifier, CFSTR("sourceApplicationSecondaryIdentifier"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_CTDataConnectionServiceType, CFSTR("CTDataConnectionServiceType"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_supportedCountries, CFSTR("supportedCountries"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_boundInterfaceIdentifier, CFSTR("boundInterfaceIdentifier"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_externalizedContext, CFSTR("externalizedContext"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_appleIDAuthenticationContext, CFSTR("appleIDAuthenticationContext"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_clientViewSourceIdentifier, CFSTR("clientViewSourceIdentifier"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_clientViewSourceParameter, CFSTR("clientViewSourceParameter"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_paymentContentItems, CFSTR("paymentContentItems"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedNavigationTitle, CFSTR("localizedNavigationTitle"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedConfirmationTitle, CFSTR("localizedConfirmationTitle"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedBiometricConfirmationTitle, CFSTR("localizedBiometricConfirmationTitle"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedPasswordButtonTitle, CFSTR("localizedPasswordButtonTitle"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedSummaryItemsTitle, CFSTR("paymentSummaryItemsTitle"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_suppressTotal, CFSTR("suppressTotal"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_paymentSummaryPinned, CFSTR("paymentSummaryPinned"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("requestType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestor);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("requestor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requestorDeviceType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("requestorDeviceType"));

  objc_msgSend(v18, "encodeInteger:forKey:", self->_confirmationStyle, CFSTR("confirmationStyle"));
  objc_msgSend(v18, "encodeInteger:forKey:", self->_APIType, CFSTR("APIType"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_supportsInstantFundsIn, CFSTR("supportsInstantFundsIn"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_installmentConfiguration, CFSTR("installmentConfiguration"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedErrorMessage, CFSTR("localizedErrorMessage"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedAuthorizingTitle, CFSTR("localizedAutorizingTitle"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedCallbackErrorTitle, CFSTR("localizedCallbackErrorTitle"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedCallbackErrorMessage, CFSTR("localizedCallbackErrorMessage"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedBiometricRetryMessage, CFSTR("localizedBiometricRetryMessage"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_localizedUnboundBiometricMessage, CFSTR("localizedUnboundBiometricMessage"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_disablePasscodeFallback, CFSTR("disablePasscodeFallback"));
  objc_msgSend(v18, "encodeBool:forKey:", self->_useLocationBasedAuthorization, CFSTR("useLocationBasedAuthorization"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_clientAnalyticsParameters, CFSTR("clientAnalyticsParameters"));
  if (self->_accesssControlRef)
  {
    v14 = (void *)SecAccessControlCopyData();
    if (v14)
      objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("accessControlRef"));

  }
  if (self->_shippingAddress)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("shippingAddress"));

  }
  v16 = v18;
  if (self->_billingAddress)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("billingAddress"));

    v16 = v18;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentRequest *v4;
  PKPaymentRequest *v5;
  BOOL v6;

  v4 = (PKPaymentRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentRequest isEqualToPaymentRequest:](self, "isEqualToPaymentRequest:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentRequest:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  BOOL v6;
  PKApplePayTrustSignatureRequest *applePayTrustSignatureRequest;
  PKApplePayTrustSignatureRequest *v8;
  NSArray *bankAccounts;
  NSArray *v10;
  NSDate *paymentDate;
  NSDate *v12;
  NSTimeZone *paymentTimeZone;
  NSTimeZone *v14;
  PKPaymentInstallmentConfiguration *installmentConfiguration;
  PKPaymentInstallmentConfiguration *v16;
  NSString *couponCode;
  NSString *v18;
  void *v19;
  unsigned __int8 *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  BOOL v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, uint64_t, _BYTE *);
  void *v34;
  PKPaymentRequest *v35;
  unsigned __int8 *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  BOOL v41;
  _QWORD v42[27];

  v42[26] = *MEMORY[0x1E0C80C00];
  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  v6 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (self->_merchantCapabilities != *((_QWORD *)v4 + 6))
    goto LABEL_50;
  if (self->_shippingType != *((_QWORD *)v4 + 14)
    || self->_shippingContactEditingMode != *((_QWORD *)v4 + 15)
    || self->_requiresAddressPrecision != v4[16]
    || self->_requestor != *((_QWORD *)v4 + 40)
    || self->_requestorDeviceType != *((_QWORD *)v4 + 62)
    || self->_requestType != *((_QWORD *)v4 + 39))
  {
    goto LABEL_49;
  }
  applePayTrustSignatureRequest = self->_applePayTrustSignatureRequest;
  v8 = (PKApplePayTrustSignatureRequest *)*((_QWORD *)v5 + 32);
  if (applePayTrustSignatureRequest && v8)
  {
    if ((-[PKApplePayTrustSignatureRequest isEqual:](applePayTrustSignatureRequest, "isEqual:") & 1) == 0)
      goto LABEL_49;
  }
  else if (applePayTrustSignatureRequest != v8)
  {
    goto LABEL_49;
  }
  bankAccounts = self->_bankAccounts;
  v10 = (NSArray *)*((_QWORD *)v5 + 33);
  if (bankAccounts && v10)
  {
    if ((-[NSArray isEqual:](bankAccounts, "isEqual:") & 1) == 0)
      goto LABEL_49;
  }
  else if (bankAccounts != v10)
  {
    goto LABEL_49;
  }
  if (self->_accountPaymentSupportsPeerPayment != v5[10] || self->_accountPaymentUsePeerPaymentBalance != v5[11])
    goto LABEL_49;
  paymentDate = self->_paymentDate;
  v12 = (NSDate *)*((_QWORD *)v5 + 35);
  if (paymentDate && v12)
  {
    if ((-[NSDate isEqual:](paymentDate, "isEqual:") & 1) == 0)
      goto LABEL_49;
  }
  else if (paymentDate != v12)
  {
    goto LABEL_49;
  }
  if (self->_paymentFrequency == *((_QWORD *)v5 + 34))
  {
    paymentTimeZone = self->_paymentTimeZone;
    v14 = (NSTimeZone *)*((_QWORD *)v5 + 36);
    if (paymentTimeZone && v14)
    {
      if ((-[NSTimeZone isEqual:](paymentTimeZone, "isEqual:") & 1) == 0)
        goto LABEL_49;
    }
    else if (paymentTimeZone != v14)
    {
      goto LABEL_49;
    }
    if (self->_clientCallbackTimeout != *((double *)v5 + 60) || self->_supportsInstantFundsIn != v5[17])
      goto LABEL_49;
    installmentConfiguration = self->_installmentConfiguration;
    v16 = (PKPaymentInstallmentConfiguration *)*((_QWORD *)v5 + 61);
    if (installmentConfiguration && v16)
    {
      if (!-[PKPaymentInstallmentConfiguration isEqual:](installmentConfiguration, "isEqual:"))
        goto LABEL_49;
    }
    else if (installmentConfiguration != v16)
    {
      goto LABEL_49;
    }
    if (self->_supportsCouponCode != v5[8]
      || (unsigned __int16)self->_merchantCategoryCode != *((unsigned __int16 *)v5 + 10))
    {
      goto LABEL_49;
    }
    couponCode = self->_couponCode;
    v18 = (NSString *)*((_QWORD *)v5 + 7);
    if (couponCode && v18)
    {
      if ((-[NSString isEqual:](couponCode, "isEqual:") & 1) == 0)
        goto LABEL_49;
    }
    else if (couponCode != v18)
    {
      goto LABEL_49;
    }
    if (self->_respectSupportedNetworksOrder == v5[13]
      && self->_disablePasscodeFallback == v5[18]
      && self->_useLocationBasedAuthorization == v5[19])
    {
      v6 = self->_applePayLaterAvailability == *((_QWORD *)v5 + 24);
      goto LABEL_50;
    }
  }
LABEL_49:
  v6 = 0;
LABEL_50:
  v41 = v6;
  if (!*((_BYTE *)v39 + 24))
    goto LABEL_64;
  v42[0] = CFSTR("merchantIdentifier");
  v42[1] = CFSTR("multiTokenContexts");
  v42[2] = CFSTR("automaticReloadPaymentRequest");
  v42[3] = CFSTR("recurringPaymentRequest");
  v42[4] = CFSTR("deferredPaymentRequest");
  v42[5] = CFSTR("remoteNetworkRequestPaymentTopicID");
  v42[6] = CFSTR("countryCode");
  v42[7] = CFSTR("supportedNetworks");
  v42[8] = CFSTR("paymentSummaryItems");
  v42[9] = CFSTR("currencyCode");
  v42[10] = CFSTR("billingContact");
  v42[11] = CFSTR("shippingContact");
  v42[12] = CFSTR("availableShippingMethods");
  v42[13] = CFSTR("applicationData");
  v42[14] = CFSTR("shippingEditableMessage");
  v42[15] = CFSTR("shippingContactEditingMode");
  v42[16] = CFSTR("thumbnailURLs");
  v42[17] = CFSTR("requiredBillingContactFields");
  v42[18] = CFSTR("requiredShippingContactFields");
  v42[19] = CFSTR("supportedCountries");
  v42[20] = CFSTR("paymentContentItems");
  v42[21] = CFSTR("externalizedContext");
  v42[22] = CFSTR("passTypeIdentifier");
  v42[23] = CFSTR("clientViewSourceIdentifier");
  v42[24] = CFSTR("clientViewSourceParameter");
  v42[25] = CFSTR("passSerialNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __44__PKPaymentRequest_isEqualToPaymentRequest___block_invoke;
  v34 = &unk_1E2ADC4E8;
  v37 = &v38;
  v35 = self;
  v20 = v5;
  v36 = v20;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", &v31);

  if (!*((_BYTE *)v39 + 24))
    goto LABEL_64;
  if (!self->_billingAddress && !*((_QWORD *)v20 + 19))
    goto LABEL_71;
  objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:", v31, v32, v33, v34, v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:", *((_QWORD *)v20 + 19));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v21 && v22)
    v24 = objc_msgSend(v21, "isEqual:", v22);
  else
    v24 = v21 == (void *)v22;
  *((_BYTE *)v39 + 24) = v24;

  if (*((_BYTE *)v39 + 24))
  {
LABEL_71:
    if (self->_shippingAddress || *((_QWORD *)v20 + 18))
    {
      objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:", v31, v32, v33, v34, v35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97200], "contactWithABRecordRef:", *((_QWORD *)v20 + 18));
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v25 && v26)
        v28 = objc_msgSend(v25, "isEqual:", v26);
      else
        v28 = v25 == (void *)v26;
      *((_BYTE *)v39 + 24) = v28;

      v29 = *((_BYTE *)v39 + 24) != 0;
    }
    else
    {
      v29 = 1;
    }
  }
  else
  {
LABEL_64:
    v29 = 0;
  }
  _Block_object_dispose(&v38, 8);

  return v29;
}

void __44__PKPaymentRequest_isEqualToPaymentRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  char v11;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
    v11 = v8 == v9;
  else
    v11 = objc_msgSend(v8, "isEqual:", v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
}

- (void)setSupportedNetworks:(NSArray *)supportedNetworks
{
  objc_class *v4;
  NSArray *v5;
  id v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = supportedNetworks;
  v6 = [v4 alloc];
  PKInAppSupportedPaymentNetworks();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__PKPaymentRequest_setSupportedNetworks___block_invoke;
  v12[3] = &unk_1E2ABD910;
  v13 = v8;
  v11 = v8;
  -[NSArray pk_objectsPassingTest:](v5, "pk_objectsPassingTest:", v12);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v10 = self->_supportedNetworks;
  self->_supportedNetworks = v9;

}

uint64_t __41__PKPaymentRequest_setSupportedNetworks___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)setMultiTokenContexts:(NSArray *)multiTokenContexts
{
  NSArray *v4;
  NSArray *v5;

  if (multiTokenContexts)
  {
    v4 = (NSArray *)-[NSArray copy](multiTokenContexts, "copy");
    v5 = self->_multiTokenContexts;
    self->_multiTokenContexts = v4;
  }
  else
  {
    v5 = self->_multiTokenContexts;
    self->_multiTokenContexts = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (void)setAccesssControlRef:(__SecAccessControl *)a3
{
  __SecAccessControl *accesssControlRef;

  accesssControlRef = self->_accesssControlRef;
  if (accesssControlRef != a3)
  {
    if (accesssControlRef)
    {
      CFRelease(accesssControlRef);
      self->_accesssControlRef = 0;
    }
    if (a3)
      self->_accesssControlRef = (__SecAccessControl *)CFRetain(a3);
  }
}

- (BOOL)isShippingEditable
{
  return self->_shippingContactEditingMode == 1;
}

- (void)setShippingEditable:(BOOL)a3
{
  self->_shippingContactEditingMode = a3;
}

- (NSArray)shippingMethods
{
  return -[PKShippingMethods legacyShippingMethods](self->_availableShippingMethods, "legacyShippingMethods");
}

- (void)setShippingMethods:(NSArray *)shippingMethods
{
  PKShippingMethods *v4;
  PKShippingMethods *availableShippingMethods;
  NSArray *v6;

  v6 = shippingMethods;
  if (v6)
  {
    v4 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v6);
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = v4;
  }
  else
  {
    availableShippingMethods = self->_availableShippingMethods;
    self->_availableShippingMethods = 0;
  }

}

- (void)setShippingContactEditingMode:(PKShippingContactEditingMode)shippingContactEditingMode
{
  id v4;

  self->_shippingContactEditingMode = shippingContactEditingMode;
  if (shippingContactEditingMode == PKShippingContactEditingModeAvailable)
  {
    -[PKPaymentRequest setShippingEditableMessage:](self, "setShippingEditableMessage:", 0);
  }
  else if (shippingContactEditingMode == PKShippingContactEditingModeStorePickup)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_EDITING_MODE_STORE_PICKUP"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setShippingEditableMessage:](self, "setShippingEditableMessage:", v4);

  }
}

- (void)setShippingContact:(PKContact *)shippingContact
{
  PKContact *v5;
  PKContact **p_shippingContact;
  PKContact *v7;
  PKContact *v8;

  v5 = shippingContact;
  v7 = self->_shippingContact;
  p_shippingContact = &self->_shippingContact;
  v8 = v5;
  if (!-[PKContact isEqual:](v7, "isEqual:"))
  {
    objc_storeStrong((id *)p_shippingContact, shippingContact);
    -[PKContact sanitizePostalAddressCountry](*p_shippingContact, "sanitizePostalAddressCountry");
  }

}

- (void)setBillingContact:(PKContact *)billingContact
{
  PKContact *v5;
  PKContact **p_billingContact;
  PKContact *v7;
  PKContact *v8;

  v5 = billingContact;
  v7 = self->_billingContact;
  p_billingContact = &self->_billingContact;
  v8 = v5;
  if (!-[PKContact isEqual:](v7, "isEqual:"))
  {
    objc_storeStrong((id *)p_billingContact, billingContact);
    -[PKContact sanitizePostalAddressCountry](*p_billingContact, "sanitizePostalAddressCountry");
  }

}

- (void)setShippingAddress:(ABRecordRef)shippingAddress
{
  void *v5;

  v5 = self->_shippingAddress;
  if (v5)
  {
    CFRelease(v5);
    self->_shippingAddress = 0;
  }
  if (shippingAddress)
    self->_shippingAddress = (void *)CFRetain(shippingAddress);
}

- (void)setBillingAddress:(ABRecordRef)billingAddress
{
  void *v5;

  v5 = self->_billingAddress;
  if (v5)
  {
    CFRelease(v5);
    self->_billingAddress = 0;
  }
  if (billingAddress)
    self->_billingAddress = (void *)CFRetain(billingAddress);
}

- (void)setRequiredBillingAddressFields:(PKAddressField)requiredBillingAddressFields
{
  NSSet *v4;
  NSSet *requiredBillingContactFields;

  -[PKPaymentRequest _addressFieldsToContactFields:](self, "_addressFieldsToContactFields:", requiredBillingAddressFields);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  requiredBillingContactFields = self->_requiredBillingContactFields;
  self->_requiredBillingContactFields = v4;

}

- (void)setRequiredShippingAddressFields:(PKAddressField)requiredShippingAddressFields
{
  NSSet *v4;
  NSSet *requiredShippingContactFields;

  -[PKPaymentRequest _addressFieldsToContactFields:](self, "_addressFieldsToContactFields:", requiredShippingAddressFields);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  requiredShippingContactFields = self->_requiredShippingContactFields;
  self->_requiredShippingContactFields = v4;

}

- (PKAddressField)requiredBillingAddressFields
{
  return -[PKPaymentRequest _contactFieldsToAddressFields:](self, "_contactFieldsToAddressFields:", self->_requiredBillingContactFields);
}

- (PKAddressField)requiredShippingAddressFields
{
  return -[PKPaymentRequest _contactFieldsToAddressFields:](self, "_contactFieldsToAddressFields:", self->_requiredShippingContactFields);
}

- (id)_addressFieldsToContactFields:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("post"));
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v5, "addObject:", CFSTR("email"));
      if ((v3 & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("name"));
  if ((v3 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v3 & 2) != 0)
LABEL_5:
    objc_msgSend(v5, "addObject:", CFSTR("phone"));
LABEL_6:
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (unint64_t)_contactFieldsToAddressFields:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  int v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("post"));
  if (objc_msgSend(v3, "containsObject:", CFSTR("name")))
    v4 |= 8uLL;
  if (objc_msgSend(v3, "containsObject:", CFSTR("email")))
    v5 = v4 | 4;
  else
    v5 = v4;
  v6 = objc_msgSend(v3, "containsObject:", CFSTR("phone"));

  if (v6)
    return v5 | 2;
  else
    return v5;
}

- (BOOL)expectsMerchantSession
{
  return 0;
}

- (id)_transactionAmount
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_paymentSummaryItems, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSData)applicationData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  if (!-[PKPaymentRequest _shouldUseAmpEnrollmentPinning](self, "_shouldUseAmpEnrollmentPinning"))
    return self->_applicationData;
  PKLogFacilityTypeGetObject(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "AMP initiative, ignoring applicationData on PKPaymentRequest", v8, 2u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", self->_applicationData);
  -[PKPaymentMerchantSession ampEnrollmentPinning](self->_merchantSession, "ampEnrollmentPinning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendData:", v6);

  return (NSData *)v4;
}

- (BOOL)_shouldUseAmpEnrollmentPinning
{
  void *v2;
  char v3;

  -[PKPaymentMerchantSession initiative](self->_merchantSession, "initiative");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("amp_enrollment")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("amp_payment_token")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("amp_psd2")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("amp_applepay_classic")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("amp_verification"));
  }

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unint64_t requestor;
  unint64_t shippingType;
  __CFString *v14;
  unint64_t applePayLaterAvailability;
  __CFString *v16;
  NSArray *paymentSummaryItems;
  NSArray *paymentContentItems;
  PKShippingMethods *availableShippingMethods;
  void *v20;
  NSData *applicationData;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _PKEnumValueToString(self->_APIType, CFSTR("PKPaymentRequestAPIType"), CFSTR("PKPaymentRequestAPITypeInApp, PKPaymentRequestAPITypeWebJS, PKPaymentRequestAPITypeWebPaymentRequest, PKPaymentRequestAPITypeWinterpeg, PKPaymentRequestAPITypeAMPEnrollment"), v4, v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("APIType: %@, "), v9, 1, 2, 3, 4);

  PKPaymentRequestTypeToString(self->_requestType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("requestType: %@, "), v10);

  v11 = 0;
  requestor = self->_requestor;
  if (requestor <= 5)
    v11 = off_1E2ADC580[requestor];
  objc_msgSend(v3, "appendFormat:", CFSTR("requestor: %@, "), v11);
  objc_msgSend(v3, "appendFormat:", CFSTR("countryCode: %@, "), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCapabilities: %x, "), self->_merchantCapabilities);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCategoryCode: %d, "), self->_merchantCategoryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: %@, "), self->_currencyCode);
  shippingType = self->_shippingType;
  if (shippingType > 3)
    v14 = 0;
  else
    v14 = off_1E2ADC5B0[shippingType];
  objc_msgSend(v3, "appendFormat:", CFSTR("shippingType: %@, "), v14);
  applePayLaterAvailability = self->_applePayLaterAvailability;
  if (applePayLaterAvailability > 2)
    v16 = 0;
  else
    v16 = off_1E2ADC5D0[applePayLaterAvailability];
  objc_msgSend(v3, "appendFormat:", CFSTR("applePayLaterAvailability: %@, "), v16);
  objc_msgSend(v3, "appendFormat:", CFSTR("shouldUseMerchantSession: %d, "), -[PKPaymentRequest shouldUseMerchantSession](self, "shouldUseMerchantSession"));
  objc_msgSend(v3, "appendFormat:", CFSTR("suppressTotal: %d, "), self->_suppressTotal);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentSummaryPinned: %d, "), self->_paymentSummaryPinned);
  if (self->_supportedNetworks)
    objc_msgSend(v3, "appendFormat:", CFSTR("supportedNetworks: %@, "), self->_supportedNetworks);
  if (self->_automaticReloadPaymentRequest)
    objc_msgSend(v3, "appendFormat:", CFSTR("automaticPaymentRequest: %@"), self->_automaticReloadPaymentRequest);
  if (self->_recurringPaymentRequest)
    objc_msgSend(v3, "appendFormat:", CFSTR("recurringPaymentRequest: %@, "), self->_recurringPaymentRequest);
  if (self->_deferredPaymentRequest)
    objc_msgSend(v3, "appendFormat:", CFSTR("deferredPaymentRequest: %@, "), self->_deferredPaymentRequest);
  if (-[NSArray count](self->_multiTokenContexts, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("multiTokenContexts: %@, "), self->_multiTokenContexts);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportsCouponCode: %d, "), self->_supportsCouponCode);
  if (self->_couponCode)
    objc_msgSend(v3, "appendFormat:", CFSTR("couponCode: %@, "), self->_couponCode);
  paymentSummaryItems = self->_paymentSummaryItems;
  if (paymentSummaryItems)
    objc_msgSend(v3, "appendFormat:", CFSTR("paymentSummaryItems: %d, "), -[NSArray count](paymentSummaryItems, "count"));
  paymentContentItems = self->_paymentContentItems;
  if (paymentContentItems)
    objc_msgSend(v3, "appendFormat:", CFSTR("paymentContentItems: %d, "), -[NSArray count](paymentContentItems, "count"));
  if (self->_merchantSession)
    objc_msgSend(v3, "appendFormat:", CFSTR("merchantSession: %@, "), self->_merchantSession);
  if (-[NSSet count](self->_requiredBillingContactFields, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("requiredBillingContactFields: %@, "), self->_requiredBillingContactFields);
  if (-[NSSet count](self->_requiredShippingContactFields, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("requiredShippingContactFields: %@, "), self->_requiredShippingContactFields);
  availableShippingMethods = self->_availableShippingMethods;
  if (availableShippingMethods)
  {
    -[PKShippingMethods methods](availableShippingMethods, "methods");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("shippingMethods: %d, "), objc_msgSend(v20, "count"));

  }
  applicationData = self->_applicationData;
  if (applicationData)
    objc_msgSend(v3, "appendFormat:", CFSTR("applicationData: %d bytes, "), -[NSData length](applicationData, "length"));
  if (self->_supportedCountries)
    objc_msgSend(v3, "appendFormat:", CFSTR("supportedCountries: %@, "), self->_supportedCountries);
  if (self->_passTypeIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("passTypeIdentifier: %@, "), self->_passTypeIdentifier);
  if (self->_passSerialNumber)
    objc_msgSend(v3, "appendFormat:", CFSTR("passSerialNumber: %@, "), self->_passSerialNumber);
  if (self->_boundInterfaceIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("boundInterfaceIdentifier: %@, "), self->_boundInterfaceIdentifier);
  if (self->_externalizedContext)
    objc_msgSend(v3, "appendFormat:", CFSTR("externalizedContext: %p, "), self->_externalizedContext);
  if (self->_accesssControlRef)
    objc_msgSend(v3, "appendFormat:", CFSTR("accesssControlRef: %p, "), self->_accesssControlRef);
  if (self->_clientViewSourceIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("clientViewSourceIdentifier: %@, "), self->_clientViewSourceIdentifier);
  if (self->_clientViewSourceParameter)
    objc_msgSend(v3, "appendFormat:", CFSTR("clientViewSourceParameter: %@, "), self->_clientViewSourceParameter);
  if (self->_appleIDAuthenticationContext)
    objc_msgSend(v3, "appendFormat:", CFSTR("appleIDAuthenticationContext: %p, "), self->_appleIDAuthenticationContext);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (BOOL)_isPSD2StyleRequest
{
  void *v3;
  char v4;

  if (self->_requestType)
    return 0;
  -[PKPaymentMerchantSession initiative](self->_merchantSession, "initiative");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("amp_psd2"));

  return v4;
}

- (BOOL)_isAMPApplePayClassicRequest
{
  void *v3;
  char v4;

  if (self->_requestType)
    return 0;
  -[PKPaymentMerchantSession initiative](self->_merchantSession, "initiative");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("amp_applepay_classic"));

  return v4;
}

- (BOOL)_isAMPPayment
{
  return self->_requestType == 1
      || -[PKPaymentRequest _isPSD2StyleRequest](self, "_isPSD2StyleRequest")
      || -[PKPaymentRequest _isAMPApplePayClassicRequest](self, "_isAMPApplePayClassicRequest")
      || -[PKPaymentRequest _isPVKRequest](self, "_isPVKRequest");
}

- (BOOL)_isPVKRequest
{
  void *v3;
  char v4;

  if (self->_requestType)
    return 0;
  -[PKPaymentMerchantSession initiative](self->_merchantSession, "initiative");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("amp_verification"));

  return v4;
}

- (BOOL)isMultiTokenRequest
{
  return !self->_requestType && -[NSArray count](self->_multiTokenContexts, "count") != 0;
}

- (BOOL)shouldUseMerchantSession
{
  int64_t v3;
  unint64_t v5;

  v3 = -[PKPaymentRequest APIType](self, "APIType");
  if ((unint64_t)(v3 - 1) < 4)
    return 1;
  if (v3)
    return 0;
  v5 = -[PKPaymentRequest requestType](self, "requestType");
  if (v5 > 0xE)
    return 0;
  if (((1 << v5) & 0x5401) != 0)
    return -[NSString length](self->_merchantIdentifier, "length") == 0;
  return v5 == 3;
}

- (NSString)hashedMerchantIdentifier
{
  void *v3;
  NSString *merchantIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PKPaymentRequest shouldUseMerchantSession](self, "shouldUseMerchantSession"))
  {
    -[PKPaymentMerchantSession merchantIdentifier](self->_merchantSession, "merchantIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    merchantIdentifier = self->_merchantIdentifier;
    if (merchantIdentifier)
    {
      -[NSString dataUsingEncoding:](merchantIdentifier, "dataUsingEncoding:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "SHA256Hash");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hexEncoding");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  objc_msgSend(v3, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_stringIfNotEmpty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)analyticsSubject
{
  return (NSString *)-[NSDictionary PKStringForKey:](self->_clientAnalyticsParameters, "PKStringForKey:", CFSTR("subject"));
}

- (NSString)analyticsPageTag
{
  return (NSString *)-[NSDictionary PKStringForKey:](self->_clientAnalyticsParameters, "PKStringForKey:", CFSTR("pageTag"));
}

- (NSString)analyticsProductType
{
  return (NSString *)-[NSDictionary PKStringForKey:](self->_clientAnalyticsParameters, "PKStringForKey:", CFSTR("productType"));
}

- (PKPaymentRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PKPaymentRequest *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  PKAutomaticReloadPaymentRequest *v15;
  PKAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  uint64_t v17;
  PKRecurringPaymentRequest *v18;
  PKRecurringPaymentRequest *recurringPaymentRequest;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  PKPaymentTokenContext *v27;
  uint64_t v28;
  NSArray *multiTokenContexts;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *supportedNetworks;
  void *v42;
  uint64_t v43;
  NSString *couponCode;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  PKPaymentSummaryItem *v51;
  uint64_t v52;
  NSArray *paymentSummaryItems;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  PKShippingMethod *v59;
  PKShippingMethods *v60;
  PKShippingMethods *availableShippingMethods;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSData *applicationData;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t ii;
  uint64_t v73;
  uint64_t v74;
  NSSet *supportedCountries;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t jj;
  uint64_t v83;
  uint64_t v84;
  NSSet *requiredShippingContactFields;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t kk;
  uint64_t v93;
  uint64_t v94;
  NSSet *requiredBillingContactFields;
  uint64_t v96;
  PKContact *v97;
  PKContact *shippingContact;
  uint64_t v99;
  PKContact *v100;
  PKContact *billingContact;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int64_t v111;
  void *v112;
  char v113;
  PKPaymentRequest *v114;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  PKPaymentSummaryItem *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  id v138;
  id v139;
  id obj;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
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
  _QWORD v162[5];
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
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PKPaymentRequest init](self, "init");

  if (!v7)
    goto LABEL_110;
  v130 = a4;
  v136 = v6;
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("applePay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PKStringForKey:", CFSTR("merchantIdentifier"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v7->_merchantIdentifier, v131);
  v135 = v8;
  objc_msgSend(v8, "PKArrayForKey:", CFSTR("merchantCapabilities"));
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v172;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v172 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("supports3DS")))
          v7->_merchantCapabilities |= 1uLL;
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("supportsEMV")))
          v7->_merchantCapabilities |= 2uLL;
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("supportsCredit")))
          v7->_merchantCapabilities |= 4uLL;
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("supportsDebit")))
          v7->_merchantCapabilities |= 8uLL;
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("supportsEWallet")))
          v7->_merchantCapabilities |= 0x10uLL;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v171, v182, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("automaticReloadPaymentRequest"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[PKAutomaticReloadPaymentRequest initWithDictionary:error:]([PKAutomaticReloadPaymentRequest alloc], "initWithDictionary:error:", v14, 0);
    automaticReloadPaymentRequest = v7->_automaticReloadPaymentRequest;
    v7->_automaticReloadPaymentRequest = v15;

  }
  v129 = (void *)v14;
  objc_msgSend(v135, "PKDictionaryForKey:", CFSTR("recurringPaymentRequest"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = -[PKRecurringPaymentRequest initWithDictionary:error:]([PKRecurringPaymentRequest alloc], "initWithDictionary:error:", v17, 0);
    recurringPaymentRequest = v7->_recurringPaymentRequest;
    v7->_recurringPaymentRequest = v18;

  }
  v128 = (void *)v17;
  objc_msgSend(v135, "PKArrayForKey:", CFSTR("multiTokenContexts"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v168;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v168 != v25)
          objc_enumerationMutation(v22);
        v27 = -[PKPaymentTokenContext initWithDictionary:error:]([PKPaymentTokenContext alloc], "initWithDictionary:error:", *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * j), 0);
        objc_msgSend(v21, "addObject:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v167, v181, 16);
    }
    while (v24);
  }
  v126 = v22;

  v127 = v21;
  v28 = objc_msgSend(v21, "copy");
  multiTokenContexts = v7->_multiTokenContexts;
  v7->_multiTokenContexts = (NSArray *)v28;

  PKInAppSupportedPaymentNetworks();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "PKArrayForKey:", CFSTR("supportedNetworks"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v139 = v31;
  v32 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v163, v180, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v164;
    v35 = MEMORY[0x1E0C809B0];
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v164 != v34)
          objc_enumerationMutation(v139);
        v37 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * k);
        v162[0] = v35;
        v162[1] = 3221225472;
        v162[2] = __45__PKPaymentRequest_initWithDictionary_error___block_invoke;
        v162[3] = &unk_1E2ABD910;
        v162[4] = v37;
        v38 = objc_msgSend(v30, "indexOfObjectPassingTest:", v162);
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "addObject:", v39);

        }
      }
      v33 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v163, v180, 16);
    }
    while (v33);
  }

  if (objc_msgSend(v138, "count"))
  {
    v40 = objc_msgSend(v138, "copy");
    supportedNetworks = v7->_supportedNetworks;
    v7->_supportedNetworks = (NSArray *)v40;

  }
  v42 = v136;
  objc_msgSend(v136, "PKStringForKey:", CFSTR("countryCode"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v7->_countryCode, v125);
  objc_msgSend(v136, "PKStringForKey:", CFSTR("currencyCode"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v7->_currencyCode, v124);
  v7->_supportsCouponCode = objc_msgSend(v136, "PKBoolForKey:", CFSTR("supportsCouponCode"));
  objc_msgSend(v136, "PKStringForKey:", CFSTR("couponCode"));
  v43 = objc_claimAutoreleasedReturnValue();
  couponCode = v7->_couponCode;
  v7->_couponCode = (NSString *)v43;

  objc_msgSend(v136, "PKNumberForKey:", CFSTR("merchantCategoryCode"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_merchantCategoryCode = objc_msgSend(v123, "shortValue");
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v136, "PKArrayForKey:", CFSTR("lineItems"));
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v159;
    do
    {
      for (m = 0; m != v48; ++m)
      {
        if (*(_QWORD *)v159 != v49)
          objc_enumerationMutation(v46);
        v51 = -[PKPaymentSummaryItem initWithDictionary:error:]([PKPaymentSummaryItem alloc], "initWithDictionary:error:", *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * m), 0);
        objc_msgSend(v45, "addObject:", v51);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
    }
    while (v48);
  }

  objc_msgSend(v136, "PKDictionaryForKey:", CFSTR("total"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = -[PKPaymentSummaryItem initWithDictionary:error:]([PKPaymentSummaryItem alloc], "initWithDictionary:error:", v121, 0);
  objc_msgSend(v45, "addObject:");
  v52 = objc_msgSend(v45, "copy");
  paymentSummaryItems = v7->_paymentSummaryItems;
  v7->_paymentSummaryItems = (NSArray *)v52;

  v141 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v136, "PKArrayForKey:", CFSTR("shippingMethods"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v46;
  if (v133)
  {
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v54 = v133;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v155;
      do
      {
        for (n = 0; n != v56; ++n)
        {
          if (*(_QWORD *)v155 != v57)
            objc_enumerationMutation(v54);
          v59 = -[PKShippingMethod initWithDictionary:error:]([PKShippingMethod alloc], "initWithDictionary:error:", *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * n), 0);
          objc_msgSend(v141, "addObject:", v59);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
      }
      while (v56);
    }

    v60 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v141);
    availableShippingMethods = v7->_availableShippingMethods;
    v7->_availableShippingMethods = v60;

  }
  objc_msgSend(v136, "PKStringForKey:", CFSTR("shippingType"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v7->_shippingType = 0;
  if ((objc_msgSend(v62, "isEqualToString:", CFSTR("delivery")) & 1) != 0)
  {
    v63 = 1;
LABEL_63:
    v7->_shippingType = v63;
    goto LABEL_64;
  }
  if ((objc_msgSend(v62, "isEqualToString:", CFSTR("storePickup")) & 1) != 0)
  {
    v63 = 2;
    goto LABEL_63;
  }
  if (objc_msgSend(v62, "isEqualToString:", CFSTR("servicePickup")))
  {
    v63 = 3;
    goto LABEL_63;
  }
LABEL_64:
  v119 = v62;
  v122 = v45;
  objc_msgSend(v136, "PKStringForKey:", CFSTR("applicationData"));
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v64, 0);
    applicationData = v7->_applicationData;
    v7->_applicationData = (NSData *)v65;

  }
  v118 = (void *)v64;
  objc_msgSend(v136, "PKArrayForKey:", CFSTR("supportedCountries"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if (v132)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v68 = v132;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v151;
      do
      {
        for (ii = 0; ii != v70; ++ii)
        {
          if (*(_QWORD *)v151 != v71)
            objc_enumerationMutation(v68);
          v73 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v67, "addObject:", v73);
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
      }
      while (v70);
    }

    if (objc_msgSend(v67, "count"))
    {
      v74 = objc_msgSend(v67, "copy");
      supportedCountries = v7->_supportedCountries;
      v7->_supportedCountries = (NSSet *)v74;

    }
    v42 = v136;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("email"), CFSTR("name"), CFSTR("phone"), CFSTR("postalAddress"), CFSTR("phoneticName"), 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "PKArrayForKey:", CFSTR("requiredShippingContactFields"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v78 = v77;
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v147;
    do
    {
      for (jj = 0; jj != v80; ++jj)
      {
        if (*(_QWORD *)v147 != v81)
          objc_enumerationMutation(v78);
        v83 = *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * jj);
        if (objc_msgSend(v76, "containsObject:", v83))
          objc_msgSend(v137, "addObject:", v83);
      }
      v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
    }
    while (v80);
  }

  if (objc_msgSend(v137, "count"))
  {
    v84 = objc_msgSend(v137, "copy");
    requiredShippingContactFields = v7->_requiredShippingContactFields;
    v7->_requiredShippingContactFields = (NSSet *)v84;

  }
  objc_msgSend(v42, "PKArrayForKey:", CFSTR("requiredBillingContactFields"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v88 = v86;
  v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v142, v175, 16);
  if (v89)
  {
    v90 = v89;
    v91 = *(_QWORD *)v143;
    do
    {
      for (kk = 0; kk != v90; ++kk)
      {
        if (*(_QWORD *)v143 != v91)
          objc_enumerationMutation(v88);
        v93 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * kk);
        if (objc_msgSend(v76, "containsObject:", v93))
          objc_msgSend(v87, "addObject:", v93);
      }
      v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v142, v175, 16);
    }
    while (v90);
  }

  if (objc_msgSend(v87, "count"))
  {
    v94 = objc_msgSend(v87, "copy");
    requiredBillingContactFields = v7->_requiredBillingContactFields;
    v7->_requiredBillingContactFields = (NSSet *)v94;

  }
  objc_msgSend(v136, "PKDictionaryForKey:", CFSTR("shippingContact"));
  v96 = objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    v97 = -[PKContact initWithDictionary:error:]([PKContact alloc], "initWithDictionary:error:", v96, 0);
    shippingContact = v7->_shippingContact;
    v7->_shippingContact = v97;

    -[PKContact sanitizePostalAddressCountry](v7->_shippingContact, "sanitizePostalAddressCountry");
  }
  objc_msgSend(v136, "PKDictionaryForKey:", CFSTR("billingContact"));
  v99 = objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = -[PKContact initWithDictionary:error:]([PKContact alloc], "initWithDictionary:error:", v99, 0);
    billingContact = v7->_billingContact;
    v7->_billingContact = v100;

    -[PKContact sanitizePostalAddressCountry](v7->_billingContact, "sanitizePostalAddressCountry");
  }
  v116 = (void *)v99;
  v117 = (void *)v96;
  objc_msgSend(v136, "PKStringForKey:", CFSTR("APIType"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v102;
  v104 = v134;
  if (v102)
  {
    v105 = v102;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = (int)_PKEnumValueFromString(v105, v106, (uint64_t)CFSTR("PKPaymentRequestAPIType"), CFSTR("PKPaymentRequestAPITypeInApp, PKPaymentRequestAPITypeWebJS, PKPaymentRequestAPITypeWebPaymentRequest, PKPaymentRequestAPITypeWinterpeg, PKPaymentRequestAPITypeAMPEnrollment"), v107, v108, v109, v110, 0);

    v7->_APIType = v111;
    v104 = v134;
  }
  +[PKPaymentRequestValidator validatorWithObject:](PKPaymentRequestValidator, "validatorWithObject:", v7);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v112, "isValidWithAPIType:withError:", v7->_APIType, v130);

  if ((v113 & 1) == 0)
  {

    v7 = 0;
  }

  v6 = v136;
LABEL_110:
  v114 = v7;

  return v114;
}

BOOL __45__PKPaymentRequest_initWithDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:options:", *(_QWORD *)(a1 + 32), 1) == 0;
}

+ (id)errorFromDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  const PKContactField *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void **v16;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D50]);

  objc_msgSend(v3, "objectForKey:", CFSTR("code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("shippingContactInvalid")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("billingContactInvalid")) & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("shippingAddressUnserviceable")))
  {
    v7 = 3;
  }
  else
  {
    v7 = -1;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("contactField"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("phoneNumber")))
  {
    v9 = 0;
    v10 = &PKContactFieldPhoneNumber;
LABEL_18:
    v11 = (__CFString *)*v10;
    v12 = v11;
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("emailAddress")))
  {
    v9 = 0;
    v10 = &PKContactFieldEmailAddress;
    goto LABEL_18;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("name")))
  {
    v9 = 0;
    v10 = &PKContactFieldName;
    goto LABEL_18;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("phoneticName")))
  {
    v9 = 0;
    v10 = &PKContactFieldPhoneticName;
    goto LABEL_18;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("postalAddress")))
  {
    v9 = 0;
    v10 = &PKContactFieldPostalAddress;
    goto LABEL_18;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("addressLines")))
  {
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C970C8];
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("locality")))
  {
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C97098];
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("subLocality")))
  {
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C970D8];
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("postalCode")))
  {
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C970B0];
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("administrativeArea")))
  {
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C970C0];
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("subAdministrativeArea")))
  {
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C970D0];
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("country")))
  {
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C970A0];
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("countryCode")))
    {
      v9 = 0;
      v12 = 0;
      goto LABEL_22;
    }
    v12 = CFSTR("post");
    v16 = (void **)MEMORY[0x1E0C970A8];
  }
  v11 = (__CFString *)*v16;
  v9 = v11;
LABEL_19:
  v13 = v11;
  if (v12)
  {
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("PKPaymentErrorContactField"));
    if (v9)
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("PKPaymentErrorPostalAddress"));
  }
LABEL_22:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), v7, v4);

  return v14;
}

+ (NSError)paymentContactInvalidErrorWithContactField:(PKContactField)field localizedDescription:(NSString *)localizedDescription
{
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = localizedDescription;
  v7 = field;
  v8 = [v5 alloc];
  v13[0] = *MEMORY[0x1E0CB2D50];
  v13[1] = CFSTR("PKPaymentErrorContactField");
  v9 = &stru_1E2ADF4C0;
  if (v6)
    v9 = (const __CFString *)v6;
  v14[0] = v9;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 1, v10);
  return (NSError *)v11;
}

+ (NSError)paymentShippingAddressInvalidErrorWithKey:(NSString *)postalAddressKey localizedDescription:(NSString *)localizedDescription
{
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = localizedDescription;
  v7 = postalAddressKey;
  v8 = [v5 alloc];
  v9 = &stru_1E2ADF4C0;
  v13[0] = *MEMORY[0x1E0CB2D50];
  v13[1] = CFSTR("PKPaymentErrorContactField");
  if (v6)
    v9 = (const __CFString *)v6;
  v14[0] = v9;
  v14[1] = CFSTR("post");
  v13[2] = CFSTR("PKPaymentErrorPostalAddress");
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 1, v10);
  return (NSError *)v11;
}

+ (NSError)paymentBillingAddressInvalidErrorWithKey:(NSString *)postalAddressKey localizedDescription:(NSString *)localizedDescription
{
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = localizedDescription;
  v7 = postalAddressKey;
  v8 = [v5 alloc];
  v9 = &stru_1E2ADF4C0;
  v13[0] = *MEMORY[0x1E0CB2D50];
  v13[1] = CFSTR("PKPaymentErrorContactField");
  if (v6)
    v9 = (const __CFString *)v6;
  v14[0] = v9;
  v14[1] = CFSTR("post");
  v13[2] = CFSTR("PKPaymentErrorPostalAddress");
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 2, v10);
  return (NSError *)v11;
}

+ (NSError)paymentShippingAddressUnserviceableErrorWithLocalizedDescription:(NSString *)localizedDescription
{
  objc_class *v3;
  NSString *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB35C8];
  v4 = localizedDescription;
  v5 = [v3 alloc];
  v6 = &stru_1E2ADF4C0;
  v10[0] = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("PKPaymentErrorContactField");
  if (v4)
    v6 = (const __CFString *)v4;
  v11[0] = v6;
  v11[1] = CFSTR("post");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 3, v7);
  return (NSError *)v8;
}

+ (NSError)paymentCouponCodeInvalidErrorWithLocalizedDescription:(NSString *)localizedDescription
{
  const __CFString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (localizedDescription)
    v3 = (const __CFString *)localizedDescription;
  else
    v3 = &stru_1E2ADF4C0;
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = localizedDescription;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);

  v8 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 4, v6);
  return (NSError *)v8;
}

+ (NSError)paymentCouponCodeExpiredErrorWithLocalizedDescription:(NSString *)localizedDescription
{
  const __CFString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (localizedDescription)
    v3 = (const __CFString *)localizedDescription;
  else
    v3 = &stru_1E2ADF4C0;
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = localizedDescription;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB35C8]);

  v8 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), 5, v6);
  return (NSError *)v8;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, merchantIdentifier, 24);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(NSString *)countryCode
{
  objc_setProperty_nonatomic_copy(self, a2, countryCode, 32);
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (PKMerchantCapability)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(PKMerchantCapability)merchantCapabilities
{
  self->_merchantCapabilities = merchantCapabilities;
}

- (BOOL)supportsCouponCode
{
  return self->_supportsCouponCode;
}

- (void)setSupportsCouponCode:(BOOL)supportsCouponCode
{
  self->_supportsCouponCode = supportsCouponCode;
}

- (NSString)couponCode
{
  return self->_couponCode;
}

- (void)setCouponCode:(NSString *)couponCode
{
  objc_setProperty_nonatomic_copy(self, a2, couponCode, 56);
}

- (signed)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(signed __int16)a3
{
  self->_merchantCategoryCode = a3;
}

- (NSArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (void)setPaymentSummaryItems:(NSArray *)paymentSummaryItems
{
  objc_setProperty_nonatomic_copy(self, a2, paymentSummaryItems, 64);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(NSString *)currencyCode
{
  objc_setProperty_nonatomic_copy(self, a2, currencyCode, 72);
}

- (NSSet)requiredBillingContactFields
{
  return self->_requiredBillingContactFields;
}

- (void)setRequiredBillingContactFields:(NSSet *)requiredBillingContactFields
{
  objc_storeStrong((id *)&self->_requiredBillingContactFields, requiredBillingContactFields);
}

- (PKContact)billingContact
{
  return self->_billingContact;
}

- (NSSet)requiredShippingContactFields
{
  return self->_requiredShippingContactFields;
}

- (void)setRequiredShippingContactFields:(NSSet *)requiredShippingContactFields
{
  objc_storeStrong((id *)&self->_requiredShippingContactFields, requiredShippingContactFields);
}

- (PKContact)shippingContact
{
  return self->_shippingContact;
}

- (PKShippingType)shippingType
{
  return self->_shippingType;
}

- (void)setShippingType:(PKShippingType)shippingType
{
  self->_shippingType = shippingType;
}

- (PKShippingContactEditingMode)shippingContactEditingMode
{
  return self->_shippingContactEditingMode;
}

- (void)setApplicationData:(NSData *)applicationData
{
  objc_setProperty_nonatomic_copy(self, a2, applicationData, 128);
}

- (NSSet)supportedCountries
{
  return self->_supportedCountries;
}

- (void)setSupportedCountries:(NSSet *)supportedCountries
{
  objc_setProperty_nonatomic_copy(self, a2, supportedCountries, 136);
}

- (ABRecordRef)shippingAddress
{
  return self->_shippingAddress;
}

- (ABRecordRef)billingAddress
{
  return self->_billingAddress;
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(PKRecurringPaymentRequest *)recurringPaymentRequest
{
  objc_storeStrong((id *)&self->_recurringPaymentRequest, recurringPaymentRequest);
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(PKAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest
{
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, automaticReloadPaymentRequest);
}

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(PKDeferredPaymentRequest *)deferredPaymentRequest
{
  objc_storeStrong((id *)&self->_deferredPaymentRequest, deferredPaymentRequest);
}

- (PKApplePayLaterAvailability)applePayLaterAvailability
{
  return self->_applePayLaterAvailability;
}

- (void)setApplePayLaterAvailability:(PKApplePayLaterAvailability)applePayLaterAvailability
{
  self->_applePayLaterAvailability = applePayLaterAvailability;
}

- (NSArray)thumbnailURLs
{
  return self->_thumbnailURLs;
}

- (void)setThumbnailURLs:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailURLs, a3);
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
  objc_storeStrong((id *)&self->_originatingURL, a3);
}

- (void)setExpectsMerchantSession:(BOOL)a3
{
  self->_expectsMerchantSession = a3;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, a3);
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  return self->_sourceApplicationSecondaryIdentifier;
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier, a3);
}

- (NSString)CTDataConnectionServiceType
{
  return self->_CTDataConnectionServiceType;
}

- (void)setCTDataConnectionServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_CTDataConnectionServiceType, a3);
}

- (NSString)boundInterfaceIdentifier
{
  return self->_boundInterfaceIdentifier;
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (PKApplePayTrustSignatureRequest)applePayTrustSignatureRequest
{
  return self->_applePayTrustSignatureRequest;
}

- (void)setApplePayTrustSignatureRequest:(id)a3
{
  objc_storeStrong((id *)&self->_applePayTrustSignatureRequest, a3);
}

- (NSArray)bankAccounts
{
  return self->_bankAccounts;
}

- (void)setBankAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_bankAccounts, a3);
}

- (BOOL)accountPaymentSupportsPeerPayment
{
  return self->_accountPaymentSupportsPeerPayment;
}

- (void)setAccountPaymentSupportsPeerPayment:(BOOL)a3
{
  self->_accountPaymentSupportsPeerPayment = a3;
}

- (BOOL)accountPaymentUsePeerPaymentBalance
{
  return self->_accountPaymentUsePeerPaymentBalance;
}

- (void)setAccountPaymentUsePeerPaymentBalance:(BOOL)a3
{
  self->_accountPaymentUsePeerPaymentBalance = a3;
}

- (BOOL)deviceSupportsPeerPaymentAccountPayment
{
  return self->_deviceSupportsPeerPaymentAccountPayment;
}

- (void)setDeviceSupportsPeerPaymentAccountPayment:(BOOL)a3
{
  self->_deviceSupportsPeerPaymentAccountPayment = a3;
}

- (int64_t)paymentFrequency
{
  return self->_paymentFrequency;
}

- (void)setPaymentFrequency:(int64_t)a3
{
  self->_paymentFrequency = a3;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSTimeZone)paymentTimeZone
{
  return self->_paymentTimeZone;
}

- (void)setPaymentTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSString)remoteNetworkRequestPaymentTopicID
{
  return self->_remoteNetworkRequestPaymentTopicID;
}

- (void)setRemoteNetworkRequestPaymentTopicID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (int64_t)APIType
{
  return self->_APIType;
}

- (void)setAPIType:(int64_t)a3
{
  self->_APIType = a3;
}

- (BOOL)respectSupportedNetworksOrder
{
  return self->_respectSupportedNetworksOrder;
}

- (void)setRespectSupportedNetworksOrder:(BOOL)a3
{
  self->_respectSupportedNetworksOrder = a3;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)requestor
{
  return self->_requestor;
}

- (void)setRequestor:(unint64_t)a3
{
  self->_requestor = a3;
}

- (NSArray)paymentContentItems
{
  return self->_paymentContentItems;
}

- (void)setPaymentContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (BOOL)suppressTotal
{
  return self->_suppressTotal;
}

- (void)setSuppressTotal:(BOOL)a3
{
  self->_suppressTotal = a3;
}

- (BOOL)isPaymentSummaryPinned
{
  return self->_paymentSummaryPinned;
}

- (void)setPaymentSummaryPinned:(BOOL)a3
{
  self->_paymentSummaryPinned = a3;
}

- (NSString)localizedSummaryItemsTitle
{
  return self->_localizedSummaryItemsTitle;
}

- (void)setLocalizedSummaryItemsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (AKAppleIDAuthenticationContext)appleIDAuthenticationContext
{
  return self->_appleIDAuthenticationContext;
}

- (void)setAppleIDAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDAuthenticationContext, a3);
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (void)setLocalizedNavigationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (unint64_t)confirmationStyle
{
  return self->_confirmationStyle;
}

- (void)setConfirmationStyle:(unint64_t)a3
{
  self->_confirmationStyle = a3;
}

- (NSString)localizedConfirmationTitle
{
  return self->_localizedConfirmationTitle;
}

- (void)setLocalizedConfirmationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)localizedBiometricConfirmationTitle
{
  return self->_localizedBiometricConfirmationTitle;
}

- (void)setLocalizedBiometricConfirmationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)localizedPasswordButtonTitle
{
  return self->_localizedPasswordButtonTitle;
}

- (void)setLocalizedPasswordButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)localizedAuthorizingTitle
{
  return self->_localizedAuthorizingTitle;
}

- (void)setLocalizedAuthorizingTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSString)localizedErrorMessage
{
  return self->_localizedErrorMessage;
}

- (void)setLocalizedErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSString)localizedCallbackErrorTitle
{
  return self->_localizedCallbackErrorTitle;
}

- (void)setLocalizedCallbackErrorTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSString)localizedCallbackErrorMessage
{
  return self->_localizedCallbackErrorMessage;
}

- (void)setLocalizedCallbackErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSString)localizedBiometricRetryMessage
{
  return self->_localizedBiometricRetryMessage;
}

- (void)setLocalizedBiometricRetryMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSString)localizedUnboundBiometricMessage
{
  return self->_localizedUnboundBiometricMessage;
}

- (void)setLocalizedUnboundBiometricMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (NSString)shippingEditableMessage
{
  return self->_shippingEditableMessage;
}

- (void)setShippingEditableMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (BOOL)requiresAddressPrecision
{
  return self->_requiresAddressPrecision;
}

- (void)setRequiresAddressPrecision:(BOOL)a3
{
  self->_requiresAddressPrecision = a3;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
  objc_storeStrong((id *)&self->_merchantSession, a3);
}

- (PKShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (double)clientCallbackTimeout
{
  return self->_clientCallbackTimeout;
}

- (void)setClientCallbackTimeout:(double)a3
{
  self->_clientCallbackTimeout = a3;
}

- (BOOL)supportsInstantFundsIn
{
  return self->_supportsInstantFundsIn;
}

- (void)setSupportsInstantFundsIn:(BOOL)a3
{
  self->_supportsInstantFundsIn = a3;
}

- (PKPaymentInstallmentConfiguration)installmentConfiguration
{
  return self->_installmentConfiguration;
}

- (void)setInstallmentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_installmentConfiguration, a3);
}

- (int64_t)requestorDeviceType
{
  return self->_requestorDeviceType;
}

- (void)setRequestorDeviceType:(int64_t)a3
{
  self->_requestorDeviceType = a3;
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (__SecAccessControl)accesssControlRef
{
  return self->_accesssControlRef;
}

- (BOOL)disablePasscodeFallback
{
  return self->_disablePasscodeFallback;
}

- (void)setDisablePasscodeFallback:(BOOL)a3
{
  self->_disablePasscodeFallback = a3;
}

- (BOOL)useLocationBasedAuthorization
{
  return self->_useLocationBasedAuthorization;
}

- (void)setUseLocationBasedAuthorization:(BOOL)a3
{
  self->_useLocationBasedAuthorization = a3;
}

- (NSString)clientViewSourceIdentifier
{
  return self->_clientViewSourceIdentifier;
}

- (void)setClientViewSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSDictionary)clientViewSourceParameter
{
  return self->_clientViewSourceParameter;
}

- (void)setClientViewSourceParameter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSDictionary)clientAnalyticsParameters
{
  return self->_clientAnalyticsParameters;
}

- (void)setClientAnalyticsParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAnalyticsParameters, 0);
  objc_storeStrong((id *)&self->_clientViewSourceParameter, 0);
  objc_storeStrong((id *)&self->_clientViewSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_storeStrong((id *)&self->_installmentConfiguration, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
  objc_storeStrong((id *)&self->_shippingEditableMessage, 0);
  objc_storeStrong((id *)&self->_localizedUnboundBiometricMessage, 0);
  objc_storeStrong((id *)&self->_localizedBiometricRetryMessage, 0);
  objc_storeStrong((id *)&self->_localizedCallbackErrorMessage, 0);
  objc_storeStrong((id *)&self->_localizedCallbackErrorTitle, 0);
  objc_storeStrong((id *)&self->_localizedErrorMessage, 0);
  objc_storeStrong((id *)&self->_localizedAuthorizingTitle, 0);
  objc_storeStrong((id *)&self->_localizedPasswordButtonTitle, 0);
  objc_storeStrong((id *)&self->_localizedBiometricConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_localizedConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_localizedNavigationTitle, 0);
  objc_storeStrong((id *)&self->_appleIDAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_localizedSummaryItemsTitle, 0);
  objc_storeStrong((id *)&self->_paymentContentItems, 0);
  objc_storeStrong((id *)&self->_remoteNetworkRequestPaymentTopicID, 0);
  objc_storeStrong((id *)&self->_paymentTimeZone, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_bankAccounts, 0);
  objc_storeStrong((id *)&self->_applePayTrustSignatureRequest, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_boundInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_CTDataConnectionServiceType, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_thumbnailURLs, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_supportedCountries, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
  objc_storeStrong((id *)&self->_requiredShippingContactFields, 0);
  objc_storeStrong((id *)&self->_billingContact, 0);
  objc_storeStrong((id *)&self->_requiredBillingContactFields, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
  objc_storeStrong((id *)&self->_couponCode, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
