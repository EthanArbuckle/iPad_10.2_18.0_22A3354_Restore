@implementation PKPaymentShippingAddressDataItem

+ (int64_t)dataType
{
  return 5;
}

- (int64_t)context
{
  return 3;
}

- (id)_shippingName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[PKPaymentDataItem model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shippingAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentDataItem model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requiredShippingContactFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("phoneticName"));

  if (v8)
    objc_msgSend(v4, "pkFullAndPhoneticName");
  else
    objc_msgSend(v4, "pkFullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSAttributedString)formattedAddressString
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[PKPaymentDataItem model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredShippingContactFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("phoneticName"));

  -[PKPaymentShippingAddressDataItem shippingAddress](self, "shippingAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pkFormattedContactAddressIncludingPhoneticName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pk_uppercaseAttributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v9;
}

- (CNContact)shippingAddress
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shippingAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNContact *)v3;
}

- (BOOL)hasShippingAddress
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PKPaymentShippingAddressDataItem shippingAddress](self, "shippingAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postalAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (NSString)shippingType
{
  void *v2;
  void *v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shippingType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
  objc_msgSend(v3, "pk_FilteredShippingErrorsForContactFields:errors:", v4, v6);
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
  objc_msgSend(v3, "pk_FilteredShippingErrorsForContactFields:errors:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isShippingEditable
{
  void *v2;
  char v3;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShippingEditable");

  return v3;
}

- (BOOL)isShippingServiceableWithError:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentShippingAddressDataItem errors](self, "errors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_235);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v6)
  {
    v7 = -[PKPaymentShippingAddressDataItem hasShippingAddress](self, "hasShippingAddress");
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v13[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("PKPaymentErrorIsFieldEmpty");
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3003, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 0;
}

BOOL __67__PKPaymentShippingAddressDataItem_isShippingServiceableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("PKPaymentErrorDomain")))
    v4 = objc_msgSend(v2, "code") == 3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PKPaymentShippingAddressDataItem validate](self, "validate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 && v4)
    *a3 = objc_retainAutorelease(v4);

  return v5 == 0;
}

- (id)validate
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[PKPaymentShippingAddressDataItem isShippingEditable](self, "isShippingEditable"))
  {
    -[PKPaymentShippingAddressDataItem firstModelError](self, "firstModelError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PKPaymentShippingAddressDataItem createShippingAddressErrorFromError:](self, "createShippingAddressErrorFromError:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else if (-[PKPaymentShippingAddressDataItem hasShippingAddress](self, "hasShippingAddress"))
    {
      if (!-[PKPaymentDataItem isRejected](self, "isRejected"))
      {
        v5 = 0;
        goto LABEL_10;
      }
      -[PKPaymentShippingAddressDataItem createIncompleteShippingAddressError](self, "createIncompleteShippingAddressError");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKPaymentShippingAddressDataItem createRequiredShippingAddressError](self, "createRequiredShippingAddressError");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v4;
LABEL_10:

    return v5;
  }
  v5 = 0;
  return v5;
}

- (id)firstModelError
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[PKPaymentShippingAddressDataItem errors](self, "errors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PKPaymentShippingAddressDataItem paymentContactFormatErrors](self, "paymentContactFormatErrors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)rawShippingType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shippingType");

  return v4;
}

