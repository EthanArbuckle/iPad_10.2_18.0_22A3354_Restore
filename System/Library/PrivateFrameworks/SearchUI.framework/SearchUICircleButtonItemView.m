@implementation SearchUICircleButtonItemView

- (id)defaultButtonFont
{
  void *v3;
  objc_super v5;

  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
  {
    if (-[SearchUIButtonItemView isCompact](self, "isCompact"))
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 8.0);
    else
      objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SearchUICircleButtonItemView;
    -[SearchUIButtonItemView defaultButtonFont](&v5, sel_defaultButtonFont);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)symbolScale
{
  objc_super v4;

  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
  {
    v4.receiver = self;
    v4.super_class = (Class)SearchUICircleButtonItemView;
    return -[SearchUIButtonItemView symbolScale](&v4, sel_symbolScale);
  }
  else if (-[SearchUIButtonItemView isCompact](self, "isCompact"))
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (BOOL)useContinuousCorners
{
  return 0;
}

- (BOOL)drawsTitle
{
  return 0;
}

- (BOOL)drawsBackgroundPlatter
{
  return 0;
}

- (BOOL)drawsIconBackgroundPlatter
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return CFSTR("circle-button");
}

@end
