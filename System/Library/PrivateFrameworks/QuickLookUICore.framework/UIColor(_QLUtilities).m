@implementation UIColor(_QLUtilities)

+ (id)_ql_markupBackgroundColor
{
  if (_ql_markupBackgroundColor_onceToken != -1)
    dispatch_once(&_ql_markupBackgroundColor_onceToken, &__block_literal_global_3);
  return (id)_ql_markupBackgroundColor_markupBackgroundColor;
}

@end
