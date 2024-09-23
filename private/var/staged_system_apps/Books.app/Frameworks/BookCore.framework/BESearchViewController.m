@implementation BESearchViewController

+ (id)p_standardSearchBar
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)UISearchBar);
  v3 = IMCommonCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Type a word or page number"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  objc_msgSend(v2, "setPlaceholder:", v5);

  objc_msgSend(v2, "setAutocorrectionType:", 1);
  objc_msgSend(v2, "setAutocapitalizationType:", 0);
  objc_msgSend(v2, "setCenterPlaceholder:", 0);
  objc_msgSend(v2, "setSearchBarStyle:", 2);
  return v2;
}

@end
