@implementation PXStoryMediaAnalysisMovieHighlight

- (PXStoryMediaAnalysisMovieHighlight)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMovieHighlight.m"), 540, CFSTR("%s is not available as initializer"), "-[PXStoryMediaAnalysisMovieHighlight init]");

  abort();
}

- (PXStoryMediaAnalysisMovieHighlight)initWithMediaAnalysis:(id)a3 movieHighlightIndex:(int64_t)a4
{
  id v6;
  PXStoryMediaAnalysisMovieHighlight *v7;
  uint64_t v8;
  NSDictionary *analysis;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryMediaAnalysisMovieHighlight;
  v7 = -[PXStoryMediaAnalysisMovieHighlight init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    analysis = v7->_analysis;
    v7->_analysis = (NSDictionary *)v8;

    v7->_highlightIndex = a4;
  }

  return v7;
}

- (id)analysisResults
{
  return -[NSDictionary objectForKeyedSubscript:](self->_analysis, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
}

- (id)movieHighlightResults
{
  void *v2;
  void *v3;

  -[PXStoryMediaAnalysisMovieHighlight analysisResults](self, "analysisResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D47508]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)movieSummaryResults
{
  void *v2;
  void *v3;

  -[PXStoryMediaAnalysisMovieHighlight analysisResults](self, "analysisResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D47518]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)irisRecommendedResults
{
  void *v2;
  void *v3;

  -[PXStoryMediaAnalysisMovieHighlight analysisResults](self, "analysisResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D474F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)movieHighlightScoreResults
{
  void *v2;
  void *v3;

  -[PXStoryMediaAnalysisMovieHighlight analysisResults](self, "analysisResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D47510]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  void *v11;
  __int128 v12;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  switch(self->_highlightIndex)
  {
    case 0xFFFFFFFFFFFFFFFCLL:
      -[PXStoryMediaAnalysisMovieHighlight movieSummaryResults](self, "movieSummaryResults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = v5;
        v27 = 0u;
        v28 = 0u;
        v26 = 0u;
        PXStoryMediaAnalysisResultsGetTimeRange(&v26, v5);
        v24 = 0uLL;
        v25 = 0;
        +[PXStoryFallbackMovieHighlightCuration maxHighlightDuration](PXStoryFallbackMovieHighlightCuration, "maxHighlightDuration");
        v18 = v26;
        v19 = v27;
        v20 = v28;
        v16 = v24;
        v17 = v25;
        -[PXStoryMediaAnalysisMovieHighlight _bestTimeRangeForRange:targetDuration:](self, "_bestTimeRangeForRange:targetDuration:", &v18, &v16);
        v7 = v22;
        *(_OWORD *)&retstr->var0.var0 = v21;
        *(_OWORD *)&retstr->var0.var3 = v7;
        v8 = v23;
        goto LABEL_9;
      }
      -[PXStoryMediaAnalysisMovieHighlight movieHighlightScoreResults](self, "movieHighlightScoreResults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      PXStoryMediaAnalysisResultsGetTimeRange(&v26, v14);
      v18 = v26;
      v19 = v27;
      v20 = v28;
      +[PXStoryFallbackMovieHighlightCuration defaultHighlightRangeForPlaybackRange:](PXStoryFallbackMovieHighlightCuration, "defaultHighlightRangeForPlaybackRange:", &v18);
      v15 = v22;
      *(_OWORD *)&retstr->var0.var0 = v21;
      *(_OWORD *)&retstr->var0.var3 = v15;
      *(_OWORD *)&retstr->var1.var1 = v23;

      v6 = 0;
      break;
    case 0xFFFFFFFFFFFFFFFDLL:
      -[PXStoryMediaAnalysisMovieHighlight movieHighlightScoreResults](self, "movieHighlightScoreResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0xFFFFFFFFFFFFFFFELL:
      -[PXStoryMediaAnalysisMovieHighlight irisRecommendedResults](self, "irisRecommendedResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0xFFFFFFFFFFFFFFFFLL:
      -[PXStoryMediaAnalysisMovieHighlight movieSummaryResults](self, "movieSummaryResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = v11;
      PXStoryMediaAnalysisResultsGetTimeRange(&v26, v11);
      v12 = v27;
      *(_OWORD *)&retstr->var0.var0 = v26;
      *(_OWORD *)&retstr->var0.var3 = v12;
      v8 = v28;
LABEL_9:
      *(_OWORD *)&retstr->var1.var1 = v8;
      break;
    default:
      -[PXStoryMediaAnalysisMovieHighlight movieHighlightResults](self, "movieHighlightResults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", self->_highlightIndex);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v26, v9);
      v10 = v27;
      *(_OWORD *)&retstr->var0.var0 = v26;
      *(_OWORD *)&retstr->var0.var3 = v10;
      *(_OWORD *)&retstr->var1.var1 = v28;

      break;
  }

  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)_bestTimeRangeForRange:(SEL)a3 targetDuration:(id *)a4
{
  void *v8;
  __int128 v9;
  __int128 v10;
  CMTimeEpoch epoch;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTimeRange v19;
  CMTimeRange time1;
  CMTime time2;

  memset(&v19, 0, sizeof(v19));
  -[PXStoryMediaAnalysisMovieHighlight movieHighlightScoreResults](self, "movieHighlightScoreResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    PXStoryMediaAnalysisResultsGetTimeRange(&v19, v8);
  }
  else
  {
    v9 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v19.start.value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v19.start.epoch = v9;
    *(_OWORD *)&v19.duration.timescale = *(_OWORD *)&a4->var1.var1;
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  time1.start = v19.duration;
  time2 = (CMTime)*a5;
  CMTimeMinimum(&v18, &time1.start, &time2);
  retstr->var1 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var1.var0;
  time1.start.epoch = a4->var1.var3;
  time2 = (CMTime)retstr->var1;
  CMTimeSubtract(&v16, &time1.start, &time2);
  time1.start = v16;
  CMTimeMultiplyByRatio(&v17, &time1.start, 1, 2);
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a4->var0.var0;
  time1.start.epoch = a4->var0.var3;
  time2 = v17;
  CMTimeAdd(&v18, &time1.start, &time2);
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;
  v10 = *(_OWORD *)&retstr->var0.var3;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&retstr->var0.var0;
  *(_OWORD *)&time1.start.epoch = v10;
  *(_OWORD *)&time1.duration.timescale = *(_OWORD *)&retstr->var1.var1;
  CMTimeRangeGetEnd(&v15, &time1);
  time1 = v19;
  CMTimeRangeGetEnd(&v14, &time1);
  time1.start = v15;
  time2 = v14;
  if (CMTimeCompare(&time1.start, &time2) < 1)
  {
    *(_OWORD *)&time1.start.value = *(_OWORD *)&retstr->var0.var0;
    time1.start.epoch = retstr->var0.var3;
    time2 = v19.start;
    if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
      goto LABEL_8;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v19.start.value;
    epoch = v19.start.epoch;
  }
  else
  {
    time1 = v19;
    CMTimeRangeGetEnd(&v13, &time1);
    time2 = (CMTime)retstr->var1;
    time1.start = v13;
    CMTimeSubtract(&v18, &time1.start, &time2);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v18.value;
    epoch = v18.epoch;
  }
  retstr->var0.var3 = epoch;
LABEL_8:

  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)bestTimeRangeForTargetDuration:(SEL)a3
{
  NSObject *v6;
  __int128 v7;
  void *v8;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  _BYTE v10[32];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  -[PXStoryMediaAnalysisMovieHighlight _bestTimeRangeForTargetDuration:tolerance:](self, "_bestTimeRangeForTargetDuration:tolerance:", a4, a4 * 0.1);
  PLStoryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)v10 = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v10[16] = v7;
    v11 = *(_OWORD *)&retstr->var1.var1;
    PXStoryTimeRangeDescription((uint64_t)v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v10 = 134218242;
    *(double *)&v10[4] = a4;
    *(_WORD *)&v10[12] = 2112;
    *(_QWORD *)&v10[14] = v8;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "Best range for target duration: %0.1f -> %@", v10, 0x16u);

  }
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)_bestTimeRangeForTargetDuration:(SEL)a3 tolerance:(double)a4
{
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  NSDictionary *analysis;
  CMTime v21;
  _BYTE time[32];
  __int128 v23;
  _BYTE buf[32];
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  -[PXStoryMediaAnalysisMovieHighlight timeRange](self, "timeRange");
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)time = retstr->var1;
  if (CMTimeGetSeconds((CMTime *)time) > a4)
  {
    objc_msgSend(MEMORY[0x1E0D475C8], "sharedMediaAnalyzer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_highlightIndex < 0)
    {
      CMTimeMakeWithSeconds(&v21, a4, 600);
      v18 = *(_OWORD *)&retstr->var0.var3;
      *(_OWORD *)buf = *(_OWORD *)&retstr->var0.var0;
      *(_OWORD *)&buf[16] = v18;
      v25 = *(_OWORD *)&retstr->var1.var1;
      -[PXStoryMediaAnalysisMovieHighlight _bestTimeRangeForRange:targetDuration:](self, "_bestTimeRangeForRange:targetDuration:", buf, &v21);
      v19 = *(_OWORD *)&time[16];
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)time;
      *(_OWORD *)&retstr->var0.var3 = v19;
      *(_OWORD *)&retstr->var1.var1 = v23;
    }
    else
    {
      v26[0] = *MEMORY[0x1E0D47668];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v11;
      v26[1] = *MEMORY[0x1E0D47670];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v12;
      v26[2] = *MEMORY[0x1E0D47658];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_highlightIndex);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      memset(time, 0, sizeof(time));
      if (v10)
        objc_msgSend(v10, "postProcessMovieHighlightDuration:withOptions:", self->_analysis, v14);
      v15 = v23;
      v16 = *(_OWORD *)time;
      *(_OWORD *)&retstr->var0.var3 = *(_OWORD *)&time[16];
      *(_OWORD *)&retstr->var1.var1 = v15;
      *(_OWORD *)&retstr->var0.var0 = v16;
      if ((retstr->var0.var2 & 1) == 0 || (retstr->var1.var2 & 1) == 0 || retstr->var1.var3 || retstr->var1.var0 < 0)
      {
        PXAssertGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          analysis = self->_analysis;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = analysis;
          _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Post processing produced a null range for options: %@, analysis: %@", buf, 0x16u);
        }

      }
    }

  }
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)_bestTimeRangeForMinDuration:(SEL)a3 maxDuration:(double)a4
{
  double v9;
  double v10;
  NSObject *v11;
  __int128 v12;
  void *v13;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  __int128 v15;
  uint64_t v16;
  _BYTE time[32];
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PXStoryMediaAnalysisMovieHighlight timeRange](self, "timeRange");
  *(_OWORD *)time = v15;
  *(_QWORD *)&time[16] = v16;
  v9 = fmin(a5, CMTimeGetSeconds((CMTime *)time));
  v10 = fmin(a4, v9);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  -[PXStoryMediaAnalysisMovieHighlight _bestTimeRangeForTargetDuration:tolerance:](self, "_bestTimeRangeForTargetDuration:tolerance:", (v9 + v10) * 0.5, (v9 - v10) * 0.5);
  PLStoryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)time = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&time[16] = v12;
    v18 = *(_OWORD *)&retstr->var1.var1;
    PXStoryTimeRangeDescription((uint64_t)time);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 134218498;
    *(double *)&time[4] = v10;
    *(_WORD *)&time[12] = 2048;
    *(double *)&time[14] = v9;
    *(_WORD *)&time[22] = 2112;
    *(_QWORD *)&time[24] = v13;
    _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "Best range for min duration: %0.1f, max: %0.1f -> %@", time, 0x20u);

  }
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)bestTimeRangeForPreferredDuration:(SEL)a3 min:(double)a4 max:(double)a5
{
  double v12;
  double v13;
  double Seconds;
  PXStoryMediaAnalysisMovieHighlight *v17;
  double v18;
  double v19;
  __int128 v20;
  NSObject *v21;
  __int128 v22;
  void *v23;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v25;
  void *v26;
  _BYTE time[32];
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a4 < a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXStoryMovieHighlight.m"), 675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetDuration >= minDuration"));

  }
  if (a4 > a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXStoryMovieHighlight.m"), 676, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetDuration <= maxDuration"));

  }
  v12 = fmax(a5, a4 + -1.0);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  v13 = fmin(a4 + 1.0, a6);
  *(_OWORD *)&retstr->var0.var0 = 0u;
  -[PXStoryMediaAnalysisMovieHighlight _bestTimeRangeForMinDuration:maxDuration:](self, "_bestTimeRangeForMinDuration:maxDuration:", v12, v13);
  *(_OWORD *)time = *(_OWORD *)&retstr->var1.var0;
  *(_QWORD *)&time[16] = retstr->var1.var3;
  Seconds = CMTimeGetSeconds((CMTime *)time);
  if (v12 > a5 && Seconds < a4 + -0.75)
  {
    v17 = self;
    v18 = a5;
    v19 = a4;
  }
  else
  {
    if (v13 >= a6 || Seconds <= a4 + 0.75)
      goto LABEL_16;
    v17 = self;
    v18 = a4;
    v19 = a6;
  }
  -[PXStoryMediaAnalysisMovieHighlight _bestTimeRangeForMinDuration:maxDuration:](v17, "_bestTimeRangeForMinDuration:maxDuration:", v18, v19);
  v20 = *(_OWORD *)&time[16];
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)time;
  *(_OWORD *)&retstr->var0.var3 = v20;
  *(_OWORD *)&retstr->var1.var1 = v28;
