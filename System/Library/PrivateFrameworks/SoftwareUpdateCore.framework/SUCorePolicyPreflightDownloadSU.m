@implementation SUCorePolicyPreflightDownloadSU

- (SUCorePolicyPreflightDownloadSU)initWithSkipPhaseSet:(BOOL)a3
{
  _BOOL8 v3;
  SUCorePolicyPreflightDownloadSU *v4;
  SUCorePolicyPreflightDownloadSU *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyPreflightDownloadSU;
  v4 = -[SUCorePolicyPreflightDownloadSU init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SUCorePolicyPreflightDownloadSU backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  NSDictionary *basePreflightOptions;
  NSDictionary *additionalOptions;

  basePreflightOptions = self->_basePreflightOptions;
  self->_specifiedFields = 0;
  self->_basePreflightOptions = 0;
  *(_WORD *)&self->_allowsCellular = 0;
  self->_disableUI = 0;
  self->_skipPhase = a3;

  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = 0;

}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
  self->_specifiedFields |= 2uLL;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
  self->_specifiedFields |= 4uLL;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
  self->_specifiedFields |= 0x10uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyPreflightDownloadSU)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyPreflightDownloadSU *v5;
  NSDictionary *basePreflightOptions;
  NSDictionary *additionalOptions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyPreflightDownloadSU;
  v5 = -[SUCorePolicyPreflightDownloadSU init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_allowsCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowsCellular"));
    v5->_discretionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Discretionary"));
    v5->_disableUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableUI"));
    v5->_skipPhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SkipPhase"));
    basePreflightOptions = v5->_basePreflightOptions;
    v5->_basePreflightOptions = 0;

    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular"), CFSTR("AllowsCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"), CFSTR("Discretionary"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"), CFSTR("DisableUI"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase"), CFSTR("SkipPhase"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"));
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase"));
  -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBasePreflightOptions:", v7);

  -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v9);

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyPreflightDownloadSU *v4;
  SUCorePolicyPreflightDownloadSU *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  uint64_t v12;

  v4 = (SUCorePolicyPreflightDownloadSU *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicyPreflightDownloadSU allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular")
        && (v7 = -[SUCorePolicyPreflightDownloadSU discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"))
        && (v8 = -[SUCorePolicyPreflightDownloadSU disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"))
        && (v9 = -[SUCorePolicyPreflightDownloadSU skipPhase](v5, "skipPhase"),
            v9 == -[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase")))
      {
        v12 = -[SUCorePolicyPreflightDownloadSU specifiedFields](v5, "specifiedFields");
        v10 = v12 == -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("none");
  if (v8)
  {
    -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("SUCorePolicyPreflightDownloadSU(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|skipPhase:%@|basePreflightOptions:%@|additionalOptions:%@)"), v3, v4, v5, v6, v7, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "stringWithFormat:", CFSTR("SUCorePolicyPreflightDownloadSU(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|skipPhase:%@|basePreflightOptions:%@|additionalOptions:%@)"), v3, v4, v5, v6, v7, v9, CFSTR("none"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  return v12;
}

- (id)summary
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;

  if (-[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicyPreflightDownloadSU specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicyPreflightDownloadSU allowsCellular](self, "allowsCellular"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|cellular"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (-[SUCorePolicyPreflightDownloadSU discretionary](self, "discretionary"))
    v6 = CFSTR("|discretionary");
  else
    v6 = CFSTR("|non-discretionary");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyPreflightDownloadSU disableUI](self, "disableUI"))
    v8 = CFSTR("|UIDisabled");
  else
    v8 = CFSTR("|UIEnabled");
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyPreflightDownloadSU skipPhase](self, "skipPhase"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|skipPhase"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  -[SUCorePolicyPreflightDownloadSU basePreflightOptions](self, "basePreflightOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = CFSTR("|withBasePreflightOptions");
  else
    v12 = CFSTR("|noBasePreflightOptions");
  objc_msgSend(v9, "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyPreflightDownloadSU additionalOptions](self, "additionalOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = CFSTR("|withAdditionalOptions");
  else
    v15 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v13, "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("|"));
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  return v16;
}

- (int64_t)specifiedFields
{
  return self->_specifiedFields;
}

- (void)setSpecifiedFields:(int64_t)a3
{
  self->_specifiedFields = a3;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (BOOL)disableUI
{
  return self->_disableUI;
}

- (BOOL)skipPhase
{
  return self->_skipPhase;
}

- (void)setSkipPhase:(BOOL)a3
{
  self->_skipPhase = a3;
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
