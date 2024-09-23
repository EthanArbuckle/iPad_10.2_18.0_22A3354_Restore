@implementation PIParallaxStyleParameter

- (NSString)type
{
  _QWORD *v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _QWORD *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D52380];
    v4 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = v4;
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v10 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
LABEL_7:
        v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0CB3978];
          v13 = v11;
          objc_msgSend(v12, "callStackSymbols");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v18 = (void *)MEMORY[0x1E0CB3978];
      v19 = specific;
      v13 = v16;
      objc_msgSend(v18, "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      v24 = 2114;
      v25 = v2;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
  }
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  id v4;
  _QWORD *v5;
  os_log_t *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  os_log_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  void *specific;
  void *v21;
  id v22;
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v6 = (os_log_t *)MEMORY[0x1E0D52380];
    v7 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = v7;
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v13 = *v5;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v13 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
LABEL_7:
        v14 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v15 = (void *)MEMORY[0x1E0CB3978];
          v16 = v14;
          objc_msgSend(v15, "callStackSymbols");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v18;
          _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v13 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v19 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v21 = (void *)MEMORY[0x1E0CB3978];
      v22 = specific;
      v16 = v19;
      objc_msgSend(v21, "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v5;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PIParallaxStyleParameter type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
      v9 = -[PIParallaxStyleParameter isEqualToParallaxStyleParameter:](self, "isEqualToParallaxStyleParameter:", v5);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v3;
  _QWORD *v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v5 = (os_log_t *)MEMORY[0x1E0D52380];
    v6 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
LABEL_7:
        v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = specific;
      v26 = 2114;
      v27 = v4;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
  }
}

@end
