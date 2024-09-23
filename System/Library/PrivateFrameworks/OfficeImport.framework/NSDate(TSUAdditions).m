@implementation NSDate(TSUAdditions)

- (id)tsu_initWithDOSTime:()TSUAdditions
{
  void *v4;
  int32x2_t v5;
  BOOL v7;
  tm v9;

  v4 = 0;
  memset(&v9.tm_wday, 0, 32);
  v9.tm_isdst = -1;
  v9.tm_sec = (a3 >> 15) & 0x3E;
  v9.tm_min = (a3 >> 21) & 0x3F;
  v9.tm_hour = a3 >> 27;
  v9.tm_mday = a3 & 0x1F;
  v5 = (int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF7FFFFFFFBLL), (int8x8_t)0x7F0000000FLL);
  *(int32x2_t *)&v9.tm_mon = vadd_s32(v5, (int32x2_t)0x50FFFFFFFFLL);
  v7 = (v5.i32[0] - 13) < 0xFFFFFFF4 || (a3 & 0x1F) == 0 || a3 >> 30 == 3;
  if (!v7 && ((a3 >> 21) & 0x3F) <= 0x3B && ((a3 >> 15) & 0x3E) <= 0x3B)
    v4 = (void *)objc_msgSend(a1, "initWithTimeIntervalSince1970:", (double)mktime(&v9));

  return v4;
}

- (uint64_t)tsu_DOSTime
{
  double v1;
  tm *v2;
  int tm_year;
  time_t v5;

  objc_msgSend(a1, "timeIntervalSince1970");
  v5 = (uint64_t)v1;
  v2 = localtime(&v5);
  tm_year = v2->tm_year;
  if (tm_year <= 81)
    LOWORD(tm_year) = 81;
  return (unsigned __int16)((32 * v2->tm_mon + 32) | v2->tm_mday | (((_WORD)tm_year << 9) + 24576)) | ((unsigned __int16)((32 * LOWORD(v2->tm_min)) | ((unsigned __int16)v2->tm_hour << 11) | ((unsigned __int16)v2->tm_sec >> 1)) << 16);
}

- (__CFString)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions withDateFormatter:shortAsPossible:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  __CFString *v16;
  uint64_t v17;
  char v18;
  void *v20;
  void *v22;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (objc_msgSend(a1, "compare:", v8) != -1)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:toDate:options:", 240, v8, a1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:", 752, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:", 512, a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "weekday");
      if (v14 - objc_msgSend(v12, "weekday") == 1)
        v15 = 1;
      else
        v15 = objc_msgSend(v12, "weekday") == 7 && objc_msgSend(v13, "weekday") == 1;
      if (objc_msgSend(v11, "day") < 365)
      {
        if (objc_msgSend(v11, "day") < 8)
        {
          if (objc_msgSend(v11, "day") <= 1
            && (objc_msgSend(v11, "day") != 1 ? (v18 = 1) : (v18 = v15), (v18 & 1) != 0))
          {
            if (objc_msgSend(v11, "day") == 1 && v15)
            {
              if (a5)
                objc_msgSend(a1, "p_ruleForYesterdayShortAsPossible:", v8);
              else
                objc_msgSend(a1, "p_ruleForYesterday:withDateFormatter:", v8, v9);
              v17 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v11, "hour") < 1)
            {
              if (objc_msgSend(v11, "minute") < 1)
              {
                SFUBundle();
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Just now"), &stru_24F3BFFF8, CFSTR("TSUtility"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_28;
              }
              objc_msgSend(a1, "p_rule1To59MinutesAgo:", objc_msgSend(v11, "minute"));
              v17 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(a1, "p_rule1To23HoursAgo:", objc_msgSend(v11, "hour"));
              v17 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            objc_msgSend(a1, "p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:withDateFormatter:", v8, v9);
            v17 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          objc_msgSend(a1, "p_ruleForOverAWeekAgoForDate:withDateFormatter:", v8, v9);
          v17 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(a1, "p_ruleForOverAYearAgoForDate:withDateFormatter:", v8, v9);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v20 = (void *)v17;
LABEL_28:
      v16 = v20;

      goto LABEL_29;
    }
    objc_msgSend(a1, "tsu_fullFormattedDateWithPeriod");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = CFSTR(" ");
  }
LABEL_29:

  return v16;
}

- (uint64_t)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions withDateFormatter:
{
  return objc_msgSend(a1, "tsu_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:", a3, a4, 0);
}

- (uint64_t)tsu_relativeAnnotationStringForEarlierDate:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_relativeAnnotationStringForEarlierDate:withDateFormatter:shortAsPossible:", a3, 0, 0);
}

- (id)p_rule1To59MinutesAgo:()TSUAdditions
{
  void *v4;
  void *v5;
  void *v6;

  SFUBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%ld min ago"), &stru_24F3BFFF8, CFSTR("TSUtility"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)p_rule1To23HoursAgo:()TSUAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  SFUBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%ld hour(s) ago"), &stru_24F3BFFF8, CFSTR("TSUtility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)p_ruleForYesterdayShortAsPossible:()TSUAdditions
{
  void *v0;
  void *v1;

  SFUBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Yesterday"), &stru_24F3BFFF8, CFSTR("TSUtility"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)p_ruleForYesterday:()TSUAdditions withDateFormatter:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", CFSTR("hhmma"));
  SFUBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Yesterday, %@"), &stru_24F3BFFF8, CFSTR("TSUtility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "stringFromDate:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)p_ruleForUpToSevenDaysAgoAndNotYesterdayForDate:()TSUAdditions withDateFormatter:
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", CFSTR("eeehhmma"));
  objc_msgSend(v6, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)p_ruleForOverAWeekAgoForDate:()TSUAdditions withDateFormatter:
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMdhhmma"));
  objc_msgSend(v6, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)p_ruleForOverAYearAgoForDate:()TSUAdditions withDateFormatter:
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", CFSTR("Mdy"));
  objc_msgSend(v6, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tsu_fullFormattedDateWithPeriod
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v2, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMddyyyyhhmma"));
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)tsu_isEqualToDate:()TSUAdditions
{
  id v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "timeIntervalSince1970");
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

@end
