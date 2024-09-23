@implementation PTCinematographyFrameDetectionSmoother

- (PTCinematographyFrameDetectionSmoother)init
{
  PTCinematographyFrameDetectionSmoother *v2;
  PTCinematographyFrameDetectionSmoother *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyFrameDetectionSmoother;
  v2 = -[PTCinematographyFrameDetectionSmoother init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PTCinematographyFrameDetectionSmoother _reinit](v2, "_reinit");
  return v3;
}

- (void)_reinit
{
  NSMutableArray *v3;
  NSMutableArray *frames;
  PTCinematographyDetection *lastKnownFocusDetection;
  NSMutableDictionary *v6;
  NSMutableDictionary *firstFocusSmootherByTrackNumber;

  v3 = (NSMutableArray *)objc_opt_new();
  frames = self->_frames;
  self->_frames = v3;

  lastKnownFocusDetection = self->_lastKnownFocusDetection;
  self->_lastKnownFocusDetection = 0;

  v6 = (NSMutableDictionary *)objc_opt_new();
  firstFocusSmootherByTrackNumber = self->_firstFocusSmootherByTrackNumber;
  self->_firstFocusSmootherByTrackNumber = v6;

  *(_WORD *)&self->_didEndFrames = 0;
}

- (void)addFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_didEndFrames)
    -[PTCinematographyFrameDetectionSmoother _reinit](self, "_reinit");
  v5 = (void *)MEMORY[0x1E0C99E20];
  -[PTCinematographyFrameDetectionSmoother _activeTrackNumbers](self, "_activeTrackNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_frames, "addObject:", v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = v4;
  objc_msgSend(v4, "allDetections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PTCinematographyFrameDetectionSmoother _focusSmootherForAppendingWithTrackIdentifier:](self, "_focusSmootherForAppendingWithTrackIdentifier:", objc_msgSend(v13, "trackIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "focusDistance");
        objc_msgSend(v14, "addSample:");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "trackIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrameDetectionSmoother _endFocusSmoothersForTrackNumbers:](self, "_endFocusSmoothersForTrackNumbers:", v16);

  -[PTCinematographyFrameDetectionSmoother _invalidateIsNextFrameAvailableCache](self, "_invalidateIsNextFrameAvailableCache");
}

- (void)endFrames
{
  void *v3;

  -[PTCinematographyFrameDetectionSmoother _activeTrackNumbers](self, "_activeTrackNumbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrameDetectionSmoother _endFocusSmoothersForTrackNumbers:](self, "_endFocusSmoothersForTrackNumbers:", v3);

  -[PTCinematographyFrameDetectionSmoother _invalidateIsNextFrameAvailableCache](self, "_invalidateIsNextFrameAvailableCache");
  self->_didEndFrames = 1;
}

- (BOOL)isNextFrameAtEnd
{
  if (self->_didEndFrames)
    return !-[PTCinematographyFrameDetectionSmoother isNextFrameAvailable](self, "isNextFrameAvailable");
  else
    return 0;
}

- (BOOL)isNextFrameAvailable
{
  BOOL result;

  if (self->_didCacheIsNextFrameAvailable)
    return self->_isNextFrameAvailableCache;
  result = -[PTCinematographyFrameDetectionSmoother _computeIsNextFrameAvailable](self, "_computeIsNextFrameAvailable");
  self->_isNextFrameAvailableCache = result;
  self->_didCacheIsNextFrameAvailable = 1;
  return result;
}

- (void)_updateFocusDetectionForFrame:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v4 = a3;
  objc_msgSend(v4, "detectionForTrackIdentifier:", objc_msgSend(v4, "focusTrackIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PTCinematographyFrameDetectionSmoother setLastKnownFocusDetection:](self, "setLastKnownFocusDetection:", v5);
  }
  else
  {
    -[PTCinematographyFrameDetectionSmoother lastKnownFocusDetection](self, "lastKnownFocusDetection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          -[PTCinematographyFrameDetectionSmoother lastKnownFocusDetection](self, "lastKnownFocusDetection"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "trackIdentifier"),
          v11 = objc_msgSend(v4, "focusTrackIdentifier"),
          v9,
          v8,
          v10 == v11))
    {
      -[PTCinematographyFrameDetectionSmoother lastKnownFocusDetection](self, "lastKnownFocusDetection");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _PTLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PTCinematographyFrameDetectionSmoother _updateFocusDetectionForFrame:].cold.1(v4, self, v13);

      objc_msgSend(v4, "focusDetection");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v12;
  }
  objc_msgSend(v4, "focusOnDetection:", v6);

}

