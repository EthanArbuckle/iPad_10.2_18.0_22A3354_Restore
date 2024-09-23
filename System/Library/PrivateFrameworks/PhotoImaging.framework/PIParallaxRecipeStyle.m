@implementation PIParallaxRecipeStyle

- (PIParallaxRecipeStyle)initWithIdentifier:(id)a3 recipe:(id)a4
{
  id v6;
  PIParallaxStyleRecipe *v7;
  PIParallaxStyleRecipe *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  PIParallaxRecipeStyle *v24;
  uint64_t v25;
  NSString *identifier;
  PIParallaxStyleRecipe *recipe;
  NSObject *v29;
  const void **v30;
  const void **v31;
  void *specific;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  NSObject *v36;
  const void **v37;
  void *v38;
  int v39;
  void *v40;
  const void **v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  objc_super v51;
  uint8_t buf[4];
  const void **v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (PIParallaxStyleRecipe *)a4;
  if (!v6)
  {
    NUAssertLogger_3149();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "identifier != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v34)
      {
        v42 = dispatch_get_specific(*v31);
        v43 = (void *)MEMORY[0x1E0CB3978];
        v44 = v42;
        objc_msgSend(v43, "callStackSymbols");
        v31 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = (const void **)v42;
        v54 = 2114;
        v55 = v45;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v31;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v39 = _NUAssertFailHandler();
    goto LABEL_19;
  }
  v8 = v7;
  if (!v7)
  {
    NUAssertLogger_3149();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v37 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v37;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v31 = (const void **)MEMORY[0x1E0D51D48];
    v38 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_3149();
    v33 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
        v41 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v41;
        _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_21;
    }
LABEL_19:
    if (v39)
    {
      v46 = dispatch_get_specific(*v31);
      v47 = (void *)MEMORY[0x1E0CB3978];
      v48 = v46;
      objc_msgSend(v47, "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = (const void **)v46;
      v54 = 2114;
      v55 = v50;
      _os_log_error_impl(&dword_1A6382000, v33, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_21:

    _NUAssertFailHandler();
  }
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleRecipe parameters](v8, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D75620]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("color"));

  if (v13)
  {
    objc_msgSend(v11, "redValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "greenValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "blueValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D75170]);
    objc_msgSend(v14, "doubleValue");
    v19 = v18;
    objc_msgSend(v15, "doubleValue");
    v21 = v20;
    objc_msgSend(v16, "doubleValue");
    v23 = objc_msgSend(v17, "initWithRed:green:blue:", v19, v21, v22);

    v9 = (void *)v23;
  }
  v51.receiver = self;
  v51.super_class = (Class)PIParallaxRecipeStyle;
  v24 = -[PIParallaxStyle initWithClockColor:colorSuggestions:](&v51, sel_initWithClockColor_colorSuggestions_, v9, MEMORY[0x1E0C9AA60]);
  v25 = objc_msgSend(v6, "copy");
  identifier = v24->_identifier;
  v24->_identifier = (NSString *)v25;

  recipe = v24->_recipe;
  v24->_recipe = v8;

  return v24;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier = %@, recipe = %@>"),
               objc_opt_class(),
               self,
               self->_identifier,
               self->_recipe);
}

- (BOOL)isEqual:(id)a3
{
  PIParallaxRecipeStyle *v4;
  PIParallaxRecipeStyle *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PIParallaxRecipeStyle *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PIParallaxRecipeStyle recipe](self, "recipe");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PIParallaxRecipeStyle recipe](v5, "recipe");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)parameters
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)kind
{
  return (id)*MEMORY[0x1E0D75610];
}

- (id)clockFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[PIParallaxRecipeStyle recipe](self, "recipe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D75628]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("mode"));

  if ((_DWORD)v3)
  {
    objc_msgSend(v4, "modeValue");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("SF Soft Time");
  }

  return v6;
}

- (id)recipeIdentifier
{
  return self->_identifier;
}

- (id)recipe
{
  return self->_recipe;
}

- (id)filter
{
  return -[PIParallaxRecipeFilter initWithRecipe:]([PIParallaxRecipeFilter alloc], "initWithRecipe:", self->_recipe);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
