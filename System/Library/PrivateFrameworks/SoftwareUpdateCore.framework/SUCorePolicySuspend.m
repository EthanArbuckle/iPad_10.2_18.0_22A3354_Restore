@implementation SUCorePolicySuspend

- (SUCorePolicySuspend)initWithSkipPhaseSet:(BOOL)a3
{
  _BOOL8 v3;
  SUCorePolicySuspend *v4;
  SUCorePolicySuspend *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicySuspend;
  v4 = -[SUCorePolicySuspend init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SUCorePolicySuspend backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  NSDictionary *additionalOptions;

  additionalOptions = self->_additionalOptions;
  self->_specifiedFields = 0;
  self->_additionalOptions = 0;
  self->_skipPhase = a3;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicySuspend)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicySuspend *v5;
  NSDictionary *additionalOptions;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicySuspend;
  v5 = -[SUCorePolicySuspend init](&v8, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_skipPhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SkipPhase"));
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicySuspend specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySuspend skipPhase](self, "skipPhase"), CFSTR("SkipPhase"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicySuspend skipPhase](self, "skipPhase"));
  -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v7);

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicySuspend specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicySuspend *v4;
  SUCorePolicySuspend *v5;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;

  v4 = (SUCorePolicySuspend *)a3;
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
      v6 = -[SUCorePolicySuspend skipPhase](v5, "skipPhase");
      if (v6 == -[SUCorePolicySuspend skipPhase](self, "skipPhase"))
      {
        v8 = -[SUCorePolicySuspend specifiedFields](v5, "specifiedFields");
        v7 = v8 == -[SUCorePolicySuspend specifiedFields](self, "specifiedFields");
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
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SUCorePolicySuspend specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicySuspend skipPhase](self, "skipPhase"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicySuspend(specifiedFields:0x%llX|skipPhase:%@|additionalOptions:%@)"), v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicySuspend(specifiedFields:0x%llX|skipPhase:%@|additionalOptions:%@)"), v4, v5, CFSTR("none"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)summary
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;

  if (-[SUCorePolicySuspend specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicySuspend specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicySuspend skipPhase](self, "skipPhase"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|skipPhase"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  -[SUCorePolicySuspend additionalOptions](self, "additionalOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("|withAdditionalOptions");
  else
    v7 = CFSTR("|noAdditionalOptions");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("|"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  return v8;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);
}

@end
