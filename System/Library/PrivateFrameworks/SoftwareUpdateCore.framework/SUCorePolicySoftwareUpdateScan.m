@implementation SUCorePolicySoftwareUpdateScan

- (SUCorePolicySoftwareUpdateScan)init
{
  SUCorePolicySoftwareUpdateScan *v2;
  SUCorePolicySoftwareUpdateScan *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUCorePolicySoftwareUpdateScan;
  v2 = -[SUCorePolicySoftwareUpdateScan init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUCorePolicySoftwareUpdateScan backToDefaults](v2, "backToDefaults");
  return v3;
}

- (void)backToDefaults
{
  NSString *v3;
  NSString *rampingScanType;
  NSString *sessionId;
  NSDictionary *additionalServerParams;
  NSDictionary *additionalOptions;

  self->_specifiedFields = 0;
  *(_DWORD *)&self->_allowsCellular = 0;
  *(_DWORD *)&self->_requiresPowerPluggedIn = 0;
  self->_downloadTimeoutSecs = 120;
  v3 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("Foreground"));
  rampingScanType = self->_rampingScanType;
  self->_rampingScanType = v3;

  sessionId = self->_sessionId;
  self->_sessionId = 0;

  additionalServerParams = self->_additionalServerParams;
  self->_scanUpdateType = 0;
  self->_additionalServerParams = 0;
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
  self->_specifiedFields |= 0x1000uLL;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
  self->_specifiedFields |= 8uLL;
}

- (void)setRestrictToIncremental:(BOOL)a3
{
  self->_restrictToIncremental = a3;
  self->_specifiedFields |= 0x10uLL;
}

- (void)setRestrictToFull:(BOOL)a3
{
  self->_restrictToFull = a3;
  self->_specifiedFields |= 0x20uLL;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  self->_allowSameVersion = a3;
  self->_specifiedFields |= 0x40uLL;
}

- (void)setDownloadTimeoutSecs:(int)a3
{
  self->_downloadTimeoutSecs = a3;
  self->_specifiedFields |= 0x80uLL;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
  self->_specifiedFields |= 0x100uLL;
}

- (void)setRampingScanType:(id)a3
{
  uint64_t v4;
  id v5;
  const __CFString *v6;
  NSString *v7;
  NSString *rampingScanType;

  v4 = objc_msgSend(a3, "compare:options:", CFSTR("Background"), 1);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v4)
    v6 = CFSTR("Foreground");
  else
    v6 = CFSTR("Background");
  v7 = (NSString *)objc_msgSend(v5, "initWithString:", v6);
  rampingScanType = self->_rampingScanType;
  self->_rampingScanType = v7;

  self->_specifiedFields |= 0x200uLL;
}

- (void)setScanUpdateType:(int64_t)a3
{
  self->_scanUpdateType = a3;
  self->_specifiedFields |= 0x400uLL;
}

- (void)setLiveServerCatalogOnly:(BOOL)a3
{
  self->_liveServerCatalogOnly = a3;
  self->_specifiedFields |= 0x800uLL;
}

