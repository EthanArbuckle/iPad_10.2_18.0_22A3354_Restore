@implementation _NCTimeFormatData

+ (id)instanceForLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _NCTimeFormatData *v9;

  v4 = a3;
  objc_msgSend(a1, "_timeFormatDataAccessLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");
  v6 = (void *)__formatData;
  if (!__formatData)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)__formatData;
    __formatData = (uint64_t)v7;

    v6 = (void *)__formatData;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v9 = (_NCTimeFormatData *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[_NCTimeFormatData initWithLocale:]([_NCTimeFormatData alloc], "initWithLocale:", v4);
    objc_msgSend((id)__formatData, "setObject:forKeyedSubscript:", v9, v4);
  }
  objc_msgSend(v5, "unlock");

  return v9;
}

+ (id)_timeFormatDataAccessLock
{
  if (_timeFormatDataAccessLock_onceToken != -1)
    dispatch_once(&_timeFormatDataAccessLock_onceToken, &__block_literal_global_21);
  return (id)_timeFormatDataAccessLock_accessLock;
}

+ (id)_timeLocaleForLocale:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithLocaleIdentifier:", v6);
  return v7;
}

- (_NCTimeFormatData)initWithLocale:(id)a3
{
  id v4;
  _NCTimeFormatData *v5;
  void *v6;
  uint64_t v7;
  NSString *formatHourMin;
  uint64_t v9;
  NSString *formatHourMinSecSubsec;
  uint64_t v11;
  NSString *formatHourMinSec;
  uint64_t v13;
  NSString *formatMinSecSubsec;
  uint64_t v15;
  NSString *formatMinSec;
  uint64_t v17;
  NSString *formatMin;
  void *v19;
  int v20;
  uint64_t v21;
  NSString *v22;
  uint64_t v23;
  NSString *v24;
  NSNumberFormatter *v25;
  NSNumberFormatter *singleWidthNumberFormatter;
  NSNumberFormatter *v27;
  NSNumberFormatter *doubleWidthNumberFormatter;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_NCTimeFormatData;
  v5 = -[_NCTimeFormatData init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_timeLocaleForLocale:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("HHmm"), 0, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    formatHourMin = v5->_formatHourMin;
    v5->_formatHourMin = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("HHmmssSS"), 0, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    formatHourMinSecSubsec = v5->_formatHourMinSecSubsec;
    v5->_formatHourMinSecSubsec = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("HHmmss"), 0, v6);
    v11 = objc_claimAutoreleasedReturnValue();
    formatHourMinSec = v5->_formatHourMinSec;
    v5->_formatHourMinSec = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("mmssSS"), 0, v6);
    v13 = objc_claimAutoreleasedReturnValue();
    formatMinSecSubsec = v5->_formatMinSecSubsec;
    v5->_formatMinSecSubsec = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("mmss"), 0, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    formatMinSec = v5->_formatMinSec;
    v5->_formatMinSec = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("m"), 0, v6);
    v17 = objc_claimAutoreleasedReturnValue();
    formatMin = v5->_formatMin;
    v5->_formatMin = (NSString *)v17;

    objc_msgSend(v6, "localeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("ee_"));

    if (v20)
    {
      if (-[NSString hasPrefix:](v5->_formatMinSecSubsec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
      {
        -[NSString substringFromIndex:](v5->_formatMinSecSubsec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v5->_formatMinSecSubsec;
        v5->_formatMinSecSubsec = (NSString *)v21;

      }
      if (-[NSString hasPrefix:](v5->_formatMinSec, "hasPrefix:", CFSTR("'aɖabaƒoƒo' ")))
      {
        -[NSString substringFromIndex:](v5->_formatMinSec, "substringFromIndex:", objc_msgSend(CFSTR("'aɖabaƒoƒo' "), "length"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v5->_formatMinSec;
        v5->_formatMinSec = (NSString *)v23;

      }
    }
    v25 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    singleWidthNumberFormatter = v5->_singleWidthNumberFormatter;
    v5->_singleWidthNumberFormatter = v25;

    -[NSNumberFormatter setNumberStyle:](v5->_singleWidthNumberFormatter, "setNumberStyle:", 0);
    -[NSNumberFormatter setPositiveFormat:](v5->_singleWidthNumberFormatter, "setPositiveFormat:", CFSTR("0"));
    -[NSNumberFormatter setLocale:](v5->_singleWidthNumberFormatter, "setLocale:", v4);
    v27 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    doubleWidthNumberFormatter = v5->_doubleWidthNumberFormatter;
    v5->_doubleWidthNumberFormatter = v27;

    -[NSNumberFormatter setNumberStyle:](v5->_doubleWidthNumberFormatter, "setNumberStyle:", 0);
    -[NSNumberFormatter setPositiveFormat:](v5->_doubleWidthNumberFormatter, "setPositiveFormat:", CFSTR("00"));
    -[NSNumberFormatter setLocale:](v5->_doubleWidthNumberFormatter, "setLocale:", v4);

  }
  return v5;
}

- (NSString)formatHourMinSecSubsec
{
  return self->_formatHourMinSecSubsec;
}

- (NSString)formatHourMinSec
{
  return self->_formatHourMinSec;
}

- (NSString)formatHourMin
{
  return self->_formatHourMin;
}

- (NSString)formatMinSecSubsec
{
  return self->_formatMinSecSubsec;
}

- (NSString)formatMinSec
{
  return self->_formatMinSec;
}

- (NSString)formatMin
{
  return self->_formatMin;
}

- (NSNumberFormatter)singleWidthNumberFormatter
{
  return self->_singleWidthNumberFormatter;
}

- (NSNumberFormatter)doubleWidthNumberFormatter
{
  return self->_doubleWidthNumberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_singleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_formatMin, 0);
  objc_storeStrong((id *)&self->_formatMinSec, 0);
  objc_storeStrong((id *)&self->_formatMinSecSubsec, 0);
  objc_storeStrong((id *)&self->_formatHourMin, 0);
  objc_storeStrong((id *)&self->_formatHourMinSec, 0);
  objc_storeStrong((id *)&self->_formatHourMinSecSubsec, 0);
}

@end
