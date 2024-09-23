@implementation PUPosterMediaDisplayAsset

- (PUPosterMediaDisplayAsset)initWithPosterMedia:(id)a3
{
  id v5;
  PUPosterMediaDisplayAsset *v6;
  PUPosterMediaDisplayAsset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPosterMediaDisplayAsset;
  v6 = -[PUPosterMediaDisplayAsset init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_posterMedia, a3);

  return v7;
}

- (PUPosterMediaDisplayAsset)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPosterMediaDisplayAsset.m"), 30, CFSTR("%s is not available as initializer"), "-[PUPosterMediaDisplayAsset init]");

  abort();
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUPosterMediaDisplayAsset posterMedia](self, "posterMedia");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PUPosterMediaDisplayAsset *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (PUPosterMediaDisplayAsset *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUPosterMediaDisplayAsset posterMedia](self, "posterMedia");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPosterMediaDisplayAsset posterMedia](v4, "posterMedia");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v8)
        v9 = 1;
      else
        v9 = objc_msgSend(v6, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)uuid
{
  return 0;
}

- (NSDate)creationDate
{
  return 0;
}

- (NSDate)localCreationDate
{
  return 0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (unint64_t)mediaSubtypes
{
  return 0;
}

- (int64_t)mediaType
{
  return 1;
}

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (BOOL)isInCloud
{
  return 0;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)pixelWidth
{
  return 0;
}

- (unint64_t)pixelHeight
{
  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGRect)preferredCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0D71110];
  v3 = *(double *)(MEMORY[0x1E0D71110] + 8);
  v4 = *(double *)(MEMORY[0x1E0D71110] + 16);
  v5 = *(double *)(MEMORY[0x1E0D71110] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)representsBurst
{
  return 0;
}

- (BOOL)isPartOfStack
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

- (BOOL)isInSharedLibrary
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

  v2 = *MEMORY[0x1E0D71110];
  v3 = *(double *)(MEMORY[0x1E0D71110] + 8);
  v4 = *(double *)(MEMORY[0x1E0D71110] + 16);
  v5 = *(double *)(MEMORY[0x1E0D71110] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (int64_t)playbackStyle
{
  return 1;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return 0;
}

- (PFPosterMedia)posterMedia
{
  return self->_posterMedia;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterMedia, 0);
}

@end
