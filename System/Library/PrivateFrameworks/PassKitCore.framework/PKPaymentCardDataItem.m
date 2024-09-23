@implementation PKPaymentCardDataItem

+ (int64_t)dataType
{
  return 3;
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

- (PKPaymentPass)pass
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPaymentPass *)v3;
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

- (int64_t)status
{
  void *v3;
  void *v4;
  int64_t v5;

  -[PKPaymentDataItem model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentCardDataItem pass](self, "pass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_statusForPass:", v4);

  return v5;
}

- (BOOL)shouldShowCardArt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "isPeerPaymentRequest"))
    goto LABEL_4;
  objc_msgSend(v3, "peerPaymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerPaymentQuote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstQuoteItemOfType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 0;
  else
LABEL_4:
    v7 = 1;

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentCardDataItem pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[PKPaymentDataItem model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsEmptyPass");

    if (v7)
    {
      if (a3)
      {
        -[PKPaymentDataItem model](self, "model");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unavailablePasses");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "pk_firstObjectPassingTest:", &__block_literal_global_12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v11 = -3013;
        else
          v11 = -3012;
        if (v10)
          v12 = CFSTR("IN_APP_PAYMENT_ERROR_TRY_DIFFERENT_PAYMENT_CARD");
        else
          v12 = CFSTR("IN_APP_PAYMENT_ERROR_ADD_PAYMENT_CARD");
        PKLocalizedPaymentString(&v12->isa, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = *MEMORY[0x1E0CB2D68];
        v34[0] = *MEMORY[0x1E0CB2D50];
        v34[1] = v15;
        v35[0] = v13;
        v35[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), v11, v16);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      return 0;
    }
  }
  if (-[PKPaymentCardDataItem requiresBillingAddress](self, "requiresBillingAddress"))
  {
    v17 = (void *)objc_opt_class();
    -[PKPaymentDataItem model](self, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "billingAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "validateBillingAddressForItem:billingAddress:outError:", self, v19, a3);

  }
  else
  {
    v20 = 1;
  }
  if (-[PKPaymentCardDataItem status](self, "status") == 4)
  {
    if (a3)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v32[0] = *MEMORY[0x1E0CB2D50];
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_CARD_BLOCKED"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v10;
      v32[1] = *MEMORY[0x1E0CB2D68];
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_TOO_MANY_WRONG_CODES"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3001, v22);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    return 0;
  }
  if (-[PKPaymentCardDataItem status](self, "status") == 5)
  {
    -[PKPaymentDataItem model](self, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pass");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hasAssociatedPeerPaymentAccount");

    if (v25)
    {
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_ERROR_INSUFFICIENT_APPLE_CASH_BALANCE"), 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v26;
      if (!a3)
        goto LABEL_19;
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D68];
      v30[0] = *MEMORY[0x1E0CB2D50];
      v30[1] = v28;
      v31[0] = v26;
      v31[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3009, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
      return 0;
    }
  }
  return v20;
}

BOOL __42__PKPaymentCardDataItem_isValidWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "hasAssociatedPeerPaymentAccount") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "deviceInAppPaymentApplications");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "count") != 0;

  }
  return v3;
}

- (BOOL)showPeerPaymentBalance
{
  return self->_showPeerPaymentBalance;
}

- (void)setShowPeerPaymentBalance:(BOOL)a3
{
  self->_showPeerPaymentBalance = a3;
}

- (PKCurrencyAmount)peerPaymentBalance
{
  return self->_peerPaymentBalance;
}

- (void)setPeerPaymentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentBalance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentBalance, 0);
}

@end
