@implementation PXMusicCurationConcreteResult

- (PXMusicCurationConcreteResult)initWithAppleMusicCuration:(id)a3 flexMusicCuration:(id)a4 fallbackAsset:(id)a5 requestedCategories:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PXMusicCurationConcreteResult *v17;
  NSDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  NSDictionary *songsByCategory;
  NSDictionary *v35;
  id v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)PXMusicCurationConcreteResult;
  v17 = -[PXMusicCurationConcreteResult init](&v44, sel_init);
  if (v17)
  {
    v18 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    if (v12)
    {
      objc_msgSend(v12, "bestMusicSuggestions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("AppleMusicBest"));

      objc_msgSend(v12, "musicForYou");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("AppleMusicForYou"));

      objc_msgSend(v12, "musicForPerformer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v21, CFSTR("AppleMusicPerformer"));

      objc_msgSend(v12, "musicForTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v22, CFSTR("AppleMusicTime"));

      objc_msgSend(v12, "musicForLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v23, CFSTR("AppleMusicLocation"));

    }
    if (v13)
    {
      objc_msgSend(v13, "bestSongSuggestions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v24, CFSTR("FlexMusicBest"));

      objc_msgSend(v13, "secondarySongSuggestions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v25, CFSTR("FlexMusicSecondary"));

    }
    if (v14)
    {
      PXAudioAssetFetchResultWithAsset(v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v26, CFSTR("FlexMusicFallback"));

    }
    v37 = v16;
    v38 = v14;
    obj = a7;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v27 = v15;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v41;
      while (2)
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(v27);
          -[NSDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v31));
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
          {
            v33 = 0;
            goto LABEL_18;
          }
          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v29)
          continue;
        break;
      }
    }
    v33 = 1;
LABEL_18:

    songsByCategory = v17->_songsByCategory;
    v17->_songsByCategory = v18;
    v35 = v18;

    v17->_isComplete = v33;
    objc_storeStrong((id *)&v17->_error, obj);

    v16 = v37;
    v14 = v38;
  }

  return v17;
}

- (PXMusicCurationConcreteResult)initWithSongsByCategory:(id)a3
{
  NSDictionary *v4;
  void *v5;
  PXMusicCurationConcreteResult *v6;
  NSDictionary *songsByCategory;

  v4 = (NSDictionary *)a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMusicCurationConcreteResult initWithAppleMusicCuration:flexMusicCuration:fallbackAsset:requestedCategories:error:](self, "initWithAppleMusicCuration:flexMusicCuration:fallbackAsset:requestedCategories:error:", 0, 0, 0, v5, 0);

  songsByCategory = v6->_songsByCategory;
  v6->_songsByCategory = v4;

  v6->_isComplete = 1;
  return v6;
}

- (PXMusicCurationConcreteResult)init
{
  void *v3;
  PXMusicCurationConcreteResult *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXMusicCurationConcreteResult initWithAppleMusicCuration:flexMusicCuration:fallbackAsset:requestedCategories:error:](self, "initWithAppleMusicCuration:flexMusicCuration:fallbackAsset:requestedCategories:error:", 0, 0, 0, v3, 0);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMusicCurationConcreteResult isComplete](self, "isComplete");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  -[PXMusicCurationConcreteResult error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMusicCurationConcreteResult songsByCategory](self, "songsByCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; isComplete:%@, error:%@, songsByCategory:%@"),
    v5,
    self,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDictionary)songsByCategory
{
  return self->_songsByCategory;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_songsByCategory, 0);
}

@end
