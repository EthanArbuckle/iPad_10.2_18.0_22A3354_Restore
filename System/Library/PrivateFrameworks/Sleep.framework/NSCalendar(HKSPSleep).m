@implementation NSCalendar(HKSPSleep)

- (id)hksp_orderedSleepDays
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NSCalendar_HKSPSleep__hksp_orderedSleepDays__block_invoke;
  v6[3] = &unk_1E4E3A710;
  v7 = v2;
  v3 = v2;
  HKSPEnumerateDaysOfWeekInCalendar(a1, v6, 0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)hksp_orderedSleepWeekdaysForWeekdays:()HKSPSleep
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__NSCalendar_HKSPSleep__hksp_orderedSleepWeekdaysForWeekdays___block_invoke;
  v9[3] = &unk_1E4E3A710;
  v10 = v5;
  v6 = v5;
  HKSPWeekdaysEnumerateDaysInCalendar(a1, a3, v9, 0);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)hksp_localizedGroupingStringForWeekdays:()HKSPSleep
{
  __CFString *v3;
  uint64_t v5;
  void *v6;

  if (a3 == 127)
  {
    v3 = CFSTR("EVERY_DAY");
  }
  else
  {
    v5 = HKSPWeekendDaysInCalendar(a1);
    if (v5 == a3)
    {
      v3 = CFSTR("WEEKENDS");
    }
    else
    {
      if ((~(_BYTE)v5 & 0x7F) != a3)
      {
        v6 = 0;
        return v6;
      }
      v3 = CFSTR("WEEKDAYS");
    }
  }
  HKSPLocalizedString(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (uint64_t)hksp_dayPeriodForDate:()HKSPSleep locale:
{
  return objc_msgSend(a1, "hksp_dayPeriodForDate:locale:options:", a3, a4, 1);
}

- (uint64_t)hksp_dayPeriodForDate:()HKSPSleep locale:options:
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v8 = a3;
  v9 = objc_msgSend(a1, "bs_dayPeriodForDate:inLocale:", v8, a4);
  v10 = 1;
  if (v9 <= 9)
  {
    if (((1 << v9) & 0x2F0) != 0)
    {
      if ((a5 & 1) != 0)
      {
        if ((unint64_t)(objc_msgSend(a1, "component:fromDate:", 32, v8) - 3) < 7)
          v10 = 1;
        else
          v10 = 3;
      }
      else
      {
        v10 = 3;
      }
    }
    else
    {
      v11 = (a5 & 2) == 0;
      if (v9)
        v11 = 1;
      if (((1 << v9) & 0x10C) != 0)
        v10 = 2;
      else
        v10 = v11;
    }
  }

  return v10;
}

- (uint64_t)hksp_nextDateAfterDate:()HKSPSleep matchingComponents:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingComponents:backwards:", a3, a4, 0);
}

- (uint64_t)hksp_previousDateBeforeDate:()HKSPSleep matchingComponents:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingComponents:backwards:", a3, a4, 1);
}

- (id)_hksp_nextDateAfterDate:()HKSPSleep matchingComponents:backwards:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend((id)objc_opt_class(), "_hksp_optionsForBackwards:", a5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingComponents_backwards___block_invoke;
  v14[3] = &unk_1E4E3A698;
  v14[4] = a1;
  v15 = v8;
  v16 = v10;
  v11 = v8;
  objc_msgSend(a1, "_hksp_nextDateHelperAfterDate:nextDateBlock:", v9, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)hksp_nextDateAfterDate:()HKSPSleep matchingUnit:value:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingUnit:value:backwards:", a3, a4, a5, 0);
}

- (uint64_t)hksp_previousDateBeforeDate:()HKSPSleep matchingUnit:value:
{
  return objc_msgSend(a1, "_hksp_nextDateAfterDate:matchingUnit:value:backwards:", a3, a4, a5, 1);
}

- (id)_hksp_nextDateAfterDate:()HKSPSleep matchingUnit:value:backwards:
{
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[8];

  v10 = a3;
  v11 = objc_msgSend((id)objc_opt_class(), "_hksp_optionsForBackwards:", a6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingUnit_value_backwards___block_invoke;
  v14[3] = &unk_1E4E3A6C0;
  v14[4] = a1;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = v11;
  objc_msgSend(a1, "_hksp_nextDateHelperAfterDate:nextDateBlock:", v10, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_hksp_nextDateHelperAfterDate:()HKSPSleep nextDateBlock:
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daylightSavingTimeOffsetForDate:", v6);
  v10 = v9;

  if (v10 <= 0.0)
    goto LABEL_7;
  objc_msgSend(v6, "dateByAddingTimeInterval:", -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "daylightSavingTimeOffsetForDate:", v11);
  v14 = v13;

  if (v10 <= v14)
  {
LABEL_6:

LABEL_7:
    v7[2](v7, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7[2](v7, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "hksp_isAfterDate:", v6) & 1) == 0)
  {

    goto LABEL_6;
  }

LABEL_8:
  return v15;
}

+ (uint64_t)_hksp_optionsForBackwards:()HKSPSleep
{
  if (a3)
    return 8708;
  else
    return 512;
}

- (uint64_t)hksp_dateRequiresSingularTimeString:()HKSPSleep
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = objc_msgSend(a1, "component:fromDate:", 32, a3);
  if (result != 1)
  {
    if (result == 13)
    {
      objc_msgSend(a1, "locale");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hk_isIn24HourTime");

      return v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)hksp_firstNonWeekendDay
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0xFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "firstWeekday"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_weekendDays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "unsignedIntegerValue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__NSCalendar_HKSPSleep__hksp_firstNonWeekendDay__block_invoke;
  v8[3] = &unk_1E4E3A6E8;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  HKSPEnumerateDaysOfWeekStartingOnDay(v4, (uint64_t)v8, 0);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)hksp_componentsByAddingTimeInterval:()HKSPSleep toComponents:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "dateFromComponents:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v5, "setSecond:", (uint64_t)a2);
  objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v5, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "components:fromDate:", 96, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)hksp_timeIntervalFromComponents:()HKSPSleep toComponents:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nextDateAfterDate:matchingComponents:options:", v9, v8, 512);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nextDateAfterDate:matchingComponents:options:", v10, v7, 512);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v13 = v12;

  return v13;
}

@end
