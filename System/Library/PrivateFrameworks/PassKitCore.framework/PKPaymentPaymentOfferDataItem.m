@implementation PKPaymentPaymentOfferDataItem

+ (int64_t)dataType
{
  return 17;
}

- (int64_t)context
{
  return 1;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPaymentPaymentOfferDataItem isValidWithError:errorStatus:](self, "isValidWithError:errorStatus:", a3, 0);
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int64_t v18;

  v18 = 1;
  -[PKPaymentDataItem model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentOffersController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentDataItem model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fundingMode");

  if (v10 != 2)
    goto LABEL_7;
  objc_msgSend(v8, "selectedOfferDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "requiresUserAction"))
  {
    v12 = -[PKPaymentPaymentOfferDataItem _selectedPaymentOfferIsValidWithError:errorStatus:](self, "_selectedPaymentOfferIsValidWithError:errorStatus:", a3, &v18);

    if (!v12)
      goto LABEL_10;
LABEL_7:
    if (-[PKPaymentPaymentOfferDataItem requiresBillingAddress](self, "requiresBillingAddress"))
    {
      v13 = (void *)objc_opt_class();
      -[PKPaymentDataItem model](self, "model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "billingAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "validateBillingAddressForItem:billingAddress:outError:", self, v15, a3);

      if (!a4)
        goto LABEL_12;
    }
    else
    {
      v16 = 1;
      if (!a4)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  v18 = 13;
  if (a3)
  {
    -[PKPaymentPaymentOfferDataItem _selectedPaymentOfferInvalid](self, "_selectedPaymentOfferInvalid");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  v16 = 0;
  if (a4)
LABEL_11:
    *a4 = v18;
LABEL_12:

  return v16;
}

- (BOOL)_selectedPaymentOfferIsValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v17;

  -[PKPaymentPaymentOfferDataItem selectedPaymentOffer](self, "selectedPaymentOffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataItem model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fundingMode");

  v10 = 1;
  if (v9 == 2 && v7)
  {
    v17 = 1;
    -[PKPaymentDataItem model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paymentOffersController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "criteriaIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passUniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadingDetailsForPaymentOffersForCriteriaIdentifier:passUniqueID:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[PKPaymentPaymentOfferDataItem _loadingDetailsAreValid:error:errorStatus:](self, "_loadingDetailsAreValid:error:errorStatus:", v15, a3, &v17);
    if (a4)
      *a4 = v17;

  }
  return v10;
}

- (BOOL)_loadingDetailsAreValid:(id)a3 error:(id *)a4 errorStatus:(int64_t *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  int64_t v13;

  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    v12 = 1;
    goto LABEL_14;
  }
  v10 = objc_msgSend(v8, "state");
  if (!v10)
  {
    if (a4)
    {
      -[PKPaymentPaymentOfferDataItem _noPaymentOfferSelectedError](self, "_noPaymentOfferSelectedError");
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v13 = 10;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v10 == 1)
  {
    v12 = 0;
    v13 = 11;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v10 != 2)
  {
    v13 = 1;
    v12 = 1;
    if (!a5)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (a4)
  {
    objc_msgSend(v9, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPaymentOfferDataItem _errorLoadingPaymentOffersWithUnderlyingError:](self, "_errorLoadingPaymentOffersWithUnderlyingError:", v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v12 = 0;
  v13 = 12;
  if (a5)
LABEL_13:
    *a5 = v13;
LABEL_14:

  return v12;
}

- (PKSelectedPaymentOffer)selectedPaymentOffer
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedPaymentOffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKSelectedPaymentOffer *)v3;
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

- (id)billingAddress
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "billingAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (id)_noPaymentOfferSelectedError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  PKLocalizedPaymentOffersString(CFSTR("IN_APP_PAYMENT_OFFER_ERROR_NO_OFFER_SELECTED"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2D68];
  v8[0] = *MEMORY[0x1E0CB2D50];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -9002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_selectedPaymentOfferInvalid
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  PKLocalizedPaymentOffersString(CFSTR("IN_APP_PAYMENT_OFFER_ERROR_NO_OFFER_SELECTED"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0CB2D68];
  v8[0] = *MEMORY[0x1E0CB2D50];
  v8[1] = v4;
  v9[0] = v2;
  v9[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -9004, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_errorLoadingPaymentOffersWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a3;
  PKLocalizedPaymentOffersString(CFSTR("IN_APP_PAYMENT_OFFER_ERROR_LOADING_OFFER"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "localizedFailureReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      PKTitleForDisplayableError(v3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    objc_msgSend(v3, "localizedRecoverySuggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v4;
    v10 = 0;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2D50]);
  if (v10)
    v12 = v10;
  else
    v12 = v5;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -9003, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
