@implementation PXStoryExportOperation

void __56___PXStoryExportOperation_collectAnalyticsForExportEnd___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "status") == 2;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStoryExportManager collectAnalyticsForExportEndWithConfiguration:analyticsToken:model:withSuccess:error:](PXStoryExportManager, "collectAnalyticsForExportEndWithConfiguration:analyticsToken:model:withSuccess:error:", v6, v3, v4, v2, v5);

}

void __61___PXStoryExportOperation_engine_shouldRenderLayout_sprites___block_invoke(uint64_t a1, uint64_t a2, unsigned int **a3, _BYTE *a4)
{
  uint64_t v8;
  int v9;
  NSObject *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  unsigned int *v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[16];
  __int128 v28;
  uint64_t v29;

  v8 = **a3;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + v8);
  if (*(_BYTE *)a3[3] == 1 && v9 != 0)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "export only supports metal rendering", buf, 2u);
    }

  }
  if ((v9 - 1) >= 2)
  {
    if (v9 == 4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 40), "errorForEntity:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a3[3];
      v17 = *(_OWORD *)v16;
      v18 = *((_OWORD *)v16 + 1);
      v29 = *((_QWORD *)v16 + 4);
      *(_OWORD *)buf = v17;
      v28 = v18;
      PXGSpriteInfoDescription();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("Sprite %u of %@ info:%@"), a2, v15, v19);

      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v12, CFSTR("failed to load sprite %@"), v21, v22, v23, v24, v25, (uint64_t)v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_setError:", v26);

      *a4 = 1;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __46___PXStoryExportOperation__initializeProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

void __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "audioQueue_audioWriter");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_audioWriteQueue_exportAudioWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

uint64_t __55___PXStoryExportOperation__addAudioInputToAssetWriter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAudioQueue_audioWriter:", *(_QWORD *)(a1 + 40));
}

void __55___PXStoryExportOperation__audibleVideoHilightsInStory__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  _OWORD v19[3];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "size");
  PXRectWithOriginAndSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (objc_msgSend(v3, "numberOfSegments") >= 1)
  {
    v12 = 0;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = objc_msgSend(v3, "identifierForSegmentAtIndex:", v12, v18);
      v25 = 0u;
      v26 = 0u;
      v24 = 0u;
      if (v3)
        objc_msgSend(v3, "timeRangeForSegmentWithIdentifier:", v14);
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __55___PXStoryExportOperation__audibleVideoHilightsInStory__block_invoke_2;
      v20[3] = &unk_1E5139440;
      v15 = v3;
      v16 = *(_QWORD *)(a1 + 32);
      v21 = v15;
      v22 = v16;
      v18 = *(_OWORD *)(a1 + 40);
      v17 = (id)v18;
      v23 = v18;
      v19[0] = v24;
      v19[1] = v25;
      v19[2] = v26;
      objc_msgSend(v15, "enumerateClipsInTimeRange:rect:usingBlock:", v19, v20, v5, v7, v9, v11);

      ++v12;
    }
    while (v12 < objc_msgSend(v15, "numberOfSegments"));
  }

}

