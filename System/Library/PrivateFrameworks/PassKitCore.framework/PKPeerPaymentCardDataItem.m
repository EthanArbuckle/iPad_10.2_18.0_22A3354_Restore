@implementation PKPeerPaymentCardDataItem

+ (int64_t)dataType
{
  return 2;
}

- (int64_t)context
{
  return 1;
}

- (PKPeerPaymentQuote)quote
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPaymentQuote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPeerPaymentQuote *)v3;
}

- (PKPaymentPass)pass
{
  PKPaymentPass *pass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKPaymentPass *v8;
  PKPaymentPass *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  pass = self->_pass;
  if (!pass)
  {
    -[PKPaymentDataItem model](self, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "library");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "peerPaymentPassUniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passWithUniqueID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentPass");
    v8 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
    v9 = self->_pass;
    self->_pass = v8;

    if (!self->_pass)
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find peer payment pass with uniqueID: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    pass = self->_pass;
  }
  return pass;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPeerPaymentCardDataItem isValidWithError:errorStatus:](self, "isValidWithError:errorStatus:", a3, 0);
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  return -[PKPeerPaymentCardDataItem _validateAccountResolutionsWithError:errorStatus:](self, "_validateAccountResolutionsWithError:errorStatus:")&& -[PKPeerPaymentCardDataItem _validateTransferLimitsWithError:errorStatus:](self, "_validateTransferLimitsWithError:errorStatus:", a3, a4)&& -[PKPeerPaymentCardDataItem _validateInsufficientBalanceWithError:errorStatus:](self, "_validateInsufficientBalanceWithError:errorStatus:", a3, a4);
}

- (BOOL)_validateInsufficientBalanceWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentDataItem model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "accountServiceTransferRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || objc_msgSend(v9, "transferType") != 2)
    goto LABEL_6;
  -[PKPaymentDataItem model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "peerPaymentAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentBalance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "currency");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currencyCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "caseInsensitiveCompare:", v15);

  if (v16
    || (objc_msgSend(v13, "amount"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "_transactionAmount"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v17, "compare:", v18),
        v18,
        v17,
        v19 != -1))
  {

LABEL_6:
    v20 = 1;
    goto LABEL_7;
  }
  if (a3)
  {
    PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D68];
    v26[0] = *MEMORY[0x1E0CB2D50];
    v26[1] = v24;
    v27[0] = v22;
    v27[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3009, v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4)
    *a4 = 5;

  v20 = 0;
LABEL_7:

  return v20;
}

- (BOOL)_validateTransferLimitsWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentDataItem model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "accountServiceTransferRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_31;
  objc_msgSend(v9, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "transferType");
  if (v12 < 2)
  {

LABEL_31:
    v31 = 1;
    goto LABEL_32;
  }
  if (v12 == 3)
  {
    objc_msgSend(v11, "oneTimeWithdrawalWithAppleCashFeatureDescriptor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12 != 2)
    {
      v14 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v11, "oneTimeDepositWithAppleCashFeatureDescriptor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_10:
  -[PKPaymentDataItem model](self, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "peerPaymentAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentBalance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currency");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "currencyCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "caseInsensitiveCompare:", v19);

  v21 = 1;
  if (v14 && !v20)
  {
    objc_msgSend(v8, "_transactionAmount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minimumAmount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "maximumAmount");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 && objc_msgSend(v22, "compare:", v23) == -1)
    {
      if (a3)
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_MINIMUM_TRANSFER_AMOUNT"), 0);
        v29 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB2D68];
        v41[0] = *MEMORY[0x1E0CB2D50];
        v41[1] = v30;
        v38 = (void *)v29;
        v42[0] = v29;
        v42[1] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3016, v34);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (a4)
      {
        v27 = v22;
        v28 = 7;
        goto LABEL_25;
      }
    }
    else
    {
      if (!v24 || objc_msgSend(v22, "compare:", v24) != 1)
      {
        v27 = v22;
        v21 = 0;
LABEL_28:

        goto LABEL_29;
      }
      if (a3)
      {
        PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_MAXIMUM_TRANSFER_AMOUNT"), 0);
        v25 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0CB2D68];
        v39[0] = *MEMORY[0x1E0CB2D50];
        v39[1] = v26;
        v37 = (void *)v25;
        v40[0] = v25;
        v40[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3015, v33);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (a4)
      {
        v27 = v22;
        v28 = 6;
LABEL_25:
        *a4 = v28;
LABEL_27:
        v21 = 1;
        goto LABEL_28;
      }
    }
    v27 = v22;
    goto LABEL_27;
  }
LABEL_29:

  if (!v21)
    goto LABEL_31;
  v31 = 0;
LABEL_32:

  return v31;
}

- (BOOL)_validateAccountResolutionsWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentDataItem model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountServiceTransferRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "transferType") >= 2)
  {
    objc_msgSend(v6, "peerPaymentAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "peerPaymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v9 = 1;
    if (v10 && v11)
    {
      v13 = PKPeerPaymentNeedsResolutionToPerformAccountServicePayments(v10, v11);
      if (v13)
      {
        if (a3)
        {
          PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_VERIFICATION_REQUIRED"), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0CB35C8];
          v15 = *MEMORY[0x1E0CB2D68];
          v19[0] = *MEMORY[0x1E0CB2D50];
          v19[1] = v15;
          v20[0] = v14;
          v20[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3017, v16);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (a4)
          *a4 = 9;
      }
      v9 = v13 ^ 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)shouldShowDisclosure
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  -[PKPaymentDataItem model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "requestType");
  if (objc_msgSend(v4, "isPeerPaymentRequest"))
  {
    -[PKPeerPaymentCardDataItem quote](self, "quote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstQuoteItemOfType:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "firstQuoteItemOfType:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 == 0;

    }
    else
    {
      v9 = 0;
    }

    -[PKPaymentDataItem model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "supportsPreservePeerPaymentBalance"))
    {
      objc_msgSend(v6, "recipient");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v11 = (void *)v13;
      }
      else
      {
        objc_msgSend(v4, "peerPaymentRequest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 &= objc_msgSend(v14, "hasUndeterminedRecipient");

        v11 = 0;
      }
      goto LABEL_19;
    }
LABEL_13:
    LOBYTE(v9) = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (v5 == 2)
  {
    objc_msgSend(v4, "paymentSummaryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      -[PKPaymentDataItem model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemForType:", 9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = v11 == 0;
      goto LABEL_19;
    }
LABEL_17:
    LOBYTE(v9) = 0;
LABEL_21:

    goto LABEL_22;
  }
  if (v5 == 11)
  {
    objc_msgSend(v4, "paymentSummaryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v4, "bankAccounts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "count"))
        goto LABEL_13;
      -[PKPaymentDataItem model](self, "model");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "itemForType:", 9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = v12 == 0;

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  LOBYTE(v9) = 0;
LABEL_22:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
