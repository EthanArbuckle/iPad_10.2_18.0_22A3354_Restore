@implementation NSDate(ReminderKitAdditions)

+ (void)setDebug_rem_nowOverride:()ReminderKitAdditions
{
  objc_storeStrong((id *)&__sNowOverride, obj);
}

+ (id)debug_rem_nowOverride
{
  return (id)__sNowOverride;
}

+ (id)rem_now
{
  if (__sNowOverride)
    return (id)__sNowOverride;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
