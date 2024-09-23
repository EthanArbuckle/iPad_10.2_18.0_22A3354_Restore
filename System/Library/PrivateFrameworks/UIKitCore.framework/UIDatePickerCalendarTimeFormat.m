@implementation UIDatePickerCalendarTimeFormat

id __121___UIDatePickerCalendarTimeFormat_initWithCalendar_locale_followsSystemHourCycle_forceDoubleDigitHours_displaysTimeZone___block_invoke(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a1;
  v4 = *MEMORY[0x1E0C99740];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C99740]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    while (!objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v7, 0))
      objc_msgSend(v6, "replaceCharactersInRange:withString:", 0, v8, &stru_1E16EDF20);
  }
  else
  {
    v9 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v7, 4);
    v11 = v10;
    if (v9 + v10 == objc_msgSend(v6, "length"))
    {
      do
      {
        objc_msgSend(v6, "replaceCharactersInRange:withString:", v9, v11, &stru_1E16EDF20);
        v9 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:", v7, 4);
        v11 = v12;
      }
      while (v9 + v12 == objc_msgSend(v6, "length"));
    }
  }
  if (objc_msgSend(v6, "length"))
  {
    v13 = (void *)objc_msgSend(v3, "mutableCopy");
    v14 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v4);

    v15 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
