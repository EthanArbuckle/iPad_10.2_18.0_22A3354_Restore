@implementation SUCorePolicyPreflightPersonalize

- (SUCorePolicyPreflightPersonalize)init
{
  SUCorePolicyPreflightPersonalize *v2;
  SUCorePolicyPreflightPersonalize *v3;
  NSDictionary *additionalOptions;
  NSDictionary *basePreflightOptions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyPreflightPersonalize;
  v2 = -[SUCorePolicyPreflightPersonalize init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_performPhase = 0;
    additionalOptions = v2->_additionalOptions;
    v2->_additionalOptions = 0;

    basePreflightOptions = v3->_basePreflightOptions;
    v3->_basePreflightOptions = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyPreflightPersonalize)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyPreflightPersonalize *v5;
  NSDictionary *additionalOptions;
  NSDictionary *basePreflightOptions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyPreflightPersonalize;
  v5 = -[SUCorePolicyPreflightPersonalize init](&v9, sel_init);
  if (v5)
  {
    v5->_performPhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformPhase"));
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

    basePreflightOptions = v5->_basePreflightOptions;
    v5->_basePreflightOptions = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyPreflightPersonalize performPhase](self, "performPhase"), CFSTR("PerformPhase"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPerformPhase:", -[SUCorePolicyPreflightPersonalize performPhase](self, "performPhase"));
  -[SUCorePolicyPreflightPersonalize basePreflightOptions](self, "basePreflightOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBasePreflightOptions:", v7);

  -[SUCorePolicyPreflightPersonalize additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyPreflightPersonalize *v4;
  _BOOL4 v5;
  int v6;

  v4 = (SUCorePolicyPreflightPersonalize *)a3;
  if (v4 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[SUCorePolicyPreflightPersonalize performPhase](v4, "performPhase");
      v6 = v5 ^ -[SUCorePolicyPreflightPersonalize performPhase](self, "performPhase") ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[SUCorePolicyPreflightPersonalize performPhase](self, "performPhase"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[SUCorePolicyPreflightPersonalize basePreflightOptions](self, "basePreflightOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SUCorePolicyPreflightPersonalize basePreflightOptions](self, "basePreflightOptions");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("none");
  }
  -[SUCorePolicyPreflightPersonalize additionalOptions](self, "additionalOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUCorePolicyPreflightPersonalize additionalOptions](self, "additionalOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyPreflightPersonalize(performPhase:%@|basePreflightOptions:%@|additionalOptions:%@)"), v4, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyPreflightPersonalize(performPhase:%@|basePreflightOptions:%@|additionalOptions:%@)"), v4, v6, CFSTR("none"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v5)
  return v9;
}

- (id)summary
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;

  if (-[SUCorePolicyPreflightPersonalize performPhase](self, "performPhase"))
  {
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", CFSTR("|performPhase"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EA87A8E8;
  }
  -[SUCorePolicyPreflightPersonalize basePreflightOptions](self, "basePreflightOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = CFSTR("|withBasePreflightOptions");
  else
    v5 = CFSTR("|noBasePreflightOptions");
  -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyPreflightPersonalize additionalOptions](self, "additionalOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = CFSTR("|withAdditionalOptions");
  else
    v8 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v6, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  return v9;
}

- (BOOL)performPhase
{
  return self->_performPhase;
}

- (void)setPerformPhase:(BOOL)a3
{
  self->_performPhase = a3;
}

- (NSDictionary)basePreflightOptions
{
  return self->_basePreflightOptions;
}

- (void)setBasePreflightOptions:(id)a3
{
  objc_storeStrong((id *)&self->_basePreflightOptions, a3);
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
  objc_storeStrong((id *)&self->_basePreflightOptions, 0);
}

@end
