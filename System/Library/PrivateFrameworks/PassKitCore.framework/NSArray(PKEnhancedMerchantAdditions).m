@implementation NSArray(PKEnhancedMerchantAdditions)

- (id)jsonString
{
  void *v1;
  id v2;
  BOOL v3;
  NSObject *v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a1, 0, &v7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v7;
  if (v2)
    v3 = 1;
  else
    v3 = v1 == 0;
  if (v3)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v2;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Error serializing to JSON: %@", buf, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);
  }

  return v5;
}

- (id)deepCopyWithZone:()PKEnhancedMerchantAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSArray_PKEnhancedMerchantAdditions__deepCopyWithZone___block_invoke;
  v4[3] = &__block_descriptor_40_e8__16__0_8l;
  v4[4] = a3;
  objc_msgSend(a1, "pk_arrayBySafelyApplyingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)nonZeroUnsignedLongLongArrayValue
{
  return objc_msgSend(a1, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_308_0);
}

- (id)nonZeroUnsignedLongLongSetValue
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "nonZeroUnsignedLongLongArrayValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)stringArrayValue
{
  return objc_msgSend(a1, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_309);
}

- (id)stringSetValue
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringArrayValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
