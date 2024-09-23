@implementation PUMergedLivePhotosVideo

- (PUMergedLivePhotosVideo)initWithAssets:(id)a3 startTimes:(id)a4 keyTimes:(id)a5 videoAsset:(id)a6 videoComposition:(id)a7 videoAspectRatio:(double)a8 options:(unint64_t)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PUMergedLivePhotosVideo *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *assets;
  uint64_t v27;
  NSArray *startTimes;
  uint64_t v29;
  NSArray *keyTimes;
  void *v32;
  void *v33;
  SEL v34;
  objc_super v35;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v35.receiver = self;
  v35.super_class = (Class)PUMergedLivePhotosVideo;
  v22 = -[PUMergedLivePhotosVideo init](&v35, sel_init);
  if (v22)
  {
    v34 = a2;
    v23 = objc_msgSend(v17, "count");
    if (v23 != objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v34, v22, CFSTR("PUMergedLivePhotosVideo.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets.count == startTimes.count"));

    }
    v24 = objc_msgSend(v17, "count");
    if (v24 != objc_msgSend(v19, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v34, v22, CFSTR("PUMergedLivePhotosVideo.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assets.count == keyTimes.count"));

    }
    v25 = objc_msgSend(v17, "copy");
    assets = v22->_assets;
    v22->_assets = (NSArray *)v25;

    v27 = objc_msgSend(v18, "copy");
    startTimes = v22->_startTimes;
    v22->_startTimes = (NSArray *)v27;

    v29 = objc_msgSend(v19, "copy");
    keyTimes = v22->_keyTimes;
    v22->_keyTimes = (NSArray *)v29;

    objc_storeStrong((id *)&v22->_mergedVideoAsset, a6);
    objc_storeStrong((id *)&v22->_mergedVideoComposition, a7);
    v22->_videoAspectRatio = a8;
    v22->_options = a9;
  }

  return v22;
}

- (id)assetAtTime:(id *)a3 progress:(double *)a4
{
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double Seconds;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CMTime *v25;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime rhs;
  CMTime lhs;
  CMTime v32;
  CMTime end;
  CMTime start;
  CMTimeRange range;
  CMTime time;

  -[PUMergedLivePhotosVideo assets](self, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)a3;
  v8 = -[PUMergedLivePhotosVideo _assetIndexAtTime:](self, "_assetIndexAtTime:", &time);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_30;
    v11 = 0.0;
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
LABEL_29:
      *a4 = v11;
      goto LABEL_30;
    }
    -[PUMergedLivePhotosVideo keyTimes](self, "keyTimes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "CMTimeValue");
    else
      memset(&start, 0, sizeof(start));
    objc_msgSend(v12, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "CMTimeValue");
    else
      memset(&end, 0, sizeof(end));
    CMTimeRangeFromTimeToTime(&range, &start, &end);
    time = (CMTime)*a3;
    v17 = CMTimeRangeContainsTime(&range, &time);

    if (v17)
    {
      memset(&time, 0, sizeof(time));
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        objc_msgSend(v18, "CMTimeValue");
      else
        memset(&time, 0, sizeof(time));

      lhs = (CMTime)*a3;
      rhs = time;
      CMTimeSubtract(&v32, &lhs, &rhs);
      Seconds = CMTimeGetSeconds(&v32);
      if (Seconds <= 0.0 || v10 + 1 >= (unint64_t)objc_msgSend(v7, "count"))
      {
        if (v10 < 1 || Seconds >= 0.0)
          goto LABEL_28;
        memset(&lhs, 0, sizeof(lhs));
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10 - 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
          objc_msgSend(v23, "CMTimeValue");
        else
          memset(&lhs, 0, sizeof(lhs));

        rhs = time;
        v28 = lhs;
        CMTimeSubtract(&v27, &rhs, &v28);
        v25 = &v27;
      }
      else
      {
        memset(&lhs, 0, sizeof(lhs));
        objc_msgSend(v12, "objectAtIndexedSubscript:", v10 + 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
          objc_msgSend(v21, "CMTimeValue");
        else
          memset(&lhs, 0, sizeof(lhs));

        rhs = lhs;
        v28 = time;
        CMTimeSubtract(&v29, &rhs, &v28);
        v25 = &v29;
      }
      v11 = Seconds / CMTimeGetSeconds(v25);
    }
LABEL_28:

    goto LABEL_29;
  }
  v9 = 0;
LABEL_30:

  return v9;
}

