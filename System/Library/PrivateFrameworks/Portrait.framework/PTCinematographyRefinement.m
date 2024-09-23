@implementation PTCinematographyRefinement

- (PTCinematographyRefinement)init
{
  return -[PTCinematographyRefinement initWithOptions:](self, "initWithOptions:", 0);
}

- (PTCinematographyRefinement)initWithOptions:(id)a3
{
  id v4;
  PTCinematographyRefinement *v5;
  void *v6;
  void *v7;
  PTCinematographyRefinementOptions *v8;
  PTCinematographyRefinementOptions *options;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *globals;
  uint64_t v14;
  NSMutableArray *frames;
  NSNumber *refinedFrameNumber;
  PTCinematographyFrameDetectionSmoother *v17;
  PTCinematographyFrameDetectionSmoother *smoother;
  CMTime v20;
  CMTime rhs;
  CMTime v22;
  CMTime v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PTCinematographyRefinement;
  v5 = -[PTCinematographyRefinement init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (PTCinematographyRefinementOptions *)objc_opt_new();
    options = v5->_options;
    v5->_options = v8;

    memset(&v23, 0, sizeof(v23));
    CMTimeMake(&v23, 1, 1);
    -[PTCinematographyRefinementOptions focusFramesOptions](v5->_options, "focusFramesOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "maximumRackFocusPullTime");
    else
      memset(&rhs, 0, sizeof(rhs));
    v20 = v23;
    CMTimeAdd(&v22, &v20, &rhs);
    v5->_timeDelayForRefinement = ($95D729B680665BEAEFA1D6FCA8238556)v22;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    globals = v5->_globals;
    v5->_globals = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    frames = v5->_frames;
    v5->_frames = (NSMutableArray *)v14;

    v5->_shouldReturnAllCachedFrames = 0;
    refinedFrameNumber = v5->_refinedFrameNumber;
    v5->_refinedFrameNumber = (NSNumber *)&unk_1E82521A8;
    v5->_firstIndexToLookForTransitions = 0;

    if (!-[PTCinematographyRefinementOptions disableDetectionSmoothing](v5->_options, "disableDetectionSmoothing"))
    {
      v17 = objc_alloc_init(PTCinematographyFrameDetectionSmoother);
      smoother = v5->_smoother;
      v5->_smoother = v17;

    }
  }

  return v5;
}

- (void)addFrames:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  PTCinematographyFrameDetectionSmoother *smoother;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 138412290;
    v20 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[PTCinematographyRefinement refinedFrameNumber](self, "refinedFrameNumber", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[PTCinematographyRefinement refinedFrameNumber](self, "refinedFrameNumber");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_setFrameNumber:", v12);

          v13 = (void *)MEMORY[0x1E0CB37E8];
          -[PTCinematographyRefinement refinedFrameNumber](self, "refinedFrameNumber");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerValue") + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTCinematographyRefinement setRefinedFrameNumber:](self, "setRefinedFrameNumber:", v15);

        }
        if (-[PTCinematographyRefinement _needSnapshotForPolicy:](self, "_needSnapshotForPolicy:", objc_msgSend(v10, "_snapshotPolicy")))
        {
          objc_msgSend(v10, "_snapshot");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v10, "_snapshot");
            v17 = objc_claimAutoreleasedReturnValue();
            -[PTCinematographyRefinement _updateRecordingStateForSnapshot:](self, "_updateRecordingStateForSnapshot:", v17);
          }
          else
          {
            _PTLogSystem();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "_frameNumber");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v26 = v18;
              _os_log_impl(&dword_1C9281000, v17, OS_LOG_TYPE_INFO, "warning: snapshot missing from refined frame %@", buf, 0xCu);

            }
          }

        }
        else
        {
          objc_msgSend(v10, "_setSnapshot:", 0);
        }
        smoother = self->_smoother;
        if (smoother)
          -[PTCinematographyFrameDetectionSmoother addFrame:](smoother, "addFrame:", v10);
        else
          -[NSMutableArray addObject:](self->_frames, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }
  if (self->_smoother)
    -[PTCinematographyRefinement _moveAlongSmoothedFrames](self, "_moveAlongSmoothedFrames");

}

- (void)startRecording
{
  NSObject *v3;
  int v4;
  PTCinematographyRefinement *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1C9281000, v3, OS_LOG_TYPE_INFO, "Cinematography refinement <%p> start recording", (uint8_t *)&v4, 0xCu);
  }

  -[PTCinematographyRefinement setRefinedFrameNumber:](self, "setRefinedFrameNumber:", &unk_1E82521A8);
  -[PTCinematographyRefinement setRecordingState:](self, "setRecordingState:", 1);
}

