@implementation VSUtilities

+ (BOOL)isHomePod
{
  if (isHomePod_onceToken != -1)
    dispatch_once(&isHomePod_onceToken, &__block_literal_global_487);
  return isHomePod___isHomePod;
}

+ (BOOL)isHomeHub
{
  return 0;
}

+ (BOOL)isWatch
{
  return 0;
}

+ (BOOL)hasANE
{
  return +[VSNeuralTTSUtils hasANE](VSNeuralTTSUtils, "hasANE");
}

+ (BOOL)hasAMX
{
  return +[VSNeuralTTSUtils hasAMX](VSNeuralTTSUtils, "hasAMX");
}

+ (BOOL)isSeedBuild
{
  return 0;
}

+ (BOOL)isInternalBuild
{
  return MGGetBoolAnswer();
}

+ (BOOL)isH12Platform
{
  if (isH12Platform_onceToken != -1)
    dispatch_once(&isH12Platform_onceToken, &__block_literal_global_6);
  return isH12Platform_isH12Platform;
}

void __28__VSUtilities_isH12Platform__block_invoke()
{
  id v0;

  v0 = (id)MGGetStringAnswer();
  isH12Platform_isH12Platform = objc_msgSend(v0, "isEqualToString:", CFSTR("t8030"));

}

uint64_t __24__VSUtilities_isHomePod__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isHomePod___isHomePod = (_DWORD)result == 7;
  return result;
}

@end
