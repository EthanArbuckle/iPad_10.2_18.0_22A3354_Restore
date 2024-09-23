@implementation WFTemperatureFormatter

+ (id)temperatureFormatterWithInputUnit:(int)a3 outputUnit:(int)a4
{
  WFTemperatureFormatter *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 0;
  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    if (a4)
    {
      v6 = *(_QWORD *)&a3;
      v4 = objc_alloc_init(WFTemperatureFormatter);
      -[WFTemperatureFormatter setInputUnit:](v4, "setInputUnit:", v6);
      -[WFTemperatureFormatter setOutputUnit:](v4, "setOutputUnit:", v5);
    }
  }
  return v4;
}

- (WFTemperatureFormatter)init
{
  WFTemperatureFormatter *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFTemperatureFormatter;
  v2 = -[WFTemperatureFormatter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTemperatureFormatter setLocale:](v2, "setLocale:", v3);

    -[WFTemperatureFormatter setInputUnit:](v2, "setInputUnit:", 2);
    -[WFTemperatureFormatter setOutputUnit:](v2, "setOutputUnit:", 2);
    -[WFTemperatureFormatter setFallbackTemperatureString:](v2, "setFallbackTemperatureString:", CFSTR("--"));
    -[WFTemperatureFormatter setMaximumFractionDigits:](v2, "setMaximumFractionDigits:", 0);
    -[WFTemperatureFormatter setRoundingMode:](v2, "setRoundingMode:", 0);
    -[WFTemperatureFormatter setSymbolType:](v2, "setSymbolType:", 1);
    v2->_includeDegreeSymbol = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__localeDidChangeNotification_, *MEMORY[0x24BDBCA70], 0);

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[WFTemperatureFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setInputUnit:", -[WFTemperatureFormatter inputUnit](self, "inputUnit"));
  objc_msgSend(v4, "setOutputUnit:", -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
  -[WFTemperatureFormatter fallbackTemperatureString](self, "fallbackTemperatureString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFallbackTemperatureString:", v6);

  objc_msgSend(v4, "setMaximumFractionDigits:", -[WFTemperatureFormatter maximumFractionDigits](self, "maximumFractionDigits"));
  objc_msgSend(v4, "setRoundingMode:", -[WFTemperatureFormatter roundingMode](self, "roundingMode"));
  objc_msgSend(v4, "setSymbolType:", -[WFTemperatureFormatter symbolType](self, "symbolType"));
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[WFTemperatureFormatter setMeasureFormatter:](self, "setMeasureFormatter:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WFTemperatureFormatter;
  -[WFTemperatureFormatter dealloc](&v3, sel_dealloc);
}

- (void)setLocale:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_locale) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    -[WFTemperatureFormatter setMeasureFormatter:](self, "setMeasureFormatter:", 0);
  }

}

