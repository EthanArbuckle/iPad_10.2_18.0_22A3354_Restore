@implementation TSKRulerUnits

+ (id)instance
{
  void *v2;
  uint64_t v3;
  id result;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKRulerUnits instance]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKRulerUnits.m"), 68, CFSTR("Trying to acquire TSKRulerUnits singleton from a secondary thread - this class is not thread safe."));
  }
  result = (id)instance_instance;
  if (!instance_instance)
  {
    result = objc_alloc_init(TSKRulerUnits);
    instance_instance = (uint64_t)result;
  }
  return result;
}

- (TSKRulerUnits)init
{
  TSKRulerUnits *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSKRulerUnits;
  v2 = -[TSKRulerUnits init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2->_rulerUnits = objc_msgSend(v3, "integerForKey:", TSKDefaultsRulerUnits);
    v2->_showRulerAsPercentage = objc_msgSend(v3, "BOOLForKey:", TSKDefaultsShowRulerAsPercentage);
    v2->_centerRulerOrigin = objc_msgSend(v3, "BOOLForKey:", TSKDefaultsCenterRulerOrigin);
    v2->_preferredPixelUnit = 2;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKRulerUnits;
  -[TSKRulerUnits dealloc](&v3, sel_dealloc);
}

- (void)setRulerUnits:(int)a3
{
  void *v4;
  void *v5;

  if (self->_rulerUnits != a3)
  {
    self->_rulerUnits = a3;

    self->_formatter = 0;
    self->_lenientFormatter = 0;

    self->_highPrecisionFormatter = 0;
    self->_lenientHighPrecisionFormatter = 0;
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    objc_msgSend(v4, "setInteger:forKey:", self->_rulerUnits, TSKDefaultsRulerUnits);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "postNotificationName:object:", TSKRulerUnitsDidChangeNotification, self);
  }
}

- (void)setShowRulerAsPercentage:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_showRulerAsPercentage != a3)
  {
    self->_showRulerAsPercentage = a3;
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    objc_msgSend(v4, "setBool:forKey:", self->_showRulerAsPercentage, TSKDefaultsShowRulerAsPercentage);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "postNotificationName:object:", TSKShowRulerAsPercentageDidChangeNotification, self);
  }
}

- (void)setCenterRulerOrigin:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_centerRulerOrigin != a3)
  {
    self->_centerRulerOrigin = a3;
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    objc_msgSend(v4, "setBool:forKey:", self->_centerRulerOrigin, TSKDefaultsCenterRulerOrigin);
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v5, "postNotificationName:object:", TSKCenterRulerOriginDidChangeNotification, self);
  }
}

- (double)convertRulerUnitsToPoints:(double)a3
{
  uint64_t rulerUnits;
  double v4;

  rulerUnits = self->_rulerUnits;
  v4 = 1.0;
  if (rulerUnits <= 3)
    v4 = dbl_217C27AC8[rulerUnits];
  return v4 * a3;
}

- (double)convertPointsToRulerUnits:(double)a3
{
  uint64_t rulerUnits;
  double v4;

  rulerUnits = self->_rulerUnits;
  v4 = 1.0;
  if (rulerUnits <= 3)
    v4 = dbl_217C27AC8[rulerUnits];
  return a3 / v4;
}

