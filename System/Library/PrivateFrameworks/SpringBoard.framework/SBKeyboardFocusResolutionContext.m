@implementation SBKeyboardFocusResolutionContext

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[SBKeyboardFocusResolutionContext _init]([SBMutableKeyboardFocusResolutionContext alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 == objc_opt_class() || (v3 = objc_opt_class(), v3 == objc_opt_class()))
    {
      v5.receiver = v1;
      v5.super_class = (Class)SBKeyboardFocusResolutionContext;
      return objc_msgSendSuper2(&v5, sel_init);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBKeyboardFocusResolutionContext cannot be subclassed"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusResolutionContext _init].cold.1(sel__init, (uint64_t)v1, (uint64_t)v4);
      objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      result = (id)_bs_set_crash_log_message();
      __break(0);
    }
  }
  return result;
}

- (SBKeyboardFocusResolutionContext)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  SBKeyboardFocusResolutionContext *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  SBKeyboardFocusResolutionContext *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate SBKeyboardFocusResolutionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("SBKeyboardFocusResolutionContext.m");
    v17 = 1024;
    v18 = 30;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (SBKeyboardFocusResolutionContext *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot directly allocate SBKeyboardFocusResolutionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("SBKeyboardFocusResolutionContext.m");
    v17 = 1024;
    v18 = 35;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_initWithCopyOf:(void *)a1
{
  _BYTE *v3;
  _BYTE *v4;

  v3 = a2;
  if (a1)
  {
    v4 = -[SBKeyboardFocusResolutionContext _init](a1);
    a1 = v4;
    if (v4)
    {
      v4[10] = v3[10];
      v4[9] = v3[9];
      v4[8] = v3[8];
    }
  }

  return a1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_screenDim);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriVisible);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spotlightVisible);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  v9 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v8 ^ (v8 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v8 ^ (v8 >> 30))) >> 27));
  return v9 ^ (v9 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (unsigned __int8 *)v4;
    v6 = v5[10] == self->_screenDim && v5[8] == self->_spotlightVisible && v5[9] == self->_siriVisible;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBKeyboardFocusResolutionContext _initWithCopyOf:]([SBKeyboardFocusResolutionContext alloc], self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBKeyboardFocusResolutionContext _initWithCopyOf:]([SBMutableKeyboardFocusResolutionContext alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_msgSend(v7, "appendBool:withName:", self->_screenDim, CFSTR("screenDim"));
  v5 = (id)objc_msgSend(v7, "appendBool:withName:", self->_siriVisible, CFSTR("siriVisible"));
  v6 = (id)objc_msgSend(v7, "appendBool:withName:", self->_spotlightVisible, CFSTR("spotlightVisible"));

}

- (BOOL)isScreenDim
{
  return self->_screenDim;
}

- (BOOL)isSiriVisible
{
  return self->_siriVisible;
}

- (BOOL)isSpotlightVisible
{
  return self->_spotlightVisible;
}

- (void)_init
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBKeyboardFocusResolutionContext.m");
  v16 = 1024;
  v17 = 41;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
