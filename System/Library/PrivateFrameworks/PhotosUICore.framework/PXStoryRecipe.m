@implementation PXStoryRecipe

- (PXStoryRecipe)init
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  v2 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 48);
  v5[2] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 32);
  v5[3] = v2;
  v5[4] = *(_OWORD *)(MEMORY[0x1E0D759B0] + 64);
  v3 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 16);
  v5[0] = *MEMORY[0x1E0D759B0];
  v5[1] = v3;
  return -[PXStoryRecipe initWithAssetCollection:keyAsset:curatedAssets:untruncatedCuratedAssets:allAssets:movieHighlights:detailedSaliency:chapterCollection:overallDurationInfo:styleConfigurationList:sourcePersistableRecipe:initialSongResource:fallbackSongResource:autoEditDecisionListsBySong:](self, "initWithAssetCollection:keyAsset:curatedAssets:untruncatedCuratedAssets:allAssets:movieHighlights:detailedSaliency:chapterCollection:overallDurationInfo:styleConfigurationList:sourcePersistableRecipe:initialSongResource:fallbackSongResource:autoEditDecisionListsBySong:", 0, 0, 0, 0, 0, 0, 0, 0, v5, 0, 0, 0, 0, 0);
}

- (PXStoryRecipe)initWithAssetCollection:(id)a3 keyAsset:(id)a4 curatedAssets:(id)a5 untruncatedCuratedAssets:(id)a6 allAssets:(id)a7 movieHighlights:(id)a8 detailedSaliency:(id)a9 chapterCollection:(id)a10 overallDurationInfo:(id *)a11 styleConfigurationList:(id)a12 sourcePersistableRecipe:(id)a13 initialSongResource:(id)a14 fallbackSongResource:(id)a15 autoEditDecisionListsBySong:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  PXStoryRecipe *v26;
  PXStoryRecipe *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  NSDictionary *autoEditDecisionListsBySong;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v39 = a3;
  v45 = a4;
  v35 = a5;
  v44 = a5;
  v36 = a6;
  v43 = a6;
  v42 = a7;
  v41 = a8;
  v40 = a9;
  v38 = a10;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v46.receiver = self;
  v46.super_class = (Class)PXStoryRecipe;
  v26 = -[PXStoryRecipe init](&v46, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_assetCollection, a3);
    objc_storeStrong((id *)&v27->_keyAsset, a4);
    objc_storeStrong((id *)&v27->_curatedAssets, v35);
    objc_storeStrong((id *)&v27->_untruncatedCuratedAssets, v36);
    objc_storeStrong((id *)&v27->_allAssets, a7);
    objc_storeStrong((id *)&v27->_movieHighlights, a8);
    objc_storeStrong((id *)&v27->_detailedSaliency, a9);
    objc_storeStrong((id *)&v27->_chapterCollection, a10);
    *(_OWORD *)&v27->_overallDurationInfo.kind = *(_OWORD *)&a11->var0;
    v28 = *(_OWORD *)&a11->var1.var0.var1;
    v29 = *(_OWORD *)&a11->var1.var1.var0;
    v30 = *(_OWORD *)&a11->var1.var2.var1;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = *(_OWORD *)&a11->var1.var1.var3;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = v30;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v28;
    *(_OWORD *)&v27->_overallDurationInfo.specificDurationInfo.preferredDuration.value = v29;
    objc_storeStrong((id *)&v27->_styleConfigurationList, a12);
    objc_storeStrong((id *)&v27->_sourcePersistableRecipe, a13);
    objc_storeStrong((id *)&v27->_initialSongResource, a14);
    objc_storeStrong((id *)&v27->_fallbackSongResource, a15);
    v31 = objc_msgSend(v25, "copy");
    autoEditDecisionListsBySong = v27->_autoEditDecisionListsBySong;
    v27->_autoEditDecisionListsBySong = (NSDictionary *)v31;

  }
  return v27;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (PXDisplayAssetFetchResult)untruncatedCuratedAssets
{
  return self->_untruncatedCuratedAssets;
}

- (PXDisplayAssetFetchResult)allAssets
{
  return self->_allAssets;
}

- (PXStoryMovieHighlightsCollection)movieHighlights
{
  return self->_movieHighlights;
}

- (PXStorySaliencyDataSource)detailedSaliency
{
  return self->_detailedSaliency;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- ($336525CEFD5B2F1C5550B48E7B6054AC)overallDurationInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[1].var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[2].var1.var0.var1;
  v4 = *(_OWORD *)&self[1].var1.var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1.var1.var0;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
}

- (PXStoryStyleConfigurationList)styleConfigurationList
{
  return self->_styleConfigurationList;
}

- (PFStoryRecipe)sourcePersistableRecipe
{
  return self->_sourcePersistableRecipe;
}

- (PXStorySongResource)initialSongResource
{
  return self->_initialSongResource;
}

- (PXStorySongResource)fallbackSongResource
{
  return self->_fallbackSongResource;
}

- (NSDictionary)autoEditDecisionListsBySong
{
  return self->_autoEditDecisionListsBySong;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionListsBySong, 0);
  objc_storeStrong((id *)&self->_fallbackSongResource, 0);
  objc_storeStrong((id *)&self->_initialSongResource, 0);
  objc_storeStrong((id *)&self->_sourcePersistableRecipe, 0);
  objc_storeStrong((id *)&self->_styleConfigurationList, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_detailedSaliency, 0);
  objc_storeStrong((id *)&self->_movieHighlights, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_untruncatedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PXStoryRecipe curatedAssets](self, "curatedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecipe chapterCollection](self, "chapterCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    PXStoryChapterCollectionDiagnosticDescptionWithAssets(v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttachmentWithText:name:", v7, CFSTR("Chapters"));

  }
}

@end
