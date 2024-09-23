@implementation NSSet(PKEnhancedMerchantAdditions)

- (id)jsonString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "jsonString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)deepCopyWithZone:()PKEnhancedMerchantAdditions
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NSSet_PKEnhancedMerchantAdditions__deepCopyWithZone___block_invoke;
  v8[3] = &__block_descriptor_40_e8__16__0_8l;
  v8[4] = a3;
  objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
