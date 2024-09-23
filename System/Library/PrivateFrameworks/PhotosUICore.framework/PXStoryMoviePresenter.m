@implementation PXStoryMoviePresenter

- (BOOL)presentMovieViewControllerForAssetCollection:(id)a3 keyAssetFetchResult:(id)a4 referencePersons:(id)a5 preferredTransitionType:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  PXStoryConfiguration *v12;
  void *v13;
  void *v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[PXStoryConfiguration initWithAssetCollection:keyAsset:referencePersons:]([PXStoryConfiguration alloc], "initWithAssetCollection:keyAsset:referencePersons:", v11, v10, v9);

  +[PXStoryUIFactory viewControllerWithConfiguration:contentViewController:](PXStoryUIFactory, "viewControllerWithConfiguration:contentViewController:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMoviePresenter presentingViewController](self, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v13, 1, 0);

  return 1;
}

@end
