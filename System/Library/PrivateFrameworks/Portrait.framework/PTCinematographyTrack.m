@implementation PTCinematographyTrack

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithTrack:", self);
}

- (id)_initWithTrack:(id)a3
{
  id v4;
  PTCinematographyTrack *v5;
  void *v6;
  uint64_t v7;
  NSArray *timeRanges;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PTCinematographyTrack;
  v5 = -[PTCinematographyTrack init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "script");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_script, v6);

    objc_msgSend(v4, "timeRanges");
    v7 = objc_claimAutoreleasedReturnValue();
    timeRanges = v5->_timeRanges;
    v5->_timeRanges = (NSArray *)v7;

    v5->_detectionType = objc_msgSend(v4, "detectionType");
    v5->_trackIdentifier = objc_msgSend(v4, "trackIdentifier");
    v5->_groupIdentifier = objc_msgSend(v4, "groupIdentifier");
    v5->_userCreated = objc_msgSend(v4, "isUserCreated");
  }

  return v5;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (PTCinematographyTrack)init
{
  return -[PTCinematographyTrack initWithDetectionType:](self, "initWithDetectionType:", 0);
}

- (PTCinematographyTrack)initWithDetectionType:(unint64_t)a3
{
  PTCinematographyTrack *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTCinematographyTrack;
  result = -[PTCinematographyTrack init](&v5, sel_init);
  if (result)
  {
    result->_trackIdentifier = -1;
    result->_groupIdentifier = -1;
    result->_detectionType = a3;
    result->_userCreated = 1;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeRangeEndForTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v6;
  CMTimeRange v7[2];

  memset(&v7[1], 0, sizeof(CMTimeRange));
  v7[0].start = (CMTime)*a4;
  result = -[PTCinematographyTrack timeRangeForTime:](self, "timeRangeForTime:", v7);
  if ((v7[1].start.flags & 1) == 0
    || (v7[1].duration.flags & 1) == 0
    || v7[1].duration.epoch
    || v7[1].duration.value < 0)
  {
    v6 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v6 + 16);
  }
  else
  {
    v7[0] = v7[1];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeRangeGetEnd((CMTime *)retstr, v7);
  }
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeForTime:(SEL)a3
{
  uint64_t v7;
  __int128 v8;
  $69C59A32909E13F94AB58097350E6BB9 *result;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  CMTime time;
  CMTimeRange range;
  CMTimeRange v18;

  v7 = MEMORY[0x1E0CA2E40];
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v15 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v7 + 32);
  result = -[PTCinematographyTrack timeRangeCount](self, "timeRangeCount");
  v10 = (char *)&result[-1].var1.var3 + 7;
  if ((uint64_t)&result[-1].var1.var3 + 7 >= 0)
  {
    v11 = 0;
    while (1)
    {
      v12 = (uint64_t)&v10[v11];
      memset(&v18.start.epoch, 0, 32);
      if ((uint64_t)&v10[v11] < 0 != __OFADD__(v10, v11))
        ++v12;
      v13 = v12 >> 1;
      *(_OWORD *)&v18.start.value = 0uLL;
      -[PTCinematographyTrack timeRangeAtIndex:](self, "timeRangeAtIndex:", v12 >> 1);
      range = v18;
      time = (CMTime)*a4;
      result = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeContainsTime(&range, &time);
      if ((_DWORD)result)
        break;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0;
      range.start.epoch = a4->var3;
      *(_OWORD *)&time.value = v15;
      time.epoch = *(_QWORD *)(v7 + 16);
      result = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeCompare(&range.start, &time);
      if ((int)result < 0)
        v10 = (char *)(v13 - 1);
      else
        v11 = v13 + 1;
      if (v11 > (uint64_t)v10)
        return result;
    }
    v14 = *(_OWORD *)&v18.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v18.start.value;
    *(_OWORD *)&retstr->var0.var3 = v14;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v18.duration.timescale;
  }
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRange
{
  $69C59A32909E13F94AB58097350E6BB9 *result;
  uint64_t v6;
  __int128 v7;
  CMTime v8;
  CMTime start;
  CMTimeRange range;
  CMTime v11;
  CMTime v12;
  CMTime v13;

  result = -[PTCinematographyTrack timeRangeCount](self, "timeRangeCount");
  if (result)
  {
    -[PTCinematographyTrack timeRangeAtIndex:](self, "timeRangeAtIndex:", 0);
    v13 = v12;
    memset(&v11, 0, sizeof(v11));
    -[PTCinematographyTrack timeRangeAtIndex:](self, "timeRangeAtIndex:", -[PTCinematographyTrack timeRangeCount](self, "timeRangeCount") - 1);
    CMTimeRangeGetEnd(&v11, &range);
    start = v13;
    v8 = v11;
    return ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v8);
  }
  else
  {
    v6 = MEMORY[0x1E0CA2E50];
    v7 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&retstr->var0.var3 = v7;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v6 + 32);
  }
  return result;
}

