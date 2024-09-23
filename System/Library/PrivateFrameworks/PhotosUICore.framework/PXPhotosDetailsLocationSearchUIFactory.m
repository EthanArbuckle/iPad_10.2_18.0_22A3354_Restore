@implementation PXPhotosDetailsLocationSearchUIFactory

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  -[objc_class searchViewControllerWithAssets:delegate:](NSClassFromString(CFSTR("PXPhotosDetailsLocationSearchViewSwiftFactory")), "searchViewControllerWithAssets:delegate:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)searchViewControllerWithAssets:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  -[objc_class searchViewControllerWithAssets:delegate:completion:](NSClassFromString(CFSTR("PXPhotosDetailsLocationSearchViewSwiftFactory")), "searchViewControllerWithAssets:delegate:completion:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
