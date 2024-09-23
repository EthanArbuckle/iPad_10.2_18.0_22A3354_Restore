@implementation NSArray(PKError)

+ (NSError)paymentContactInvalidErrorWithContactField:()PKError localizedDescription:
{
  return +[PKPaymentRequest paymentContactInvalidErrorWithContactField:localizedDescription:](PKPaymentRequest, "paymentContactInvalidErrorWithContactField:localizedDescription:");
}

+ (NSError)paymentShippingAddressInvalidErrorWithKey:()PKError localizedDescription:
{
  return +[PKPaymentRequest paymentShippingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentShippingAddressInvalidErrorWithKey:localizedDescription:");
}

+ (NSError)paymentBillingAddressInvalidErrorWithKey:()PKError localizedDescription:
{
  return +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:localizedDescription:](PKPaymentRequest, "paymentBillingAddressInvalidErrorWithKey:localizedDescription:");
}

+ (NSError)paymentShippingAddressUnserviceableErrorWithLocalizedDescription:()PKError
{
  return +[PKPaymentRequest paymentShippingAddressUnserviceableErrorWithLocalizedDescription:](PKPaymentRequest, "paymentShippingAddressUnserviceableErrorWithLocalizedDescription:");
}

+ (id)pk_FilteredBillingErrorsForContactFields:()PKError errors:
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __68__NSArray_PKError__pk_FilteredBillingErrorsForContactFields_errors___block_invoke;
  v16 = &unk_1E2ACD878;
  v17 = v5;
  v18 = v8;
  v9 = v8;
  v10 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v13);

  v11 = (void *)objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

+ (uint64_t)pk_FilteredShippingErrorsForContactFields:()PKError errors:
{
  return objc_msgSend(a1, "pk_FilteredShippingErrorsForContactFields:errors:contactFieldOptional:", a3, a4, 0);
}

+ (id)pk_FilteredShippingErrorsForContactFields:()PKError errors:contactFieldOptional:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__NSArray_PKError__pk_FilteredShippingErrorsForContactFields_errors_contactFieldOptional___block_invoke;
  v15[3] = &unk_1E2ACD8A0;
  v16 = v7;
  v17 = v10;
  v18 = a5;
  v11 = v10;
  v12 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  v13 = (void *)objc_msgSend(v11, "copy");
  return v13;
}

+ (id)pk_FilteredCardErrors:()PKError
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__NSArray_PKError__pk_FilteredCardErrors___block_invoke;
  v9[3] = &unk_1E2ACD8C8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

@end