- (unint64_t)timeRangeCount
{
  void *v3;
  NSArray *v4;
  NSArray *timeRanges;
  void *v6;
  unint64_t v7;

  -[PTCinematographyTrack timeRanges](self, "timeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PTCinematographyTrack _calculateTimeRanges](self, "_calculateTimeRanges");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    timeRanges = self->_timeRanges;
    self->_timeRanges = v4;

  }
  -[PTCinematographyTrack timeRanges](self, "timeRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeAtIndex:(SEL)a3
{
  void *v7;
  NSArray *v8;
  NSArray *timeRanges;
  void *v10;
  void *v11;
  $69C59A32909E13F94AB58097350E6BB9 *result;
  id v13;

  -[PTCinematographyTrack timeRanges](self, "timeRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PTCinematographyTrack _calculateTimeRanges](self, "_calculateTimeRanges");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    timeRanges = self->_timeRanges;
    self->_timeRanges = v8;

  }
  -[PTCinematographyTrack timeRanges](self, "timeRanges");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "CMTimeRangeValue");
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (id)detectionNearestTime:(id *)a3
{
  return 0;
}

- (id)detectionAtOrBeforeTime:(id *)a3
{
  return 0;
}

- (id)detectionsInTimeRange:(id *)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setTrackIdentifier:(int64_t)a3
{
  self->_trackIdentifier = a3;
}

- (void)setGroupIdentifier:(int64_t)a3
{
  self->_groupIdentifier = a3;
}

- (void)setScript:(id)a3
{
  objc_storeWeak((id *)&self->_script, a3);
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

- (id)_calculateTimeRanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  CMTimeRange v22;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  _OWORD v33[3];
  CMTime v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  memset(&v34, 0, sizeof(v34));
  CMTimeMake(&v34, 1, 1);
  v3 = (void *)objc_opt_new();
  -[PTCinematographyTrack script](self, "script");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTCinematographyTrack script](self, "script");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(v33, 0, sizeof(v33));
  objc_msgSend(v4, "framesInTimeRange:", v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v31 = v32;
  v30 = v32;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (!v9)
  {

    goto LABEL_41;
  }
  v10 = v9;
  v11 = 0;
  LOBYTE(v12) = 0;
  v13 = *(_QWORD *)v27;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
      -[PTCinematographyTrack detectionInFrame:](self, "detectionInFrame:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if ((v12 & 1) != 0)
        {
          v11 = 0;
        }
        else
        {
          if (v15)
            objc_msgSend(v15, "time");
          else
            memset(&lhs, 0, sizeof(lhs));
          v11 = 0;
          v32 = lhs;
        }
        goto LABEL_20;
      }
      if ((v12 & 1) != 0)
      {
        if ((v11 & 1) == 0)
        {
          if (v15)
            objc_msgSend(v15, "time");
          else
            memset(&lhs, 0, sizeof(lhs));
          v31 = lhs;
          rhs = v34;
          CMTimeAdd(&v30, &lhs, &rhs);
        }
        if (v15)
          objc_msgSend(v15, "time");
        else
          memset(&time1, 0, sizeof(time1));
        lhs = v30;
        if (CMTimeCompare(&time1, &lhs) < 1)
        {
          v11 = 1;
LABEL_20:
          v12 = 1;
          goto LABEL_29;
        }
        lhs = v32;
        rhs = v31;
        -[PTCinematographyTrack _addStartTime:endTime:toTimeRanges:](self, "_addStartTime:endTime:toTimeRanges:", &lhs, &rhs, v3);
        v11 = 0;
      }
      v12 = 0;
LABEL_29:
      ++v14;
    }
    while (v10 != v14);
    v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    v10 = v17;
  }
  while (v17);

  if (v12)
  {
    if ((v11 & 1) == 0)
    {
      -[PTCinematographyTrack script](self, "script");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        objc_msgSend(v18, "timeRange");
      else
        memset(&v22, 0, sizeof(v22));
      CMTimeRangeGetEnd(&v31, &v22);

    }
    lhs = v32;
    rhs = v31;
    -[PTCinematographyTrack _addStartTime:endTime:toTimeRanges:](self, "_addStartTime:endTime:toTimeRanges:", &lhs, &rhs, v3, *(_OWORD *)&v22.start.value, *(_OWORD *)&v22.start.epoch, *(_OWORD *)&v22.duration.timescale);
  }
LABEL_41:
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

- (void)_addStartTime:(id *)a3 endTime:(id *)a4 toTimeRanges:(id)a5
{
  id v5;
  void *v6;
  CMTimeRange v7;
  CMTime end;
  CMTimeRange v9;

  memset(&v9, 0, sizeof(v9));
  v7.start = (CMTime)*a3;
  end = *(CMTime *)a4;
  v5 = a5;
  CMTimeRangeFromTimeToTime(&v9, &v7.start, &end);
  v7 = v9;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (id)debugTrackIdentifierString
{
  void *v3;
  NSString *v4;
  NSString *cachedTrackIdentifierString;

  -[PTCinematographyTrack cachedTrackIdentifierString](self, "cachedTrackIdentifierString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _PTFocusIdentifierMake(-[PTCinematographyTrack detectionType](self, "detectionType"), -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedTrackIdentifierString = self->_cachedTrackIdentifierString;
    self->_cachedTrackIdentifierString = v4;

  }
  return -[PTCinematographyTrack cachedTrackIdentifierString](self, "cachedTrackIdentifierString");
}

- (unint64_t)trackType
{
  return 0;
}

- (id)_asMutableCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PTCinematographyTrack isUserCreated](self, "isUserCreated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("user_created"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PTCinematographyTrack trackType](self, "trackType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("track_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyTrack trackIdentifier](self, "trackIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("track_id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyTrack groupIdentifier](self, "groupIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("group_id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PTCinematographyTrack detectionType](self, "detectionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("detection_type"));

  return v3;
}

- (id)_asCinematographyDictionary
{
  void *v2;
  void *v3;

  -[PTCinematographyTrack _asMutableCinematographyDictionary](self, "_asMutableCinematographyDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  PTCinematographyTrack *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PTCinematographyTrack *v11;
  void *v12;
  uint64_t v13;
  __objc2_class *v14;
  PTCinematographyTrack *v15;
  objc_super v17;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("track_type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    if (v13 == 3)
    {
      v14 = PTCinematographyFixedFocusTrack;
    }
    else
    {
      if (v13 != 2)
      {
        v15 = 0;
        goto LABEL_11;
      }
      v14 = PTCinematographyCustomTrack;
    }
    v11 = (PTCinematographyTrack *)objc_msgSend([v14 alloc], "_initWithCinematographyDictionary:", v4);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PTCinematographyTrack;
    v6 = -[PTCinematographyTrack init](&v17, sel_init);
    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("user_created"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_userCreated = objc_msgSend(v7, "BOOLValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("track_id"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_trackIdentifier = objc_msgSend(v8, "integerValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("group_id"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_groupIdentifier = objc_msgSend(v9, "integerValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detection_type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_detectionType = objc_msgSend(v10, "unsignedIntegerValue");

    }
    v11 = v6;
    self = v11;
  }
  v15 = v11;
LABEL_11:

  return v15;
}

- (int64_t)trackIdentifier
{
  return self->_trackIdentifier;
}

- (int64_t)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (BOOL)isUserCreated
{
  return self->_userCreated;
}

- (void)setUserCreated:(BOOL)a3
{
  self->_userCreated = a3;
}

- (PTCinematographyScript)script
{
  return (PTCinematographyScript *)objc_loadWeakRetained((id *)&self->_script);
}

- (NSArray)timeRanges
{
  return self->_timeRanges;
}

- (NSString)cachedTrackIdentifierString
{
  return self->_cachedTrackIdentifierString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTrackIdentifierString, 0);
  objc_storeStrong((id *)&self->_timeRanges, 0);
  objc_destroyWeak((id *)&self->_script);
}

@end
