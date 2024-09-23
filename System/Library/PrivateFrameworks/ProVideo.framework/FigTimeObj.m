@implementation FigTimeObj

- (FigTimeObj)initWithFigTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  return -[FigTimeObj initWithCMTime:](self, "initWithCMTime:", &v4);
}

- (FigTimeObj)initWithCMTime:(id *)a3
{
  FigTimeObj *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigTimeObj;
  result = -[FigTimeObj init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.value = v5;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (void)getValue:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_time.value;
  a3->var3 = self->_time.epoch;
  *(_OWORD *)&a3->var0 = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimeObj)initWithCoder:(id)a3
{
  FigTimeObj *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigTimeObj;
  v4 = -[FigTimeObj init](&v6, sel_init);
  if (v4)
  {
    v4->_time.epoch = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("epoch"));
    v4->_time.value = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("value"));
    v4->_time.timescale = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("timescale"));
    v4->_time.flags = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("flags"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_time.epoch, CFSTR("epoch"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_time.value, CFSTR("value"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_time.timescale, CFSTR("timescale"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_time.flags, CFSTR("flags"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  FigTimeObj *v4;
  $95D729B680665BEAEFA1D6FCA8238556 time;

  v4 = +[FigTimeObj allocWithZone:](FigTimeObj, "allocWithZone:", a3);
  time = self->_time;
  return -[FigTimeObj initWithCMTime:](v4, "initWithCMTime:", &time);
}

- (int64_t)compareWithTime:(id)a3
{
  int32_t v3;
  CMTime v5;
  CMTime time1;

  time1 = (CMTime)self->_time;
  v5 = *(CMTime *)((char *)a3 + 8);
  v3 = CMTimeCompare(&time1, &v5);
  if (v3 < 0)
    return -1;
  else
    return v3 != 0;
}

- (unint64_t)hash
{
  uint64_t timescale;

  timescale = self->_time.timescale;
  if ((_DWORD)timescale)
    return ((self->_time.value << 10) / timescale);
  else
    return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMTime *v7;
  CMTime *p_time2;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  int64_t v13;
  __int128 v14;
  uint64_t v15;
  CMTime time2;
  __int128 v17;
  int64_t epoch;
  uint64_t v19;
  uint64_t v20;

  if (self == a3)
    return 1;
  v19 = v3;
  v20 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = *(_OWORD *)&self->_time.value;
    epoch = self->_time.epoch;
    time2 = *(CMTime *)((char *)a3 + 8);
    v7 = (CMTime *)&v17;
    p_time2 = &time2;
    return CMTimeCompare(v7, p_time2) == 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !strcmp((const char *)objc_msgSend(a3, "objCType"), "{?=qiIq}"))
  {
    objc_msgSend(a3, "getValue:", &v14);
    v12 = *(_OWORD *)&self->_time.value;
    v13 = self->_time.epoch;
    v10 = v14;
    v11 = v15;
    v7 = (CMTime *)&v12;
    p_time2 = (CMTime *)&v10;
    return CMTimeCompare(v7, p_time2) == 0;
  }
  return 0;
}

+ (id)timeWithTime:(id *)a3
{
  id v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v6 = *a3;
  return (id)objc_msgSend(v4, "initWithCMTime:", &v6);
}

+ (BOOL)classIsAbstract
{
  return 0;
}

@end
