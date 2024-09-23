@implementation SUCorePolicyApply

- (SUCorePolicyApply)initWithSkipPhaseSet:(BOOL)a3
{
  _BOOL8 v3;
  SUCorePolicyApply *v4;
  SUCorePolicyApply *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyApply;
  v4 = -[SUCorePolicyApply init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SUCorePolicyApply backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  NSDictionary *additionalOptions;
  NSDictionary *baseApplyOptions;

  additionalOptions = self->_additionalOptions;
  self->_specifiedFields = 0;
  self->_additionalOptions = 0;
  self->_skipPhase = a3;

  baseApplyOptions = self->_baseApplyOptions;
  self->_baseApplyOptions = 0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyApply)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyApply *v5;
  NSDictionary *additionalOptions;
  NSDictionary *baseApplyOptions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyApply;
  v5 = -[SUCorePolicyApply init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_skipPhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SkipPhase"));
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

    baseApplyOptions = v5->_baseApplyOptions;
    v5->_baseApplyOptions = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyApply specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyApply skipPhase](self, "skipPhase"), CFSTR("SkipPhase"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyApply skipPhase](self, "skipPhase"));
  -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBaseApplyOptions:", v7);

  -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v9);

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyApply specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyApply *v4;
  SUCorePolicyApply *v5;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;

  v4 = (SUCorePolicyApply *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicyApply skipPhase](v5, "skipPhase");
      if (v6 == -[SUCorePolicyApply skipPhase](self, "skipPhase"))
      {
        v8 = -[SUCorePolicyApply specifiedFields](v5, "specifiedFields");
        v7 = v8 == -[SUCorePolicyApply specifiedFields](self, "specifiedFields");
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SUCorePolicyApply specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicyApply skipPhase](self, "skipPhase"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("none");
  }
  -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyApply(specifiedFields:0x%llX|skipPhase:%@|baseApplyOptions:%@|additionalOptions:%@)"), v4, v5, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyApply(specifiedFields:0x%llX|skipPhase:%@|baseApplyOptions:%@|additionalOptions:%@)"), v4, v5, v7, CFSTR("none"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v6)
  return v10;
}

- (id)summary
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;

  if (-[SUCorePolicyApply specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicyApply specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicyApply skipPhase](self, "skipPhase"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|skipPhase"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  -[SUCorePolicyApply baseApplyOptions](self, "baseApplyOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("|withBaseApplyOptions");
  else
    v7 = CFSTR("|noBaseApplyOptions");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyApply additionalOptions](self, "additionalOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = CFSTR("|withAdditionalOptions");
  else
    v10 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v8, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v11, "stringByAppendingString:", CFSTR("|"));
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  return v11;
}

- (int64_t)specifiedFields
{
  return self->_specifiedFields;
}

- (void)setSpecifiedFields:(int64_t)a3
{
  self->_specifiedFields = a3;
}

- (BOOL)skipPhase
{
  return self->_skipPhase;
}

- (void)setSkipPhase:(BOOL)a3
{
  self->_skipPhase = a3;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_additionalOptions, a3);
}

- (NSDictionary)baseApplyOptions
{
  return self->_baseApplyOptions;
}

- (void)setBaseApplyOptions:(id)a3
{
  objc_storeStrong((id *)&self->_baseApplyOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseApplyOptions, 0);
  objc_storeStrong((id *)&self->_additionalOptions, 0);
}

@end
