@implementation PXStoryExportAudioCompositionBuilder

- (PXStoryExportAudioCompositionBuilder)initWithMaximumDuration:(id *)a3 outroDuration:(id *)a4
{
  char *v6;
  PXStoryExportAudioCompositionBuilder *v7;
  __int128 v8;
  __int128 v9;
  NSMutableArray *v10;
  NSMutableArray *audioMixParameters;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXStoryExportAudioCompositionBuilder;
  v6 = -[PXStoryExportAudioCompositionBuilder init](&v13, sel_init);
  v7 = (PXStoryExportAudioCompositionBuilder *)v6;
  if (v6)
  {
    v8 = *(_OWORD *)&a3->var0;
    *((_QWORD *)v6 + 16) = a3->var3;
    *((_OWORD *)v6 + 7) = v8;
    v9 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v6 + 13) = a4->var3;
    *(_OWORD *)(v6 + 88) = v9;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    audioMixParameters = v7->_audioMixParameters;
    v7->_audioMixParameters = v10;

  }
  return v7;
}

- (void)finishAndWaitWithResultHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  -[PXStoryExportAudioCompositionBuilder error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXStoryExportAudioCompositionBuilder error](self, "error");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v15 + 2))(v15, 0, 0, v5);
  }
  else
  {
    if (self->_audioComposition
      && (-[PXStoryExportAudioCompositionBuilder _applyMusicDuckingAndFadeOut](self, "_applyMusicDuckingAndFadeOut"),
          -[NSMutableArray count](self->_audioMixParameters, "count")))
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C8B258]);
      -[PXStoryExportAudioCompositionBuilder audioMixParameters](self, "audioMixParameters");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInputParameters:", v6);

    }
    else
    {
      v5 = 0;
    }
    (*((void (**)(id, AVMutableComposition *, id, _QWORD))v15 + 2))(v15, self->_audioComposition, v5, 0);
    PXStoryErrorCreateWithCodeDebugFormat(13, CFSTR("cannot use object after finishWithResultHandler was called"), v7, v8, v9, v10, v11, v12, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryExportAudioCompositionBuilder setError:](self, "setError:", v13);

  }
}

- (BOOL)addMusicAsset:(id)a3 withAudioMix:(id)a4 preferredVolume:(float)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  id *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  PXStoryExportAudioCompositionBuilder *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[3];
  __int128 v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[PXStoryExportAudioCompositionBuilder error](self, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v38 = a6;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PXStoryExportAudioCompositionBuilder setMusicCompositionTracks:](self, "setMusicCompositionTracks:", v13);

    *(float *)&v14 = a5;
    -[PXStoryExportAudioCompositionBuilder setMusicCompositionDefaultVolume:](self, "setMusicCompositionDefaultVolume:", v14);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v15 = *MEMORY[0x1E0C8A7A0];
    v39 = v10;
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A0], v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v17)
    {
      v18 = v17;
      v12 = 0;
      v19 = *(_QWORD *)v59;
      v42 = v11;
      v43 = self;
      v40 = v15;
      v41 = v16;
      v45 = *(_QWORD *)v59;
      do
      {
        v20 = 0;
        v46 = v18;
        do
        {
          if (*(_QWORD *)v59 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v20);
          if (objc_msgSend(v21, "isEnabled"))
          {
            objc_msgSend(v21, "segments");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

            if (v23)
            {
              -[PXStoryExportAudioCompositionBuilder audioComposition](self, "audioComposition");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addMutableTrackWithMediaType:preferredTrackID:", v15, 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v56 = 0u;
              v57 = 0u;
              v55 = 0u;
              if (v21)
                objc_msgSend(v21, "timeRange");
              v53 = v56;
              v54 = v12;
              v51[0] = v55;
              v51[1] = v56;
              v51[2] = v57;
              v52 = v55;
              -[PXStoryExportAudioCompositionBuilder _insertAudioTrack:fromTime:intoAudioCompositionTrack:atTimeRange:error:](self, "_insertAudioTrack:fromTime:intoAudioCompositionTrack:atTimeRange:error:", v21, &v52, v25, v51, &v54);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v54;

              if (v26)
              {
                if (v11)
                {
                  v44 = v27;
                  v49 = 0u;
                  v50 = 0u;
                  v47 = 0u;
                  v48 = 0u;
                  objc_msgSend(v11, "inputParameters");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
                  if (v29)
                  {
                    v30 = v29;
                    v31 = *(_QWORD *)v48;
                    while (2)
                    {
                      for (i = 0; i != v30; ++i)
                      {
                        if (*(_QWORD *)v48 != v31)
                          objc_enumerationMutation(v28);
                        v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                        v34 = objc_msgSend(v33, "trackID");
                        if (v34 == objc_msgSend(v21, "trackID"))
                        {
                          v35 = (void *)objc_msgSend(v33, "mutableCopy");
                          objc_msgSend(v35, "setTrackID:", objc_msgSend(v25, "trackID"));
                          self = v43;
                          -[PXStoryExportAudioCompositionBuilder audioMixParameters](v43, "audioMixParameters");
                          v36 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v36, "addObject:", v35);

                          goto LABEL_23;
                        }
                      }
                      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
                      self = v43;
                      if (v30)
                        continue;
                      break;
                    }
                  }
LABEL_23:

                  v16 = v41;
                  v11 = v42;
                  v15 = v40;
                  v27 = v44;
                }
                -[NSMutableArray addObject:](self->_musicCompositionTracks, "addObject:", v25);
              }

              v12 = v27;
              v19 = v45;
            }
            v18 = v46;
          }
          ++v20;
        }
        while (v20 != v18);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v18);
    }
    else
    {
      v12 = 0;
    }

    a6 = v38;
    v10 = v39;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v12);
  -[PXStoryExportAudioCompositionBuilder setError:](self, "setError:", v12);

  return v12 == 0;
}

