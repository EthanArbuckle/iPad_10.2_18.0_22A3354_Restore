@implementation PXGridInlinePlaybackRecord

- (PXGridInlinePlaybackRecord)initWithDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXGridInlinePlaybackRecord *v12;
  PXGridInlinePlaybackRecord *v13;
  id v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  int v29;
  void *v30;
  void *v31;
  __int128 v32;
  CMTime v33;
  CMTime time1;
  __int128 v35;
  _OWORD v36[2];
  objc_super v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)PXGridInlinePlaybackRecord;
  v12 = -[PXGridInlinePlaybackRecord init](&v37, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayAsset, a3);
    objc_storeStrong((id *)&v13->_mediaProvider, a4);
    objc_storeStrong(&v13->_geometryReference, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v9;
      objc_msgSend(v14, "fetchPropertySetsIfNeeded");
      objc_msgSend(v14, "mediaAnalysisProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "videoScore");
      v13->_videoScore = v16;

      objc_msgSend(v14, "curationScore");
      *(float *)&v17 = v17;
      v13->_curationScore = *(float *)&v17;
      objc_msgSend(v14, "mediaAnalysisProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "videoStickerSuggestionScore");
      v13->_videoStickerSuggestionScore = v19;

      objc_msgSend(v14, "visualSearchProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stickerConfidenceScore");
      v13->_stickerConfidenceScore = v21;

      v22 = MEMORY[0x1E0CA2E40];
      v23 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&v13->_bestVideoTimeRange.start.value = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&v13->_bestVideoTimeRange.start.epoch = v23;
      *(_OWORD *)&v13->_bestVideoTimeRange.duration.timescale = *(_OWORD *)(v22 + 32);
      objc_msgSend(v14, "mediaAnalysisProperties");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "autoplaySuggestionScore");
      v26 = v25;

      +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "playBestTimeRange") && v26 > 0.0 && objc_msgSend(v14, "playbackStyle") != 5)
      {
        v29 = objc_msgSend(v14, "mediaSubtypes");

        if ((v29 & 0x20000) == 0)
        {
          memset(v36, 0, sizeof(v36));
          v35 = 0u;
          objc_msgSend(v14, "mediaAnalysisProperties");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            objc_msgSend(v30, "bestVideoTimeRange");
          }
          else
          {
            memset(v36, 0, sizeof(v36));
            v35 = 0u;
          }

          if ((BYTE12(v35) & 1) != 0
            && (BYTE4(v36[1]) & 1) != 0
            && !*((_QWORD *)&v36[1] + 1)
            && (*((_QWORD *)&v36[0] + 1) & 0x8000000000000000) == 0)
          {
            time1 = *(CMTime *)((char *)v36 + 8);
            v33 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            if (CMTimeCompare(&time1, &v33) >= 1)
            {
              v32 = v36[0];
              *(_OWORD *)&v13->_bestVideoTimeRange.start.value = v35;
              *(_OWORD *)&v13->_bestVideoTimeRange.start.epoch = v32;
              *(_OWORD *)&v13->_bestVideoTimeRange.duration.timescale = v36[1];
            }
          }
        }
      }
      else
      {

      }
    }
  }

  return v13;
}

- (BOOL)isPlaying
{
  return -[PXGridInlinePlaybackRecord desiredPlayState](self, "desiredPlayState") == 1;
}

- (NSString)diagnosticScoresDescription
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  double v10;
  float v11;
  double v12;
  __CFString *v13;
  float v14;
  double v15;
  float v16;
  void *v17;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PXGridInlinePlaybackRecord visibilityScore](self, "visibilityScore");
  -[PXGridInlinePlaybackRecord cellSizeScore](self, "cellSizeScore");
  v6 = v5;
  -[PXGridInlinePlaybackRecord distanceToCenterScore](self, "distanceToCenterScore");
  v8 = v7;
  -[PXGridInlinePlaybackRecord videoScore](self, "videoScore");
  v10 = v9;
  -[PXGridInlinePlaybackRecord curationScore](self, "curationScore");
  v12 = v11;
  -[PXGridInlinePlaybackRecord bestVideoTimeRange](self, "bestVideoTimeRange");
  v13 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  -[PXGridInlinePlaybackRecord videoStickerSuggestionScore](self, "videoStickerSuggestionScore");
  v15 = v14;
  -[PXGridInlinePlaybackRecord stickerConfidenceScore](self, "stickerConfidenceScore");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("visibilityScore=%lu, cellSizeScore=%f, distanceToCenterScore=%f, videoScore=%f, curationScore=%f, bestVideoTimeRange=%@, videoStickerSuggestionScore=%f, stickerConfidenceScore=%f"), v4, v6, v8, *(_QWORD *)&v10, *(_QWORD *)&v12, v13, *(_QWORD *)&v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGridInlinePlaybackRecord displayAsset](self, "displayAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGridInlinePlaybackRecord geometryReference](self, "geometryReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGridInlinePlaybackRecord diagnosticScoresDescription](self, "diagnosticScoresDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, displayAsset=%@, geometryReference=%@, %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)geometryReference
{
  return self->_geometryReference;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  self->_desiredPlayState = a3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)bestVideoTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var1;
  return self;
}

- (void)setBestVideoTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_bestVideoTimeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_bestVideoTimeRange.duration.timescale = v4;
  *(_OWORD *)&self->_bestVideoTimeRange.start.value = v3;
}

- (float)videoScore
{
  return self->_videoScore;
}

- (float)curationScore
{
  return self->_curationScore;
}

- (int64_t)visibilityScore
{
  return self->_visibilityScore;
}

- (void)setVisibilityScore:(int64_t)a3
{
  self->_visibilityScore = a3;
}

- (float)videoStickerSuggestionScore
{
  return self->_videoStickerSuggestionScore;
}

- (double)distanceToCenterScore
{
  return self->_distanceToCenterScore;
}

- (void)setDistanceToCenterScore:(double)a3
{
  self->_distanceToCenterScore = a3;
}

- (float)stickerConfidenceScore
{
  return self->_stickerConfidenceScore;
}

- (double)cellSizeScore
{
  return self->_cellSizeScore;
}

- (void)setCellSizeScore:(double)a3
{
  self->_cellSizeScore = a3;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (NSString)diagnosticLog
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDiagnosticLog:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLog, 0);
  objc_storeStrong(&self->_geometryReference, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

@end