- (BOOL)shouldScanForMajorUpdates
{
  int64_t v3;

  if (-[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"))
  {
    v3 = -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType");
    if (v3 != 1)
      LOBYTE(v3) = -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType") == 2;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)shouldScanForMinorUpdates
{
  int64_t v3;

  if (-[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"))
  {
    v3 = -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType");
    if (v3 != 1)
      LOBYTE(v3) = -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType") == 3;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicySoftwareUpdateScan)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicySoftwareUpdateScan *v5;
  uint64_t v6;
  NSString *sessionId;
  uint64_t v8;
  NSString *rampingScanType;
  NSDictionary *additionalServerParams;
  NSDictionary *additionalOptions;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUCorePolicySoftwareUpdateScan;
  v5 = -[SUCorePolicySoftwareUpdateScan init](&v13, sel_init);
  if (v5)
  {
    v5->_specifiedFields = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedFields"));
    v5->_allowsCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowsCellular"));
    v5->_discretionary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Discretionary"));
    v5->_disableUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableUI"));
    v5->_requiresPowerPluggedIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RequiresPowerPluggedIn"));
    v5->_restrictToIncremental = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RestrictToIncremental"));
    v5->_restrictToFull = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RestrictToFull"));
    v5->_allowSameVersion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowSameVersion"));
    v5->_downloadTimeoutSecs = objc_msgSend(v4, "decodeIntForKey:", CFSTR("DownloadTimeoutSecs"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SessionID"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RampingScanType"));
    v8 = objc_claimAutoreleasedReturnValue();
    rampingScanType = v5->_rampingScanType;
    v5->_rampingScanType = (NSString *)v8;

    v5->_scanUpdateType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ScanUpdateType"));
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
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields"), CFSTR("SpecifiedFields"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan allowsCellular](self, "allowsCellular"), CFSTR("AllowsCellular"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan discretionary](self, "discretionary"), CFSTR("Discretionary"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan disableUI](self, "disableUI"), CFSTR("DisableUI"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"), CFSTR("RequiresPowerPluggedIn"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan restrictToIncremental](self, "restrictToIncremental"), CFSTR("RestrictToIncremental"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan restrictToFull](self, "restrictToFull"), CFSTR("RestrictToFull"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan allowSameVersion](self, "allowSameVersion"), CFSTR("AllowSameVersion"));
  objc_msgSend(v6, "encodeInt:forKey:", -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs"), CFSTR("DownloadTimeoutSecs"));
  -[SUCorePolicySoftwareUpdateScan sessionId](self, "sessionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("SessionID"));

  -[SUCorePolicySoftwareUpdateScan rampingScanType](self, "rampingScanType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("RampingScanType"));

  objc_msgSend(v6, "encodeInt64:forKey:", -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"), CFSTR("ScanUpdateType"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](self, "liveServerCatalogOnly"), CFSTR("LiveServerCatalogOnly"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAllowsCellular:", -[SUCorePolicySoftwareUpdateScan allowsCellular](self, "allowsCellular"));
  objc_msgSend(v5, "setDiscretionary:", -[SUCorePolicySoftwareUpdateScan discretionary](self, "discretionary"));
  objc_msgSend(v5, "setDisableUI:", -[SUCorePolicySoftwareUpdateScan disableUI](self, "disableUI"));
  objc_msgSend(v5, "setRequiresPowerPluggedIn:", -[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  objc_msgSend(v5, "setRestrictToIncremental:", -[SUCorePolicySoftwareUpdateScan restrictToIncremental](self, "restrictToIncremental"));
  objc_msgSend(v5, "setRestrictToFull:", -[SUCorePolicySoftwareUpdateScan restrictToFull](self, "restrictToFull"));
  objc_msgSend(v5, "setAllowSameVersion:", -[SUCorePolicySoftwareUpdateScan allowSameVersion](self, "allowSameVersion"));
  objc_msgSend(v5, "setDownloadTimeoutSecs:", -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  -[SUCorePolicySoftwareUpdateScan sessionId](self, "sessionId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setSessionId:", v7);

  -[SUCorePolicySoftwareUpdateScan rampingScanType](self, "rampingScanType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setRampingScanType:", v9);

  objc_msgSend(v5, "setScanUpdateType:", -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"));
  objc_msgSend(v5, "setLiveServerCatalogOnly:", -[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](self, "liveServerCatalogOnly"));
  -[SUCorePolicySoftwareUpdateScan additionalServerParams](self, "additionalServerParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalServerParams:", v11);

  -[SUCorePolicySoftwareUpdateScan additionalOptions](self, "additionalOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v13);

  objc_msgSend(v5, "setSpecifiedFields:", -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicySoftwareUpdateScan *v4;
  SUCorePolicySoftwareUpdateScan *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  BOOL v22;
  uint64_t v24;

  v4 = (SUCorePolicySoftwareUpdateScan *)a3;
  if (v4 == self)
  {
    v22 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicySoftwareUpdateScan allowsCellular](v5, "allowsCellular");
      if (v6 == -[SUCorePolicySoftwareUpdateScan allowsCellular](self, "allowsCellular")
        && (v7 = -[SUCorePolicySoftwareUpdateScan discretionary](v5, "discretionary"),
            v7 == -[SUCorePolicySoftwareUpdateScan discretionary](self, "discretionary"))
        && (v8 = -[SUCorePolicySoftwareUpdateScan disableUI](v5, "disableUI"),
            v8 == -[SUCorePolicySoftwareUpdateScan disableUI](self, "disableUI"))
        && (v9 = -[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](v5, "requiresPowerPluggedIn"),
            v9 == -[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
        && (v10 = -[SUCorePolicySoftwareUpdateScan restrictToIncremental](v5, "restrictToIncremental"),
            v10 == -[SUCorePolicySoftwareUpdateScan restrictToIncremental](self, "restrictToIncremental"))
        && (v11 = -[SUCorePolicySoftwareUpdateScan restrictToFull](v5, "restrictToFull"),
            v11 == -[SUCorePolicySoftwareUpdateScan restrictToFull](self, "restrictToFull"))
        && (v12 = -[SUCorePolicySoftwareUpdateScan allowSameVersion](v5, "allowSameVersion"),
            v12 == -[SUCorePolicySoftwareUpdateScan allowSameVersion](self, "allowSameVersion"))
        && (v13 = -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](v5, "downloadTimeoutSecs"),
            v13 == -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs")))
      {
        v14 = (void *)MEMORY[0x1E0DA8920];
        -[SUCorePolicySoftwareUpdateScan sessionId](v5, "sessionId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCorePolicySoftwareUpdateScan sessionId](self, "sessionId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "stringIsEqual:to:", v15, v16))
        {
          v17 = (void *)MEMORY[0x1E0DA8920];
          -[SUCorePolicySoftwareUpdateScan rampingScanType](v5, "rampingScanType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCorePolicySoftwareUpdateScan rampingScanType](self, "rampingScanType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "stringIsEqual:to:", v18, v19)
            && (v20 = -[SUCorePolicySoftwareUpdateScan scanUpdateType](v5, "scanUpdateType"),
                v20 == -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"))
            && (v21 = -[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](v5, "liveServerCatalogOnly"),
                v21 == -[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](self, "liveServerCatalogOnly")))
          {
            v24 = -[SUCorePolicySoftwareUpdateScan specifiedFields](v5, "specifiedFields");
            v22 = v24 == -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields");
          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  int64_t v37;
  id v38;

  v38 = objc_alloc(MEMORY[0x1E0CB3940]);
  v37 = -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields");
  if (-[SUCorePolicySoftwareUpdateScan allowsCellular](self, "allowsCellular"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v36 = v3;
  if (-[SUCorePolicySoftwareUpdateScan discretionary](self, "discretionary"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v35 = v4;
  if (-[SUCorePolicySoftwareUpdateScan disableUI](self, "disableUI"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v34 = v5;
  if (-[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v33 = v6;
  if (-[SUCorePolicySoftwareUpdateScan restrictToIncremental](self, "restrictToIncremental"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v31 = v7;
  if (-[SUCorePolicySoftwareUpdateScan restrictToFull](self, "restrictToFull"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v30 = v8;
  if (-[SUCorePolicySoftwareUpdateScan allowSameVersion](self, "allowSameVersion"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v29 = v9;
  v28 = -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs");
  -[SUCorePolicySoftwareUpdateScan sessionId](self, "sessionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SUCorePolicySoftwareUpdateScan sessionId](self, "sessionId");
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("none");
  }
  -[SUCorePolicySoftwareUpdateScan rampingScanType](self, "rampingScanType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v11;
  if (v12)
  {
    -[SUCorePolicySoftwareUpdateScan rampingScanType](self, "rampingScanType");
    v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = CFSTR("none");
  }
  +[SUCorePolicySoftwareUpdateScan nameForScanUpdateType:](SUCorePolicySoftwareUpdateScan, "nameForScanUpdateType:", -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](self, "liveServerCatalogOnly"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  -[SUCorePolicySoftwareUpdateScan additionalServerParams](self, "additionalServerParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SUCorePolicySoftwareUpdateScan additionalServerParams](self, "additionalServerParams");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("none");
  }
  -[SUCorePolicySoftwareUpdateScan additionalOptions](self, "additionalOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SUCorePolicySoftwareUpdateScan additionalOptions](self, "additionalOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    v20 = (__CFString *)v13;
    v24 = v13;
    v21 = (__CFString *)v32;
    v22 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("SUCorePolicySoftwareUpdateScan(\n        specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|UIDisabled:%@|requiresPowerPluggedIn:%@|\n        restrictToIncremental:%@|restrictToFull:%@|allowSameVersion:%@|\n        downloadTimeoutSecs:%d|sessionId:%@|rampingScanType:%@|scanUpdateType:%@|liveServerCatalogOnly:%@|\n        additionalServerParams:%@|\n        additionalOptions:%@)"), v37, v36, v35, v34, v33, v31, v30, v29, v28, v32, v24, v14, v26, v17, v19);

  }
  else
  {
    v27 = v15;
    v20 = (__CFString *)v13;
    v25 = v13;
    v21 = (__CFString *)v32;
    v22 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("SUCorePolicySoftwareUpdateScan(\n        specifiedFields:0x%llX|allowsCellular:%@|discretionary:%@|UIDisabled:%@|requiresPowerPluggedIn:%@|\n        restrictToIncremental:%@|restrictToFull:%@|allowSameVersion:%@|\n        downloadTimeoutSecs:%d|sessionId:%@|rampingScanType:%@|scanUpdateType:%@|liveServerCatalogOnly:%@|\n        additionalServerParams:%@|\n        additionalOptions:%@)"), v37, v36, v35, v34, v33, v31, v30, v29, v28, v32, v25, v14, v27, v17, CFSTR("none"));
  }

  if (v16)
  if (v12)

  if (v10)
  return v22;
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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;

  if (-[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|fields=%llX"), -[SUCorePolicySoftwareUpdateScan specifiedFields](self, "specifiedFields"));
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicySoftwareUpdateScan allowsCellular](self, "allowsCellular"))
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("|cellular"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (-[SUCorePolicySoftwareUpdateScan discretionary](self, "discretionary"))
    v6 = CFSTR("|discretionary");
  else
    v6 = CFSTR("|non-discretionary");
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicySoftwareUpdateScan disableUI](self, "disableUI"))
    v8 = CFSTR("|UIDisabled");
  else
    v8 = CFSTR("|UIEnabled");
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SUCorePolicySoftwareUpdateScan requiresPowerPluggedIn](self, "requiresPowerPluggedIn"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|power"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (-[SUCorePolicySoftwareUpdateScan restrictToIncremental](self, "restrictToIncremental"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|restrictIncr"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  if (-[SUCorePolicySoftwareUpdateScan restrictToFull](self, "restrictToFull"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|restrictFull"));
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (-[SUCorePolicySoftwareUpdateScan allowSameVersion](self, "allowSameVersion"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|allowSame"));
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  if (-[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs") != 120)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("|catalogTimeout=%d"), -[SUCorePolicySoftwareUpdateScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
    objc_msgSend(v9, "stringByAppendingString:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  -[SUCorePolicySoftwareUpdateScan sessionId](self, "sessionId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicySoftwareUpdateScan sessionId](self, "sessionId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("|sesionID=%@"), v18);
    objc_msgSend(v9, "stringByAppendingString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v20;
  }
  -[SUCorePolicySoftwareUpdateScan rampingScanType](self, "rampingScanType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicySoftwareUpdateScan rampingScanType](self, "rampingScanType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("|rampScan=%@"), v23);
    objc_msgSend(v9, "stringByAppendingString:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v25;
  }
  if (-[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"))
  {
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[SUCorePolicySoftwareUpdateScan nameForScanUpdateType:](SUCorePolicySoftwareUpdateScan, "nameForScanUpdateType:", -[SUCorePolicySoftwareUpdateScan scanUpdateType](self, "scanUpdateType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("|scanUpdateType=%@"), v27);
    objc_msgSend(v9, "stringByAppendingString:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v29;
  }
  if (-[SUCorePolicySoftwareUpdateScan liveServerCatalogOnly](self, "liveServerCatalogOnly"))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR("|liveServerCatalogOnly"));
    v30 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v30;
  }
  -[SUCorePolicySoftwareUpdateScan additionalServerParams](self, "additionalServerParams");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    v32 = CFSTR("|withServerParams");
  else
    v32 = CFSTR("|noServerParams");
  objc_msgSend(v9, "stringByAppendingString:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicySoftwareUpdateScan additionalOptions](self, "additionalOptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    v35 = CFSTR("|withAdditionalOptions");
  else
    v35 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v33, "stringByAppendingString:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v36, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v36, "stringByAppendingString:", CFSTR("|"));
    v37 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v37;
  }
  return v36;
}

+ (id)nameForScanUpdateType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1EA878C78[a3];
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

- (BOOL)restrictToIncremental
{
  return self->_restrictToIncremental;
}

- (BOOL)restrictToFull
{
  return self->_restrictToFull;
}

- (BOOL)allowSameVersion
{
  return self->_allowSameVersion;
}

- (int)downloadTimeoutSecs
{
  return self->_downloadTimeoutSecs;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (NSString)rampingScanType
{
  return self->_rampingScanType;
}

- (int64_t)scanUpdateType
{
  return self->_scanUpdateType;
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
  objc_storeStrong((id *)&self->_rampingScanType, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
}

@end
