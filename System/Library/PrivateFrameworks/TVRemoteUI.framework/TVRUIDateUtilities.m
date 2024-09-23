@implementation TVRUIDateUtilities

+ (id)localizedPlaybackTimeForInterval:(double)a3
{
  if (localizedPlaybackTimeForInterval__onceToken != -1)
    dispatch_once(&localizedPlaybackTimeForInterval__onceToken, &__block_literal_global_14);
  return (id)objc_msgSend((id)localizedPlaybackTimeForInterval__formatter, "stringFromTimeInterval:", a3);
}

uint64_t __55__TVRUIDateUtilities_localizedPlaybackTimeForInterval___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v1 = (void *)localizedPlaybackTimeForInterval__formatter;
  localizedPlaybackTimeForInterval__formatter = (uint64_t)v0;

  objc_msgSend((id)localizedPlaybackTimeForInterval__formatter, "setUnitsStyle:", 1);
  return objc_msgSend((id)localizedPlaybackTimeForInterval__formatter, "setAllowedUnits:", 96);
}

@end
