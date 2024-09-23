@implementation PLVideoPlaybackResourceChoiceOptimizer

- (PLVideoPlaybackResourceChoiceOptimizer)initWithVideoResources:(id)a3
{
  id v5;
  PLVideoPlaybackResourceChoiceOptimizer *v6;
  PLVideoPlaybackResourceChoiceOptimizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLVideoPlaybackResourceChoiceOptimizer;
  v6 = -[PLVideoPlaybackResourceChoiceOptimizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_videoResources, a3);

  return v7;
}

- (NSArray)preferredVideoResources
{
  NSArray *playableVideos;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  id v13;
  NSArray *videoResources;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  _QWORD v19[5];
  NSArray *v20;
  char v21;
  BOOL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  playableVideos = self->_playableVideos;
  if (!playableVideos)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = self->_videoResources;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          if (!self->_masterVideoIsPresent)
          {
            v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v9, "hasAssociatedMediaMetadata"))
            {
              self->_masterVideoIsPresent = 1;
              self->_masterVideoIsPlayable = objc_msgSend(v9, "isPlayable");
            }
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    -[NSArray firstObject](self->_videoResources, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)objc_opt_class(), "deviceSupportsHDR");

    v12 = -[NSArray indexOfObjectPassingTest:](self->_videoResources, "indexOfObjectPassingTest:", &__block_literal_global_54867) != 0x7FFFFFFFFFFFFFFFLL;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    videoResources = self->_videoResources;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__PLVideoPlaybackResourceChoiceOptimizer_preferredVideoResources__block_invoke_2;
    v19[3] = &unk_1E366C730;
    v21 = v11;
    v22 = v12;
    v19[4] = self;
    v15 = (NSArray *)v13;
    v20 = v15;
    -[NSArray enumerateObjectsUsingBlock:](videoResources, "enumerateObjectsUsingBlock:", v19);
    v16 = self->_playableVideos;
    self->_playableVideos = v15;
    v17 = v15;

    playableVideos = self->_playableVideos;
  }
  return playableVideos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playableVideos, 0);
  objc_storeStrong((id *)&self->_videoResources, 0);
}

void __65__PLVideoPlaybackResourceChoiceOptimizer_preferredVideoResources__block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  int v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "isHDRDerivative");
  v4 = objc_msgSend(v6, "isSDRFallback");
  v5 = objc_msgSend(v6, "isHDROrSDRDependingOnMasterVideo");
  if (v3)
  {
    if (!*(_BYTE *)(a1 + 48))
      goto LABEL_11;
    goto LABEL_10;
  }
  if (v4)
  {
    if (!*(_BYTE *)(a1 + 48) || !*(_BYTE *)(a1 + 49))
      goto LABEL_10;
  }
  else
  {
    if (!v5)
    {
      if ((objc_msgSend(v6, "isPlayable") & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25))
LABEL_10:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
LABEL_11:

}

uint64_t __65__PLVideoPlaybackResourceChoiceOptimizer_preferredVideoResources__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHDRDerivative");
}

@end
