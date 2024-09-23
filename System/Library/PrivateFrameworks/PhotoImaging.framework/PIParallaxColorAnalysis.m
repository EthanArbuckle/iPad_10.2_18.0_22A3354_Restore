@implementation PIParallaxColorAnalysis

- (PIParallaxColorAnalysis)init
{
  PIParallaxColorAnalysis *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PIParallaxColorAnalysis;
  result = -[PIParallaxColorAnalysis init](&v3, sel_init);
  result->_version = 3;
  return result;
}

- (id)contentsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PIParallaxColorAnalysis version](self, "version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("version"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PIParallaxColorAnalysis luminance](self, "luminance");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("luminance"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PIParallaxColorAnalysis foregroundLuminance](self, "foregroundLuminance");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("foregroundLuminance"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PIParallaxColorAnalysis backgroundLuminance](self, "backgroundLuminance");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("backgroundLuminance"));

  -[PIParallaxColorAnalysis colors](self, "colors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("colors"));

  -[PIParallaxColorAnalysis foregroundColors](self, "foregroundColors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("foregroundColors"));

  -[PIParallaxColorAnalysis backgroundColors](self, "backgroundColors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("backgroundColors"));

  -[PIParallaxColorAnalysis clockAreaColors](self, "clockAreaColors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PFMap();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("clockAreaColors"));

  return v3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (double)luminance
{
  return self->_luminance;
}

- (void)setLuminance:(double)a3
{
  self->_luminance = a3;
}

- (double)foregroundLuminance
{
  return self->_foregroundLuminance;
}

- (void)setForegroundLuminance:(double)a3
{
  self->_foregroundLuminance = a3;
}

- (double)backgroundLuminance
{
  return self->_backgroundLuminance;
}

- (void)setBackgroundLuminance:(double)a3
{
  self->_backgroundLuminance = a3;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)foregroundColors
{
  return self->_foregroundColors;
}

- (void)setForegroundColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)backgroundColors
{
  return self->_backgroundColors;
}

- (void)setBackgroundColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)clockAreaColors
{
  return self->_clockAreaColors;
}

- (void)setClockAreaColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockAreaColors, 0);
  objc_storeStrong((id *)&self->_backgroundColors, 0);
  objc_storeStrong((id *)&self->_foregroundColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "RGBValues");
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "RGBValues");
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "RGBValues");
}

uint64_t __45__PIParallaxColorAnalysis_contentsDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "RGBValues");
}

+ (int64_t)currentVersion
{
  return 3;
}

+ (id)loadFromContentsDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  PIParallaxColorAnalysis *v8;
  void *v9;
  void *v10;
  PIParallaxColorAnalysis *v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  const void **v25;
  const void **v26;
  void *specific;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  const void **v32;
  void *v33;
  int v34;
  void *v35;
  const void **v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  const void **v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_4162();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "dictionary != nil");
      v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v25;
      _os_log_error_impl(&dword_1A6382000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4162();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        v37 = dispatch_get_specific(*v26);
        v38 = (void *)MEMORY[0x1E0CB3978];
        v39 = v37;
        objc_msgSend(v38, "callStackSymbols");
        v26 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR("\n"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = (const void **)v37;
        v48 = 2114;
        v49 = v40;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v26;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v34 = _NUAssertFailHandler();
    goto LABEL_43;
  }
  if (!a4)
  {
    NUAssertLogger_4162();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v32 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v47 = v32;
      _os_log_error_impl(&dword_1A6382000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v26 = (const void **)MEMORY[0x1E0D51D48];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_4162();
    v28 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
        v36 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v47 = v36;
        _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_45;
    }
LABEL_43:
    if (v34)
    {
      v41 = dispatch_get_specific(*v26);
      v42 = (void *)MEMORY[0x1E0CB3978];
      v43 = v41;
      objc_msgSend(v42, "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = (const void **)v41;
      v48 = 2114;
      v49 = v45;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_45:

    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = objc_alloc_init(PIParallaxColorAnalysis);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid version number"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "integerValue") < 4)
  {
    -[PIParallaxColorAnalysis setVersion:](v8, "setVersion:", objc_msgSend(v9, "integerValue"));
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("foregroundLuminance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[PIParallaxColorAnalysis setForegroundLuminance:](v8, "setForegroundLuminance:", v13);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("backgroundLuminance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "floatValue");
        -[PIParallaxColorAnalysis setBackgroundLuminance:](v8, "setBackgroundLuminance:", v15);
        objc_msgSend(a1, "colorsFromDictionary:key:error:", v7, CFSTR("foregroundColors"), a4);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[PIParallaxColorAnalysis setForegroundColors:](v8, "setForegroundColors:", v16);
          objc_msgSend(a1, "colorsFromDictionary:key:error:", v7, CFSTR("backgroundColors"), a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            -[PIParallaxColorAnalysis setBackgroundColors:](v8, "setBackgroundColors:", v18);
            if (-[PIParallaxColorAnalysis version](v8, "version") < 2)
            {
              -[PIParallaxColorAnalysis backgroundLuminance](v8, "backgroundLuminance");
              -[PIParallaxColorAnalysis setLuminance:](v8, "setLuminance:");
              -[PIParallaxColorAnalysis backgroundColors](v8, "backgroundColors");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[PIParallaxColorAnalysis setColors:](v8, "setColors:", v22);

              v12 = v14;
            }
            else
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("luminance"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid luminance value"), v12);
                v11 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_29;
              }
              objc_msgSend(v12, "floatValue");
              -[PIParallaxColorAnalysis setLuminance:](v8, "setLuminance:", v19);
              objc_msgSend(a1, "colorsFromDictionary:key:error:", v7, CFSTR("colors"), a4);
              v20 = objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
LABEL_25:
                v11 = 0;
                goto LABEL_20;
              }
              -[PIParallaxColorAnalysis setColors:](v8, "setColors:", v20);
              v18 = (void *)v20;
            }
            if (-[PIParallaxColorAnalysis version](v8, "version") < 3)
            {
              v23 = MEMORY[0x1E0C9AA60];
            }
            else
            {
              objc_msgSend(a1, "colorsFromDictionary:key:error:", v7, CFSTR("clockAreaColors"), a4);
              v23 = objc_claimAutoreleasedReturnValue();

              v18 = (void *)v23;
              if (!v23)
                goto LABEL_25;
            }
            -[PIParallaxColorAnalysis setClockAreaColors:](v8, "setClockAreaColors:", v23);
            v11 = v8;
LABEL_29:

            goto LABEL_20;
          }
        }
        v11 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid luminance value"), v14);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid luminance value"), v12);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Incompatible color analysis version"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = 0;
  *a4 = v10;
LABEL_21:

  return v11;
}

+ (id)colorsFromDictionary:(id)a3 key:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v18 = v6;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        v19 = 0;
        objc_msgSend(MEMORY[0x1E0D75170], "colorWithRGBValues:error:", v13, &v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v19;
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to deserialize color values"), v13, v15);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
        objc_msgSend(v7, "addObject:", v14);

        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          v6 = v18;
          if (v10)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid color values"), v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

      v16 = 0;
      v6 = v18;
      goto LABEL_16;
    }
LABEL_11:

    v16 = v7;
LABEL_16:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Invalid color array"), v6);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

@end
