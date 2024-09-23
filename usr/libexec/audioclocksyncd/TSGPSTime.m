@implementation TSGPSTime

- (TSGPSTime)initWithNanosecondsSinceEpoch:(unint64_t)a3
{
  TSGPSTime *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSGPSTime;
  result = -[TSGPSTime init](&v5, "init");
  if (result)
    result->_nanosecondsSinceEpoch = a3;
  return result;
}

- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 seconds:(double)a4
{
  return -[TSGPSTime initWithExtendedWeek:nanoseconds:](self, "initWithExtendedWeek:nanoseconds:", *(_QWORD *)&a3, (unint64_t)(a4 * 1000000000.0));
}

- (TSGPSTime)initWithExtendedWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4
{
  return -[TSGPSTime initWithNanosecondsSinceEpoch:](self, "initWithNanosecondsSinceEpoch:", a4 + 604800000000000 * a3);
}

- (TSGPSTime)initWithWeek:(unsigned int)a3 seconds:(double)a4 rollovers:(unsigned __int16)a5
{
  int v5;

  v5 = a5 << 10;
  if (a3 >= 0x400)
    v5 = 0;
  return -[TSGPSTime initWithExtendedWeek:seconds:](self, "initWithExtendedWeek:seconds:", v5 + a3, a4);
}

- (TSGPSTime)initWithWeek:(unsigned int)a3 nanoseconds:(unint64_t)a4 rollovers:(unsigned __int16)a5
{
  int v5;

  v5 = a5 << 10;
  if (a3 >= 0x400)
    v5 = 0;
  return -[TSGPSTime initWithExtendedWeek:nanoseconds:](self, "initWithExtendedWeek:nanoseconds:", v5 + a3, a4);
}

- (unsigned)extendedWeek
{
  return self->_nanosecondsSinceEpoch / 0x2260FF9290000;
}

- (unsigned)week
{
  return (unsigned __int16)-[TSGPSTime extendedWeek](self, "extendedWeek") & 0x3FF;
}

- (double)seconds
{
  return (double)-[TSGPSTime nanoseconds](self, "nanoseconds") / 1000000000.0;
}

- (unint64_t)nanoseconds
{
  return self->_nanosecondsSinceEpoch % 0x2260FF9290000;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_nanosecondsSinceEpoch;
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
    || -[TSGPSTime isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(v4)))
  {
    v5 = -[TSGPSTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
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
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSGPSTime extendedWeek](self, "extendedWeek");
  -[TSGPSTime seconds](self, "seconds");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GPS Time week %u seconds %0.9f"), v3, v4);
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

@end
