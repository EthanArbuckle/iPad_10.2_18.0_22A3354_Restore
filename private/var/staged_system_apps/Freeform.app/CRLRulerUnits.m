@implementation CRLRulerUnits

+ (id)instance
{
  void *v2;
  void *v3;
  void *v4;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012340A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF4840();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012340C0);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLRulerUnits instance]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLRulerUnits.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 64, 0, "Trying to acquire CRLRulerUnits singleton from a secondary thread - this class is not thread safe.");

  }
  if (qword_101414D40 != -1)
    dispatch_once(&qword_101414D40, &stru_1012340E0);
  return (id)qword_101414D48;
}

- (CRLRulerUnits)init
{
  CRLRulerUnits *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLRulerUnits;
  v2 = -[CRLRulerUnits init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v2->_rulerUnits = (unint64_t)objc_msgSend(v3, "integerForKey:", CFSTR("CRLRulerUnitTypeUserDefault"));
    v2->_showRulerAsPercentage = objc_msgSend(v3, "BOOLForKey:", CFSTR("ShowRulerAsPercentage"));
    v2->_centerRulerOrigin = objc_msgSend(v3, "BOOLForKey:", CFSTR("CenterRulerOrigin"));
    v2->_preferredPixelUnit = 2;

  }
  return v2;
}

- (void)setRulerUnits:(unint64_t)a3
{
  NSFormatter *formatter;
  NSFormatter *lenientFormatter;
  NSFormatter *highPrecisionFormatter;
  NSFormatter *lenientHighPrecisionFormatter;
  void *v8;
  id v9;

  if (self->_rulerUnits != a3)
  {
    self->_rulerUnits = a3;
    formatter = self->_formatter;
    self->_formatter = 0;

    lenientFormatter = self->_lenientFormatter;
    self->_lenientFormatter = 0;

    highPrecisionFormatter = self->_highPrecisionFormatter;
    self->_highPrecisionFormatter = 0;

    lenientHighPrecisionFormatter = self->_lenientHighPrecisionFormatter;
    self->_lenientHighPrecisionFormatter = 0;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v8, "setInteger:forKey:", self->_rulerUnits, CFSTR("CRLRulerUnitTypeUserDefault"));

    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("RulerUnitsDidChange"), self);

  }
}

- (void)setShowRulerAsPercentage:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_showRulerAsPercentage != a3)
  {
    self->_showRulerAsPercentage = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", self->_showRulerAsPercentage, CFSTR("ShowRulerAsPercentage"));

    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("ShowRulerAsPercentageDidChange"), self);

  }
}

- (void)setCenterRulerOrigin:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_centerRulerOrigin != a3)
  {
    self->_centerRulerOrigin = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", self->_centerRulerOrigin, CFSTR("CenterRulerOrigin"));

    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("CenterRulerOriginDidChange"), self);

  }
}

- (double)convertRulerUnitsToPoints:(double)a3
{
  unint64_t rulerUnits;
  double v4;

  rulerUnits = self->_rulerUnits;
  v4 = 1.0;
  if (rulerUnits <= 3)
    v4 = dbl_100EEC6A8[rulerUnits];
  return v4 * a3;
}

- (double)convertPointsToRulerUnits:(double)a3
{
  unint64_t rulerUnits;
  double v4;

  rulerUnits = self->_rulerUnits;
  v4 = 1.0;
  if (rulerUnits <= 3)
    v4 = dbl_100EEC6A8[rulerUnits];
  return a3 / v4;
}

