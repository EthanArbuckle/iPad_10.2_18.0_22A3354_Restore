@implementation PULoadingIndicatorController

- (int64_t)loadingIndicatorStyleForAssetViewModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  int v8;
  int64_t v9;

  v3 = a3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "showLoadingIndicatorDuringDownload") & 1) != 0)
  {
    objc_msgSend(v3, "loadingStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state") == 1;

  }
  else
  {

    v6 = 0;
  }
  objc_msgSend(v3, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTemporaryPlaceholder");

  if (v8)
    v9 = 1;
  else
    v9 = v6;
  if (objc_msgSend(v3, "isUpdatingDisplayedContent"))
    v9 = 3;

  return v9;
}

- (BOOL)shouldInvalidateLoadingIndicatorForAssetViewModelChange:(id)a3
{
  id v3;
  void *v4;
  int v5;
  char v6;

  v3 = a3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showLoadingIndicatorDuringDownload");

  if (v5 && (objc_msgSend(v3, "loadingStatusChanged") & 1) != 0 || (objc_msgSend(v3, "assetChanged") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v3, "isUpdatingDisplayedContentChanged");

  return v6;
}

@end
