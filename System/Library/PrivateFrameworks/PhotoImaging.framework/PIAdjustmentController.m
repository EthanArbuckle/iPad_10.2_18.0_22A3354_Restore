@implementation PIAdjustmentController

- (PIAdjustmentController)initWithAdjustment:(id)a3
{
  NUAdjustment *v4;
  PIAdjustmentController *v5;
  NUAdjustment *adjustment;
  objc_super v8;

  v4 = (NUAdjustment *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PIAdjustmentController;
  v5 = -[PIAdjustmentController init](&v8, sel_init);
  adjustment = v5->_adjustment;
  v5->_adjustment = v4;

  return v5;
}

- (NSString)displayName
{
  NUAdjustment *adjustment;
  void *v3;
  void *v4;
  NSObject *v6;
  void *v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  adjustment = self->_adjustment;
  if (!adjustment)
  {
    NUAssertLogger_2498();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adjustment empty"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v19, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2498();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E0CB3978];
        v16 = v14;
        objc_msgSend(v15, "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v18;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v19, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v13;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v19, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NUAdjustment identifier](adjustment, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)inputKeys
{
  NUAdjustment *adjustment;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v7;
  void *v8;
  const void **v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  adjustment = self->_adjustment;
  if (!adjustment)
  {
    NUAssertLogger_2498();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Adjustment empty"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v8;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v20, 0xCu);

    }
    v9 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_2498();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v15 = dispatch_get_specific(*v9);
        v16 = (void *)MEMORY[0x1E0CB3978];
        v17 = v15;
        objc_msgSend(v16, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v15;
        v22 = 2114;
        v23 = v19;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v20, 0x16u);

      }
    }
    else if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v14;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v20, 0xCu);

    }
    _NUAssertFailHandler();
  }
  -[NUAdjustment schema](adjustment, "schema");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)settingForKey:(id)a3
{
  NUAdjustment *adjustment;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  adjustment = self->_adjustment;
  v4 = a3;
  -[NUAdjustment schema](adjustment, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasInputKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[PIAdjustmentController settingForKey:](self, "settingForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)enabled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  void *specific;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[PIAdjustmentController canBeEnabled](self, "canBeEnabled"))
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "enabledKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    return v6;
  }
  v8 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
  v9 = (os_log_t *)MEMORY[0x1E0D52380];
  v10 = (void *)*MEMORY[0x1E0D52380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v10;
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Adjustment does not have an enabled setting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v13;
    _os_log_impl(&dword_1A6382000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v26, 0xCu);

    v14 = *v8;
    if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      if (v14 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
LABEL_10:
      v15 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = specific;
        v19 = v15;
        objc_msgSend(v17, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = specific;
        v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v26, 0x16u);

LABEL_17:
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (v14 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
  }
  else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
  {
    goto LABEL_10;
  }
  v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)MEMORY[0x1E0CB3978];
    v19 = v22;
    objc_msgSend(v23, "callStackSymbols");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v25;
    _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v26, 0xCu);

    goto LABEL_17;
  }
LABEL_15:
  _NUAssertContinueHandler();
  return 1;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  void *specific;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "enabledKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PIAdjustmentController hasInputKey:](self, "hasInputKey:", v5))
  {

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "enabledKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v7);

    return;
  }
  v8 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
  v9 = (os_log_t *)MEMORY[0x1E0D52380];
  v10 = (void *)*MEMORY[0x1E0D52380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = v10;
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Adjustment does not have an enabled setting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v13;
    _os_log_impl(&dword_1A6382000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

    v14 = *v8;
    if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      if (v14 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
LABEL_10:
      v15 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = specific;
        v19 = v15;
        objc_msgSend(v17, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = specific;
        v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_17:
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (v14 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
  }
  else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
  {
    goto LABEL_10;
  }
  v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)MEMORY[0x1E0CB3978];
    v19 = v22;
    objc_msgSend(v23, "callStackSymbols");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v25;
    _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_17;
  }
LABEL_15:
  _NUAssertContinueHandler();

}

- (BOOL)canBeEnabled
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "enabledKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PIAdjustmentController hasInputKey:](self, "hasInputKey:", v3);

  return (char)self;
}

- (BOOL)canHaveAuto
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "autoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PIAdjustmentController hasInputKey:](self, "hasInputKey:", v3);

  return (char)self;
}

- (BOOL)hasAutoKeyInSchema
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "autoKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PIAdjustmentController hasInputKey:](self, "hasInputKey:", v3);

  return (char)self;
}

