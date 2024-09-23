@implementation PTCinematographyFixedFocusTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFixedFocusTrack:", self);
}

- (id)_initWithFixedFocusTrack:(id)a3
{
  id v4;
  PTCinematographyFixedFocusTrack *v5;
  void *v6;
  uint64_t v7;
  PTCinematographyDetection *detection;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyFixedFocusTrack;
  v5 = -[PTCinematographyTrack initWithDetectionType:](&v10, sel_initWithDetectionType_, objc_msgSend(v4, "detectionType"));
  if (v5)
  {
    objc_msgSend(v4, "detection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    detection = v5->_detection;
    v5->_detection = (PTCinematographyDetection *)v7;

  }
  return v5;
}

- (BOOL)isDiscrete
{
  return 0;
}

- (unint64_t)detectionType
{
  return 101;
}

- (PTCinematographyFixedFocusTrack)initWithDetection:(id)a3
{
  id v4;
  PTCinematographyFixedFocusTrack *v5;
  uint64_t v6;
  PTCinematographyDetection *detection;

  v4 = a3;
  v5 = -[PTCinematographyTrack initWithDetectionType:](self, "initWithDetectionType:", objc_msgSend(v4, "detectionType"));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    detection = v5->_detection;
    v5->_detection = (PTCinematographyDetection *)v6;

  }
  return v5;
}

- (PTCinematographyFixedFocusTrack)initWithFocusDistance:(float)a3
{
  PTCinematographyDetection *v5;
  double v6;
  PTCinematographyDetection *v7;
  PTCinematographyFixedFocusTrack *v8;
  __int128 v10;
  uint64_t v11;

  v5 = [PTCinematographyDetection alloc];
  v10 = *MEMORY[0x1E0CA2E10];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  *(float *)&v6 = a3;
  v7 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v5, "initWithTime:rect:focusDistance:", &v10, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v6);
  v8 = -[PTCinematographyFixedFocusTrack initWithDetection:](self, "initWithDetection:", v7);

  return v8;
}

- (float)focusDistance
{
  float result;

  -[PTCinematographyDetection focusDistance](self->_detection, "focusDistance");
  return result;
}

- (id)_fixedFocusDetectionAtTime:(id *)a3
{
  void *v5;
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  -[PTCinematographyFixedFocusTrack detection](self, "detection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  objc_msgSend(v5, "_detectionByChangingTime:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDetectionType:", 101);
  objc_msgSend(v6, "setTrackIdentifier:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));
  return v6;
}

- (id)detectionNearestTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[PTCinematographyFixedFocusTrack _fixedFocusDetectionAtTime:](self, "_fixedFocusDetectionAtTime:", &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[PTCinematographyFixedFocusTrack _fixedFocusDetectionAtTime:](self, "_fixedFocusDetectionAtTime:", &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)detectionsInTimeRange:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  _PTLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[PTCinematographyFixedFocusTrack detectionsInTimeRange:].cold.1((uint64_t)self, v4);

  v8 = *MEMORY[0x1E0CA2E10];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  -[PTCinematographyFixedFocusTrack _fixedFocusDetectionAtTime:](self, "_fixedFocusDetectionAtTime:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)detectionInFrame:(id)a3
{
  _QWORD v5[3];

  if (a3)
    objc_msgSend(a3, "time");
  else
    memset(v5, 0, sizeof(v5));
  -[PTCinematographyFixedFocusTrack _fixedFocusDetectionAtTime:](self, "_fixedFocusDetectionAtTime:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_calculateTimeRanges
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v8[3];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3B18];
  -[PTCinematographyTrack script](self, "script");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRange");
  else
    memset(v8, 0, sizeof(v8));
  objc_msgSend(v2, "valueWithCMTimeRange:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)trackType
{
  return 3;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyFixedFocusTrack;
  -[PTCinematographyTrack _asMutableCinematographyDictionary](&v9, sel__asMutableCinematographyDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyFixedFocusTrack detection](self, "detection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_asCinematographyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("detections"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  void *v5;
  PTCinematographyDetection *v6;
  void *v7;
  id v8;
  id *v9;
  id *v10;
  PTCinematographyFixedFocusTrack *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = [PTCinematographyDetection alloc];
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PTCinematographyDetection _initWithCinematographyDictionary:](v6, "_initWithCinematographyDictionary:", v7);

    v13.receiver = self;
    v13.super_class = (Class)PTCinematographyFixedFocusTrack;
    v9 = -[PTCinematographyTrack _initWithCinematographyDictionary:](&v13, sel__initWithCinematographyDictionary_, v4);
    v10 = v9;
    if (v9)
      objc_storeStrong(v9 + 8, v8);
    self = v10;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PTCinematographyDetection)detection
{
  return self->_detection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detection, 0);
}

- (void)detectionsInTimeRange:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "attempt to get detections in time range for continuous track %@", (uint8_t *)&v2, 0xCu);
}

@end
