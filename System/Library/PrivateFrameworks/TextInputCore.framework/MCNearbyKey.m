@implementation MCNearbyKey

- (MCNearbyKey)initWithCharacter:(unsigned __int16)a3 logLikelihood:(float)a4
{
  MCNearbyKey *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCNearbyKey;
  result = -[MCNearbyKey init](&v7, sel_init);
  if (result)
  {
    result->_character = a3;
    result->_logLikelihood = a4;
  }
  return result;
}

- (unsigned)character
{
  return self->_character;
}

- (float)logLikelihood
{
  return self->_logLikelihood;
}

+ (unint64_t)maxNearbyKeysCountDefault
{
  return 10;
}

@end
