@implementation NSDate(SMExtensions)

- (uint64_t)preciseFormattedTime
{
  return objc_msgSend(a1, "roundedFormattedTimeWithRoundedMinutesUnit:allowedUnits:", 1, 112);
}

- (id)roundedFormattedTimeWithRoundedMinutesUnit:()SMExtensions allowedUnits:
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeIntervalSinceDate:", v5);
  v7 = v6;

  v8 = (uint64_t)(round(v7) / 60.0);
  objc_msgSend(MEMORY[0x24BDD15A0], "relativeDateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a3 - 1;
  if (v7 < 0.0)
    v11 = 0;
  objc_msgSend(v9, "localizedStringFromTimeInterval:", (double)(60 * (v8 + v11) / a3 * a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)roundedTime
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", ceil(v1 / 300.0) * 300.0);
}

- (id)relativeTimeString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD15A0], "relativeDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForDate:relativeToDate:", a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)absoluteTimeString:()SMExtensions preposition:capitalized:
{
  void *v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a3 == 1)
  {
    objc_msgSend(a1, "dateString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15A0], "dateFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend(v9, "stringFromDate:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqual:", v12);

    if (v13)
    {
      objc_msgSend(a1, "timeStringWithPreposition:capitalized:", a4, a5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ESTIMATED_TIME_NEXT_CALENDAR_DAY"), CFSTR("%@ on %@"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "timeStringWithPreposition:capitalized:", a4, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "dateString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@%@"), 0, v17, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v6;
}

- (id)dateString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD15A0], "dateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE, MMMM d"));
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timeStringWithPreposition:()SMExtensions capitalized:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;

  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", a1, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15A0], "dateFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(v8, "stringFromDate:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invertedSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", &stru_251671BC8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "numberFromString:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == 1)
      {
        if (a4)
        {
          v18 = CFSTR("ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_CAPITALIZED_AROUND_PREPOSITION");
LABEL_18:
          v19 = CFSTR("Around %@");
          goto LABEL_31;
        }
        v18 = CFSTR("ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_NONCAPITALIZED_AROUND_PREPOSITION");
      }
      else
      {
        if (a4)
        {
          v18 = CFSTR("ESTIMATED_TIME_PLURAL_HOUR_WITH_CAPITALIZED_AROUND_PREPOSITION");
          goto LABEL_18;
        }
        v18 = CFSTR("ESTIMATED_TIME_PLURAL_HOUR_WITH_NONCAPITALIZED_AROUND_PREPOSITION");
      }
      v19 = CFSTR("around %@");
      goto LABEL_31;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == 1)
      {
        if (a4)
        {
          v18 = CFSTR("ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_CAPITALIZED_BY_PREPOSITION");
LABEL_21:
          v19 = CFSTR("By %@");
          goto LABEL_31;
        }
        v18 = CFSTR("ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_NONCAPITALIZED_BY_PREPOSITION");
      }
      else
      {
        if (a4)
        {
          v18 = CFSTR("ESTIMATED_TIME_PLURAL_HOUR_WITH_CAPITALIZED_BY_PREPOSITION");
          goto LABEL_21;
        }
        v18 = CFSTR("ESTIMATED_TIME_PLURAL_HOUR_WITH_NONCAPITALIZED_BY_PREPOSITION");
      }
      v19 = CFSTR("by %@");
      goto LABEL_31;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == 1)
      {
        if (a4)
        {
          v18 = CFSTR("ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_CAPITALIZED_AT_PREPOSITION");
LABEL_15:
          v19 = CFSTR("At %@");
LABEL_31:
          objc_msgSend(v17, "localizedStringForKey:value:table:", v18, v19, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%@"), 0, v7);
          v21 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v21;
          break;
        }
        v18 = CFSTR("ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_NONCAPITALIZED_AT_PREPOSITION");
      }
      else
      {
        if (a4)
        {
          v18 = CFSTR("ESTIMATED_TIME_PLURAL_HOUR_WITH_CAPITALIZED_AT_PREPOSITION");
          goto LABEL_15;
        }
        v18 = CFSTR("ESTIMATED_TIME_PLURAL_HOUR_WITH_NONCAPITALIZED_AT_PREPOSITION");
      }
      v19 = CFSTR("at %@");
      goto LABEL_31;
  }

  return v7;
}

@end