LABEL_16:
  PLStoryGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)time = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&time[16] = v22;
    v28 = *(_OWORD *)&retstr->var1.var1;
    PXStoryTimeRangeDescription((uint64_t)time);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)time = 134218754;
    *(double *)&time[4] = a4;
    *(_WORD *)&time[12] = 2048;
    *(double *)&time[14] = a5;
    *(_WORD *)&time[22] = 2048;
    *(double *)&time[24] = a6;
    LOWORD(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 2) = v23;
    _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEBUG, "Best range for preferred duration: %0.1f, min: %0.1f, max: %0.1f -> %@", time, 0x2Au);

  }
  return result;
}

- (float)qualityScore
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  float Quality;

  switch(self->_highlightIndex)
  {
    case 0xFFFFFFFFFFFFFFFCLL:
      -[PXStoryMediaAnalysisMovieHighlight movieSummaryResults](self, "movieSummaryResults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
        goto LABEL_9;
      Quality = PXStoryMediaAnalysisResultGetQuality(self->_analysis);
      goto LABEL_11;
    case 0xFFFFFFFFFFFFFFFDLL:
      return PXStoryMediaAnalysisResultGetQuality(self->_analysis);
    case 0xFFFFFFFFFFFFFFFELL:
      -[PXStoryMediaAnalysisMovieHighlight irisRecommendedResults](self, "irisRecommendedResults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0xFFFFFFFFFFFFFFFFLL:
      -[PXStoryMediaAnalysisMovieHighlight movieSummaryResults](self, "movieSummaryResults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = v3;
LABEL_9:
      objc_msgSend(v3, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[PXStoryMediaAnalysisMovieHighlight movieHighlightResults](self, "movieHighlightResults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", self->_highlightIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v7 = v5;
  Quality = PXStoryMediaAnalysisResultGetQuality(v5);

LABEL_11:
  return Quality;
}

- (NSData)normalizationData
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;

  if (self->_highlightIndex <= 0xFFFFFFFFFFFFFFFBLL)
  {
    -[PXStoryMediaAnalysisMovieHighlight movieHighlightResults](self, "movieHighlightResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", self->_highlightIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D47548]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D47558]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return (NSData *)v2;
}

- (id)voiceResults
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSDictionary objectForKeyedSubscript:](self->_analysis, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D475B0]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = MEMORY[0x1E0C9AA60];
  if (v5)
    v8 = v5;
  else
    v8 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "addObjectsFromArray:", v8);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D474C8]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = v7;
  objc_msgSend(v3, "addObjectsFromArray:", v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D474D0]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = v12;
  else
    v14 = v7;
  objc_msgSend(v3, "addObjectsFromArray:", v14);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D474D8]);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = v15;
  else
    v17 = v7;
  objc_msgSend(v3, "addObjectsFromArray:", v17);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D474F8]);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = v18;
  else
    v20 = v7;
  objc_msgSend(v3, "addObjectsFromArray:", v20);

  return v3;
}

