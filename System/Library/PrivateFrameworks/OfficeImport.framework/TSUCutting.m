@implementation TSUCutting

+ (void)beginCutting
{
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  ++sIsCuttingLevel;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (void)endCutting
{
  void *v2;
  void *v3;

  if (!sIsCuttingLevel)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUCutting endCutting]");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCutting.m");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 31, 0, "Mismatched beginCutting / endCutting calls");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  if (sIsCuttingLevel)
    --sIsCuttingLevel;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (BOOL)isCutting
{
  return sIsCuttingLevel != 0;
}

@end
