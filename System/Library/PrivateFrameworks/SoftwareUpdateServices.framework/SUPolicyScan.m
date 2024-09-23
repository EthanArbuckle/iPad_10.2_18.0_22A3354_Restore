@implementation SUPolicyScan

- (SUPolicyScan)init
{
  return -[SUPolicyScan initWithScanOptions:](self, "initWithScanOptions:", 0);
}

- (SUPolicyScan)initWithScanOptions:(id)a3
{
  id v4;
  SUPolicyScan *v5;
  SUPolicyScan *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUPolicyScan;
  v5 = -[SUPolicyScan init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SUPolicyScan setScanOptions:](v5, "setScanOptions:", v4);

  return v6;
}

- (NSString)assetType
{
  return 0;
}

- (NSString)scanType
{
  void *v2;
  int v3;
  __CFString **v4;
  NSString *v5;

  -[SUPolicyScan scanOptions](self, "scanOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isForced");
  v4 = &kSUScanTypeForeground;
  if (!v3)
    v4 = &kSUScanTypeBackground;
  v5 = *v4;

  return v5;
}

- (BOOL)restrictToIncremental
{
  return 0;
}

- (BOOL)restrictToFull
{
  void *v2;
  char v3;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceFullReplacement");

  return v3;
}

- (BOOL)allowSameVersion
{
  void *v2;
  char v3;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowSameBuildUpdates");

  return v3;
}

- (int)downloadTimeoutSecs
{
  if (+[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal"))
    return 60;
  else
    return 30;
}

- (NSString)sessionID
{
  void *v2;
  void *v3;

  -[SUPolicyScan scanOptions](self, "scanOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUPolicyScan assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyScan _stringForBool:](self, "_stringForBool:", -[SUPolicy discretionary](self, "discretionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyScan _stringForBool:](self, "_stringForBool:", -[SUPolicy allowsCellular](self, "allowsCellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyScan _stringForBool:](self, "_stringForBool:", -[SUPolicy requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyScan _stringForBool:](self, "_stringForBool:", -[SUPolicyScan restrictToIncremental](self, "restrictToIncremental"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyScan _stringForBool:](self, "_stringForBool:", -[SUPolicyScan restrictToFull](self, "restrictToFull"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyScan _stringForBool:](self, "_stringForBool:", -[SUPolicyScan allowSameVersion](self, "allowSameVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicyScan sessionID](self, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            assetType:%@\n            discretionary: %@\n            allowsCellular: %@\n            requiresPowerPluggedIn: %@\n            restrictToIncremental: %@\n            restrictToFull: %@\n            allowSameVersion: %@\n            sessionID: %@\n            downloadTimeoutSecs: %d\n"), v4, v5, v6, v7, v8, v9, v10, v11, -[SUPolicyScan downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
  objc_storeStrong((id *)&self->_scanOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOptions, 0);
}

@end
