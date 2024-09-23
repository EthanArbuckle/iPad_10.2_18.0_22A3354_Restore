@implementation NSNumber(ICSWriter)

- (void)_ICSBoolAppendingToString:()ICSWriter
{
  const __CFString *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(a1, "BOOLValue"))
    v4 = CFSTR("TRUE");
  else
    v4 = CFSTR("FALSE");
  objc_msgSend(v5, "appendString:", v4);

}

- (void)_ICSUTCOffsetAppendingToString:()ICSWriter
{
  int v4;
  const __CFString *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(a1, "intValue");
  if (v4 >= 0)
    v5 = CFSTR("+");
  else
    v5 = CFSTR("-");
  objc_msgSend(v11, "appendString:", v5);
  LODWORD(v6) = v4 % 86400 / 3600;
  if ((int)v6 >= 0)
    v6 = v6;
  else
    v6 = (v4 % 86400 / -3600);
  v7 = v4 % 3600 + ((-30583 * (v4 % 3600)) >> 16);
  LODWORD(v8) = ((__int16)v7 >> 5) + ((unsigned __int16)(v7 & 0x8000) >> 15);
  if ((int)v8 >= 0)
    v8 = v8;
  else
    v8 = -(int)v8;
  LODWORD(v9) = v4 % 60;
  if (v4 % 60)
  {
    if ((int)v9 >= 0)
      v9 = v9;
    else
      v9 = -(int)v9;
    objc_msgSend(v11, "appendFormat:", CFSTR("%02d%02d%02d"), v6, v8, v9);
  }
  else
  {
    objc_msgSend(v11, "appendFormat:", CFSTR("%02d%02d"), v6, v8, v10);
  }

}

- (void)_ICSFBTypeAppendingToString:()ICSWriter
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(a1, "longValue");
  if (v4 <= 4)
    objc_msgSend(v5, "appendString:", off_1E953B010[v4]);

}

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, a3);

}

@end
