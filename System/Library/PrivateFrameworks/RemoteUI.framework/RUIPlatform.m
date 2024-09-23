@implementation RUIPlatform

+ (BOOL)isAppleTV
{
  if (isAppleTV_onceToken != -1)
    dispatch_once(&isAppleTV_onceToken, &__block_literal_global);
  return isAppleTV_isAppleTV;
}

uint64_t __24__RUIPlatform_isAppleTV__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isAppleTV_isAppleTV = (_DWORD)result == 4;
  return result;
}

+ (void)assertWebkitAllowed
{
  id v2;

  if (MGGetBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Webkit is not allowed in diagnostics mode"), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
}

@end
