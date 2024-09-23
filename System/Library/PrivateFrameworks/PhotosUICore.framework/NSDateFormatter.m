@implementation NSDateFormatter

void __86__NSDateFormatter_PhotosUICore__px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale__block_invoke()
{
  id v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v1, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C99720], 0, 0, &__block_literal_global_2_134634);

}

void __86__NSDateFormatter_PhotosUICore__px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale__block_invoke_2()
{
  void *v0;

  v0 = (void *)px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale;
  px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale = 0;

}

@end