- (void)stopRecording
{
  NSObject *v3;
  int v4;
  PTCinematographyRefinement *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_1C9281000, v3, OS_LOG_TYPE_INFO, "Cinematography refinement <%p> stop recording", (uint8_t *)&v4, 0xCu);
  }

  if (self->_smoother)
    -[PTCinematographyRefinement _endSmoothedFrames](self, "_endSmoothedFrames");
  -[PTCinematographyRefinement setRecordingState:](self, "setRecordingState:", 0);
  self->_shouldReturnAllCachedFrames = 1;
}

- (id)refinedFrames
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  _BOOL4 v6;

  if (-[NSMutableArray count](self->_frames, "count"))
  {
    -[PTCinematographyRefinement _performRackFocusPullsStartingAtIndex:](self, "_performRackFocusPullsStartingAtIndex:", self->_firstIndexToLookForTransitions);
    -[PTCinematographyRefinement _extractFramesReturningAll:](self, "_extractFramesReturningAll:", self->_shouldReturnAllCachedFrames);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableArray count](self->_frames, "count"))
      v4 = -[NSMutableArray count](self->_frames, "count") - 1;
    else
      v4 = 0;
    self->_firstIndexToLookForTransitions = v4;
    self->_shouldReturnAllCachedFrames = 0;
    _PTLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
      +[PTCinematographyFrame _debugLogFrames:label:](PTCinematographyFrame, "_debugLogFrames:label:", v3, CFSTR("Refined Cinematography"));
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)globalCinematographyDictionary
{
  void *v2;
  void *v3;

  -[PTCinematographyRefinement globals](self, "globals");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)_moveAlongSmoothedFrames
{
  void *v3;

  if (-[PTCinematographyFrameDetectionSmoother isNextFrameAvailable](self->_smoother, "isNextFrameAvailable"))
  {
    do
    {
      -[PTCinematographyFrameDetectionSmoother nextFrame](self->_smoother, "nextFrame");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_frames, "addObject:", v3);

    }
    while (-[PTCinematographyFrameDetectionSmoother isNextFrameAvailable](self->_smoother, "isNextFrameAvailable"));
  }
}

- (void)_endSmoothedFrames
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "error: frames in smoother after recording stopped", v1, 2u);
}

- (void)_performRackFocusPullsStartingAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;

  if (-[NSMutableArray count](self->_frames, "count") >= a3 + 2)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "focusTrackIdentifier");

    v7 = a3 + 1;
    v8 = -[NSMutableArray count](self->_frames, "count");
    while (v7 < v8)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "focusTrackIdentifier");

      if (v10 != v6)
        -[PTCinematographyRefinement _performRackFocusPullToFrameAtIndex:](self, "_performRackFocusPullToFrameAtIndex:", v7);
      ++v7;
      v8 = -[NSMutableArray count](self->_frames, "count");
      v6 = v10;
    }
  }
}

- (void)_performRackFocusPullToFrameAtIndex:(unint64_t)a3
{
  PTCinematographyFocusFrames *v5;
  NSMutableArray *frames;
  void *v7;
  uint64_t v8;
  PTCinematographyFocusFrames *v9;

  v5 = [PTCinematographyFocusFrames alloc];
  frames = self->_frames;
  -[PTCinematographyRefinementOptions focusFramesOptions](self->_options, "focusFramesOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PTCinematographyFocusFrames initWithFrames:options:](v5, "initWithFrames:options:", frames, v7);

  v8 = -[PTCinematographyFocusFrames startIndexForLinearRackFocusPullToFrameAtIndex:](v9, "startIndexForLinearRackFocusPullToFrameAtIndex:", a3);
  -[PTCinematographyRefinement _logRackFocusPullToFrameAtIndex:fromIndex:label:](self, "_logRackFocusPullToFrameAtIndex:fromIndex:label:", a3, v8, CFSTR("linear rack focus"));
  -[PTCinematographyRefinement _performLinearRackFocusPullToFrameAtIndex:fromIndex:](self, "_performLinearRackFocusPullToFrameAtIndex:fromIndex:", a3, v8);

}

- (void)_logRackFocusPullToFrameAtIndex:(unint64_t)a3 fromIndex:(unint64_t)a4 label:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _PTLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_frameNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v20, "longValue");
    -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "focusDetection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "focusIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_frameNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longValue");
    -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "focusDetection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "focusIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v23 = v8;
    v24 = 2048;
    v25 = v18;
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = v14;
    v30 = 2112;
    v31 = v17;
    _os_log_impl(&dword_1C9281000, v9, OS_LOG_TYPE_INFO, "Cinematography %@ from frame %ld (%@) to frame %ld (%@)", buf, 0x34u);

  }
}

