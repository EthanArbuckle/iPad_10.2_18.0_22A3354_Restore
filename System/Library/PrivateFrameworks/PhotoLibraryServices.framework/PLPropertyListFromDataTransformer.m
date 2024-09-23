@implementation PLPropertyListFromDataTransformer

- (id)transformedValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to convert property list: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

@end