- (BOOL)addAudioFromVideoHighlightAsset:(id)a3 fromTime:(id *)a4 atStoryTimeRange:(id *)a5 volume:(float)a6 fadeIn:(double)a7 fadeOut:(double)a8 shouldDuck:(BOOL)a9 error:(id *)a10
{
  _BOOL4 v11;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v48;
  _BOOL4 v49;
  __int128 v50;
  int64_t var3;
  id v52;
  _OWORD v53[3];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v11 = a9;
  v59 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  -[PXStoryExportAudioCompositionBuilder error](self, "error");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v20 = *MEMORY[0x1E0C8A7A0];
    objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A0], v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v22)
    {
      v23 = v22;
      v48 = v20;
      v49 = v11;
      v24 = *(_QWORD *)v55;
LABEL_4:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v25);
        if ((objc_msgSend(v26, "isEnabled", v48) & 1) != 0)
          break;
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
          if (v23)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v27 = v26;

      if (!v27)
      {
        v19 = 0;
        goto LABEL_27;
      }
      -[PXStoryExportAudioCompositionBuilder currentVideoHighlightCompositionTrack](self, "currentVideoHighlightCompositionTrack");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryExportAudioCompositionBuilder videoHighlightCompositionTrackB](self, "videoHighlightCompositionTrackB");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 == v29)
      {
        -[PXStoryExportAudioCompositionBuilder videoHighlightCompositionTrackA](self, "videoHighlightCompositionTrackA");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v49;
        if (!v35)
        {
          -[PXStoryExportAudioCompositionBuilder audioComposition](self, "audioComposition");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addMutableTrackWithMediaType:preferredTrackID:", v48, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXStoryExportAudioCompositionBuilder setVideoHighlightCompositionTrackA:](self, "setVideoHighlightCompositionTrackA:", v37);
        }
        -[PXStoryExportAudioCompositionBuilder videoHighlightCompositionTrackA](self, "videoHighlightCompositionTrackA");
        v34 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PXStoryExportAudioCompositionBuilder videoHighlightCompositionTrackB](self, "videoHighlightCompositionTrackB");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = v49;
        if (!v30)
        {
          -[PXStoryExportAudioCompositionBuilder audioComposition](self, "audioComposition");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addMutableTrackWithMediaType:preferredTrackID:", v48, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXStoryExportAudioCompositionBuilder setVideoHighlightCompositionTrackB:](self, "setVideoHighlightCompositionTrackB:", v33);
        }
        -[PXStoryExportAudioCompositionBuilder videoHighlightCompositionTrackB](self, "videoHighlightCompositionTrackB");
        v34 = objc_claimAutoreleasedReturnValue();
      }
      v38 = (void *)v34;
      -[PXStoryExportAudioCompositionBuilder setCurrentVideoHighlightCompositionTrack:](self, "setCurrentVideoHighlightCompositionTrack:", v34);

      -[PXStoryExportAudioCompositionBuilder currentVideoHighlightCompositionTrack](self, "currentVideoHighlightCompositionTrack");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *(_OWORD *)&a5->var0.var3;
      v53[0] = *(_OWORD *)&a5->var0.var0;
      v53[1] = v40;
      v53[2] = *(_OWORD *)&a5->var1.var1;
      v50 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v52 = 0;
      -[PXStoryExportAudioCompositionBuilder _insertAudioTrack:fromTime:intoAudioCompositionTrack:atTimeRange:error:](self, "_insertAudioTrack:fromTime:intoAudioCompositionTrack:atTimeRange:error:", v27, &v50, v39, v53, &v52);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v52;

      if (v41)
      {
        -[PXStoryExportAudioCompositionBuilder currentVideoHighlightCompositionTrack](self, "currentVideoHighlightCompositionTrack");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v43 = a6;
        -[PXStoryExportAudioCompositionBuilder _applyVolumeRampsToVideoHilightAudioSegment:inAudioCompositionTrack:volume:fadeIn:fadeOut:](self, "_applyVolumeRampsToVideoHilightAudioSegment:inAudioCompositionTrack:volume:fadeIn:fadeOut:", v41, v42, v43, a7, a8);

        if (v31)
        {
          -[PXStoryExportAudioCompositionBuilder duckingAudioSegments](self, "duckingAudioSegments");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
          {
            v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[PXStoryExportAudioCompositionBuilder setDuckingAudioSegments:](self, "setDuckingAudioSegments:", v45);

          }
          -[PXStoryExportAudioCompositionBuilder duckingAudioSegments](self, "duckingAudioSegments");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v41);

        }
      }

    }
    else
    {
LABEL_10:
      v19 = 0;
      v27 = v21;
    }

  }
