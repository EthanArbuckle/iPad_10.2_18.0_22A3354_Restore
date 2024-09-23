@implementation IPAVideoPlaybackSettings

- (id)descriptionByInsertingOrReplacingOperation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  CMTimeEpoch v24;
  IPASloMoOperation *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  IPAVideoPlaybackSettings *obj;
  CMTime time;
  CMTimeRange time2;
  CMTimeRange time1;
  CMTimeRange v34;
  CMTimeRange v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _PFAssertFailHandler();
  v27 = v4;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self;
  v5 = -[IPAEditDescription countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v5)
  {
    v7 = 0;
    v28 = 0;
    v8 = 0;
    goto LABEL_18;
  }
  v6 = v5;
  v7 = 0;
  v28 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v12 = objc_opt_class();
      if (v12 == objc_opt_class())
      {
        v13 = v8;
        v14 = v7;
        v8 = v11;
      }
      else if (v12 == objc_opt_class())
      {
        v13 = v28;
        v14 = v7;
        v28 = v11;
      }
      else
      {
        v13 = v7;
        v14 = v11;
        if (v12 != objc_opt_class())
          continue;
      }
      v15 = v11;

      v7 = v14;
    }
    v6 = -[IPAEditDescription countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  }
  while (v6);
LABEL_18:

  v16 = objc_opt_class();
  if (v16 == objc_opt_class())
  {
    v19 = v27;

    v18 = v28;
    v8 = v19;
  }
  else if (v16 == objc_opt_class())
  {
    v18 = v27;

    if (v7)
    {
      memset(&v35[1], 0, sizeof(CMTimeRange));
      objc_msgSend(v7, "timeRange");
      memset(v35, 0, 48);
      objc_msgSend(v18, "trimRange");
      time1 = v35[1];
      memset(&v34, 0, sizeof(v34));
      time2 = v35[0];
      IPAClipTimeRange((uint64_t)&time1, (uint64_t)&time2, &v34);
      if ((v34.start.flags & 1) != 0
        && (v34.duration.flags & 1) != 0
        && !v34.duration.epoch
        && (v34.duration.value & 0x8000000000000000) == 0)
      {
        time1.start = v34.duration;
        v29 = *MEMORY[0x1E0CA2E68];
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68];
        v24 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        time2.start.epoch = v24;
        if (!CMTimeCompare(&time1.start, &time2.start))
        {
          *(_OWORD *)&time1.start.value = *(_OWORD *)&v35[0].start.value;
          time1.start.epoch = v35[0].start.epoch;
          *(_OWORD *)&time2.start.value = v29;
          time2.start.epoch = v24;
          CMTimeRangeMake(&v34, &time1.start, &time2.start);
        }
      }
      time1 = v35[1];
      time2 = v34;
      if (!CMTimeRangeEqual(&time1, &time2))
      {
        v25 = [IPASloMoOperation alloc];
        objc_msgSend(v7, "rate");
        time1 = v34;
        v26 = -[IPASloMoOperation initWithTimeRange:rate:](v25, "initWithTimeRange:rate:", &time1);

        v7 = (void *)v26;
      }
      if (v8)
      {
        memset(&time2, 0, 24);
        objc_msgSend(v8, "frameTime");
        time1 = v35[0];
        time = time2.start;
        if (!CMTimeRangeContainsTime(&time1, &time))
        {

          v8 = 0;
        }
      }
    }
  }
  else
  {
    if (v16 == objc_opt_class())
    {
      v17 = v27;

      v7 = v17;
    }
    v18 = v28;
  }
  v20 = (void *)objc_opt_new();
  v21 = v20;
  if (v8)
    objc_msgSend(v20, "addObject:", v8);
  if (v18)
    objc_msgSend(v21, "addObject:", v18);
  if (v7)
    objc_msgSend(v21, "addObject:", v7);
  -[IPAVideoPlaybackSettings descriptionWithOperations:](obj, "descriptionWithOperations:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scaledDuration
{
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v7;
  CMTime start;
  CMTime v9[2];
  CMTimeRange range;
  CMTime v11;
  __int128 v12;
  CMTimeEpoch epoch;
  CMTimeRange v14;

  memset(&v14, 0, sizeof(v14));
  -[IPAVideoPlaybackSettings naturalPlaybackRange](self, "naturalPlaybackRange");
  *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v14.duration;
  -[IPAVideoPlaybackSettings slomoOperation](self, "slomoOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = *(_OWORD *)&v14.start.value;
    epoch = v14.start.epoch;
    memset(&v11, 0, sizeof(v11));
    range = v14;
    CMTimeRangeGetEnd(&v11, &range);
    memset(&v9[1], 0, sizeof(CMTime));
    *(_OWORD *)&range.start.value = v12;
    range.start.epoch = epoch;
    -[IPAVideoPlaybackSettings scaledTimeFromNaturalTime:](self, "scaledTimeFromNaturalTime:", &range);
    memset(v9, 0, 24);
    range.start = v11;
    -[IPAVideoPlaybackSettings scaledTimeFromNaturalTime:](self, "scaledTimeFromNaturalTime:", &range);
    memset(&range, 0, sizeof(range));
    start = v9[1];
    v7 = v9[0];
    CMTimeRangeFromTimeToTime(&range, &start, &v7);
    *retstr = ($3CC8671D27C23BF42ADDB32F2B5E48AE)range.duration;
  }

  return result;
}

- ($222789CE95D16A76D31543149FD45E96)naturalPlaybackRange
{
  void *v5;
  __int128 v6;
  __int128 v7;
  $222789CE95D16A76D31543149FD45E96 *result;
  NSObject *v9;
  const __CFAllocator *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __int128 v14;
  __CFString *v15;
  CMTimeRange range2;
  CMTimeRange v17[2];
  CMTime duration;
  CMTimeRange v19;
  CMTimeRange start;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IPAVideoPlaybackSettings trimOperation](self, "trimOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v19, 0, sizeof(v19));
  -[IPAVideoPlaybackSettings naturalDuration](self, "naturalDuration");
  *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
  start.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  CMTimeRangeMake(&v19, &start.start, &duration);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  if (!v5)
    goto LABEL_4;
  memset(&v17[1], 0, sizeof(CMTimeRange));
  objc_msgSend(v5, "trimRange");
  if (!((unsigned __int128)0 >> 96)
    || (v17[1].duration.flags & 1) == 0
    || v17[1].duration.epoch
    || v17[1].duration.value < 0)
  {
    start = v17[1];
    v15 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &start);
    _PFAssertContinueHandler();

LABEL_4:
    v6 = *(_OWORD *)&v19.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v19.start.value;
    *(_OWORD *)&retstr->var0.var3 = v6;
    v7 = *(_OWORD *)&v19.duration.timescale;
    goto LABEL_5;
  }
  start = v17[1];
  range2 = v19;
  memset(v17, 0, 48);
  IPAClipTimeRange((uint64_t)&start, (uint64_t)&range2, v17);
  start = v17[1];
  range2 = v17[0];
  if (!CMTimeRangeEqual(&start, &range2))
  {
    IPAVideoGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      start = v17[1];
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v11 = (__CFString *)CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &start);
      start = v19;
      v12 = (__CFString *)CMTimeRangeCopyDescription(v10, &start);
      start = v17[0];
      v13 = (__CFString *)CMTimeRangeCopyDescription(v10, &start);
      LODWORD(start.start.value) = 138412802;
      *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v11;
      LOWORD(start.start.flags) = 2112;
      *(_QWORD *)((char *)&start.start.flags + 2) = v12;
      HIWORD(start.start.epoch) = 2112;
      start.duration.value = (CMTimeValue)v13;
      _os_log_impl(&dword_1D4CAA000, v9, OS_LOG_TYPE_DEBUG, "trimRange %@ falls outside of natural playback range %@; clipping to %@ ",
        (uint8_t *)&start,
        0x20u);

    }
  }
  v14 = *(_OWORD *)&v17[0].start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v17[0].start.value;
  *(_OWORD *)&retstr->var0.var3 = v14;
  v7 = *(_OWORD *)&v17[0].duration.timescale;