- (id)formatter:(BOOL)a3 lenient:(BOOL)a4
{
  _BOOL4 v4;
  int rulerUnits;
  int v7;
  uint64_t v8;
  id result;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a4;
  if (!a3)
  {
    if (a4)
    {
LABEL_6:
      v7 = 0;
      v8 = 32;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  rulerUnits = self->_rulerUnits;
  if (a4)
  {
    if (!rulerUnits)
    {
      v7 = 1;
      v8 = 48;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (rulerUnits)
  {
LABEL_8:
    v7 = 0;
    v8 = 24;
    goto LABEL_10;
  }
  v7 = 1;
  v8 = 40;
LABEL_10:
  result = *(Class *)((char *)&self->super.isa + v8);
  if (!result)
  {
    v10 = self->_rulerUnits;
    if (v7)
      v11 = 4;
    else
      v11 = 2;
    if (v10)
      v11 = 0;
    if (v10 == 1)
      v12 = 2;
    else
      v12 = v11;
    result = (id)objc_msgSend((id)objc_opt_class(), "formatterForRulerUnits:decimalPlaces:trailingZeros:lenient:", self->_rulerUnits, v12, 0, a4);
    v13 = 32;
    if (v7)
      v13 = 48;
    v14 = 24;
    if (v7)
      v14 = 40;
    if (!v4)
      v13 = v14;
    *(Class *)((char *)&self->super.isa + v13) = (Class)result;
  }
  return result;
}

- (id)compatibleRulerUnits
{
  uint64_t rulerUnits;

  rulerUnits = self->_rulerUnits;
  if (rulerUnits > 4)
    return 0;
  else
    return off_24D82A780[rulerUnits];
}

- (id)localizedCompatibleRulerUnits
{
  uint64_t rulerUnits;

  rulerUnits = self->_rulerUnits;
  if (rulerUnits > 4)
    return 0;
  else
    return (id)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", off_24D82A780[rulerUnits], &stru_24D82FEB0, CFSTR("TSKit"));
}

+ (id)formatterForRulerUnits:(int)a3 decimalPlaces:(int)a4 trailingZeros:(BOOL)a5 lenient:(BOOL)a6
{
  TSKPicaFormatter *v6;
  _BOOL8 v7;
  void *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  if (a3 == 3)
  {
    v6 = -[TSKPicaFormatter initWithPicaSeparator:]([TSKPicaFormatter alloc], "initWithPicaSeparator:", objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("p"), &stru_24D82FEB0, CFSTR("TSKit")));
  }
  else
  {
    v7 = a6;
    if (a4 < 1)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", CFSTR("0"));
    }
    else if (a5)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%%.%df"), *(_QWORD *)&a4);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v10, 0);

    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("0."));
      v12 = a4 + 1;
      do
      {
        objc_msgSend(v11, "appendString:", CFSTR("#"));
        --v12;
      }
      while (v12 > 1);
    }
    v13 = CFSTR("%@");
    v14 = CFSTR("0");
    switch(a3)
    {
      case 0:
        v14 = (const __CFString *)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("0 in"), &stru_24D82FEB0, CFSTR("TSKit"));
        v15 = (void *)TSKBundle();
        v16 = CFSTR("%@ in");
        goto LABEL_15;
      case 1:
        v14 = (const __CFString *)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("0 cm"), &stru_24D82FEB0, CFSTR("TSKit"));
        v15 = (void *)TSKBundle();
        v16 = CFSTR("%@ cm");
        goto LABEL_15;
      case 2:
        v14 = (const __CFString *)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("0 pt"), &stru_24D82FEB0, CFSTR("TSKit"));
        v15 = (void *)TSKBundle();
        v16 = CFSTR("%@ pt");
        goto LABEL_15;
      case 4:
        v14 = (const __CFString *)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("0 px"), &stru_24D82FEB0, CFSTR("TSKit"));
        v15 = (void *)TSKBundle();
        v16 = CFSTR("%@ px");
LABEL_15:
        v13 = (const __CFString *)objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_24D82FEB0, CFSTR("TSKit"));
        break;
      case 5:
        break;
      default:
        v14 = &stru_24D82FEB0;
        v13 = &stru_24D82FEB0;
        break;
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v13, v11);
    v6 = (TSKPicaFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    -[TSKPicaFormatter setPositiveFormat:](v6, "setPositiveFormat:", v17);
    -[TSKPicaFormatter setNegativeFormat:](v6, "setNegativeFormat:", objc_msgSend(CFSTR("-"), "stringByAppendingString:", v17));
    -[TSKPicaFormatter setZeroSymbol:](v6, "setZeroSymbol:", v14);
    v18 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    -[TSKPicaFormatter setDecimalSeparator:](v6, "setDecimalSeparator:", objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDBCB00]));
    -[TSKPicaFormatter setLenient:](v6, "setLenient:", v7);

  }
  return v6;
}

- (int)rulerUnits
{
  return self->_rulerUnits;
}

- (BOOL)showRulerAsPercentage
{
  return self->_showRulerAsPercentage;
}

- (BOOL)centerRulerOrigin
{
  return self->_centerRulerOrigin;
}

- (int)preferredPixelUnit
{
  return self->_preferredPixelUnit;
}

- (void)setPreferredPixelUnit:(int)a3
{
  self->_preferredPixelUnit = a3;
}

@end
