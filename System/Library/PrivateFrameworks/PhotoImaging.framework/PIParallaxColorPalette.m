@implementation PIParallaxColorPalette

- (BOOL)writeToURL:(id)a3 mode:(id)a4 space:(id)a5 error:(id *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void *v28;
  id v29;
  _QWORD v30[6];
  _QWORD v31[7];

  v31[6] = *MEMORY[0x1E0C80C00];
  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  -[PIParallaxColorPalette suggestionIndices](self, "suggestionIndices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  -[PIParallaxColorPalette suggestionIndices](self, "suggestionIndices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __54__PIParallaxColorPalette_writeToURL_mode_space_error___block_invoke;
  v28 = &unk_1E5015580;
  v29 = v16;
  v18 = v16;
  objc_msgSend(v17, "enumerateIndexesUsingBlock:", &v25);

  v30[0] = CFSTR("version");
  v30[1] = CFSTR("mode");
  v31[0] = &unk_1E5050FF8;
  v31[1] = v12;
  v31[2] = v11;
  v30[2] = CFSTR("space");
  v30[3] = CFSTR("primaryColors");
  -[PIParallaxColorPalette primaryColors](self, "primaryColors", v25, v26, v27, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxColorPalette _serializeColors:mode:](PIParallaxColorPalette, "_serializeColors:mode:", v19, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v20;
  v30[4] = CFSTR("secondaryColors");
  -[PIParallaxColorPalette secondaryColors](self, "secondaryColors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIParallaxColorPalette _serializeColors:mode:](PIParallaxColorPalette, "_serializeColors:mode:", v21, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = CFSTR("suggestionIndices");
  v31[4] = v22;
  v31[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a6) = objc_msgSend(v23, "writeToURL:error:", v13, a6);
  return (char)a6;
}

- (PIParallaxColorPalette)initWithColors:(id)a3
{
  return -[PIParallaxColorPalette initWithPrimaryColors:secondaryColors:](self, "initWithPrimaryColors:secondaryColors:", a3, MEMORY[0x1E0C9AA60]);
}

- (PIParallaxColorPalette)initWithPrimaryColors:(id)a3 secondaryColors:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  PIParallaxColorPalette *v10;

  v6 = (objc_class *)MEMORY[0x1E0CB36B8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  v10 = -[PIParallaxColorPalette initWithPrimaryColors:secondaryColors:suggestionIndices:](self, "initWithPrimaryColors:secondaryColors:suggestionIndices:", v8, v7, v9);

  return v10;
}

- (PIParallaxColorPalette)initWithPrimaryColors:(id)a3 secondaryColors:(id)a4 suggestionIndices:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  PIParallaxColorPalette *v14;
  uint64_t v15;
  NSArray *primaryColors;
  uint64_t v17;
  NSArray *secondaryColors;
  uint64_t v19;
  NSIndexSet *suggestionIndices;
  NSObject *v22;
  const void **v23;
  const void **v24;
  void *specific;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  const void **v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  const void **v35;
  void *v36;
  int v37;
  void *v38;
  NSObject *v39;
  const void **v40;
  void *v41;
  int v42;
  void *v43;
  NSObject *v44;
  const void **v45;
  void *v46;
  int v47;
  void *v48;
  const void **v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  objc_super v71;
  uint8_t buf[4];
  const void **v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NUAssertLogger_970();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "primaryColors != nil");
      v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v23;
      _os_log_error_impl(&dword_1A6382000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        v50 = dispatch_get_specific(*v24);
        v51 = (void *)MEMORY[0x1E0CB3978];
        v52 = v50;
        objc_msgSend(v51, "callStackSymbols");
        v24 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = (const void **)v50;
        v74 = 2114;
        v75 = v53;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v24;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v32 = _NUAssertFailHandler();
    goto LABEL_36;
  }
  if (!v9)
  {
    NUAssertLogger_970();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "secondaryColors != nil");
      v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v30;
      _os_log_error_impl(&dword_1A6382000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    v31 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v26 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v31)
    {
      if (v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = v24;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_38:

      v37 = _NUAssertFailHandler();
      goto LABEL_39;
    }
LABEL_36:
    if (v32)
    {
      v54 = dispatch_get_specific(*v24);
      v55 = (void *)MEMORY[0x1E0CB3978];
      v56 = v54;
      objc_msgSend(v55, "callStackSymbols");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = (const void **)v54;
      v74 = 2114;
      v75 = v57;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_38;
  }
  v11 = v10;
  if (!v10)
  {
    NUAssertLogger_970();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "suggestionIndices != nil");
      v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v35;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    v36 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v26 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v36)
    {
      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = v24;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_41:

      v42 = _NUAssertFailHandler();
      goto LABEL_42;
    }
LABEL_39:
    if (v37)
    {
      v58 = dispatch_get_specific(*v24);
      v59 = (void *)MEMORY[0x1E0CB3978];
      v60 = v58;
      objc_msgSend(v59, "callStackSymbols");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = (const void **)v58;
      v74 = 2114;
      v75 = v61;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_41;
  }
  v12 = objc_msgSend(v10, "lastIndex");
  if (v12 >= objc_msgSend(v8, "count"))
  {
    NUAssertLogger_970();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "suggestionIndices.lastIndex < primaryColors.count");
      v40 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v40;
      _os_log_error_impl(&dword_1A6382000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = (const void **)MEMORY[0x1E0D51D48];
    v41 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v26 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v41)
    {
      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = v24;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_44:

      v47 = _NUAssertFailHandler();
      goto LABEL_45;
    }
LABEL_42:
    if (v42)
    {
      v62 = dispatch_get_specific(*v24);
      v63 = (void *)MEMORY[0x1E0CB3978];
      v64 = v62;
      objc_msgSend(v63, "callStackSymbols");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = (const void **)v62;
      v74 = 2114;
      v75 = v65;
      _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_44;
  }
  if (objc_msgSend(v9, "count"))
  {
    v13 = objc_msgSend(v9, "count");
    if (v13 != objc_msgSend(v8, "count"))
    {
      NUAssertLogger_970();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Secondary color palette should be empty or equal in size to the primary palette"));
        v45 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = v45;
        _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v24 = (const void **)MEMORY[0x1E0D51D48];
      v46 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_970();
      v26 = objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      if (!v46)
      {
        if (v47)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "componentsJoinedByString:", CFSTR("\n"));
          v49 = (const void **)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = v49;
          _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

        }
        goto LABEL_47;
      }
LABEL_45:
      if (v47)
      {
        v66 = dispatch_get_specific(*v24);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = (const void **)v66;
        v74 = 2114;
        v75 = v70;
        _os_log_error_impl(&dword_1A6382000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
LABEL_47:

      _NUAssertFailHandler();
    }
  }
  v71.receiver = self;
  v71.super_class = (Class)PIParallaxColorPalette;
  v14 = -[PIParallaxColorPalette init](&v71, sel_init);
  v15 = objc_msgSend(v8, "copy");
  primaryColors = v14->_primaryColors;
  v14->_primaryColors = (NSArray *)v15;

  v17 = objc_msgSend(v9, "copy");
  secondaryColors = v14->_secondaryColors;
  v14->_secondaryColors = (NSArray *)v17;

  v19 = objc_msgSend(v11, "copy");
  suggestionIndices = v14->_suggestionIndices;
  v14->_suggestionIndices = (NSIndexSet *)v19;

  return v14;
}

- (id)suggestionForColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PIParallaxColorPalette suggestionIndices](self, "suggestionIndices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__PIParallaxColorPalette_suggestionForColor___block_invoke;
  v10[3] = &unk_1E50155A8;
  v11 = v5;
  v6 = v5;
  v7 = -[PIParallaxColorPalette _lookupColor:withPredicate:](self, "_lookupColor:withPredicate:", v4, v10);

  -[PIParallaxColorPalette suggestionAtIndex:](self, "suggestionAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_lookupColor:(id)a3 withPredicate:(id)a4
{
  id v6;
  unsigned int (**v7)(id, unint64_t);
  void *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  double v13;
  NSObject *v15;
  void *v16;
  const void **v17;
  void *specific;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  const void **v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  PIParallaxColorPalette *v41;
  SEL v42;
  id v43;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, unint64_t))a4;
  -[PIParallaxColorPalette primaryColors](self, "primaryColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = 1.79769313e308;
      do
      {
        if (v7[2](v7, v9))
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "distanceToColor:", v6);
          if (v11 > v13)
          {
            v11 = v13;
            v10 = v9;
          }

        }
        ++v9;
      }
      while (v9 < objc_msgSend(v8, "count"));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {

        return v10;
      }
    }
  }
  else
  {
    NUAssertLogger_970();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The palette can't be empty"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v16;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v44, 0xCu);

    }
    v17 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        v23 = dispatch_get_specific(*v17);
        v24 = (void *)MEMORY[0x1E0CB3978];
        v25 = v23;
        objc_msgSend(v24, "callStackSymbols");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138543618;
        v45 = v23;
        v46 = 2114;
        v47 = v27;
        _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v44, 0x16u);

      }
    }
    else if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543362;
      v45 = v22;
      _os_log_error_impl(&dword_1A6382000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v44, 0xCu);

    }
    _NUAssertFailHandler();
  }
  NUAssertLogger_970();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to find a nearest color"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138543362;
    v45 = v29;
    _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v44, 0xCu);

  }
  v30 = (const void **)MEMORY[0x1E0D51D48];
  v31 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
  NUAssertLogger_970();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  if (v31)
  {
    if (v33)
    {
      v36 = dispatch_get_specific(*v30);
      v37 = (void *)MEMORY[0x1E0CB3978];
      v38 = v36;
      objc_msgSend(v37, "callStackSymbols");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543618;
      v45 = v36;
      v46 = 2114;
      v47 = v40;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v44, 0x16u);

    }
  }
  else if (v33)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 138543362;
    v45 = v35;
    _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v44, 0xCu);

  }
  v41 = (PIParallaxColorPalette *)_NUAssertFailHandler();
  return (unint64_t)-[PIParallaxColorPalette paletteColorForColor:](v41, v42, v43);
}

