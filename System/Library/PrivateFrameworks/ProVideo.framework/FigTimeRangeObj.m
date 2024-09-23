@implementation FigTimeRangeObj

- (id)copyWithRange:(id *)a3
{
  FigTimeRangeObj *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = [FigTimeRangeObj alloc];
  v5 = *(_OWORD *)&a3->var0.var3;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  return -[FigTimeRangeObj initWithFigTimeRange:](v4, "initWithFigTimeRange:", v7);
}

- (FigTimeRangeObj)initWithFigTimeRange:(id *)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  return -[FigTimeRangeObj initWithCMTimeRange:](self, "initWithCMTimeRange:", v5);
}

- (FigTimeRangeObj)initWithCMTimeRange:(id *)a3
{
  FigTimeRangeObj *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigTimeRangeObj;
  result = -[FigTimeRangeObj init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0.var0;
    v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_range.start.epoch = v6;
    *(_OWORD *)&result->_range.start.value = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimeRangeObj)initWithCoder:(id)a3
{
  char *v4;
  void *v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FigTimeRangeObj;
  v4 = -[FigTimeRangeObj init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start"));
    if (v5)
    {
      objc_msgSend(v5, "time");
    }
    else
    {
      v8 = 0uLL;
      v9 = 0;
    }
    *((_QWORD *)v4 + 3) = v9;
    *(_OWORD *)(v4 + 8) = v8;
    v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
    if (v6)
    {
      objc_msgSend(v6, "time");
    }
    else
    {
      v8 = 0uLL;
      v9 = 0;
    }
    *((_OWORD *)v4 + 2) = v8;
    *((_QWORD *)v4 + 6) = v9;
  }
  return (FigTimeRangeObj *)v4;
}

+ (id)rangeWithRange:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = *(_OWORD *)&a3->var0.var3;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(v4, "initWithCMTimeRange:", v7);
}

- (void)encodeWithCoder:(id)a3
{
  FigTimeObj *v5;
  FigTimeObj *v6;
  $95D729B680665BEAEFA1D6FCA8238556 duration;
  __int128 v8;
  int64_t epoch;

  v5 = [FigTimeObj alloc];
  v8 = *(_OWORD *)&self->_range.start.value;
  epoch = self->_range.start.epoch;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithCMTime:](v5, "initWithCMTime:", &v8), CFSTR("start"));
  v6 = [FigTimeObj alloc];
  duration = self->_range.duration;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithCMTime:](v6, "initWithCMTime:", &duration), CFSTR("duration"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  FigTimeRangeObj *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = +[FigTimeRangeObj allocWithZone:](FigTimeRangeObj, "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_range.start.epoch;
  v7[0] = *(_OWORD *)&self->_range.start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_range.duration.timescale;
  return -[FigTimeRangeObj initWithCMTimeRange:](v4, "initWithCMTimeRange:", v7);
}

- ($202A6A048D39AE170264FF71A65A9479)range
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (void)setRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_range.start.epoch = v4;
  *(_OWORD *)&self->_range.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)start
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&self->var1;
  return self;
}

- (void)setStart:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_range.start.epoch = a3->var3;
  *(_OWORD *)&self->_range.start.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)end
{
  __int128 v3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _OWORD v5[3];

  v3 = *(_OWORD *)&self->_range.start.epoch;
  v5[0] = *(_OWORD *)&self->_range.start.value;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&self->_range.duration.timescale;
  PC_CMTimeRangeEnd((uint64_t)v5, (uint64_t)retstr);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_range.duration.epoch = a3->var3;
  *(_OWORD *)&self->_range.duration.value = v3;
}

- (void)getValue:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->_range.start.value;
  v4 = *(_OWORD *)&self->_range.duration.timescale;
  *(_OWORD *)&a3->var0.var3 = *(_OWORD *)&self->_range.start.epoch;
  *(_OWORD *)&a3->var1.var1 = v4;
  *(_OWORD *)&a3->var0.var0 = v3;
}

- (id)description
{
  __int128 v2;
  CMTimeRange v4;

  v2 = *(_OWORD *)&self->_range.start.epoch;
  *(_OWORD *)&v4.start.value = *(_OWORD *)&self->_range.start.value;
  *(_OWORD *)&v4.start.epoch = v2;
  *(_OWORD *)&v4.duration.timescale = *(_OWORD *)&self->_range.duration.timescale;
  return (id)PC_CMTimeRangeToString(&v4);
}

- (int64_t)sortByStartTimeAscending:(id)a3
{
  int32_t v4;
  CMTime v6;
  CMTime time1;

  if (self)
  {
    -[FigTimeRangeObj start](self, "start");
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "start");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3)
      goto LABEL_3;
  }
  memset(&v6, 0, sizeof(v6));
LABEL_6:
  v4 = CMTimeCompare(&time1, &v6);
  if (v4 < 0)
    return -1;
  else
    return v4 != 0;
}

- (int64_t)sortByStartTimeDescending:(id)a3
{
  int32_t v4;
  CMTime v6;
  CMTime time1;

  if (self)
  {
    -[FigTimeRangeObj start](self, "start");
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "start");
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3)
      goto LABEL_3;
  }
  memset(&v6, 0, sizeof(v6));
LABEL_6:
  v4 = CMTimeCompare(&time1, &v6);
  if (v4 > 0)
    return -1;
  else
    return v4 >> 31;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v7;
  __int128 v8;
  CMTimeRange *v9;
  CMTimeRange *v10;
  __int128 v12;
  _OWORD v13[3];
  _OWORD v14[3];
  _OWORD v15[3];
  _OWORD v16[3];
  _OWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  if (self == a3)
    return 1;
  v18 = v3;
  v19 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(_OWORD *)&self->_range.start.epoch;
    v17[0] = *(_OWORD *)&self->_range.start.value;
    v17[1] = v7;
    v17[2] = *(_OWORD *)&self->_range.duration.timescale;
    v8 = *(_OWORD *)((char *)a3 + 24);
    v16[0] = *(_OWORD *)((char *)a3 + 8);
    v16[1] = v8;
    v16[2] = *(_OWORD *)((char *)a3 + 40);
    v9 = (CMTimeRange *)v17;
    v10 = (CMTimeRange *)v16;
    return CMTimeRangeEqual(v9, v10) != 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !strcmp((const char *)objc_msgSend(a3, "objCType"), "{?={?=qiIq}{?=qiIq}}"))
  {
    objc_msgSend(a3, "getValue:", v15);
    v12 = *(_OWORD *)&self->_range.start.epoch;
    v14[0] = *(_OWORD *)&self->_range.start.value;
    v14[1] = v12;
    v14[2] = *(_OWORD *)&self->_range.duration.timescale;
    v13[0] = v15[0];
    v13[1] = v15[1];
    v13[2] = v15[2];
    v9 = (CMTimeRange *)v14;
    v10 = (CMTimeRange *)v13;
    return CMTimeRangeEqual(v9, v10) != 0;
  }
  return 0;
}

- (unint64_t)hash
{
  uint64_t timescale;

  timescale = self->_range.start.timescale;
  if ((_DWORD)timescale)
    return ((self->_range.start.value << 10) / timescale);
  else
    return 0;
}

@end
