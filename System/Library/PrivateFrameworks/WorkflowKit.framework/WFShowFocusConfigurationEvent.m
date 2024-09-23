@implementation WFShowFocusConfigurationEvent

- (WFShowFocusConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4
{
  id v6;
  id v7;
  WFShowFocusConfigurationEvent *v8;
  uint64_t v9;
  NSString *appBundleIdentifier;
  uint64_t v11;
  NSString *intentType;
  WFShowFocusConfigurationEvent *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFShowFocusConfigurationEvent;
  v8 = -[WFShowFocusConfigurationEvent init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    appBundleIdentifier = v8->_appBundleIdentifier;
    v8->_appBundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    intentType = v8->_intentType;
    v8->_intentType = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (WFShowFocusConfigurationEvent)initWithSystemFilterType:(id)a3
{
  id v4;
  WFShowFocusConfigurationEvent *v5;
  uint64_t v6;
  NSString *systemFilterType;
  WFShowFocusConfigurationEvent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFShowFocusConfigurationEvent;
  v5 = -[WFShowFocusConfigurationEvent init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    systemFilterType = v5->_systemFilterType;
    v5->_systemFilterType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)systemFilterType
{
  return self->_systemFilterType;
}

- (void)setSystemFilterType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFilterType, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

@end