- (id)paletteColorForColor:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = -[PIParallaxColorPalette indexOfColor:](self, "indexOfColor:", a3);
  -[PIParallaxColorPalette primaryColors](self, "primaryColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)indexOfColor:(id)a3
{
  return -[PIParallaxColorPalette _lookupColor:withPredicate:](self, "_lookupColor:withPredicate:", a3, &__block_literal_global_969);
}

- (id)suggestionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PIParallaxColorPalette primaryColors](self, "primaryColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PIParallaxColorPalette secondaryColors](self, "secondaryColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= a3)
  {
    v9 = 0;
  }
  else
  {
    -[PIParallaxColorPalette secondaryColors](self, "secondaryColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751C8]), "initWithPrimaryColor:secondaryColor:", v6, v9);

  return v10;
}

- (NSArray)primaryColors
{
  return self->_primaryColors;
}

- (NSArray)secondaryColors
{
  return self->_secondaryColors;
}

- (NSIndexSet)suggestionIndices
{
  return self->_suggestionIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionIndices, 0);
  objc_storeStrong((id *)&self->_secondaryColors, 0);
  objc_storeStrong((id *)&self->_primaryColors, 0);
}

uint64_t __39__PIParallaxColorPalette_indexOfColor___block_invoke()
{
  return 1;
}

