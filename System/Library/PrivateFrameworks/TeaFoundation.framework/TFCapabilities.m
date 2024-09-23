@implementation TFCapabilities

+ (BOOL)isHardwareKeyboardAttached
{
  return GSEventIsHardwareKeyboardAttached() != 0;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken[0] != -1)
    dispatch_once(isInternalBuild_onceToken, &__block_literal_global);
  return isInternalBuild_internalBuild;
}

uint64_t __33__TFCapabilities_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  isInternalBuild_internalBuild = result;
  return result;
}

+ (BOOL)hasExtendedColorDisplay
{
  return MGGetBoolAnswer();
}

@end
