@implementation WFDailyForecastRequest

- (WFDailyForecastRequest)initWithLocation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WFDailyForecastRequest *v9;
  WFDailyForecastRequest *v10;
  WFDailyForecastRequest *v11;
  uint64_t v12;
  NSLocale *locale;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)WFDailyForecastRequest;
    v10 = -[WFTask init](&v15, sel_init);
    v11 = v10;
    if (v10)
    {
      -[WFAggregateForecastRequest setLocation:](v10, "setLocation:", v6);
      -[WFAggregateForecastRequest setCompletionHandler:](v11, "setCompletionHandler:", v8);
      objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
      v12 = objc_claimAutoreleasedReturnValue();
      locale = v11->_locale;
      v11->_locale = (NSLocale *)v12;

    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[WFAggregateForecastRequest location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, location = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFAggregateForecastRequest location](self, "location");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WFDailyForecastRequest locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTask identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dailyForecastForLocation:locale:taskIdentifier:", v7, v5, v6);

}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
