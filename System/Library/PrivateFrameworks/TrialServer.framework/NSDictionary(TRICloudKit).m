@implementation NSDictionary(TRICloudKit)

- (id)triValueFromNestedField:()TRICloudKit
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)triNumberValueForField:()TRICloudKit isNestedValue:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a4 & 1) != 0)
    objc_msgSend(a1, "triValueFromNestedField:", v6);
  else
    objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = (id)objc_opt_class();
      v11 = v13;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "expected type NSNumber in dictionary field but got %@", (uint8_t *)&v12, 0xCu);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)triStringValueForField:()TRICloudKit isNestedValue:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a4 & 1) != 0)
    objc_msgSend(a1, "triValueFromNestedField:", v6);
  else
    objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = (id)objc_opt_class();
      v11 = v13;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "expected type NSString in dictionary field but got %@", (uint8_t *)&v12, 0xCu);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)triArrayValueForField:()TRICloudKit isNestedValue:
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((a4 & 1) != 0)
    objc_msgSend(a1, "triValueFromNestedField:", v6);
  else
    objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = (id)objc_opt_class();
      v11 = v15;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "expected type NSArray in dictionary field %@ but got %@", (uint8_t *)&v12, 0x16u);

    }
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)triDataForField:()TRICloudKit
{
  void *v1;
  id v2;
  NSObject *v3;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    TRILogCategory_Server();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_error_impl(&dword_1D207F000, v3, OS_LOG_TYPE_ERROR, "expected type NSData in dictionary field but got %@", (uint8_t *)&v6, 0xCu);

    }
    v2 = 0;
  }
  else
  {
    v2 = v1;
  }

  return v2;
}

- (id)triDateForField:()TRICloudKit
{
  void *v1;
  id v2;
  NSObject *v3;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    TRILogCategory_Server();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = (id)objc_opt_class();
      v5 = v7;
      _os_log_error_impl(&dword_1D207F000, v3, OS_LOG_TYPE_ERROR, "expected type NSDate in dictionary field but got %@", (uint8_t *)&v6, 0xCu);

    }
    v2 = 0;
  }
  else
  {
    v2 = v1;
  }

  return v2;
}

- (id)triDataValueFromBase64StringForField:()TRICloudKit
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "triValueFromNestedField:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v1, 0);
  else
    v2 = 0;

  return v2;
}

@end
