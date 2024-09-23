@implementation AEAudiobookPlugin

+ (id)urlScheme
{
  return CFSTR("audiobook");
}

- (id)associatedAssetType
{
  void *v2;

  v2 = (void *)objc_opt_class(self);
  return _objc_msgSend(v2, "associatedAssetType");
}

+ (id)associatedAssetType
{
  return AEHelperAssetTypeAudiobook;
}

- (id)supportedFileExtensions
{
  return 0;
}

- (id)supportedUrlSchemes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AEAudiobookPlugin urlScheme](AEAudiobookPlugin, "urlScheme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0));

  return v3;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
}

@end
