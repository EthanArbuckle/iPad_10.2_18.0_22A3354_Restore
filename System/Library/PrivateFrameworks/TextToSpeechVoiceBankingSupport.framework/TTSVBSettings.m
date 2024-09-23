@implementation TTSVBSettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance_Shared;
}

void __31__TTSVBSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_Shared;
  sharedInstance_Shared = v0;

}

- (TTSVBSettings)init
{
  TTSVBSettings *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TTSVBSettings;
  v2 = -[TTSVBSettings init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Accessibility"));
    -[TTSVBSettings setDefaults:](v2, "setDefaults:", v3);

  }
  return v2;
}

- (BOOL)allowAppUsage
{
  void *v2;
  char v3;

  -[TTSVBSettings defaults](self, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kTTSVBAllowVoiceBankingAppUsage"));

  return v3;
}

- (void)setAllowAppUsage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TTSVBSettings defaults](self, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("kTTSVBAllowVoiceBankingAppUsage"));

}

- (BOOL)allowAppUsageDuringCalls
{
  return 1;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
