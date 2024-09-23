@implementation TVPTimeRange

+ ($A0D62BC7BB322857EA05296DE7D5C3FF)forwardmostCMTimeRangeInCMTimeRanges:(SEL)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;
  _BYTE start[32];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMTime duration;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  if (!v5 || !v6)
    goto LABEL_37;
  if (v6 == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "CMTimeRangeValue");
    }
    else
    {
      *(_OWORD *)&retstr->var0.var3 = 0u;
      *(_OWORD *)&retstr->var1.var1 = 0u;
      *(_OWORD *)&retstr->var0.var0 = 0u;
    }

    goto LABEL_40;
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)start = *MEMORY[0x24BDC0D48];
  *(_QWORD *)&start[16] = *(_QWORD *)(MEMORY[0x24BDC0D48] + 16);
  duration = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  CMTimeRangeMake((CMTimeRange *)retstr, (CMTime *)start, &duration);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v26 = 0u;
        memset(start, 0, sizeof(start));
        if (v14)
        {
          objc_msgSend(v14, "CMTimeRangeValue");
          if ((start[12] & 1) != 0)
          {
            v15 = (BYTE4(v26) & 0x1D) == 1 && (start[12] & 0x1D) == 1;
            v16 = !v15 || (BYTE4(v26) & 0x11) == 17;
            v17 = v16 || (start[12] & 0x11) == 17;
            v18 = v17 || (BYTE4(v26) & 1) == 0;
            if (!v18 && *((_QWORD *)&v26 + 1) == 0 && (*(_QWORD *)&start[24] & 0x8000000000000000) == 0)
            {
              duration = *(CMTime *)start;
              var0 = retstr->var0;
              if (CMTimeCompare(&duration, (CMTime *)&var0) >= 1)
              {
                v20 = *(_OWORD *)&start[16];
                *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)start;
                *(_OWORD *)&retstr->var0.var3 = v20;
                *(_OWORD *)&retstr->var1.var1 = v26;
              }
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  if ((retstr->var0.var2 & 0x1D) != 1 || (retstr->var1.var2 & 0x1D) != 1)
  {
LABEL_37:
    v21 = MEMORY[0x24BDC0D78];
    v22 = *(_OWORD *)(MEMORY[0x24BDC0D78] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x24BDC0D78];
    *(_OWORD *)&retstr->var0.var3 = v22;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v21 + 32);
  }
LABEL_40:

  return result;
}

- (TVPTimeRange)initWithStartTime:(double)a3 endTime:(double)a4
{
  return -[TVPTimeRange initWithStartTime:duration:](self, "initWithStartTime:duration:", a3, a4 - a3);
}

- (TVPTimeRange)initWithCMTimeRange:(id *)a3
{
  double Seconds;
  double v5;
  BOOL v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;

  Seconds = 0.0;
  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && ((a3->var1.var2 & 0x1D) == 1 ? (v7 = (a3->var0.var2 & 0x1D) == 1) : (v7 = 0), v7))
  {
    p_var1 = &a3->var1;
    v5 = 0.0;
    if ((a3->var1.var0 & 0x8000000000000000) == 0)
    {
      var0 = a3->var0;
      Seconds = CMTimeGetSeconds((CMTime *)&var0);
      var0 = *p_var1;
      v5 = CMTimeGetSeconds((CMTime *)&var0);
    }
  }
  else
  {
    v5 = 0.0;
  }
  return -[TVPTimeRange initWithStartTime:duration:](self, "initWithStartTime:duration:", Seconds, v5);
}

- (TVPTimeRange)initWithStartTime:(double)a3 duration:(double)a4
{
  TVPTimeRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVPTimeRange;
  result = -[TVPTimeRange init](&v7, sel_init);
  if (result)
  {
    result->_startTime = a3;
    result->_duration = a4;
  }
  return result;
}

- (double)endTime
{
  double v3;
  double v4;
  double v5;

  -[TVPTimeRange startTime](self, "startTime");
  v4 = v3;
  -[TVPTimeRange duration](self, "duration");
  return v4 + v5;
}

- (BOOL)containsTime:(double)a3
{
  double v5;
  double v7;

  -[TVPTimeRange startTime](self, "startTime");
  if (v5 > a3)
    return 0;
  -[TVPTimeRange endTime](self, "endTime");
  return v7 > a3;
}

- (id)intersectTimeRange:(id)a3
{
  id v4;
  TVPTimeRange *v5;
  Float64 v6;
  Float64 v7;
  Float64 v8;
  Float64 v9;
  TVPTimeRange *v10;
  uint64_t v11;
  CMTimeRange v13;
  CMTimeRange range;
  CMTimeRange v15;
  CMTime v16;
  CMTime v17;
  CMTimeRange v18;
  CMTime duration;
  CMTime start;
  CMTimeRange v21;

  v4 = a3;
  v5 = -[TVPTimeRange initWithStartTime:duration:]([TVPTimeRange alloc], "initWithStartTime:duration:", 0.0, 0.0);
  if (v4)
  {
    memset(&v21, 0, sizeof(v21));
    -[TVPTimeRange startTime](self, "startTime");
    CMTimeMakeWithSeconds(&start, v6, 1000000);
    -[TVPTimeRange duration](self, "duration");
    CMTimeMakeWithSeconds(&duration, v7, 1000000);
    CMTimeRangeMake(&v21, &start, &duration);
    memset(&v18, 0, sizeof(v18));
    objc_msgSend(v4, "startTime");
    CMTimeMakeWithSeconds(&v17, v8, 1000000);
    objc_msgSend(v4, "duration");
    CMTimeMakeWithSeconds(&v16, v9, 1000000);
    CMTimeRangeMake(&v18, &v17, &v16);
    range = v21;
    memset(&v15, 0, sizeof(v15));
    v13 = v18;
    CMTimeRangeGetIntersection(&v15, &range, &v13);
    v10 = [TVPTimeRange alloc];
    range = v15;
    v11 = -[TVPTimeRange initWithCMTimeRange:](v10, "initWithCMTimeRange:", &range);

    v5 = (TVPTimeRange *)v11;
  }

  return v5;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[TVPTimeRange startTime](self, "startTime");
  v4 = v3;
  -[TVPTimeRange duration](self, "duration");
  v6 = v5;
  -[TVPTimeRange endTime](self, "endTime");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Start time: %f End time: %f Duration: %f"), v4, v7, v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "startTime");
    v7 = v6;
    -[TVPTimeRange startTime](self, "startTime");
    if (v7 == v8)
    {
      objc_msgSend(v5, "duration");
      v10 = v9;
      -[TVPTimeRange duration](self, "duration");
      v12 = v10 == v11;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