uint64_t __45__PIParallaxColorPalette_suggestionForColor___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
}

void __54__PIParallaxColorPalette_writeToURL_mode_space_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)loadPaletteFromURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  const void **v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  const void **v19;
  void *v20;
  int v21;
  void *v22;
  const void **v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  const void **v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_970();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "url != nil");
      v12 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v24 = dispatch_get_specific(*v13);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v13 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = (const void **)v24;
        v35 = 2114;
        v36 = v27;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v13;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v21 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if (!a4)
  {
    NUAssertLogger_970();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    v20 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v20)
    {
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v34 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v21)
    {
      v28 = dispatch_get_specific(*v13);
      v29 = (void *)MEMORY[0x1E0CB3978];
      v30 = v28;
      objc_msgSend(v29, "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = (const void **)v28;
      v35 = 2114;
      v36 = v32;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "_paletteWithConfigurationDictionary:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to parse color palette plist data"), v7, *a4);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_paletteWithConfigurationDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PIParallaxColorPalette *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v34;
  const void **v35;
  const void **v36;
  void *specific;
  NSObject *v38;
  _BOOL4 v39;
  void *v40;
  NSObject *v41;
  const void **v42;
  void *v43;
  int v44;
  void *v45;
  const void **v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  id v61;
  uint64_t v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _QWORD v70[2];
  _QWORD v71[4];
  uint8_t buf[4];
  const void **v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_970();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v35 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v35;
      _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v36 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        v47 = dispatch_get_specific(*v36);
        v48 = (void *)MEMORY[0x1E0CB3978];
        v49 = v47;
        objc_msgSend(v48, "callStackSymbols");
        v36 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v73 = (const void **)v47;
        v74 = 2114;
        v75 = v50;
        _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v36;
      _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v44 = _NUAssertFailHandler();
    goto LABEL_68;
  }
  if (!a4)
  {
    NUAssertLogger_970();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v73 = v42;
      _os_log_error_impl(&dword_1A6382000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v36 = (const void **)MEMORY[0x1E0D51D48];
    v43 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v38 = objc_claimAutoreleasedReturnValue();
    v44 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (!v43)
    {
      if (v44)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
        v46 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v73 = v46;
        _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_70;
    }
LABEL_68:
    if (v44)
    {
      v51 = dispatch_get_specific(*v36);
      v52 = (void *)MEMORY[0x1E0CB3978];
      v53 = v51;
      objc_msgSend(v52, "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v73 = (const void **)v51;
      v74 = 2114;
      v75 = v55;
      _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_70:

    _NUAssertFailHandler();
  }
  v7 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid version number"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v9 = objc_msgSend(v8, "integerValue");
  if (v9 < 4)
  {
LABEL_8:
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("RGB");
    if (v11)
    {
      v71[0] = CFSTR("RGB");
      v71[1] = CFSTR("LumaHueChroma");
      v71[2] = CFSTR("HueTone");
      v71[3] = CFSTR("Hex");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString containsObject:](v13, "containsObject:", v11))
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid mode value"), v11);
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

        goto LABEL_54;
      }
      v12 = v11;

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("space"));
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("sRGB");
    v64 = (void *)v14;
    if (v14)
    {
      v15 = (void *)v14;
      v70[0] = CFSTR("sRGB");
      v70[1] = CFSTR("P3");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v16, "containsObject:", v15))
      {
        v21 = (void *)MEMORY[0x1E0D520A0];
        v22 = CFSTR("Invalid space value");
        v23 = v15;
        goto LABEL_26;
      }
      v13 = v15;

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("primaryColors"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("secondaryColors"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid secondary color values"), v18);
          v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

          goto LABEL_52;
        }
      }
      objc_msgSend(a1, "_loadColorsFromValues:mode:space:error:", v16, v12, v13, a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v17 = 0;
        goto LABEL_50;
      }
      v61 = v19;
      if (v18)
      {
        objc_msgSend(a1, "_loadColorsFromValues:mode:space:error:", v18, v12, v13, a4);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v17 = 0;
          v19 = v61;
LABEL_50:

          goto LABEL_51;
        }
      }
      else
      {
        v20 = MEMORY[0x1E0C9AA60];
      }
      v58 = (void *)v20;
      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v61, "count"));
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionIndices"));
      v24 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)v24;
      if (v24)
      {
        v25 = (void *)v24;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v56 = v18;
          v63 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          obj = v25;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
          if (v26)
          {
            v27 = v26;
            v62 = *(_QWORD *)v66;
            while (2)
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v66 != v62)
                  objc_enumerationMutation(obj);
                v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid suggestion index"), v29);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();

                  v17 = 0;
                  v18 = v56;
                  goto LABEL_45;
                }
                objc_msgSend(v63, "addIndex:", objc_msgSend(v29, "unsignedIntegerValue"));
              }
              v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
              if (v27)
                continue;
              break;
            }
          }

          v30 = v63;
          v31 = v63;
          v18 = v56;
          goto LABEL_48;
        }
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid suggestion indices"), v25);
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v32 = v58;
      }
      else
      {
        if (v9 < 2)
        {
          v31 = v57;
          v30 = v57;
LABEL_48:
          v32 = v58;
          v17 = -[PIParallaxColorPalette initWithPrimaryColors:secondaryColors:suggestionIndices:]([PIParallaxColorPalette alloc], "initWithPrimaryColors:secondaryColors:suggestionIndices:", v61, v58, v30);
          goto LABEL_49;
        }
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing suggestion indices"), v7);
        v17 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
        v32 = v58;
      }
      v31 = v57;
