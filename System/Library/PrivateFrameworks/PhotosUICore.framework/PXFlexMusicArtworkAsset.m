@implementation PXFlexMusicArtworkAsset

- (PXFlexMusicArtworkAsset)initWithAudioAsset:(id)a3
{
  id v5;
  PXFlexMusicArtworkAsset *v6;
  PXFlexMusicArtworkAsset *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFlexMusicArtworkAsset;
  v6 = -[PXFlexMusicArtworkAsset init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioAsset, a3);

  return v7;
}

- (PXFlexMusicArtworkAsset)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicArtworkAsset.m"), 26, CFSTR("%s is not available as initializer"), "-[PXFlexMusicArtworkAsset init]");

  abort();
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[PXFlexMusicArtworkAsset audioAsset](self, "audioAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "audioAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFlexMusicArtworkAsset audioAsset](self, "audioAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)defaultImageProviderClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isInCloud
{
  return 0;
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (unint64_t)pixelWidth
{
  return 0;
}

- (unint64_t)pixelHeight
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

- (BOOL)isEligibleForAutoPlayback
{
  return 0;
}

- (float)audioScore
{
  return 0.0;
}

- (BOOL)isFavorite
{
  return 0;
}

- (NSDate)localCreationDate
{
  return 0;
}

- (int64_t)isContentEqualTo:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self);
}

- (int64_t)mediaType
{
  return 1;
}

- (unint64_t)mediaSubtypes
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

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (PXFlexMusicAsset)audioAsset
{
  return self->_audioAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAsset, 0);
}

@end
