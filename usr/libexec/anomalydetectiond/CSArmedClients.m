@implementation CSArmedClients

- (CSArmedClients)init
{
  CSArmedClients *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSArmedClients;
  result = -[CSArmedClients init](&v3, "init");
  if (result)
    *(_OWORD *)&result->_kappaArmedSeconds = xmmword_1002E5830;
  return result;
}

- (int)kappaArmedSeconds
{
  return self->_kappaArmedSeconds;
}

- (void)setKappaArmedSeconds:(int)a3
{
  self->_kappaArmedSeconds = a3;
}

- (int)martyArmedSecondsLocal
{
  return self->_martyArmedSecondsLocal;
}

- (void)setMartyArmedSecondsLocal:(int)a3
{
  self->_martyArmedSecondsLocal = a3;
}

- (int)martyArmedSecondsRemote
{
  return self->_martyArmedSecondsRemote;
}

- (void)setMartyArmedSecondsRemote:(int)a3
{
  self->_martyArmedSecondsRemote = a3;
}

- (int)enableMode
{
  return self->_enableMode;
}

- (void)setEnableMode:(int)a3
{
  self->_enableMode = a3;
}

@end
