@implementation NSDate(VideosUI)

+ (id)vui_startOfDateInGMT:()VideosUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("GMT"));
  v5 = v3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v4);
    objc_msgSend(v6, "startOfDayForDate:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (BOOL)shouldShowLabelForDownloadExpirationDate:()VideosUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  _BOOL8 v11;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:toDate:options:", 32, v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "hour"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1111490560;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v8, "intValue");
  v11 = (int)v4 <= (int)objc_msgSend(v10, "intValue");

  return v11;
}

- (BOOL)vui_isInThePast
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "earlierDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == a1;

  return v4;
}

- (BOOL)vui_isInTheFuture
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "laterDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == a1;

  return v4;
}

@end