LABEL_49:

      v19 = v61;
      goto LABEL_50;
    }
    v21 = (void *)MEMORY[0x1E0D520A0];
    v22 = CFSTR("Invalid primary color values");
    v23 = v16;
LABEL_26:
    objc_msgSend(v21, "invalidError:object:", v22, v23);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:

    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unsupported palette version"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v17 = 0;
  *a4 = v10;
LABEL_54:

  return v17;
}

+ (id)_serializeColors:(id)a3 mode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  float v35;
  float v36;
  uint64_t v37;
  float v38;
  float v39;
  float v40;
  uint64_t v41;
  float v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v47;
  void *v48;
  const void **v49;
  void *specific;
  NSObject *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[2];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v62;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v62 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v11);
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("HueTone")))
        {
          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "hue");
          objc_msgSend(v13, "numberWithDouble:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = v14;
          v15 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "tone");
          objc_msgSend(v15, "numberWithDouble:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v71[1] = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

          goto LABEL_11;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("LumaHueChroma")))
        {
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "luma");
          objc_msgSend(v18, "numberWithDouble:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v14;
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "hue");
          objc_msgSend(v19, "numberWithDouble:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v70[1] = v16;
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "chroma");
          objc_msgSend(v20, "numberWithDouble:");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v70[2] = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_10;
        }
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("RGB")))
        {
          v22 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "red");
          objc_msgSend(v22, "numberWithDouble:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = v23;
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "green");
          objc_msgSend(v24, "numberWithDouble:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v69[1] = v25;
          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v12, "blue");
          objc_msgSend(v26, "numberWithDouble:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v69[2] = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (!objc_msgSend(v6, "isEqualToString:", CFSTR("Hex")))
          {
            NUAssertLogger_970();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown color mode: %@"), v6);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v66 = v48;
              _os_log_error_impl(&dword_1A6382000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

            }
            v49 = (const void **)MEMORY[0x1E0D51D48];
            specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
            NUAssertLogger_970();
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
            if (specific)
            {
              if (v52)
              {
                v55 = dispatch_get_specific(*v49);
                v56 = (void *)MEMORY[0x1E0CB3978];
                v57 = v55;
                objc_msgSend(v56, "callStackSymbols");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "componentsJoinedByString:", CFSTR("\n"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v66 = v55;
                v67 = 2114;
                v68 = v59;
                _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

              }
            }
            else if (v52)
            {
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "componentsJoinedByString:", CFSTR("\n"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v66 = v54;
              _os_log_error_impl(&dword_1A6382000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

            }
            _NUAssertFailHandler();
          }
          objc_msgSend(v12, "red");
          v29 = v28;
          objc_msgSend(v12, "green");
          v31 = v30;
          objc_msgSend(v12, "blue");
          v33 = v29;
          v34 = 255.0;
          v35 = (float)(v33 * 255.0) + 0.5;
          if (v35 < 255.0)
            v36 = v35;
          else
            v36 = 255.0;
          LODWORD(v37) = (int)v36;
          v38 = v31;
          v39 = (float)(v38 * 255.0) + 0.5;
          if (v39 < 255.0)
            v40 = v39;
          else
            v40 = 255.0;
          LODWORD(v41) = (int)v40;
          v42 = v32;
          v43 = (float)(v42 * 255.0) + 0.5;
          if (v43 < 255.0)
            v34 = v43;
          LODWORD(v44) = (int)v34;
          if (v35 >= 0.0)
            v37 = v37;
          else
            v37 = 0;
          if (v39 >= 0.0)
            v41 = v41;
          else
            v41 = 0;
          if (v43 >= 0.0)
            v44 = v44;
          else
            v44 = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X%02X"), v37, v41, v44);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
LABEL_11:
        objc_msgSend(v7, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      v9 = v45;
    }
    while (v45);
  }

  return v7;
}

+ (id)_loadColorsFromValues:(id)a3 mode:(id)a4 space:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  const char *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  CGColorSpace *v49;
  CGColor *v50;
  id v51;
  NSObject *v53;
  void *v54;
  const void **v55;
  void *specific;
  NSObject *v57;
  _BOOL4 v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  const __CFString *name;
  id *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  int v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  _BYTE components[24];
  uint64_t v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    NUAssertLogger_970();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "colorValues != nil");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)components = 138543362;
      *(_QWORD *)&components[4] = v54;
      _os_log_error_impl(&dword_1A6382000, v53, OS_LOG_TYPE_ERROR, "Fail: %{public}@", components, 0xCu);

    }
    v55 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v58)
      {
        v66 = dispatch_get_specific(*v55);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v55 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "componentsJoinedByString:", CFSTR("\n"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)components = 138543618;
        *(_QWORD *)&components[4] = v66;
        *(_WORD *)&components[12] = 2114;
        *(_QWORD *)&components[14] = v69;
        _os_log_error_impl(&dword_1A6382000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", components, 0x16u);

      }
    }
    else if (v58)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)components = 138543362;
      *(_QWORD *)&components[4] = v55;
      _os_log_error_impl(&dword_1A6382000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", components, 0xCu);

    }
    v63 = _NUAssertFailHandler();
    goto LABEL_57;
  }
  if (!a6)
  {
    NUAssertLogger_970();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)components = 138543362;
      *(_QWORD *)&components[4] = v61;
      _os_log_error_impl(&dword_1A6382000, v60, OS_LOG_TYPE_ERROR, "Fail: %{public}@", components, 0xCu);

    }
    v55 = (const void **)MEMORY[0x1E0D51D48];
    v62 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_970();
    v57 = objc_claimAutoreleasedReturnValue();
    v63 = os_log_type_enabled(v57, OS_LOG_TYPE_ERROR);
    if (!v62)
    {
      if (v63)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)components = 138543362;
        *(_QWORD *)&components[4] = v65;
        _os_log_error_impl(&dword_1A6382000, v57, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", components, 0xCu);

      }
      goto LABEL_59;
    }
