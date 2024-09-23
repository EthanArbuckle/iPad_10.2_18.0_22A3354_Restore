@implementation PKMockPeerPaymentController

- (PKMockPeerPaymentController)initWithPeerPaymentWebService:(id)a3
{
  id v4;
  PKMockPeerPaymentController *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  PKMockPeerPaymentController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMockPeerPaymentController;
  v5 = -[PKPeerPaymentController initWithPeerPaymentWebService:](&v8, sel_initWithPeerPaymentWebService_, v4);
  if (v5)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v10 = v5;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController: %p initWithPeerPaymentWebService: %@", buf, 0x16u);
    }

    v5->_shouldGenerateMockTransactions = 1;
  }

  return v5;
}

- (void)identifyRecipientWithAddress:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_time_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PKMockPeerPaymentController *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_time(0, 10000000);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PKMockPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke;
  v15[3] = &unk_1E2ABE1E8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_after(v11, MEMORY[0x1E0C80D38], v15);

}

void __85__PKMockPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id *v5;
  void *v6;
  id *v7;
  uint64_t v8;
  PKPeerPaymentRecipient *obj;

  obj = objc_alloc_init(PKPeerPaymentRecipient);
  -[PKPeerPaymentRecipient setStatus:](obj, "setStatus:", 1);
  -[PKPeerPaymentRecipient setIdentifier:](obj, "setIdentifier:", CFSTR("aaa"));
  -[PKPeerPaymentRecipient setReceiveCurrency:](obj, "setReceiveCurrency:", CFSTR("USD"));
  -[PKPeerPaymentRecipient setPhoneOrEmail:](obj, "setPhoneOrEmail:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "displayNameForRecipientAddress:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentRecipient setDisplayName:](obj, "setDisplayName:", v2);

  -[PKPeerPaymentRecipient setAllowsFormalPaymentRequests:](obj, "setAllowsFormalPaymentRequests:", 1);
  objc_msgSend(*(id *)(a1 + 40), "internalState");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3 + 5, obj);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "internalState");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5 + 4, v4);

  v6 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "internalState");
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7 + 3, v6);

  objc_msgSend(*(id *)(a1 + 40), "_setState:notify:", 2, 1);
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, unint64_t, PKPeerPaymentRecipient *, _QWORD))(v8 + 16))(v8, -[PKPeerPaymentRecipient status](obj, "status"), obj, 0);

}

