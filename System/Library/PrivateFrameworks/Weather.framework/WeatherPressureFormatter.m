@implementation WeatherPressureFormatter

+ (id)convenienceFormatter
{
  if (convenienceFormatter_onceToken_2 != -1)
    dispatch_once(&convenienceFormatter_onceToken_2, &__block_literal_global_23);
  return (id)convenienceFormatter_pressureFormatter;
}

void __48__WeatherPressureFormatter_convenienceFormatter__block_invoke()
{
  WeatherPressureFormatter *v0;
  void *v1;

  if (!convenienceFormatter_pressureFormatter)
  {
    v0 = objc_alloc_init(WeatherPressureFormatter);
    v1 = (void *)convenienceFormatter_pressureFormatter;
    convenienceFormatter_pressureFormatter = (uint64_t)v0;

  }
}

- (WeatherPressureFormatter)init
{
  WeatherPressureFormatter *v2;
  uint64_t v3;
  NSLocale *locale;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeatherPressureFormatter;
  v2 = -[WeatherPressureFormatter init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    numberFormatter = -[WeatherPressureFormatter createNumberFormatter](v2, "createNumberFormatter");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_resetFormatter, *MEMORY[0x24BDBCA70], 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  unum_close();
  v3.receiver = self;
  v3.super_class = (Class)WeatherPressureFormatter;
  -[WeatherPressureFormatter dealloc](&v3, sel_dealloc);
}

- (void)resetFormatter
{
  unum_close();
  numberFormatter = -[WeatherPressureFormatter createNumberFormatter](self, "createNumberFormatter");
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
  -[WeatherPressureFormatter resetFormatter](self, "resetFormatter");
}

- (id)stringFromPressure:(float)a3 isDataMetric:(BOOL)a4
{
  if (a4)
    -[WeatherPressureFormatter stringFromMillibars:](self, "stringFromMillibars:");
  else
    -[WeatherPressureFormatter stringFromInchesHG:](self, "stringFromInchesHG:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringFromMillibars:(float)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;

  v5 = -[WeatherPressureFormatter pressureUnit](self, "pressureUnit");
  *(float *)&v6 = a3;
  -[WeatherPressureFormatter convertMBarPressure:toUnit:](self, "convertMBarPressure:toUnit:", v5, v6);
  -[WeatherPressureFormatter formatStringForPressure:inUnit:](self, "formatStringForPressure:inUnit:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    *(float *)&v8 = a3;
    -[WeatherPressureFormatter fallbackStringForPressure:](self, "fallbackStringForPressure:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)stringFromInchesHG:(float)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  void *v11;

  v5 = -[WeatherPressureFormatter pressureUnit](self, "pressureUnit");
  *(float *)&v6 = a3;
  -[WeatherPressureFormatter convertInchesHGPressure:toUnit:](self, "convertInchesHGPressure:toUnit:", v5, v6);
  -[WeatherPressureFormatter formatStringForPressure:inUnit:](self, "formatStringForPressure:inUnit:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    *(float *)&v8 = a3;
    -[WeatherPressureFormatter convertInchesHGPressure:toUnit:](self, "convertInchesHGPressure:toUnit:", 2050, v8);
    -[WeatherPressureFormatter fallbackStringForPressure:](self, "fallbackStringForPressure:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)formatStringForPressure:(float)a3 inUnit:(int)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int32_t pDestLength;
  UErrorCode pErrorCode;
  uint8_t buf[4];
  UErrorCode v14;
  char dest[100];
  UChar src[100];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  pErrorCode = U_ZERO_ERROR;
  -[WeatherPressureFormatter locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    unum_clone();
    uameasfmt_open();
    uameasfmt_format();
    pDestLength = 0;
    u_strToUTF8(dest, 100, &pDestLength, src, -1, &pErrorCode);
    uameasfmt_close();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", dest);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && pErrorCode < U_ILLEGAL_ARGUMENT_ERROR)
    {
      v8 = v6;
    }
    else
    {
      WALogForCategory(1);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v14 = pErrorCode;
        _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "#Formatter Something went wrong - returning nil. Error %i", buf, 8u);
      }

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fallbackStringForPressure:(float)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (int)a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HECTOPASCAL"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", CFSTR("%d %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)createNumberFormatter
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WeatherPressureFormatter locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "UTF8String");
  numberFormatter = unum_open();
  unum_setAttribute();
  -[WeatherPressureFormatter pressureUnit](self, "pressureUnit");
  unum_setAttribute();
  v6 = (void *)numberFormatter;

  return v6;
}

- (int)pressureUnit
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;

  -[WeatherPressureFormatter locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 2048;
  if (v3)
  {
    -[WeatherPressureFormatter locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCB60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    -[WeatherPressureFormatter locale](self, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(&unk_24DDB1620, "containsObject:", v9);
    if (v7)
      v11 = 2048;
    else
      v11 = 2049;
    if (v10)
      v4 = 2051;
    else
      v4 = v11;

  }
  return v4;
}

- (float)convertMBarPressure:(float)result toUnit:(int)a4
{
  float v4;

  if (a4 == 2051)
  {
    v4 = 1.3332;
  }
  else
  {
    if (a4 != 2049)
      return result;
    v4 = 33.864;
  }
  return result / v4;
}

- (float)convertInchesHGPressure:(float)result toUnit:(int)a4
{
  float v4;

  if (a4 == 2051)
  {
    v4 = 25.4;
  }
  else
  {
    if (a4 != 2048)
      return result;
    v4 = 33.864;
  }
  return result * v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "floatValue");
    -[WeatherPressureFormatter stringFromMillibars:](self, "stringFromMillibars:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
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
