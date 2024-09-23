@implementation CSCAStat

- (CSCAStat)init
{
  CSCAStat *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCAStat;
  result = -[CSCAStat init](&v3, "init");
  if (result)
  {
    *(_WORD *)&result->_userAge = 255;
    *(_OWORD *)&result->_mcc1 = xmmword_1002E5820;
  }
  return result;
}

- (char)userAge
{
  return self->_userAge;
}

- (void)setUserAge:(char)a3
{
  self->_userAge = a3;
}

- (unsigned)sex
{
  return self->_sex;
}

- (void)setSex:(unsigned __int8)a3
{
  self->_sex = a3;
}

- (signed)mcc1
{
  return self->_mcc1;
}

- (void)setMcc1:(signed __int16)a3
{
  self->_mcc1 = a3;
}

- (signed)mnc1
{
  return self->_mnc1;
}

- (void)setMnc1:(signed __int16)a3
{
  self->_mnc1 = a3;
}

- (signed)mcc2
{
  return self->_mcc2;
}

- (void)setMcc2:(signed __int16)a3
{
  self->_mcc2 = a3;
}

- (signed)mnc2
{
  return self->_mnc2;
}

- (void)setMnc2:(signed __int16)a3
{
  self->_mnc2 = a3;
}

- (unsigned)armedSec
{
  return self->_armedSec;
}

- (void)setArmedSec:(unsigned __int16)a3
{
  self->_armedSec = a3;
}

- (unsigned)armedSecMartyBicycle
{
  return self->_armedSecMartyBicycle;
}

- (void)setArmedSecMartyBicycle:(unsigned __int16)a3
{
  self->_armedSecMartyBicycle = a3;
}

- (unsigned)armedSecMartyLocal
{
  return self->_armedSecMartyLocal;
}

- (void)setArmedSecMartyLocal:(unsigned __int16)a3
{
  self->_armedSecMartyLocal = a3;
}

- (unsigned)armedSecMartyRemote
{
  return self->_armedSecMartyRemote;
}

- (void)setArmedSecMartyRemote:(unsigned __int16)a3
{
  self->_armedSecMartyRemote = a3;
}

@end
