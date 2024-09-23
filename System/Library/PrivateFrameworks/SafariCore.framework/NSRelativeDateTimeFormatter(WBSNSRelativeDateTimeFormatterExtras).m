@implementation NSRelativeDateTimeFormatter(WBSNSRelativeDateTimeFormatterExtras)

+ (id)safari_suggestionsRelativeDateTimeFormatter
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
  objc_msgSend(v0, "setDateTimeStyle:", 1);
  objc_msgSend(v0, "setFormattingContext:", 4);
  return v0;
}

- (__CFString)safari_suggestionsLocalizedStringRelativeToNowForDate:()WBSNSRelativeDateTimeFormatterExtras
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDateInToday:", v4);

  if (v6)
  {
    v7 = CFSTR("Today (Frequently Visited)");
LABEL_5:
    _WBSLocalizedString(v7, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDateInYesterday:", v4);

  if (v9)
  {
    v7 = CFSTR("Yesterday");
    goto LABEL_5;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedStringForDate:relativeToDate:", v4, v12);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_1E64A2498;
  }
LABEL_6:

  return v10;
}

@end
