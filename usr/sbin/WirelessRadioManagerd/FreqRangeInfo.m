@implementation FreqRangeInfo

- (void)setFreqWithObj:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_FreqStart = (unint64_t)objc_msgSend(v4, "FreqStart");
  self->_FreqEnd = (unint64_t)objc_msgSend(v4, "FreqEnd");
  self->_centerFreq = (unint64_t)objc_msgSend(v4, "centerFreq");
  v5 = objc_msgSend(v4, "bw");

  self->_bw = (unint64_t)v5;
}

- (FreqRangeInfo)init
{
  FreqRangeInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FreqRangeInfo;
  result = -[FreqRangeInfo init](&v3, "init");
  *(_OWORD *)&result->_FreqStart = 0u;
  *(_OWORD *)&result->_centerFreq = 0u;
  result->_Priority = 255;
  return result;
}

- (unint64_t)bw
{
  return self->_bw;
}

- (FreqRangeInfo)initWithFreq:(unint64_t)a3 Bw:(unint64_t)a4
{
  FreqRangeInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FreqRangeInfo;
  result = -[FreqRangeInfo init](&v7, "init");
  result->_centerFreq = a3;
  result->_bw = a4;
  result->_FreqStart = a3 - (a4 >> 1);
  result->_FreqEnd = a3 + (a4 >> 1);
  result->_Priority = 255;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id centerFreq;
  id bw;
  BOOL v7;

  v4 = a3;
  centerFreq = (id)self->_centerFreq;
  v7 = 0;
  if (centerFreq == objc_msgSend(v4, "centerFreq"))
  {
    bw = (id)self->_bw;
    if (bw == objc_msgSend(v4, "bw"))
      v7 = 1;
  }

  return v7;
}

- (unint64_t)centerFreq
{
  return self->_centerFreq;
}

- (id)logPrint
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%lluHz, %lluHz]"), self->_centerFreq, self->_bw);
}

- (FreqRangeInfo)initWithStartFreq:(unint64_t)a3 EndFreq:(unint64_t)a4
{
  FreqRangeInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FreqRangeInfo;
  v6 = -[FreqRangeInfo init](&v8, "init");
  -[FreqRangeInfo setStartFreq:EndFreq:](v6, "setStartFreq:EndFreq:", a3, a4);
  v6->_Priority = 255;
  return v6;
}

- (void)setStartFreq:(unint64_t)a3 EndFreq:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;

  if (a4 >= a3)
    v4 = a3;
  else
    v4 = a4;
  if (a4 <= a3)
    v5 = a3;
  else
    v5 = a4;
  self->_FreqStart = v4;
  self->_FreqEnd = v5;
  self->_centerFreq = (a4 + a3) >> 1;
  self->_bw = v5 - v4;
}

- (unint64_t)FreqStart
{
  return self->_FreqStart;
}

- (unint64_t)FreqEnd
{
  return self->_FreqEnd;
}

- (void)applyBwLimitFromRight:(unint64_t)a3
{
  unint64_t FreqEnd;

  if (self->_bw > a3)
  {
    FreqEnd = self->_FreqEnd;
    self->_FreqStart = FreqEnd - a3;
    self->_centerFreq = (FreqEnd - a3 + FreqEnd) >> 1;
    self->_bw = a3;
  }
}

- (FreqRangeInfo)initWithObj:(id)a3
{
  id v3;
  FreqRangeInfo *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FreqRangeInfo;
  v3 = a3;
  v4 = -[FreqRangeInfo init](&v7, "init");
  v4->_FreqStart = (unint64_t)objc_msgSend(v3, "FreqStart", v7.receiver, v7.super_class);
  v4->_FreqEnd = (unint64_t)objc_msgSend(v3, "FreqEnd");
  v4->_centerFreq = (unint64_t)objc_msgSend(v3, "centerFreq");
  v5 = objc_msgSend(v3, "bw");

  v4->_bw = (unint64_t)v5;
  return v4;
}

- (void)setStartFreqOnly:(unint64_t)a3
{
  unint64_t FreqEnd;

  self->_FreqStart = a3;
  FreqEnd = self->_FreqEnd;
  self->_centerFreq = (FreqEnd + a3) >> 1;
  self->_bw = FreqEnd - a3;
}

- (void)setEndFreqOnly:(unint64_t)a3
{
  unint64_t FreqStart;

  FreqStart = self->_FreqStart;
  self->_FreqEnd = a3;
  self->_centerFreq = (FreqStart + a3) >> 1;
  self->_bw = a3 - FreqStart;
}

- (void)setFreq:(unint64_t)a3 Bw:(unint64_t)a4
{
  self->_centerFreq = a3;
  self->_bw = a4;
  self->_FreqStart = a3 - (a4 >> 1);
  self->_FreqEnd = a3 + (a4 >> 1);
}

- (void)setCenterFreqOnly:(unint64_t)a3
{
  unint64_t bw;

  bw = self->_bw;
  self->_FreqStart = a3 - (bw >> 1);
  self->_FreqEnd = a3 + (bw >> 1);
  self->_centerFreq = a3;
}

- (void)setBwOnly:(unint64_t)a3
{
  unint64_t centerFreq;

  self->_bw = a3;
  centerFreq = self->_centerFreq;
  self->_FreqStart = centerFreq - (a3 >> 1);
  self->_FreqEnd = centerFreq + (a3 >> 1);
}

- (void)applyBwLimitFromCenter:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (self->_bw > a3)
  {
    v3 = self->_FreqStart + self->_FreqEnd;
    v4 = (v3 - a3) >> 1;
    v5 = (v3 + a3) >> 1;
    self->_FreqStart = v4;
    self->_FreqEnd = v5;
    self->_centerFreq = (v4 + v5) >> 1;
    self->_bw = v5 - v4;
  }
}

- (unsigned)Priority
{
  return self->_Priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_Priority = a3;
}

@end
