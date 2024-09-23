@implementation TPSInclusivityCondition

- (id)_valuesFromValuesArray:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  TPSInclusivityCondition *v16;
  id v17;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCondition valueType](self, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[TPSInclusivityCondition _valuesFromValueTypeArray:](self, "_valuesFromValueTypeArray:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke;
    v15 = &unk_1EA1DFE28;
    v16 = self;
    v10 = v6;
    v17 = v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v12);

    v9 = (void *)objc_msgSend(v10, "copy", v12, v13, v14, v15, v16);
  }

  return v9;
}

- (id)_valuesFromValueTypeArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  TPSInclusivityInfo *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSCondition valueType](self, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("include"));

  if (v7)
  {
    v8 = v4;
    v9 = 0;
  }
  else
  {
    -[TPSCondition valueType](self, "valueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("exclude"));

    if (v11)
    {
      v9 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TPSInclusivityCondition _valuesFromValueTypeArray:].cold.1(self, v12);

      v9 = 0;
    }
    v8 = 0;
  }
  v13 = -[TPSInclusivityInfo initWithTargetValues:excludeValues:]([TPSInclusivityInfo alloc], "initWithTargetValues:excludeValues:", v8, v9);
  objc_msgSend(v5, "addObject:", v13);
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

void __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  TPSInclusivityInfo *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "TPSSafeArrayForKey:", CFSTR("include"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "TPSSafeArrayForKey:", CFSTR("exclude"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, a1, v6);

    v5 = 0;
    v4 = 0;
  }
  v7 = -[TPSInclusivityInfo initWithTargetValues:excludeValues:]([TPSInclusivityInfo alloc], "initWithTargetValues:excludeValues:", v4, v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (void)_valuesFromValueTypeArray:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "Unknown value type for include/exclude: %@", (uint8_t *)&v4, 0xCu);

}

void __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  id v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = v4;
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = (id)objc_opt_class();
  v6 = v10;
  _os_log_error_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_ERROR, "Unexpected value element type (%@) for condition: %@", (uint8_t *)&v7, 0x16u);

}

@end