- (BOOL)hasVoiceInRange:(id *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  float v8;
  float v9;
  _OWORD v11[3];

  v5 = (void *)objc_opt_class();
  -[PXStoryMediaAnalysisMovieHighlight voiceResults](self, "voiceResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v5, "fractionOfResults:inRange:", v6, v11);
  v9 = v8;

  return v9 > 0.5;
}

- (BOOL)hasVoice
{
  uint64_t v4;

  -[PXStoryMediaAnalysisMovieHighlight timeRange](self, "timeRange");
  return -[PXStoryMediaAnalysisMovieHighlight hasVoiceInRange:](self, "hasVoiceInRange:", &v4);
}

- (id)faceResults
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_analysis, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D474E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasFaceInRange:(id *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  float v8;
  float v9;
  _OWORD v11[3];

  v5 = (void *)objc_opt_class();
  -[PXStoryMediaAnalysisMovieHighlight faceResults](self, "faceResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v5, "fractionOfResults:inRange:", v6, v11);
  v9 = v8;

  return v9 > 0.5;
}

- (BOOL)hasFace
{
  uint64_t v4;

  -[PXStoryMediaAnalysisMovieHighlight timeRange](self, "timeRange");
  return -[PXStoryMediaAnalysisMovieHighlight hasFaceInRange:](self, "hasFaceInRange:", &v4);
}

- (id)musicResults
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_analysis, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D47520]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasMusicInRange:(id *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  float v8;
  float v9;
  _OWORD v11[3];

  v5 = (void *)objc_opt_class();
  -[PXStoryMediaAnalysisMovieHighlight musicResults](self, "musicResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v7;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v5, "fractionOfResults:inRange:", v6, v11);
  v9 = v8;

  return v9 > 0.5;
}

- (BOOL)hasMusic
{
  uint64_t v4;

  -[PXStoryMediaAnalysisMovieHighlight timeRange](self, "timeRange");
  return -[PXStoryMediaAnalysisMovieHighlight hasMusicInRange:](self, "hasMusicInRange:", &v4);
}

- (id)loudnessResults
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_analysis, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D47500]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (float)audioPeakForTimeRange:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  float v27;
  float v28;
  _OWORD v30[3];
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PXStoryMediaAnalysisMovieHighlight loudnessResults](self, "loudnessResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v36;
    v9 = *MEMORY[0x1E0D47548];
    v10 = *MEMORY[0x1E0D47578];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
        PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v32, v12);
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        v13 = *(_OWORD *)&a3->var0.var3;
        v30[0] = *(_OWORD *)&a3->var0.var0;
        v30[1] = v13;
        v30[2] = *(_OWORD *)&a3->var1.var1;
        if (PXStoryTimeRangeIntersectsTimeRange(v31, v30))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            if (!v7 || (objc_msgSend(v15, "floatValue"), v18 = v17, objc_msgSend(v7, "floatValue"), v18 > v19))
            {
              v20 = v16;
              v21 = v7;
              v22 = v10;
              v23 = v9;
              v24 = v4;
              v25 = v20;

              v26 = v25;
              v4 = v24;
              v9 = v23;
              v10 = v22;
              v7 = v26;
            }
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v7, "floatValue");
  v28 = v27;

  return v28;
}