LABEL_27:
  if (a10)
    *a10 = objc_retainAutorelease(v19);
  -[PXStoryExportAudioCompositionBuilder setError:](self, "setError:", v19);

  return v19 == 0;
}

- (AVMutableComposition)audioComposition
{
  AVMutableComposition *audioComposition;
  AVMutableComposition *v4;
  AVMutableComposition *v5;

  audioComposition = self->_audioComposition;
  if (!audioComposition)
  {
    v4 = (AVMutableComposition *)objc_alloc_init(MEMORY[0x1E0C8B268]);
    v5 = self->_audioComposition;
    self->_audioComposition = v4;

    audioComposition = self->_audioComposition;
  }
  return audioComposition;
}

- (id)_insertAudioTrack:(id)a3 fromTime:(id *)a4 intoAudioCompositionTrack:(id)a5 atTimeRange:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  __int128 v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v22;
  CMTime v23;
  CMTime time2;
  CMTimeRange range;
  CMTime time;
  _BYTE v27[128];

  v12 = a3;
  v13 = a5;
  memset(&v27[80], 0, 48);
  if (v12)
    objc_msgSend(v12, "timeRange");
  memset(&v27[56], 0, 24);
  -[PXStoryExportAudioCompositionBuilder maximumDuration](self, "maximumDuration");
  v14 = *(_OWORD *)&a4->var0;
  time.epoch = a4->var3;
  range = *(CMTimeRange *)&v27[80];
  *(_OWORD *)&time.value = v14;
  CMTimeClampToRange((CMTime *)v27, &time, &range);
  memset(&v27[24], 0, 24);
  time = *(CMTime *)&v27[56];
  time2 = *(CMTime *)v27;
  CMTimeMinimum(&range.start, &time, &time2);
  *(CMTime *)v27 = range.start;
  range.start = *(CMTime *)&v27[104];
  time = *(CMTime *)v27;
  CMTimeSubtract(&v23, &range.start, &time);
  time = (CMTime)a6->var1;
  CMTimeMinimum(&range.start, &time, &v23);
  *(_QWORD *)&v27[40] = range.start.epoch;
  *(_OWORD *)&v27[24] = *(_OWORD *)&range.start.value;
  time = range.start;
  time2 = *(CMTime *)&v27[56];
  CMTimeMinimum(&range.start, &time, &time2);
  *(CMTime *)&v27[24] = range.start;
  memset(&time, 0, sizeof(time));
  range.start = *(CMTime *)&v27[56];
  time2 = (CMTime)a6->var0;
  CMTimeMinimum(&time, &range.start, &time2);
  v22 = 0;
  range = *(CMTimeRange *)v27;
  time2 = time;
  v15 = objc_msgSend(v13, "insertTimeRange:ofTrack:atTime:error:", &range, v12, &time2, &v22);
  v16 = v22;
  v17 = 0;
  if (v15)
  {
    objc_msgSend(v13, "segments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      range.start = time;
      objc_msgSend(v13, "segmentForTrackTime:", &range);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        goto LABEL_10;
      PXAssertGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(range.start.value) = 0;
        _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Could not find audio segment inserted during export", (uint8_t *)&range, 2u);
      }

    }
    v17 = 0;
  }
