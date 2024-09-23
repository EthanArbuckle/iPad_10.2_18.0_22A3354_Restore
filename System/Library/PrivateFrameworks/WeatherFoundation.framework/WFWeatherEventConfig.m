@implementation WFWeatherEventConfig

- (WFWeatherEventConfig)initWithDictionary:(id)a3 defaulEnabled:(BOOL)a4
{
  id v6;
  WFWeatherEventConfig *v7;
  WFWeatherEventConfig *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWeatherEventConfig;
  v7 = -[WFWeatherEventConfig init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_enabled = a4;
    objc_msgSend(v6, "numberForKey:", CFSTR("ios"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      a4 = objc_msgSend(v9, "BOOLValue");
    v8->_enabled = a4;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_enabled;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
