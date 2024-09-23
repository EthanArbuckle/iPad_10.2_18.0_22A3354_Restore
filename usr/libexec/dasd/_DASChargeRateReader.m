@implementation _DASChargeRateReader

- (_DASChargeRateReader)init
{
  _DASChargeRateReader *v2;
  uint64_t v3;
  _CDContext *context;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASChargeRateReader;
  v2 = -[_DASChargeRateReader init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDContext *)v3;

  }
  return v2;
}

- (id)currentValue
{
  _CDContext *context;
  void *v3;
  void *v4;

  context = self->_context;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3));

  return v4;
}

- (id)lastModifiedDate
{
  return 0;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