LABEL_10:
  if (a7)
    *a7 = objc_retainAutorelease(v16);

  return v17;
}

- (void)_applyVolumeRampsToVideoHilightAudioSegment:(id)a3 inAudioCompositionTrack:(id)a4 volume:(float)a5 fadeIn:(double)a6 fadeOut:(double)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  float v17;
  float v18;
  float v19;
  int v20;
  float v21;
  float v22;
  double v23;
  CMTime v24;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange time;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[32];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CMTime v45;

  v12 = a3;
  -[PXStoryExportAudioCompositionBuilder _mutableAudioMixParametersCreatedIfNeededForCompositionTrack:](self, "_mutableAudioMixParametersCreatedIfNeededForCompositionTrack:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "audioFadeCurve");
  if (v12)
  {
    objc_msgSend(v12, "timeMapping");
    *(_OWORD *)&v45.value = v42;
    v45.epoch = v43;
    objc_msgSend(v12, "timeMapping");
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    memset(&v45, 0, sizeof(v45));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
  }
  v37 = v31;
  *(_OWORD *)v38 = v32;
  *(_OWORD *)&v38[16] = v33;
  v30 = v45;
  if (a6 <= 0.0)
  {
    time.start = v45;
    objc_msgSend(v13, "setVolume:atTime:", &time, COERCE_DOUBLE(__PAIR64__(HIDWORD(v45.value), LODWORD(a5))));
  }
  else
  {
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeWithSeconds(&v29, a6, 600);
    memset(&v28, 0, sizeof(v28));
    time.start = v29;
    v16 = 1;
    CMTimeMultiplyByRatio(&v28, &time.start, 1, 30);
    v17 = 0.0;
    do
    {
      memset(&time, 0, sizeof(time));
      start.start = v30;
      duration = v28;
      CMTimeRangeMake(&time, &start.start, &duration);
      v18 = PXVolumeGainForAudioCurveAtTime(v15, (float)v16 / 30.0);
      v19 = v18 * a5;
      start = time;
      objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &start, COERCE_DOUBLE(__PAIR64__(time.duration.flags, LODWORD(v17))), COERCE_DOUBLE(__PAIR64__(HIDWORD(time.start.epoch), v18 * a5)));
      start.start = v30;
      duration = v28;
      CMTimeAdd(&v30, &start.start, &duration);
      ++v16;
      v17 = v19;
    }
    while (v16 != 31);
  }
  if (a7 > 0.0)
  {
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeWithSeconds(&v29, a7, 600);
    memset(&v28, 0, sizeof(v28));
    time.start = v45;
    *(_OWORD *)&start.start.value = *(_OWORD *)&v38[8];
    start.start.epoch = *(_QWORD *)&v38[24];
    CMTimeAdd(&v28, &time.start, &start.start);
    memset(&duration, 0, sizeof(duration));
    time.start = v29;
    v20 = 1;
    CMTimeMultiplyByRatio(&duration, &time.start, 1, 30);
    v21 = 0.0;
    do
    {
      start.start = v28;
      v24 = duration;
      CMTimeSubtract(&time.start, &start.start, &v24);
      v28 = time.start;
      memset(&time, 0, sizeof(time));
      start.start = v28;
      v24 = duration;
      CMTimeRangeMake(&time, &start.start, &v24);
      v22 = PXVolumeGainForAudioCurveAtTime(v15, (float)v20 / 30.0) * a5;
      start = time;
      HIDWORD(v23) = time.duration.flags;
      *(float *)&v23 = v22;
      objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &start, v23, COERCE_DOUBLE(__PAIR64__(HIDWORD(time.start.epoch), LODWORD(v21))));
      ++v20;
      v21 = v22;
    }
    while (v20 != 31);
  }

}