- (float)peakVolume
{
  float result;
  uint64_t v4;

  -[PXStoryMediaAnalysisMovieHighlight timeRange](self, "timeRange");
  -[PXStoryMediaAnalysisMovieHighlight audioPeakForTimeRange:](self, "audioPeakForTimeRange:", &v4);
  return result;
}

- (float)audioLoudnessForTimeRange:(id *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  float v27;
  float v28;
  _OWORD v30[3];
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[PXStoryMediaAnalysisMovieHighlight loudnessResults](self, "loudnessResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v36;
    v9 = *MEMORY[0x1E0D47548];
    v10 = *MEMORY[0x1E0D47570];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
        PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v32, v12);
        v31[0] = v32;
        v31[1] = v33;
        v31[2] = v34;
        v13 = *(_OWORD *)&a3->var0.var3;
        v30[0] = *(_OWORD *)&a3->var0.var0;
        v30[1] = v13;
        v30[2] = *(_OWORD *)&a3->var1.var1;
        if (PXStoryTimeRangeIntersectsTimeRange(v31, v30))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            if (!v7 || (objc_msgSend(v15, "floatValue"), v18 = v17, objc_msgSend(v7, "floatValue"), v18 > v19))
            {
              v20 = v16;
              v21 = v7;
              v22 = v10;
              v23 = v9;
              v24 = v4;
              v25 = v20;

              v26 = v25;
              v4 = v24;
              v9 = v23;
              v10 = v22;
              v7 = v26;
            }
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v7, "floatValue");
  v28 = v27;

  return v28;
}

