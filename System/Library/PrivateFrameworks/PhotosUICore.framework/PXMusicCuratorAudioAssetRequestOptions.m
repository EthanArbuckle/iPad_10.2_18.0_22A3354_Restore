@implementation PXMusicCuratorAudioAssetRequestOptions

- (NSDictionary)requestOptions
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D72218];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXMusicCuratorAudioAssetRequestOptions forceMetadataRefetch](self, "forceMetadataRefetch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)forceMetadataRefetch
{
  return self->_forceMetadataRefetch;
}

- (void)setForceMetadataRefetch:(BOOL)a3
{
  self->_forceMetadataRefetch = a3;
}

@end
