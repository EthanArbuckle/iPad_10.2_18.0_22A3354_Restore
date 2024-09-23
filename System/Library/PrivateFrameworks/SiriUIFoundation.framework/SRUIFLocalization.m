@implementation SRUIFLocalization

- (SRUIFLocalization)initWithBundle:(id)a3 tableName:(id)a4
{
  id v6;
  id v7;
  SRUIFLocalization *v8;
  NSBundle *v9;
  NSBundle *bundle;
  const __CFString *v11;
  NSString *tableName;
  uint64_t v13;
  AFLocalization *localization;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SRUIFLocalization;
  v8 = -[SRUIFLocalization init](&v16, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (NSBundle *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }
    bundle = v8->_bundle;
    v8->_bundle = v9;

    if (v7)
      v11 = (const __CFString *)v7;
    else
      v11 = CFSTR("Localizable");
    tableName = v8->_tableName;
    v8->_tableName = &v11->isa;

    objc_msgSend(MEMORY[0x24BE09200], "sharedInstance");
    v13 = objc_claimAutoreleasedReturnValue();
    localization = v8->_localization;
    v8->_localization = (AFLocalization *)v13;

  }
  return v8;
}

- (SRUIFLocalization)init
{
  void *v3;
  SRUIFLocalization *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRUIFLocalization initWithBundle:tableName:](self, "initWithBundle:tableName:", v3, CFSTR("Localizable"));

  return v4;
}

- (id)localizedStringWithSiriLanguageForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BE09270];
  v5 = a3;
  objc_msgSend(v4, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRUIFLocalization localizedStringForLanguageCode:key:](self, "localizedStringForLanguageCode:key:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedStringForLanguageCode:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFLocalization localizedStringForLanguageCode:key:].cold.1(v9);
    goto LABEL_6;
  }
  -[AFLocalization localizedStringForKey:table:bundle:languageCode:](self->_localization, "localizedStringForKey:table:bundle:languageCode:", v7, self->_tableName, self->_bundle, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
LABEL_6:
    v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localization, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

- (void)localizedStringForLanguageCode:(os_log_t)log key:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SRUIFLocalization localizedStringForLanguageCode:key:]";
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s Language code not provided", (uint8_t *)&v1, 0xCu);
}

@end
