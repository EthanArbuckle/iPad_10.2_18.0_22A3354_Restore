@implementation PKPaymentRemotePaymentInstrumentDataItem

+ (int64_t)dataType
{
  return 4;
}

- (int64_t)context
{
  return 1;
}

- (id)errors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v9[0] = CFSTR("post");
  v9[1] = CFSTR("name");
  v9[2] = CFSTR("phoneticName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataItem model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentErrors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_FilteredBillingErrorsForContactFields:errors:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)paymentContactFormatErrors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v9[0] = CFSTR("post");
  v9[1] = CFSTR("name");
  v9[2] = CFSTR("phoneticName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataItem model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentContactFormatErrors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_FilteredBillingErrorsForContactFields:errors:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PKRemoteDevice)remoteDevice
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKRemoteDevice *)v3;
}

- (PKRemotePaymentInstrument)remotePaymentInstrument
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remotePaymentInstrument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKRemotePaymentInstrument *)v3;
}

- (PKPaymentApplication)paymentApplication
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaymentApplication *)v3;
}

- (CNContact)billingAddress
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "billingAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (BOOL)requiresBillingAddress
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requiredBillingContactFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("post"));

  return v5;
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  void *v2;
  char v3;

  -[PKPaymentRemotePaymentInstrumentDataItem remotePaymentInstrument](self, "remotePaymentInstrument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAssociatedPeerPaymentAccount");

  return v3;
}

- (id)peerPaymentAccountBalance
{
  void *v2;
  void *v3;

  -[PKPaymentRemotePaymentInstrumentDataItem remotePaymentInstrument](self, "remotePaymentInstrument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPaymentAccountBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)peerPaymentAccountState
{
  void *v2;
  unint64_t v3;

  -[PKPaymentRemotePaymentInstrumentDataItem remotePaymentInstrument](self, "remotePaymentInstrument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "peerPaymentAccountState");

  return v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentRemotePaymentInstrumentDataItem hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"))
  {
    -[PKPaymentRemotePaymentInstrumentDataItem peerPaymentAccountBalance](self, "peerPaymentAccountBalance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDataItem model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currencyCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentDataItem model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transactionAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "compareToCurrencyCode:amount:", v7, v9) == -1)
    {
      -[PKPaymentDataItem model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "paymentRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "requestType");

      if (v12 != 10)
      {
        if (!a3)
        {
          v22 = 0;
          if (-[PKPaymentDataItem status](self, "status") == 4)
            goto LABEL_38;
          goto LABEL_31;
        }
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v63[0] = *MEMORY[0x1E0CB2D50];
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE"), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v25;
        v63[1] = *MEMORY[0x1E0CB2D68];
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE"), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1001, v14);
        v22 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {

    }
  }
  if (!-[PKPaymentRemotePaymentInstrumentDataItem requiresBillingAddress](self, "requiresBillingAddress"))
  {
    v22 = 1;
    goto LABEL_25;
  }
  -[PKPaymentRemotePaymentInstrumentDataItem errors](self, "errors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[PKPaymentRemotePaymentInstrumentDataItem paymentContactFormatErrors](self, "paymentContactFormatErrors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PKPaymentDataItem model](self, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "billingAddress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (!v14)
      goto LABEL_19;
LABEL_15:
    v21 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INVALID");
    if (objc_msgSend(v14, "code") == 2)
    {
      objc_msgSend(v14, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "PKStringForKey:", CFSTR("PKPaymentErrorPostalAddress"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        v21 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE");
    }
    v20 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON");
    goto LABEL_20;
  }
  objc_msgSend(v17, "postalAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v14)
    goto LABEL_15;
  if (!v19)
  {
LABEL_19:
    v20 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_REQUIRED_REASON");
    v21 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_REQUIRED");
    goto LABEL_20;
  }
  if (-[PKPaymentDataItem isRejected](self, "isRejected"))
  {
    v20 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INCOMPLETE_REASON");
    v21 = CFSTR("IN_APP_PAYMENT_BILLING_ADDRESS_INVALID");
LABEL_20:
    PKLocalizedPaymentString(&v21->isa, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(&v20->isa, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (a3)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D68];
      v61[0] = *MEMORY[0x1E0CB2D50];
      v61[1] = v29;
      v62[0] = v25;
      v62[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3002, v30);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = 0;
    goto LABEL_23;
  }
  v27 = 0;
  v25 = 0;
  v22 = 1;
LABEL_23:

LABEL_24:
LABEL_25:
  if (-[PKPaymentDataItem status](self, "status") == 4)
  {
    if (!a3)
    {
LABEL_37:
      v22 = 0;
      goto LABEL_38;
    }
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v59[0] = *MEMORY[0x1E0CB2D50];
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_CARD_BLOCKED"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v32;
    v59[1] = *MEMORY[0x1E0CB2D68];
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_TOO_MANY_WRONG_CODES"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3001, v34);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
LABEL_31:
  if (-[PKPaymentDataItem status](self, "status") == 5)
  {
    -[PKPaymentDataItem model](self, "model");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "pass");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "hasAssociatedPeerPaymentAccount");

    if (v38)
    {
      -[PKPaymentDataItem model](self, "model");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "pass");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "peerPaymentBalance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "minimalFormattedStringValue");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE_DETAILS"), CFSTR("%@"), v41);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a3)
      {
LABEL_36:

        goto LABEL_37;
      }
      v42 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v58[0] = v33;
      v44 = *MEMORY[0x1E0CB2D68];
      v57[0] = v43;
      v57[1] = v44;
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE"), 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3009, v45);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_35:
      goto LABEL_36;
    }
  }
LABEL_38:
  -[PKPaymentRemotePaymentInstrumentDataItem remotePaymentInstrument](self, "remotePaymentInstrument");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46
    || (-[PKPaymentDataItem model](self, "model"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v47, "allAcceptedRemotePaymentInstruments"),
        v48 = (void *)objc_claimAutoreleasedReturnValue(),
        v49 = objc_msgSend(v48, "containsObject:", v46),
        v48,
        v47,
        (v49 & 1) == 0))
  {
    if (a3)
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_TRY_DIFFERENT_PAYMENT_CARD"), 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D68];
      v55[0] = *MEMORY[0x1E0CB2D50];
      v55[1] = v52;
      v56[0] = v50;
      v56[1] = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3000, v53);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = 0;
  }

  return v22;
}

@end