- (BOOL)isAuto
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  os_log_t v15;
  void *specific;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[PIAdjustmentController hasAutoKeyInSchema](self, "hasAutoKeyInSchema"))
  {
    v8 = (uint64_t *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
    v9 = (os_log_t *)MEMORY[0x1E0D52380];
    v10 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = v10;
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Adjustment does not have an auto setting"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v13;
      _os_log_impl(&dword_1A6382000, v12, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&v26, 0xCu);

      v14 = *v8;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v14 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
LABEL_11:
        v15 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
          v17 = (void *)MEMORY[0x1E0CB3978];
          v18 = specific;
          v19 = v15;
          objc_msgSend(v17, "callStackSymbols");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = specific;
          v28 = 2114;
          v29 = v21;
          _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v26, 0x16u);

LABEL_19:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v14 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_11;
    }
    v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E0CB3978];
      v19 = v22;
      objc_msgSend(v23, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v25;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v26, 0xCu);

      goto LABEL_19;
    }
LABEL_16:
    _NUAssertContinueHandler();
    return 0;
  }
  if (-[PIAdjustmentController canHaveAuto](self, "canHaveAuto"))
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "autoKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    return v6;
  }
  return 0;
}

- (void)setIsAuto:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t *v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  os_log_t v14;
  void *specific;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (!-[PIAdjustmentController hasAutoKeyInSchema](self, "hasAutoKeyInSchema"))
  {
    v7 = (uint64_t *)MEMORY[0x1E0D52390];
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
    v8 = (os_log_t *)MEMORY[0x1E0D52380];
    v9 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = v9;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Adjustment does not have an auto setting"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_impl(&dword_1A6382000, v11, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      v13 = *v7;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v13 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
LABEL_11:
        v14 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
          v16 = (void *)MEMORY[0x1E0CB3978];
          v17 = specific;
          v18 = v14;
          objc_msgSend(v16, "callStackSymbols");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = specific;
          v28 = 2114;
          v29 = v20;
          _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_19:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (v13 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_11;
    }
    v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)MEMORY[0x1E0CB3978];
      v18 = v21;
      objc_msgSend(v22, "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      goto LABEL_19;
    }
LABEL_16:
    _NUAssertContinueHandler();
    return;
  }
  if (-[PIAdjustmentController canHaveAuto](self, "canHaveAuto"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[PIAdjustmentController adjustment](self, "adjustment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "autoKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, v6);

  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[PIAdjustmentController inputKeys](self, "inputKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[PIAdjustmentController _setPrimitiveValue:forKey:](self, "_setPrimitiveValue:forKey:", v7, v6);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PIAdjustmentController;
    -[PIAdjustmentController setValue:forUndefinedKey:](&v10, sel_setValue_forUndefinedKey_, v7, v6);
  }

}

- (id)valuesForArrayInputKey:(id)a3
{
  NUAdjustment *adjustment;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  adjustment = self->_adjustment;
  v4 = a3;
  -[NUAdjustment schema](adjustment, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setFromAdjustment:(id)a3
{
  NUAdjustment *v4;
  NUAdjustment *adjustment;

  v4 = (NUAdjustment *)objc_msgSend(a3, "copy");
  adjustment = self->_adjustment;
  self->_adjustment = v4;

}

- (void)interpolateFromStart:(id)a3 toEnd:(id)a4 progress:(double)a5
{
  id v8;
  id v9;
  PIAdjustmentController *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PIAdjustmentController inputKeys](self, "inputKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = v8;
  if (!v8 || a5 == 1.0)
  {
    v10 = self;
    v11 = v9;
    goto LABEL_6;
  }
  if (a5 == 0.0)
  {
    v10 = self;
    v11 = v8;
LABEL_6:
    -[PIAdjustmentController setFromAdjustment:](v10, "setFromAdjustment:", v11);
    goto LABEL_7;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    v15 = 0x1E0D52000uLL;
    v31 = *(_QWORD *)v36;
    do
    {
      v16 = 0;
      v33 = v13;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v16);
        -[PIAdjustmentController settingForKey:](self, "settingForKey:", v17, v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v15;
          objc_msgSend(v32, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v9;
          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v20)
            v24 = v22 == 0;
          else
            v24 = 1;
          if (v24)
          {
            v28 = v22;
          }
          else
          {
            objc_msgSend(v20, "doubleValue");
            v26 = v25;
            objc_msgSend(v23, "doubleValue");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26 + (v27 - v26) * a5);
            v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          v29 = v28;
          -[PIAdjustmentController adjustment](self, "adjustment");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v17);

          v9 = v21;
          v14 = v31;
          v15 = v19;
          v13 = v33;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PIAdjustmentController adjustment](self, "adjustment");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v17);
        }

        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v13);
  }
