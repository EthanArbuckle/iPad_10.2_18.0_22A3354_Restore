@implementation SKDiskImageResizeParams

- (SKDiskImageResizeParams)initWithSize:(unint64_t)a3
{
  SKDiskImageResizeParams *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKDiskImageResizeParams;
  result = -[SKDiskImageResizeParams init](&v5, sel_init);
  if (result)
  {
    result->_size = (a3 + 4095) & 0xFFFFFFFFFFFFF000;
    *(_WORD *)&result->_stdinPassPhrase = 0;
  }
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
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
