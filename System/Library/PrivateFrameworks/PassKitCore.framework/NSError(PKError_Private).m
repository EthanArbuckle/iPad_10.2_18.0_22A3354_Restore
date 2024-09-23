@implementation NSError(PKError_Private)

- (id)pk_paymentErrorWithLocalizedDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  const PKContactField *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("PKPaymentErrorDomain")) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(a1, "localizedDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {

    goto LABEL_8;
  }
  v4 = (void *)v3;
  objc_msgSend(a1, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
LABEL_6:
    v7 = a1;
    return v7;
  }
LABEL_8:
  objc_msgSend(a1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_msgSend(a1, "code") - 1;
  v11 = CFSTR("IN_APP_PAYMENT_COUPON_CODE_INVALID");
  switch(v10)
  {
    case 0:
    case 1:
      if (objc_msgSend(a1, "code") == 2
        && (objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField")),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            !v12))
      {
        v14 = &PKContactFieldPostalAddress;
      }
      else
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          goto LABEL_19;
        v14 = (const PKContactField *)&PKContactFieldContactInfo;
      }
      objc_msgSend(v9, "setObject:forKey:", *v14, CFSTR("PKPaymentErrorContactField"));
LABEL_19:
      objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("phone"));

      if ((v17 & 1) != 0)
      {
        v11 = CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_PHONE");
        goto LABEL_31;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("email"));

      if ((v19 & 1) != 0)
      {
        v11 = CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_EMAIL");
        goto LABEL_31;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("post"));

      if ((v21 & 1) != 0)
      {
        v11 = CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_ADDRESS");
        goto LABEL_31;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("name"));

      if ((v23 & 1) != 0)
      {
        v11 = CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_NAME");
        goto LABEL_31;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("phoneticName"));

      if ((v25 & 1) != 0)
      {
        v11 = CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_PHONETIC_NAME");
        goto LABEL_31;
      }
      objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("contactInfo"));

      if ((v27 & 1) != 0)
      {
        v11 = CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_INCORRECT_CONTACT");
        goto LABEL_31;
      }
LABEL_33:
      v30 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(a1, "domain");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, objc_msgSend(a1, "code"), v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 2:
      objc_msgSend(v9, "objectForKey:", CFSTR("PKPaymentErrorContactField"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        objc_msgSend(v9, "setObject:forKey:", CFSTR("post"), CFSTR("PKPaymentErrorContactField"));
      v11 = CFSTR("IN_APP_PAYMENT_CONTACT_ITEM_ADDRESS_UNSUPPORTED");
      goto LABEL_31;
    case 3:
      goto LABEL_31;
    case 4:
      v11 = CFSTR("IN_APP_PAYMENT_COUPON_CODE_EXPIRED");
LABEL_31:
      PKLocalizedPaymentString(&v11->isa, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        objc_msgSend(v9, "setObject:forKey:", v28, *MEMORY[0x1E0CB2D50]);

      }
      goto LABEL_33;
    default:
      goto LABEL_33;
  }
  return v7;
}

@end