LABEL_7:

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeFromInputKey:(SEL)a3 timescaleKey:(id)a4
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v15;

  v8 = a5;
  v9 = a4;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "integerValue");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  CMTimeMake((CMTime *)retstr, v11, objc_msgSend(v13, "intValue"));
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0x1675E555296783 * objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToAdjustmentController:(id)a3
{
  void *v4;

  objc_msgSend(a3, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PIAdjustmentController isEqual:visualChangesOnly:](self, "isEqual:visualChangesOnly:", v4, 0);

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  PIAdjustmentController *v4;
  BOOL v5;

  v4 = (PIAdjustmentController *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PIAdjustmentController isEqualToAdjustmentController:](self, "isEqualToAdjustmentController:", v4);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3 visualChangesOnly:(BOOL)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (a4)
    -[PIAdjustmentController visualInputKeys](self, "visualInputKeys");
  else
    -[PIAdjustmentController inputKeys](self, "inputKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PIAdjustmentController isEqual:forKeys:](self, "isEqual:forKeys:", v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3 forKeys:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!-[PIAdjustmentController isSettingEqual:forKey:](self, "isSettingEqual:forKey:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)isSettingEqual:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  char v18;

  v6 = a4;
  v7 = a3;
  -[PIAdjustmentController adjustment](self, "adjustment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v10 = objc_claimAutoreleasedReturnValue();

  -[PIAdjustmentController adjustment](self, "adjustment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "schema");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "defaultValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v9, "isEqual:", v15) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend((id)v9, "doubleValue"), v16 == 0.0))
  {

    v9 = 0;
  }
  if ((objc_msgSend((id)v10, "isEqual:", v15) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend((id)v10, "doubleValue"), v17 == 0.0))
  {

    v10 = 0;
  }
  if (v9 | v10)
    v18 = objc_msgSend((id)v9, "isEqual:", v10);
  else
    v18 = 1;

  return v18;
}

- (void)_setPrimitiveValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *changes;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_changes)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    changes = self->_changes;
    self->_changes = v7;

  }
  -[NUAdjustment objectForKeyedSubscript:](self->_adjustment, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_changes, "setObject:forKeyedSubscript:", v9, v6);

  -[NUAdjustment setValue:forKey:](self->_adjustment, "setValue:forKey:", v10, v6);
}

- (id)_primitiveValueForKey:(id)a3
{
  return (id)-[NUAdjustment valueForKey:](self->_adjustment, "valueForKey:", a3);
}

- (NSDictionary)settings
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PIAdjustmentController adjustment](self, "adjustment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSDictionary *)v6;
}

- (BOOL)_isDefault
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PIAdjustmentController inputKeys](self, "inputKeys");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PIAdjustmentController adjustment](self, "adjustment");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "schema");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "settings");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "defaultValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PIAdjustmentController _primitiveValueForKey:](self, "_primitiveValueForKey:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v14, "isEqual:", v13);

        v5 += v10;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v15 = objc_msgSend(obj, "count") == v5;

  return v15;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIAdjustmentController adjustment](self, "adjustment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; adjustment = %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pasteAdjustment:(id)a3 forMediaType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PIAdjustmentController pasteKeysForMediaType:](self, "pasteKeysForMediaType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "autoKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "BOOLValue"))
  {
    -[PIAdjustmentController autoKeysForPaste](self, "autoKeysForPaste");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v16, (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUAdjustment setObject:forKeyedSubscript:](self->_adjustment, "setObject:forKeyedSubscript:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (id)autoKeysForPaste
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NUIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NUAdjustment)adjustment
{
  return self->_adjustment;
}

- (NUComposition)containingComposition
{
  return self->_containingComposition;
}

- (void)setContainingComposition:(id)a3
{
  objc_storeStrong((id *)&self->_containingComposition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingComposition, 0);
  objc_storeStrong((id *)&self->_adjustment, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

+ (id)autoKey
{
  return CFSTR("auto");
}

+ (id)enabledKey
{
  return CFSTR("enabled");
}

@end
