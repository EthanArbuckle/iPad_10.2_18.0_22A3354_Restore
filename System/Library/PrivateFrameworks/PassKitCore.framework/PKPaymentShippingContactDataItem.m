@implementation PKPaymentShippingContactDataItem

+ (int64_t)dataType
{
  return 7;
}

- (int64_t)context
{
  return 3;
}

- (id)errors
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentShippingContactDataItem requiredContactFields](self, "requiredContactFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", CFSTR("contactInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentShippingContactDataItem errorsForContactFields:](self, "errorsForContactFields:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)requiredContactFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[PKPaymentDataItem model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requiredShippingContactFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentDataItem model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isShippingEditable");

  if (objc_msgSend(v6, "containsObject:", CFSTR("post")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("post"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v14[0] = CFSTR("name");
      v14[1] = CFSTR("phoneticName");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v11);

    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "pk_arrayByRemovingObjectsInArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)errorsForContactFields:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  -[PKPaymentDataItem model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentErrors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_FilteredShippingErrorsForContactFields:errors:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)paymentContactFormatErrors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D20];
  v9[0] = CFSTR("phone");
  v9[1] = CFSTR("email");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataItem model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentContactFormatErrors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_FilteredShippingErrorsForContactFields:errors:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)email
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shippingEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)phone
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKPaymentDataItem model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shippingPhone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pkFormattedStringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  -[PKPaymentDataItem model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentDataItem model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isShippingEditable");

  objc_msgSend(v3, "paymentRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requiredShippingContactFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CFSTR("post"));

  if (v9 && (v6 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v3, "shippingName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paymentRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requiredShippingContactFields");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", CFSTR("phoneticName"));

    if (v14)
      objc_msgSend(v11, "pkFullAndPhoneticName");
    else
      objc_msgSend(v11, "pkFullName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v10;
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const PKDisbursementErrorKey *v16;
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
  void *v28;
  int v29;
  char v30;
  int v31;
  char v32;
  char v33;
  char v34;
  char v35;
  int v36;
  int v37;
  id *v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  int v50;
  char v51;
  char v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  _BOOL4 v62;
  id *v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[3];
  _QWORD v72[5];

  v72[3] = *MEMORY[0x1E0C80C00];
  -[PKPaymentDataItem model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requiredShippingContactFields");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentShippingContactDataItem errors](self, "errors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[PKPaymentShippingContactDataItem errors](self, "errors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[PKPaymentShippingContactDataItem paymentContactFormatErrors](self, "paymentContactFormatErrors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  -[PKPaymentDataItem model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "paymentRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "requestType");

  objc_msgSend(v9, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = &PKDisbursementErrorContactFieldUserInfoKey;
  if (v13 != 10)
    v16 = &PKPaymentErrorContactFieldUserInfoKey;
  objc_msgSend(v14, "objectForKey:", *v16);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentDataItem model](self, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shippingPhone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "phoneNumbers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v19, "count") != 0;

  }
  else
  {
    v64 = 0;
  }
  -[PKPaymentDataItem model](self, "model");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shippingEmail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = v18;
  v68 = v9;
  v66 = v21;
  if (v21)
  {
    objc_msgSend(v21, "emailAddresses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v22, "count") != 0;

  }
  else
  {
    v62 = 0;
  }
  -[PKPaymentDataItem model](self, "model");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "shippingName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "pkFullName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v25, "length");

  v65 = v24;
  objc_msgSend(v24, "pkPhoneticName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v26, "length");

  -[PKPaymentDataItem model](self, "model");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "paymentRequest");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v28, "isShippingEditable");

  LODWORD(v28) = objc_msgSend(v70, "isEqualToString:", CFSTR("phone"));
  v29 = objc_msgSend(v69, "containsObject:", CFSTR("phone"));
  v30 = objc_msgSend(v70, "isEqualToString:", CFSTR("email"));
  v31 = objc_msgSend(v69, "containsObject:", CFSTR("email"));
  v32 = objc_msgSend(v70, "isEqualToString:", CFSTR("name"));
  v59 = objc_msgSend(v69, "containsObject:", CFSTR("name"));
  v33 = objc_msgSend(v70, "isEqualToString:", CFSTR("phoneticName"));
  v34 = objc_msgSend(v69, "containsObject:", CFSTR("phoneticName"));
  v35 = v29;
  v36 = objc_msgSend(v69, "containsObject:", CFSTR("post"));
  if ((_DWORD)v28 || ((v29 ^ 1 | v64) & 1) == 0)
  {
    v39 = !v64;
    if (v64)
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON");
    else
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON");
    if (v64)
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_PHONE_INCOMPLETE");
    else
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_PHONE_REQUIRED");
    v40 = -3004;
LABEL_36:
    v38 = v63;
    if (!v63)
    {
LABEL_38:
      v48 = 0;
      goto LABEL_39;
    }
LABEL_37:
    v43 = (void *)MEMORY[0x1E0CB35C8];
    v71[0] = *MEMORY[0x1E0CB2D50];
    PKLocalizedPaymentString(&v41->isa, 0, v58);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v44;
    v71[1] = *MEMORY[0x1E0CB2D68];
    PKLocalizedPaymentString(&v42->isa, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v45;
    v71[2] = CFSTR("PKPaymentErrorIsFieldEmpty");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), v40, v47);
    *v38 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  if ((v30 & 1) != 0 || ((v31 ^ 1 | v62) & 1) == 0)
  {
    v39 = !v62;
    if (v62)
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON");
    else
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON");
    if (v62)
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_EMAIL_INCOMPLETE");
    else
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_EMAIL_REQUIRED");
    v40 = -3005;
    goto LABEL_36;
  }
  v37 = v36 & v61;
  if ((v32 & 1) != 0)
  {
    v38 = v63;
    if ((v37 & 1) == 0)
    {
      if (v60)
      {
LABEL_21:
        v39 = 0;
        v40 = -3006;
        v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_NAME_INCOMPLETE");
        goto LABEL_64;
      }
LABEL_55:
      v40 = -3006;
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_NAME_REQUIRED");
      v39 = 1;
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON");
      if (!v38)
        goto LABEL_38;
      goto LABEL_37;
    }
    goto LABEL_48;
  }
  v50 = v59 ^ 1;
  if (v60)
    v50 = 1;
  v38 = v63;
  if (((v50 | v37) & 1) == 0)
    goto LABEL_55;
  if ((v33 & 1) == 0)
  {
    v51 = v34 ^ 1;
    if (v58)
      v51 = 1;
    LOBYTE(v37) = v51 | v37;
  }
  if ((v37 & 1) == 0)
  {
    -[PKPaymentDataItem model](self, "model");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "shippingName");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "pkPhoneticName");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57 && objc_msgSend(v57, "length"))
    {
      v39 = 0;
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_PHONETIC_NAME_INCOMPLETE");
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON");
    }
    else
    {
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_PHONETIC_NAME_REQUIRED");
      v39 = 1;
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_REQUIRED_REASON");
    }

    v40 = -3007;
    if (!v63)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_48:
  if (-[PKPaymentDataItem isRejected](self, "isRejected", v58)
    || (objc_msgSend(v70, "isEqualToString:", CFSTR("contactInfo")) & 1) != 0
    || (v41 = 0, v48 = 1, v68) && !v70)
  {
    v52 = v34;
    -[PKPaymentShippingContactDataItem requiredContactFields](self, "requiredContactFields");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (v54 != 1)
    {
      v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON");
      PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON"), 0);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v40 = -3010;
      if (!v38)
        goto LABEL_38;
      goto LABEL_37;
    }
    if ((v35 & 1) != 0)
    {
      v39 = 0;
      v40 = -3004;
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_PHONE_INCOMPLETE");
    }
    else if ((v31 & 1) != 0)
    {
      v39 = 0;
      v40 = -3005;
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_EMAIL_INCOMPLETE");
    }
    else
    {
      if ((v59 & 1) != 0)
        goto LABEL_21;
      if ((v52 & 1) == 0)
      {
        v41 = 0;
        v48 = 1;
        goto LABEL_39;
      }
      v39 = 0;
      v40 = -3007;
      v41 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_PHONETIC_NAME_INCOMPLETE");
    }
LABEL_64:
    v42 = CFSTR("IN_APP_PAYMENT_SHIPPING_CONTACT_INCOMPLETE_REASON");
    if (!v38)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_39:

  return v48;
}

@end
