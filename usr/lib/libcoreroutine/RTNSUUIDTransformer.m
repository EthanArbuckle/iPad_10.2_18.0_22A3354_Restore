@implementation RTNSUUIDTransformer

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[RTNSUUIDTransformer reverseTransformedValue:]";
      v10 = 1024;
      v11 = 41;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Object is not of data type (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_retainAutorelease(v3);
    if (objc_msgSend(v5, "bytes"))
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v5), "bytes"));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)transformedValue:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  _BYTE v7[18];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v7 = 136315394;
      *(_QWORD *)&v7[4] = "-[RTNSUUIDTransformer transformedValue:]";
      *(_WORD *)&v7[12] = 1024;
      *(_DWORD *)&v7[14] = 27;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Object is not of UUID type (in %s:%d)", v7, 0x12u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_QWORD *)v7 = 0;
    *(_QWORD *)&v7[8] = 0;
    objc_msgSend(v3, "getUUIDBytes:", v7);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
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