- (void)_applyMusicDuckingAndFadeOut
{
  void *v3;
  Float64 v4;
  float v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  Float64 Seconds;
  float v28;
  double v29;
  float v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id obj;
  CMTimeFlags v39;
  CMTimeEpoch v40;
  CMTimeScale v41;
  CMTimeValue v42;
  uint64_t v43;
  PXStoryExportAudioCompositionBuilder *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  CMTime v48;
  CMTime v49;
  CMTime time;
  CMTimeRange range;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  CMTime v55;
  CMTimeRange duration;
  CMTime v57;
  CMTimeRange time2;
  CMTime v59;
  CMTimeRange time1;
  CMTime v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CMTimeRange v65;
  CMTimeRange rhs;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CMTime lhs;
  CMTime start;
  CMTimeRange v73;
  __int128 v74;
  CMTimeEpoch v75;
  CMTime v76;
  CMTimeValue value;
  CMTimeScale timescale;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v76, 0, sizeof(v76));
  objc_msgSend(v3, "duckingFadeDuration");
  CMTimeMakeWithSeconds(&v76, v4, 600);
  -[PXStoryExportAudioCompositionBuilder musicCompositionDefaultVolume](self, "musicCompositionDefaultVolume");
  v6 = v5;
  v37 = v3;
  objc_msgSend(v3, "musicDuckedVolume");
  v8 = v7;
  v74 = 0uLL;
  v75 = 0;
  -[PXStoryExportAudioCompositionBuilder outroDuration](self, "outroDuration");
  memset(&v73, 0, sizeof(v73));
  -[PXStoryExportAudioCompositionBuilder maximumDuration](self, "maximumDuration");
  *(_OWORD *)&rhs.start.value = v74;
  rhs.start.epoch = v75;
  CMTimeSubtract(&start, &lhs, &rhs.start);
  *(_OWORD *)&rhs.start.value = v74;
  rhs.start.epoch = v75;
  CMTimeRangeMake(&v73, &start, &rhs.start);
  -[PXStoryExportAudioCompositionBuilder duckingAudioSegments](self, "duckingAudioSegments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_291309);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[PXStoryExportAudioCompositionBuilder musicCompositionTracks](self, "musicCompositionTracks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
  if (v45)
  {
    v11 = v6 * v8;
    v43 = *(_QWORD *)v68;
    v40 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v42 = *MEMORY[0x1E0CA2E18];
    v39 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
    v41 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
    v44 = self;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v68 != v43)
          objc_enumerationMutation(obj);
        v46 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v12);
        v47 = v12;
        objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        value = v42;
        timescale = v41;
        if (!objc_msgSend(v10, "count"))
        {
          *(_OWORD *)&rhs.start.value = *MEMORY[0x1E0CA2E68];
          rhs.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          objc_msgSend(v13, "setVolume:atTime:", &rhs, COERCE_DOUBLE(__PAIR64__(HIDWORD(rhs.start.value), LODWORD(v6))));
        }
        if (!objc_msgSend(v10, "count"))
          goto LABEL_46;
        v14 = 0;
        v15 = 1;
        flags = v39;
        epoch = v40;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEmpty") & 1) != 0)
            goto LABEL_45;
          if (v18)
          {
            objc_msgSend(v18, "timeMapping");
          }
          else
          {
            v64 = 0u;
            memset(&v65, 0, sizeof(v65));
            v62 = 0u;
            v63 = 0u;
          }
          rhs = v65;
          if (!v14)
          {
            *(_OWORD *)&time1.start.value = *(_OWORD *)&v65.start.value;
            time1.start.epoch = v65.start.epoch;
            *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68];
            time2.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            if (CMTimeCompare(&time1.start, &time2.start))
            {
              *(_OWORD *)&time1.start.value = *MEMORY[0x1E0CA2E68];
              time1.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
              objc_msgSend(v13, "setVolume:atTime:", &time1, COERCE_DOUBLE(__PAIR64__(HIDWORD(time1.start.value), LODWORD(v6))));
            }
          }
          memset(&v61, 0, sizeof(v61));
          *(_OWORD *)&time1.start.value = *(_OWORD *)&rhs.start.value;
          time1.start.epoch = rhs.start.epoch;
          time2.start = v76;
          CMTimeSubtract(&v61, &time1.start, &time2.start);
          if ((flags & 1) != 0)
          {
            time1.start = v61;
            time2.start.value = value;
            time2.start.timescale = timescale;
            time2.start.flags = flags;
            time2.start.epoch = epoch;
            v19 = CMTimeCompare(&time1.start, &time2.start) >= 0;
          }
          else
          {
            v19 = 1;
          }
          memset(&time1, 0, sizeof(time1));
          time2.start = v61;
          duration.start = v76;
          CMTimeRangeMake(&time1, &time2.start, &duration.start);
          time2 = time1;
          CMTimeRangeGetEnd(&v59, &time2);
          *(_OWORD *)&time2.start.value = *(_OWORD *)&v73.start.value;
          time2.start.epoch = v73.start.epoch;
          if (CMTimeCompare(&v59, &time2.start) < 0
            && v19
            && (time2.start = v61,
                *(_OWORD *)&duration.start.value = *MEMORY[0x1E0CA2E68],
                duration.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
                (CMTimeCompare(&time2.start, &duration.start) & 0x80000000) == 0))
          {
            time2 = time1;
            objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &time2, COERCE_DOUBLE(__PAIR64__(time1.duration.flags, LODWORD(v6))), COERCE_DOUBLE(__PAIR64__(HIDWORD(time1.start.epoch), LODWORD(v11))));
          }
          else
          {
            *(_OWORD *)&time2.start.value = *(_OWORD *)&rhs.start.value;
            time2.start.epoch = rhs.start.epoch;
            *(_OWORD *)&duration.start.value = *(_OWORD *)&v73.start.value;
            duration.start.epoch = v73.start.epoch;
            if (CMTimeCompare(&time2.start, &duration.start) < 0)
            {
              *(_OWORD *)&time2.start.value = *(_OWORD *)&rhs.start.value;
              time2.start.epoch = rhs.start.epoch;
              objc_msgSend(v13, "setVolume:atTime:", &time2, COERCE_DOUBLE(__PAIR64__(HIDWORD(rhs.start.value), LODWORD(v11))));
            }
          }
          v20 = v13;
          memset(&time2, 0, sizeof(time2));
          duration = rhs;
          CMTimeRangeGetEnd(&v57, &duration);
          duration.start = v76;
          CMTimeRangeMake(&time2, &v57, &duration.start);
          memset(&v55, 0, sizeof(v55));
          duration = time2;
          CMTimeRangeGetEnd(&v55, &duration);
          v21 = 0;
          v22 = -1;
          v23 = v15;
          while (v14 >= objc_msgSend(v10, "count") + v22)
          {

            v24 = 0;
            if ((objc_msgSend(0, "isEmpty") & 1) == 0)
            {
              v25 = 1;
              v13 = v20;
              goto LABEL_36;
            }
LABEL_31:
            ++v23;
            --v22;
            v21 = v24;
          }
          objc_msgSend(v10, "objectAtIndexedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "isEmpty"))
            goto LABEL_31;
          v13 = v20;
          if (v24)
          {
            objc_msgSend(v24, "timeMapping");
            v53 = v54;
            memset(&duration, 0, 24);
            v52 = v76;
            CMTimeSubtract(&duration.start, &v53, &v52);
            v53 = v55;
            v52 = duration.start;
            v25 = CMTimeCompare(&v53, &v52) >> 31;

          }
          else
          {
            v25 = 1;
          }
LABEL_36:
          duration.start = v55;
          v53 = v73.start;
          if (CMTimeCompare(&duration.start, &v53) < 0 && v25)
          {
            duration = time2;
            objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &duration, COERCE_DOUBLE(__PAIR64__(time2.duration.flags, LODWORD(v11))), COERCE_DOUBLE(__PAIR64__(HIDWORD(time2.start.epoch), LODWORD(v6))));
          }
          else
          {
            memset(&v53, 0, sizeof(v53));
            duration = rhs;
            CMTimeRangeGetEnd(&v53, &duration);
            duration.start = v53;
            v52 = v73.start;
            if (CMTimeCompare(&duration.start, &v52) < 0)
              v26 = v25;
            else
              v26 = 0;
            if (v26 == 1)
            {
              duration.start = v53;
              objc_msgSend(v13, "setVolume:atTime:", &duration, COERCE_DOUBLE(__PAIR64__(HIDWORD(v53.value), LODWORD(v6))));
            }
          }
          value = v55.value;
          flags = v55.flags;
          timescale = v55.timescale;
          epoch = v55.epoch;
