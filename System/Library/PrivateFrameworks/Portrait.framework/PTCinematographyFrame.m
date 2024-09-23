@implementation PTCinematographyFrame

- (BOOL)isFocusStrong
{
  void *v3;

  -[PTCinematographyFrame userFocusTrackNumber](self, "userFocusTrackNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 && -[PTCinematographyFrame isUserFocusStrong](self, "isUserFocusStrong");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[PTSerialization registerSerializationClass:](PTSerialization, "registerSerializationClass:", a1);
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
  -[PTCinematographyFrame _updateDetectionTimes](self, "_updateDetectionTimes");
}

- (void)setAllDetections:(id)a3
{
  NSArray *v4;
  NSArray *allDetections;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  allDetections = self->_allDetections;
  self->_allDetections = v4;

  -[PTCinematographyFrame _updateDetectionTimes](self, "_updateDetectionTimes");
}

- (NSSet)_detectionTrackNumberSet
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "trackIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v10;
}

- (void)_updateDetectionTimes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        -[PTCinematographyFrame time](self, "time");
        v9 = v11;
        v10 = v12;
        objc_msgSend(v8, "setTime:", &v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (int64_t)focusTrackIdentifier
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  -[PTCinematographyFrame focusTrackNumber](self, "focusTrackNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PTTrackIDFromNumber(v3);

  -[PTCinematographyFrame focusDetection](self, "focusDetection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PTCinematographyFrame focusDetection](self, "focusDetection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "trackIdentifier") != v4)
      -[PTCinematographyFrame focusTrackIdentifier].cold.1();

  }
  return v4;
}

- (int64_t)focusGroupIdentifier
{
  void *v3;
  void *v4;
  int64_t v5;

  -[PTCinematographyFrame focusDetection](self, "focusDetection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PTCinematographyFrame focusDetection](self, "focusDetection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "groupIdentifier");

  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (id)detectionForTrackIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PTCinematographyFrame _detectionsByTrackIdentifier](self, "_detectionsByTrackIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bestDetectionForGroupIdentifier:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "groupIdentifier") == a3
          && (!v7 || PTDetectionTypeIsBetter(objc_msgSend(v10, "detectionType"), objc_msgSend(v7, "detectionType"))))
        {
          v11 = v10;

          v7 = v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isInTransition
{
  float v2;

  -[PTCinematographyFrame transitionCoefficient](self, "transitionCoefficient");
  return v2 > 0.0;
}

- (void)setDetections:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "copy");
  -[PTCinematographyFrame setAllDetections:](self, "setAllDetections:", v4);

}