void __55___PXStoryExportOperation__audibleVideoHilightsInStory__block_invoke_2(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  CMTimeFlags v15;
  char v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _PXStoryExport_VideoHighlightInfo *v20;
  _PXStoryExport_VideoHighlightInfo *v21;
  CMTimeEpoch v22;
  uint64_t v24;
  CMTimeFlags v25;
  int v26;
  CMTimeEpoch v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _BYTE v31[56];
  _BYTE rhs[32];
  __int128 v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  CMTime lhs;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CMTimeEpoch v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  __int128 v51;
  CMTimeEpoch v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  __int128 v57;
  _BYTE v58[32];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (a2 >= 1)
  {
    v7 = a2;
    v8 = a1;
    do
    {
      v9 = *(_QWORD *)(a5 + 712);
      v10 = *(_OWORD *)(a5 + 736);
      v59 = *(_OWORD *)(a5 + 720);
      v60 = v10;
      v61 = *(_OWORD *)(a5 + 752);
      if (v9 >= 2)
      {
        objc_msgSend(*(id *)(v8 + 32), "clipWithIdentifier:", *(_QWORD *)a5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_storyResourceDisplayAsset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = a3[1];
          v57 = *a3;
          *(_OWORD *)v58 = v14;
          *(_OWORD *)&v58[16] = a3[2];
          PXStoryClipVideoSegmentTimeRange(v11, &v51);
          v15 = HIDWORD(v51);
          v27 = v52;
          v28 = v53;
          v26 = v54;
          v30 = v55;
          v29 = v56;
          *(_OWORD *)v31 = v57;
          *(_OWORD *)&v31[16] = *(_OWORD *)v58;
          *(_OWORD *)&v31[32] = *(_OWORD *)&v58[16];
          PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v11, (__int128 *)v31, 1u, &v46);
          v25 = HIDWORD(v46);
          v22 = v47;
          v24 = v48;
          v16 = v49;
          v17 = v50;
          v44 = 0u;
          v45 = 0u;
          v43 = 0u;
          *(_OWORD *)v31 = v57;
          *(_OWORD *)&v31[16] = *(_OWORD *)v58;
          *(_OWORD *)&v31[32] = *(_OWORD *)&v58[16];
          PXStoryClipTimeRangeByAddingJLCutsToTimeRange(v11, (uint64_t)v31, (uint64_t)&v43);
          if ((v15 & 1) == 0 || (v30 & 1) == 0 || v29 || v28 < 0 || (v25 & 1) == 0 || (v16 & 1) == 0 || v17 || v24 < 0)
          {
            lhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            *(_OWORD *)rhs = *(_OWORD *)&v58[8];
            *(_QWORD *)&rhs[16] = *(_QWORD *)&v58[24];
            CMTimeRangeMake((CMTimeRange *)v31, &lhs, (CMTime *)rhs);
            v62 = *(_QWORD *)v31;
            v18 = *(_DWORD *)&v31[12];
            v63 = *(_DWORD *)&v31[8];
            v19 = *(_QWORD *)&v31[16];
          }
          else
          {
            lhs.value = v46;
            lhs.timescale = DWORD2(v46);
            lhs.flags = v25;
            lhs.epoch = v22;
            *(_QWORD *)rhs = v51;
            *(_QWORD *)&rhs[8] = __PAIR64__(v15, DWORD2(v51));
            *(_QWORD *)&rhs[16] = v27;
            CMTimeSubtract((CMTime *)v31, &lhs, (CMTime *)rhs);
            v62 = *(_QWORD *)v31;
            v18 = *(_DWORD *)&v31[12];
            v63 = *(_DWORD *)&v31[8];
            v19 = *(_QWORD *)&v31[16];
          }
          v20 = [_PXStoryExport_VideoHighlightInfo alloc];
          v37 = v19;
          lhs.value = v51;
          lhs.timescale = DWORD2(v51);
          lhs.flags = v15;
          lhs.epoch = v27;
          v39 = v28;
          v40 = v26;
          v41 = v30;
          v42 = v29;
          v34 = v62;
          v35 = v63;
          v36 = v18;
          *(_OWORD *)rhs = v43;
          *(_OWORD *)&rhs[16] = v44;
          v33 = v45;
          *(_QWORD *)v31 = v9;
          *(_OWORD *)&v31[8] = v59;
          *(_OWORD *)&v31[24] = v60;
          *(_OWORD *)&v31[40] = v61;
          v21 = -[_PXStoryExport_VideoHighlightInfo initWithAsset:loadingVideoTimeRange:loadedVideoPlaybackStartTime:storyPlaybackRange:audioInfo:](v20, "initWithAsset:loadingVideoTimeRange:loadedVideoPlaybackStartTime:storyPlaybackRange:audioInfo:", v13, &lhs, &v34, rhs, v31);
          v8 = a1;
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);

        }
      }
      a3 += 3;
      a5 += 768;
      --v7;
    }
    while (v7);
  }
}

void __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13[2];
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "audioQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_2;
  block[3] = &unk_1E51393F0;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v6;
  v16 = v9;
  block[1] = 3221225472;
  v17 = v7;
  v18 = v10;
  v19 = *(id *)(a1 + 48);
  *(_OWORD *)v13 = *(_OWORD *)(a1 + 56);
  v11 = v13[0];
  v20 = *(_OWORD *)v13;
  v12 = v7;
  v13[0] = v6;
  dispatch_sync(v8, block);

}

