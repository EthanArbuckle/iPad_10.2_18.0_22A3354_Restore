@implementation SUCorePolicyDocumentationDownload

- (SUCorePolicyDocumentationDownload)init
{
  SUCorePolicyDocumentationDownload *v2;
  SUCorePolicyDocumentationDownload *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUCorePolicyDocumentationDownload;
  v2 = -[SUCorePolicyDocumentationDownload init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUCorePolicyDocumentationDownload backToDefaults](v2, "backToDefaults");
  return v3;
}

- (void)backToDefaults
{
  NSDictionary *additionalOptions;

  additionalOptions = self->_additionalOptions;
  self->_specifiedFields = 0;
  self->_additionalOptions = 0;
  *(_DWORD *)&self->_allowsCellular = 0;
  self->_requiresInexpensiveAccess = 0;
  self->_downloadTimeoutSecs = 120;

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
  self->_specifiedFields |= 0x40uLL;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_specifiedFields |= 8uLL;
}

- (void)setDownloadTimeoutSecs:(int)a3
{
  self->_downloadTimeoutSecs = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setRequiresInexpensiveAccess:(BOOL)a3
{
  self->_requiresInexpensiveAccess = a3;
  self->_specifiedFields |= 0x20uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyDocumentationDownload)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyDocumentationDownload *v5;
  NSDictionary *additionalOptions;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUCorePolicyDocumentationDownload;
  v5 = -[SUCorePolicyDocumentationDownload init](&v8, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_allowsCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowsCellular"));
    v5->_discretionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Discretionary"));
    v5->_disableUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableUI"));
    v5->_requiresPowerPluggedIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresPowerPluggedIn"));
    v5->_downloadTimeoutSecs = objc_msgSend(v4, "decodeIntForKey:", CFSTR("DownloadTimeoutSecs"));
    v5->_requiresInexpensiveAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresInexpensiveAccess"));
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload allowsCellular](self, "allowsCellular"), CFSTR("AllowsCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload discretionary](self, "discretionary"), CFSTR("Discretionary"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload disableUI](self, "disableUI"), CFSTR("DisableUI"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), CFSTR("RequiresPowerPluggedIn"));
  objc_msgSend(v4, "encodeInt:forKey:", -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"), CFSTR("DownloadTimeoutSecs"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"), CFSTR("RequiresInexpensiveAccess"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyDocumentationDownload allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyDocumentationDownload discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyDocumentationDownload disableUI](self, "disableUI"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  -[SUCorePolicyDocumentationDownload additionalOptions](self, "additionalOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v7);

  objc_msgSend(v5, "setRequiresInexpensiveAccess:", -[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"));
  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyDocumentationDownload *v4;
  SUCorePolicyDocumentationDownload *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  BOOL v12;
  uint64_t v14;

  v4 = (SUCorePolicyDocumentationDownload *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicyDocumentationDownload allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicyDocumentationDownload allowsCellular](self, "allowsCellular")
        && (v7 = -[SUCorePolicyDocumentationDownload discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicyDocumentationDownload discretionary](self, "discretionary"))
        && (v8 = -[SUCorePolicyDocumentationDownload disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicyDocumentationDownload disableUI](self, "disableUI"))
        && (v9 = -[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](v5, "requiresPowerPluggedIn"),
            v9 == -[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
        && (v10 = -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](v5, "downloadTimeoutSecs"),
            v10 == -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"))
        && (v11 = -[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](v5, "requiresInexpensiveAccess"),
            v11 == -[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess")))
      {
        v14 = -[SUCorePolicyDocumentationDownload specifiedFields](v5, "specifiedFields");
        v12 = v14 == -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields");
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields");
  v5 = CFSTR("YES");
  if (-[SUCorePolicyDocumentationDownload allowsCellular](self, "allowsCellular"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUCorePolicyDocumentationDownload discretionary](self, "discretionary"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[SUCorePolicyDocumentationDownload disableUI](self, "disableUI"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs");
  if (!-[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"))
    v5 = CFSTR("NO");
  -[SUCorePolicyDocumentationDownload additionalOptions](self, "additionalOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SUCorePolicyDocumentationDownload additionalOptions](self, "additionalOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyDocumentationDownload(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)"), v4, v6, v7, v8, v9, v10, v5, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCorePolicyDocumentationDownload(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|requiresInexpensiveAccess:%@|additionalOptions:%@)"), v4, v6, v7, v8, v9, v10, v5, CFSTR("none"));
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;

  if (-[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicyDocumentationDownload specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicyDocumentationDownload allowsCellular](self, "allowsCellular"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|cellular"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (-[SUCorePolicyDocumentationDownload discretionary](self, "discretionary"))
    v6 = CFSTR("|discretionary");
  else
    v6 = CFSTR("|non-discretionary");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyDocumentationDownload disableUI](self, "disableUI"))
    v8 = CFSTR("|UIDisabled");
  else
    v8 = CFSTR("|UIEnabled");
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyDocumentationDownload requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|power"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (-[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs") != 120)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|documentationDownloadTimeout=%d"), -[SUCorePolicyDocumentationDownload downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    objc_msgSend(v9, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (-[SUCorePolicyDocumentationDownload requiresInexpensiveAccess](self, "requiresInexpensiveAccess"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|cheapAccess"));
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  -[SUCorePolicyDocumentationDownload additionalOptions](self, "additionalOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = CFSTR("|withAdditionalOptions");
  else
    v15 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v9, "stringByAppendingString:", v15);
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
