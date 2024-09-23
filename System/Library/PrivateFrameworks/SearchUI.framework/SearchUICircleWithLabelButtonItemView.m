@implementation SearchUICircleWithLabelButtonItemView

- (id)buttonFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:fontWeight:", *MEMORY[0x1E0DC4AA0], 0, *MEMORY[0x1E0DC1448]);
}

- (id)iconFont
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUICircleWithLabelButtonItemView;
  -[SearchUIButtonItemView buttonFont](&v3, sel_buttonFont);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)drawsTitle
{
  return !-[SearchUIButtonItemView isCompact](self, "isCompact");
}

- (id)accessibilityIdentifier
{
  return CFSTR("circle-label-button");
}

@end