- (id)detectionForFocusIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PTCinematographyFrame _detectionsByFocusIdentifier](self, "_detectionsByFocusIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PTCinematographyFocusBlend)focusBlend
{
  PTCinematographyFocusBlend *v3;
  void *v4;
  id v5;

  v3 = [PTCinematographyFocusBlend alloc];
  -[PTCinematographyFrame focusDetection](self, "focusDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PTCinematographyFocusBlend initFocusedOnDetection:](v3, "initFocusedOnDetection:", v4);

  return (PTCinematographyFocusBlend *)v5;
}

- (id)detectionForTrack:(id)a3
{
  return -[PTCinematographyFrame detectionForTrackIdentifier:](self, "detectionForTrackIdentifier:", objc_msgSend(a3, "trackIdentifier"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CMTime v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PTCinematographyFrame time](self, "time");
  NSStringFromCMTime(&v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFrame focusDetection](self, "focusDetection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame focusDistance](self, "focusDistance");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame aperture](self, "aperture");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Frame: %@ [%@] (%@, %@)"), v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "debugDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), self, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  PTCinematographyFrame *v4;
  PTCinematographyFrame *v5;
  char v6;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  int64_t v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  CMTime v22;
  CMTime time1;

  v4 = (PTCinematographyFrame *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PTCinematographyFrame time](self, "time");
      if (v5)
        -[PTCinematographyFrame time](v5, "time");
      else
        memset(&v22, 0, sizeof(v22));
      if (!CMTimeCompare(&time1, &v22)
        && (-[PTCinematographyFrame aperture](self, "aperture"),
            v9 = v8,
            -[PTCinematographyFrame aperture](v5, "aperture"),
            v9 == v10)
        && (-[PTCinematographyFrame focusDistance](self, "focusDistance"),
            v12 = v11,
            -[PTCinematographyFrame focusDistance](v5, "focusDistance"),
            v12 == v13)
        && (v14 = -[PTCinematographyFrame focusTrackIdentifier](self, "focusTrackIdentifier"),
            v14 == -[PTCinematographyFrame focusTrackIdentifier](v5, "focusTrackIdentifier")))
      {
        -[PTCinematographyFrame allDetections](self, "allDetections");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTCinematographyFrame allDetections](v5, "allDetections");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqual:", v16)
          && (-[PTCinematographyFrame transitionCoefficient](self, "transitionCoefficient"),
              v18 = v17,
              -[PTCinematographyFrame transitionCoefficient](v5, "transitionCoefficient"),
              v18 == v19))
        {
          -[PTCinematographyFrame focusDetection](self, "focusDetection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PTCinematographyFrame focusDetection](v5, "focusDetection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v20, "isEqual:", v21);

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  double Seconds;
  float v4;
  double v5;
  float v6;
  CMTime time;

  -[PTCinematographyFrame time](self, "time");
  Seconds = CMTimeGetSeconds(&time);
  -[PTCinematographyFrame aperture](self, "aperture");
  v5 = v4 + Seconds * 600.0;
  -[PTCinematographyFrame focusDistance](self, "focusDistance");
  return (unint64_t)(v5 + v6);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PTCinematographyFrame *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = objc_alloc_init(PTCinematographyFrame);
  if (v4)
  {
    -[PTCinematographyFrame time](self, "time");
    v15 = v17;
    v16 = v18;
    -[PTCinematographyFrame setTime:](v4, "setTime:", &v15);
    -[PTCinematographyFrame aperture](self, "aperture");
    -[PTCinematographyFrame setAperture:](v4, "setAperture:");
    -[PTCinematographyFrame focusDistance](self, "focusDistance");
    -[PTCinematographyFrame setFocusDistance:](v4, "setFocusDistance:");
    -[PTCinematographyFrame allDetections](self, "allDetections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[PTCinematographyFrame setAllDetections:](v4, "setAllDetections:", v6);

    -[PTCinematographyFrame focusTrackNumber](self, "focusTrackNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setFocusTrackNumber:](v4, "setFocusTrackNumber:", v7);

    -[PTCinematographyFrame baseFocusTrackNumber](self, "baseFocusTrackNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setBaseFocusTrackNumber:](v4, "setBaseFocusTrackNumber:", v8);

    -[PTCinematographyFrame userFocusTrackNumber](self, "userFocusTrackNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setUserFocusTrackNumber:](v4, "setUserFocusTrackNumber:", v9);

    -[PTCinematographyFrame setUserFocusStrong:](v4, "setUserFocusStrong:", -[PTCinematographyFrame isUserFocusStrong](self, "isUserFocusStrong"));
    -[PTCinematographyFrame setUserFocusGroup:](v4, "setUserFocusGroup:", -[PTCinematographyFrame isUserFocusGroup](self, "isUserFocusGroup"));
    -[PTCinematographyFrame focusDetection](self, "focusDetection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setFocusDetection:](v4, "setFocusDetection:", v10);

    -[PTCinematographyFrame transitionCoefficient](self, "transitionCoefficient");
    -[PTCinematographyFrame setTransitionCoefficient:](v4, "setTransitionCoefficient:");
    -[PTCinematographyFrame transitionElapsedTime](self, "transitionElapsedTime");
    -[PTCinematographyFrame setTransitionElapsedTime:](v4, "setTransitionElapsedTime:");
    -[PTCinematographyFrame transitionDuration](self, "transitionDuration");
    -[PTCinematographyFrame setTransitionDuration:](v4, "setTransitionDuration:");
    -[PTCinematographyFrame _frameNumber](self, "_frameNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame _setFrameNumber:](v4, "_setFrameNumber:", v11);

    -[PTCinematographyFrame _setSnapshotPolicy:](v4, "_setSnapshotPolicy:", -[PTCinematographyFrame _snapshotPolicy](self, "_snapshotPolicy"));
    -[PTCinematographyFrame _snapshot](self, "_snapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    -[PTCinematographyFrame _setSnapshot:](v4, "_setSnapshot:", v13);

  }
  return v4;
}

- (id)detectionAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  unint64_t v17;
  BOOL v18;
  double Area;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    v10 = INFINITY;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "rect");
        v13 = v30.origin.x;
        v14 = v30.origin.y;
        width = v30.size.width;
        height = v30.size.height;
        v29.x = x;
        v29.y = y;
        if (CGRectContainsPoint(v30, v29))
        {
          v17 = objc_msgSend(v12, "detectionType");
          v18 = v17 > 0xB || ((1 << v17) & 0x83E) == 0;
          if (!v18 || v17 == 102)
          {
            Area = CGRectGetArea(v13, v14, width, height);
            if (Area < v10)
            {
              v20 = Area;
              v21 = v12;

              v10 = v20;
              v8 = v21;
            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
    -[PTCinematographyFrame allDetections](self, "allDetections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTCinematographyDetection _detectionsByTrackIdentifierFromArray:](PTCinematographyDetection, "_detectionsByTrackIdentifierFromArray:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedDetectionsByTrackIdentifier;
    self->_cachedDetectionsByTrackIdentifier = v5;

    cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  }
  return cachedDetectionsByTrackIdentifier;
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
    -[PTCinematographyFrame allDetections](self, "allDetections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTCinematographyDetection _detectionsByFocusIdentifierFromArray:](PTCinematographyDetection, "_detectionsByFocusIdentifierFromArray:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedDetectionsByFocusIdentifier;
    self->_cachedDetectionsByFocusIdentifier = v5;

    cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  }
  return cachedDetectionsByFocusIdentifier;
}

- (NSNumber)_frameNumber
{
  return self->_frameNumber;
}

- (void)_setFrameNumber:(id)a3
{
  objc_storeStrong((id *)&self->_frameNumber, a3);
}

- (id)_snapshot
{
  return self->_snapshot;
}

- (void)_setSnapshot:(id)a3
{
  objc_storeStrong(&self->_snapshot, a3);
}

- (unint64_t)_snapshotPolicy
{
  return self->_snapshotPolicy;
}

- (void)_setSnapshotPolicy:(unint64_t)a3
{
  self->_snapshotPolicy = a3;
}

- (NSNumber)_detectorDidRun
{
  return self->_detectorDidRun;
}

- (void)_setDetectorDidRun:(id)a3
{
  objc_storeStrong((id *)&self->_detectorDidRun, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (float)aperture
{
  return self->_aperture;
}

- (void)setAperture:(float)a3
{
  self->_aperture = a3;
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (PTCinematographyDetection)focusDetection
{
  return self->_focusDetection;
}

- (void)setFocusDetection:(id)a3
{
  objc_storeStrong((id *)&self->_focusDetection, a3);
}

- (NSArray)allDetections
{
  return self->_allDetections;
}

- (float)rawFocusDistance
{
  return self->_rawFocusDistance;
}

- (void)setRawFocusDistance:(float)a3
{
  self->_rawFocusDistance = a3;
}

- (NSNumber)focusTrackNumber
{
  return self->_focusTrackNumber;
}

- (void)setFocusTrackNumber:(id)a3
{
  objc_storeStrong((id *)&self->_focusTrackNumber, a3);
}

- (NSNumber)baseFocusTrackNumber
{
  return self->_baseFocusTrackNumber;
}

- (void)setBaseFocusTrackNumber:(id)a3
{
  objc_storeStrong((id *)&self->_baseFocusTrackNumber, a3);
}

- (NSNumber)userFocusTrackNumber
{
  return self->_userFocusTrackNumber;
}

- (void)setUserFocusTrackNumber:(id)a3
{
  objc_storeStrong((id *)&self->_userFocusTrackNumber, a3);
}

- (BOOL)isUserFocusStrong
{
  return self->_userFocusStrong;
}

- (void)setUserFocusStrong:(BOOL)a3
{
  self->_userFocusStrong = a3;
}

- (BOOL)isUserFocusGroup
{
  return self->_userFocusGroup;
}

- (void)setUserFocusGroup:(BOOL)a3
{
  self->_userFocusGroup = a3;
}

- (BOOL)isUserFocusEnd
{
  return self->_userFocusEnd;
}

- (void)setUserFocusEnd:(BOOL)a3
{
  self->_userFocusEnd = a3;
}

- (float)transitionCoefficient
{
  return self->_transitionCoefficient;
}

- (void)setTransitionCoefficient:(float)a3
{
  self->_transitionCoefficient = a3;
}

- (float)transitionElapsedTime
{
  return self->_transitionElapsedTime;
}

- (void)setTransitionElapsedTime:(float)a3
{
  self->_transitionElapsedTime = a3;
}

- (float)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(float)a3
{
  self->_transitionDuration = a3;
}

- (NSDictionary)cachedDetectionsByFocusIdentifier
{
  return self->_cachedDetectionsByFocusIdentifier;
}

- (NSDictionary)cachedDetectionsByTrackIdentifier
{
  return self->_cachedDetectionsByTrackIdentifier;
}

- (void)setFocusBlend:(id)a3
{
  objc_storeStrong((id *)&self->_focusBlend, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusBlend, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByTrackIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedDetectionsByFocusIdentifier, 0);
  objc_storeStrong((id *)&self->_userFocusTrackNumber, 0);
  objc_storeStrong((id *)&self->_baseFocusTrackNumber, 0);
  objc_storeStrong((id *)&self->_focusTrackNumber, 0);
  objc_storeStrong((id *)&self->_allDetections, 0);
  objc_storeStrong((id *)&self->_focusDetection, 0);
  objc_storeStrong((id *)&self->_detectorDidRun, 0);
  objc_storeStrong(&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_frameNumber, 0);
}

- (id)detectionForTrackNumber:(id)a3
{
  if (!a3)
    return 0;
  -[PTCinematographyFrame detectionForTrackIdentifier:](self, "detectionForTrackIdentifier:", objc_msgSend(a3, "integerValue"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addDetection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PTCinematographyFrame allDetections](self, "allDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "addObject:", v4);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[PTCinematographyFrame setAllDetections:](self, "setAllDetections:", v6);

  -[PTCinematographyFrame _flushCachedDetectionsDictionaries](self, "_flushCachedDetectionsDictionaries");
}

- (void)_removeDetection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PTCinematographyFrame allDetections](self, "allDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[PTCinematographyFrame setAllDetections:](self, "setAllDetections:", v6);

  -[PTCinematographyFrame _flushCachedDetectionsDictionaries](self, "_flushCachedDetectionsDictionaries");
}

- (void)_removeDetectionWithTrackIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PTCinematographyFrame detectionForTrackIdentifier:](self, "detectionForTrackIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[PTCinematographyFrame _removeDetection:](self, "_removeDetection:", v4);
    v4 = v5;
  }

}

- (void)_flushCachedDetectionsDictionaries
{
  NSDictionary *cachedDetectionsByFocusIdentifier;
  NSDictionary *cachedDetectionsByTrackIdentifier;

  cachedDetectionsByFocusIdentifier = self->_cachedDetectionsByFocusIdentifier;
  self->_cachedDetectionsByFocusIdentifier = 0;

  cachedDetectionsByTrackIdentifier = self->_cachedDetectionsByTrackIdentifier;
  self->_cachedDetectionsByTrackIdentifier = 0;

}

+ (id)_framesWithCinematographyDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PTCinematographyFrame *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [PTCinematographyFrame alloc];
        v12 = -[PTCinematographyFrame _initWithCinematographyDictionary:](v11, "_initWithCinematographyDictionary:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (id)_focusDetectionFromCoefficientsDictionary:(id)a3 coefficient:(float *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  float v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "focusIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        if (v18 > v12)
        {
          v19 = v14;

          v10 = v19;
          v12 = v18;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v12 = 0.0;
  }

  if (a4)
    *a4 = v12;

  return v10;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFDictionary *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  CMTime v49;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTCinematographyFrame;
  v5 = -[PTCinematographyFrame init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trackers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTCinematographyDetection _detectionsFromCinematographyArray:](PTCinematographyDetection, "_detectionsFromCinematographyArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("focus_track_id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("focus_track_id"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)v5 + 11);
      *((_QWORD *)v5 + 11) = v11;

      objc_msgSend(v5, "detectionForTrackNumber:", *((_QWORD *)v5 + 11));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)*((_QWORD *)v5 + 9);
      *((_QWORD *)v5 + 9) = v13;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transition_coefficient"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      *((_DWORD *)v5 + 6) = v16;
    }
    else
    {
      LODWORD(v49.value) = 0;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coefficients"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_focusDetectionFromCoefficientsDictionary:coefficient:", v15, &v49);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)*((_QWORD *)v5 + 9);
      *((_QWORD *)v5 + 9) = v17;

      objc_msgSend(*((id *)v5 + 9), "trackNumber");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)*((_QWORD *)v5 + 11);
      *((_QWORD *)v5 + 11) = v19;

      *((float *)v5 + 6) = 1.0 - *(float *)&v49.value;
      if (!*((_QWORD *)v5 + 9))
      {
        _PTLogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[PTCinematographyFrame(Private) _initWithCinematographyDictionary:].cold.1((uint64_t)v15, v21, v22);

      }
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transition_elapsed_time"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    *((_DWORD *)v5 + 7) = v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transition_duration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    *((_DWORD *)v5 + 8) = v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("base_track_id"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27)
      v28 = (void *)*((_QWORD *)v5 + 11);
    objc_storeStrong((id *)v5 + 12, v28);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user_track_id"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v29;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user_focus_strong"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5[8] = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user_focus_group"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5[9] = objc_msgSend(v32, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frame"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v33;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ptime"));
    v35 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeFromPTCinematographyDictionary(&v49, v35);
    *(CMTime *)(v5 + 136) = v49;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aperture"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    *((_DWORD *)v5 + 3) = v37;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disparity"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "floatValue");
    *((_DWORD *)v5 + 4) = v39;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_raw_disparity"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v40, "floatValue");
    }
    else
    {
      v42 = (void *)*((_QWORD *)v5 + 9);
      if (v42)
        objc_msgSend(v42, "focusDistance");
      else
        v41 = *((_DWORD *)v5 + 4);
    }
    *((_DWORD *)v5 + 5) = v41;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_snapshot"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_snapshot_policy"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v5 + 7) = objc_msgSend(v45, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detector_did_run"));
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v46;

  }
  return v5;
}

- (id)_initWithCinematographyDictionary:(id)a3 time:(id *)a4
{
  id v5;
  void *v6;
  __int128 v8;
  int64_t var3;

  v5 = -[PTCinematographyFrame _initWithCinematographyDictionary:](self, "_initWithCinematographyDictionary:", a3);
  v6 = v5;
  if (v5)
  {
    v8 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v5, "setTime:", &v8);
  }
  return v6;
}

- (id)_asCinematographyDictionary
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BYTE v37[24];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v9, "focusIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_asCinematographyDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_opt_new();
  -[PTCinematographyFrame baseFocusTrackNumber](self, "baseFocusTrackNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("base_track_id"));

  -[PTCinematographyFrame userFocusTrackNumber](self, "userFocusTrackNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("user_track_id"));

  if (-[PTCinematographyFrame isUserFocusStrong](self, "isUserFocusStrong"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PTCinematographyFrame isUserFocusStrong](self, "isUserFocusStrong"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("user_focus_strong"));

  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("user_focus_strong"));
  }
  if (-[PTCinematographyFrame isUserFocusGroup](self, "isUserFocusGroup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PTCinematographyFrame isUserFocusGroup](self, "isUserFocusGroup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("user_focus_group"));

  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("user_focus_group"));
  }
  -[PTCinematographyFrame _frameNumber](self, "_frameNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("frame"));

  -[PTCinematographyFrame time](self, "time");
  PTCinematographyDictionaryFromCMTime((uint64_t)v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("ptime"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame aperture](self, "aperture");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("aperture"));

  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame focusDistance](self, "focusDistance");
  objc_msgSend(v21, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("disparity"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame rawFocusDistance](self, "rawFocusDistance");
  objc_msgSend(v23, "numberWithFloat:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("_raw_disparity"));

  v25 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, CFSTR("trackers"));

  -[PTCinematographyFrame _snapshot](self, "_snapshot");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("_snapshot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PTCinematographyFrame _snapshotPolicy](self, "_snapshotPolicy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("_snapshot_policy"));

  -[PTCinematographyFrame _detectorDidRun](self, "_detectorDidRun");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, CFSTR("detector_did_run"));

  -[PTCinematographyFrame focusTrackNumber](self, "focusTrackNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v29, CFSTR("focus_track_id"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame transitionCoefficient](self, "transitionCoefficient");
  objc_msgSend(v30, "numberWithFloat:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, CFSTR("transition_coefficient"));

  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame transitionElapsedTime](self, "transitionElapsedTime");
  objc_msgSend(v32, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, CFSTR("transition_elapsed_time"));

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[PTCinematographyFrame transitionDuration](self, "transitionDuration");
  objc_msgSend(v34, "numberWithFloat:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v35, CFSTR("transition_duration"));

  return v12;
}

- (void)_restoreOriginal
{
  float v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PTCinematographyFrame rawFocusDistance](self, "rawFocusDistance");
  if (v3 > 0.0)
  {
    -[PTCinematographyFrame rawFocusDistance](self, "rawFocusDistance");
    -[PTCinematographyFrame setFocusDistance:](self, "setFocusDistance:");
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PTCinematographyFrame allDetections](self, "allDetections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_restoreOriginal");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (void)_debugLogFrames:(id)a3 label:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_debugLogFrame:label:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

+ (void)_debugLogFrame:(id)a3 label:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  int v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "focusDetection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "focusTrackNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusDetection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  _PTLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "_frameNumber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "focusDistance");
    objc_msgSend(v20, "numberWithFloat:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "aperture");
    objc_msgSend(v22, "numberWithFloat:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userFocusTrackNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = &stru_1E822B200;
    if (v24)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "userFocusTrackNumber");
      v33 = v23;
      v26 = v21;
      v27 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isUserFocusGroup"))
        v28 = CFSTR("g");
      else
        v28 = &stru_1E822B200;
      v29 = objc_msgSend(v5, "isUserFocusStrong");
      v30 = CFSTR("+");
      if (!v29)
        v30 = &stru_1E822B200;
      v34 = (void *)v27;
      v31 = v27;
      v21 = v26;
      v23 = v33;
      objc_msgSend(v32, "stringWithFormat:", CFSTR("; userFocusTrackNumber: %@ %@%@"), v31, v28, v30);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138414850;
    v37 = v6;
    v38 = 2112;
    v39 = v35;
    v40 = 2112;
    v41 = v8;
    v42 = 2112;
    v43 = v9;
    v44 = 2112;
    v45 = v21;
    v46 = 2112;
    v47 = v23;
    v48 = 2112;
    v49 = v25;
    v50 = 2048;
    v51 = v12;
    v52 = 2048;
    v53 = v14;
    v54 = 2048;
    v55 = v16;
    v56 = 2048;
    v57 = v18;
    _os_log_debug_impl(&dword_1C9281000, v19, OS_LOG_TYPE_DEBUG, "%@ Frame %@: focus %@ (%@), disparity %@, aperture %@%@ rect { %.3f, %.3f, %.3f, %.3f }", buf, 0x70u);
    if (v24)
    {

    }
  }

}

- (void)focusOnNothing
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  double v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  _PTLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[PTCinematographyFrame(Private) focusOnNothing].cold.2(v3);

  _PTLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PTCinematographyFrame(Private) focusOnNothing].cold.1(v7);

  }
  LODWORD(v6) = 0;
  -[PTCinematographyFrame setRawFocusDistance:](self, "setRawFocusDistance:", v6);
  LODWORD(v8) = 0;
  -[PTCinematographyFrame setFocusDistance:](self, "setFocusDistance:", v8);
  -[PTCinematographyFrame setFocusDetection:](self, "setFocusDetection:", 0);
  -[PTCinematographyFrame setFocusTrackNumber:](self, "setFocusTrackNumber:", 0);
  LODWORD(v9) = 0;
  -[PTCinematographyFrame setTransitionCoefficient:](self, "setTransitionCoefficient:", v9);
  LODWORD(v10) = 0;
  -[PTCinematographyFrame setTransitionElapsedTime:](self, "setTransitionElapsedTime:", v10);
  LODWORD(v11) = 0;
  -[PTCinematographyFrame setTransitionDuration:](self, "setTransitionDuration:", v11);
}

- (void)focusOnDetection:(id)a3
{
  if (a3)
    -[PTCinematographyFrame focusOnDetection:focusPuller:](self, "focusOnDetection:focusPuller:", a3, 0);
  else
    -[PTCinematographyFrame focusOnNothing](self, "focusOnNothing");
}

- (void)focusOnDetection:(id)a3 focusPuller:(id)a4
{
  id v6;
  id v7;
  double v8;
  int v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  _BYTE v17[24];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "focusDistance");
  v9 = LODWORD(v8);
  v10 = LODWORD(v8);
  if (v6)
  {
    -[PTCinematographyFrame time](self, "time");
    LODWORD(v11) = v9;
    objc_msgSend(v6, "pullTowardFocusDistance:time:", v17, v11);
    v10 = LODWORD(v8);
  }
  LODWORD(v8) = v9;
  -[PTCinematographyFrame setRawFocusDistance:](self, "setRawFocusDistance:", v8);
  LODWORD(v12) = v10;
  -[PTCinematographyFrame setFocusDistance:](self, "setFocusDistance:", v12);
  -[PTCinematographyFrame setFocusDetection:](self, "setFocusDetection:", v7);
  objc_msgSend(v7, "trackNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PTCinematographyFrame setFocusTrackNumber:](self, "setFocusTrackNumber:", v13);
  LODWORD(v14) = 0;
  -[PTCinematographyFrame setTransitionCoefficient:](self, "setTransitionCoefficient:", v14);
  LODWORD(v15) = 0;
  -[PTCinematographyFrame setTransitionElapsedTime:](self, "setTransitionElapsedTime:", v15);
  LODWORD(v16) = 0;
  -[PTCinematographyFrame setTransitionDuration:](self, "setTransitionDuration:", v16);

}

- (void)_focusFromDetection:(id)a3 toDetection:(id)a4 rawFocusDistance:(float)a5 focusDistance:(float)a6 transitionCoefficient:(float)a7 elapsedTime:(float)a8 duration:(float)a9
{
  id v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;

  v15 = a3;
  *(float *)&v16 = a5;
  -[PTCinematographyFrame setRawFocusDistance:](self, "setRawFocusDistance:", v16);
  *(float *)&v17 = a6;
  -[PTCinematographyFrame setFocusDistance:](self, "setFocusDistance:", v17);
  -[PTCinematographyFrame setFocusDetection:](self, "setFocusDetection:", v15);
  objc_msgSend(v15, "trackNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PTCinematographyFrame setFocusTrackNumber:](self, "setFocusTrackNumber:", v18);
  *(float *)&v19 = a7;
  -[PTCinematographyFrame setTransitionCoefficient:](self, "setTransitionCoefficient:", v19);
  *(float *)&v20 = a8;
  -[PTCinematographyFrame setTransitionElapsedTime:](self, "setTransitionElapsedTime:", v20);
  *(float *)&v21 = a9;
  -[PTCinematographyFrame setTransitionDuration:](self, "setTransitionDuration:", v21);
}

+ (void)registerForSerialization
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PTCinematographyFrame_Serialization__registerForSerialization__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerForSerialization_onceToken_0 != -1)
    dispatch_once(&registerForSerialization_onceToken_0, block);
}

BOOL __64__PTCinematographyFrame_Serialization__registerForSerialization__block_invoke(uint64_t a1)
{
  +[PTSerialization registerType:providerClass:](PTSerialization, "registerType:providerClass:", 1718775141, *(_QWORD *)(a1 + 32));
  return +[PTSerialization registerSerializationClass:](PTSerialization, "registerSerializationClass:", objc_opt_class());
}

- (id)_initWithFrameHeaderData_0:(FrameHeaderData_0 *)a3
{
  PTCinematographyFrame *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PTCinematographyFrame;
  v4 = -[PTCinematographyFrame init](&v17, sel_init);
  if (v4)
  {
    NSNumberFromPTTrackID(bswap64(a3->var0));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setFocusTrackNumber:](v4, "setFocusTrackNumber:", v5);

    NSNumberFromPTTrackID(bswap64(a3->var1));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setBaseFocusTrackNumber:](v4, "setBaseFocusTrackNumber:", v6);

    NSNumberFromPTTrackID(bswap64(a3->var2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyFrame setUserFocusTrackNumber:](v4, "setUserFocusTrackNumber:", v7);

    *(float *)&v8 = _PTSwapBigGetFloat((unsigned int *)&a3->var3);
    -[PTCinematographyFrame setAperture:](v4, "setAperture:", v8);
    *(float *)&v9 = _PTSwapBigGetFloat((unsigned int *)&a3->var4);
    -[PTCinematographyFrame setFocusDistance:](v4, "setFocusDistance:", v9);
    *(float *)&v10 = _PTSwapBigGetFloat((unsigned int *)&a3->var5);
    -[PTCinematographyFrame setRawFocusDistance:](v4, "setRawFocusDistance:", v10);
    *(float *)&v11 = _PTSwapBigGetFloat((unsigned int *)&a3->var6);
    -[PTCinematographyFrame setTransitionCoefficient:](v4, "setTransitionCoefficient:", v11);
    *(float *)&v12 = _PTSwapBigGetFloat((unsigned int *)&a3->var7);
    -[PTCinematographyFrame setTransitionElapsedTime:](v4, "setTransitionElapsedTime:", v12);
    *(float *)&v13 = _PTSwapBigGetFloat((unsigned int *)&a3->var8);
    -[PTCinematographyFrame setTransitionDuration:](v4, "setTransitionDuration:", v13);
    v14 = bswap32(a3->var9);
    if ((v14 & 2) != 0)
    {
      -[PTCinematographyFrame _setDetectorDidRun:](v4, "_setDetectorDidRun:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14 & 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTCinematographyFrame _setDetectorDidRun:](v4, "_setDetectorDidRun:", v15);

    }
    -[PTCinematographyFrame setUserFocusStrong:](v4, "setUserFocusStrong:", (v14 >> 2) & 1);
    -[PTCinematographyFrame setUserFocusGroup:](v4, "setUserFocusGroup:", (v14 >> 3) & 1);
    -[PTCinematographyFrame setUserFocusEnd:](v4, "setUserFocusEnd:", (v14 >> 4) & 1);
  }
  return v4;
}

- (BOOL)_copyToFrameHeaderData_0:(FrameHeaderData_0 *)a3
{
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  int v19;

  a3->var0 = bswap64(-[PTCinematographyFrame focusTrackIdentifier](self, "focusTrackIdentifier"));
  -[PTCinematographyFrame baseFocusTrackNumber](self, "baseFocusTrackNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var1 = bswap64(PTTrackIDFromNumber(v5));

  -[PTCinematographyFrame userFocusTrackNumber](self, "userFocusTrackNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a3->var2 = bswap64(PTTrackIDFromNumber(v6));

  -[PTCinematographyFrame aperture](self, "aperture");
  _PTSwapBigAssignFloat(&a3->var3, v7);
  -[PTCinematographyFrame focusDistance](self, "focusDistance");
  _PTSwapBigAssignFloat(&a3->var4, v8);
  -[PTCinematographyFrame rawFocusDistance](self, "rawFocusDistance");
  _PTSwapBigAssignFloat(&a3->var5, v9);
  -[PTCinematographyFrame transitionCoefficient](self, "transitionCoefficient");
  _PTSwapBigAssignFloat(&a3->var6, v10);
  -[PTCinematographyFrame transitionElapsedTime](self, "transitionElapsedTime");
  _PTSwapBigAssignFloat(&a3->var7, v11);
  -[PTCinematographyFrame transitionDuration](self, "transitionDuration");
  _PTSwapBigAssignFloat(&a3->var8, v12);
  -[PTCinematographyFrame _detectorDidRun](self, "_detectorDidRun");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  -[PTCinematographyFrame _detectorDidRun](self, "_detectorDidRun");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (-[PTCinematographyFrame isUserFocusStrong](self, "isUserFocusStrong"))
    v17 = 4;
  else
    v17 = 0;
  if (-[PTCinematographyFrame isUserFocusGroup](self, "isUserFocusGroup"))
    v18 = 8;
  else
    v18 = 0;
  if (-[PTCinematographyFrame isUserFocusEnd](self, "isUserFocusEnd"))
    v19 = 16;
  else
    v19 = 0;
  a3->var9 = (v16 | (2 * v14) | v17 | v18 | v19) << 24;
  return 1;
}

- (BOOL)supportsVersion:(unint64_t)a3
{
  return a3 == 0;
}

- (unint64_t)sizeOfSerializedObjectWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[PTCinematographyFrame allDetections](self, "allDetections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PTCinematographyFrame allDetections](self, "allDetections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PTCinematographyDetection sizeOfSerializedArray:options:](PTCinematographyDetection, "sizeOfSerializedArray:options:", v6, v4)+ 76;

  }
  else
  {
    v7 = 76;
  }

  return v7;
}

- (BOOL)writeToAtomWriter:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PTAtomWriter *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "beginAtomOfType:", 1718775141);
  objc_msgSend(v6, "appendVersion:flags:", 0, 0);
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v9 = -[PTAtomWriter initWithParent:]([PTAtomWriter alloc], "initWithParent:", v6);
    if (!-[PTCinematographyFrame _writeHeaderToAtomWriter:options:](self, "_writeHeaderToAtomWriter:options:", v9, v7)
      || (-[PTCinematographyFrame allDetections](self, "allDetections"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v10)
      && (-[PTCinematographyFrame allDetections](self, "allDetections"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = +[PTCinematographyDetection writeArray:toAtomWriter:options:](PTCinematographyDetection, "writeArray:toAtomWriter:options:", v11, v9, v7), v11, !v12))
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "endAtom");
  }
  objc_msgSend(v6, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

LABEL_7:
  return v14;
}