LABEL_5:
  *(_OWORD *)&retstr->var1.var1 = v7;

  return result;
}

- ($222789CE95D16A76D31543149FD45E96)scaledPlaybackRangeForScaledDuration:(SEL)a3
{
  void *v7;
  $222789CE95D16A76D31543149FD45E96 *result;
  IPAVideoPlaybackSettings *v9;
  SEL v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v12;
  CMTime v13;
  CMTime time2;
  CMTime time1;
  CMTime v16;
  CMTimeRange range;
  CMTime v18;
  CMTime start;
  CMTimeRange time;

  if ((a4->var2 & 1) != 0)
  {
    memset(&time, 0, sizeof(time));
    -[IPAVideoPlaybackSettings naturalPlaybackRange](self, "naturalPlaybackRange");
    start = time.start;
    memset(&v18, 0, sizeof(v18));
    range = time;
    CMTimeRangeGetEnd(&v18, &range);
    memset(&range, 0, 24);
    memset(&v16, 0, sizeof(v16));
    -[IPAVideoPlaybackSettings slomoOperation](self, "slomoOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      time1 = start;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      CMTimeMaximum(&range.start, &time1, &time2);
      memset(&time1, 0, sizeof(time1));
      time2 = v18;
      -[IPAVideoPlaybackSettings scaledTimeFromNaturalTime:](self, "scaledTimeFromNaturalTime:", &time2);
      time2 = time1;
      v13 = (CMTime)*a4;
      CMTimeMinimum(&v16, &time2, &v13);
    }
    else
    {
      range.start = start;
      v16 = v18;
    }
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    time1 = range.start;
    time2 = v16;
    CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &time1, &time2);

  }
  else
  {
    time.start = (CMTime)*a4;
    CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time.start);
    v9 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
    return ($222789CE95D16A76D31543149FD45E96 *)-[IPAVideoPlaybackSettings scaledTimeFromNaturalTime:](v12, v9, v10, v11);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scaledTimeFromNaturalTime:(SEL)a3
{
  int64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMTime v15;
  __int128 v16;
  int64_t var3;
  __int128 v18;
  int64_t v19;
  CMTime time2;
  _OWORD v21[3];
  _OWORD v22[3];

  -[IPAVideoPlaybackSettings naturalPlaybackRange](self, "naturalPlaybackRange");
  v12 = *(_OWORD *)&a4->var0;
  *(_QWORD *)&v13 = a4->var3;
  IPAClipTime((uint64_t)&v12, v22, (uint64_t)v21);
  *(_OWORD *)&a4->var0 = v21[0];
  v7 = *(_QWORD *)&v21[1];
  a4->var3 = *(_QWORD *)&v21[1];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
  retstr->var3 = v7;
  -[IPAVideoPlaybackSettings slomoOperation](self, "slomoOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  memset(v21, 0, sizeof(v21));
  if (v8)
  {
    objc_msgSend(v8, "timeRange");
    if ((BYTE12(v21[0]) & 1) == 0
      || (BYTE4(v21[2]) & 1) == 0
      || *((_QWORD *)&v21[2] + 1)
      || (*((_QWORD *)&v21[1] + 1) & 0x8000000000000000) != 0
      || (v12 = *(_OWORD *)((char *)&v21[1] + 8),
          *(_QWORD *)&v13 = *((_QWORD *)&v21[2] + 1),
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
          CMTimeCompare((CMTime *)&v12, &time2)))
    {
      memset(&time2, 0, sizeof(time2));
      -[IPAVideoPlaybackSettings naturalDuration](self, "naturalDuration");
      objc_msgSend(v9, "rate");
      v16 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v15 = time2;
      v12 = v21[0];
      v13 = v21[1];
      v14 = v21[2];
      IPAScaledTimeFromNaturalTime(&v16, (__int128 *)&v15.value, &v12, (uint64_t)&v18, v10);
      *(_OWORD *)&retstr->var0 = v18;
      retstr->var3 = v19;
    }
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalTimeFromScaledTime:(SEL)a3
{
  void *v7;
  void *v8;
  unsigned int v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CMTime v14;
  __int128 v15;
  int64_t var3;
  __int128 v17;
  int64_t v18;
  CMTime time2;
  __int128 v20;
  _OWORD v21[2];

  *retstr = *a4;
  -[IPAVideoPlaybackSettings slomoOperation](self, "slomoOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  memset(v21, 0, sizeof(v21));
  v20 = 0u;
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
    if ((BYTE12(v20) & 1) == 0
      || (BYTE4(v21[1]) & 1) == 0
      || *((_QWORD *)&v21[1] + 1)
      || (*((_QWORD *)&v21[0] + 1) & 0x8000000000000000) != 0
      || (v11 = *(_OWORD *)((char *)v21 + 8),
          *(_QWORD *)&v12 = *((_QWORD *)&v21[1] + 1),
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
          CMTimeCompare((CMTime *)&v11, &time2)))
    {
      memset(&time2, 0, sizeof(time2));
      -[IPAVideoPlaybackSettings naturalDuration](self, "naturalDuration");
      objc_msgSend(v8, "rate");
      v15 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v14 = time2;
      v11 = v20;
      v12 = v21[0];
      v13 = v21[1];
      IPANaturalTimeFromScaledTime(&v15, (__int128 *)&v14.value, &v11, (uint64_t)&v17, v9);
      *(_OWORD *)&retstr->var0 = v17;
      retstr->var3 = v18;
    }
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalTimeForPosterFrame
{
  void *v5;
  void *v6;
  void *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v9;
  int64_t v10;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  -[IPAVideoPlaybackSettings posterFrameOperation](self, "posterFrameOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAVideoPlaybackSettings trimOperation](self, "trimOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "frameTime");
LABEL_5:
    *(_OWORD *)&retstr->var0 = v9;
    retstr->var3 = v10;
    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(v6, "startTime");
    goto LABEL_5;
  }
LABEL_6:

  return result;
}

- (IPAVideoPlaybackSettings)initWithOperations:(id)a3
{
  id v3;
  IPAVideoPlaybackSettings *v4;
  SEL v5;
  id v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;

  v3 = a3;
  v4 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
  return -[IPAVideoPlaybackSettings initWithOperations:naturalDuration:](v4, v5, v6, v7);
}

- (IPAVideoPlaybackSettings)initWithOperations:(id)a3 naturalDuration:(id *)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  IPAVideoPlaybackSettings *v20;
  int64_t var3;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time2;
  _BYTE v29[128];
  CMTime time1;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = MEMORY[0x1E0CA2E68];
  if ((a4->var2 & 0x1D) != 1
    || (time1 = (CMTime)*a4, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &time2) < 0))
  {
    IPAVideoGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      time1 = (CMTime)*a4;
      v9 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time1);
      LODWORD(time1.value) = 138412290;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v9;
      _os_log_impl(&dword_1D4CAA000, v8, OS_LOG_TYPE_DEBUG, "%@ is either invalid, non-numeric or negative", (uint8_t *)&time1, 0xCu);

    }
    *(_OWORD *)&a4->var0 = *(_OWORD *)v7;
    a4->var3 = *(_QWORD *)(v7 + 16);
  }
  v10 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)IPAVideoPlaybackSettings;
  v20 = -[IPAEditDescription initWithOperations:](&v23, sel_initWithOperations_, v19);

  if (v20)
  {
    var3 = a4->var3;
    *(_OWORD *)&v20->_naturalDuration.value = *(_OWORD *)&a4->var0;
    v20->_naturalDuration.epoch = var3;
  }

  return v20;
}

