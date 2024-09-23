@implementation PXPlacesUtils

- (id)pkExtendedTraitCollectionFromPXExtendedTraitCollection:(id)a3
{
  id v3;
  PKExtendedTraitCollection *v4;
  double v5;
  double v6;

  v3 = a3;
  v4 = objc_alloc_init(PKExtendedTraitCollection);
  -[PKExtendedTraitCollection setLayoutSizeClass:](v4, "setLayoutSizeClass:", objc_msgSend(v3, "layoutSizeClass"));
  -[PKExtendedTraitCollection setLayoutSizeSubclass:](v4, "setLayoutSizeSubclass:", objc_msgSend(v3, "layoutSizeSubclass"));
  -[PKExtendedTraitCollection setUserInterfaceIdiom:](v4, "setUserInterfaceIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));
  -[PKExtendedTraitCollection setUserInterfaceStyle:](v4, "setUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  objc_msgSend(v3, "displayScale");
  v6 = v5;

  -[PKExtendedTraitCollection setDisplayScale:](v4, "setDisplayScale:", v6);
  return v4;
}

@end