LABEL_57:
    if (v63)
    {
      v70 = dispatch_get_specific(*v55);
      v71 = (void *)MEMORY[0x1E0CB3978];
      v72 = v70;
      objc_msgSend(v71, "callStackSymbols");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "componentsJoinedByString:", CFSTR("\n"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)components = 138543618;
      *(_QWORD *)&components[4] = v70;
      *(_WORD *)&components[12] = 2114;
      *(_QWORD *)&components[14] = v74;
      _os_log_error_impl(&dword_1A6382000, v57, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", components, 0x16u);

    }
LABEL_59:

    _NUAssertFailHandler();
  }
  v12 = v11;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HueTone")) & 1) != 0)
  {
    v82 = 1;
    v13 = 2;
  }
  else
  {
    v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("Hex"));
    v82 = v14 ^ 1;
    v13 = 3;
    if (v14)
      v13 = 1;
  }
  v78 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v16 = v9;
  v79 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v88;
    name = (const __CFString *)*MEMORY[0x1E0C9D908];
    v76 = a6;
    v77 = v12;
    v81 = v15;
LABEL_9:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v88 != v80)
        objc_enumerationMutation(v16);
      v18 = *(id *)(*((_QWORD *)&v87 + 1) + 8 * v17);
      if (v82)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v18, "count") != v78)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid color values"), v18);
          *v76 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v84;