intptr_t __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_314(intptr_t result)
{
  intptr_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  _BYTE v54[56];
  _QWORD v55[3];
  uint8_t buf[4];
  NSObject *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v15, CFSTR("failed to load video for asset %@"), v17, v18, v19, v20, v21, (uint64_t)v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_setError:", v22);

    PLStoryGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    objc_msgSend(*(id *)(a1 + 56), "asset");
    v24 = objc_claimAutoreleasedReturnValue();
    -[NSObject uuid](v24, "uuid");
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v57 = v25;
    v26 = "failed to load video for asset %{public}@";
    v27 = v23;
    goto LABEL_20;
  }
  v3 = *(void **)(a1 + 56);
  v4 = *(void **)(a1 + 64);
  if (!v3)
  {
    memset(v55, 0, sizeof(v55));
    goto LABEL_12;
  }
  objc_msgSend(v3, "loadedVideoPlaybackStartTime");
  v5 = *(void **)(a1 + 56);
  if (!v5)
  {
LABEL_12:
    memset(v54, 0, 48);
    goto LABEL_13;
  }
  objc_msgSend(v5, "storyPlaybackRange");
  v6 = *(void **)(a1 + 56);
  if (!v6)
  {
LABEL_13:
    v53 = 0;
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    v8 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "audioInfo");
  v7 = *(void **)(a1 + 56);
  v8 = v51;
  if (!v7)
  {
LABEL_14:
    v49 = 0;
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
    v9 = 0.0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "audioInfo");
  v9 = *((double *)&v48 + 1);
  v10 = *(void **)(a1 + 56);
  if (!v10)
  {
LABEL_15:
    v45 = 0.0;
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
    v12 = 0.0;
    goto LABEL_16;
  }
  objc_msgSend(v10, "audioInfo");
  v11 = *(void **)(a1 + 56);
  v12 = v45;
  if (v11)
  {
    objc_msgSend(v11, "audioInfo");
    v14 = v38 == 3;
    goto LABEL_17;
  }
LABEL_16:
  v14 = 0;
  v41 = 0;
  HIDWORD(v13) = 0;
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
LABEL_17:
  v37 = 0;
  LODWORD(v13) = v8;
  v28 = objc_msgSend(v4, "addAudioFromVideoHighlightAsset:fromTime:atStoryTimeRange:volume:fadeIn:fadeOut:shouldDuck:error:", v2, v55, v54, v14, &v37, v13, v9, v12);
  v23 = v37;
  if ((v28 & 1) != 0)
    goto LABEL_22;
  objc_msgSend(*(id *)(a1 + 56), "asset");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "uuid");
  v24 = objc_claimAutoreleasedReturnValue();

  PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v23, CFSTR("failed to add audio from video %@ for asset %@"), v30, v31, v32, v33, v34, *(_QWORD *)(a1 + 32));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_setError:", v35);

  PLStoryGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v57 = v24;
    v26 = "failed to add audio from video %{public}@";
    v27 = v25;
LABEL_20:
    _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
  }

LABEL_22:
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (!*(_BYTE *)(v36 + 24))
  {
    *(_BYTE *)(v36 + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
  }
}

void __114___PXStoryExportOperation__handleMediaRequestCompletedForSongAsset_avAsset_audioMix_info_audioCompositionBuilder___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ProgramLoudnessLKFS"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ProgramLoudnessLKFS"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "floatValue");
      v6 = v5;

      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("PeakdBFS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");

      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "musicTargetLoudnessLKFS");
      PXVolumeGainForTargetLoudness(v9, v6);
      v11 = v10;

    }
    else
    {
      v11 = 1.0;
    }
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 64);
    v21 = *(_QWORD *)(a1 + 72);
    v32 = 0;
    *(float *)&v3 = v11;
    v22 = objc_msgSend(v20, "addMusicAsset:withAudioMix:preferredVolume:error:", v19, v21, &v32, v3);
    v23 = v32;
    if ((v22 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v23, CFSTR("failed to add song %@ to audio composition"), v25, v26, v27, v28, v29, (uint64_t)v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_setError:", v30);

    }
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("Error"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v31, CFSTR("failed to load media for song %@"), v13, v14, v15, v16, v17, (uint64_t)v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_setError:", v18);

  }
}

