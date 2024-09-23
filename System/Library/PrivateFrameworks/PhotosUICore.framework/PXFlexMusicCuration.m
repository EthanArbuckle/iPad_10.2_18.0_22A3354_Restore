@implementation PXFlexMusicCuration

- (PXFlexMusicCuration)initWithBestSongSuggestions:(id)a3 secondarySongSuggestions:(id)a4
{
  id v7;
  id v8;
  PXFlexMusicCuration *v9;
  PXFlexMusicCuration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFlexMusicCuration;
  v9 = -[PXFlexMusicCuration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bestSongSuggestions, a3);
    objc_storeStrong((id *)&v10->_secondarySongSuggestions, a4);
  }

  return v10;
}

- (PXFlexMusicCuration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicCuration.m"), 28, CFSTR("%s is not available as initializer"), "-[PXFlexMusicCuration init]");

  abort();
}

- (PXAudioAssetFetchResult)bestSongSuggestions
{
  return self->_bestSongSuggestions;
}

- (PXAudioAssetFetchResult)secondarySongSuggestions
{
  return self->_secondarySongSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySongSuggestions, 0);
  objc_storeStrong((id *)&self->_bestSongSuggestions, 0);
}

@end
