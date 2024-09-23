@implementation MTDownloadsCollectionView

- (MTDownloadsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  MTDownloadsCollectionView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTDownloadsCollectionView;
  v4 = -[MTDownloadsCollectionView initWithFrame:collectionViewLayout:](&v7, "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](UIColor, "backgroundColor"));
    -[MTDownloadsCollectionView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[MTDownloadsCollectionView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 1);
  }
  return v4;
}

@end
