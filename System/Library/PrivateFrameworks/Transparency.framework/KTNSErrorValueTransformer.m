@implementation KTNSErrorValueTransformer

- (id)allowedTopLevelClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)name
{
  return CFSTR("KTNSErrorValueTransformer");
}

+ (void)registerTransformer
{
  void *v2;
  void *v3;
  KTNSErrorValueTransformer *v4;

  v2 = (void *)MEMORY[0x24BDD1970];
  v4 = objc_alloc_init(KTNSErrorValueTransformer);
  +[KTNSErrorValueTransformer name](KTNSErrorValueTransformer, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValueTransformer:forName:", v4, v3);

}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  v9 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_11 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_11, &__block_literal_global_12);
    v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_11;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_ERROR, "failed to transform from data to NSError: %@", buf, 0xCu);
    }
  }

  return v5;
}

void __46__KTNSErrorValueTransformer_transformedValue___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_11;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_11 = (uint64_t)v0;

}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDE84F8], "cleanseErrorForXPC:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[TransparencyError truncateUnderlyingErrorDepth:maxDepth:](TransparencyError, "truncateUnderlyingErrorDepth:maxDepth:", v4, 10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (!v6)
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_11 != -1)
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_11, &__block_literal_global_90_1);
      v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_11;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_ERROR, "failed to transform from NSError to data: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v6 = 0;
    v5 = v3;
  }

  return v6;
}

void __53__KTNSErrorValueTransformer_reverseTransformedValue___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_11;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_11 = (uint64_t)v0;

}

@end
