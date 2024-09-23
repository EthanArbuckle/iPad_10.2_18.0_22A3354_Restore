@implementation PTCinematographyExistingTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithExistingTrack:", self);
}

- (id)_initWithExistingTrack:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "detectionType");
  v6 = objc_msgSend(v4, "trackIdentifier");
  v7 = objc_msgSend(v4, "groupIdentifier");

  return -[PTCinematographyExistingTrack initWithDetectionType:trackIdentifier:groupIdentifier:](self, "initWithDetectionType:trackIdentifier:groupIdentifier:", v5, v6, v7);
}

- (BOOL)isDiscrete
{
  return 1;
}

- (unint64_t)trackType
{
  return 1;
}

- (PTCinematographyExistingTrack)initWithDetectionType:(unint64_t)a3 trackIdentifier:(int64_t)a4 groupIdentifier:(int64_t)a5
{
  PTCinematographyExistingTrack *v7;
  PTCinematographyExistingTrack *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyExistingTrack;
  v7 = -[PTCinematographyTrack initWithDetectionType:](&v10, sel_initWithDetectionType_, a3);
  v8 = v7;
  if (v7)
  {
    -[PTCinematographyTrack setTrackIdentifier:](v7, "setTrackIdentifier:", a4);
    -[PTCinematographyTrack setGroupIdentifier:](v8, "setGroupIdentifier:", a5);
    -[PTCinematographyTrack setUserCreated:](v8, "setUserCreated:", 0);
  }
  return v8;
}

- (id)detectionInFrame:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "detectionForTrackIdentifier:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)detectionNearestTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int32_t v10;
  uint64_t v11;
  CMTime v13;
  CMTime v14;
  CMTimeRange start;
  CMTime duration;
  CMTimeRange time1;
  CMTime rhs;
  CMTime v19;
  CMTime time2;

  time1.start = (CMTime)*a3;
  -[PTCinematographyExistingTrack detectionAtOrBeforeTime:](self, "detectionAtOrBeforeTime:", &time1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "time");
  else
    memset(&time2, 0, sizeof(time2));
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
  time1.start.epoch = a3->var3;
  if (CMTimeCompare(&time1.start, &time2))
  {
    memset(&v19, 0, sizeof(v19));
    if (v6)
      objc_msgSend(v6, "time");
    else
      memset(&rhs, 0, sizeof(rhs));
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
    time1.start.epoch = a3->var3;
    CMTimeSubtract(&v19, &time1.start, &rhs);
    memset(&time1, 0, sizeof(time1));
    *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0;
    start.start.epoch = a3->var3;
    duration = v19;
    CMTimeRangeMake(&time1, &start.start, &duration);
    start = time1;
    -[PTCinematographyExistingTrack detectionsInTimeRange:](self, "detectionsInTimeRange:", &start);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "time");
      else
        memset(&v13, 0, sizeof(v13));
      *(_OWORD *)&start.start.value = *(_OWORD *)&a3->var0;
      start.start.epoch = a3->var3;
      CMTimeSubtract(&v14, &v13, &start.start);
      start.start = v19;
      v10 = CMTimeCompare(&v14, &start.start);

      if (v10 < 0)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
    }

  }
  return v6;
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  -[PTCinematographyTrack script](self, "script");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier");
  v9 = *a3;
  objc_msgSend(v5, "_detectionWithTrackIdentifier:atOrBeforeTime:", v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)detectionsInTimeRange:(id *)a3
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[3];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PTCinematographyTrack script](self, "script");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)&a3->var0.var3;
  v21[0] = *(_OWORD *)&a3->var0.var0;
  v21[1] = v6;
  v21[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v5, "framesInTimeRange:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[PTCinematographyExistingTrack detectionInFrame:](self, "detectionInFrame:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

@end