- (int64_t)_assetIndexAtTime:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CMTime v17;
  CMTime lhs;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  _QWORD v22[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;

  -[PUMergedLivePhotosVideo keyTimes](self, "keyTimes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__PUMergedLivePhotosVideo__assetIndexAtTime___block_invoke;
  v22[3] = &__block_descriptor_56_e24_B32__0__NSValue_8Q16_B24l;
  v23 = *a3;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "lastIndex");

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PUMergedLivePhotosVideo keyTimes](self, "keyTimes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") - 1;

  if (v7 != v9)
  {
    memset(&v21, 0, sizeof(v21));
    -[PUMergedLivePhotosVideo keyTimes](self, "keyTimes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "CMTimeValue");
    else
      memset(&v21, 0, sizeof(v21));

    memset(&v20, 0, sizeof(v20));
    -[PUMergedLivePhotosVideo keyTimes](self, "keyTimes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v7 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "CMTimeValue");
    else
      memset(&v20, 0, sizeof(v20));

    memset(&v19, 0, sizeof(v19));
    lhs = v20;
    v17 = v21;
    CMTimeSubtract(&v19, &lhs, &v17);
    lhs = (CMTime)*a3;
    v17 = v19;
    if (CMTimeCompare(&lhs, &v17) > 0)
      ++v7;
  }
  return v7;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  PUMergedLivePhotosVideo *v19;
  id v20;
  uint64_t v21;
  objc_super v22;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v22.receiver = self;
  v22.super_class = (Class)PUMergedLivePhotosVideo;
  -[PUMergedLivePhotosVideo description](&v22, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PUMergedLivePhotosVideo startTimes](self, "startTimes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __43__PUMergedLivePhotosVideo_debugDescription__block_invoke;
  v18 = &unk_1E589F918;
  v20 = v6;
  v21 = 0x3FC999999999999ALL;
  v19 = self;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v15);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@"), v8, v15, v16, v17, v18, v19);
  -[PUMergedLivePhotosVideo keyTimes](self, "keyTimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tKeyTimes:\n\t%@"), v9);

  -[PUMergedLivePhotosVideo startTimes](self, "startTimes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tStartTimes:\n\t%@"), v10);

  -[PUMergedLivePhotosVideo assets](self, "assets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tAssets:\n\t%@"), v11);

  -[PUMergedLivePhotosVideo mergedVideoAsset](self, "mergedVideoAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tvideoAsset:\n\t%@"), v12);

  -[PUMergedLivePhotosVideo mergedVideoComposition](self, "mergedVideoComposition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tvideoComposition:\n\t%@"), v13);

  return v5;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSArray)startTimes
{
  return self->_startTimes;
}

- (NSArray)keyTimes
{
  return self->_keyTimes;
}

- (AVAsset)mergedVideoAsset
{
  return self->_mergedVideoAsset;
}

- (AVVideoComposition)mergedVideoComposition
{
  return self->_mergedVideoComposition;
}

- (double)videoAspectRatio
{
  return self->_videoAspectRatio;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedVideoComposition, 0);
  objc_storeStrong((id *)&self->_mergedVideoAsset, 0);
  objc_storeStrong((id *)&self->_keyTimes, 0);
  objc_storeStrong((id *)&self->_startTimes, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

void __43__PUMergedLivePhotosVideo_debugDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  Float64 v22;
  Float64 v23;
  Float64 Seconds;
  const __CFString *v25;
  CMTime v26;
  CMTime lhs;
  CMTime time;
  CMTime v29;
  CMTime v30[2];

  v5 = a2;
  v6 = v5;
  memset(&v30[1], 0, sizeof(CMTime));
  if (v5)
    objc_msgSend(v5, "CMTimeValue");
  memset(v30, 0, 24);
  objc_msgSend(*(id *)(a1 + 32), "startTimes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = *(void **)(a1 + 32);
  if (a3 + 1 >= v8)
  {
    objc_msgSend(v9, "mergedVideoAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v13)
      objc_msgSend(v13, "duration");
    else
      memset(v30, 0, 24);
  }
  else
  {
    objc_msgSend(v9, "startTimes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a3 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "CMTimeValue");
    else
      memset(v30, 0, 24);

  }
  memset(&v29, 0, sizeof(v29));
  objc_msgSend(*(id *)(a1 + 32), "keyTimes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "CMTimeValue");
  else
    memset(&v29, 0, sizeof(v29));

  lhs = v30[0];
  v26 = v30[1];
  CMTimeSubtract(&time, &lhs, &v26);
  v17 = (uint64_t)(CMTimeGetSeconds(&time) / *(double *)(a1 + 48));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  if (v17 >= 1)
  {
    v19 = 0;
    do
    {
      v20 = v19 + 1;
      v21 = *(double *)(a1 + 48);
      lhs = v30[1];
      v22 = CMTimeGetSeconds(&lhs) + (double)((int)v19 + 1) * v21;
      lhs = v29;
      if (v22 <= CMTimeGetSeconds(&lhs)
        || (lhs = v30[1],
            v23 = CMTimeGetSeconds(&lhs) + (double)(int)v19 * *(double *)(a1 + 48),
            lhs = v29,
            Seconds = CMTimeGetSeconds(&lhs),
            v25 = CFSTR("*"),
            v23 >= Seconds))
      {
        v25 = CFSTR("-");
      }
      objc_msgSend(v18, "appendString:", v25);
      ++v19;
    }
    while (v17 != v20);
  }
  objc_msgSend(v18, "appendString:", CFSTR("]"));
  objc_msgSend(*(id *)(a1 + 40), "appendString:", v18);

}

uint64_t __45__PUMergedLivePhotosVideo__assetIndexAtTime___block_invoke(uint64_t a1, void *a2)
{
  CMTime v4;
  CMTime time1;

  if (a2)
    objc_msgSend(a2, "CMTimeValue");
  else
    memset(&time1, 0, sizeof(time1));
  v4 = *(CMTime *)(a1 + 32);
  return CMTimeCompare(&time1, &v4) >> 31;
}

@end
