@implementation UISearchBar(PKAppearanceObject)

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTintColor:", v5);

  objc_msgSend(v4, "searchBarTintcolor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBarTintColor:", v6);

  objc_msgSend(a1, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackground:", 0);

  objc_msgSend(a1, "searchField");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setBackgroundColor:", v8);
}

@end
