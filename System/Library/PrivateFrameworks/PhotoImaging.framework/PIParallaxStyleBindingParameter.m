@implementation PIParallaxStyleBindingParameter

- (PIParallaxStyleBindingParameter)init
{
  return -[PIParallaxStyleBindingParameter initWithVariableName:](self, "initWithVariableName:", &stru_1E501A310);
}

- (PIParallaxStyleBindingParameter)initWithVariableName:(id)a3
{
  id v3;
  PIParallaxStyleBindingParameter *v4;
  uint64_t v5;
  NSString *variableName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PIParallaxStyleBindingParameter;
  v3 = a3;
  v4 = -[PIParallaxStyleBindingParameter init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  variableName = v4->_variableName;
  v4->_variableName = (NSString *)v5;

  return v4;
}

- (id)type
{
  return CFSTR("binding");
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("binding"));

  if (v6)
  {
    v7 = v4;
    -[PIParallaxStyleBindingParameter variableName](self, "variableName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "variableName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v8, "isEqualToString:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)evaluateWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    NUAssertLogger_11199();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11199();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        v31 = 2114;
        v32 = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(v6, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleBindingParameter variableName](self, "variableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "evaluateWithContext:error:", v7, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[PIParallaxStyleBindingParameter variableName](self, "variableName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Unable to find source for variable bound to '%@'"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", v14, v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PIParallaxStyleBindingParameter variableName](self, "variableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("($%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)variableName
{
  return self->_variableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableName, 0);
}

@end