- (float)loudness
{
  float result;
  uint64_t v4;

  -[PXStoryMediaAnalysisMovieHighlight timeRange](self, "timeRange");
  -[PXStoryMediaAnalysisMovieHighlight audioLoudnessForTimeRange:](self, "audioLoudnessForTimeRange:", &v4);
  return result;
}

- (float)audioQualityScore
{
  int64_t highlightIndex;
  float v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;

  highlightIndex = self->_highlightIndex;
  v3 = 0.5;
  if ((unint64_t)(highlightIndex + 3) < 2)
    return v3;
  if (highlightIndex == -4)
  {
    -[PXStoryMediaAnalysisMovieHighlight movieHighlightResults](self, "movieHighlightResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (highlightIndex != -1)
    {
      -[PXStoryMediaAnalysisMovieHighlight movieHighlightResults](self, "movieHighlightResults");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", self->_highlightIndex);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[PXStoryMediaAnalysisMovieHighlight movieSummaryResults](self, "movieSummaryResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D47548]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("audioQuality"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "floatValue");
    v3 = v11;
  }

  return v3;
}

- (CGRect)bestPlaybackRect
{
  double BestPlaybackRect;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  switch(self->_highlightIndex)
  {
    case 0xFFFFFFFFFFFFFFFCLL:
    case 0xFFFFFFFFFFFFFFFFLL:
      -[PXStoryMediaAnalysisMovieHighlight movieSummaryResults](self, "movieSummaryResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      BestPlaybackRect = PXStoryMediaAnalysisResultGetBestPlaybackRect(v8);
      v4 = v9;
      v5 = v10;
      v6 = v11;

      break;
    case 0xFFFFFFFFFFFFFFFDLL:
    case 0xFFFFFFFFFFFFFFFELL:
      BestPlaybackRect = *MEMORY[0x1E0C9D628];
      v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      break;
    default:
      -[PXStoryMediaAnalysisMovieHighlight movieHighlightResults](self, "movieHighlightResults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", self->_highlightIndex);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      BestPlaybackRect = PXStoryMediaAnalysisResultGetBestPlaybackRect(v13);
      v4 = v14;
      v5 = v15;
      v6 = v16;

      break;
  }
  v17 = BestPlaybackRect;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
}

+ (id)movieHighlightsFromMediaAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  PXStoryMediaAnalysisMovieHighlight *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47508]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      v8 = -[PXStoryMediaAnalysisMovieHighlight initWithMediaAnalysis:movieHighlightIndex:]([PXStoryMediaAnalysisMovieHighlight alloc], "initWithMediaAnalysis:movieHighlightIndex:", v3, v7);
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }

  return v6;
}

