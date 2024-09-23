@implementation NSCollectionLayoutSection(UICollectionLayoutListSection)

+ (_UICollectionViewListLayoutSection)sectionWithListConfiguration:()UICollectionLayoutListSection layoutEnvironment:
{
  void *v5;
  _UICollectionViewListLayoutSection *v6;

  objc_msgSend(a3, "_spiConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UICollectionViewListLayoutSection initWithConfiguration:layoutEnvironment:]([_UICollectionViewListLayoutSection alloc], "initWithConfiguration:layoutEnvironment:", v5, a4);

  return v6;
}

@end
