@implementation TSUGrouping

+ (void)beginGrouping
{
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  ++sIsGroupingLevel;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (void)endGrouping
{
  void *v2;
  void *v3;

  if (!sIsGroupingLevel)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUGrouping endGrouping]");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCutting.m");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 56, 0, "Mismatched beginGrouping / endGrouping calls");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  if (sIsGroupingLevel)
    --sIsGroupingLevel;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (BOOL)isGrouping
{
  return sIsGroupingLevel != 0;
}

@end
