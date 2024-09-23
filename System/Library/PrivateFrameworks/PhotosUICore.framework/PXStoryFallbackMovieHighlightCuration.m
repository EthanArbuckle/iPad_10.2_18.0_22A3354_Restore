@implementation PXStoryFallbackMovieHighlightCuration

- (PXStoryFallbackMovieHighlightCuration)init
{
  double v2;
  _OWORD v4[3];
  _OWORD v5[3];
  __int128 v6;
  uint64_t v7;

  v7 = 0;
  v6 = PXStoryTimeZero;
  memset(v5, 0, sizeof(v5));
  memset(v4, 0, sizeof(v4));
  LODWORD(v2) = 0.5;
  return -[PXStoryFallbackMovieHighlightCuration initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:](self, "initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:", &v6, v5, v4, 0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v2);
}

- (PXStoryFallbackMovieHighlightCuration)initWithAssetDuration:(id *)a3 playbackRange:(id *)a4 highlightRange:(id *)a5 bestPlaybackRect:(CGRect)a6 normalizationData:(id)a7 audioQualityScore:(float)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  char *v19;
  PXStoryFallbackMovieHighlightCuration *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v18 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PXStoryFallbackMovieHighlightCuration;
  v19 = -[PXStoryFallbackMovieHighlightCuration init](&v27, sel_init);
  v20 = (PXStoryFallbackMovieHighlightCuration *)v19;
  if (v19)
  {
    v21 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v19 + 3) = a3->var3;
    *(_OWORD *)(v19 + 8) = v21;
    v22 = *(_OWORD *)&a4->var0.var0;
    v23 = *(_OWORD *)&a4->var1.var1;
    *((_OWORD *)v19 + 3) = *(_OWORD *)&a4->var0.var3;
    *((_OWORD *)v19 + 4) = v23;
    *((_OWORD *)v19 + 2) = v22;
    v24 = *(_OWORD *)&a5->var0.var0;
    v25 = *(_OWORD *)&a5->var1.var1;
    *((_OWORD *)v19 + 6) = *(_OWORD *)&a5->var0.var3;
    *((_OWORD *)v19 + 7) = v25;
    *((_OWORD *)v19 + 5) = v24;
    *((CGFloat *)v19 + 16) = x;
    *((CGFloat *)v19 + 17) = y;
    *((CGFloat *)v19 + 18) = width;
    *((CGFloat *)v19 + 19) = height;
    objc_storeStrong((id *)v19 + 20, a7);
    v20->_audioQualityScore = a8;
  }

  return v20;
}

- (NSArray)highlights
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (PXStoryMovieHighlight)bestHighlight
{
  return 0;
}

