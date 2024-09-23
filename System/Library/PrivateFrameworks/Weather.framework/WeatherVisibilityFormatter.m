@implementation WeatherVisibilityFormatter

+ (id)convenienceFormatter
{
  void *v2;

  v2 = (void *)convenienceFormatter_distanceFormatter;
  if (!convenienceFormatter_distanceFormatter)
  {
    if (convenienceFormatter_onceToken_1 != -1)
      dispatch_once(&convenienceFormatter_onceToken_1, &__block_literal_global_14);
    v2 = (void *)convenienceFormatter_distanceFormatter;
  }
  return v2;
}

void __50__WeatherVisibilityFormatter_convenienceFormatter__block_invoke()
{
  WeatherVisibilityFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(WeatherVisibilityFormatter);
  v1 = (void *)convenienceFormatter_distanceFormatter;
  convenienceFormatter_distanceFormatter = (uint64_t)v0;

}

- (WeatherVisibilityFormatter)init
{
  WeatherVisibilityFormatter *v2;
  uint64_t v3;
  NSLocale *locale;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeatherVisibilityFormatter;
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

- (id)stringFromKilometers:(double)a3
{
  return -[WeatherVisibilityFormatter stringFromDistance:isDataMetric:](self, "stringFromDistance:isDataMetric:", 1, a3);
}

- (id)stringFromMiles:(double)a3
{
  return -[WeatherVisibilityFormatter stringFromDistance:isDataMetric:](self, "stringFromDistance:isDataMetric:", 0, a3);
}

- (id)stringFromDistance:(double)a3 isDataMetric:(BOOL)a4
{
  objc_super v5;

  if (!a4)
    a3 = a3 * 1.60934;
  v5.receiver = self;
  v5.super_class = (Class)WeatherVisibilityFormatter;
  -[NSLengthFormatter stringFromMeters:](&v5, sel_stringFromMeters_, a3 * 1000.0);
  return (id)objc_claimAutoreleasedReturnValue();
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
