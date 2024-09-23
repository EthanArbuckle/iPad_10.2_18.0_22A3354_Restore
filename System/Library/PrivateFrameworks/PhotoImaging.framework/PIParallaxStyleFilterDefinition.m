@implementation PIParallaxStyleFilterDefinition

- (PIParallaxStyleFilterDefinition)init
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
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
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D52380];
    v5 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
LABEL_7:
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
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
    v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
  }
}

- (PIParallaxStyleFilterDefinition)initWithFilterName:(id)a3 parameters:(id)a4
{
  id v5;
  id v6;
  PIParallaxStyleFilterDefinition *v7;
  uint64_t v8;
  NSString *filterName;
  uint64_t v10;
  NSDictionary *parameters;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PIParallaxStyleFilterDefinition;
  v5 = a4;
  v6 = a3;
  v7 = -[PIParallaxStyleFilterDefinition init](&v13, sel_init);
  v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  filterName = v7->_filterName;
  v7->_filterName = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  parameters = v7->_parameters;
  v7->_parameters = (NSDictionary *)v10;

  return v7;
}

- (id)type
{
  return CFSTR("filter");
}

- (BOOL)isEqualToParallaxStyleDefinition:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("filter"));

  if (v6)
    v7 = -[PIParallaxStyleFilterDefinition isEqualToParallaxStyleFilterDefinition:](self, "isEqualToParallaxStyleFilterDefinition:", v4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToParallaxStyleFilterDefinition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PIParallaxStyleFilterDefinition filterName](self, "filterName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[PIParallaxStyleFilterDefinition parameters](self, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

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
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  const void **v66;
  void *specific;
  NSObject *v68;
  _BOOL4 v69;
  NSObject *v70;
  void *v71;
  const void **v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  _BYTE *v90;
  _BYTE buf[24];
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  CGRect v96;

  v95 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_11199();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "context != nil");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v65;
      _os_log_error_impl(&dword_1A6382000, v64, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v66 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11199();
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v69)
      {
        v77 = dispatch_get_specific(*v66);
        v78 = (void *)MEMORY[0x1E0CB3978];
        v79 = v77;
        objc_msgSend(v78, "callStackSymbols");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "componentsJoinedByString:", CFSTR("\n"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v77;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v81;
        _os_log_error_impl(&dword_1A6382000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v69)
    {
LABEL_46:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "componentsJoinedByString:", CFSTR("\n"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v76;
      _os_log_error_impl(&dword_1A6382000, v68, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_52:

    _NUAssertFailHandler();
    __break(1u);
  }
  if (!a4)
  {
    NUAssertLogger_11199();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v71;
      _os_log_error_impl(&dword_1A6382000, v70, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v72 = (const void **)MEMORY[0x1E0D51D48];
    v73 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_11199();
    v68 = objc_claimAutoreleasedReturnValue();
    v74 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);
    if (!v73)
    {
      if (!v74)
        goto LABEL_52;
      goto LABEL_46;
    }
    if (v74)
    {
      v82 = dispatch_get_specific(*v72);
      v83 = (void *)MEMORY[0x1E0CB3978];
      v84 = v82;
      objc_msgSend(v83, "callStackSymbols");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "componentsJoinedByString:", CFSTR("\n"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v82;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v86;
      _os_log_error_impl(&dword_1A6382000, v68, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_52;
  }
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0C9DDB8];
  -[PIParallaxStyleFilterDefinition filterName](self, "filterName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterWithName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v92 = __Block_byref_object_copy__11212;
    v93 = __Block_byref_object_dispose__11213;
    v94 = 0;
    -[PIParallaxStyleFilterDefinition parameters](self, "parameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __61__PIParallaxStyleFilterDefinition_evaluateWithContext_error___block_invoke;
    v87[3] = &unk_1E5017D10;
    v12 = v10;
    v88 = v12;
    v13 = v7;
    v89 = v13;
    v90 = buf;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v87);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v14 = (void *)MEMORY[0x1E0D520A0];
      -[PIParallaxStyleFilterDefinition parameters](self, "parameters");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to evaluate filter parameters"), v15, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "containsString:", CFSTR("Local"));

      objc_msgSend(v12, "inputKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *MEMORY[0x1E0C9E1F8];
      v24 = objc_msgSend(v22, "containsObject:", *MEMORY[0x1E0C9E1F8]);

      if (v24)
      {
        objc_msgSend(v13, "outputImage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v13, "inputImage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "extent");
          objc_msgSend(v25, "imageByCroppingToRect:");
          v27 = objc_claimAutoreleasedReturnValue();

          v25 = (void *)v27;
        }
        objc_msgSend(v12, "setValue:forKey:", v25, v23);

      }
      objc_msgSend(v12, "inputKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *MEMORY[0x1E0C9E190];
      v30 = objc_msgSend(v28, "containsObject:", *MEMORY[0x1E0C9E190]);

      if (v30)
      {
        objc_msgSend(v13, "inputImage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v31, v29);

      }
      objc_msgSend(v12, "inputKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x1E0C9E270];
      v34 = objc_msgSend(v32, "containsObject:", *MEMORY[0x1E0C9E270]);

      if (v34)
      {
        objc_msgSend(v13, "guideImage");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v35, v33);

      }
      objc_msgSend(v12, "inputKeys");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *MEMORY[0x1E0C9E1F0];
      v38 = objc_msgSend(v36, "containsObject:", *MEMORY[0x1E0C9E1F0]);

      if (v38)
      {
        v39 = (void *)MEMORY[0x1E0C9DDF8];
        objc_msgSend(v13, "inputImage");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "extent");
        objc_msgSend(v39, "vectorWithCGRect:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v41, v37);

      }
      objc_msgSend(v12, "inputKeys");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *MEMORY[0x1E0C9E218];
      v44 = objc_msgSend(v42, "containsObject:", *MEMORY[0x1E0C9E218]);

      if (v44)
      {
        objc_msgSend(v13, "matteImage");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v45, v43);

      }
      objc_msgSend(v12, "inputKeys");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *MEMORY[0x1E0C9E210];
      v48 = objc_msgSend(v46, "containsObject:", *MEMORY[0x1E0C9E210]);

      if (v48)
      {
        objc_msgSend(v13, "matteImage");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v49, v47);

      }
      objc_msgSend(v12, "inputKeys");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "containsObject:", CFSTR("inputLightMapImage"));

      if (v51)
      {
        objc_msgSend(v13, "lightMapImage");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v52, CFSTR("inputLightMapImage"));

      }
      objc_msgSend(v12, "inputKeys");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "containsObject:", CFSTR("inputTargetBackgroundImage"));

      if (v54)
      {
        objc_msgSend(v13, "backgroundImage");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v55, CFSTR("inputTargetBackgroundImage"));

      }
      objc_msgSend(v12, "outputImage");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v56;
      if (v56)
      {
        objc_msgSend(v56, "extent");
        if (!CGRectIsEmpty(v96))
        {
          if (v21)
          {
            objc_msgSend(v13, "cache");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (v58)
            {
              objc_msgSend(v12, "name");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "isEqualToString:", CFSTR("CILocalContrast"));

              if (v60)
              {
                objc_msgSend(v13, "cache");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "cachedImage:forKey:", v15, CFSTR("LocalContrast"));
                v62 = objc_claimAutoreleasedReturnValue();

                v15 = (id)v62;
              }
            }
            objc_msgSend(v15, "imageByClampingToExtent");
            v63 = objc_claimAutoreleasedReturnValue();

            v15 = (id)v63;
          }
          v15 = v15;
          v19 = v15;
          goto LABEL_29;
        }
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("filter produced invalid image"), v12);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = 0;
    *a4 = v16;
LABEL_29:

    _Block_object_dispose(buf, 8);
    goto LABEL_30;
  }
  v17 = (void *)MEMORY[0x1E0D520A0];
  -[PIParallaxStyleFilterDefinition filterName](self, "filterName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "invalidError:object:", CFSTR("Unknown filter"), v18);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v19 = 0;
LABEL_30:

  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIParallaxStyleFilterDefinition filterName](self, "filterName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIParallaxStyleFilterDefinition parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p filter:%@ parameters: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)filterName
{
  return self->_filterName;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
}

void __61__PIParallaxStyleFilterDefinition_evaluateWithContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  id *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "inputKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    obj = 0;
    objc_msgSend(v8, "evaluateWithContext:error:", v11, &obj);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v12, obj);
    if (v13)
      objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v13, v7);
    else
      *a4 = 1;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unknown filter parameter"), v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }

}

@end
