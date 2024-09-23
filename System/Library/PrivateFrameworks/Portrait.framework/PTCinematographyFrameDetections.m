@implementation PTCinematographyFrameDetections

+ (id)frameDetections:(id)a3 detectorDidRun:(id)a4 presentationTime:(id *)a5
{
  id v7;
  id v8;
  PTCinematographyFrameDetections *v9;
  PTCinematographyFrameDetections *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v7 = a4;
  v8 = a3;
  v9 = [PTCinematographyFrameDetections alloc];
  v12 = *a5;
  v10 = -[PTCinematographyFrameDetections initWithDetections:detectorDidRun:presentationTime:](v9, "initWithDetections:detectorDidRun:presentationTime:", v8, v7, &v12);

  return v10;
}

- (PTCinematographyFrameDetections)initWithDetections:(id)a3 detectorDidRun:(id)a4 presentationTime:(id *)a5
{
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PTCinematographyFrameDetections;
  v10 = -[PTCinematographyFrameDetections init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v11;

    v13 = objc_msgSend(v9, "copy");
    v14 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v13;

    v15 = *(_OWORD *)&a5->var0;
    *((_QWORD *)v10 + 11) = a5->var3;
    *(_OWORD *)(v10 + 72) = v15;
  }

  return (PTCinematographyFrameDetections *)v10;
}

- (id)detectionForTrackIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PTCinematographyFrameDetections _detectionsByTrackIdentifier](self, "_detectionsByTrackIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bestDetectionForGroupIdentifier:(int64_t)a3
{
  return -[PTCinematographyFrameDetections bestDetectionForGroupIdentifier:options:](self, "bestDetectionForGroupIdentifier:options:", a3, 0);
}

- (id)bestDetectionForGroupIdentifier:(int64_t)a3 options:(unint64_t)a4
{
  char v4;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PTCinematographyFrameDetections detections](self, "detections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412546;
    v17 = v8;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "groupIdentifier", v17) == a3)
        {
          if ((v4 & 1) != 0 && objc_msgSend(v13, "_isExcludedAsCinematicChoice"))
          {
            _PTLogSystem();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v17;
              v23 = v13;
              v24 = 2112;
              v25 = v15;
              _os_log_debug_impl(&dword_1C9281000, v14, OS_LOG_TYPE_DEBUG, "excluding %@ as best detection for group %@", buf, 0x16u);

            }
            goto LABEL_14;
          }
          if (!v10
            || PTDetectionTypeIsBetter(objc_msgSend(v13, "detectionType"), -[NSObject detectionType](v10, "detectionType")))
          {
            v14 = v10;
            v10 = v13;
LABEL_14:

            continue;
          }
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (!v9)
        goto LABEL_19;
    }
  }
  v10 = 0;
LABEL_19:

  return v10;
}

