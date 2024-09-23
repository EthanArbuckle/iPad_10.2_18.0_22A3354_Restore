@implementation TSTime

+ (id)timeConverter
{
  if (timeConverter_onceToken != -1)
    dispatch_once(&timeConverter_onceToken, &__block_literal_global_8);
  return (id)_sharedTimeConverter;
}

void __23__TSTime_timeConverter__block_invoke()
{
  TSTimeConverter *v0;
  void *v1;

  v0 = objc_alloc_init(TSTimeConverter);
  v1 = (void *)_sharedTimeConverter;
  _sharedTimeConverter = (uint64_t)v0;

}

- (TSTime)init
{
  void *v3;
  TSTime *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TSTime initWithUTCDate:](self, "initWithUTCDate:", v3);

  return v4;
}

- (TSTime)initWithUTCDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TSTime *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "timeConverter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "taiDateFromUTCDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TSTime initWithTAIDate:](self, "initWithTAIDate:", v6);
  return v7;
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

  result = -[TSTime initWithNanosecondsSinceEpoch:](self, "initWithNanosecondsSinceEpoch:", objc_msgSend(a3, "nanosecondsSinceEpoch") + 315964819000000000);
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
      v5->_grandmasterIdentity = objc_msgSend(v4, "grandmasterIdentity");
      v5->_localPortNumber = objc_msgSend(v4, "localPortNumber");
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
  result = -[TSTime init](&v5, sel_init);
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
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "timeConverter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSTime taiDate](self, "taiDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "utcDateFromTAIDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (NSDate)taiDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)self->_nanosecondsSinceEpoch / 1000000000.0);
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
    v4 = (_QWORD *)-[TSTime copy](self, "copy");
    v4[4] += a3;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || -[TSTime isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
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
  void *v4;
  unint64_t v5;
  uint64_t v7;

  grandmasterIdentity = self->_grandmasterIdentity;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[TSTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
  if (grandmasterIdentity == -1)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("TAI Time %llu"), v5, v7);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("TAI Time %llu GM 0x%016llx"), v5, self->_grandmasterIdentity);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

@end