- (id)formatter:(BOOL)a3 lenient:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t rulerUnits;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  if (!a3)
  {
    if (a4)
    {
LABEL_6:
      v7 = 0;
      v8 = 16;
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
      v8 = 32;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (rulerUnits)
  {
LABEL_8:
    v7 = 0;
    v8 = 8;
    goto LABEL_10;
  }
  v7 = 1;
  v8 = 24;
LABEL_10:
  v10 = *(id *)((char *)&self->super.isa + v8);
  if (!v10)
  {
    v11 = self->_rulerUnits;
    if (v7)
      v12 = 4;
    else
      v12 = 2;
    if (v11)
      v12 = 0;
    if (v11 == 1)
      v13 = 2;
    else
      v13 = v12;
    v14 = objc_msgSend((id)objc_opt_class(self, v9), "formatterForRulerUnits:decimalPlaces:trailingZeros:lenient:", self->_rulerUnits, v13, 0, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue(v14);
    v15 = 16;
    if (v7)
      v15 = 32;
    v16 = 8;
    if (v7)
      v16 = 24;
    if (!v4)
      v15 = v16;
    objc_storeStrong((id *)((char *)&self->super.isa + v15), v10);
  }
  return v10;
}

- (id)compatibleRulerUnits
{
  unint64_t rulerUnits;

  rulerUnits = self->_rulerUnits;
  if (rulerUnits > 4)
    return &stru_1012A72B0;
  else
    return *(&off_101234140 + rulerUnits);
}

- (id)localizedCompatibleRulerUnits
{
  void *v2;
  void *v3;
  const __CFString *v4;
  __CFString *v5;

  switch(self->_rulerUnits)
  {
    case 0uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Inches");
      goto LABEL_8;
    case 1uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Centimeters");
      goto LABEL_8;
    case 2uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Points");
      goto LABEL_8;
    case 3uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Picas");
      goto LABEL_8;
    case 4uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("Pixels");
LABEL_8:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, 0, 0));

      break;
    default:
      v5 = &stru_1012A72B0;
      break;
  }
  return v5;
}

- (id)localizedCompatibleRulerAbbreviatedUnits
{
  void *v2;
  void *v3;
  const __CFString *v4;
  __CFString *v5;

  switch(self->_rulerUnits)
  {
    case 0uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("in");
      goto LABEL_8;
    case 1uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("cm");
      goto LABEL_8;
    case 2uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("pt");
      goto LABEL_8;
    case 3uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("pc");
      goto LABEL_8;
    case 4uLL:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v3 = v2;
      v4 = CFSTR("px");
LABEL_8:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", v4, 0, 0));

      break;
    default:
      v5 = &stru_1012A72B0;
      break;
  }
  return v5;
}

+ (id)formatterForRulerUnits:(unint64_t)a3 decimalPlaces:(int)a4 trailingZeros:(BOOL)a5 lenient:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  CRLPositiveZeroNumberFormatter *v21;

  v6 = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  if (a3 == 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234100);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF48C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234120);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLRulerUnits formatterForRulerUnits:decimalPlaces:trailingZeros:lenient:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLRulerUnits.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 264, 0, "Pica formatting not currently supported");

  }
  if ((int)v8 < 1)
  {
    v14 = CFSTR("0");
  }
  else if (v7)
  {
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%%.%df"), v8);
    v14 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v13, 0);

  }
  else
  {
    v14 = (__CFString *)objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("0."));
    v15 = v8 + 1;
    do
    {
      -[__CFString appendString:](v14, "appendString:", CFSTR("#"));
      --v15;
    }
    while (v15 > 1);
  }
  v16 = CFSTR("%@");
  switch(a3)
  {
    case 0uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("%@ in");
      goto LABEL_23;
    case 1uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("%@ cm");
      goto LABEL_23;
    case 2uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("%@ pt");
      goto LABEL_23;
    case 4uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("%@ px");
LABEL_23:
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, 0, 0));

      break;
    case 5uLL:
      break;
    default:
      v16 = &stru_1012A72B0;
      break;
  }
  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v16, v14);
  v21 = objc_alloc_init(CRLPositiveZeroNumberFormatter);
  -[CRLPositiveZeroNumberFormatter setPositiveFormat:](v21, "setPositiveFormat:", v20);
  -[CRLPositiveZeroNumberFormatter setLenient:](v21, "setLenient:", v6);

  return v21;
}

- (unint64_t)rulerUnits
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

- (unint64_t)preferredPixelUnit
{
  return self->_preferredPixelUnit;
}

- (void)setPreferredPixelUnit:(unint64_t)a3
{
  self->_preferredPixelUnit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lenientHighPrecisionFormatter, 0);
  objc_storeStrong((id *)&self->_highPrecisionFormatter, 0);
  objc_storeStrong((id *)&self->_lenientFormatter, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