- (id)_quoteItemDictionaryWithType:(unint64_t)a3 amount:(id)a4 alternateFundingSource:(id)a5 featureDescriptor:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int16 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[16];
  _QWORD v42[18];

  v42[16] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  objc_msgSend(a5, "devicePrimaryPaymentApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "amount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 && objc_msgSend(v11, "paymentType") != 1)
  {
    objc_msgSend(v9, "currency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = PKMaximumFractionDigitsForCurrencyCode(v14);

    objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, v15, 0, 0, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("0.03"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "amount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "decimalNumberByMultiplyingBy:withBehavior:", v17, v16);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }
  objc_msgSend(v9, "amount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "decimalNumberByAdding:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = CFSTR("type");
  PKPeerPaymentQuoteItemTypeToString(a3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v38;
  v42[1] = CFSTR("1");
  v41[1] = CFSTR("exchangeRate");
  v41[2] = CFSTR("sendAmount");
  objc_msgSend(v12, "stringValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v37;
  v41[3] = CFSTR("sendAmountCurrency");
  objc_msgSend(v9, "currency");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v36;
  v41[4] = CFSTR("receiveAmount");
  objc_msgSend(v9, "amount");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v34;
  v41[5] = CFSTR("receiveAmountCurrency");
  objc_msgSend(v9, "currency");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v22;
  v41[6] = CFSTR("totalAmount");
  v39 = v21;
  objc_msgSend(v21, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v23;
  v41[7] = CFSTR("totalAmountCurrency");
  objc_msgSend(v9, "currency");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v24;
  v41[8] = CFSTR("dpanIdentifier");
  v40 = v12;
  v33 = v11;
  if (v11)
    objc_msgSend(v11, "dpanIdentifier");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v25;
  v41[9] = CFSTR("fees");
  objc_msgSend(v13, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v26;
  v41[10] = CFSTR("feesCurrency");
  objc_msgSend(v9, "currency");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v27;
  v41[11] = CFSTR("supportedNetworks");
  objc_msgSend(v10, "supportedNetworks");
  v32 = v13;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[11] = v28;
  v42[12] = &unk_1E2C3DE28;
  v41[12] = CFSTR("merchantCapabilities");
  v41[13] = CFSTR("merchantIdentifier");
  objc_msgSend(v10, "merchantIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v42[13] = v29;
  v42[14] = CFSTR("342f5544");
  v41[14] = CFSTR("nonce");
  v41[15] = CFSTR("countryCode");
  v42[15] = CFSTR("US");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 recurringPaymentIdentifier:(id)a7 frequency:(unint64_t)a8 startDate:(id)a9 threshold:(id)a10 completion:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  PKCurrencyAmount *mockBalance;
  PKCurrencyAmount *v23;
  PKCurrencyAmount *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  BOOL v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  dispatch_time_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  _QWORD block[5];
  id v46;
  id v47;
  id v48;
  PKCurrencyAmount *v49;
  id v50;
  uint8_t buf[4];
  PKMockPeerPaymentController *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v44 = a5;
  v16 = a6;
  v17 = a7;
  v43 = a9;
  v18 = a10;
  v19 = a11;
  if (!v16)
  {
    -[PKPeerPaymentController _defaultAlternateFundingSourceForMode:](self, "_defaultAlternateFundingSourceForMode:", -[PKPeerPaymentController mode](self, "mode"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PKPeerPaymentController account](self, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  mockBalance = self->_mockBalance;
  if (mockBalance)
  {
    v23 = mockBalance;
  }
  else
  {
    objc_msgSend(v20, "currentBalance");
    v23 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  if (-[PKPeerPaymentController mode](self, "mode") == 5)
  {
    v25 = 0;
  }
  else
  {
    if (-[PKPeerPaymentController mode](self, "mode") != 1)
      goto LABEL_17;
    objc_msgSend(v15, "amount");
    v41 = v21;
    v26 = v15;
    v27 = v18;
    v28 = v17;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount amount](v24, "amount");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "compare:", v29);

    v32 = v31 == -1;
    v33 = v31 != -1;
    v25 = v32 ? 40301 : 0;

    v17 = v28;
    v18 = v27;
    v15 = v26;
    v21 = v41;
    if (v33)
      goto LABEL_17;
  }
  if (v16)
  {
LABEL_17:
    v40 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __158__PKMockPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke;
    block[3] = &unk_1E2ABE238;
    block[4] = self;
    v46 = v15;
    v47 = v16;
    v48 = v21;
    v49 = v24;
    v50 = v19;
    dispatch_after(v40, MEMORY[0x1E0C80D38], block);

    goto LABEL_18;
  }
  v42 = v18;
  v34 = v17;
  PKLogFacilityTypeGetObject(0xBuLL);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v52 = self;
    _os_log_impl(&dword_18FC92000, v35, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController %p: Failed to quote requiring alternative funding source as no suitable payment cards were found.", buf, 0xCu);
  }

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPeerPaymentWebServiceErrorDomain"), v25, 0);
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_NO_CARDS_ERROR_TITLE"), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_NO_CARDS_ERROR_MESSAGE"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustomWithType(-1, v37, v38, v36, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v39);
  v17 = v34;
  v18 = v42;
LABEL_18:

}

void __158__PKMockPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PKCurrencyAmount *v8;
  void *v9;
  PKCurrencyAmount **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  PKPeerPaymentQuote *v47;
  void *v48;
  id *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  PKCurrencyAmount *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[14];
  _QWORD v78[14];
  _BYTE v79[128];
  PKCurrencyAmount *v80;
  _QWORD v81[2];
  PKCurrencyAmount *v82;
  _QWORD v83[3];

  v83[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "mode");
  v3 = *(void **)(a1 + 32);
  v4 = 0x1E0CB3000uLL;
  v71 = a1;
  if (v2 == 5)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "loadFromCardFeatureDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_quoteItemDictionaryWithType:amount:alternateFundingSource:featureDescriptor:", 1, v5, v6, v7);
    v8 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
    v83[0] = v8;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = (PKCurrencyAmount **)v83;
  }
  else
  {
    if (objc_msgSend(v3, "mode") != 1)
    {
      v20 = 0;
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 64), "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v12 = a1;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "compare:", v13);

    if (v14 == 1)
    {
      objc_msgSend(*(id *)(v12 + 64), "amount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v12 + 40), "amount");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "compare:", v16);

      v18 = *(void **)(v12 + 40);
      if (v17 == -1)
      {
        v51 = *(id *)(v12 + 64);
        objc_msgSend(v18, "amount");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "amount");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "decimalNumberBySubtracting:", v53);
        v54 = v12;
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = [PKCurrencyAmount alloc];
        objc_msgSend(*(id *)(v12 + 40), "currency");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v55, "initWithAmount:currency:exponent:", v7, v56, 0);

        v57 = *(void **)(v54 + 32);
        objc_msgSend(*(id *)(v54 + 56), "sendToUserFeatureDescriptor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "_quoteItemDictionaryWithType:amount:alternateFundingSource:featureDescriptor:", 2, v51, 0, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v81[0] = v59;
        v60 = *(void **)(v54 + 32);
        v61 = *(_QWORD *)(v54 + 48);
        objc_msgSend(*(id *)(v54 + 56), "sendToUserFeatureDescriptor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "_quoteItemDictionaryWithType:amount:alternateFundingSource:featureDescriptor:", 1, v8, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v81[1] = v63;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = 0x1E0CB3000uLL;
        goto LABEL_10;
      }
      v19 = *(void **)(v12 + 32);
      objc_msgSend(*(id *)(v12 + 56), "sendToUserFeatureDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_quoteItemDictionaryWithType:amount:alternateFundingSource:featureDescriptor:", 2, v18, 0, v7);
      v8 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
      v80 = v8;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = &v80;
    }
    else
    {
      v21 = *(void **)(v12 + 32);
      v22 = *(_QWORD *)(v12 + 40);
      v23 = *(_QWORD *)(v12 + 48);
      objc_msgSend(*(id *)(v12 + 56), "sendToUserFeatureDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_quoteItemDictionaryWithType:amount:alternateFundingSource:featureDescriptor:", 1, v22, v23, v7);
      v8 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
      v82 = v8;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = &v82;
    }
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v20;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v74 != v27)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("fees"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(*(id *)(v4 + 1432), "decimalNumberWithString:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = v4;
            objc_msgSend(*(id *)(v4 + 1432), "notANumber");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "isEqualToNumber:", v32);

            if ((v33 & 1) == 0)
            {
              objc_msgSend(v24, "decimalNumberByAdding:", v30);
              v34 = objc_claimAutoreleasedReturnValue();

              v24 = (void *)v34;
            }
            v4 = v31;
          }
        }
        else
        {
          v30 = 0;
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v26);
  }

  objc_msgSend(*(id *)(v71 + 64), "amount");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringValue");
  v36 = objc_claimAutoreleasedReturnValue();

  v77[0] = CFSTR("quoteIdentifier");
  v77[1] = CFSTR("requiresIdentityVerification");
  v78[0] = CFSTR("quoteIdentifier");
  v78[1] = MEMORY[0x1E0C9AAA0];
  v77[2] = CFSTR("validUntil");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 500.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)v36;
  v78[2] = v69;
  v78[3] = CFSTR("disclosureText");
  v77[3] = CFSTR("disclosureText");
  v77[4] = CFSTR("disclosureURL");
  v78[4] = CFSTR("disclosureURL");
  v78[5] = v36;
  v77[5] = CFSTR("currentBalance");
  v77[6] = CFSTR("currentBalanceCurrency");
  objc_msgSend(*(id *)(v71 + 64), "currency");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v78[6] = v68;
  v77[7] = CFSTR("totalFees");
  objc_msgSend(v24, "stringValue");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v78[7] = v67;
  v77[8] = CFSTR("totalFeesCurrency");
  objc_msgSend(*(id *)(v71 + 40), "currency");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v78[8] = v66;
  v77[9] = CFSTR("totalReceiveAmount");
  objc_msgSend(*(id *)(v71 + 40), "amount");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "stringValue");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v78[9] = v64;
  v77[10] = CFSTR("totalReceiveAmountCurrency");
  objc_msgSend(*(id *)(v71 + 40), "currency");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v78[10] = v37;
  v77[11] = CFSTR("appleHash");
  objc_msgSend(CFSTR("1234567890ABCDEF"), "pk_decodeHexadecimal");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "SHA256Hash");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "hexEncoding");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v78[11] = v40;
  v77[12] = CFSTR("externalHash");
  objc_msgSend(CFSTR("1234567890ABCDEF"), "pk_decodeHexadecimal");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "SHA256Hash");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "hexEncoding");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  v77[13] = CFSTR("quoteItems");
  v45 = (id)MEMORY[0x1E0C9AA60];
  if (obj)
    v45 = obj;
  v78[12] = v43;
  v78[13] = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 14);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = -[PKPeerPaymentQuote initWithDictionary:]([PKPeerPaymentQuote alloc], "initWithDictionary:", v46);
  objc_msgSend(*(id *)(v71 + 32), "valueForKey:", CFSTR("recipient"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentQuote setRecipient:](v47, "setRecipient:", v48);

  objc_msgSend(*(id *)(v71 + 32), "internalState");
  v49 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v49 + 8, v47);

  objc_msgSend(*(id *)(v71 + 32), "_setState:notify:", 4, 1);
  v50 = *(_QWORD *)(v71 + 72);
  if (v50)
    (*(void (**)(uint64_t, uint64_t, PKPeerPaymentQuote *, _QWORD))(v50 + 16))(v50, 1, v47, 0);

}

