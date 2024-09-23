@implementation TSTime

+ (id)timeConverter
{
  if (qword_100047C50 != -1)
    dispatch_once(&qword_100047C50, &stru_10003C7B0);
  return (id)qword_100047C48;
}

- (TSTime)init
{
  void *v3;
  TSTime *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = -[TSTime initWithUTCDate:](self, "initWithUTCDate:", v3);

  return v4;
}

- (TSTime)initWithUTCDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  TSTime *v8;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "timeConverter");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taiDateFromUTCDate:", v4));

  v8 = -[TSTime initWithTAIDate:](self, "initWithTAIDate:", v7);
  return v8;
}

- (TSTime)initWithTAIDate:(id)a3
{
  id v4;
  double v5;
  TSTime *v6;
  TSTime *v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = -[TSTime initWithNanosecondsSinceEpoch:](self, "initWithNanosecondsSinceEpoch:", (unint64_t)(v5 * 1000000000.0));
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_timeTraceable = 257;
    objc_msgSend(v4, "timeIntervalSince1970");
    if (v8 < 0.0)
    {

      v7 = 0;
    }
  }

  return v7;
}

- (TSTime)initWithGPSTime:(id)a3
{
  TSTime *result;

  result = -[TSTime initWithNanosecondsSinceEpoch:](self, "initWithNanosecondsSinceEpoch:", (char *)objc_msgSend(a3, "nanosecondsSinceEpoch") + 315964819000000000);
  if (result)
    *(_WORD *)&result->_timeTraceable = 257;
  return result;
}

- (TSTime)initWithgPTPTime:(id)a3
{
  id v4;
  TSTime *v5;

  v4 = a3;
  v5 = -[TSTime initWithNanosecondsSinceEpoch:](self, "initWithNanosecondsSinceEpoch:", objc_msgSend(v4, "nanosecondsSinceEpoch"));
  if (v5)
  {
    if (objc_msgSend(v4, "isTimeTraceable")
      && objc_msgSend(v4, "isPTPTimescale")
      && objc_msgSend(v4, "isFrequencyTraceable"))
    {
      v5->_grandmasterIdentity = (unint64_t)objc_msgSend(v4, "grandmasterIdentity");
      v5->_localPortNumber = (unsigned __int16)objc_msgSend(v4, "localPortNumber");
      v5->_frequencyTraceable = objc_msgSend(v4, "isFrequencyTraceable");
      v5->_timeTraceable = objc_msgSend(v4, "isTimeTraceable");
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (TSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3
{
  TSTime *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSTime;
  result = -[TSTime init](&v5, "init");
  if (result)
  {
    result->_nanosecondsSinceEpoch = a3;
    result->_grandmasterIdentity = -1;
    result->_localPortNumber = 0;
  }
  return result;
}

- (NSDate)utcDate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend((id)objc_opt_class(self), "timeConverter");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSTime taiDate](self, "taiDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "utcDateFromTAIDate:", v5));

  return (NSDate *)v6;
}

- (NSDate)taiDate
{
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)self->_nanosecondsSinceEpoch / 1000000000.0);
}

- (TSGPSTime)gpsTime
{
  TSGPSTime *v2;

  if (self->_nanosecondsSinceEpoch < 0x46288542E03FE00)
    v2 = 0;
  else
    v2 = -[TSGPSTime initWithNanosecondsSinceEpoch:]([TSGPSTime alloc], "initWithNanosecondsSinceEpoch:", self->_nanosecondsSinceEpoch - 315964819000000000);
  return v2;
}

- (TSgPTPTime)gPTPTime
{
  return -[TSgPTPTime initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:]([TSgPTPTime alloc], "initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:", self->_nanosecondsSinceEpoch, self->_grandmasterIdentity, self->_localPortNumber, 1, self->_timeTraceable, self->_frequencyTraceable);
}

- (int64_t)nanosecondsSinceTime:(id)a3
{
  return self->_nanosecondsSinceEpoch - *((_QWORD *)a3 + 4);
}

- (id)timeByAddingNanoseconds:(int64_t)a3
{
  _QWORD *v4;

  if (a3 < 0 && self->_nanosecondsSinceEpoch < a3)
  {
    v4 = 0;
  }
  else
  {
    v4 = -[TSTime copy](self, "copy");
    v4[4] += a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 4) = self->_nanosecondsSinceEpoch;
  *((_QWORD *)result + 2) = self->_grandmasterIdentity;
  *((_BYTE *)result + 8) = self->_initedWithgPTP;
  return result;
}

- (unint64_t)hash
{
  return self->_nanosecondsSinceEpoch;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)) & 1) != 0
    || -[TSTime isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(v4)))
  {
    v5 = -[TSTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
    v6 = v5 == objc_msgSend(v4, "nanosecondsSinceEpoch");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  unint64_t grandmasterIdentity;
  unint64_t v4;
  NSString *v5;
  uint64_t v7;

  grandmasterIdentity = self->_grandmasterIdentity;
  v4 = -[TSTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
  if (grandmasterIdentity == -1)
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TAI Time %llu"), v4, v7);
  else
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TAI Time %llu GM 0x%016llx"), v4, self->_grandmasterIdentity);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

@end