LABEL_45:

          ++v14;
          ++v15;
        }
        while (v14 < objc_msgSend(v10, "count"));
LABEL_46:
        memset(&rhs, 0, sizeof(rhs));
        if (v46)
          objc_msgSend(v46, "timeRange");
        else
          memset(&range, 0, sizeof(range));
        time1 = v73;
        CMTimeRangeGetIntersection(&rhs, &range, &time1);
        if ((rhs.start.flags & 1) == 0
          || (rhs.duration.flags & 1) == 0
          || rhs.duration.epoch
          || rhs.duration.value < 0
          || (time1.start = rhs.duration,
              *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68],
              time2.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
              CMTimeCompare(&time1.start, &time2.start)))
        {
          *(_OWORD *)&time1.start.value = *(_OWORD *)&rhs.start.value;
          time1.start.epoch = rhs.start.epoch;
          *(_OWORD *)&time2.start.value = *(_OWORD *)&v73.start.value;
          time2.start.epoch = v73.start.epoch;
          CMTimeSubtract(&time, &time1.start, &time2.start);
          Seconds = CMTimeGetSeconds(&time);
          *(_OWORD *)&time1.start.value = v74;
          time1.start.epoch = v75;
          v28 = Seconds / CMTimeGetSeconds(&time1.start);
          *(float *)&Seconds = v6 * PXStoryVolumeForFadeOutFractionCompleted(v28);
          time1 = rhs;
          CMTimeRangeGetEnd(&v48, &time1);
          *(_OWORD *)&time1.start.value = *(_OWORD *)&v73.start.value;
          time1.start.epoch = v73.start.epoch;
          CMTimeSubtract(&v49, &v48, &time1.start);
          v29 = CMTimeGetSeconds(&v49);
          *(_OWORD *)&time1.start.value = v74;
          time1.start.epoch = v75;
          v30 = v29 / CMTimeGetSeconds(&time1.start);
          *(float *)&v31 = v6 * PXStoryVolumeForFadeOutFractionCompleted(v30);
          time1 = rhs;
          objc_msgSend(v13, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &time1, COERCE_DOUBLE(__PAIR64__(rhs.duration.flags, LODWORD(Seconds))), v31);
        }
        -[PXStoryExportAudioCompositionBuilder _mutableAudioMixParametersForCompositionTrack:](v44, "_mutableAudioMixParametersForCompositionTrack:", v46);
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (void *)v32;
          -[PXStoryExportAudioCompositionBuilder audioMixParameters](v44, "audioMixParameters");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeObjectIdenticalTo:", v33);

          +[PXFlexMusicLibrary coalesceAudioMixInputParametersA:withAudioMixInputParametersB:audioTrack:](PXFlexMusicLibrary, "coalesceAudioMixInputParametersA:withAudioMixInputParametersB:audioTrack:", v33, v13, v46);
          v35 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v35 = v13;
        }
        -[PXStoryExportAudioCompositionBuilder audioMixParameters](v44, "audioMixParameters");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v35);

        v12 = v47 + 1;
      }
      while (v47 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    }
    while (v45);
  }

}

