@implementation _UIStatusBarVisualProvider_DynamicSplitMedium

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
  if (qword_1ECD7AF30 != -1)
    dispatch_once(&qword_1ECD7AF30, &__block_literal_global_227_0);
  return (id)qword_1ECD7AF38;
}

- (id)trailingItemCutoffWidths
{
  if (qword_1ECD7AF40 != -1)
    dispatch_once(&qword_1ECD7AF40, &__block_literal_global_234_1);
  return (id)qword_1ECD7AF48;
}

@end