- (void)formalRequestTokenForAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  if (-[PKPeerPaymentController _ensureState:](self, "_ensureState:", 6))
  {
    v7 = dispatch_time(0, 300000000);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__PKMockPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke;
    v8[3] = &unk_1E2ABDA18;
    v8[4] = self;
    v9 = v6;
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

  }
}

void __77__PKMockPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke(uint64_t a1)
{
  PKPeerPaymentRequestToken *v2;
  void *v3;
  void *v4;
  PKPeerPaymentRequestToken *v5;
  _QWORD *v6;
  void *v7;
  PKPeerPaymentRequestToken *v8;

  v2 = [PKPeerPaymentRequestToken alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKPeerPaymentRequestToken initWithRequestToken:deviceScoreIdentifier:expiryDate:](v2, "initWithRequestToken:deviceScoreIdentifier:expiryDate:", CFSTR("aaaaaffff"), v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "internalState");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6[7];
  v6[7] = v5;
  v8 = v5;

  objc_msgSend(*(id *)(a1 + 32), "_setState:notify:", 7, 1);
}

- (void)paymentAuthorizationCoordinator:(id *)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke;
  block[3] = &unk_1E2ABE030;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);

}

void __100__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke(uint64_t a1)
{
  PKPaymentAuthorizationResult *v2;
  uint64_t v3;
  _BYTE *v4;
  PKPeerPaymentPerformResponse *v5;
  _QWORD *v6;
  void *v7;
  PKPeerPaymentPerformResponse *v8;
  NSObject *v9;
  uint8_t v10[16];

  v2 = objc_alloc_init(PKPaymentAuthorizationResult);
  -[PKPaymentAuthorizationResult setStatus:](v2, "setStatus:", 0);
  v3 = objc_msgSend(*(id *)(a1 + 32), "mode");
  v4 = *(_BYTE **)(a1 + 32);
  if (v3 == 1 && v4[152])
  {
    objc_msgSend(v4, "_adjustBalanceForAuthorizedTransferQuote:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_insertPeerPaymentTransactionForAuthroizedTransferQuote:", *(_QWORD *)(a1 + 40));
    v4 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v4, "_setPerformQuoteSuccess:", 1);
  v5 = objc_alloc_init(PKPeerPaymentPerformResponse);
  objc_msgSend(*(id *)(a1 + 32), "internalState");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6[10];
  v6[10] = v5;
  v8 = v5;

  PKLogFacilityTypeGetObject(0xBuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController: Perform quote succeeded. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_adjustBalanceForAuthorizedTransferQuote:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "peerPaymentQuote");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstQuoteItemOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "totalAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithMantissa:exponent:isNegative:", 1, 0, 1);
    objc_msgSend(v6, "decimalNumberByMultiplyingBy:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentController webService](self, "webService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "peerPaymentService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateMockAccountBalanceByAddingAmount:completion:", v8, 0);

  }
}