void __66___PXStoryExportOperation__addSongAssetToAudioCompositionBuilder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  PXAudioRequestOptions *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id location;
  int v42;
  int v43;
  uint64_t v44;
  id v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentSongResource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_storyResourceSongAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_17;
  v5 = MEMORY[0x1E0CA2E18];
  v45 = (id)*MEMORY[0x1E0CA2E18];
  v46 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "targetDuration");
    v45 = location;
    v7 = v43;
    v46 = v42;
    if ((v43 & 1) != 0)
    {
      v9 = v44;
    }
    else
    {
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        objc_msgSend(v8, "exportDuration");
        v7 = HIDWORD(v39);
        v9 = v40;
      }
      else
      {
        v9 = 0;
        v7 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
      }
      v45 = v38;
      v46 = v39;
    }
LABEL_14:

    goto LABEL_15;
  }
  v7 = *(_DWORD *)(v5 + 12);
  v9 = *(_QWORD *)(v5 + 16);
  if (objc_msgSend(v4, "catalog") != 2
    || (objc_msgSend(*(id *)(a1 + 32), "configuration"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "activityType"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
LABEL_15:
    v20 = (objc_class *)objc_msgSend(v4, "defaultMediaProviderClass");
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "qualityOfService");
      v21 = objc_msgSend([v20 alloc], "initWithQOSClass:", px_dispatch_qos_from_nsqualityofservice());
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      v24 = objc_alloc_init(PXAudioRequestOptions);
      v34 = v45;
      v35 = v46;
      v36 = v7;
      v37 = v9;
      -[PXAudioRequestOptions setPreferredDuration:](v24, "setPreferredDuration:", &v34);
      -[PXAudioRequestOptions setIntent:](v24, "setIntent:", 2);
      PXAudioAssetDefaultEntryPoint(v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAudioRequestOptions setEntryPoint:](v24, "setEntryPoint:", v25);

      objc_initWeak(&location, *(id *)(a1 + 32));
      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = (uint64_t)__66___PXStoryExportOperation__addSongAssetToAudioCompositionBuilder___block_invoke_302;
      v29[3] = (uint64_t)&unk_1E5139378;
      objc_copyWeak(&v33, &location);
      v30 = v4;
      v31 = *(id *)(a1 + 40);
      v32 = *(id *)(a1 + 48);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v26, "requestMediaForAsset:options:resultHandler:", v30, v24, v29);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);

    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PXStoryExportManager collectAnalyticsForFixationWithAppleMusicAsset:configuration:](PXStoryExportManager, "collectAnalyticsForFixationWithAppleMusicAsset:configuration:", v6, v12);

    if (!v13)
    {
      PXStoryErrorCreateWithCodeDebugFormat(10, CFSTR("Could not collect apple music fixation analytics"), v14, v15, v16, v17, v18, v19, v29[0]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_setError:", v28);

      goto LABEL_17;
    }
    goto LABEL_14;
  }
  PXAssertGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    LOWORD(location) = 0;
    _os_log_error_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "Expected PXAppleMusicAsset when song exporting with catalog AppleMusic", (uint8_t *)&location, 2u);
  }

LABEL_17:
}

intptr_t __66___PXStoryExportOperation__addSongAssetToAudioCompositionBuilder___block_invoke_302(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 56);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleMediaRequestCompletedForSongAsset:avAsset:audioMix:info:audioCompositionBuilder:", *(_QWORD *)(a1 + 32), v10, v9, v8, *(_QWORD *)(a1 + 40));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __47___PXStoryExportOperation__setupAudioExporting__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47___PXStoryExportOperation__setupAudioExporting__block_invoke_2;
  v3[3] = &unk_1E5139350;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "finishAndWaitWithResultHandler:", v3);
}