- (NSString)fallbackTemperatureString
{
  NSString *v3;
  uint64_t v4;
  NSString *v5;

  v3 = self->_fallbackTemperatureString;
  if (!self->_includeDegreeSymbol || !-[WFTemperatureFormatter symbolType](self, "symbolType"))
  {
    -[NSString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("°"), &stru_24CCA55E8);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (-[WFTemperatureFormatter symbolType](self, "symbolType") == 2)
  {
    -[NSString stringWithTemperatureUnit:](v3, "stringWithTemperatureUnit:", -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = (NSString *)v4;

    v3 = v5;
  }
  return v3;
}

- (void)setRoundingMode:(unint64_t)a3
{
  if (self->_roundingMode != a3)
  {
    self->_roundingMode = a3;
    -[WFTemperatureFormatter setMeasureFormatter:](self, "setMeasureFormatter:", 0);
  }
}

- (void)setMaximumFractionDigits:(unint64_t)a3
{
  if (self->_maximumFractionDigits != a3)
  {
    self->_maximumFractionDigits = a3;
    -[WFTemperatureFormatter setMeasureFormatter:](self, "setMeasureFormatter:", 0);
  }
}

- (UAMeasureFormat)measureFormatter
{
  UAMeasureFormat *result;
  void *v4;
  id v5;

  result = self->_measureFormatter;
  if (!result)
  {
    -[WFTemperatureFormatter locale](self, "locale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "cStringUsingEncoding:", 4);

    unum_open();
    -[WFTemperatureFormatter maximumFractionDigits](self, "maximumFractionDigits");
    unum_setAttribute();
    -[WFTemperatureFormatter roundingMode](self, "roundingMode");
    unum_setAttribute();
    result = (UAMeasureFormat *)uameasfmt_open();
    self->_measureFormatter = result;
  }
  return result;
}

- (void)setMeasureFormatter:(UAMeasureFormat *)a3
{
  UAMeasureFormat *measureFormatter;

  measureFormatter = self->_measureFormatter;
  if (measureFormatter != a3)
  {
    if (!a3)
    {
      if (measureFormatter)
        uameasfmt_close();
      a3 = 0;
    }
    self->_measureFormatter = a3;
  }
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFTemperatureFormatter formattedTemperatureFromString:](self, "formattedTemperatureFromString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = (void *)v5;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WFTemperatureFormatter formattedStringFromTemperature:](self, "formattedStringFromTemperature:", v4);
    else
      -[WFTemperatureFormatter fallbackTemperatureString](self, "fallbackTemperatureString");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTemperatureFormatter formattedTemperatureFromString:](self, "formattedTemperatureFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v7;
}

- (id)formattedStringFromTemperature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(v4, "temperatureForUnit:", -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTemperatureFormatter _formatTemperatureValue:toUnit:](self, "_formatTemperatureValue:toUnit:", v5, -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFTemperatureFormatter fallbackTemperatureString](self, "fallbackTemperatureString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)formattedTemperatureFromString:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  int v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length") && !objc_msgSend(v4, "isEqualToString:", CFSTR("--")))
  {
    objc_msgSend(v4, "doubleValue");
    v7 = v6;
    v8 = -[WFTemperatureFormatter inputUnit](self, "inputUnit");
    v9 = -[WFTemperatureFormatter outputUnit](self, "outputUnit");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", WFConvertTemperature(v8, v9, v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTemperatureFormatter _formatTemperatureValue:toUnit:](self, "_formatTemperatureValue:toUnit:", v10, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFTemperatureFormatter fallbackTemperatureString](self, "fallbackTemperatureString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_formatTemperatureValue:(id)a3 toUnit:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  UErrorCode pErrorCode;
  char dest[100];
  UChar src[100];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!-[WFTemperatureFormatter measureFormatter](self, "measureFormatter"))
  {
    -[WFTemperatureFormatter fallbackTemperatureString](self, "fallbackTemperatureString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  pErrorCode = U_ZERO_ERROR;
  objc_msgSend(v5, "doubleValue");
  uameasfmt_format();
  u_strToUTF8(dest, 100, 0, src, -1, &pErrorCode);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", dest, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[WFTemperatureFormatter fallbackTemperatureString](self, "fallbackTemperatureString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (self->_includeDegreeSymbol && -[WFTemperatureFormatter symbolType](self, "symbolType"))
  {
    if (-[WFTemperatureFormatter symbolType](self, "symbolType") != 2)
      goto LABEL_12;
    objc_msgSend(v9, "stringWithTemperatureUnit:", -[WFTemperatureFormatter outputUnit](self, "outputUnit"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("°"), &stru_24CCA55E8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  v9 = v11;
LABEL_12:
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("-0")))
  {
    objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_24CCA55E8);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
LABEL_14:

  return v9;
}

- (void)_localeDidChangeNotification:(id)a3
{
  -[WFTemperatureFormatter setMeasureFormatter:](self, "setMeasureFormatter:", 0);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setFallbackTemperatureString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)inputUnit
{
  return self->_inputUnit;
}

- (void)setInputUnit:(int)a3
{
  self->_inputUnit = a3;
}

- (int)outputUnit
{
  return self->_outputUnit;
}

- (void)setOutputUnit:(int)a3
{
  self->_outputUnit = a3;
}

- (unint64_t)roundingMode
{
  return self->_roundingMode;
}

- (unint64_t)maximumFractionDigits
{
  return self->_maximumFractionDigits;
}

- (int)symbolType
{
  return self->_symbolType;
}

- (void)setSymbolType:(int)a3
{
  self->_symbolType = a3;
}

- (BOOL)includeDegreeSymbol
{
  return self->_includeDegreeSymbol;
}

- (void)setIncludeDegreeSymbol:(BOOL)a3
{
  self->_includeDegreeSymbol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTemperatureString, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
