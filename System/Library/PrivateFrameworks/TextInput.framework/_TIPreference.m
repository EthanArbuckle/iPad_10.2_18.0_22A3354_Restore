@implementation _TIPreference

- (id)currentValue
{
  return self->_currentValue;
}

- (void)setIsWatchSync:(BOOL)a3
{
  self->_isWatchSync = a3;
}

- (void)setIsCloudSetting:(BOOL)a3
{
  self->_isCloudSetting = a3;
}

+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v15, "setKey:", v14);

  objc_msgSend(v15, "setDomain:", v13);
  objc_msgSend(v15, "setDefaultValue:", v12);

  objc_msgSend(v15, "setFallbackKey:", v11);
  objc_msgSend(v15, "setIsAnalyzed:", v7);
  return v15;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)setIsAnalyzed:(BOOL)a3
{
  self->_isAnalyzed = a3;
}

- (void)setFallbackKey:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackKey, a3);
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong(&self->_defaultValue, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setCurrentValue:(id)a3
{
  objc_storeStrong(&self->_currentValue, a3);
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)fallbackKey
{
  return self->_fallbackKey;
}

- (NSString)previousValueKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_TIPreference key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_previousValue"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)changedAtKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_TIPreference key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_changedAt"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)buildAtLastAnalysis
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_TIPreference key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_buildAtLastAnalysis"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)buildAtChangeKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_TIPreference key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_buildAtChange"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)approxDateOfBuildInstall
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_TIPreference key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_approxDateOfBuildInstall"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)analyzedAtKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[_TIPreference key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@_analyzedAt"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5
{
  return (id)objc_msgSend(a1, "preferenceWithKey:domain:defaultValue:fallbackKey:", a3, a4, a5, 0);
}

+ (id)preferenceWithKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6
{
  return (id)objc_msgSend(a1, "preferenceWithKey:domain:defaultValue:fallbackKey:isAnalyzed:", a3, a4, a5, a6, 0);
}

- (BOOL)isAnalyzed
{
  return self->_isAnalyzed;
}

- (BOOL)isCloudSetting
{
  return self->_isCloudSetting;
}

- (BOOL)isWatchSync
{
  return self->_isWatchSync;
}

- (NSString)approxDateOfBuildInstallKey
{
  return self->_approxDateOfBuildInstallKey;
}

- (NSString)buildAtLastAnalysisKey
{
  return self->_buildAtLastAnalysisKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildAtLastAnalysisKey, 0);
  objc_storeStrong((id *)&self->_approxDateOfBuildInstallKey, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_fallbackKey, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
