@implementation NSDate

- (id)crl_initWithDOSTime:(id)a3
{
  NSDate *v4;
  int32x2_t v5;
  BOOL v7;
  tm v9;

  v4 = 0;
  memset(&v9.tm_wday, 0, 32);
  v9.tm_isdst = -1;
  v9.tm_sec = (*(unsigned int *)&a3 >> 15) & 0x3E;
  v9.tm_min = (*(unsigned int *)&a3 >> 21) & 0x3F;
  v9.tm_hour = *(unsigned int *)&a3 >> 27;
  v9.tm_mday = a3.var0 & 0x1F;
  v5 = (int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*(_DWORD *)&a3), (uint32x2_t)0xFFFFFFF7FFFFFFFBLL), (int8x8_t)0x7F0000000FLL);
  *(int32x2_t *)&v9.tm_mon = vadd_s32(v5, (int32x2_t)0x50FFFFFFFFLL);
  v7 = (v5.i32[0] - 13) < 0xFFFFFFF4 || (a3.var0 & 0x1F) == 0 || *(unsigned int *)&a3 >> 30 == 3;
  if (!v7 && ((*(unsigned int *)&a3 >> 21) & 0x3F) <= 0x3B && ((*(unsigned int *)&a3 >> 15) & 0x3E) <= 0x3B)
    v4 = -[NSDate initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:", (double)mktime(&v9));

  return v4;
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)crl_DOSTime
{
  double v2;
  tm *v3;
  int tm_year;
  time_t v6;

  -[NSDate timeIntervalSince1970](self, "timeIntervalSince1970");
  v6 = (uint64_t)v2;
  v3 = localtime(&v6);
  tm_year = v3->tm_year;
  if (tm_year <= 81)
    LOWORD(tm_year) = 81;
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)((unsigned __int16)((32 * v3->tm_mon + 32) | v3->tm_mday | (((_WORD)tm_year << 9) + 24576)) | ((unsigned __int16)((32 * LOWORD(v3->tm_min)) | ((unsigned __int16)v3->tm_hour << 11) | ((unsigned __int16)v3->tm_sec >> 1)) << 16));
}

- (id)crl_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4 shortAsPossible:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  _BOOL4 v15;
  __CFString *v16;
  uint64_t v17;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (-[NSDate compare:](self, "compare:", v8) != NSOrderedAscending)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:toDate:options:", 240, v8, self, 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 752, v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 512, self));
      v14 = objc_msgSend(v13, "weekday");
      if (v14 - (_BYTE *)objc_msgSend(v12, "weekday") == 1)
        v15 = 1;
      else
        v15 = objc_msgSend(v12, "weekday") == (id)7 && objc_msgSend(v13, "weekday") == (id)1;
      if ((uint64_t)objc_msgSend(v11, "day") < 365)
      {
        if ((uint64_t)objc_msgSend(v11, "day") < 8)
        {
          if ((uint64_t)objc_msgSend(v11, "day") <= 1 && (objc_msgSend(v11, "day") != (id)1 || v15))
          {
            if (objc_msgSend(v11, "day") == (id)1 && v15)
            {
              if (!v5)
              {
                v17 = objc_claimAutoreleasedReturnValue(-[NSDate p_ruleForYesterday:withDateFormatter:](self, "p_ruleForYesterday:withDateFormatter:", v8, v9));
                goto LABEL_26;
              }
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v21 = v20;
              v22 = CFSTR("Yesterday");
            }
            else
            {
              if ((uint64_t)objc_msgSend(v11, "hour") >= 1)
              {
                v17 = objc_claimAutoreleasedReturnValue(-[NSDate p_rule1To23HoursAgo:](self, "p_rule1To23HoursAgo:", objc_msgSend(v11, "hour")));
                goto LABEL_26;
              }
              if ((uint64_t)objc_msgSend(v11, "minute") >= 1)
              {
                v17 = objc_claimAutoreleasedReturnValue(-[NSDate p_rule1To59MinutesAgo:](self, "p_rule1To59MinutesAgo:", objc_msgSend(v11, "minute")));
                goto LABEL_26;
              }
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v21 = v20;
              v22 = CFSTR("Just now");
            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v22, 0, 0));

            goto LABEL_27;
          }
          v17 = objc_claimAutoreleasedReturnValue(-[NSDate p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:withDateFormatter:](self, "p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:withDateFormatter:", v8, v9));
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(-[NSDate p_ruleForOverAWeekAgoForDate:withDateFormatter:](self, "p_ruleForOverAWeekAgoForDate:withDateFormatter:", v8, v9));
        }
      }
      else
      {
        v17 = objc_claimAutoreleasedReturnValue(-[NSDate p_ruleForOverAYearAgoForDate:withDateFormatter:](self, "p_ruleForOverAYearAgoForDate:withDateFormatter:", v8, v9));
      }