- (void)_insertPeerPaymentTransactionForAuthroizedTransferQuote:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PKPaymentTransaction *v12;
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
  PKPaymentService *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peerPaymentPassUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passWithUniqueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v33, "peerPaymentQuote");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstQuoteItemOfType:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstQuoteItemOfType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dpanIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v10;
    if (v10)
    {
      objc_msgSend(v3, "passWithDPANIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v11, "devicePrimaryInAppPaymentApplication");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(PKPaymentTransaction);
    objc_msgSend(v7, "totalReceiveAmount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setAmount:](v12, "setAmount:", v13);

    objc_msgSend(v7, "totalReceiveAmountCurrency");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setCurrencyCode:](v12, "setCurrencyCode:", v14);

    -[PKPaymentTransaction setTransactionType:](v12, "setTransactionType:", 3);
    -[PKPaymentTransaction setPeerPaymentType:](v12, "setPeerPaymentType:", 1);
    objc_msgSend(v7, "recipient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "phoneOrEmail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setPeerPaymentCounterpartHandle:](v12, "setPeerPaymentCounterpartHandle:", v16);

    v30 = v8;
    if (v8)
    {
      objc_msgSend(v8, "totalAmount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setPrimaryFundingSourceAmount:](v12, "setPrimaryFundingSourceAmount:", v17);

      objc_msgSend(v8, "totalAmountCurrency");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setPrimaryFundingSourceAmount:](v12, "setPrimaryFundingSourceAmount:", v18);

      objc_msgSend(v7, "totalReceiveAmountCurrency");
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setPrimaryFundingSourceCurrencyCode:](v12, "setPrimaryFundingSourceCurrencyCode:", v19);

    objc_msgSend(v9, "totalAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setSecondaryFundingSourceAmount:](v12, "setSecondaryFundingSourceAmount:", v20);

    objc_msgSend(v9, "totalAmountCurrency");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setSecondaryFundingSourceCurrencyCode:](v12, "setSecondaryFundingSourceCurrencyCode:", v21);

    -[PKPaymentTransaction setSecondaryFundingSourceNetwork:](v12, "setSecondaryFundingSourceNetwork:", objc_msgSend(v31, "paymentNetworkIdentifier"));
    objc_msgSend(v11, "deviceAccountNumberSuffix");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setSecondaryFundingSourceDPANSuffix:](v12, "setSecondaryFundingSourceDPANSuffix:", v22);

    objc_msgSend(v11, "localizedDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setSecondaryFundingSourceDescription:](v12, "setSecondaryFundingSourceDescription:", v23);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setTransactionDate:](v12, "setTransactionDate:", v24);

    -[PKPaymentTransaction setTransactionSource:](v12, "setTransactionSource:", 2);
    -[PKPaymentTransaction setHasNotificationServiceData:](v12, "setHasNotificationServiceData:", 1);
    -[PKPaymentTransaction setProcessedForLocation:](v12, "setProcessedForLocation:", 1);
    -[PKPaymentTransaction setProcessedForMerchantCleanup:](v12, "setProcessedForMerchantCleanup:", 1);
    -[PKPaymentTransaction setPeerPaymentStatus:](v12, "setPeerPaymentStatus:", 1);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentTransaction setServiceIdentifier:](v12, "setServiceIdentifier:", v26);

    v27 = objc_alloc_init(PKPaymentService);
    objc_msgSend(v6, "uniqueID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devicePrimaryInAppPaymentApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentService insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:](v27, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v12, v28, v29, 0);

  }
}

