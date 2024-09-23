@implementation FigTimePairObj

- (FigTimePairObj)initWithFirst:(id *)a3 Second:(id *)a4
{
  __int128 v4;
  _OWORD v6[4];
  _BYTE v7[32];

  *(_QWORD *)v7 = a3->var3;
  v4 = *(_OWORD *)&a3->var0;
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v7[8] = *a4;
  v6[0] = v4;
  v6[1] = *(_OWORD *)v7;
  v6[2] = *(_OWORD *)&v7[16];
  v6[3] = v4;
  return -[FigTimePairObj initWithFigTimePair:](self, "initWithFigTimePair:", v6);
}

- (FigTimePairObj)initWithFigTimePair:(PC_CMTimePair *)a3
{
  FigTimePairObj *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigTimePairObj;
  result = -[FigTimePairObj init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->first.value;
    v6 = *(_OWORD *)&a3->first.epoch;
    *(_OWORD *)&result->_pair.second.timescale = *(_OWORD *)&a3->second.timescale;
    *(_OWORD *)&result->_pair.first.epoch = v6;
    *(_OWORD *)&result->_pair.first.value = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimePairObj)initWithCoder:(id)a3
{
  void *v5;
  void *v6;
  _OWORD v8[3];
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  _BYTE v12[32];

  v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("first"));
  if (v5)
  {
    objc_msgSend(v5, "time");
  }
  else
  {
    v9 = 0uLL;
    v10 = 0;
  }
  v11 = v9;
  *(_QWORD *)v12 = v10;
  v6 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("second"));
  if (v6)
  {
    objc_msgSend(v6, "time");
  }
  else
  {
    v9 = 0uLL;
    v10 = 0;
  }
  *(_OWORD *)&v12[8] = v9;
  *(_QWORD *)&v12[24] = v10;
  v8[0] = v11;
  v8[1] = *(_OWORD *)v12;
  v8[2] = *(_OWORD *)&v12[16];
  return -[FigTimePairObj initWithFigTimePair:](self, "initWithFigTimePair:", v8);
}

- (void)encodeWithCoder:(id)a3
{
  FigTimeObj *v5;
  FigTimeObj *v6;
  $95D729B680665BEAEFA1D6FCA8238556 second;
  __int128 v8;
  int64_t epoch;

  v5 = [FigTimeObj alloc];
  v8 = *(_OWORD *)&self->_pair.first.value;
  epoch = self->_pair.first.epoch;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithFigTime:](v5, "initWithFigTime:", &v8), CFSTR("first"));
  v6 = [FigTimeObj alloc];
  second = self->_pair.second;
  objc_msgSend(a3, "encodeObject:forKey:", -[FigTimeObj initWithFigTime:](v6, "initWithFigTime:", &second), CFSTR("second"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  FigTimePairObj *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = +[FigTimePairObj allocWithZone:](FigTimePairObj, "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_pair.first.epoch;
  v7[0] = *(_OWORD *)&self->_pair.first.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_pair.second.timescale;
  return -[FigTimePairObj initWithFigTimePair:](v4, "initWithFigTimePair:", v7);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)first
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)second
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (PC_CMTimePair)pair
{
  __int128 v3;

  v3 = *(_OWORD *)&self->second.value;
  *(_OWORD *)&retstr->first.value = *(_OWORD *)&self->first.timescale;
  *(_OWORD *)&retstr->first.epoch = v3;
  *(_OWORD *)&retstr->second.timescale = *(_OWORD *)&self->second.epoch;
  return self;
}

- (void)setFirst:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_pair.first.epoch = a3->var3;
  *(_OWORD *)&self->_pair.first.value = v3;
}

- (void)setSecond:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_pair.second.epoch = a3->var3;
  *(_OWORD *)&self->_pair.second.value = v3;
}

- (void)setPair:(PC_CMTimePair *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->first.value;
  v4 = *(_OWORD *)&a3->first.epoch;
  *(_OWORD *)&self->_pair.second.timescale = *(_OWORD *)&a3->second.timescale;
  *(_OWORD *)&self->_pair.first.epoch = v4;
  *(_OWORD *)&self->_pair.first.value = v3;
}

- (void)getValue:(PC_CMTimePair *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->_pair.first.value;
  v4 = *(_OWORD *)&self->_pair.second.timescale;
  *(_OWORD *)&a3->first.epoch = *(_OWORD *)&self->_pair.first.epoch;
  *(_OWORD *)&a3->second.timescale = v4;
  *(_OWORD *)&a3->first.value = v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v7;
  __int128 v8;
  CMTime *v9;
  CMTime *v10;
  _BYTE v12[24];
  _BYTE v13[32];
  CMTime time1;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[32];
  __int128 v19;
  _BYTE v20[32];
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  CMTime v25;
  $95D729B680665BEAEFA1D6FCA8238556 first;
  uint64_t v27;
  uint64_t v28;

  if (self == a3)
    return 1;
  v27 = v3;
  v28 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = *(_OWORD *)&self->_pair.first.epoch;
    v19 = *(_OWORD *)&self->_pair.first.value;
    *(_OWORD *)v20 = v7;
    *(_OWORD *)&v20[16] = *(_OWORD *)&self->_pair.second.timescale;
    v8 = *(_OWORD *)((char *)a3 + 24);
    v17 = *(_OWORD *)((char *)a3 + 8);
    *(_OWORD *)v18 = v8;
    *(_OWORD *)&v18[16] = *(_OWORD *)((char *)a3 + 40);
    time1 = (CMTime)self->_pair.first;
    first = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)a3 + 8);
    if (!CMTimeCompare(&time1, (CMTime *)&first))
    {
      v25 = *(CMTime *)&v20[8];
      v23 = *(_OWORD *)&v18[8];
      v24 = *(_QWORD *)&v18[24];
      v9 = &v25;
      v10 = (CMTime *)&v23;
      return CMTimeCompare(v9, v10) == 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !strcmp((const char *)objc_msgSend(a3, "objCType"), "{PC_CMTimePair={?=qiIq}{?=qiIq}}"))
    {
      objc_msgSend(a3, "getValue:", &time1);
      *(_OWORD *)v13 = *(_OWORD *)&self->_pair.first.epoch;
      *(_OWORD *)&v13[16] = *(_OWORD *)&self->_pair.second.timescale;
      *(_QWORD *)v12 = v15;
      *(_OWORD *)&v12[8] = v16;
      first = self->_pair.first;
      v25 = time1;
      if (!CMTimeCompare((CMTime *)&first, &v25))
      {
        v23 = *(_OWORD *)&v13[8];
        v24 = *(_QWORD *)&v13[24];
        v21 = *(_OWORD *)v12;
        v22 = *(_QWORD *)&v12[16];
        v9 = (CMTime *)&v23;
        v10 = (CMTime *)&v21;
        return CMTimeCompare(v9, v10) == 0;
      }
    }
  }
  return 0;
}

- (unint64_t)hash
{
  __int128 v3;
  int64_t epoch;

  v3 = *(_OWORD *)&self->_pair.first.value;
  epoch = self->_pair.first.epoch;
  return GetCMTimeHash((uint64_t)&v3);
}

+ (id)pairWithPair:(PC_CMTimePair *)a3
{
  FigTimePairObj *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = [FigTimePairObj alloc];
  v5 = *(_OWORD *)&a3->first.epoch;
  v7[0] = *(_OWORD *)&a3->first.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->second.timescale;
  return -[FigTimePairObj initWithFigTimePair:](v4, "initWithFigTimePair:", v7);
}

@end
