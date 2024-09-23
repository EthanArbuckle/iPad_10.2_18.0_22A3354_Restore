@implementation CLPeopleDensityResult

- (CLPeopleDensityResult)initWithState:(int64_t)a3 confidence:(double)a4 observationInterval:(id)a5 additionalInfo:(id)a6
{
  CLPeopleDensityResult *v10;
  CLPeopleDensityResult *v11;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLPeopleDensityResult;
  v10 = -[CLPeopleDensityResult init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    if (a4 < 0.0 || a5 == 0)
    {
      return 0;
    }
    else
    {
      v10->_peopleDensityState = a3;
      v10->_confidence = a4;
      v10->_observationInterval = (NSDateInterval *)objc_msgSend(a5, "copy");
      if (a6)
        v11->_additionalInfo = (NSDictionary *)objc_msgSend(a6, "copy");
    }
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  NSDateInterval *v10;
  NSDictionary *v11;
  NSDictionary *v12;

  if (self == a3)
    goto LABEL_11;
  v5 = objc_opt_class(CLPeopleDensityResult, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0
    || (v6 = -[CLPeopleDensityResult peopleDensityState](self, "peopleDensityState"),
        v6 != objc_msgSend(a3, "peopleDensityState"))
    || (-[CLPeopleDensityResult confidence](self, "confidence"), v8 = v7, objc_msgSend(a3, "confidence"), v8 != v9))
  {
    LOBYTE(v11) = 0;
    return (char)v11;
  }
  v10 = -[CLPeopleDensityResult observationInterval](self, "observationInterval");
  if (v10 == objc_msgSend(a3, "observationInterval")
    || (LODWORD(v11) = -[NSDateInterval isEqual:](-[CLPeopleDensityResult observationInterval](self, "observationInterval"), "isEqual:", objc_msgSend(a3, "observationInterval")), (_DWORD)v11))
  {
    v12 = -[CLPeopleDensityResult additionalInfo](self, "additionalInfo");
    if (v12 != objc_msgSend(a3, "additionalInfo"))
    {
      v11 = -[CLPeopleDensityResult additionalInfo](self, "additionalInfo");
      if (v11)
        LOBYTE(v11) = -[NSDictionary isEqual:](-[CLPeopleDensityResult additionalInfo](self, "additionalInfo"), "isEqual:", objc_msgSend(a3, "additionalInfo"));
      return (char)v11;
    }
LABEL_11:
    LOBYTE(v11) = 1;
  }
  return (char)v11;
}

- (void)dealloc
{
  NSDictionary *additionalInfo;
  objc_super v4;

  additionalInfo = self->_additionalInfo;
  if (additionalInfo)

  v4.receiver = self;
  v4.super_class = (Class)CLPeopleDensityResult;
  -[CLPeopleDensityResult dealloc](&v4, "dealloc");
}

- (int64_t)peopleDensityState
{
  return self->_peopleDensityState;
}

- (void)setPeopleDensityState:(int64_t)a3
{
  self->_peopleDensityState = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (NSDateInterval)observationInterval
{
  return self->_observationInterval;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

@end