- (id)_mutableAudioMixParametersForCompositionTrack:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "trackID");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXStoryExportAudioCompositionBuilder audioMixParameters](self, "audioMixParameters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "trackID") == v4)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_mutableAudioMixParametersCreatedIfNeededForCompositionTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXStoryExportAudioCompositionBuilder _mutableAudioMixParametersForCompositionTrack:](self, "_mutableAudioMixParametersForCompositionTrack:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryExportAudioCompositionBuilder audioMixParameters](self, "audioMixParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  return v5;
}

- (NSMutableArray)audioMixParameters
{
  return self->_audioMixParameters;
}

- (void)setAudioMixParameters:(id)a3
{
  objc_storeStrong((id *)&self->_audioMixParameters, a3);
}

- (void)setAudioComposition:(id)a3
{
  objc_storeStrong((id *)&self->_audioComposition, a3);
}

- (float)musicCompositionDefaultVolume
{
  return self->_musicCompositionDefaultVolume;
}

- (void)setMusicCompositionDefaultVolume:(float)a3
{
  self->_musicCompositionDefaultVolume = a3;
}

- (NSMutableArray)musicCompositionTracks
{
  return self->_musicCompositionTracks;
}

- (void)setMusicCompositionTracks:(id)a3
{
  objc_storeStrong((id *)&self->_musicCompositionTracks, a3);
}

