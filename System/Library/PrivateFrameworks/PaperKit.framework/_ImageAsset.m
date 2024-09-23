@implementation _ImageAsset

- (_ImageAsset)initWithImage:(id)a3
{
  id v5;
  _ImageAsset *v6;
  _ImageAsset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ImageAsset;
  v6 = -[_ImageAsset init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0;
}

- (BOOL)representsBurst
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

  v2 = 0.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)pixelWidth
{
  void *v2;
  double v3;
  unint64_t v4;

  -[_ImageAsset image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = (unint64_t)v3;

  return v4;
}

- (unint64_t)pixelHeight
{
  void *v2;
  double v3;
  unint64_t v4;

  -[_ImageAsset image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = (unint64_t)v3;

  return v4;
}

- (int64_t)mediaType
{
  return 1;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (id)localCreationDate
{
  return 0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (CGRect)faceAreaRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (Class)defaultImageProviderClass
{
  return 0;
}

- (id)creationDate
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (CGRect)acceptableCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
