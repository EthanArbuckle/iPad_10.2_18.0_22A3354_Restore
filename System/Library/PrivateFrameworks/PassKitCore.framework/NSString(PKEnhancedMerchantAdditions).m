@implementation NSString(PKEnhancedMerchantAdditions)

- (id)nonZeroUnsignedLongLongNSNumberValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = 0;
  if (objc_msgSend(v4, "scanUnsignedLongLong:", &v8))
    v6 = v8 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)jsonNonZeroUnsignedLongLongNSNumberArrayValue
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(a1, "jsonArrayValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "nonZeroUnsignedLongLongArrayValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Error parsing JSON, expected array", v6, 2u);
    }

    v3 = 0;
  }

  return v3;
}

- (id)jsonNonZeroUnsignedLongLongNSNumberSetValue
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "jsonNonZeroUnsignedLongLongNSNumberArrayValue");
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

- (id)jsonArrayValue
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  char isKindOfClass;
  id v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v1, "JSONObjectWithData:options:error:", v2, 0, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;

  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error parsing JSON: %@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  v8 = v3;
LABEL_12:

  return v8;
}

- (id)jsonStringSetValue
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a1, "jsonArrayValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_295_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error parsing JSON, expected array", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (id)truncatedStringWithEllipsis
{
  id v2;
  void *v3;

  if ((unint64_t)objc_msgSend(a1, "length") > 0x14)
  {
    objc_msgSend(a1, "substringToIndex:", 20);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v3, CFSTR("..."));
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = a1;
  }
  return v2;
}

@end
