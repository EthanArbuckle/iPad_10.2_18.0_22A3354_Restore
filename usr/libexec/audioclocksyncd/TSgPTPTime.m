@implementation TSgPTPTime

- (TSgPTPTime)init
{
  TSgPTPTime *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSgPTPTime;
  result = -[TSgPTPTime init](&v3, "init");
  if (result)
    result->_grandmasterIdentity = -1;
  return result;
}

- (TSgPTPTime)initWithSeconds:(unint64_t)a3 nanoseconds:(unsigned int)a4 onGrandmaster:(unint64_t)a5 withLocalPortNumber:(unsigned __int16)a6 ptpTimescale:(BOOL)a7 timeTraceable:(BOOL)a8 frequencyTraceable:(BOOL)a9
{
  return -[TSgPTPTime initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:](self, "initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:", 1000000000 * a3 + a4, a5, a6, a7, a8, a9);
}

- (TSgPTPTime)initWithNanosecondsSinceEpoch:(unint64_t)a3 onGrandmaster:(unint64_t)a4 withLocalPortNumber:(unsigned __int16)a5 ptpTimescale:(BOOL)a6 timeTraceable:(BOOL)a7 frequencyTraceable:(BOOL)a8
{
  TSgPTPTime *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSgPTPTime;
  result = -[TSgPTPTime init](&v15, "init");
  if (result)
  {
    result->_nanosecondsSinceEpoch = a3;
    result->_grandmasterIdentity = a4;
    result->_localPortNumber = a5;
    result->_ptpTimescale = a6;
    result->_timeTraceable = a7;
    result->_frequencyTraceable = a8;
  }
  return result;
}

- (unint64_t)seconds
{
  return self->_nanosecondsSinceEpoch / 0x3B9ACA00;
}

- (unsigned)nanoseconds
{
  return self->_nanosecondsSinceEpoch % 0x3B9ACA00;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_nanosecondsSinceEpoch;
  *((_QWORD *)result + 3) = self->_grandmasterIdentity;
  *((_WORD *)result + 6) = self->_localPortNumber;
  *((_BYTE *)result + 8) = self->_ptpTimescale;
  *((_BYTE *)result + 9) = self->_timeTraceable;
  *((_BYTE *)result + 10) = self->_frequencyTraceable;
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
    || -[TSgPTPTime isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class(v4)))
  {
    v5 = -[TSgPTPTime nanosecondsSinceEpoch](self, "nanosecondsSinceEpoch");
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
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = -[TSgPTPTime seconds](self, "seconds");
  v4 = -[TSgPTPTime nanoseconds](self, "nanoseconds");
  v5 = -[TSgPTPTime grandmasterIdentity](self, "grandmasterIdentity");
  v6 = -[TSgPTPTime localPortNumber](self, "localPortNumber");
  if (-[TSgPTPTime isPTPTimescale](self, "isPTPTimescale"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[TSgPTPTime isTimeTraceable](self, "isTimeTraceable"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[TSgPTPTime isFrequencyTraceable](self, "isFrequencyTraceable"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gPTP Time %llu.%09u GM 0x%016llx.%hu PTP timescale:%@ time traceable:%@ frequency traceable:%@"), v3, v4, v5, v6, v7, v8, v9);
}

- (unint64_t)nanosecondsSinceEpoch
{
  return self->_nanosecondsSinceEpoch;
}

- (unint64_t)grandmasterIdentity
{
  return self->_grandmasterIdentity;
}

- (unsigned)localPortNumber
{
  return self->_localPortNumber;
}

- (BOOL)isPTPTimescale
{
  return self->_ptpTimescale;
}

- (BOOL)isTimeTraceable
{
  return self->_timeTraceable;
}

- (BOOL)isFrequencyTraceable
{
  return self->_frequencyTraceable;
}

@end