void __47___PXStoryExportOperation__setupAudioExporting__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  v14 = v8;
  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "_audioWriteQueue_setupAudioReaderWithAudioExportComposition:audioMix:", v17, v7);
  }
  else if (v8)
  {
    PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v8, CFSTR("failed to build audio composition"), v9, v10, v11, v12, v13, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setError:", v15);

  }
}

void __57___PXStoryExportOperation__checkForDriftFromCurrentTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_storyQueue_checkForDriftFromCurrentTime:", &v3);

}

void __39___PXStoryExportOperation__exportVideo__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39___PXStoryExportOperation__exportVideo__block_invoke_2;
  v3[3] = &unk_1E51457F0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_pixelBufferRenderDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRenderCompletionBlock:", v3);

  objc_destroyWeak(&v4);
}

void __39___PXStoryExportOperation__exportVideo__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "videoWriterQueue_pixelBufferWriter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWriterInput");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markAsFinished");

}

void __39___PXStoryExportOperation__exportVideo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_storyQueue_processRenderedLayoutPixelBuffer:", a2);

}

void __67___PXStoryExportOperation__writeVideoWithPixelBuffer_forStoryTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "_videoWriterQueue_writeVideoWithPixelBuffer:forStoryTime:", v3, &v4);

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
}

uint64_t __55___PXStoryExportOperation__addVideoInputToAssetWriter___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setVideoWriterQueue_pixelBufferWriter:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  memset(v4, 0, sizeof(v4));
  return objc_msgSend(v2, "setVideoQueue_firstWrittenStoryTime:", v4);
}

void __53___PXStoryExportOperation__advanceLayoutToStoryTime___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_storyQueue_advanceLayoutToStoryTime:", &v3);

}

void __44___PXStoryExportOperation__setupStoryLayout__block_invoke(uint64_t a1)
{
  void *v2;
  CVPixelBufferPoolRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id v18[2];
  id location;

  objc_msgSend(*(id *)(a1 + 32), "videoWriterQueue_pixelBufferWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CVPixelBufferPoolRetain((CVPixelBufferPoolRef)objc_msgSend(v2, "pixelBufferPool"));

  if (v3)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "storyQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44___PXStoryExportOperation__setupStoryLayout__block_invoke_2;
    block[3] = &unk_1E513A518;
    v18[1] = v3;
    objc_copyWeak(v18, &location);
    v11 = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v17 = v11;
    v12 = v10;
    dispatch_async(v12, block);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    PXStoryErrorCreateWithCodeDebugFormat(10, CFSTR("Unexpected adapter pixelBufferPool is nil"), v4, v5, v6, v7, v8, v9, (uint64_t)v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setError:", v14);

  }
}

void __44___PXStoryExportOperation__setupStoryLayout__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  PXStoryPacingManualTimeSource *v8;
  PXStoryPacingController *v9;
  PXStoryLayout *v10;
  void *v11;
  PXStoryDiagnosticHUDLayout *v12;
  void *v13;
  uint64_t v14;
  PXGEngine *v15;
  void *v16;
  void *v17;
  PXGEngine *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v3 = v2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[43];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryExportRequestSetupLayout", "setup layout for export %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(PXStoryPacingManualTimeSource);
  v9 = -[PXStoryPacingController initWithModel:timeSource:cueSource:]([PXStoryPacingController alloc], "initWithModel:timeSource:cueSource:", v7, v8, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_pacingController:", v9);
  -[PXStoryController performChanges:](v9, "performChanges:", &__block_literal_global_264_227484);
  v10 = -[PXStoryLayout initWithModel:]([PXStoryLayout alloc], "initWithModel:", v7);
  objc_msgSend(v7, "extendedTraitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  -[PXGLayout setDisplayScale:](v10, "setDisplayScale:");

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v12 = (PXStoryDiagnosticHUDLayout *)objc_claimAutoreleasedReturnValue();
  if (!-[PXStoryDiagnosticHUDLayout isExportHUDEnabled](v12, "isExportHUDEnabled"))
    goto LABEL_7;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "exportHUDType");

  if (v14)
  {
    v12 = -[PXStoryDiagnosticHUDLayout initWithDataSource:]([PXStoryDiagnosticHUDLayout alloc], "initWithDataSource:", *(_QWORD *)(a1 + 32));
    -[PXStoryLayout setDiagnosticOverlayLayout:](v10, "setDiagnosticOverlayLayout:", v12);
LABEL_7:

  }
  v15 = [PXGEngine alloc];
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_pixelBufferRenderDestination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storyQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXGEngine initWithPixelBufferDestination:layoutQueue:displayLinkClass:](v15, "initWithPixelBufferDestination:layoutQueue:displayLinkClass:", v16, v17, objc_opt_class());

  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_engine:", v18);
  -[PXGEngine setIsExporting:](v18, "setIsExporting:", 1);
  -[PXGEngine setVisible:](v18, "setVisible:", 1);
  -[PXGEngine setDelegate:](v18, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[PXGEngine setIsInitialLoad:](v18, "setIsInitialLoad:", 0);
  -[PXGEngine setLayout:](v18, "setLayout:", v10);
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_mediaProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGEngine registerAllTextureProvidersWithMediaProvider:](v18, "registerAllTextureProvidersWithMediaProvider:", v19);

  -[PXGEngine displayLink](v18, "displayLink");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "videoOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreferredFramesPerSecond:", objc_msgSend(v22, "frameRate"));

  v23 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v24 = v23;
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_END, v25, "StoryExportRequestSetupLayout", ", buf, 2u);
  }

}

