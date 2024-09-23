@implementation WFAggregateForecastResponse

- (WFAggregateForecastResponse)initWithCoder:(id)a3
{
  id v4;
  WFAggregateForecastResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFAggregateForecastResponse;
  v5 = -[WFResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("WFAggregateForecastResponseHourlyForecastsKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAggregateForecastResponse setForecasts:](v5, "setForecasts:", v9);

    -[WFAggregateForecastResponse setResponseWasFromCache:](v5, "setResponseWasFromCache:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WFAggregateForecastResponseWasFromCacheKey")));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAggregateForecastResponse;
  v4 = a3;
  -[WFResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAggregateForecastResponse forecasts](self, "forecasts", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFAggregateForecastResponseHourlyForecastsKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAggregateForecastResponse responseWasFromCache](self, "responseWasFromCache"), CFSTR("WFAggregateForecastResponseWasFromCacheKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[WFAggregateForecastResponse forecasts](self, "forecasts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);
  objc_msgSend(v4, "setForecasts:", v7);

  return v4;
}

- (NSArray)forecasts
{
  return self->_forecasts;
}

- (void)setForecasts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecasts, 0);
}

@end
