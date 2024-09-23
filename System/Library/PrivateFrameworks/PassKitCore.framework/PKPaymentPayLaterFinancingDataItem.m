@implementation PKPaymentPayLaterFinancingDataItem

+ (int64_t)dataType
{
  return 14;
}

- (int64_t)context
{
  return 2;
}

- (BOOL)isValidWithError:(id *)a3
{
  return -[PKPaymentPayLaterFinancingDataItem isValidWithError:errorStatus:](self, "isValidWithError:errorStatus:", a3, 0);
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentDataItem model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "financingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loadingState");

  if (a3 && v9 == 2)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v42[0] = *MEMORY[0x1E0CB2D50];
    PKLocalizedCocoonString(CFSTR("APPLY_GENERIC_ERROR_MESSAGE"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v11;
    v42[1] = *MEMORY[0x1E0CB2D68];
    PKLocalizedCocoonString(CFSTR("APPLY_GENERIC_ERROR_TITLE"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2001, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  -[PKPaymentPayLaterFinancingDataItem assessmentCollection](self, "assessmentCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (!a3)
      goto LABEL_18;
    goto LABEL_16;
  }
  -[PKPaymentPayLaterFinancingDataItem selectedFinancingOption](self, "selectedFinancingOption");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    -[PKPaymentPayLaterFinancingDataItem previouslySelectedFinancingOption](self, "previouslySelectedFinancingOption");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (!a3)
      {
LABEL_5:
        v14 = 8;
        if (!a4)
          return (char)a3;
        goto LABEL_19;
      }
      -[PKPaymentDataItem model](self, "model");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "financingController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPayLaterFinancingDataItem previouslySelectedFinancingOption](self, "previouslySelectedFinancingOption");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dynamicContentPageItemForPageType:productType:optionIdentifier:", 7, objc_msgSend(v29, "productType"), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "errorTitle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        v33 = v31;
      }
      else
      {
        PKLocalizedCocoonString(CFSTR("IN_APP_PAYMENT_PLAN_NOT_AVAILABLE"), 0);
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      v34 = v33;

      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D68];
      v40[0] = *MEMORY[0x1E0CB2D50];
      v40[1] = v36;
      v41[0] = v34;
      v41[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -2000, v37);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
      LOBYTE(a3) = 0;
      goto LABEL_5;
    }
  }
  -[PKPaymentPayLaterFinancingDataItem selectedFinancingOption](self, "selectedFinancingOption");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && !v17)
  {
LABEL_16:
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v38[0] = *MEMORY[0x1E0CB2D50];
    PKLocalizedCocoonString(CFSTR("IN_APP_PAYMENT_MISSING_FINANCING_OPTION"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v22;
    v38[1] = *MEMORY[0x1E0CB2D68];
    PKLocalizedCocoonString(CFSTR("IN_APP_PAYMENT_MISSING_FINANCING_OPTION_MESSAGE"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3014, v24);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (!v17)
  {
LABEL_17:
    LOBYTE(a3) = 0;
    goto LABEL_18;
  }
  if (!-[PKPaymentPayLaterFinancingDataItem requiresBillingAddress](self, "requiresBillingAddress"))
  {
    v14 = 1;
    LOBYTE(a3) = 1;
    if (!a4)
      return (char)a3;
    goto LABEL_19;
  }
  v18 = (void *)objc_opt_class();
  -[PKPaymentDataItem model](self, "model");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "billingAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v18, "validateBillingAddressForItem:billingAddress:outError:", self, v20, a3);

LABEL_18:
  v14 = 1;
  if (a4)
LABEL_19:
    *a4 = v14;
  return (char)a3;
}

- (PKPayLaterFinancingOption)selectedFinancingOption
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedFinancingOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPayLaterFinancingOption *)v3;
}

- (PKPayLaterFinancingOption)previouslySelectedFinancingOption
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previouslySelectedFinancingOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPayLaterFinancingOption *)v3;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assessmentCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPayLaterProductAssessmentCollection *)v3;
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

@end
