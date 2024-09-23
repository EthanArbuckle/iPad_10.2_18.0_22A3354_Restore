@implementation WFResponseParsingRules

+ (BOOL)aqiEnabledByRules:(id)a3 forLocation:(id)a4
{
  id v5;
  void *v6;
  char v7;

  if (!a3)
    return 1;
  v5 = a3;
  objc_msgSend(a4, "countryAbbreviation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "aqiEnabledForCountryCode:", v6);

  return v7;
}

- (WFResponseParsingRules)initWithSettings:(id)a3
{
  id v5;
  WFResponseParsingRules *v6;
  WFResponseParsingRules *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFResponseParsingRules;
  v6 = -[WFResponseParsingRules init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (BOOL)aqiEnabledForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[WFResponseParsingRules settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aqiEnabledCountryCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_24CCC1358;
  }
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (WFSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
