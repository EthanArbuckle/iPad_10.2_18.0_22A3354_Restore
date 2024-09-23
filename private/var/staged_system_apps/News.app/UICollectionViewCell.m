@implementation UICollectionViewCell

- (BOOL)fr_isSwipeable
{
  return 0;
}

- (id)fr_parentCollectionView
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_opt_class(UICollectionView, a2);
  v5 = -[UICollectionViewCell _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class(UICollectionView, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = FCDynamicCast(v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

@end
