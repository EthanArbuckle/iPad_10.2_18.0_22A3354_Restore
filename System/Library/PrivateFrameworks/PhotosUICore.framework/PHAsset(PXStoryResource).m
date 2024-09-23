@implementation PHAsset(PXStoryResource)

- (uint64_t)px_storyResourceKind
{
  return 1;
}

- (id)px_storyResourceFetchVideoAdjustments
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *i;
  void *v5;
  id v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v5, "type") == 7)
        {
          v6 = objc_alloc(MEMORY[0x1E0D75308]);
          objc_msgSend(v5, "privateFileURL");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = (void *)objc_msgSend(v6, "initWithURL:", v7);

          goto LABEL_11;
        }
      }
      v2 = (void *)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (void)px_storyResourceFetchBestPlaybackRange
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  CMTimeValue v8;
  CMTimeScale v9;
  CMTimeFlags v10;
  BOOL v11;
  __int128 v12;
  uint64_t v13;
  CMTimeValue v14;
  CMTimeScale v15;
  CMTimeFlags v16;
  uint64_t v17;
  CMTime time2;
  CMTime time1;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  if ((objc_msgSend(a1, "isVideo") & 1) != 0 || objc_msgSend(a1, "isPhotoIris"))
  {
    objc_msgSend(a1, "fetchPropertySetsIfNeeded");
    objc_msgSend(a1, "mediaAnalysisProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "bestVideoTimeRange");
      v6 = HIDWORD(v12);
      v8 = v14;
      v7 = v13;
      v9 = v15;
      v10 = v16;
      v11 = v17 != 0;
    }
    else
    {
      v11 = 0;
      v10 = 0;
      v9 = 0;
      v8 = 0;
      v7 = 0;
      v6 = 0;
      v12 = 0u;
    }
    v20 = v12;
    v21 = DWORD2(v12);

    if ((v6 & 1) != 0 && (v10 & 1) != 0 && !v11 && (v8 & 0x8000000000000000) == 0)
    {
      time1.value = v8;
      time1.timescale = v9;
      time1.flags = v10;
      time1.epoch = 0;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time1, &time2))
      {
        *(_QWORD *)a2 = v20;
        *(_DWORD *)(a2 + 8) = v21;
        *(_DWORD *)(a2 + 12) = v6;
        *(_QWORD *)(a2 + 16) = v7;
        *(_QWORD *)(a2 + 24) = v8;
        *(_DWORD *)(a2 + 32) = v9;
        *(_DWORD *)(a2 + 36) = v10;
        *(_QWORD *)(a2 + 40) = 0;
      }
    }
  }
}

- (double)px_storyResourceFetchBestPlaybackRect
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestPlaybackRect");
  v4 = v3;

  return v4;
}

- (uint64_t)px_storyResourceFetchSceneClassifications
{
  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  return objc_msgSend(a1, "sceneClassifications");
}

- (uint64_t)px_storyResourceFetchCurationScore
{
  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  return objc_msgSend(a1, "curationScore");
}

- (uint64_t)px_storyResourceFetchFaceCount
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "fetchPropertySetsIfNeeded");
  objc_msgSend(a1, "mediaAnalysisProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "faceCount");

  return v3;
}

@end
