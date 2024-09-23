@implementation PEResourceLoadRequest

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRequireLocalResources:", -[PEResourceLoadRequest requireLocalResources](self, "requireLocalResources"));
  objc_msgSend(v4, "setRequireAdjustments:", -[PEResourceLoadRequest requireAdjustments](self, "requireAdjustments"));
  -[PEResourceLoadRequest delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v5);

  objc_msgSend(v4, "setVersion:", -[PEResourceLoadRequest version](self, "version"));
  -[PEResourceLoadRequest targetSize](self, "targetSize");
  objc_msgSend(v4, "setTargetSize:");
  objc_msgSend(v4, "setRequireOriginalsDownloaded:", -[PEResourceLoadRequest requireOriginalsDownloaded](self, "requireOriginalsDownloaded"));
  return v4;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
  -[PEResourceLoadRequest _setResolvedVersion:](self, "_setResolvedVersion:");
}

- (BOOL)_needsLoadAdjustments
{
  BOOL v3;

  v3 = -[PEResourceLoadRequest requireAdjustments](self, "requireAdjustments");
  return v3 | !-[PEResourceLoadRequest _isWorkVersionResolved](self, "_isWorkVersionResolved");
}

- (void)_resolveVersionIfNeededWithWorkVersion:(int64_t)a3
{
  if (!-[PEResourceLoadRequest _isWorkVersionResolved](self, "_isWorkVersionResolved"))
    -[PEResourceLoadRequest _setResolvedVersion:](self, "_setResolvedVersion:", a3);
}

- (BOOL)_isWorkVersionResolved
{
  return -[PEResourceLoadRequest _resolvedVersion](self, "_resolvedVersion") != 0;
}

- (void)_assertWorkVersionResolved
{
  id v4;

  if (!-[PEResourceLoadRequest _isWorkVersionResolved](self, "_isWorkVersionResolved"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PEResourceLoader.m"), 106, CFSTR("Can't fetch media without knowing the version to request"));

  }
}

- (BOOL)requireLocalResources
{
  return self->_requireLocalResources;
}

- (void)setRequireLocalResources:(BOOL)a3
{
  self->_requireLocalResources = a3;
}

- (BOOL)requireAdjustments
{
  return self->_requireAdjustments;
}

- (void)setRequireAdjustments:(BOOL)a3
{
  self->_requireAdjustments = a3;
}

- (BOOL)skipLivePhotoImageAndAVAsset
{
  return self->_skipLivePhotoImageAndAVAsset;
}

- (void)setSkipLivePhotoImageAndAVAsset:(BOOL)a3
{
  self->_skipLivePhotoImageAndAVAsset = a3;
}

- (PEResourceLoaderDelegate)delegate
{
  return (PEResourceLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)version
{
  return self->_version;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (BOOL)requireOriginalsDownloaded
{
  return self->_requireOriginalsDownloaded;
}

- (void)setRequireOriginalsDownloaded:(BOOL)a3
{
  self->_requireOriginalsDownloaded = a3;
}

- (int64_t)_resolvedVersion
{
  return self->__resolvedVersion;
}

- (void)_setResolvedVersion:(int64_t)a3
{
  self->__resolvedVersion = a3;
}

- (BOOL)assetLoadingAsRaw
{
  return self->_assetLoadingAsRaw;
}

- (void)setAssetLoadingAsRaw:(BOOL)a3
{
  self->_assetLoadingAsRaw = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