- (PXStoryMovieHighlight)defaultHighlight
{
  unsigned int flags;
  int timescale;
  PXStoryMockMovieHighlight *v6;
  NSData *normalizationData;
  double v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime time2;

  if ((self->_highlightRange.start.flags & 1) == 0)
    return (PXStoryMovieHighlight *)0;
  flags = self->_highlightRange.duration.flags;
  if ((flags & 1) == 0 || self->_highlightRange.duration.epoch != 0)
    return (PXStoryMovieHighlight *)0;
  if (self->_highlightRange.duration.value < 0)
    return (PXStoryMovieHighlight *)0;
  timescale = self->_highlightRange.duration.timescale;
  *(_QWORD *)&v14 = self->_highlightRange.duration.value;
  *((_QWORD *)&v14 + 1) = __PAIR64__(flags, timescale);
  *(_QWORD *)&v15 = 0;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (!CMTimeCompare((CMTime *)&v14, &time2))
    return (PXStoryMovieHighlight *)0;
  v6 = [PXStoryMockMovieHighlight alloc];
  normalizationData = self->_normalizationData;
  *(float *)&v8 = self->_audioQualityScore;
  v9 = *(_OWORD *)&self->_highlightRange.start.epoch;
  v14 = *(_OWORD *)&self->_highlightRange.start.value;
  v15 = v9;
  v16 = *(_OWORD *)&self->_highlightRange.duration.timescale;
  HIDWORD(v10) = DWORD1(v16);
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  LODWORD(v12) = 0;
  return (PXStoryMovieHighlight *)-[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](v6, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", &v14, normalizationData, 0, 0, 0, v10, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height, v11, v12, v8);
}

- (PXStoryMovieHighlight)movieSummary
{
  unsigned int flags;
  int timescale;
  PXStoryMockMovieHighlight *v6;
  double v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CMTime time2;

  if ((self->_playbackRange.start.flags & 1) == 0)
    return (PXStoryMovieHighlight *)0;
  flags = self->_playbackRange.duration.flags;
  if ((flags & 1) == 0 || self->_playbackRange.duration.epoch != 0)
    return (PXStoryMovieHighlight *)0;
  if (self->_playbackRange.duration.value < 0)
    return (PXStoryMovieHighlight *)0;
  timescale = self->_playbackRange.duration.timescale;
  *(_QWORD *)&v13 = self->_playbackRange.duration.value;
  *((_QWORD *)&v13 + 1) = __PAIR64__(flags, timescale);
  *(_QWORD *)&v14 = 0;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (!CMTimeCompare((CMTime *)&v13, &time2))
    return (PXStoryMovieHighlight *)0;
  v6 = [PXStoryMockMovieHighlight alloc];
  *(float *)&v7 = self->_audioQualityScore;
  v8 = *(_OWORD *)&self->_playbackRange.start.epoch;
  v13 = *(_OWORD *)&self->_playbackRange.start.value;
  v14 = v8;
  v15 = *(_OWORD *)&self->_playbackRange.duration.timescale;
  HIDWORD(v9) = DWORD1(v15);
  LODWORD(v9) = 0;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  return (PXStoryMovieHighlight *)-[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](v6, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", &v13, 0, 0, 0, 0, v9, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height, v10, v11, v7);
}

- (PXStoryMovieHighlight)livePhoto
{
  return 0;
}

- (PXStoryMovieHighlight)fullMovie
{
  PXStoryMockMovieHighlight *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CMTimeRange v9;
  CMTime duration;
  CMTime start;

  v3 = [PXStoryMockMovieHighlight alloc];
  duration = (CMTime)self->_duration;
  *(_OWORD *)&start.value = PXStoryTimeZero;
  start.epoch = 0;
  CMTimeRangeMake(&v9, &start, &duration);
  *(float *)&v4 = self->_audioQualityScore;
  LODWORD(v5) = 0;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0;
  return (PXStoryMovieHighlight *)-[PXStoryMockMovieHighlight initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:](v3, "initWithTimeRange:score:bestPlaybackRect:normalizationData:face:voice:music:loudness:peak:audioScore:", &v9, 0, 0, 0, 0, v5, self->_bestPlaybackRect.origin.x, self->_bestPlaybackRect.origin.y, self->_bestPlaybackRect.size.width, self->_bestPlaybackRect.size.height, v6, v7, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizationData, 0);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxHighlightDuration
{
  id v4;
  void *v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v8;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  v4 = a2;
  objc_sync_enter(v4);
  if ((byte_1EE944A7C & 1) == 0)
  {
    v8 = 0u;
    +[PXStoryAutoEditConfigurationFactory autoEditConfiguration](PXStoryAutoEditConfigurationFactory, "autoEditConfiguration", 0, 0, 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "maximumDurations");
    else
      v8 = 0u;

    s_maxHighlightDuration = v8;
    qword_1EE944A80 = 0;
  }
  *(_OWORD *)&retstr->var0 = s_maxHighlightDuration;
  retstr->var3 = qword_1EE944A80;
  objc_sync_exit(v4);

  return result;
}

+ (void)setMaxHighlightDuration:(id *)a3
{
  int64_t var3;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  var3 = a3->var3;
  s_maxHighlightDuration = *(_OWORD *)&a3->var0;
  qword_1EE944A80 = var3;
  objc_sync_exit(obj);

}

+ ($DEC141BA10DB957F4DDC414EFF8F1C09)defaultHighlightRangeForPlaybackRange:(SEL)a3
{
  __int128 v5;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  __int128 v7;
  CMTimeEpoch epoch;
  CMTime v9;
  CMTime v10;
  CMTime v11;
  CMTime v12;
  CMTime v13;
  CMTime time2;
  CMTime time1;

  v5 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  memset(&v13, 0, sizeof(v13));
  objc_msgSend(a2, "maxHighlightDuration");
  time1 = (CMTime)retstr->var1;
  time2 = v13;
  result = ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeCompare(&time1, &time2);
  if ((int)result >= 1)
  {
    memset(&v12, 0, sizeof(v12));
    time1 = (CMTime)retstr->var1;
    CMTimeMultiplyByRatio(&v11, &time1, 1, 2);
    time1 = (CMTime)retstr->var0;
    time2 = v11;
    CMTimeAdd(&v12, &time1, &time2);
    v7 = *(_OWORD *)&v13.value;
    *(_OWORD *)&retstr->var1.var0 = *(_OWORD *)&v13.value;
    epoch = v13.epoch;
    retstr->var1.var3 = v13.epoch;
    *(_OWORD *)&time1.value = v7;
    time1.epoch = epoch;
    CMTimeMultiplyByRatio(&v9, &time1, 1, 2);
    time1 = v12;
    time2 = v9;
    result = ($DEC141BA10DB957F4DDC414EFF8F1C09 *)CMTimeSubtract(&v10, &time1, &time2);
    retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v10;
  }
  return result;
}

+ (id)movieHighlightCurationForDisplayAsset:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "mediaType") == 2)
  {
    objc_msgSend(a1, "movieHighlightCurationForVideoAsset:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "mediaType") == 1 && (objc_msgSend(v4, "mediaSubtypes") & 8) != 0)
  {
    objc_msgSend(a1, "movieHighlightCurationForLivePhotoAsset:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v7;
      v12 = 2048;
      v13 = objc_msgSend(v4, "mediaType");
      v14 = 2048;
      v15 = objc_msgSend(v4, "mediaSubtypes");
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Cannot form fallback movie highlight curation for asset %{public}@ type=%lu/%lu", (uint8_t *)&v10, 0x20u);

    }
    v5 = objc_alloc_init((Class)a1);
  }
  v8 = v5;

  return v8;
}

+ (id)movieHighlightCurationForVideoAsset:(id)a3
{
  id v4;
  Float64 v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double Seconds;
  int v12;
  double v13;
  NSObject *v14;
  Float64 v15;
  float v16;
  Float64 v17;
  Float64 v18;
  float v19;
  Float64 v20;
  Float64 v21;
  float v22;
  Float64 v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  int v40;
  int v41;
  id v42;
  double v43;
  void *v44;
  CMTimeRange v46;
  CMTime v47;
  CMTime v48;
  CMTime time;
  CMTimeRange v50;
  CMTime start;
  CMTimeRange time2;
  CMTimeRange time1;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(&start, 0, sizeof(start));
  objc_msgSend(v4, "duration");
  CMTimeMakeWithSeconds(&start, v5, 600);
  memset(&v50, 0, sizeof(v50));
  v6 = v4;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "px_storyResourceFetchBestPlaybackRange");
  else
    memset(&v50, 0, sizeof(v50));

  if ((v50.start.flags & 1) == 0
    || (v50.duration.flags & 1) == 0
    || v50.duration.epoch
    || v50.duration.value < 0
    || (time1.start.value = v50.duration.value,
        *(_QWORD *)&time1.start.timescale = *(_QWORD *)&v50.duration.timescale,
        time1.start.epoch = 0,
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68],
        time2.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
        !CMTimeCompare(&time1.start, &time2.start)))
  {
    v46.start = start;
    *(_OWORD *)&time2.start.value = PXStoryTimeZero;
    time2.start.epoch = 0;
    CMTimeRangeMake(&time1, &time2.start, &v46.start);
    v50 = time1;
  }
  if ((objc_msgSend(v7, "mediaSubtypes") & 0x20000) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "px_storyResourceFetchVideoAdjustments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "hasSlowMotionAdjustments"))
    {
      memset(&time1, 0, sizeof(time1));
      if (v9)
        objc_msgSend(v9, "slowMotionTimeRange");
      v10 = (void *)MEMORY[0x1E0D75298];
      time2.start = start;
      Seconds = CMTimeGetSeconds(&time2.start);
      objc_msgSend(v9, "slowMotionRate");
      LODWORD(v13) = v12;
      time2 = time1;
      objc_msgSend(v10, "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &time2, 1, Seconds, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        time2.start = start;
        v15 = CMTimeGetSeconds(&time2.start);
        *(float *)&v15 = v15;
        -[NSObject scaledTimeForOriginalTime:](v14, "scaledTimeForOriginalTime:", v15);
        v17 = v16;
        *(_OWORD *)&time2.start.value = *(_OWORD *)&time1.start.value;
        time2.start.epoch = time1.start.epoch;
        v18 = CMTimeGetSeconds(&time2.start);
        *(float *)&v18 = v18;
        -[NSObject scaledTimeForOriginalTime:](v14, "scaledTimeForOriginalTime:", v18);
        v20 = v19;
        time2 = time1;
        CMTimeRangeGetEnd(&time, &time2);
        v21 = CMTimeGetSeconds(&time);
        *(float *)&v21 = v21;
        -[NSObject scaledTimeForOriginalTime:](v14, "scaledTimeForOriginalTime:", v21);
        v23 = v22;
        CMTimeMakeWithSeconds(&time2.start, v17, 600);
        start = time2.start;
        CMTimeMakeWithSeconds(&time2.start, v20, 600);
        *(_OWORD *)&v50.start.value = *(_OWORD *)&time2.start.value;
        v50.start.epoch = time2.start.epoch;
        CMTimeMakeWithSeconds(&v47, v23, 600);
        *(_OWORD *)&v46.start.value = *(_OWORD *)&v50.start.value;
        v46.start.epoch = v50.start.epoch;
        time2.start = v47;
        CMTimeSubtract(&v48, &time2.start, &v46.start);
        v50.duration = v48;
LABEL_21:

        goto LABEL_22;
      }
      PLStoryGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "uuid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        time2.start = start;
        PXStoryTimeDescription(&time2.start);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        time2 = time1;
        PXStoryTimeRangeDescription((uint64_t)&time2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time2.start.value) = 138543874;
        *(CMTimeValue *)((char *)&time2.start.value + 4) = (CMTimeValue)v26;
        LOWORD(time2.start.flags) = 2114;
        *(_QWORD *)((char *)&time2.start.flags + 2) = v27;
        HIWORD(time2.start.epoch) = 2114;
        time2.duration.value = (CMTimeValue)v28;
        _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_INFO, "Invalid slomo adjustment for video asset %{public}@, duration: %{public}@, slomo range: %{public}@, ignored.", (uint8_t *)&time2, 0x20u);

      }
    }
    else
    {
      PLStoryGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      objc_msgSend(v8, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      time1.start = start;
      PXStoryTimeDescription(&time1.start);
      v25 = objc_claimAutoreleasedReturnValue();
      LODWORD(time1.start.value) = 138543618;
      *(CMTimeValue *)((char *)&time1.start.value + 4) = (CMTimeValue)v24;
      LOWORD(time1.start.flags) = 2114;
      *(_QWORD *)((char *)&time1.start.flags + 2) = v25;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_INFO, "Missing slomo adjustment for video asset %{public}@, duration: %{public}@, ignored.", (uint8_t *)&time1, 0x16u);

    }
    goto LABEL_21;
  }
