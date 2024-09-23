@implementation RMDateFormat

+ (id)stringUTCWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_isoUTCDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)stringUTCFractionalSecondsWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_isoUTCFractionalSecondsDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)stringLocalTimeZoneWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_isoLocalTimeZoneDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)stringLocalTimeZoneFractionalSecondsWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_isoLocalTimeZoneFractionalSecondsDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "stringFromDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromDate:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)dateWithStringUTC:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_isoUTCDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dateWithStringUTCFractionalSeconds:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_isoUTCFractionalSecondsDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dateWithStringLocalTimeZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_isoLocalTimeZoneDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dateWithStringLocalTimeZoneFractionalSeconds:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_isoLocalTimeZoneFractionalSecondsDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_isoUTCDateFormatter
{
  if (_isoUTCDateFormatter_onceToken != -1)
    dispatch_once(&_isoUTCDateFormatter_onceToken, &__block_literal_global_3);
  return (id)_isoUTCDateFormatter_dateFormatter;
}

uint64_t __36__RMDateFormat__isoUTCDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_isoUTCDateFormatter_dateFormatter;
  _isoUTCDateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_isoUTCDateFormatter_dateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)_isoUTCDateFormatter_dateFormatter, "setFormatOptions:", 1907);
}

+ (id)_isoUTCFractionalSecondsDateFormatter
{
  if (_isoUTCFractionalSecondsDateFormatter_onceToken != -1)
    dispatch_once(&_isoUTCFractionalSecondsDateFormatter_onceToken, &__block_literal_global_3);
  return (id)_isoUTCFractionalSecondsDateFormatter_dateFormatter;
}

uint64_t __53__RMDateFormat__isoUTCFractionalSecondsDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_isoUTCFractionalSecondsDateFormatter_dateFormatter;
  _isoUTCFractionalSecondsDateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_isoUTCFractionalSecondsDateFormatter_dateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)_isoUTCFractionalSecondsDateFormatter_dateFormatter, "setFormatOptions:", 3955);
}

+ (id)_isoLocalTimeZoneDateFormatter
{
  if (_isoLocalTimeZoneDateFormatter_onceToken != -1)
    dispatch_once(&_isoLocalTimeZoneDateFormatter_onceToken, &__block_literal_global_4);
  return (id)_isoLocalTimeZoneDateFormatter_dateFormatter;
}

uint64_t __46__RMDateFormat__isoLocalTimeZoneDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_isoLocalTimeZoneDateFormatter_dateFormatter;
  _isoLocalTimeZoneDateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_isoLocalTimeZoneDateFormatter_dateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)_isoLocalTimeZoneDateFormatter_dateFormatter, "setFormatOptions:", 1907);
}

+ (id)_isoLocalTimeZoneFractionalSecondsDateFormatter
{
  if (_isoLocalTimeZoneFractionalSecondsDateFormatter_onceToken != -1)
    dispatch_once(&_isoLocalTimeZoneFractionalSecondsDateFormatter_onceToken, &__block_literal_global_5);
  return (id)_isoLocalTimeZoneFractionalSecondsDateFormatter_dateFormatter;
}

uint64_t __63__RMDateFormat__isoLocalTimeZoneFractionalSecondsDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_isoLocalTimeZoneFractionalSecondsDateFormatter_dateFormatter;
  _isoLocalTimeZoneFractionalSecondsDateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_isoLocalTimeZoneFractionalSecondsDateFormatter_dateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)_isoLocalTimeZoneFractionalSecondsDateFormatter_dateFormatter, "setFormatOptions:", 3955);
}

@end