- (id)createShippingAddressErrorFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKPaymentShippingAddressDataItem isClientError:](self, "isClientError:", v4) && objc_msgSend(v6, "length"))
  {
    -[PKPaymentShippingAddressDataItem incompleteShippingAddressErrorDescription](self, "incompleteShippingAddressErrorDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentShippingAddressDataItem createShippingAddressErrorWithDescription:failureReason:](self, "createShippingAddressErrorWithDescription:failureReason:", v7, v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v15 = (void *)v8;
    goto LABEL_18;
  }
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("name")))
  {
    -[PKPaymentDataItem model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shippingAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pkFullName");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("phoneticName")))
    {
      if (objc_msgSend(v4, "code") == 1)
        -[PKPaymentShippingAddressDataItem createIncompleteShippingAddressError](self, "createIncompleteShippingAddressError");
      else
        -[PKPaymentShippingAddressDataItem createUnavailableShippingAddressError](self, "createUnavailableShippingAddressError");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    -[PKPaymentDataItem model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shippingAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pkPhoneticName");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  if (v13 && objc_msgSend(v13, "length"))
  {
    -[PKPaymentShippingAddressDataItem createIncompleteShippingAddressError](self, "createIncompleteShippingAddressError");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentShippingAddressDataItem createRequiredShippingAddressError](self, "createRequiredShippingAddressError");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

LABEL_18:
  return v15;
}

- (BOOL)isClientError:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "PKBoolForKey:", CFSTR("PKPaymentErrorIsFromClient"));

  return v4;
}

- (id)createRequiredShippingAddressError
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentShippingAddressDataItem requiredShippingAddressErrorDescription](self, "requiredShippingAddressErrorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentShippingAddressDataItem requiredShippingAddressErrorFailureReason](self, "requiredShippingAddressErrorFailureReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentShippingAddressDataItem createShippingAddressErrorWithDescription:failureReason:](self, "createShippingAddressErrorWithDescription:failureReason:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requiredShippingAddressErrorDescription
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPaymentShippingAddressDataItem rawShippingType](self, "rawShippingType") - 1;
  if (v2 > 2)
    v3 = CFSTR("IN_APP_PAYMENT_SHIPPING_ADDRESS_REQUIRED");
  else
    v3 = *(&off_1E2ADDD08 + v2);
  PKLocalizedPaymentString(&v3->isa, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requiredShippingAddressErrorFailureReason
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPaymentShippingAddressDataItem rawShippingType](self, "rawShippingType") - 1;
  if (v2 > 2)
    v3 = CFSTR("IN_APP_PAYMENT_SHIPPING_ADDRESS_REQUIRED_REASON");
  else
    v3 = *(&off_1E2ADDD20 + v2);
  PKLocalizedPaymentString(&v3->isa, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createIncompleteShippingAddressError
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentShippingAddressDataItem incompleteShippingAddressErrorDescription](self, "incompleteShippingAddressErrorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentShippingAddressDataItem incompleteShippingAddressErrorFailureReason](self, "incompleteShippingAddressErrorFailureReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentShippingAddressDataItem createShippingAddressErrorWithDescription:failureReason:](self, "createShippingAddressErrorWithDescription:failureReason:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)incompleteShippingAddressErrorDescription
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPaymentShippingAddressDataItem rawShippingType](self, "rawShippingType") - 1;
  if (v2 > 2)
    v3 = CFSTR("IN_APP_PAYMENT_SHIPPING_ADDRESS_INCOMPLETE");
  else
    v3 = *(&off_1E2ADDD38 + v2);
  PKLocalizedPaymentString(&v3->isa, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)incompleteShippingAddressErrorFailureReason
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPaymentShippingAddressDataItem rawShippingType](self, "rawShippingType") - 1;
  if (v2 > 2)
    v3 = CFSTR("IN_APP_PAYMENT_SHIPPING_ADDRESS_INCOMPLETE_REASON");
  else
    v3 = *(&off_1E2ADDD50 + v2);
  PKLocalizedPaymentString(&v3->isa, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createUnavailableShippingAddressError
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentShippingAddressDataItem unavailableShippingAddressErrorDescription](self, "unavailableShippingAddressErrorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentShippingAddressDataItem unavailableShippingAddressErrorFailureReason](self, "unavailableShippingAddressErrorFailureReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentShippingAddressDataItem createShippingAddressErrorWithDescription:failureReason:](self, "createShippingAddressErrorWithDescription:failureReason:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)unavailableShippingAddressErrorDescription
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPaymentShippingAddressDataItem rawShippingType](self, "rawShippingType") - 1;
  if (v2 > 2)
    v3 = CFSTR("IN_APP_PAYMENT_SHIPPING_ADDRESS_UNAVAILABLE");
  else
    v3 = *(&off_1E2ADDD68 + v2);
  PKLocalizedPaymentString(&v3->isa, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unavailableShippingAddressErrorFailureReason
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PKPaymentShippingAddressDataItem rawShippingType](self, "rawShippingType") - 1;
  if (v2 > 2)
    v3 = CFSTR("IN_APP_PAYMENT_SHIPPING_ADDRESS_UNAVAILABLE_REASON");
  else
    v3 = *(&off_1E2ADDD80 + v2);
  PKLocalizedPaymentString(&v3->isa, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createShippingAddressErrorWithDescription:(id)a3 failureReason:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = -[PKPaymentShippingAddressDataItem hasShippingAddress](self, "hasShippingAddress");
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D68];
  v15[0] = *MEMORY[0x1E0CB2D50];
  v15[1] = v10;
  v16[0] = v7;
  v16[1] = v6;
  v15[2] = CFSTR("PKPaymentErrorIsFieldEmpty");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -3003, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
