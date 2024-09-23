@implementation _PASProbablisticCrashesConfig

- (_PASProbablisticCrashesConfig)init
{
  _PASProbablisticCrashesConfig *v2;
  _PASProbablisticCrashesConfig *v3;
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PASProbablisticCrashesConfig;
  v2 = -[_PASProbablisticCrashesConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_oddsNumerator = 1;
    if (os_variant_has_internal_diagnostics())
      v4 = 1000;
    else
      v4 = 10000;
    v3->_oddsDenominator = v4;
    v3->_uniqueCallsiteWindowSize = 4;
  }
  return v3;
}

- (unsigned)oddsNumerator
{
  return self->_oddsNumerator;
}

- (void)setOddsNumerator:(unsigned int)a3
{
  self->_oddsNumerator = a3;
}

- (unsigned)oddsDenominator
{
  return self->_oddsDenominator;
}

- (void)setOddsDenominator:(unsigned int)a3
{
  self->_oddsDenominator = a3;
}

- (unsigned)uniqueCallsiteWindowSize
{
  return self->_uniqueCallsiteWindowSize;
}

- (void)setUniqueCallsiteWindowSize:(unsigned __int8)a3
{
  self->_uniqueCallsiteWindowSize = a3;
}

@end