- (BOOL)_writeHeaderToAtomWriter:(id)a3 options:(id)a4
{
  id v5;
  _BOOL4 v6;
  BOOL v7;
  void *v8;
  _OWORD v10[3];
  int v11;

  v5 = a3;
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  v6 = -[PTCinematographyFrame _copyToFrameHeaderData_0:](self, "_copyToFrameHeaderData_0:", v10);
  v7 = 0;
  if (v6)
  {
    objc_msgSend(v5, "beginAtomOfType:", 1718775144);
    objc_msgSend(v5, "appendVersion:flags:", 0, 0);
    objc_msgSend(v5, "appendBytes:size:", v10, 52);
    objc_msgSend(v5, "endAtom");
    objc_msgSend(v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 == 0;

  }
  return v7;
}

+ (id)objectFromAtomStream:(id)a3
{
  id v4;
  PTAtomStream *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "atomType") != 1718775141
    || (objc_msgSend(v4, "readCurrentAtomVersionAndFlags"), objc_msgSend(v4, "atomVersion")))
  {
    v6 = 0;
    v5 = 0;
  }
  else
  {
    v5 = -[PTAtomStream initWithParent:]([PTAtomStream alloc], "initWithParent:", v4);
    objc_msgSend(a1, "_frameFromInnerAtomStream:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detectionForTrackIdentifier:", objc_msgSend(v6, "focusTrackIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFocusDetection:", v7);

  }
  return v6;
}