uint64_t __44___PXStoryExportOperation__setupStoryLayout__block_invoke_262(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 1);
}

void __44___PXStoryExportOperation__setupStoryLayout__block_invoke_2(uint64_t a1)
{
  PXGPixelBufferMetalRenderDestination *v2;
  uint64_t v3;
  void *v4;
  PXGPixelBufferMetalRenderDestination *v5;
  id WeakRetained;
  PXGPixelBufferPool *v7;

  v7 = -[PXGPixelBufferPool initWithPixelBufferPool:]([PXGPixelBufferPool alloc], "initWithPixelBufferPool:", *(_QWORD *)(a1 + 56));
  v2 = [PXGPixelBufferMetalRenderDestination alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "videoOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v5 = -[PXGPixelBufferMetalRenderDestination initWithLayoutQueue:pixelBufferPool:scale:enablePoolRelease:](v2, "initWithLayoutQueue:pixelBufferPool:scale:enablePoolRelease:", v3, v7, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setStoryQueue_pixelBufferRenderDestination:", v5);

  CVPixelBufferPoolRelease(*(CVPixelBufferPoolRef *)(a1 + 56));
}

void __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 80);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_2;
  v9[3] = &unk_1E5139270;
  v10 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  v12 = v4;
  v13 = v5;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", v3, v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  NSObject *v6;
  id v7;

  v6 = *(NSObject **)(a1 + 32);
  v7 = a2;
  dispatch_assert_queue_V2(v6);
  LODWORD(v6) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  if ((_DWORD)v6)
  {
    *a4 = 1;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke(uint64_t a1)
{
  PXStoryResourcesPreloadingController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PXStoryBufferingController *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = [PXStoryResourcesPreloadingController alloc];
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXStoryResourcesPreloadingController initWithModel:mediaProvider:](v2, "initWithModel:mediaProvider:", v3, v4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setIsPreloadingEnabled:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "performChanges:", &__block_literal_global_242_227510);
  v8 = [PXStoryBufferingController alloc];
  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryBufferingController initWithModel:](v8, "initWithModel:", v9);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "performChanges:", &__block_literal_global_245_227512);
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_5;
  v10[3] = &unk_1E5139178;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v4;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v3, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", v2, v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_7(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "cancel");
  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "performChanges:", &__block_literal_global_252_227503);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "performChanges:", &__block_literal_global_253_227504);
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  CMTime v20;
  CMTime time;
  __int128 v22;
  _OWORD v23[2];
  CMTime v24;

  objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeRange");
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    v22 = 0u;
  }
  v24 = *(CMTime *)((char *)v23 + 8);

  time = v24;
  if (CMTimeGetSeconds(&time) == 0.0)
  {
    PXStoryErrorCreateWithCodeDebugFormat(10, CFSTR("empty timeline"), v5, v6, v7, v8, v9, v10, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setError:", v11);
  }
  else
  {
    v20 = v24;
    objc_msgSend(*(id *)(a1 + 32), "_setExportDuration:", &v20);
    objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "outroDuration");
    }
    else
    {
      v18 = 0uLL;
      v19 = 0;
    }
    v14 = *(void **)(a1 + 32);
    v16 = v18;
    v17 = v19;
    objc_msgSend(v14, "_setOutroDuration:", &v16);

    objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setExportedStyle:", v15);

  }
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 0);
}

