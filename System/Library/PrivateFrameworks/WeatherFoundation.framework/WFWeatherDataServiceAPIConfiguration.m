@implementation WFWeatherDataServiceAPIConfiguration

- (WFWeatherDataServiceAPIConfiguration)initWithVersion:(id)a3 environment:(id)a4
{
  id v6;
  WFWeatherDataServiceAPIConfiguration *v7;
  void *v8;

  v6 = a4;
  v7 = -[WFWeatherDataServiceAPIConfiguration init](self, "init");
  if (v7)
  {
    -[WFWeatherDataServiceAPIConfiguration setForecastRequestFormatterClass:](v7, "setForecastRequestFormatterClass:", objc_opt_class());
    v8 = (void *)objc_opt_new();
    -[WFWeatherDataServiceAPIConfiguration setForecastParser:](v7, "setForecastParser:", v8);

    objc_storeStrong((id *)&v7->_environment, a4);
  }

  return v7;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;

  if (!-[WFWeatherDataServiceAPIConfiguration forecastRequestFormatterClass](self, "forecastRequestFormatterClass"))
    return 0;
  -[WFWeatherDataServiceAPIConfiguration forecastParser](self, "forecastParser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)hostUrl
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = -[WFWeatherDataServiceAPIConfiguration forecastRequestFormatterClass](self, "forecastRequestFormatterClass");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFWeatherDataServiceAPIConfiguration environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class hostURLForEnvironment:](v3, "hostURLForEnvironment:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[objc_class hostURLForService](v3, "hostURLForService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 date:(id)a6 error:(id *)a7 rules:(id)a8 options:(id)a9
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;

  v11 = *(_QWORD *)&a5;
  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a4;
  v19 = -[WFWeatherDataServiceAPIConfiguration forecastRequestFormatterClass](self, "forecastRequestFormatterClass");
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class forecastRequest:forLocation:withUnits:locale:date:rules:options:](v19, "forecastRequest:forLocation:withUnits:locale:date:rules:options:", a3, v18, v11, v20, v17, v16, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10
{
  uint64_t v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v12 = *(_QWORD *)&a6;
  v17 = a10;
  v18 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  -[WFWeatherDataServiceAPIConfiguration forecastParser](self, "forecastParser");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "parseForecastData:types:location:units:locale:date:error:rules:", v21, a3, v20, v12, v19, v18, a9, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[objc_class aqiRequestForScaleNamed:language:](-[WFWeatherDataServiceAPIConfiguration forecastRequestFormatterClass](self, "forecastRequestFormatterClass"), "aqiRequestForScaleNamed:language:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parseAQIScaleNamed:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[WFWeatherDataServiceAPIConfiguration forecastParser](self, "forecastParser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parseAQIScaleNamed:data:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFWeatherDataServiceAPIConfiguration *v4;
  void *v5;

  v4 = objc_alloc_init(WFWeatherDataServiceAPIConfiguration);
  -[WFWeatherDataServiceAPIConfiguration setForecastRequestFormatterClass:](v4, "setForecastRequestFormatterClass:", -[WFWeatherDataServiceAPIConfiguration forecastRequestFormatterClass](self, "forecastRequestFormatterClass"));
  -[WFWeatherDataServiceAPIConfiguration forecastParser](self, "forecastParser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherDataServiceAPIConfiguration setForecastParser:](v4, "setForecastParser:", v5);

  return v4;
}

- (Class)forecastRequestFormatterClass
{
  return self->_forecastRequestFormatterClass;
}

- (void)setForecastRequestFormatterClass:(Class)a3
{
  objc_storeStrong((id *)&self->_forecastRequestFormatterClass, a3);
}

- (WFForecastDataParser)forecastParser
{
  return self->_forecastParser;
}

- (void)setForecastParser:(id)a3
{
  objc_storeStrong((id *)&self->_forecastParser, a3);
}

- (NSString)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_forecastParser, 0);
  objc_storeStrong((id *)&self->_forecastRequestFormatterClass, 0);
}

@end
