@implementation PXMutableCuratedLibraryStatistics

- (PXMutableCuratedLibraryStatistics)init
{
  PXMutableCuratedLibraryStatistics *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXMutableCuratedLibraryStatistics;
  v2 = -[PXMutableCuratedLibraryStatistics init](&v4, sel_init);
  if (v2)
    v2->_counts = (int64_t *)malloc_type_calloc(0x36uLL, 8uLL, 0x100004000313F17uLL);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_counts);
  v3.receiver = self;
  v3.super_class = (Class)PXMutableCuratedLibraryStatistics;
  -[PXMutableCuratedLibraryStatistics dealloc](&v3, sel_dealloc);
}

- (int64_t)numberOfAssetsWithPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  int64_t *counts;

  counts = self->_counts;
  return counts[-[PXMutableCuratedLibraryStatistics _coutIndexForPlaybackStyle:displayProminence:autoPlaybackEligibility:](self, "_coutIndexForPlaybackStyle:displayProminence:autoPlaybackEligibility:", a3, a4, a5)];
}

- (void)_incrementCountForPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  int64_t *counts;
  int64_t v6;

  counts = self->_counts;
  v6 = -[PXMutableCuratedLibraryStatistics _coutIndexForPlaybackStyle:displayProminence:autoPlaybackEligibility:](self, "_coutIndexForPlaybackStyle:displayProminence:autoPlaybackEligibility:", a3, a4, a5);
  ++counts[v6];
}

- (int64_t)_coutIndexForPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  return a3 + 6 * (3 * a5 + a4);
}

- (void)appendStatisticsForSection:(int64_t)a3 assetsDataSource:(id)a4 playbackController:(id)a5 visibleItems:(id)a6 heroItems:(id)a7 keyItem:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  PXMutableCuratedLibraryStatistics *v25;
  _QWORD *v26;
  int64_t v27;
  _QWORD v28[4];
  __int128 v29;
  int64x2_t v30;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x4010000000;
  v28[3] = &unk_1A7E74EE7;
  v29 = 0u;
  v30 = 0u;
  *(_QWORD *)&v29 = objc_msgSend(v14, "identifier");
  *((_QWORD *)&v29 + 1) = a3;
  v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __131__PXMutableCuratedLibraryStatistics_appendStatisticsForSection_assetsDataSource_playbackController_visibleItems_heroItems_keyItem___block_invoke;
  v21[3] = &unk_1E513A8A0;
  v26 = v28;
  v18 = v14;
  v22 = v18;
  v27 = a8;
  v19 = v17;
  v23 = v19;
  v20 = v15;
  v24 = v20;
  v25 = self;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v21);

  _Block_object_dispose(v28, 8);
}

void __131__PXMutableCuratedLibraryStatistics_appendStatisticsForSection_assetsDataSource_playbackController_visibleItems_heroItems_keyItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[2];

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(_OWORD *)(v5 + 48);
  v11[0] = *(_OWORD *)(v5 + 32);
  v11[1] = v6;
  objc_msgSend(v4, "assetAtItemIndexPath:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "playbackStyle");
  if (*(_QWORD *)(a1 + 72) == a2)
    v9 = 2;
  else
    v9 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", a2);
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "isAutoPlaybackEligibilityEstimated") & 1) != 0)
  {
    v10 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 48), "canPlayAsset:", v7)
         && (objc_msgSend(*(id *)(a1 + 48), "isDisplayAssetEligibleForAutoPlayback:", v7) & 1) != 0)
  {
    v10 = 2;
  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(*(id *)(a1 + 56), "_incrementCountForPlaybackStyle:displayProminence:autoPlaybackEligibility:", v8, v9, v10);

}

@end
