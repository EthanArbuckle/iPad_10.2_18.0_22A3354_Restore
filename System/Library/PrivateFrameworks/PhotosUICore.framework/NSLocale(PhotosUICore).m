@implementation NSLocale(PhotosUICore)

+ (uint64_t)px_currentCharacterDirection
{
  if (px_currentCharacterDirection_onceToken != -1)
    dispatch_once(&px_currentCharacterDirection_onceToken, &__block_literal_global_242884);
  return px_currentCharacterDirection_currentDirection;
}

+ (uint64_t)px_currentLeadingTextAlignment
{
  if (px_currentLeadingTextAlignment_onceToken != -1)
    dispatch_once(&px_currentLeadingTextAlignment_onceToken, &__block_literal_global_4_242883);
  return px_currentLeadingTextAlignment_textAlignment;
}

@end
