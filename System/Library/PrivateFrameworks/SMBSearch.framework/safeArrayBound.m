@implementation safeArrayBound

- (safeArrayBound)initWithElements:(unsigned int)a3 LowBound:(unsigned int)a4
{
  safeArrayBound *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)safeArrayBound;
  result = -[safeArrayBound init](&v7, sel_init);
  if (result)
  {
    result->_cElements = a3;
    result->_lowBound = a4;
  }
  return result;
}

- (unsigned)cElements
{
  return self->_cElements;
}

- (void)setCElements:(unsigned int)a3
{
  self->_cElements = a3;
}

- (unsigned)lowBound
{
  return self->_lowBound;
}

- (void)setLowBound:(unsigned int)a3
{
  self->_lowBound = a3;
}

@end
