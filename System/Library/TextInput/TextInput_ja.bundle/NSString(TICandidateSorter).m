@implementation NSString(TICandidateSorter)

- (__CFString)stringByConvertingKatakanaToHiragana
{
  __CFString *v1;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  CFStringTransform(v1, 0, (CFStringRef)*MEMORY[0x24BDBD610], 1u);
  return v1;
}

@end