LABEL_17:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v84 != v22)
              objc_enumerationMutation(v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              break;
            if (v21 == ++v23)
            {
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
              if (v21)
                goto LABEL_17;
              goto LABEL_23;
            }
          }
LABEL_40:
          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid color values"), v19);
          *v76 = (id)objc_claimAutoreleasedReturnValue();

          v18 = v19;
LABEL_41:
          v12 = v77;
          v15 = v81;

          v51 = 0;
          goto LABEL_42;
        }
LABEL_23:

      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("HueTone")))
      {
        v24 = objc_alloc(MEMORY[0x1E0D75170]);
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v30 = (void *)objc_msgSend(v24, "initWithHue:tone:", v27, v29);

      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("LumaHueChroma")))
      {
        v31 = objc_alloc(MEMORY[0x1E0D75170]);
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v33;
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v36;
        objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v30 = (void *)objc_msgSend(v31, "initWithLuma:hue:chroma:", v34, v37, v39);

      }
      else
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("Hex")))
        {
          v19 = v18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_40;
          *(_DWORD *)components = 0;
          v91 = 0;
          v19 = objc_retainAutorelease(v19);
          v40 = (const char *)objc_msgSend(v19, "cStringUsingEncoding:", 1);
          if (!v40 || sscanf(v40, "%02x%02x%02x", components, (char *)&v91 + 4, &v91) != 3)
            goto LABEL_40;
          v41 = (double)*(int *)components / 255.0;
          v42 = (double)SHIDWORD(v91) / 255.0;
          v43 = (double)(int)v91 / 255.0;
        }
        else
        {
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "doubleValue");
          v41 = v45;

          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "doubleValue");
          v42 = v47;

          objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v43 = v48;
        }

        if (objc_msgSend(v77, "isEqualToString:", CFSTR("P3")))
        {
          v49 = CGColorSpaceCreateWithName(name);
          *(double *)components = v41;
          *(double *)&components[8] = v42;
          *(double *)&components[16] = v43;
          v93 = 0x3FF0000000000000;
          v50 = CGColorCreate(v49, (const CGFloat *)components);
          objc_msgSend(MEMORY[0x1E0D75170], "colorWithCGColor:", v50);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          CGColorSpaceRelease(v49);
          CGColorRelease(v50);
        }
        else
        {
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithRed:green:blue:", v41, v42, v43);
        }
      }
      objc_msgSend(v81, "addObject:", v30);

      if (++v17 == v79)
      {
        v12 = v77;
        v15 = v81;
        v79 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
        if (v79)
          goto LABEL_9;
        break;
      }
    }
  }

  v51 = v15;
