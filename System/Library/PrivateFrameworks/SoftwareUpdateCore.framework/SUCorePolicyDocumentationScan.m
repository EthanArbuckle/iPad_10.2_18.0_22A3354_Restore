@implementation SUCorePolicyDocumentationScan

- (SUCorePolicyDocumentationScan)init
{
  SUCorePolicyDocumentationScan *v2;
  SUCorePolicyDocumentationScan *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUCorePolicyDocumentationScan;
  v2 = -[SUCorePolicyDocumentationScan init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUCorePolicyDocumentationScan backToDefaults](v2, "backToDefaults");
  return v3;
}

- (void)backToDefaults
{
  NSDictionary *additionalServerParams;
  NSDictionary *additionalOptions;

  additionalServerParams = self->_additionalServerParams;
  self->_specifiedFields = 0;
  self->_additionalServerParams = 0;
  *(_DWORD *)&self->_allowsCellular = 0;
  self->_downloadTimeoutSecs = 120;
  self->_liveServerCatalogOnly = 0;

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

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_specifiedFields |= 0x20uLL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyDocumentationScan)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyDocumentationScan *v5;
  NSDictionary *additionalServerParams;
  NSDictionary *additionalOptions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyDocumentationScan;
  v5 = -[SUCorePolicyDocumentationScan init](&v9, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_allowsCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowsCellular"));
    v5->_discretionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Discretionary"));
    v5->_disableUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableUI"));
    v5->_requiresPowerPluggedIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresPowerPluggedIn"));
    v5->_downloadTimeoutSecs = objc_msgSend(v4, "decodeIntForKey:", CFSTR("DownloadTimeoutSecs"));
    v5->_liveServerCatalogOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LiveServerCatalogOnly"));
    additionalServerParams = v5->_additionalServerParams;
    v5->_additionalServerParams = 0;

    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"), CFSTR("AllowsCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"), CFSTR("Discretionary"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"), CFSTR("DisableUI"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), CFSTR("RequiresPowerPluggedIn"));
  objc_msgSend(v4, "encodeInt:forKey:", -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"), CFSTR("DownloadTimeoutSecs"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"), CFSTR("LiveServerCatalogOnly"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  objc_msgSend(v5, "setLiveServerCatalogOnly:", -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"));
  -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalServerParams:", v7);

  -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v9);

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyDocumentationScan *v4;
  SUCorePolicyDocumentationScan *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  BOOL v12;
  uint64_t v14;

  v4 = (SUCorePolicyDocumentationScan *)a3;
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
      v6 = -[SUCorePolicyDocumentationScan allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular")
        && (v7 = -[SUCorePolicyDocumentationScan discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicyDocumentationScan discretionary](self, "discretionary"))
        && (v8 = -[SUCorePolicyDocumentationScan disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicyDocumentationScan disableUI](self, "disableUI"))
        && (v9 = -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](v5, "requiresPowerPluggedIn"),
            v9 == -[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
        && (v10 = -[SUCorePolicyDocumentationScan downloadTimeoutSecs](v5, "downloadTimeoutSecs"),
            v10 == -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"))
        && (v11 = -[SUCorePolicyDocumentationScan liveServerCatalogOnly](v5, "liveServerCatalogOnly"),
            v11 == -[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly")))
      {
        v14 = -[SUCorePolicyDocumentationScan specifiedFields](v5, "specifiedFields");
        v12 = v14 == -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields");
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
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  int64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x1E0CB3940];
  v16 = -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields");
  v3 = CFSTR("NO");
  if (-[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v15 = v4;
  if (-[SUCorePolicyDocumentationScan discretionary](self, "discretionary"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SUCorePolicyDocumentationScan disableUI](self, "disableUI"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs");
  if (-[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"))
    v3 = CFSTR("YES");
  -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("none");
  if (v9)
  {
    -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("SUCorePolicyDocumentationScan(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|liveServerCatalogOnly:%@|additionalServerParams:%@|additionalOptions:%@)"), v16, v15, v5, v6, v7, v8, v3, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v17, "stringWithFormat:", CFSTR("SUCorePolicyDocumentationScan(specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|disableUI:%@|requiresPowerPluggedIn:%@|downloadTimeoutSecs:%d|liveServerCatalogOnly:%@|additionalServerParams:%@|additionalOptions:%@)"), v16, v15, v5, v6, v7, v8, v3, v10, CFSTR("none"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9)
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
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;

  if (-[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicyDocumentationScan specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicyDocumentationScan allowsCellular](self, "allowsCellular"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|cellular"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (-[SUCorePolicyDocumentationScan discretionary](self, "discretionary"))
    v6 = CFSTR("|discretionary");
  else
    v6 = CFSTR("|non-discretionary");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyDocumentationScan disableUI](self, "disableUI"))
    v8 = CFSTR("|UIDisabled");
  else
    v8 = CFSTR("|UIEnabled");
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicyDocumentationScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|power"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (-[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs") != 120)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|catalogTimeout=%d"), -[SUCorePolicyDocumentationScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    objc_msgSend(v9, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (-[SUCorePolicyDocumentationScan liveServerCatalogOnly](self, "liveServerCatalogOnly"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|liveServerCatalogOnly"));
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  -[SUCorePolicyDocumentationScan additionalServerParams](self, "additionalServerParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = CFSTR("|withAdditionalServerParams");
  else
    v15 = CFSTR("|noAdditionalServerParams");
  objc_msgSend(v9, "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyDocumentationScan additionalOptions](self, "additionalOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = CFSTR("|withAdditionalOptions");
  else
    v18 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v16, "stringByAppendingString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v19, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v19, "stringByAppendingString:", CFSTR("|"));
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  return v19;
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

- (BOOL)liveServerCatalogOnly
{
  return self->_liveServerCatalogOnly;
}

- (NSDictionary)additionalServerParams
{
  return self->_additionalServerParams;
}

- (void)setAdditionalServerParams:(id)a3
{
  objc_storeStrong((id *)&self->_additionalServerParams, a3);
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
  objc_storeStrong((id *)&self->_additionalServerParams, 0);
}

@end
