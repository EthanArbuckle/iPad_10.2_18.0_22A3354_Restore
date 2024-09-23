@implementation SearchUICapsuleButtonItemView

- (id)defaultButtonFont
{
  if (-[SearchUIButtonItemView isCompact](self, "isCompact"))
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  else
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:fontWeight:", *MEMORY[0x1E0DC4B10], 0, *MEMORY[0x1E0DC1438]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)verticalPaddingFontMultipler
{
  _BOOL4 v2;
  double result;

  v2 = -[SearchUIButtonItemView isCompact](self, "isCompact");
  result = 1.54;
  if (v2)
    return 1.96;
  return result;
}

- (double)horizontalPadding
{
  _BOOL4 v2;
  double result;

  v2 = -[SearchUIButtonItemView isCompact](self, "isCompact");
  result = 18.0;
  if (v2)
    return 14.0;
  return result;
}

- (int64_t)symbolScale
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUICapsuleButtonItemView;
  return -[SearchUIButtonItemView symbolScale](&v3, sel_symbolScale);
}

- (double)spacingBetweenImageAndText
{
  return 4.0;
}

- (id)accessibilityIdentifier
{
  return CFSTR("capsule-button");
}

@end