- (id)nextFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[PTCinematographyFrameDetectionSmoother isNextFrameAvailable](self, "isNextFrameAvailable"))
  {
    -[NSMutableArray firstObject](self->_frames, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "allDetections", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "trackIdentifier");
          -[PTCinematographyFrameDetectionSmoother _focusSmootherForReadingWithTrackIdentifier:](self, "_focusSmootherForReadingWithTrackIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "nextSmoothedSample");
            objc_msgSend(v9, "setFocusDistance:");
            if (objc_msgSend(v12, "isEndOfSmoothedSamples"))
              -[PTCinematographyFrameDetectionSmoother _skipToNextFocusSmootherWithTrackIdentifier:](self, "_skipToNextFocusSmootherWithTrackIdentifier:", v10);
          }
          else
          {
            _PTLogSystem();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[PTCinematographyFrameDetectionSmoother nextFrame].cold.1(v20, v10, &v21, v13);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v6);
    }

    -[PTCinematographyFrameDetectionSmoother _updateFocusDetectionForFrame:](self, "_updateFocusDetectionForFrame:", v3);
    objc_msgSend(v3, "focusDetection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "focusDistance");
    objc_msgSend(v3, "setFocusDistance:");

    -[NSMutableArray removeObjectAtIndex:](self->_frames, "removeObjectAtIndex:", 0);
    -[PTCinematographyFrameDetectionSmoother _invalidateIsNextFrameAvailableCache](self, "_invalidateIsNextFrameAvailableCache");
    if (!-[NSMutableArray count](self->_frames, "count"))
      -[PTCinematographyFrameDetectionSmoother _dropAllFocusSmoothersIfLeaked](self, "_dropAllFocusSmoothersIfLeaked");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_invalidateIsNextFrameAvailableCache
{
  self->_didCacheIsNextFrameAvailable = 0;
}

- (BOOL)_computeIsNextFrameAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_frames, "count"))
    return 0;
  -[NSMutableArray firstObject](self->_frames, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "allDetections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[PTCinematographyFrameDetectionSmoother _focusSmootherForReadingWithTrackIdentifier:](self, "_focusSmootherForReadingWithTrackIdentifier:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "trackIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isSmoothedSampleAvailable");

        if (!v10)
        {
          v11 = 0;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (id)_newFocusSmoother
{
  return objc_alloc_init(PTCinematographyFocusSmoother);
}

- (id)_activeTrackNumbers
{
  return (id)-[NSMutableDictionary allKeys](self->_firstFocusSmootherByTrackNumber, "allKeys");
}

- (id)_focusSmootherForReadingWithTrackIdentifier:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if ((PTTrackIDIsInvalid(a3) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[PTCinematographyFrameDetectionSmoother firstFocusSmootherByTrackNumber](self, "firstFocusSmootherByTrackNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_skipToNextFocusSmootherWithTrackIdentifier:(int64_t)a3
{
  NSMutableDictionary *firstFocusSmootherByTrackNumber;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  firstFocusSmootherByTrackNumber = self->_firstFocusSmootherByTrackNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](firstFocusSmootherByTrackNumber, "objectForKeyedSubscript:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "nextFocusSmoother");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_firstFocusSmootherByTrackNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

}

- (id)_focusSmootherForAppendingWithTrackIdentifier:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *firstFocusSmootherByTrackNumber;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;

  if ((PTTrackIDIsInvalid(a3) & 1) == 0)
  {
    firstFocusSmootherByTrackNumber = self->_firstFocusSmootherByTrackNumber;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](firstFocusSmootherByTrackNumber, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastFocusSmoother");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (!objc_msgSend(v5, "didEndSamples"))
        return v5;
      v9 = -[PTCinematographyFrameDetectionSmoother _newFocusSmoother](self, "_newFocusSmoother");
      objc_msgSend(v5, "setNextFocusSmoother:", v9);

      objc_msgSend(v5, "nextFocusSmoother");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = -[PTCinematographyFrameDetectionSmoother _newFocusSmoother](self, "_newFocusSmoother");
      v11 = self->_firstFocusSmootherByTrackNumber;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v5);
    }

    v5 = v10;
    return v5;
  }
  v5 = 0;
  return v5;
}

- (void)_endFocusSmoothersForTrackNumbers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_firstFocusSmootherByTrackNumber, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastFocusSmoother");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "endSamples");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_dropAllFocusSmoothersIfLeaked
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "error: focus detection smoothers remain when none expected", v1, 2u);
}

- (NSMutableArray)frames
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFrames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PTCinematographyDetection)lastKnownFocusDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastKnownFocusDetection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)firstFocusSmootherByTrackNumber
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFirstFocusSmootherByTrackNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)didEndFrames
{
  return self->_didEndFrames;
}

- (void)setDidEndFrames:(BOOL)a3
{
  self->_didEndFrames = a3;
}

- (BOOL)didCacheIsNextFrameAvailable
{
  return self->_didCacheIsNextFrameAvailable;
}

- (void)setDidCacheIsNextFrameAvailable:(BOOL)a3
{
  self->_didCacheIsNextFrameAvailable = a3;
}

- (BOOL)isNextFrameAvailableCache
{
  return self->_isNextFrameAvailableCache;
}

- (void)setIsNextFrameAvailableCache:(BOOL)a3
{
  self->_isNextFrameAvailableCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFocusSmootherByTrackNumber, 0);
  objc_storeStrong((id *)&self->_lastKnownFocusDetection, 0);
  objc_storeStrong((id *)&self->_frames, 0);
}

- (void)_updateFocusDetectionForFrame:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "focusTrackIdentifier");
  objc_msgSend(a1, "focusDetection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "lastKnownFocusDetection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 134218498;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1C9281000, a3, OS_LOG_TYPE_ERROR, "hanging focus track id %ld (%@?) with mismatching last known detection: %@", (uint8_t *)&v10, 0x20u);

}

- (void)nextFrame
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1C9281000, a4, OS_LOG_TYPE_ERROR, "error: attempt to read from nonexistent focus smoother for track %@", a1, 0xCu);

}

@end
