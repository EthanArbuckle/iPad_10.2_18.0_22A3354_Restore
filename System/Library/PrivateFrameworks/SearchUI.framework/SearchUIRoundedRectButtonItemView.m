@implementation SearchUIRoundedRectButtonItemView

- (double)horizontalPadding
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  result = 12.0;
  if (v2)
    return 15.0;
  return result;
}

- (double)verticalPaddingFontMultipler
{
  return 2.45;
}

- (double)cornerRadius
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  v3 = (void *)MEMORY[0x1E0DBD9B0];
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    v4 = 5.0;
  else
    v4 = 10.0;
  -[SearchUIButtonItemView buttonFont](self, "buttonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "scaledValueForValue:withFont:view:", v5, self, v4);
    v7 = v6;
  }
  else
  {
    -[SearchUIButtonItemView defaultButtonFont](self, "defaultButtonFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scaledValueForValue:withFont:view:", v8, self, v4);
    v7 = v9;

  }
  return v7;
}

- (id)accessibilityIdentifier
{
  return CFSTR("roundedRect-button");
}

@end
