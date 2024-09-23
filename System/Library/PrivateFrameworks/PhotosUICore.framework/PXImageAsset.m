@implementation PXImageAsset

- (PXImageAsset)initWithImage:(id)a3
{
  id v5;
  PXImageAsset *v6;
  PXImageAsset *v7;
  double v8;
  double v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *uuid;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXImageAsset;
  v6 = -[PXImageAsset init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    objc_msgSend(v5, "size");
    v7->_pixelWidth = (unint64_t)v8;
    objc_msgSend(v5, "size");
    v7->_pixelHeight = (unint64_t)v9;
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@-%@"), v12, v13);
    uuid = v7->_uuid;
    v7->_uuid = (NSString *)v14;

  }
  return v7;
}

- (double)aspectRatio
{
  void *v2;
  double v3;
  double v4;
  double v5;

  -[PXImageAsset image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v5 = 1.0;
  if (v3 != 0.0 && v4 != 0.0 && (v3 != *MEMORY[0x1E0D71130] || v4 != *(double *)(MEMORY[0x1E0D71130] + 8)))
    v5 = fabs(v3 / v4);

  return v5;
}

- (int64_t)mediaType
{
  return 1;
}

- (unint64_t)mediaSubtypes
{
  return 0;
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

- (NSDate)creationDate
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

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (int64_t)isContentEqualTo:(id)a3
{
  if (a3 == self)
    return 2;
  else
    return 1;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