+ (id)movieSummaryFromMediaAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PXStoryMediaAnalysisMovieHighlight *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47518]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = -[PXStoryMediaAnalysisMovieHighlight initWithMediaAnalysis:movieHighlightIndex:]([PXStoryMediaAnalysisMovieHighlight alloc], "initWithMediaAnalysis:movieHighlightIndex:", v3, -1);
  else
    v6 = 0;

  return v6;
}

+ (id)livePhotoFromMediaAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PXStoryMediaAnalysisMovieHighlight *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D474F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = -[PXStoryMediaAnalysisMovieHighlight initWithMediaAnalysis:movieHighlightIndex:]([PXStoryMediaAnalysisMovieHighlight alloc], "initWithMediaAnalysis:movieHighlightIndex:", v3, -2);
  else
    v6 = 0;

  return v6;
}

+ (id)fullMovieFromMediaAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PXStoryMediaAnalysisMovieHighlight *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47510]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = -[PXStoryMediaAnalysisMovieHighlight initWithMediaAnalysis:movieHighlightIndex:]([PXStoryMediaAnalysisMovieHighlight alloc], "initWithMediaAnalysis:movieHighlightIndex:", v3, -3);
  else
    v6 = 0;

  return v6;
}

+ (id)defaultHighlightFromMediaAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PXStoryMediaAnalysisMovieHighlight *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D475A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47518]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47510]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    v7 = -[PXStoryMediaAnalysisMovieHighlight initWithMediaAnalysis:movieHighlightIndex:]([PXStoryMediaAnalysisMovieHighlight alloc], "initWithMediaAnalysis:movieHighlightIndex:", v3, -4);
  else
    v7 = 0;

  return v7;
}

