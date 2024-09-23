@implementation NSCharacterSet(PhotosUICore)

+ (id)px_breakableWhitespaceCharacterSet
{
  if (px_breakableWhitespaceCharacterSet_onceToken != -1)
    dispatch_once(&px_breakableWhitespaceCharacterSet_onceToken, &__block_literal_global_119918);
  return (id)px_breakableWhitespaceCharacterSet_breakableWhitespaceCharacterSet;
}

@end
