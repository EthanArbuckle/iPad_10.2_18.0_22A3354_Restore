@implementation PKSortedPaymentApplicationsBySupportedInAppMerchantCountryCode

uint64_t __PKSortedPaymentApplicationsBySupportedInAppMerchantCountryCode_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(a2, "isRequiredForMerchantInCountry:", v5);
  v8 = objc_msgSend(v6, "isRequiredForMerchantInCountry:", *(_QWORD *)(a1 + 32));

  v9 = 1;
  if (!v7)
    v9 = -1;
  if (v7 != v8)
    return v9;
  else
    return 0;
}

@end
