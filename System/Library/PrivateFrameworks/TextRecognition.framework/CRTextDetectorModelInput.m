@implementation CRTextDetectorModelInput

- (CRTextDetectorModelInput)initWithData:(__CVBuffer *)a3
{
  if (self)
    self->_data = a3;
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993CF50);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("data")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", self->_data);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)data
{
  return self->_data;
}

- (void)setData:(__CVBuffer *)a3
{
  self->_data = a3;
}

@end
