@implementation _PXGAssetImageCacheEntry

- (NSMutableIndexSet)requestIDs
{
  return self->_requestIDs;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (void)setImageOrientation:(unsigned int)a3
{
  self->_imageOrientation = a3;
}

- (void)setCgImage:(CGImage *)a3
{
  CGImage *cgImage;

  cgImage = self->_cgImage;
  if (cgImage != a3)
  {
    CGImageRelease(cgImage);
    self->_cgImage = a3;
    CGImageRetain(a3);
  }
}

- (CGSize)imageSize
{
  double v3;
  double v4;
  CGSize result;

  -[_PXGAssetImageCacheEntry cgImage](self, "cgImage");
  -[_PXGAssetImageCacheEntry imageOrientation](self, "imageOrientation");
  PXCGImageGetSizeWithOrientation();
  result.height = v4;
  result.width = v3;
  return result;
}

- (unsigned)imageOrientation
{
  return self->_imageOrientation;
}

- (CGImage)cgImage
{
  CGImageRef v2;
  CGImage *v3;

  v2 = CGImageRetain(self->_cgImage);
  v3 = v2;
  if (v2)
    CFAutorelease(v2);
  return v3;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (_PXGAssetImageCacheEntry)init
{
  _PXGAssetImageCacheEntry *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *requestIDs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXGAssetImageCacheEntry;
  v2 = -[_PXGAssetImageCacheEntry init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    requestIDs = v2->_requestIDs;
    v2->_requestIDs = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_cgImage);
  v3.receiver = self;
  v3.super_class = (Class)_PXGAssetImageCacheEntry;
  -[_PXGAssetImageCacheEntry dealloc](&v3, sel_dealloc);
}

- (void)prepareForReuse
{
  void *v3;

  -[_PXGAssetImageCacheEntry requestIDs](self, "requestIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllIndexes");

  -[_PXGAssetImageCacheEntry setAsset:](self, "setAsset:", 0);
  -[_PXGAssetImageCacheEntry setCgImage:](self, "setCgImage:", 0);
  -[_PXGAssetImageCacheEntry setTargetSize:](self, "setTargetSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (PXDisplayAsset)asset
{
  return self->_asset;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requestIDs, 0);
}

@end
