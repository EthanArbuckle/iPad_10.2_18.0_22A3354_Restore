@implementation SUAutoInstallForecast(SUSUI)

- (id)_susui_formattedRoundedStartTimeString
{
  id v2;
  id v3;
  id v4;

  v3 = (id)objc_msgSend(a1, "_timeFormatter");
  v2 = (id)objc_msgSend(a1, "_roundedStartTime");
  v4 = (id)objc_msgSend(v3, "stringFromDate:");

  return v4;
}

- (id)_susui_formattedRoundedEndTimeString
{
  id v2;
  id v3;
  id v4;

  v3 = (id)objc_msgSend(a1, "_timeFormatter");
  v2 = (id)objc_msgSend(a1, "_roundedEndTime");
  v4 = (id)objc_msgSend(v3, "stringFromDate:");

  return v4;
}

- (id)_susui_cardinalityForRoundedStartTime
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(a1, "_roundedStartTime");
  v4 = (id)objc_msgSend(a1, "formatCardinalityForDate:");

  return v4;
}

- (id)_susui_cardinalityForRoundedEndTime
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(a1, "_roundedEndTime");
  v4 = (id)objc_msgSend(a1, "formatCardinalityForDate:");

  return v4;
}

- (id)_timeFormatter
{
  id v3;
  id v4;
  char v5;
  id location;
  id v7[2];
  id v8;

  v8 = a1;
  v7[1] = a2;
  v7[0] = objc_getAssociatedObject(a1, (const void *)_timeFormatter_KEY);
  if (!v7[0])
  {
    v7[0] = objc_alloc_init(MEMORY[0x24BDD1500]);

    location = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (id)objc_msgSend(location, "localeIdentifier");
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ja_JP"));

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v7[0], "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
    }
    else
    {
      objc_msgSend(v7[0], "setDateStyle:", 0);
      objc_msgSend(v7[0], "setTimeStyle:", 1);
    }
    objc_setAssociatedObject(v8, (const void *)_timeFormatter_KEY, v7[0], (void *)1);
    objc_storeStrong(&location, 0);
  }
  v3 = v7[0];
  objc_storeStrong(v7, 0);
  return v3;
}

- (id)_componentsFromDate:()SUSUI
{
  id v4;
  id v5;
  id v6[2];
  id location[2];
  id v8;

  v8 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v6[1] = (id)254;
  v4 = (id)objc_msgSend(v8, "_calendar");
  v6[0] = (id)objc_msgSend(v4, "components:fromDate:", 254, location[0]);

  v5 = v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)_uses24HourTimeForLocale
{
  id v3;
  BOOL v4;
  id location[3];

  location[2] = a1;
  location[1] = a2;
  v3 = (id)objc_msgSend(a1, "_timeFormatter");
  location[0] = (id)objc_msgSend(v3, "dateFormat");

  v4 = 1;
  if (objc_msgSend(location[0], "rangeOfString:", CFSTR("H")) == 0x7FFFFFFFFFFFFFFFLL)
    v4 = objc_msgSend(location[0], "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong(location, 0);
  return v4;
}

- (__CFString)formatCardinalityForDate:()SUSUI
{
  id v4;
  id location[2];
  id v6;
  __CFString *v7;

  v6 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v4 = (id)objc_msgSend(v6, "_componentsFromDate:", location[0]);
  if (objc_msgSend(v4, "hour") == 1
    || objc_msgSend(v4, "hour") == 13 && (objc_msgSend(v6, "_uses24HourTimeForLocale") & 1) == 0)
  {
    v7 = CFSTR("SINGULAR");
  }
  else
  {
    v7 = CFSTR("PLURAL");
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
  return v7;
}

@end
