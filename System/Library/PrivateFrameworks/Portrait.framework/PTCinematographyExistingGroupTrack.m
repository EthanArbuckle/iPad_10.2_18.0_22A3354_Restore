@implementation PTCinematographyExistingGroupTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithExistingGroupTrack:", self);
}

- (id)_initWithExistingGroupTrack:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "detectionType");
  v6 = objc_msgSend(v4, "groupIdentifier");

  return -[PTCinematographyExistingGroupTrack initWithDetectionType:groupIdentifier:](self, "initWithDetectionType:groupIdentifier:", v5, v6);
}

- (PTCinematographyExistingGroupTrack)initWithDetectionType:(unint64_t)a3 groupIdentifier:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyExistingGroupTrack;
  return -[PTCinematographyExistingTrack initWithDetectionType:trackIdentifier:groupIdentifier:](&v5, sel_initWithDetectionType_trackIdentifier_groupIdentifier_, a3, -1, a4);
}

- (id)detectionInFrame:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "bestDetectionForGroupIdentifier:", -[PTCinematographyTrack groupIdentifier](self, "groupIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  -[PTCinematographyTrack script](self, "script");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PTCinematographyTrack groupIdentifier](self, "groupIdentifier");
  v9 = *a3;
  objc_msgSend(v5, "_detectionWithGroupIdentifier:atOrBeforeTime:", v6, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)trackDecisionsInTimeRange:(id *)a3
{
  void *v5;
  NSArray *v6;
  NSArray *trackDecisions;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _OWORD v16[3];

  -[PTCinematographyExistingGroupTrack trackDecisions](self, "trackDecisions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PTCinematographyExistingGroupTrack _calculateTrackDecisions](self, "_calculateTrackDecisions");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    trackDecisions = self->_trackDecisions;
    self->_trackDecisions = v6;

  }
  -[PTCinematographyExistingGroupTrack trackDecisions](self, "trackDecisions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a3->var0.var3;
  v16[0] = *(_OWORD *)&a3->var0.var0;
  v16[1] = v9;
  v16[2] = *(_OWORD *)&a3->var1.var1;
  v10 = objc_msgSend(v8, "_indexRangeOfTimeRange:", v16);
  v12 = v11;

  -[PTCinematographyExistingGroupTrack trackDecisions](self, "trackDecisions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subarrayWithRange:", v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_calculateTrackDecisions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  PTCinematographyDecision *v17;
  PTCinematographyDecision *v18;
  void *v19;
  _QWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[3];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[PTCinematographyTrack script](self, "script");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyTrack script](self, "script");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(v26, 0, sizeof(v26));
  objc_msgSend(v4, "framesInTimeRange:", v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        v14 = v11;
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[PTCinematographyExistingGroupTrack detectionInFrame:](self, "detectionInFrame:", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (!v14 || (v16 = objc_msgSend(v14, "trackIdentifier"), v16 != objc_msgSend(v11, "trackIdentifier")))
          {
            v17 = [PTCinematographyDecision alloc];
            if (v15)
              objc_msgSend(v15, "time");
            else
              memset(v21, 0, sizeof(v21));
            v18 = -[PTCinematographyDecision initWithTime:trackIdentifier:options:](v17, "initWithTime:trackIdentifier:options:", v21, objc_msgSend(v11, "trackIdentifier"), 0);
            -[PTCinematographyDecision setGroupIdentifier:](v18, "setGroupIdentifier:", -[PTCinematographyTrack groupIdentifier](self, "groupIdentifier"));
            objc_msgSend(v3, "addObject:", v18);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);

  }
  v19 = (void *)objc_msgSend(v3, "copy");

  return v19;
}

- (NSArray)trackDecisions
{
  return self->_trackDecisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackDecisions, 0);
}

@end