- (id)detectionForFocusIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PTCinematographyFrameDetections _detectionsByFocusIdentifier](self, "_detectionsByFocusIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)allTrackIdentifiers
{
  void *v2;
  void *v3;

  -[PTCinematographyFrameDetections _detectionsByTrackIdentifier](self, "_detectionsByTrackIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)allTrackIdentifiersForCinematicChoice
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PTCinematographyFrameDetections allTrackIdentifiers](self, "allTrackIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[PTCinematographyFrameDetections detectionForTrackIdentifier:](self, "detectionForTrackIdentifier:", PTTrackIDFromNumber(v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && (objc_msgSend(v10, "_isExcludedAsCinematicChoice") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (id)_detectionsByTrackIdentifier
{
  NSDictionary *cachedDetectionsByTrackIdentifier;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  if (!cachedDetectionsByTrackIdentifier)
  {
    -[PTCinematographyFrameDetections detections](self, "detections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTCinematographyDetection _detectionsByTrackIdentifierFromArray:](PTCinematographyDetection, "_detectionsByTrackIdentifierFromArray:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedDetectionsByTrackIdentifier;
    self->_cachedDetectionsByTrackIdentifier = v5;

    cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  }
  return cachedDetectionsByTrackIdentifier;
}

- (NSArray)allFocusIdentifiers
{
  void *v2;
  void *v3;

  -[PTCinematographyFrameDetections _detectionsByFocusIdentifier](self, "_detectionsByFocusIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_detectionsByFocusIdentifier
{
  NSDictionary *cachedDetectionsByFocusIdentifier;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  if (!cachedDetectionsByFocusIdentifier)
  {
    -[PTCinematographyFrameDetections detections](self, "detections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTCinematographyDetection _detectionsByFocusIdentifierFromArray:](PTCinematographyDetection, "_detectionsByFocusIdentifierFromArray:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedDetectionsByFocusIdentifier;
    self->_cachedDetectionsByFocusIdentifier = v5;

    cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  }
  return cachedDetectionsByFocusIdentifier;
}

- (PTCinematographyDetection)autoFocusDetection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[PTCinematographyFrameDetections didCacheAutoFocusDetection](self, "didCacheAutoFocusDetection"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[PTCinematographyFrameDetections detections](self, "detections", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v8, "isAutoFocusDetection"))
          {
            -[PTCinematographyFrameDetections setCachedAutoFocusDetection:](self, "setCachedAutoFocusDetection:", v8);
            -[PTCinematographyFrameDetections setDidCacheAutoFocusDetection:](self, "setDidCacheAutoFocusDetection:", 1);
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  -[PTCinematographyFrameDetections cachedAutoFocusDetection](self, "cachedAutoFocusDetection");
  return (PTCinematographyDetection *)(id)objc_claimAutoreleasedReturnValue();
}

- (PTCinematographyDetection)customDetection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[PTCinematographyFrameDetections didCacheCustomDetection](self, "didCacheCustomDetection"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[PTCinematographyFrameDetections detections](self, "detections", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v8, "isCustomDetection"))
          {
            -[PTCinematographyFrameDetections setCachedCustomDetection:](self, "setCachedCustomDetection:", v8);
            -[PTCinematographyFrameDetections setDidCacheCustomDetection:](self, "setDidCacheCustomDetection:", 1);
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  -[PTCinematographyFrameDetections cachedCustomDetection](self, "cachedCustomDetection");
  return (PTCinematographyDetection *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addDetection:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *detections;
  id v8;

  v4 = a3;
  -[PTCinematographyFrameDetections detections](self, "detections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v8, "addObject:", v4);
  v6 = (NSArray *)objc_msgSend(v8, "copy");
  detections = self->_detections;
  self->_detections = v6;

  -[PTCinematographyFrameDetections flushCachedDetectionsDictionaries](self, "flushCachedDetectionsDictionaries");
}

- (void)flushCachedDetectionsDictionaries
{
  NSDictionary *cachedDetectionsByFocusIdentifier;
  NSDictionary *cachedDetectionsByTrackIdentifier;

  cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  self->_cachedDetectionsByFocusIdentifier = 0;

  cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  self->_cachedDetectionsByTrackIdentifier = 0;

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CMTime v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PTCinematographyFrameDetections detections](self, "detections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "debugDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[PTCinematographyFrameDetections detectorDidRun](self, "detectorDidRun");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrameDetections presentationTime](self, "presentationTime");
  NSStringFromCMTime(&v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (DDR:%@, pts:%@)\n%@"), self, v11, v12, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSArray)detections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)detectorDidRun
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_presentationTime, 24, 1, 0);
  return result;
}

- (void)setPresentationTime:(id *)a3
{
  objc_copyStruct(&self->_presentationTime, a3, 24, 1, 0);
}

- (NSDictionary)cachedDetectionsByFocusIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)cachedDetectionsByTrackIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)didCacheAutoFocusDetection
{
  return self->_didCacheAutoFocusDetection;
}

- (void)setDidCacheAutoFocusDetection:(BOOL)a3
{
  self->_didCacheAutoFocusDetection = a3;
}

- (PTCinematographyDetection)cachedAutoFocusDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedAutoFocusDetection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)didCacheCustomDetection
{
  return self->_didCacheCustomDetection;
}

- (void)setDidCacheCustomDetection:(BOOL)a3
{
  self->_didCacheCustomDetection = a3;
}

- (PTCinematographyDetection)cachedCustomDetection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCachedCustomDetection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)baseFocusTrackNumberOverride
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBaseFocusTrackNumberOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseFocusTrackNumberOverride, 0);
  objc_storeStrong((id *)&self->_cachedCustomDetection, 0);
  objc_storeStrong((id *)&self->_cachedAutoFocusDetection, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByTrackIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_detectorDidRun, 0);
  objc_storeStrong((id *)&self->_detections, 0);
}

@end
