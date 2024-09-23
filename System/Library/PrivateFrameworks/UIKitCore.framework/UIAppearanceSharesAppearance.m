@implementation UIAppearanceSharesAppearance

uint64_t ___UIAppearanceSharesAppearance_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(_UIMainBundleIdentifier(), "isEqualToString:", CFSTR("com.apple.gamecenter"));
  byte_1ECD7E183 = result ^ 1;
  return result;
}

@end
