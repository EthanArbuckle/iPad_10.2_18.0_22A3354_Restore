@implementation CRKCardViewController(Legacy)

- (id)_legacyCardSectionViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "card");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cardSectionViewControllerForCardSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
