@implementation SUCorePolicyLoadBrain

- (SUCorePolicyLoadBrain)initWithSkipPhaseSet:(BOOL)a3
{
  _BOOL8 v3;
  SUCorePolicyLoadBrain *v4;
  SUCorePolicyLoadBrain *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyLoadBrain;
  v4 = -[SUCorePolicyLoadBrain init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SUCorePolicyLoadBrain backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  NSDictionary *additionalOptions;

  additionalOptions = self->_additionalOptions;
  self->_specifiedFields = 0;
  self->_additionalOptions = 0;
  *(_WORD *)&self->_allowsCellular = 0;
  self->_liveServerCatalogOnly = 0;
  self->_skipPhase = a3;

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

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setDisableUI:(BOOL)a3
{
  self->_disableUI = a3;
  self->_specifiedFields |= 0x20uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyLoadBrain)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyLoadBrain *v5;
  NSDictionary *additionalOptions;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicyLoadBrain;
  v5 = -[SUCorePolicyLoadBrain init](&v8, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_allowsCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowsCellular"));
    v5->_discretionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Discretionary"));
    v5->_disableUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableUI"));
    v5->_liveServerCatalogOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LiveServerCatalogOnly"));
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
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular"), CFSTR("AllowsCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyLoadBrain discretionary](self, "discretionary"), CFSTR("Discretionary"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyLoadBrain disableUI](self, "disableUI"), CFSTR("DisableUI"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"), CFSTR("LiveServerCatalogOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyLoadBrain skipPhase](self, "skipPhase"), CFSTR("SkipPhase"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyLoadBrain discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyLoadBrain disableUI](self, "disableUI"));
  objc_msgSend(v5, "setLiveServerCatalogOnly:", -[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"));
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicyLoadBrain skipPhase](self, "skipPhase"));
  -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v7);

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyLoadBrain *v4;
  SUCorePolicyLoadBrain *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  uint64_t v13;

  v4 = (SUCorePolicyLoadBrain *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicyLoadBrain allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular")
        && (v7 = -[SUCorePolicyLoadBrain discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicyLoadBrain discretionary](self, "discretionary"))
        && (v8 = -[SUCorePolicyLoadBrain disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicyLoadBrain disableUI](self, "disableUI"))
        && (v9 = -[SUCorePolicyLoadBrain liveServerCatalogOnly](v5, "liveServerCatalogOnly"),
            v9 == -[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"))
        && (v10 = -[SUCorePolicyLoadBrain skipPhase](v5, "skipPhase"),
            v10 == -[SUCorePolicyLoadBrain skipPhase](self, "skipPhase")))
      {
        v13 = -[SUCorePolicyLoadBrain specifiedFields](v5, "specifiedFields");
        v11 = v13 == -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields");
  v5 = CFSTR("YES");
  if (-[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUCorePolicyLoadBrain discretionary](self, "discretionary"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[SUCorePolicyLoadBrain disableUI](self, "disableUI"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (!-[SUCorePolicyLoadBrain skipPhase](self, "skipPhase"))
    v5 = CFSTR("NO");
  -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyLoadBrain(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|liveServerCatalogOnly:%@|skipPhase:%@|additionalOptions:%@)"), v4, v6, v7, v8, v9, v5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyLoadBrain(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|liveServerCatalogOnly:%@|skipPhase:%@|additionalOptions:%@)"), v4, v6, v7, v8, v9, v5, CFSTR("none"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

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
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (-[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicyLoadBrain specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicyLoadBrain allowsCellular](self, "allowsCellular"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|cellular"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (-[SUCorePolicyLoadBrain discretionary](self, "discretionary"))
    v6 = CFSTR("|discretionary");
  else
    v6 = CFSTR("|non-discretionary");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyLoadBrain disableUI](self, "disableUI"))
    v8 = CFSTR("UIDisabled");
  else
    v8 = CFSTR("UIEnabled");
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyLoadBrain liveServerCatalogOnly](self, "liveServerCatalogOnly"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|liveServerCatalogOnly"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (-[SUCorePolicyLoadBrain skipPhase](self, "skipPhase"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|skipPhase"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  -[SUCorePolicyLoadBrain additionalOptions](self, "additionalOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = CFSTR("|withAdditionalOptions");
  else
    v13 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v9, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("|"));
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  return v14;
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

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
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
