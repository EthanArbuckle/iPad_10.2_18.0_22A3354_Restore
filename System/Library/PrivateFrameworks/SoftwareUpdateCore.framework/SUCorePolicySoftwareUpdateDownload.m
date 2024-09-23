@implementation SUCorePolicySoftwareUpdateDownload

- (SUCorePolicySoftwareUpdateDownload)initWithSkipPhaseSet:(BOOL)a3
{
  _BOOL8 v3;
  SUCorePolicySoftwareUpdateDownload *v4;
  SUCorePolicySoftwareUpdateDownload *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicySoftwareUpdateDownload;
  v4 = -[SUCorePolicySoftwareUpdateDownload init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[SUCorePolicySoftwareUpdateDownload backToDefaultsWithSkipPhaseSet:](v4, "backToDefaultsWithSkipPhaseSet:", v3);
  return v5;
}

- (void)backToDefaultsWithSkipPhaseSet:(BOOL)a3
{
  NSDictionary *additionalOptions;

  self->_specifiedFields = 0;
  *(_WORD *)&self->_allowsCellular = 0;
  self->_disableUI = 0;
  *(_WORD *)&self->_requiresPowerPluggedIn = 0;
  self->_downloadTimeoutSecs = 120;
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
  self->_specifiedFields |= 0x80uLL;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setDownloadTimeoutSecs:(int)a3
{
  self->_downloadTimeoutSecs = a3;
  self->_specifiedFields |= 0x20uLL;
}

- (void)setRequiresInexpensiveAccess:(BOOL)a3
{
  self->_requiresInexpensiveAccess = a3;
  self->_specifiedFields |= 0x40uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicySoftwareUpdateDownload)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicySoftwareUpdateDownload *v5;
  NSDictionary *additionalOptions;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicySoftwareUpdateDownload;
  v5 = -[SUCorePolicySoftwareUpdateDownload init](&v8, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_allowsCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowsCellular"));
    v5->_discretionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Discretionary"));
    v5->_disableUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableUI"));
    v5->_requiresPowerPluggedIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresPowerPluggedIn"));
    v5->_downloadTimeoutSecs = objc_msgSend(v4, "decodeIntForKey:", CFSTR("SoftwareUpdateAssetDownloadTimeoutSecs"));
    v5->_requiresInexpensiveAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresInexpensiveAccess"));
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
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload allowsCellular](self, "allowsCellular"), CFSTR("AllowsCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload discretionary](self, "discretionary"), CFSTR("Discretionary"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload disableUI](self, "disableUI"), CFSTR("DisableUI"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), CFSTR("RequiresPowerPluggedIn"));
  objc_msgSend(v4, "encodeInt:forKey:", -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"), CFSTR("SoftwareUpdateAssetDownloadTimeoutSecs"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"), CFSTR("RequiresInexpensiveAccess"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateDownload skipPhase](self, "skipPhase"), CFSTR("SkipPhase"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicySoftwareUpdateDownload allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicySoftwareUpdateDownload discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicySoftwareUpdateDownload disableUI](self, "disableUI"));
  objc_msgSend(v5, "setSkipPhase:", -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  -[SUCorePolicySoftwareUpdateDownload additionalOptions](self, "additionalOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v7);

  objc_msgSend(v5, "setRequiresInexpensiveAccess:", -[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"));
  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicySoftwareUpdateDownload *v4;
  SUCorePolicySoftwareUpdateDownload *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t v15;

  v4 = (SUCorePolicySoftwareUpdateDownload *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicySoftwareUpdateDownload allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicySoftwareUpdateDownload allowsCellular](self, "allowsCellular")
        && (v7 = -[SUCorePolicySoftwareUpdateDownload discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicySoftwareUpdateDownload discretionary](self, "discretionary"))
        && (v8 = -[SUCorePolicySoftwareUpdateDownload disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicySoftwareUpdateDownload disableUI](self, "disableUI"))
        && (v9 = -[SUCorePolicySoftwareUpdateDownload skipPhase](v5, "skipPhase"),
            v9 == -[SUCorePolicySoftwareUpdateDownload skipPhase](self, "skipPhase"))
        && (v10 = -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](v5, "requiresPowerPluggedIn"),
            v10 == -[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
        && (v11 = -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](v5, "downloadTimeoutSecs"),
            v11 == -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"))
        && (v12 = -[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](v5, "requiresInexpensiveAccess"),
            v12 == -[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess")))
      {
        v15 = -[SUCorePolicySoftwareUpdateDownload specifiedFields](v5, "specifiedFields");
        v13 = v15 == -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields");
  v4 = CFSTR("NO");
  if (-[SUCorePolicySoftwareUpdateDownload skipPhase](self, "skipPhase"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SUCorePolicySoftwareUpdateDownload allowsCellular](self, "allowsCellular"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUCorePolicySoftwareUpdateDownload discretionary](self, "discretionary"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[SUCorePolicySoftwareUpdateDownload disableUI](self, "disableUI"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs");
  if (-[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"))
    v4 = CFSTR("YES");
  -[SUCorePolicySoftwareUpdateDownload additionalOptions](self, "additionalOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SUCorePolicySoftwareUpdateDownload additionalOptions](self, "additionalOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("SUCorePolicySoftwareUpdateDownload(specifiedFields:0x%llX|skipPhase:%@|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)"), v3, v5, v6, v7, v8, v9, v10, v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "stringWithFormat:", CFSTR("SUCorePolicySoftwareUpdateDownload(specifiedFields:0x%llX|skipPhase:%@|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)"), v3, v5, v6, v7, v8, v9, v10, v4, CFSTR("none"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;

  if (-[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicySoftwareUpdateDownload specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicySoftwareUpdateDownload allowsCellular](self, "allowsCellular"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|cellular"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (-[SUCorePolicySoftwareUpdateDownload discretionary](self, "discretionary"))
    v6 = CFSTR("|discretionary");
  else
    v6 = CFSTR("|non-discretionary");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicySoftwareUpdateDownload disableUI](self, "disableUI"))
    v8 = CFSTR("UIDisabled");
  else
    v8 = CFSTR("UIEnabled");
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicySoftwareUpdateDownload skipPhase](self, "skipPhase"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|skipPhase"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (-[SUCorePolicySoftwareUpdateDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|power"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (-[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs") != 120)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|suTimeout=%d"), -[SUCorePolicySoftwareUpdateDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    objc_msgSend(v9, "stringByAppendingString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  if (-[SUCorePolicySoftwareUpdateDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|cheapAccess"));
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  -[SUCorePolicySoftwareUpdateDownload additionalOptions](self, "additionalOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = CFSTR("|withAdditionalOptions");
  else
    v16 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v9, "stringByAppendingString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v17, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v17, "stringByAppendingString:", CFSTR("|"));
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  return v17;
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

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (int)downloadTimeoutSecs
{
  return self->_downloadTimeoutSecs;
}

- (BOOL)requiresInexpensiveAccess
{
  return self->_requiresInexpensiveAccess;
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
