@implementation WeatherPrecipitationFormatter

+ (id)convenienceFormatter
{
  if (convenienceFormatter_onceToken_0 != -1)
    dispatch_once(&convenienceFormatter_onceToken_0, &__block_literal_global_4);
  return (id)convenienceFormatter_precipitationFormatter;
}

void __53__WeatherPrecipitationFormatter_convenienceFormatter__block_invoke()
{
  WeatherPrecipitationFormatter *v0;
  void *v1;

  if (!convenienceFormatter_precipitationFormatter)
  {
    v0 = objc_alloc_init(WeatherPrecipitationFormatter);
    v1 = (void *)convenienceFormatter_precipitationFormatter;
    convenienceFormatter_precipitationFormatter = (uint64_t)v0;

  }
}

- (WeatherPrecipitationFormatter)init
{
  WeatherPrecipitationFormatter *v2;
  uint64_t v3;
  NSLocale *locale;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeatherPrecipitationFormatter;
  v2 = -[NSLengthFormatter init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    -[NSLengthFormatter numberFormatter](v2, "numberFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaximumFractionDigits:", 1);

  }
  return v2;
}

- (void)setLocale:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_locale, a3);
  v5 = a3;
  -[NSLengthFormatter numberFormatter](self, "numberFormatter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v5);

}

- (id)stringFromCentimeters:(double)a3
{
  return -[WeatherPrecipitationFormatter stringFromDistance:isDataMetric:](self, "stringFromDistance:isDataMetric:", 1, a3);
}

- (id)stringFromInches:(double)a3
{
  return -[WeatherPrecipitationFormatter stringFromDistance:isDataMetric:](self, "stringFromDistance:isDataMetric:", 0, a3);
}

- (id)stringFromDistance:(double)a3 isDataMetric:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v7;
  int64_t v8;
  uint64_t v9;

  v4 = a4;
  v7 = CFSTR("--");
  if (1.1755e-38 != a3)
  {
    v8 = -[WeatherPrecipitationFormatter precipitationUnit](self, "precipitationUnit", 1.1755e-38);
    if (v4)
      -[WeatherPrecipitationFormatter convertDistanceInMetric:to:](self, "convertDistanceInMetric:to:", v8, a3);
    else
      -[WeatherPrecipitationFormatter convertDistanceInImperial:to:](self, "convertDistanceInImperial:to:", v8, a3);
    -[NSLengthFormatter stringFromValue:unit:](self, "stringFromValue:unit:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v9;
  }
  return v7;
}

- (double)convertDistanceInImperial:(double)result to:(int64_t)a4
{
  if (a4 != 1281)
  {
    result = result * 2.54;
    if (a4 == 8)
      return result * 10.0;
  }
  return result;
}

- (double)convertDistanceInMetric:(double)result to:(int64_t)a4
{
  if (a4 == 8)
    return result * 10.0;
  if (a4 == 1281)
    return result / 2.54;
  return result;
}

- (int64_t)precipitationUnit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;

  -[WeatherPrecipitationFormatter locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 9;
  -[WeatherPrecipitationFormatter locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WeatherPrecipitationFormatter locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    if (objc_msgSend(&unk_24DDB11E8, "containsObject:", v5))
      v9 = 8;
    else
      v9 = 9;
  }
  else
  {
    v9 = 1281;
  }

  return v9;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "doubleValue");
    -[WeatherPrecipitationFormatter stringFromCentimeters:](self, "stringFromCentimeters:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
