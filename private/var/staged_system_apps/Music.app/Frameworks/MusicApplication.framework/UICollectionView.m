@implementation UICollectionView

- (void)music_inheritedLayoutInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UICollectionView;
  -[UICollectionView music_inheritedLayoutInsetsDidChange](&v4, "music_inheritedLayoutInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v3, "music_collectionViewInheritedLayoutInsetsDidChange");

}

@end
