@implementation NSCharacterSet(ZhuyinAddition)

+ (id)zhuyinConsonantCharacterSet
{
  if (zhuyinConsonantCharacterSet___onceToken != -1)
    dispatch_once(&zhuyinConsonantCharacterSet___onceToken, &__block_literal_global_14856);
  return (id)zhuyinConsonantCharacterSet___zhuyinConsonantCharacterSet;
}

+ (id)zhuyinMedialCharacterSet
{
  if (zhuyinMedialCharacterSet___onceToken != -1)
    dispatch_once(&zhuyinMedialCharacterSet___onceToken, &__block_literal_global_2_14853);
  return (id)zhuyinMedialCharacterSet___zhuyinMedialCharacterSet;
}

+ (id)zhuyinVowelCharacterSet
{
  if (zhuyinVowelCharacterSet___onceToken != -1)
    dispatch_once(&zhuyinVowelCharacterSet___onceToken, &__block_literal_global_5);
  return (id)zhuyinVowelCharacterSet___zhuyinVowelCharacterSet;
}

+ (id)zhuyinPhonemeCharacterSet
{
  if (zhuyinPhonemeCharacterSet___onceToken != -1)
    dispatch_once(&zhuyinPhonemeCharacterSet___onceToken, &__block_literal_global_8_14848);
  return (id)zhuyinPhonemeCharacterSet___zhuyinPhonemeCharacterSet;
}

+ (id)zhuyinToneCharacterSet
{
  if (zhuyinToneCharacterSet___onceToken != -1)
    dispatch_once(&zhuyinToneCharacterSet___onceToken, &__block_literal_global_11_14845);
  return (id)zhuyinToneCharacterSet___zhuyinToneCharacterSet;
}

+ (id)zhuyinCharacterSet
{
  if (zhuyinCharacterSet___onceToken != -1)
    dispatch_once(&zhuyinCharacterSet___onceToken, &__block_literal_global_14_14842);
  return (id)zhuyinCharacterSet___zhuyinCharacterSet;
}

+ (id)punctuationAndSymbolCharacterSet
{
  if (punctuationAndSymbolCharacterSet___onceToken != -1)
    dispatch_once(&punctuationAndSymbolCharacterSet___onceToken, &__block_literal_global_17_14841);
  return (id)punctuationAndSymbolCharacterSet___punctuationAndSymbolCharacterSet;
}

@end