LABEL_26:
      v23 = (void *)v17;
LABEL_27:
      v16 = v23;

      goto LABEL_28;
    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDate crl_fullFormattedDate](self, "crl_fullFormattedDate"));
  }
  else
  {
    v16 = CFSTR(" ");
  }
LABEL_28:

  return v16;
}

- (id)crl_relativeAnnotationStringForEarlierDate:(id)a3 withDateFormatter:(id)a4
{
  return -[NSDate crl_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:](self, "crl_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:", a3, a4, 0);
}

- (id)crl_relativeAnnotationStringForEarlierDate:(id)a3
{
  return -[NSDate crl_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:](self, "crl_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:", a3, 0, 0);
}

- (id)p_rule1To59MinutesAgo:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%d min ago"), 0, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3));
  return v6;
}

- (id)p_rule1To23HoursAgo:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%ld hour(s) ago"), 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3));

  return v6;
}

- (id)p_ruleForYesterday:(id)a3 withDateFormatter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:](self, "dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:", CFSTR("hhmma"), CFSTR("HHmm"), a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Yesterday, %@"), 0, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

  return v11;
}

- (id)p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:(id)a3 withDateFormatter:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:](self, "dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:", CFSTR("eeehhmma"), CFSTR("eeeHHmm"), a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v6));

  return v8;
}

- (id)p_ruleForOverAWeekAgoForDate:(id)a3 withDateFormatter:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:](self, "dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:", CFSTR("MMMdhhmma"), CFSTR("MMMdHHmm"), a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromDate:", v6));

  return v8;
}

- (id)p_ruleForOverAYearAgoForDate:(id)a3 withDateFormatter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init((Class)NSDateFormatter);
  v9 = v8;
  objc_msgSend(v8, "setLocalizedDateFormatFromTemplate:", CFSTR("Mdy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v5));

  return v10;
}

- (id)crl_fullFormattedDate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:](self, "dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:", CFSTR("MMMMddyyyyhhmma"), CFSTR("MMMMddyyyyHHmm"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", self));

  return v4;
}

- (id)crl_shortFormattedDate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:](self, "dateFormatterFromTemplate12Hour:template24Hour:withDateFormatter:", CFSTR("MMMdyhhmma"), CFSTR("MMMdyHHmm"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", self));

  return v4;
}

- (id)dateFormatterFromTemplate12Hour:(id)a3 template24Hour:(id)a4 withDateFormatter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init((Class)NSDateFormatter);
  v13 = v12;
  if (-[NSDate p_localeUses24HourTimeCycle](self, "p_localeUses24HourTimeCycle"))
    v14 = v9;
  else
    v14 = v8;
  objc_msgSend(v13, "setLocalizedDateFormatFromTemplate:", v14);

  return v13;
}

- (BOOL)p_localeUses24HourTimeCycle
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v2));
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("a")) == (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)crl_isEqualToDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  if (v4)
  {
    -[NSDate timeIntervalSince1970](self, "timeIntervalSince1970");
    v6 = v5;
    objc_msgSend(v4, "timeIntervalSince1970");
    v8 = v6 == v7 || vabdd_f64(v6, v7) < fabs(v7 * 1.0e-10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)crl_isEqualToFileModificationDateAccountingForTruncation:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = a3;
  if (v4)
  {
    if ((-[NSDate isEqual:](self, "isEqual:", v4) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[NSDate timeIntervalSinceReferenceDate](self, "timeIntervalSinceReferenceDate");
      v7 = v6;
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      v5 = 1;
      v9 = v7 == floor(v8) || v7 == v8;
      if (!v9 && vabdd_f64(v7, v8) >= 0.001)
        v5 = floor(v7) == v8;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