LABEL_22:
  memset(&time1, 0, sizeof(time1));
  time2 = v50;
  objc_msgSend(a1, "defaultHighlightRangeForPlaybackRange:", &time2);
  v29 = v7;
  objc_msgSend(v29, "px_storyResourceFetchBestPlaybackRect");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = v29;
  objc_msgSend(v38, "px_storyResourceFetchNormalizationData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "audioScore");
  v41 = v40;
  v42 = objc_alloc((Class)a1);
  v48 = start;
  time2 = v50;
  v46 = time1;
  LODWORD(v43) = v41;
  v44 = (void *)objc_msgSend(v42, "initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:", &v48, &time2, &v46, v39, v31, v33, v35, v37, v43);

  return v44;
}

+ (id)movieHighlightCurationForLivePhotoAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  id v17;
  double v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTimeRange time1;
  _BYTE v25[112];
  CMTime duration;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "livePhotoVideoDuration");
    *(CMTime *)&v25[80] = *(CMTime *)&v25[56];
    memset(v25, 0, 48);
    objc_msgSend(v5, "px_storyResourceFetchBestPlaybackRange");
  }
  else
  {
    memset(&v25[56], 0, 48);
    memset(v25, 0, 48);
  }

  if ((v25[12] & 1) == 0
    || (v25[36] & 1) == 0
    || *(_QWORD *)&v25[40]
    || (*(_QWORD *)&v25[24] & 0x8000000000000000) != 0
    || (time1.start.value = *(_QWORD *)&v25[24],
        *(_QWORD *)&time1.start.timescale = *(_QWORD *)&v25[32],
        time1.start.epoch = 0,
        v21 = *MEMORY[0x1E0CA2E68],
        *(_QWORD *)&v22 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
        !CMTimeCompare(&time1.start, (CMTime *)&v21)))
  {
    duration = *(CMTime *)&v25[80];
    v21 = PXStoryTimeZero;
    *(_QWORD *)&v22 = 0;
    CMTimeRangeMake(&time1, (CMTime *)&v21, &duration);
    *(CMTimeRange *)v25 = time1;
  }
  v6 = v5;
  objc_msgSend(v6, "px_storyResourceFetchBestPlaybackRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v6, "audioScore");
  v16 = v15;
  v17 = objc_alloc((Class)a1);
  duration = *(CMTime *)&v25[80];
  time1 = *(CMTimeRange *)v25;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  LODWORD(v18) = v16;
  v19 = (void *)objc_msgSend(v17, "initWithAssetDuration:playbackRange:highlightRange:bestPlaybackRect:normalizationData:audioQualityScore:", &duration, &time1, &v21, 0, v8, v10, v12, v14, v18);

  return v19;
}

@end
