@implementation _PXMomentShareMockDisplayAsset

- (NSString)uuid
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusMock.m"), 288, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (Class)defaultImageProviderClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusMock.m"), 292, CFSTR("Code which should be unreachable has been reached"));

  abort();
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

- (int64_t)isContentEqualTo:(id)a3
{
  return 0;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)mediaSubtypes
{
  return self->mediaSubtypes;
}

- (NSDate)creationDate
{
  return self->creationDate;
}

- (BOOL)isFavorite
{
  return self->favorite;
}

- (BOOL)representsBurst
{
  return self->representsBurst;
}

- (BOOL)isInCloud
{
  return self->isInCloud;
}

- (BOOL)isInSharedLibrary
{
  return self->isInSharedLibrary;
}

- (BOOL)isEligibleForAutoPlayback
{
  return self->isEligibleForAutoPlayback;
}

- (unint64_t)pixelWidth
{
  return self->pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->pixelHeight;
}

- (NSDate)localCreationDate
{
  return self->localCreationDate;
}

- (float)audioScore
{
  return self->audioScore;
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return self->hasPeopleSceneMidOrGreaterConfidence;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->localCreationDate, 0);
  objc_storeStrong((id *)&self->creationDate, 0);
}

@end