- (BOOL)isEqualToDescription:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  CMTime v20;
  CMTime time1;

  v4 = a3;
  -[IPAVideoPlaybackSettings naturalDuration](self, "naturalDuration");
  if (v4)
    objc_msgSend(v4, "naturalDuration");
  else
    memset(&v20, 0, sizeof(v20));
  if (CMTimeCompare(&time1, &v20)
    || (v5 = objc_msgSend(v4, "operationCount"), v5 != -[IPAEditDescription operationCount](self, "operationCount")))
  {
    v10 = 0;
  }
  else
  {
    -[IPAVideoPlaybackSettings posterFrameOperation](self, "posterFrameOperation");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "posterFrameOperation");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6 && v7)
      v9 = objc_msgSend((id)v6, "isEqual:", v7);
    else
      v9 = (v6 | v7) == 0;
    -[IPAVideoPlaybackSettings trimOperation](self, "trimOperation", v20.value, *(_QWORD *)&v20.timescale, v20.epoch);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trimOperation");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12 && v13)
      v15 = objc_msgSend((id)v12, "isEqual:", v13);
    else
      v15 = (v12 | v13) == 0;
    -[IPAVideoPlaybackSettings slomoOperation](self, "slomoOperation");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "slomoOperation");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16 && v17)
      v19 = objc_msgSend((id)v16, "isEqual:", v17);
    else
      v19 = (v16 | v17) == 0;
    v10 = v9 & v15 & v19;

  }
  return v10;
}

