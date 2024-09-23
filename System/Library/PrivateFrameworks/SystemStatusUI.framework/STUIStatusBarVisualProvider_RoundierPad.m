@implementation STUIStatusBarVisualProvider_RoundierPad

- (id)normalRoundFont
{
  int IsBoldTextEnabled;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v3 = (void *)unk_1EDBEE080;
  if (unk_1EDBEE080)
    v4 = byte_1EDBEE037 == IsBoldTextEnabled;
  else
    v4 = 0;
  if (!v4)
  {
    byte_1EDBEE037 = IsBoldTextEnabled;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:design:", *MEMORY[0x1E0DC13A8], 12.0, *MEMORY[0x1E0DC1438]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)unk_1EDBEE080;
    unk_1EDBEE080 = v5;

    v3 = (void *)unk_1EDBEE080;
  }
  return v3;
}

+ (NSDirectionalEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 25.0;
  v4 = 0.0;
  v5 = 26.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  +[STUIStatusBarBatteryItem iconDisplayIdentifier](STUIStatusBarBatteryItem, "iconDisplayIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

    goto LABEL_5;
  }
  v6 = (void *)v5;
  +[STUIStatusBarBatteryItem staticIconDisplayIdentifier](STUIStatusBarBatteryItem, "staticIconDisplayIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
LABEL_5:
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarVisualProvider_RoundierPad normalRoundFont](self, "normalRoundFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBarVisualProvider_RoundierPad;
  -[STUIStatusBarVisualProvider_Pad overriddenStyleAttributesForDisplayItemWithIdentifier:](&v11, sel_overriddenStyleAttributesForDisplayItemWithIdentifier_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

@end
