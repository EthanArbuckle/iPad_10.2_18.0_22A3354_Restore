@implementation WeatherWindSpeedFormatter

+ (id)convenienceFormatter
{
  if (convenienceFormatter_onceToken != -1)
    dispatch_once(&convenienceFormatter_onceToken, &__block_literal_global_3);
  return (id)convenienceFormatter_convenienceFormatter;
}

void __49__WeatherWindSpeedFormatter_convenienceFormatter__block_invoke()
{
  WeatherWindSpeedFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(WeatherWindSpeedFormatter);
  v1 = (void *)convenienceFormatter_convenienceFormatter;
  convenienceFormatter_convenienceFormatter = (uint64_t)v0;

}

- (WeatherWindSpeedFormatter)init
{
  WeatherWindSpeedFormatter *v2;
  uint64_t v3;
  NSLocale *locale;
  WeatherWindSpeedFormatter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WeatherWindSpeedFormatter;
  v2 = -[WeatherWindSpeedFormatter init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    v5 = v2;
  }

  return v2;
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
    -[WeatherWindSpeedFormatter formattedStringForSpeed:direction:](self, "formattedStringForSpeed:direction:");
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

- (id)formattedStringForSpeed:(float)a3 direction:(float)a4
{
  return -[WeatherWindSpeedFormatter formattedStringForSpeed:direction:shortDescription:](self, "formattedStringForSpeed:direction:shortDescription:", 1);
}

- (id)formattedStringForSpeed:(float)a3 direction:(float)a4 shortDescription:(BOOL)a5
{
  float v5;
  __CFString *v6;
  _BOOL8 v7;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;

  v5 = a4;
  a4 = 1.1755e-38;
  if (a3 == 1.1755e-38)
  {
    v6 = CFSTR("--");
  }
  else
  {
    v7 = a5;
    -[WeatherWindSpeedFormatter speedByConvertingToUserUnit:](self, "speedByConvertingToUserUnit:", a3, *(double *)&a4);
    *(float *)&v9 = v9;
    *(float *)&v10 = v5;
    -[WeatherWindSpeedFormatter templateStringForSpeed:direction:](self, "templateStringForSpeed:direction:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v12 = v5;
    -[WeatherWindSpeedFormatter stringForWindDirection:shortDescription:](self, "stringForWindDirection:shortDescription:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v13);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)attributedFormattedStringForSpeed:(float)a3 direction:(float)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t v28;

  -[WeatherWindSpeedFormatter directionSubstringAttributes](self, "directionSubstringAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(float *)&v8 = a3;
    *(float *)&v9 = a4;
    -[WeatherWindSpeedFormatter templateStringForSpeed:direction:](self, "templateStringForSpeed:direction:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = a3;
    *(float *)&v12 = a4;
    -[WeatherWindSpeedFormatter formattedStringForSpeed:direction:](self, "formattedStringForSpeed:direction:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v14 = a4;
    -[WeatherWindSpeedFormatter stringForWindDirection:shortDescription:](self, "stringForWindDirection:shortDescription:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v13);
    v17 = objc_msgSend(v10, "rangeOfString:", CFSTR("%@"));
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = v17;
      v19 = objc_msgSend(v15, "length");
      -[WeatherWindSpeedFormatter directionSubstringAttributes](self, "directionSubstringAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __73__WeatherWindSpeedFormatter_attributedFormattedStringForSpeed_direction___block_invoke;
      v25[3] = &unk_24DD9D060;
      v26 = v16;
      v27 = v18;
      v28 = v19;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);

    }
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x24BDD1458]);
    *(float *)&v22 = a3;
    *(float *)&v23 = a4;
    -[WeatherWindSpeedFormatter formattedStringForSpeed:direction:](self, "formattedStringForSpeed:direction:", v22, v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v21, "initWithString:", v10);
  }

  return v16;
}

uint64_t __73__WeatherWindSpeedFormatter_attributedFormattedStringForSpeed_direction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)templateStringForSpeed:(float)a3 direction:(float)a4
{
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  *(float *)&v6 = a4;
  -[WeatherWindSpeedFormatter stringForWindDirection:shortDescription:](self, "stringForWindDirection:shortDescription:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  -[WeatherWindSpeedFormatter stringForWindSpeed:](self, "stringForWindSpeed:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("WIND_DETAIL_FORMAT_WITH_DIRECTION"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, CFSTR("%@"), v9);
  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("WIND_DETAIL_FORMAT_WITHOUT_DIRECTION"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v9, v16);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)stringForWindSpeed:(float)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  int32_t pDestLength;
  UErrorCode pErrorCode;
  char dest[100];
  UChar src[100];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  pErrorCode = U_ZERO_ERROR;
  -[WeatherWindSpeedFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 4);
    uameasfmt_open();
    -[WeatherWindSpeedFormatter windSpeedUnit](self, "windSpeedUnit");
    uameasfmt_format();
    pDestLength = 0;
    u_strToUTF8(dest, 100, &pDestLength, src, -1, &pErrorCode);
    uameasfmt_close();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", dest, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (v8)
    {
      v11 = v8;
    }
    else
    {
      *(float *)&v9 = a3;
      -[WeatherWindSpeedFormatter fallbackStringForWindSpeed:](self, "fallbackStringForWindSpeed:", v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

  }
  else
  {
    *(float *)&v7 = a3;
    -[WeatherWindSpeedFormatter fallbackStringForWindSpeed:](self, "fallbackStringForWindSpeed:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)fallbackStringForWindSpeed:(float)a3
{
  void *v3;
  double v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  -[WeatherWindSpeedFormatter fallbackUnitString](self, "fallbackUnitString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%.0f %@"), *(_QWORD *)&v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fallbackUnitString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("km/h"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stringForWindDirection:(float)a3 shortDescription:(BOOL)a4
{
  _BOOL4 v5;
  unint64_t v6;
  void *v7;

  if (a3 < 0.0 || a3 == 1.1755e-38)
  {
    v7 = 0;
  }
  else
  {
    v5 = a4;
    v6 = CardinalDirectionFromAngle(a3);
    CardinalDirectionStringForIndex(v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)speedStringByConvertingToUserUnits:(float)a3
{
  uint64_t v3;

  -[WeatherWindSpeedFormatter speedByConvertingToUserUnit:](self, "speedByConvertingToUserUnit:", a3);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f"), v3);
}

- (int)windSpeedUnit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  -[WeatherWindSpeedFormatter locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 2305;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("CN"), CFSTR("JP"), CFSTR("KR"), CFSTR("RU"), CFSTR("SE"), CFSTR("TW"), CFSTR("NO"), CFSTR("FI"), CFSTR("DK"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherWindSpeedFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WeatherWindSpeedFormatter locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDBCB60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue"))
  {
    -[WeatherWindSpeedFormatter locale](self, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("en_GB")))
      v11 = 2306;
    else
      v11 = 2305;

  }
  else
  {
    v11 = 2306;
  }

  if (v6 && (objc_msgSend(v4, "containsObject:", v6) & 1) != 0)
    v11 = 2304;

  return v11;
}

- (double)speedByConvertingToUserUnit:(double)a3
{
  int v4;
  double v5;
  float v6;

  v4 = -[WeatherWindSpeedFormatter windSpeedUnit](self, "windSpeedUnit");
  if (v4 != 2305)
  {
    if (v4 == 2304)
      v5 = 0.278;
    else
      v5 = 0.621;
    a3 = a3 * v5;
  }
  v6 = a3;
  return roundf(v6);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)directionSubstringAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDirectionSubstringAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionSubstringAttributes, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
