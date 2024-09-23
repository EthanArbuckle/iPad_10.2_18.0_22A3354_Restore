@implementation TTS_AXDialectMapWrapper

- (TTS_AXDialectMapWrapper)initWithDialectMap:(id)a3
{
  id v5;
  TTS_AXDialectMapWrapper *v6;
  TTS_AXDialectMapWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTS_AXDialectMapWrapper;
  v6 = -[TTS_AXDialectMapWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dialectMap, a3);

  return v7;
}

- (NSString)languageNameInCurrentLocale
{
  void *v2;
  void *v3;

  -[TTS_AXDialectMapWrapper dialectMap](self, "dialectMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageNameInCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)languageNameAndLocaleInCurrentLocale
{
  void *v2;
  void *v3;

  -[TTS_AXDialectMapWrapper dialectMap](self, "dialectMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageNameAndLocaleInCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)languageNameInNativeLocale
{
  void *v2;
  void *v3;

  -[TTS_AXDialectMapWrapper dialectMap](self, "dialectMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageNameInNativeLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localeNameInCurrentLocale
{
  void *v2;
  void *v3;

  -[TTS_AXDialectMapWrapper dialectMap](self, "dialectMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeNameInCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (AXDialectMap)dialectMap
{
  return self->_dialectMap;
}

- (void)setDialectMap:(id)a3
{
  objc_storeStrong((id *)&self->_dialectMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialectMap, 0);
}

@end
