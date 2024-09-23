@implementation RTNSStringArrayTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[RTNSStringArrayTransformer transformedValue:]";
      v12 = 1024;
      v13 = 37;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Object is not of array type (in %s:%d)", (uint8_t *)&v10, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "componentsJoinedByString:", &stru_1E92C3A08);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v7);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_8:
    v8 = 0;
  }

  return v8;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[RTNSStringArrayTransformer reverseTransformedValue:]";
      v10 = 1024;
      v11 = 54;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "componentsSeparatedByString:", &stru_1E92C3A08);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

@end
