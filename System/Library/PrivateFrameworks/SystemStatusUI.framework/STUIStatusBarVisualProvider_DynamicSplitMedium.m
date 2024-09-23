@implementation STUIStatusBarVisualProvider_DynamicSplitMedium

+ (double)baseFontSize
{
  return 15.0;
}

+ (double)expandedFontSize
{
  return 15.0;
}

- (double)bottomLeadingTopOffset
{
  return 7.33333333;
}

- (double)lowerExpandedBaselineOffset
{
  return 22.0;
}

- (double)normalIconScale
{
  return 1.12;
}

- (double)expandedIconScale
{
  return 1.16;
}

- (id)leadingItemCutoffWidths
{
  if (qword_1EFC01C88 != -1)
    dispatch_once(&qword_1EFC01C88, &__block_literal_global_205);
  return (id)qword_1EFC01C90;
}

- (id)trailingItemCutoffWidths
{
  if (qword_1EFC01C98 != -1)
    dispatch_once(&qword_1EFC01C98, &__block_literal_global_212_0);
  return (id)qword_1EFC01CA0;
}

@end
