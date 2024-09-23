@implementation WFShowWidgetConfigurationEvent

- (WFShowWidgetConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4 sizeClass:(id)a5 interactive:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  WFShowWidgetConfigurationEvent *v13;
  uint64_t v14;
  NSString *appBundleIdentifier;
  uint64_t v16;
  NSString *intentType;
  uint64_t v18;
  NSString *sizeClass;
  WFShowWidgetConfigurationEvent *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFShowWidgetConfigurationEvent;
  v13 = -[WFShowWidgetConfigurationEvent init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    appBundleIdentifier = v13->_appBundleIdentifier;
    v13->_appBundleIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    intentType = v13->_intentType;
    v13->_intentType = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    sizeClass = v13->_sizeClass;
    v13->_sizeClass = (NSString *)v18;

    v13->_isInteractive = a6;
    v20 = v13;
  }

  return v13;
}

- (WFShowWidgetConfigurationEvent)initWithAppBundleIdentifier:(id)a3 intentType:(id)a4 sizeClass:(id)a5
{
  return -[WFShowWidgetConfigurationEvent initWithAppBundleIdentifier:intentType:sizeClass:interactive:](self, "initWithAppBundleIdentifier:intentType:sizeClass:interactive:", a3, a4, a5, 0);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

@end