LABEL_42:

  return v51;
}

+ (id)colorBGPalette
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PIParallaxColorPalette_colorBGPalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorBGPalette_onceToken != -1)
    dispatch_once(&colorBGPalette_onceToken, block);
  return (id)colorBGPalette_palette;
}

+ (id)colorWashSinglePalette
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PIParallaxColorPalette_colorWashSinglePalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorWashSinglePalette_onceToken != -1)
    dispatch_once(&colorWashSinglePalette_onceToken, block);
  return (id)colorWashSinglePalette_palette;
}

+ (id)colorWashDuotonePalette
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PIParallaxColorPalette_colorWashDuotonePalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorWashDuotonePalette_onceToken != -1)
    dispatch_once(&colorWashDuotonePalette_onceToken, block);
  return (id)colorWashDuotonePalette_palette;
}

+ (id)greenScreenMutedPalette
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PIParallaxColorPalette_greenScreenMutedPalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (greenScreenMutedPalette_onceToken != -1)
    dispatch_once(&greenScreenMutedPalette_onceToken, block);
  return (id)greenScreenMutedPalette_palette;
}

+ (id)greenScreenVibrantPalette
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PIParallaxColorPalette_greenScreenVibrantPalette__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (greenScreenVibrantPalette_onceToken != -1)
    dispatch_once(&greenScreenVibrantPalette_onceToken, block);
  return (id)greenScreenVibrantPalette_palette;
}

