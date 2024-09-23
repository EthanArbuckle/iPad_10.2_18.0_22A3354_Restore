@implementation WBSTabBarUIString

+ (id)accessibilityLabelForNumberOfTabs:(unint64_t)a3 andNumberOfPinnedTabs:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    if (a4)
    {
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, a3, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v9, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

@end
