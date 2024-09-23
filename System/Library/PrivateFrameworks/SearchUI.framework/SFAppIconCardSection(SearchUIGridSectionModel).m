@implementation SFAppIconCardSection(SearchUIGridSectionModel)

- (double)searchUIGridSectionModel_interItemSpacing
{
  return 0.0;
}

- (double)searchUIGridSectionModel_groupInsetFor:()SearchUIGridSectionModel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a3, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveContentSize");
  v5 = v4;
  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v7 = v5 + v6 * -2.0;

  v8 = (double)+[SearchUIAppIconUtilities numberOfAppIconsPerRow](SearchUIAppIconUtilities, "numberOfAppIconsPerRow");
  +[SearchUIAppIconUtilities preferredHorizontalPlatterInsetForAppIcons](SearchUIAppIconUtilities, "preferredHorizontalPlatterInsetForAppIcons");
  v10 = v9;
  +[SearchUIAppIconUtilities appIconItemSize](SearchUIAppIconUtilities, "appIconItemSize");
  objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", 0, -(v7 + -v8 * (v11 + v10 * 2.0)) / (v8 + -1.0));
  return 0.0;
}

@end
