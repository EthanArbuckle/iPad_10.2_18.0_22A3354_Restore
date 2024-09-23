@implementation PXStoryResourcesPreloadingStatsStore

- (void)noteSessionStartedPreloadableClipsCounts:(id *)a3
{
  uint64_t v5;
  _QWORD v6[4];
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v7;
  _QWORD v8[4];
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v9;
  _QWORD v10[4];
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v11;

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke;
  v10[3] = &__block_descriptor_56_e16_v16__0____qqdq_8l;
  v11 = *a3;
  -[PXStoryResourcesPreloadingStatsStore _modifyStatsForPlaybackStyle:withModifier:](self, "_modifyStatsForPlaybackStyle:withModifier:", 1, v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_2;
  v8[3] = &__block_descriptor_56_e16_v16__0____qqdq_8l;
  v9 = *a3;
  -[PXStoryResourcesPreloadingStatsStore _modifyStatsForPlaybackStyle:withModifier:](self, "_modifyStatsForPlaybackStyle:withModifier:", 4, v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_3;
  v6[3] = &__block_descriptor_56_e16_v16__0____qqdq_8l;
  v7 = *a3;
  -[PXStoryResourcesPreloadingStatsStore _modifyStatsForPlaybackStyle:withModifier:](self, "_modifyStatsForPlaybackStyle:withModifier:", 3, v6);
}

- (void)noteClipWithPlaybackStyle:(int64_t)a3 loadedWithLoadingTime:(double)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__PXStoryResourcesPreloadingStatsStore_noteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke;
  v4[3] = &__block_descriptor_40_e16_v16__0____qqdq_8l;
  *(double *)&v4[4] = a4;
  -[PXStoryResourcesPreloadingStatsStore _modifyStatsForPlaybackStyle:withModifier:](self, "_modifyStatsForPlaybackStyle:withModifier:", a3, v4);
}

- (float)loadedFraction
{
  uint64_t v2;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PXStoryResourcesPreloadingStatsStore_loadedFraction__block_invoke;
  v5[3] = &unk_1E513EB60;
  v5[4] = &v10;
  v5[5] = &v6;
  -[PXStoryResourcesPreloadingStatsStore _enumerateAllStats:](self, "_enumerateAllStats:", v5);
  v2 = v11[3];
  if (v2 < 1)
    v3 = 1.0;
  else
    v3 = (float)v7[3] / (float)v2;
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (double)estimatedLoadingTimeLeft
{
  void *v4;
  int v5;
  double v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x2020000000;
  v29 = 0;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "estimateTimeLeftPerPlaybackStyle");

  if (v5)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke;
    v25[3] = &unk_1E513EB88;
    v25[4] = self;
    v25[5] = &v26;
    v25[6] = a2;
    -[PXStoryResourcesPreloadingStatsStore _enumerateAllStats:](self, "_enumerateAllStats:", v25);
  }
  else
  {
    v21 = 0;
    v22 = (double *)&v21;
    v23 = 0x2020000000;
    v24 = 0;
    v17 = 0;
    v18 = (double *)&v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke_2;
    v8[3] = &unk_1E513EBB0;
    v8[4] = &v21;
    v8[5] = &v17;
    v8[6] = &v13;
    v8[7] = &v9;
    -[PXStoryResourcesPreloadingStatsStore _enumerateAllStats:](self, "_enumerateAllStats:", v8);
    v27[3] = v27[3] + v22[3] / v18[3] * (double)(v14[3] - v10[3]);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  v6 = v27[3];
  _Block_object_dispose(&v26, 8);
  return v6;
}

- (BOOL)didDownloadFirstVideo
{
  return self->_videoClipsStats.preloadableClipsCount < 1 || self->_videoClipsStats.preloadedClipsCount > 0;
}

- (void)_modifyStatsForPlaybackStyle:(int64_t)a3 withModifier:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a4;
  switch(a3)
  {
    case 1:
      v8 = 8;
      break;
    case 3:
      v8 = 40;
      break;
    case 4:
      v8 = 72;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryResourcesPreloader.m"), 1056, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  v10 = v7;
  (*((void (**)(id, char *))v7 + 2))(v7, (char *)self + v8);

}

- (void)_enumerateAllStats:(id)a3
{
  void (*v5)(id, __int128 *, uint64_t, uint64_t);
  __int128 v6;
  id v7;
  uint64_t v8;
  void (*v9)(id, __int128 *, uint64_t);
  __int128 v10;
  void (*v11)(id, __int128 *, uint64_t);
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = (void (*)(id, __int128 *, uint64_t, uint64_t))*((_QWORD *)a3 + 2);
  v6 = *(_OWORD *)&self->_imageClipsStats.accumulatedClipsLoadingTime;
  v13 = *(_OWORD *)&self->_imageClipsStats.preloadableClipsCount;
  v14 = v6;
  v7 = a3;
  v5(v7, &v13, 1, v8);
  v9 = (void (*)(id, __int128 *, uint64_t))*((_QWORD *)a3 + 2);
  v10 = *(_OWORD *)&self->_videoClipsStats.accumulatedClipsLoadingTime;
  v13 = *(_OWORD *)&self->_videoClipsStats.preloadableClipsCount;
  v14 = v10;
  v9(v7, &v13, 4);
  v11 = (void (*)(id, __int128 *, uint64_t))*((_QWORD *)a3 + 2);
  v12 = *(_OWORD *)&self->_livePhotoClipsStats.accumulatedClipsLoadingTime;
  v13 = *(_OWORD *)&self->_livePhotoClipsStats.preloadableClipsCount;
  v14 = v12;
  v11(v7, &v13, 3);

}

double __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  double result;
  void *v8;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3 < 1)
  {
    if (a3 == 1)
    {
      v4 = 1.5;
    }
    else
    {
      if (a3 != 3 && a3 != 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PXStoryResourcesPreloader.m"), 1015, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v4 = 2.0;
    }
  }
  else
  {
    v4 = *(double *)(a2 + 16) / (double)v3;
  }
  v5 = *(_QWORD *)(a1[5] + 8);
  result = *(double *)(v5 + 24) + v4 * (double)(uint64_t)(*(_QWORD *)a2 - *(_QWORD *)(a2 + 8));
  *(double *)(v5 + 24) = result;
  return result;
}

double __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = *(double *)(a2 + 16) + *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
  v2 = *(_QWORD *)(a1[5] + 8);
  result = *(double *)(v2 + 24) + (double)*(uint64_t *)(a2 + 24);
  *(double *)(v2 + 24) = result;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)a2;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t __54__PXStoryResourcesPreloadingStatsStore_loadedFraction__block_invoke(uint64_t result, _QWORD *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += *a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) += a2[1];
  return result;
}

double __88__PXStoryResourcesPreloadingStatsStore_noteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)(a2 + 16) + fmax(*(double *)(a1 + 32), 1.0);
  *(double *)(a2 + 16) = result;
  ++*(_QWORD *)(a2 + 24);
  ++*(_QWORD *)(a2 + 8);
  return result;
}

uint64_t __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)(result + 32);
  a2[1] = 0;
  return result;
}

uint64_t __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_2(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)(result + 40);
  a2[1] = 0;
  return result;
}

uint64_t __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_3(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)(result + 48);
  a2[1] = 0;
  return result;
}

@end
