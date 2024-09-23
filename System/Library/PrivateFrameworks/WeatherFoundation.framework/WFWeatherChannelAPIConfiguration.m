@implementation WFWeatherChannelAPIConfiguration

- (WFWeatherChannelAPIConfiguration)initWithVersion:(id)a3
{
  id v4;
  WFWeatherChannelAPIConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[WFWeatherChannelAPIConfiguration init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v7 = objc_opt_class();
    +[WFWeatherChannelRequestFormatterV2 hostURLForService](WFWeatherChannelRequestFormatterV2, "hostURLForService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("v3"), "isEqualToString:", v4))
    {
      v9 = objc_opt_new();

      v7 = objc_opt_class();
      +[WFWeatherChannelRequestFormatterV3 hostURLForService](WFWeatherChannelRequestFormatterV3, "hostURLForService");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
      v8 = (void *)v10;
    }
    -[WFWeatherChannelAPIConfiguration setDefaultForecastFormatter:](v5, "setDefaultForecastFormatter:", v7);
    -[WFWeatherChannelAPIConfiguration setDefaultForecastParser:](v5, "setDefaultForecastParser:", v6);
    v11 = (void *)objc_opt_new();
    -[WFWeatherChannelAPIConfiguration setRequestFormatterForForecastType:](v5, "setRequestFormatterForForecastType:", v11);

    v12 = (void *)objc_opt_new();
    -[WFWeatherChannelAPIConfiguration setRequestParserForForecastType:](v5, "setRequestParserForForecastType:", v12);

    -[WFWeatherChannelAPIConfiguration setRequestFormatter:forForecastType:](v5, "setRequestFormatter:forForecastType:", objc_opt_class(), 64);
    v13 = (void *)objc_opt_new();
    -[WFWeatherChannelAPIConfiguration setRequestParser:forForecastType:](v5, "setRequestParser:forForecastType:", v13, 64);

    -[WFWeatherChannelAPIConfiguration setRequestFormatter:forForecastType:](v5, "setRequestFormatter:forForecastType:", objc_opt_class(), 128);
    v14 = (void *)objc_opt_new();
    -[WFWeatherChannelAPIConfiguration setRequestParser:forForecastType:](v5, "setRequestParser:forForecastType:", v14, 128);

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
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;

  v11 = *(_QWORD *)&a5;
  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a4;
  -[WFWeatherChannelAPIConfiguration requestFormatterForForecastType](self, "requestFormatterForForecastType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (objc_class *)objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  if (!v21)
    v21 = -[WFWeatherChannelAPIConfiguration defaultForecastRequestFormatterClass](self, "defaultForecastRequestFormatterClass");

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class forecastRequest:forLocation:withUnits:locale:date:rules:options:](v21, "forecastRequest:forLocation:withUnits:locale:date:rules:options:", a3, v18, v11, v22, v17, v16, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;

  v16 = a10;
  v17 = a8;
  v18 = a7;
  v19 = a5;
  v20 = a4;
  -[WFWeatherChannelAPIConfiguration requestParserForForecastType](self, "requestParserForForecastType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    -[WFWeatherChannelAPIConfiguration defaultForecastParser](self, "defaultForecastParser");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  objc_msgSend(v26, "parseForecastData:types:location:locale:date:error:rules:", v20, a3, v19, v18, v17, a9, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)setRequestFormatter:(Class)a3 forForecastType:(unint64_t)a4
{
  void *v6;
  id v7;

  -[WFWeatherChannelAPIConfiguration requestFormatterForForecastType](self, "requestFormatterForForecastType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v6);

}

- (void)setRequestParser:(id)a3 forForecastType:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[WFWeatherChannelAPIConfiguration requestParserForForecastType](self, "requestParserForForecastType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)hostUrl
{
  return (id)-[objc_class hostURLForService](-[WFWeatherChannelAPIConfiguration defaultForecastRequestFormatterClass](self, "defaultForecastRequestFormatterClass"), "hostURLForService");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[WFWeatherChannelAPIConfiguration requestParserForForecastType](self, "requestParserForForecastType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setRequestParserForForecastType:", v6);

  -[WFWeatherChannelAPIConfiguration requestFormatterForForecastType](self, "requestFormatterForForecastType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setRequestFormatterForForecastType:", v8);

  objc_msgSend(v4, "setDefaultForecastRequestFormatterClass:", -[WFWeatherChannelAPIConfiguration defaultForecastRequestFormatterClass](self, "defaultForecastRequestFormatterClass"));
  -[WFWeatherChannelAPIConfiguration defaultForecastParser](self, "defaultForecastParser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultForecastParser:", v9);

  return v4;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[WFWeatherChannelAPIConfiguration requestFormatterForForecastType](self, "requestFormatterForForecastType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[WFWeatherChannelAPIConfiguration requestParserForForecastType](self, "requestParserForForecastType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[WFWeatherChannelAPIConfiguration requestFormatterForForecastType](self, "requestFormatterForForecastType");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherChannelAPIConfiguration requestParserForForecastType](self, "requestParserForForecastType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToArray:", v8)
        && -[WFWeatherChannelAPIConfiguration defaultForecastRequestFormatterClass](self, "defaultForecastRequestFormatterClass"))
      {
        -[WFWeatherChannelAPIConfiguration defaultForecastParser](self, "defaultForecastParser");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 != 0;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)requestFormatterForForecastType
{
  return self->_requestFormatterForForecastType;
}

- (void)setRequestFormatterForForecastType:(id)a3
{
  objc_storeStrong((id *)&self->_requestFormatterForForecastType, a3);
}

- (NSMutableDictionary)requestParserForForecastType
{
  return self->_requestParserForForecastType;
}

- (void)setRequestParserForForecastType:(id)a3
{
  objc_storeStrong((id *)&self->_requestParserForForecastType, a3);
}

- (Class)defaultForecastRequestFormatterClass
{
  return self->_defaultForecastRequestFormatterClass;
}

- (void)setDefaultForecastRequestFormatterClass:(Class)a3
{
  objc_storeStrong((id *)&self->_defaultForecastRequestFormatterClass, a3);
}

- (WFForecastDataParser)defaultForecastParser
{
  return self->_defaultForecastParser;
}

- (void)setDefaultForecastParser:(id)a3
{
  objc_storeStrong((id *)&self->_defaultForecastParser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultForecastParser, 0);
  objc_storeStrong((id *)&self->_defaultForecastRequestFormatterClass, 0);
  objc_storeStrong((id *)&self->_requestParserForForecastType, 0);
  objc_storeStrong((id *)&self->_requestFormatterForForecastType, 0);
}

@end
