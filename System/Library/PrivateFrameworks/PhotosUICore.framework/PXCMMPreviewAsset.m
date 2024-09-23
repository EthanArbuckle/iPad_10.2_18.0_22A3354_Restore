@implementation PXCMMPreviewAsset

- (PXCMMPreviewAsset)initWithMomentShare:(id)a3 underlyingAsset:(id)a4
{
  id v7;
  id v8;
  PXCMMPreviewAsset *v9;
  PXCMMPreviewAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCMMPreviewAsset;
  v9 = -[PXCMMPreviewAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentShare, a3);
    objc_storeStrong((id *)&v10->_underlyingAsset, a4);
  }

  return v10;
}

- (PXCMMPreviewAsset)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPreviewAsset.m"), 32, CFSTR("%s is not available as initializer"), "-[PXCMMPreviewAsset init]");

  abort();
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PXCMMPreviewAsset underlyingAsset](self, "underlyingAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)mediaType
{
  return 1;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (NSDate)creationDate
{
  return 0;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (unsigned)playbackVariation
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)representsBurst
{
  return 0;
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (unint64_t)pixelWidth
{
  double v2;

  -[PXCMMPreviewAsset size](self, "size");
  return (unint64_t)v2;
}

- (unint64_t)pixelHeight
{
  double v2;

  -[PXCMMPreviewAsset size](self, "size");
  return (unint64_t)v2;
}

- (CGRect)preferredCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)faceAreaRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)isContentEqualTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PHMomentShare preview](self->_momentShare, "preview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "momentShare");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (v8)
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isPreviewImageDataAvailable
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  -[PHMomentShare preview](self->_momentShare, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[PHMomentShare preview](self->_momentShare, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 != 0;

  }
  return v5;
}

- (NSData)previewImageData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[PHMomentShare preview](self->_momentShare, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PHMomentShare preview](self->_momentShare, "preview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "thumbnailImageData");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSData *)v7;
}

- (UIImage)previewImage
{
  void *v3;
  UIImage *v4;
  UIImage *cachedImage;

  if (!self->_cachedImage && -[PXCMMPreviewAsset isPreviewImageDataAvailable](self, "isPreviewImageDataAvailable"))
  {
    -[PXCMMPreviewAsset previewImageData](self, "previewImageData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (UIImage *)DCIM_newPLImageWithData();
    cachedImage = self->_cachedImage;
    self->_cachedImage = v4;

  }
  return self->_cachedImage;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXCMMPreviewAsset bestCropRectForAspectRatio:verticalContentMode:cropMode:](self, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 3, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  PHAsset *underlyingAsset;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  underlyingAsset = self->_underlyingAsset;
  if (underlyingAsset)
  {
    v4 = (double)-[PHAsset pixelWidth](underlyingAsset, "pixelWidth");
    v5 = (double)-[PHAsset pixelHeight](self->_underlyingAsset, "pixelHeight");
    v6 = v4;
  }
  else
  {
    -[PXCMMPreviewAsset previewImage](self, "previewImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v8;
    v11 = v10;

    v6 = v9;
    v5 = v11;
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (double)aspectRatio
{
  double v2;
  double v3;
  double result;

  -[PXCMMPreviewAsset size](self, "size");
  result = v2 / v3;
  if (v3 <= 0.0)
    return 1.0;
  return result;
}

- (CGRect)bestCropRectForAspectRatio:(double)a3 verticalContentMode:(int64_t)a4 cropMode:(int64_t)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  -[PXCMMPreviewAsset aspectRatio](self, "aspectRatio", a4, a5);
  if (PXFloatApproximatelyEqualToFloat())
  {
    v6 = *(double *)off_1E50B86D0;
    v7 = *((double *)off_1E50B86D0 + 1);
    v8 = *((double *)off_1E50B86D0 + 2);
    v9 = *((double *)off_1E50B86D0 + 3);
  }
  else
  {
    -[PXCMMPreviewAsset size](self, "size");
    v11 = v10;
    v13 = v12;
    -[PHMomentShare preview](self->_momentShare, "preview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cropRect");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v31.origin.x = v16;
    v31.origin.y = v18;
    v31.size.width = v20;
    v31.size.height = v22;
    if (CGRectIsEmpty(v31))
    {
      v23 = *MEMORY[0x1E0C9D648];
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      PXRectFlippedVertically();
      PXRectFlippedVertically();
      PXLargestSalientAspectFilledCropRect();
      v23 = v27;
      v24 = v28;
      v25 = v29;
      v26 = v30;
    }
    v32.origin.x = v23;
    v32.origin.y = v24;
    v32.size.width = v25;
    v32.size.height = v26;
    if (CGRectIsEmpty(v32)
      || (v33.origin.x = 0.0, v33.origin.y = 0.0, v33.size.width = v11, v33.size.height = v13, CGRectIsEmpty(v33)))
    {
      v6 = *(double *)off_1E50B86D0;
      v7 = *((double *)off_1E50B86D0 + 1);
      v8 = *((double *)off_1E50B86D0 + 2);
      v9 = *((double *)off_1E50B86D0 + 3);
    }
    else
    {
      PXRectNormalize();
    }
  }
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (PHAsset)underlyingAsset
{
  return self->_underlyingAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAsset, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end