- (void)_performLinearRackFocusPullToFrameAtIndex:(unint64_t)a3 fromIndex:(int64_t)a4
{
  void *v7;
  void *v8;
  double Seconds;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  unint64_t v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  CMTime v36;
  CMTime v37;
  CMTime time;

  -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "time");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "time");
  else
    memset(&v37, 0, sizeof(v37));
  v12 = CMTimeGetSeconds(&v37);

  -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "focusDistance");
  v15 = v14;

  -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "focusDistance");
  v18 = v17;

  v20 = a4 + 1;
  if (v20 < a3)
  {
    v21 = Seconds;
    v22 = v12;
    v23 = v22 - v21;
    *(float *)&v19 = v18 - v15;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v20, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        objc_msgSend(v24, "time");
      else
        memset(&v36, 0, sizeof(v36));
      v26 = CMTimeGetSeconds(&v36);

      v27 = v26 - v21;
      -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v29 = v15 + (float)((float)((float)(v18 - v15) / v23) * v27);
      objc_msgSend(v28, "setFocusDistance:", v29);

      -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v31 = v27 / v23;
      objc_msgSend(v30, "setTransitionCoefficient:", v31);

      -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v33 = v27;
      objc_msgSend(v32, "setTransitionElapsedTime:", v33);

      -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v35 = v23;
      objc_msgSend(v34, "setTransitionDuration:", v35);

      ++v20;
    }
    while (a3 != v20);
  }
}

- (id)_extractFramesReturningAll:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMTime v10;
  CMTime rhs;
  CMTime v12;
  CMTime v13;

  if (a3)
  {
    v4 = -[NSMutableArray count](self->_frames, "count");
  }
  else
  {
    memset(&v13, 0, sizeof(v13));
    -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_frames, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "time");
    else
      memset(&v13, 0, sizeof(v13));

    memset(&v12, 0, sizeof(v12));
    -[PTCinematographyRefinementOptions focusFramesOptions](self->_options, "focusFramesOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "maximumRackFocusPullTime");
    else
      memset(&rhs, 0, sizeof(rhs));
    v10 = v13;
    CMTimeSubtract(&v12, &v10, &rhs);

    v10 = v12;
    v4 = -[PTCinematographyRefinement _framesIndexForTime:](self, "_framesIndexForTime:", &v10);
  }
  -[PTCinematographyRefinement _extractFramesToIndex:](self, "_extractFramesToIndex:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_extractFramesToIndex:(unint64_t)a3
{
  void *v5;

  -[NSMutableArray subarrayWithRange:](self->_frames, "subarrayWithRange:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_frames, "removeObjectsInRange:", 0, a3);
  return v5;
}

- (unint64_t)_framesIndexForTime:(id *)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  int32_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  CMTime time1;

  if (!-[NSMutableArray count](self->_frames, "count"))
    return 0;
  v5 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "time");
    else
      memset(&time1, 0, sizeof(time1));
    v10 = *a3;
    v8 = CMTimeCompare(&time1, (CMTime *)&v10);

    if ((v8 & 0x80000000) == 0)
      break;
    if (++v5 >= -[NSMutableArray count](self->_frames, "count"))
      return 0;
  }
  return v5;
}

- (BOOL)_needSnapshotForPolicy:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 2)
    return 0;
  if (a3)
    return 1;
  return -[PTCinematographyRefinement recordingState](self, "recordingState", v3, v4) == 1;
}

- (void)_updateRecordingStateForSnapshot:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PTCinematographyRefinement recordingState](self, "recordingState") == 1)
  {
    -[PTCinematographyRefinement setRecordingState:](self, "setRecordingState:", 2);
    -[PTCinematographyRefinement _updateGlobalsWithSnapshot:](self, "_updateGlobalsWithSnapshot:", v4);
  }

}

- (void)_updateGlobalsWithSnapshot:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PTCinematographyRefinement globals](self, "globals");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeDelayForRefinement
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (PTCinematographyRefinementOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)globals
{
  return self->_globals;
}

- (void)setGlobals:(id)a3
{
  objc_storeStrong((id *)&self->_globals, a3);
}

- (PTCinematographyFrameDetectionSmoother)smoother
{
  return self->_smoother;
}

- (void)setSmoother:(id)a3
{
  objc_storeStrong((id *)&self->_smoother, a3);
}

- (NSMutableArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (NSNumber)refinedFrameNumber
{
  return self->_refinedFrameNumber;
}

- (void)setRefinedFrameNumber:(id)a3
{
  objc_storeStrong((id *)&self->_refinedFrameNumber, a3);
}

- (unint64_t)firstIndexToLookForTransitions
{
  return self->_firstIndexToLookForTransitions;
}

- (void)setFirstIndexToLookForTransitions:(unint64_t)a3
{
  self->_firstIndexToLookForTransitions = a3;
}

- (unint64_t)recordingState
{
  return self->_recordingState;
}

- (void)setRecordingState:(unint64_t)a3
{
  self->_recordingState = a3;
}

- (BOOL)shouldReturnAllCachedFrames
{
  return self->_shouldReturnAllCachedFrames;
}

- (void)setShouldReturnAllCachedFrames:(BOOL)a3
{
  self->_shouldReturnAllCachedFrames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinedFrameNumber, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_smoother, 0);
  objc_storeStrong((id *)&self->_globals, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
