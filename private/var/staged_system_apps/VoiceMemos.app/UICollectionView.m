@implementation UICollectionView

- (id)indexPathForSelectedItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return v3;
}

- (void)scrollToTop
{
  -[UICollectionView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
}

@end
