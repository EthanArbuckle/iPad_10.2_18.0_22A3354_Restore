@implementation UIUModelFetcher

+ (BOOL)areModelsAvailable
{
  void *v2;
  char v3;

  +[UIUModelFetcherCompat sharedFetcher](UIUModelFetcherCompat, "sharedFetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areAssetsPresent");

  return v3;
}

+ (BOOL)downloadModelSet:(int64_t)a3 timeout:(double)a4
{
  void *v6;

  +[UIUModelFetcherCompat sharedFetcher](UIUModelFetcherCompat, "sharedFetcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "startAssetDownloadWithModelSet:timeout:", a3, a4);

  return a3;
}

+ (BOOL)downloadModels:(double)a3
{
  void *v4;
  char v5;

  +[UIUModelFetcherCompat sharedFetcher](UIUModelFetcherCompat, "sharedFetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "startAssetDownloadWithModelSet:timeout:", 1, a3);

  return v5;
}

- (UIUModelFetcherCompat)underlyingObject
{
  return (UIUModelFetcherCompat *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