+ (float)fractionOfResults:(id)a3 inRange:(id *)a4
{
  id v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  double Seconds;
  double v17;
  CMTime v19;
  CMTime v20;
  _BYTE v21[32];
  __int128 v22;
  CMTimeRange time2;
  CMTimeRange v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime v29;
  CMTime v30;
  _QWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CMTimeRange range;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__PXStoryMediaAnalysisMovieHighlight_fractionOfResults_inRange___block_invoke;
  v31[3] = &__block_descriptor_80_e29_B32__0__NSDictionary_8Q16_B24l;
  v6 = *(_OWORD *)&a4->var0.var3;
  v32 = *(_OWORD *)&a4->var0.var0;
  v33 = v6;
  v34 = *(_OWORD *)&a4->var1.var1;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_338);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v30.value = PXStoryTimeZero;
  v30.epoch = 0;
  v29.epoch = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  *(_OWORD *)&v29.value = PXStoryTimeZero;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        memset(&v24, 0, sizeof(v24));
        PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v24, v14);
        time2 = v24;
        v15 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)v21 = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&v21[16] = v15;
        v22 = *(_OWORD *)&a4->var1.var1;
        PXStoryTimeRangeIntersection(&time2, v21, &range);
        v24 = range;
        *(_OWORD *)v21 = PXStoryTimeZero;
        *(_QWORD *)&v21[16] = 0;
        CMTimeRangeGetEnd(&v20, &range);
        time2.start = v29;
        range.start = v20;
        if (CMTimeCompare(&range.start, &time2.start) >= 1)
        {
          range.start = v29;
          *(_OWORD *)&time2.start.value = *(_OWORD *)&v24.start.value;
          time2.start.epoch = v24.start.epoch;
          if (CMTimeCompare(&range.start, &time2.start) <= 0)
          {
            *(CMTime *)v21 = v24.duration;
          }
          else
          {
            range = v24;
            CMTimeRangeGetEnd(&v19, &range);
            time2.start = v29;
            range.start = v19;
            CMTimeSubtract((CMTime *)v21, &range.start, &time2.start);
          }
          range = v24;
          CMTimeRangeGetEnd(&v29, &range);
          range.start = v30;
          *(_OWORD *)&time2.start.value = *(_OWORD *)v21;
          time2.start.epoch = *(_QWORD *)&v21[16];
          CMTimeAdd(&v30, &range.start, &time2.start);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v11);
  }
  range.start = v30;
  Seconds = CMTimeGetSeconds(&range.start);
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var1.var0;
  range.start.epoch = a4->var1.var3;
  v17 = CMTimeGetSeconds(&range.start);

  return Seconds / v17;
}

BOOL __64__PXStoryMediaAnalysisMovieHighlight_fractionOfResults_inRange___block_invoke(_OWORD *a1, void *a2)
{
  __int128 v3;
  _OWORD v5[3];
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v7, a2);
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  v3 = a1[3];
  v5[0] = a1[2];
  v5[1] = v3;
  v5[2] = a1[4];
  return PXStoryTimeRangeIntersectsTimeRange(v6, v5);
}

uint64_t __64__PXStoryMediaAnalysisMovieHighlight_fractionOfResults_inRange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CMTime time2;
  CMTime time1;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v4 = a3;
  PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v9, a2);
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  PXStoryMediaAnalysisResultGetTimeRange((uint64_t)&v6, v4);

  *(_OWORD *)&time1.value = v9;
  time1.epoch = v10;
  *(_OWORD *)&time2.value = v6;
  time2.epoch = v7;
  return CMTimeCompare(&time1, &time2);
}

@end