- (unint64_t)sortOrderForOperationWithIdentifier:(id)a3
{
  return 0;
}

- (id)descriptionWithOperations:(id)a3
{
  uint64_t v4;
  int64_t epoch;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IPAVideoPlaybackSettings;
  -[IPAEditDescription descriptionWithOperations:](&v7, sel_descriptionWithOperations_, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    epoch = self->_naturalDuration.epoch;
    *(_OWORD *)(v4 + 16) = *(_OWORD *)&self->_naturalDuration.value;
    *(_QWORD *)(v4 + 32) = epoch;
  }
  return (id)v4;
}

- (id)descriptionByAddingOperation:(id)a3 atIndex:(unint64_t)a4
{
  id v4;
  IPAVideoPlaybackSettings *v5;
  SEL v6;
  id v7;

  v4 = a3;
  v5 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
  return -[IPAVideoPlaybackSettings descriptionByAddingOperation:](v5, v6, v7);
}

- (id)descriptionByAddingOperation:(id)a3
{
  id v3;
  IPAVideoPlaybackSettings *v4;
  SEL v5;
  id v6;
  unint64_t v7;

  v3 = a3;
  v4 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
  return -[IPAVideoPlaybackSettings descriptionByReplacingOperation:atIndex:](v4, v5, v6, v7);
}

