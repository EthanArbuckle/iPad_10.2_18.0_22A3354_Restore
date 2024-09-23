@implementation IPAPosterFrameOperation

- (BOOL)isMigratable
{
  return 1;
}

- (IPAPosterFrameOperation)initWithFrameTime:(id *)a3
{
  IPAPosterFrameOperation *v3;
  IPAPosterFrameOperation *v4;
  char *v6;
  int64_t var3;
  objc_super v9;

  v3 = self;
  if ((a3->var2 & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)IPAPosterFrameOperation;
    v6 = -[IPAEditOperation init](&v9, sel_init);
    if (v6)
    {
      var3 = a3->var3;
      *(_OWORD *)(v6 + 8) = *(_OWORD *)&a3->var0;
      *((_QWORD *)v6 + 3) = var3;
    }
    v3 = v6;
    v4 = v3;
  }
  else
  {
    _PFAssertContinueHandler();
    v4 = 0;
  }

  return v4;
}

- (IPAPosterFrameOperation)initWithOperation:(id)a3
{
  char *v4;
  char *v5;
  IPAPosterFrameOperation *v6;
  uint64_t v7;
  objc_super v9;

  v4 = (char *)a3;
  v9.receiver = self;
  v9.super_class = (Class)IPAPosterFrameOperation;
  v5 = -[IPAEditOperation initWithOperation:](&v9, sel_initWithOperation_, v4);
  v6 = (IPAPosterFrameOperation *)v5;
  if (v5)
  {
    v7 = *((_QWORD *)v4 + 3);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((_QWORD *)v5 + 3) = v7;
  }

  return v6;
}

- (IPAPosterFrameOperation)initWithSettingsDictionary:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  __int128 v7;
  CMTime v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IPAPosterFrameOperation;
  v5 = -[IPAEditOperation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("frameTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    CMTimeMakeFromDictionary(&v9, (CFDictionaryRef)v6);
    v7 = *(_OWORD *)&v9.value;
    *((_QWORD *)v5 + 3) = v9.epoch;
    *(_OWORD *)(v5 + 8) = v7;
  }

  return (IPAPosterFrameOperation *)v5;
}

- (id)settingsDictionary
{
  const __CFAllocator *v2;
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  void *v5;
  $95D729B680665BEAEFA1D6FCA8238556 frameTime;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  frameTime = self->_frameTime;
  v3 = CMTimeCopyAsDictionary((CMTime *)&frameTime, v2);
  v4 = v3;
  if (v3)
  {
    v8 = CFSTR("frameTime");
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)identifier
{
  __CFString *v2;

  v2 = CFSTR("PosterFrame");
  return CFSTR("PosterFrame");
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  time = (CMTime)self->_frameTime;
  v5 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p frameTime=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqualToOperation:(id)a3
{
  char *v4;
  __int128 v5;
  BOOL v6;
  CMTime v8;
  CMTime time1;

  v4 = (char *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    time1 = (CMTime)self->_frameTime;
    v5 = *(_OWORD *)(v4 + 8);
    v8.epoch = *((_QWORD *)v4 + 3);
    *(_OWORD *)&v8.value = v5;
    v6 = CMTimeCompare(&time1, &v8) == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

@end