- (void)_insertPaymentTransactionForSecondaryFundingSourceIfNecessary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  PKPaymentTransaction *v11;
  void *v12;
  void *v13;
  PKMerchant *v14;
  void *v15;
  PKPaymentService *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(a3, "peerPaymentQuote");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstQuoteItemOfType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "totalAmount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:", v6);

    if (v7 == 1)
    {
      objc_msgSend(v4, "dpanIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "passWithDPANIdentifier:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }
      v11 = objc_alloc_init(PKPaymentTransaction);
      objc_msgSend(v4, "totalAmount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setAmount:](v11, "setAmount:", v12);

      objc_msgSend(v4, "totalAmountCurrency");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setCurrencyCode:](v11, "setCurrencyCode:", v13);

      -[PKPaymentTransaction setTransactionType:](v11, "setTransactionType:", 0);
      v14 = objc_alloc_init(PKMerchant);
      -[PKMerchant setRawName:](v14, "setRawName:", CFSTR("Apple, Inc."));
      -[PKMerchant setName:](v14, "setName:", CFSTR("Apple, Inc."));
      -[PKPaymentTransaction setMerchant:](v11, "setMerchant:", v14);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction setTransactionDate:](v11, "setTransactionDate:", v15);

      -[PKPaymentTransaction setTransactionSource:](v11, "setTransactionSource:", 2);
      -[PKPaymentTransaction setHasNotificationServiceData:](v11, "setHasNotificationServiceData:", 1);
      -[PKPaymentTransaction setProcessedForLocation:](v11, "setProcessedForLocation:", 1);
      -[PKPaymentTransaction setProcessedForMerchantCleanup:](v11, "setProcessedForMerchantCleanup:", 1);
      -[PKPaymentTransaction setPeerPaymentStatus:](v11, "setPeerPaymentStatus:", 1);
      v16 = objc_alloc_init(PKPaymentService);
      objc_msgSend(v10, "uniqueID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "devicePrimaryInAppPaymentApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentService insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:](v16, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v11, v17, v18, 0);

    }
  }

}

