@implementation PTCinematographyCustomTrack

- (BOOL)isUserCreated
{
  return 1;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCustomTrack:", self);
}

- (id)_initWithCustomTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PTCinematographyCustomTrack *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "detections", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "copy");
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[PTCinematographyCustomTrack initWithDetections:](self, "initWithDetections:", v5);
  return v12;
}

- (PTCinematographyCustomTrack)initWithDetections:(id)a3
{
  id v4;
  PTCinematographyCustomTrack *v5;
  uint64_t v6;
  NSArray *detections;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyCustomTrack;
  v5 = -[PTCinematographyTrack init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    detections = v5->_detections;
    v5->_detections = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)allDetections
{
  return self->_detections;
}

- (void)applyDetectionSmoothing
{
  PTCinematographyFocusSmoother *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PTCinematographyFocusSmoother);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PTCinematographyCustomTrack allDetections](self, "allDetections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "focusDistance");
        -[PTCinematographyFocusSmoother addSample:](v3, "addSample:");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  -[PTCinematographyFocusSmoother endSamples](v3, "endSamples");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PTCinematographyCustomTrack allDetections](self, "allDetections", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        -[PTCinematographyFocusSmoother nextSmoothedSample](v3, "nextSmoothedSample");
        objc_msgSend(v14, "setFocusDistance:");
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int32_t v11;
  void *v12;
  void *v13;
  CMTime time2;
  CMTime time1;

  -[PTCinematographyCustomTrack detections](self, "detections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  time1 = *(CMTime *)a3;
  v6 = objc_msgSend(v5, "_firstIndexAtOrAfterTime:", &time1);

  -[PTCinematographyCustomTrack detections](self, "detections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v7, "count"))
  {

  }
  else
  {
    -[PTCinematographyCustomTrack detections](self, "detections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "time");
    else
      memset(&time2, 0, sizeof(time2));
    time1 = (CMTime)*a3;
    v11 = CMTimeCompare(&time1, &time2);

    if ((v11 & 0x80000000) == 0)
      goto LABEL_9;
  }
  if (v6)
  {
    --v6;
LABEL_9:
    -[PTCinematographyCustomTrack detections](self, "detections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  return 0;
}

- (id)detectionNearestTime:(id *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  -[PTCinematographyCustomTrack detections](self, "detections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *a3;
  v6 = objc_msgSend(v5, "_indexNearestTime:", &v12);

  -[PTCinematographyCustomTrack detections](self, "detections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
    return 0;
  -[PTCinematographyCustomTrack detections](self, "detections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)detectionsInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _OWORD v13[3];

  -[PTCinematographyCustomTrack detections](self, "detections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v6;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v7 = objc_msgSend(v5, "_indexRangeOfTimeRange:", v13);
  v9 = v8;

  if (!v9)
    return MEMORY[0x1E0C9AA60];
  -[PTCinematographyCustomTrack detections](self, "detections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subarrayWithRange:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)detectionInFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CMTime time2;
  CMTime time1;
  _QWORD v11[3];

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "time");
  else
    memset(v11, 0, sizeof(v11));
  -[PTCinematographyCustomTrack detectionNearestTime:](self, "detectionNearestTime:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "time");
    if (v5)
      objc_msgSend(v5, "time");
    else
      memset(&time2, 0, sizeof(time2));
    if (CMTimeCompare(&time1, &time2))
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)_trackByTrimmingToTimeRange:(id *)a3 subtracting:(id *)a4
{
  __int128 v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PTCinematographyCustomTrack *v14;
  CMTime lhs;
  CMTime time2;
  _BYTE time1[32];
  __int128 v19;

  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)time1 = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time1[16] = v6;
  v19 = *(_OWORD *)&a3->var1.var1;
  -[PTCinematographyCustomTrack detectionsInTimeRange:](self, "detectionsInTimeRange:", time1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if ((a4->var2 & 0x1D) == 1)
  {
    *(_OWORD *)time1 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&time1[16] = a4->var3;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare((CMTime *)time1, &time2))
    {
      if (objc_msgSend(v8, "count"))
      {
        v9 = 0;
        do
        {
          memset(time1, 0, 24);
          objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
            objc_msgSend(v10, "time");
          else
            memset(&lhs, 0, sizeof(lhs));
          time2 = (CMTime)*a4;
          CMTimeSubtract((CMTime *)time1, &lhs, &time2);

          objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          time2 = *(CMTime *)time1;
          objc_msgSend(v12, "_detectionByChangingTime:", &time2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:atIndexedSubscript:", v13, v9);

          ++v9;
        }
        while (v9 < objc_msgSend(v8, "count"));
      }
    }
  }
  v14 = -[PTCinematographyCustomTrack initWithDetections:]([PTCinematographyCustomTrack alloc], "initWithDetections:", v8);
  -[PTCinematographyTrack setTrackIdentifier:](v14, "setTrackIdentifier:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));
  -[PTCinematographyTrack setGroupIdentifier:](v14, "setGroupIdentifier:", -[PTCinematographyTrack groupIdentifier](self, "groupIdentifier"));

  return v14;
}

- (unint64_t)trackType
{
  return 2;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PTCinematographyCustomTrack;
  -[PTCinematographyTrack _asMutableCinematographyDictionary](&v8, sel__asMutableCinematographyDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyCustomTrack allDetections](self, "allDetections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTCinematographyDetection _cinematographyArrayFromDetections:](PTCinematographyDetection, "_cinematographyArrayFromDetections:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("detections"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyCustomTrack;
  v5 = -[PTCinematographyTrack _initWithCinematographyDictionary:](&v10, sel__initWithCinematographyDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detections"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTCinematographyDetection _detectionsFromCinematographyArray:](PTCinematographyDetection, "_detectionsFromCinematographyArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v5[8];
    v5[8] = v7;

  }
  return v5;
}

- (NSArray)detections
{
  return self->_detections;
}

- (void)setDetections:(id)a3
{
  objc_storeStrong((id *)&self->_detections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detections, 0);
}

@end
