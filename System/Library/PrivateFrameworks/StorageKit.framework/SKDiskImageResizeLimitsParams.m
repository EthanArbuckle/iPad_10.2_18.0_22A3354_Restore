@implementation SKDiskImageResizeLimitsParams

- (SKDiskImageResizeLimitsParams)init
{
  SKDiskImageResizeLimitsParams *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKDiskImageResizeLimitsParams;
  result = -[SKDiskImageResizeLimitsParams init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_stdinPassPhrase = 0;
  return result;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (BOOL)shallow
{
  return self->_shallow;
}

- (void)setShallow:(BOOL)a3
{
  self->_shallow = a3;
}

@end
