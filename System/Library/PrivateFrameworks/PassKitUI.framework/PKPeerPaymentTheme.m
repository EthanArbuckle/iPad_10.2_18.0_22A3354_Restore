@implementation PKPeerPaymentTheme

+ (id)primaryTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (id)secondaryTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "primaryTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)secondaryButtonTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.75, 1.0);
}

+ (id)secondaryButtonTextPressedColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "secondaryButtonTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)disabledTextColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "primaryTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.07, 0.07, 0.07, 1.0);
}

+ (id)platterColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.453, 0.453, 0.5, 0.18);
}

+ (id)platterPressedColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "platterColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)separatorColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "primaryTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.07);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