- (void)paymentAuthorizationCoordinator:(id *)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PKPaymentRequestPaymentMethodUpdate *v16;
  id *v17;
  id v18;
  PKCurrencyAmount *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  PKMockPeerPaymentController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a4, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devicePrimaryInAppPaymentApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dpanIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentController quote](self, "quote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstQuoteItemOfType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dpanIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10 && (objc_msgSend(v13, "isEqualToString:", v10) & 1) == 0)
  {
    objc_msgSend(v11, "totalReceiveAmount");
    v16 = (PKPaymentRequestPaymentMethodUpdate *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "totalReceiveAmountCurrency");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v16, v20, 0);
    -[PKPeerPaymentController internalState](self, "internalState");
    v17 = (id *)objc_claimAutoreleasedReturnValue();
    v18 = v17[7];

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
    v21[3] = &unk_1E2AC7550;
    v21[4] = self;
    v22 = v7;
    -[PKPeerPaymentController quoteWithAmount:requestToken:alternateFundingSource:completion:](self, "quoteWithAmount:requestToken:alternateFundingSource:completion:", v19, v18, v8, v21);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = self;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController %p: New quote request is not required. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", buf, 0xCu);
    }

    v16 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
    -[PKPaymentRequestUpdate setStatus:](v16, "setStatus:", 0);
    (*((void (**)(id, PKPaymentRequestPaymentMethodUpdate *))v7 + 2))(v7, v16);
  }

}

void __94__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  PKPaymentRequestPaymentMethodUpdate *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  -[PKPaymentRequestPaymentMethodUpdate setPeerPaymentQuote:](v5, "setPeerPaymentQuote:", v4);
  objc_msgSend(*(id *)(a1 + 32), "summaryItemsForQuote:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentRequestUpdate setPaymentSummaryItems:](v5, "setPaymentSummaryItems:", v6);
  -[PKPaymentRequestUpdate setStatus:](v5, "setStatus:", 0);
  PKLogFacilityTypeGetObject(0xBuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController: Get updated quote succeeded. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", v8, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)performAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5
{
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a5;
  v6 = dispatch_time(0, 800000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKMockPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

uint64_t __78__PKMockPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 1, 0);
  return result;
}

- (PKCurrencyAmount)mockBalance
{
  return self->_mockBalance;
}

- (void)setMockBalance:(id)a3
{
  objc_storeStrong((id *)&self->_mockBalance, a3);
}

- (BOOL)shouldGenerateMockTransactions
{
  return self->_shouldGenerateMockTransactions;
}

- (void)setShouldGenerateMockTransactions:(BOOL)a3
{
  self->_shouldGenerateMockTransactions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockBalance, 0);
  objc_storeStrong(&self->_performCompletion, 0);
}

@end
