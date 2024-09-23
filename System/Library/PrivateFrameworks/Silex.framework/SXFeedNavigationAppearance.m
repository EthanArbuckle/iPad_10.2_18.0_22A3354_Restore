@implementation SXFeedNavigationAppearance

- (NSString)iconImageIdentifier
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  if (v5 == 3.0)
  {
    -[SXFeedNavigationAppearance icon3xImageIdentifier](self, "icon3xImageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

    if (v9 == 2.0)
      -[SXFeedNavigationAppearance icon2xImageIdentifier](self, "icon2xImageIdentifier");
    else
      -[SXFeedNavigationAppearance icon1xImageIdentifier](self, "icon1xImageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

@end