- (id)descriptionByReplacingOperation:(id)a3 atIndex:(unint64_t)a4
{
  id v4;
  IPAVideoPlaybackSettings *v5;
  SEL v6;
  id v7;

  v4 = a3;
  v5 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
  return -[IPAVideoPlaybackSettings operationWithIdentifier:](v5, v6, v7);
}

- (id)posterFrameOperation
{
  return -[IPAVideoPlaybackSettings operationWithIdentifier:](self, "operationWithIdentifier:", CFSTR("PosterFrame"));
}

- (id)trimOperation
{
  return -[IPAVideoPlaybackSettings operationWithIdentifier:](self, "operationWithIdentifier:", CFSTR("Trim"));
}

- (id)slomoOperation
{
  return -[IPAVideoPlaybackSettings operationWithIdentifier:](self, "operationWithIdentifier:", CFSTR("SloMo"));
}

- (id)archivalRepresentation
{
  void *v3;
  IPAVideoPlaybackSettings *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self;
  v5 = -[IPAEditDescription countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "archivalRepresentation", v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "addObject:", v9);
          }
          else
          {
            v12 = v9;
            _PFAssertContinueHandler();
          }
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = -[IPAEditDescription countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setAdjustments:", v3);

  return v10;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  -[IPAVideoPlaybackSettings posterFrameOperation](self, "posterFrameOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAVideoPlaybackSettings trimOperation](self, "trimOperation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAVideoPlaybackSettings slomoOperation](self, "slomoOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@:%p pf=%@ trim=%@ slomo=%@>"), v4, self, v5, v6, v7);

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  if (!s_identifierToClassMapping)
  {
    v4[0] = CFSTR("PosterFrame");
    v5[0] = objc_opt_class();
    v4[1] = CFSTR("Trim");
    v5[1] = objc_opt_class();
    v4[2] = CFSTR("SloMo");
    v5[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)s_identifierToClassMapping;
    s_identifierToClassMapping = v2;

  }
}

+ (Class)expectedOperationClass
{
  return (Class)objc_opt_class();
}

+ (id)playbackSettingsForAdjustments:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  IPAVideoPlaybackSettings *v18;
  IPAVideoPlaybackSettings *v19;
  void *v21;
  void *v22;
  _BYTE v23[24];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  objc_class *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v22 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v3;
    objc_msgSend(v3, "adjustments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = +[IPAVideoPlaybackSettings operationClassForIdentifier:](IPAVideoPlaybackSettings, "operationClassForIdentifier:", v10);

          if (v11)
          {
            v12 = [v11 alloc];
            objc_msgSend(v9, "settings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "initWithSettingsDictionary:", v13);

            if (v14)
            {
              objc_msgSend(v22, "addObject:", v14);
            }
            else
            {
              IPAVideoGetLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v9, "settings");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v29 = v17;
                v30 = 2112;
                v31 = v11;
                _os_log_impl(&dword_1D4CAA000, v16, OS_LOG_TYPE_DEFAULT, "failed to unarchive %@ via %@", buf, 0x16u);

              }
              v14 = 0;
            }
          }
          else
          {
            IPAVideoGetLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v29 = v15;
              _os_log_impl(&dword_1D4CAA000, v14, OS_LOG_TYPE_DEFAULT, "missing adjustment class for identifier %@", buf, 0xCu);

            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v6);
    }

    v18 = [IPAVideoPlaybackSettings alloc];
    v3 = v21;
    objc_msgSend(v21, "naturalDuration");
    v19 = -[IPAVideoPlaybackSettings initWithOperations:naturalDuration:](v18, "initWithOperations:naturalDuration:", v22, v23);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (Class)operationClassForIdentifier:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v7;
  SEL v8;
  id v9;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = (objc_class *)(id)objc_msgSend((id)s_identifierToClassMapping, "objectForKeyedSubscript:", v3);

    return v5;
  }
  else
  {
    v7 = (void *)_PFAssertFailHandler();
    return (Class)+[IPAVideoPlaybackSettings presetifyAdjustmentStack:](v7, v8, v9);
  }
}

+ (id)presetifyAdjustmentStack:(id)a3
{
  return a3;
}

@end