- (NSMutableArray)musicMixParameters
{
  return self->_musicMixParameters;
}

- (void)setMusicMixParameters:(id)a3
{
  objc_storeStrong((id *)&self->_musicMixParameters, a3);
}

- (AVMutableCompositionTrack)videoHighlightCompositionTrackA
{
  return self->_videoHighlightCompositionTrackA;
}

- (void)setVideoHighlightCompositionTrackA:(id)a3
{
  objc_storeStrong((id *)&self->_videoHighlightCompositionTrackA, a3);
}

- (AVMutableCompositionTrack)videoHighlightCompositionTrackB
{
  return self->_videoHighlightCompositionTrackB;
}

- (void)setVideoHighlightCompositionTrackB:(id)a3
{
  objc_storeStrong((id *)&self->_videoHighlightCompositionTrackB, a3);
}

- (AVMutableCompositionTrack)currentVideoHighlightCompositionTrack
{
  return self->_currentVideoHighlightCompositionTrack;
}

- (void)setCurrentVideoHighlightCompositionTrack:(id)a3
{
  objc_storeStrong((id *)&self->_currentVideoHighlightCompositionTrack, a3);
}

- (NSMutableArray)duckingAudioSegments
{
  return self->_duckingAudioSegments;
}

- (void)setDuckingAudioSegments:(id)a3
{
  objc_storeStrong((id *)&self->_duckingAudioSegments, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)setOutroDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_outroDuration.epoch = a3->var3;
  *(_OWORD *)&self->_outroDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setMaximumDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maximumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maximumDuration.value = v3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_duckingAudioSegments, 0);
  objc_storeStrong((id *)&self->_currentVideoHighlightCompositionTrack, 0);
  objc_storeStrong((id *)&self->_videoHighlightCompositionTrackB, 0);
  objc_storeStrong((id *)&self->_videoHighlightCompositionTrackA, 0);
  objc_storeStrong((id *)&self->_musicMixParameters, 0);
  objc_storeStrong((id *)&self->_musicCompositionTracks, 0);
  objc_storeStrong((id *)&self->_audioComposition, 0);
  objc_storeStrong((id *)&self->_audioMixParameters, 0);
}

uint64_t __68__PXStoryExportAudioCompositionBuilder__applyMusicDuckingAndFadeOut__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  CMTime v8;
  CMTime time1;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "timeMapping");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
  }
  *(_OWORD *)&v22.value = v19;
  v22.epoch = v20;
  if (v5)
  {
    objc_msgSend(v5, "timeMapping");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
  }
  time1 = v22;
  *(_OWORD *)&v8.value = v13;
  v8.epoch = v14;
  v6 = CMTimeCompare(&time1, &v8);

  return v6;
}

@end
