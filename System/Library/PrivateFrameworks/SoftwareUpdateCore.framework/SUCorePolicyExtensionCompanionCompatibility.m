@implementation SUCorePolicyExtensionCompanionCompatibility

- (SUCorePolicyExtensionCompanionCompatibility)init
{
  SUCorePolicyExtensionCompanionCompatibility *v2;
  SUCorePolicyExtensionCompanionCompatibility *v3;
  NSNumber *minCompatibility;
  NSNumber *maxCompatibility;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyExtensionCompanionCompatibility;
  v2 = -[SUCorePolicyExtension init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    minCompatibility = v2->_minCompatibility;
    v2->_minCompatibility = 0;

    maxCompatibility = v3->_maxCompatibility;
    v3->_maxCompatibility = 0;

  }
  return v3;
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[5];
  uint8_t buf[4];
  SUCorePolicyExtensionCompanionCompatibility *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v5)
  {
    v7 = (void *)v5;
    -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v4;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "oslog");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v22 = self;
        v23 = 2048;
        v24 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ starting compatibility version filtering, starting with %lu assets", buf, 0x16u);
      }

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __78__SUCorePolicyExtensionCompanionCompatibility_filterSoftwareUpdateAssetArray___block_invoke;
      v20[3] = &unk_1EA877F48;
      v20[4] = self;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "filteredArrayUsingPredicate:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v6, "count");
        -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedLongValue");
        -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedLongValue");
        *(_DWORD *)buf = 138544130;
        v22 = self;
        v23 = 2048;
        v24 = v14;
        v25 = 2048;
        v26 = v16;
        v27 = 2048;
        v28 = v18;
        _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ found %lu assets that meet the compatibility requirement of %lu:%lu", buf, 0x2Au);

      }
    }
  }

  return v6;
}

BOOL __78__SUCorePolicyExtensionCompanionCompatibility_filterSoftwareUpdateAssetArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CompatibilityVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "minCompatibility");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "compare:", v5) == -1)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "maxCompatibility");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "compare:", v6) != 1;

    }
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(v4, "unsignedLongValue");
    v12 = CFSTR("NO");
    v14 = 138543874;
    v15 = v10;
    if (v7)
      v12 = CFSTR("YES");
    v16 = 2048;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ assetCompatibilityVersion=%lu, compatible=%{public}@", (uint8_t *)&v14, 0x20u);
  }

  return v7;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (SUCorePolicyExtensionCompanionCompatibility)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyExtensionCompanionCompatibility *v5;
  uint64_t v6;
  NSNumber *minCompatibility;
  uint64_t v8;
  NSNumber *maxCompatibility;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCorePolicyExtensionCompanionCompatibility;
  v5 = -[SUCorePolicyExtension init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MinCompatibility"));
    v6 = objc_claimAutoreleasedReturnValue();
    minCompatibility = v5->_minCompatibility;
    v5->_minCompatibility = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MaxCompatibility"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxCompatibility = v5->_maxCompatibility;
    v5->_maxCompatibility = (NSNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MinCompatibility"));

  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("MaxCompatibility"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyExtensionCompanionCompatibility *v4;
  SUCorePolicyExtensionCompanionCompatibility *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (SUCorePolicyExtensionCompanionCompatibility *)a3;
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
      v6 = (void *)MEMORY[0x1E0DA8920];
      -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](v5, "minCompatibility");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "numberIsEqual:to:", v7, v8))
      {
        v9 = (void *)MEMORY[0x1E0DA8920];
        -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](v5, "maxCompatibility");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v9, "numberIsEqual:to:", v10, v11);

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

- (id)extensionName
{
  return CFSTR("SUCorePolicyExtensionCompanionCompatibility");
}

- (id)summary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("|minCompatibility=%@"), v5);
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1EA87A8E8;
  }
  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("|maxCompatibility=%@"), v10);
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v12;
  }
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("|"));
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v13;
  }
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicyExtensionCompanionCompatibility extensionName](self, "extensionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@(minCompatibility:%@|maxCompatibility:%@)"), v4, v5, v6);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SUCorePolicyExtensionCompanionCompatibility *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(SUCorePolicyExtensionCompanionCompatibility);
  -[SUCorePolicyExtensionCompanionCompatibility minCompatibility](self, "minCompatibility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility setMinCompatibility:](v4, "setMinCompatibility:", v5);

  -[SUCorePolicyExtensionCompanionCompatibility maxCompatibility](self, "maxCompatibility");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionCompanionCompatibility setMaxCompatibility:](v4, "setMaxCompatibility:", v6);

  return v4;
}

- (NSNumber)minCompatibility
{
  return self->_minCompatibility;
}

- (void)setMinCompatibility:(id)a3
{
  objc_storeStrong((id *)&self->_minCompatibility, a3);
}

- (NSNumber)maxCompatibility
{
  return self->_maxCompatibility;
}

- (void)setMaxCompatibility:(id)a3
{
  objc_storeStrong((id *)&self->_maxCompatibility, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCompatibility, 0);
  objc_storeStrong((id *)&self->_minCompatibility, 0);
}

@end
