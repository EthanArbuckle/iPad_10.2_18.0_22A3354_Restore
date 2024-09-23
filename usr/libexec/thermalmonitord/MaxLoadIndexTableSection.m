@implementation MaxLoadIndexTableSection

- (unint64_t)getReleaseMaxLI:(BOOL)a3 releaseRate:(int)a4
{
  unint64_t maxLI;

  if (a4 == 999)
  {
    maxLI = self->_maxLI;
  }
  else
  {
    maxLI = self->_releaseMaxLI;
    if (!a3)
      maxLI += a4;
    if (maxLI >= self->_maxLI)
      maxLI = self->_maxLI;
  }
  self->_releaseMaxLI = maxLI;
  return maxLI;
}

- (unint64_t)getMaxLI:(unint64_t)a3
{
  unint64_t constantMaxLI;

  constantMaxLI = self->_constantMaxLI;
  self->_maxLI = constantMaxLI;
  return constantMaxLI;
}

- (MaxLoadIndexTableSection)initWithConstantMaxLI:(unint64_t)a3
{
  MaxLoadIndexTableSection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MaxLoadIndexTableSection;
  result = -[MaxLoadIndexTableSection init](&v5, "init");
  if (result)
  {
    result->_constantMaxLI = a3;
    result->_releaseMaxLI = a3;
    result->_releaseRate = 0;
  }
  return result;
}

- (MaxLoadIndexTableSection)init
{
  return -[MaxLoadIndexTableSection initWithConstantMaxLI:](self, "initWithConstantMaxLI:", 101);
}

@end
