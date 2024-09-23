@implementation NSCharacterSet(TextInputAdditions)

+ (id)punctuationAndWhitespaceCharacterSet
{
  if (punctuationAndWhitespaceCharacterSet___onceToken != -1)
    dispatch_once(&punctuationAndWhitespaceCharacterSet___onceToken, &__block_literal_global_15481);
  return (id)punctuationAndWhitespaceCharacterSet___punctuationAndWhitespaceCharacterSet;
}

+ (id)pinyinInputCharacterSet
{
  if (pinyinInputCharacterSet___onceToken != -1)
    dispatch_once(&pinyinInputCharacterSet___onceToken, &__block_literal_global_1);
  return (id)pinyinInputCharacterSet___pinyinCharset;
}

@end
