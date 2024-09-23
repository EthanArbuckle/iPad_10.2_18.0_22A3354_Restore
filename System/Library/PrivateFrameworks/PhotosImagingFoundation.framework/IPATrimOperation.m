@implementation IPATrimOperation

- (IPATrimOperation)initWithTrimRange:(id *)a3
{
  __int128 v5;
  CMTimeRange v7;
  CMTime v8;

  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v7.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v7.start.epoch = v5;
  *(_OWORD *)&v7.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v8, &v7);
  *(_OWORD *)&v7.start.value = *(_OWORD *)&a3->var0.var0;
  v7.start.epoch = a3->var0.var3;
  return -[IPATrimOperation initWithStartTime:endTime:](self, "initWithStartTime:endTime:", &v7, &v8);
}

- (IPATrimOperation)initWithStartTime:(id *)a3 endTime:(id *)a4
{
  __CFString *v6;
  IPATrimOperation *result;
  int64_t var3;
  int64_t v10;
  objc_super v11;
  CMTime time2;
  CMTime time;

  if ((a3->var2 & 1) == 0)
  {
    time = *(CMTime *)a3;
    v6 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
LABEL_5:
    _PFAssertContinueHandler();

LABEL_6:
    return 0;
  }
  if ((a4->var2 & 1) == 0)
  {
    time = *(CMTime *)a4;
    v6 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
    goto LABEL_5;
  }
  time = *(CMTime *)a3;
  time2 = *(CMTime *)a4;
  if (CMTimeCompare(&time, &time2) >= 1)
  {
    _PFAssertContinueHandler();
    goto LABEL_6;
  }
  v11.receiver = self;
  v11.super_class = (Class)IPATrimOperation;
  result = -[IPAEditOperation init](&v11, sel_init);
  if (result)
  {
    var3 = a3->var3;
    *(_OWORD *)&result->_startTime.value = *(_OWORD *)&a3->var0;
    result->_startTime.epoch = var3;
    v10 = a4->var3;
    *(_OWORD *)&result->_endTime.value = *(_OWORD *)&a4->var0;
    result->_endTime.epoch = v10;
  }
  return result;
}

- (IPATrimOperation)initWithOperation:(id)a3
{
  char *v4;
  char *v5;
  IPATrimOperation *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v4 = (char *)a3;
  v10.receiver = self;
  v10.super_class = (Class)IPATrimOperation;
  v5 = -[IPAEditOperation initWithOperation:](&v10, sel_initWithOperation_, v4);
  v6 = (IPATrimOperation *)v5;
  if (v5)
  {
    v7 = *((_QWORD *)v4 + 3);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((_QWORD *)v5 + 3) = v7;
    v8 = *((_QWORD *)v4 + 6);
    *((_OWORD *)v5 + 2) = *((_OWORD *)v4 + 2);
    *((_QWORD *)v5 + 6) = v8;
  }

  return v6;
}

- (IPATrimOperation)initWithSettingsDictionary:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  CMTimeEpoch epoch;
  CMTimeEpoch v10;
  CMTime v11;
  CMTime time1;
  CMTime v13;
  CMTime v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IPATrimOperation;
  v5 = -[IPAEditOperation init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v14, 0, sizeof(v14));
    CMTimeMakeFromDictionary(&v14, (CFDictionaryRef)v6);
    memset(&v13, 0, sizeof(v13));
    CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)v7);
    if ((v14.flags & 1) != 0 && (v13.flags & 1) != 0 && (time1 = v14, v11 = v13, CMTimeCompare(&time1, &v11) <= 0))
    {
      epoch = v14.epoch;
      *(_OWORD *)(v5 + 8) = *(_OWORD *)&v14.value;
      *((_QWORD *)v5 + 3) = epoch;
      v10 = v13.epoch;
      *((_OWORD *)v5 + 2) = *(_OWORD *)&v13.value;
      *((_QWORD *)v5 + 6) = v10;
    }
    else
    {

      v5 = 0;
    }
  }

  return (IPATrimOperation *)v5;
}

- ($222789CE95D16A76D31543149FD45E96)trimRange
{
  $95D729B680665BEAEFA1D6FCA8238556 endTime;
  CMTime start;

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  start = (CMTime)self->_startTime;
  endTime = self->_endTime;
  return ($222789CE95D16A76D31543149FD45E96 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, (CMTime *)&endTime);
}

- (id)trimRangeDictionary
{
  CMTimeEpoch v3;
  __int128 v5;
  CMTimeRange time2;
  CMTimeRange time1;

  time1.start = (CMTime)self->_startTime;
  v5 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68];
  v3 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  time2.start.epoch = v3;
  if (!CMTimeCompare(&time1.start, &time2.start))
  {
    *(_OWORD *)&time1.start.value = *(_OWORD *)&self->_endTime.value;
    time1.start.epoch = self->_endTime.epoch;
    *(_OWORD *)&time2.start.value = v5;
    time2.start.epoch = v3;
    if (!CMTimeCompare(&time1.start, &time2.start))
      return 0;
  }
  memset(&time1, 0, sizeof(time1));
  -[IPATrimOperation trimRange](self, "trimRange", v5);
  time2 = time1;
  return CMTimeRangeCopyAsDictionary(&time2, 0);
}

- (id)settingsDictionary
{
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  void *v6;
  $95D729B680665BEAEFA1D6FCA8238556 startTime;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  startTime = self->_startTime;
  v3 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
  startTime = self->_endTime;
  v4 = CMTimeCopyAsDictionary((CMTime *)&startTime, 0);
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    v9[0] = CFSTR("startTime");
    v9[1] = CFSTR("endTime");
    v10[0] = v3;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)identifier
{
  __CFString *v2;

  v2 = CFSTR("Trim");
  return CFSTR("Trim");
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const __CFAllocator *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  time = (CMTime)self->_startTime;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
  time = (CMTime)self->_endTime;
  v7 = (__CFString *)CMTimeCopyDescription(v5, &time);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p startTime=%@ endTime=%@>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqualToOperation:(id)a3
{
  id v4;
  char *v5;
  __int128 v6;
  BOOL v7;
  __int128 v8;
  CMTime v10;
  CMTime time1;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (char *)v4;
    time1 = (CMTime)self->_startTime;
    v6 = *(_OWORD *)(v5 + 8);
    v10.epoch = *((_QWORD *)v5 + 3);
    *(_OWORD *)&v10.value = v6;
    if (CMTimeCompare(&time1, &v10))
    {
      v7 = 0;
    }
    else
    {
      time1 = (CMTime)self->_endTime;
      v8 = *((_OWORD *)v5 + 2);
      v10.epoch = *((_QWORD *)v5 + 6);
      *(_OWORD *)&v10.value = v8;
      v7 = CMTimeCompare(&time1, &v10) == 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

@end
