@implementation WFSwitchParameter

- (WFSwitchParameter)initWithDefinition:(id)a3
{
  WFSwitchParameter *v3;
  WFSwitchParameter *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *localizedOnDisplayName;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *localizedOffDisplayName;
  uint64_t v14;
  WFSwitchParameter *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFSwitchParameter;
  v3 = -[WFParameter initWithDefinition:](&v17, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFParameter definition](v3, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("OnDisplayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      localizedOnDisplayName = v4->_localizedOnDisplayName;
      v4->_localizedOnDisplayName = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "localize");
      else
        +[WFSwitchParameter defaultLocalizedOnDisplayName](WFSwitchParameter, "defaultLocalizedOnDisplayName");
      v9 = objc_claimAutoreleasedReturnValue();
      localizedOnDisplayName = v4->_localizedOnDisplayName;
      v4->_localizedOnDisplayName = (NSString *)v9;
    }

    -[WFParameter definition](v4, "definition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("OffDisplayName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      localizedOffDisplayName = v4->_localizedOffDisplayName;
      v4->_localizedOffDisplayName = v12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v11, "localize");
      else
        +[WFSwitchParameter defaultLocalizedOffDisplayName](WFSwitchParameter, "defaultLocalizedOffDisplayName");
      v14 = objc_claimAutoreleasedReturnValue();
      localizedOffDisplayName = v4->_localizedOffDisplayName;
      v4->_localizedOffDisplayName = (NSString *)v14;
    }

    v15 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedOffDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedOnDisplayName, 0);
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (NSString)localizedOnDisplayName
{
  return self->_localizedOnDisplayName;
}

- (NSString)localizedOffDisplayName
{
  return self->_localizedOffDisplayName;
}

+ (NSString)defaultLocalizedOnDisplayName
{
  return (NSString *)WFLocalizedStringWithKey(CFSTR("On (Switch display name)"), CFSTR("On"));
}

+ (NSString)defaultLocalizedOffDisplayName
{
  return (NSString *)WFLocalizedStringWithKey(CFSTR("Off (Switch display name)"), CFSTR("Off"));
}

@end