+ (id)loadPaletteWithName:(id)a3
{
  const void **v3;
  void *v4;
  int v5;
  _UNKNOWN **v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const void **v11;
  void *v12;
  _UNKNOWN **v13;
  NSObject *v14;
  void *v15;
  NSObject *v17;
  const void **v18;
  void *specific;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const void **v28;
  __int16 v29;
  _UNKNOWN **v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (const void **)a3;
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useStyleRecipeConfigDirectory");

  v6 = &off_1E5012000;
  if (!v5)
    goto LABEL_8;
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styleRecipeConfigDirectoryPath");
  v8 = objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("plist"));
  v11 = (const void **)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  +[PIParallaxColorPalette loadPaletteFromURL:error:](PIParallaxColorPalette, "loadPaletteFromURL:error:", v11, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_UNKNOWN **)v26;
  if (!v12)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      goto LABEL_18;
    while (1)
    {
      v14 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v3;
        v29 = 2112;
        v30 = v13;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Failed to load user palette '%@', error: %@", buf, 0x16u);
      }

LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject URLForResource:withExtension:](v8, "URLForResource:withExtension:", v3, CFSTR("plist"));
      v11 = (const void **)objc_claimAutoreleasedReturnValue();
      v15 = v6[498];
      v25 = 0;
      objc_msgSend(v15, "loadPaletteFromURL:error:", v11, &v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (_UNKNOWN **)v25;
      if (v12)
        break;
      NUAssertLogger_970();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load color palette '%@', error: %@"), v3, v13);
        v18 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v18;
        _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v11 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_970();
      v8 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v20)
        {
          v22 = dispatch_get_specific(*v11);
          v23 = (void *)MEMORY[0x1E0CB3978];
          v24 = v22;
          objc_msgSend(v23, "callStackSymbols");
          v11 = (const void **)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
          v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = (const void **)v22;
          v29 = 2114;
          v30 = v6;
          _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v11 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v11;
        _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler();
LABEL_18:
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_152);
    }
  }

  return v12;
}

+ (id)customPalette
{
  id v3;
  uint64_t i;
  id v5;
  uint64_t j;
  void *v7;
  id v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 10; ++i)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (j = 0; j != 12; ++j)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75170]), "initWithHue:tone:", (double)j * 30.0, (double)i / 10.0);
      objc_msgSend(v5, "addObject:", v7);

    }
    NSLog(CFSTR("Tonal colors: %@"), v5);
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_msgSend(v8, "initWithPrimaryColors:secondaryColors:", v3, MEMORY[0x1E0C9AA60]);

  return v9;
}

void __51__PIParallaxColorPalette_greenScreenVibrantPalette__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadPaletteWithName:", CFSTR("GreenScreenVibrantPalette"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)greenScreenVibrantPalette_palette;
  greenScreenVibrantPalette_palette = v1;

}

void __49__PIParallaxColorPalette_greenScreenMutedPalette__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadPaletteWithName:", CFSTR("GreenScreenMutedPalette"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)greenScreenMutedPalette_palette;
  greenScreenMutedPalette_palette = v1;

}

void __49__PIParallaxColorPalette_colorWashDuotonePalette__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadPaletteWithName:", CFSTR("ColorWashDuotonePalette"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)colorWashDuotonePalette_palette;
  colorWashDuotonePalette_palette = v1;

}

void __48__PIParallaxColorPalette_colorWashSinglePalette__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadPaletteWithName:", CFSTR("ColorWashSinglePalette"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)colorWashSinglePalette_palette;
  colorWashSinglePalette_palette = v1;

}

void __40__PIParallaxColorPalette_colorBGPalette__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "loadPaletteWithName:", CFSTR("ColorBGPalette"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)colorBGPalette_palette;
  colorBGPalette_palette = v1;

}

@end