+ (id)_frameFromInnerAtomStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = 0;
  v6 = 0;
  while (objc_msgSend(v4, "hasAtom"))
  {
    if (objc_msgSend(v4, "atomType") == 1718775144)
    {
      objc_msgSend(a1, "_frameHeaderFromAtomStream:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v5;
      v5 = (void *)v7;
    }
    else
    {
      if (objc_msgSend(v4, "atomType") != 1685349235)
        goto LABEL_8;
      +[PTCinematographyDetection objectsFromAtomStream:](PTCinematographyDetection, "objectsFromAtomStream:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v6 = (void *)v9;
    }

LABEL_8:
    objc_msgSend(v4, "advanceToNextAtom");
    if (v5 && v6)
      break;
  }
  objc_msgSend(v5, "setAllDetections:", v6);

  return v5;
}

+ (id)_frameHeaderFromAtomStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _OWORD v8[3];
  int v9;

  v4 = a3;
  if (objc_msgSend(v4, "atomType") != 1718775144
    || (objc_msgSend(v4, "readCurrentAtomVersionAndFlags"), objc_msgSend(v4, "atomVersion"))
    || (v9 = 0,
        memset(v8, 0, sizeof(v8)),
        objc_msgSend(v4, "readCurrentAtomDataBytes:size:offset:", v8, 52, 0),
        objc_msgSend(v4, "error"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFrameHeaderData_0:", v8);
  }

  return v6;
}

- (void)focusTrackIdentifier
{
  __assert_rtn("-[PTCinematographyFrame focusTrackIdentifier]", "PTCinematographyFrame.m", 113, "self.focusDetection.trackIdentifier == result");
}

@end