BOOL __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "readinessStatus") == 3;
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_5(uint64_t a1, void *a2, char a3, _BYTE *a4)
{
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  if ((a3 & 2) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "loadingFractionComplete");
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)(float)(v7 * 100.0));
  }
  if ((a3 & 1) != 0
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isCompleted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    *a4 = 1;
  }
  if ((a3 & 4) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v13, CFSTR("resource preloading failed"), v8, v9, v10, v11, v12, v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_setError:", v14);

      *a4 = 1;
    }

  }
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsActive:", 1);
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsSongResourcesPreloadingEnabled:", 0);
  objc_msgSend(v2, "setIsActive:", 1);

}

void __43___PXStoryExportOperation__setupStoryModel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  PXStorySongController *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v3 = v2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[43];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryExportRequestSetupStoryModel", "setup layout for export %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_storyQueue_createStoryModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_storyModel:", v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43___PXStoryExportOperation__setupStoryModel__block_invoke_237;
  v12[3] = &unk_1E5142E50;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "performChanges:", v12);
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v7;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StoryExportRequestSetupStoryModel", "setup layout with model %p", buf, 0xCu);
  }

  v11 = -[PXStorySongController initWithModel:]([PXStorySongController alloc], "initWithModel:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_songController:", v11);

}

void __43___PXStoryExportOperation__setupStoryModel__block_invoke_237(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "videoOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersExportLayoutMatchesPlayback:", objc_msgSend(v3, "prefersExportLayoutMatchesPlayback"));

  objc_msgSend(v4, "setDesiredPlayState:", 1);
  objc_msgSend(v4, "setMusicReadinessStatus:", 3);

}

intptr_t __41___PXStoryExportOperation__finishWriting__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __31___PXStoryExportOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[PXApplicationState sharedState](PXApplicationState, "sharedState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginDisablingIdleTimerForReason:", CFSTR("Story export (PXStoryExportManager)"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

intptr_t __31___PXStoryExportOperation_main__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __31___PXStoryExportOperation_main__block_invoke_226(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    +[PXApplicationState sharedState](PXApplicationState, "sharedState");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endDisablingIdleTimer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  }
}

void __45___PXStoryExportOperation__setExportedStyle___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), *(id *)(a1 + 40));
}

void __40___PXStoryExportOperation_exportedStyle__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 328));
}

__n128 __45___PXStoryExportOperation__setOutroDuration___block_invoke(uint64_t a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 300);
  v2 = *(_QWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 40);
  *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

__n128 __40___PXStoryExportOperation_outroDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 300);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 316);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

__n128 __46___PXStoryExportOperation__setExportDuration___block_invoke(uint64_t a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 276);
  v2 = *(_QWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 40);
  *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

__n128 __41___PXStoryExportOperation_exportDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 276);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 292);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

uint64_t __49___PXStoryExportOperation__setHasAudioForExport___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 272) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __44___PXStoryExportOperation_hasAudioForExport__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 272);
  return result;
}

uint64_t __33___PXStoryExportOperation_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 256);
  return result;
}

uint64_t __38___PXStoryExportOperation__setStatus___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 256) = *(_QWORD *)(result + 40);
  return result;
}

void __32___PXStoryExportOperation_error__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 264));
}

void __37___PXStoryExportOperation__setError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 264), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("PXStoryErrorDomain")))
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "code");

      if (v4 == 11)
      {
        v5 = 3;
LABEL_7:
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = v5;
        return;
      }
    }
    else
    {

    }
    v5 = 4;
    goto LABEL_7;
  }
}

@end
