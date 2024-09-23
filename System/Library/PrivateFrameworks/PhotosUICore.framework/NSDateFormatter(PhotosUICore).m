@implementation NSDateFormatter(PhotosUICore)

+ (uint64_t)px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  if (px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_onceToken != -1)
    dispatch_once(&px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_onceToken, &__block_literal_global_134633);
  if (px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale)
    return px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_yearFirst != 0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale;
  px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale = v3;

  result = objc_msgSend(a1, "px_yearBeforeMonthForLocale:", px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale);
  px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_yearFirst = result;
  return result;
}

+ (BOOL)px_yearBeforeMonthForLocale:()PhotosUICore
{
  void *v3;
  unint64_t v4;
  _BOOL8 v5;

  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("yMMM"), 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsString:", CFSTR("y"))
    && objc_msgSend(v3, "containsString:", CFSTR("M")))
  {
    v4 = objc_msgSend(v3, "localizedStandardRangeOfString:", CFSTR("y"));
    v5 = v4 < objc_msgSend(v3, "localizedStandardRangeOfString:", CFSTR("M"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
