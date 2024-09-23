@implementation CRTextDetectorModelV3Input

- (CRTextDetectorModelV3Input)initWithImg_input:(__CVBuffer *)a3
{
  if (self)
    self->_img_input = a3;
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F788);
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("img_input")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithPixelBuffer:", self->_img_input);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)img_input
{
  return self->_img_input;
}

- (void)setImg_input:(__CVBuffer *)a3
{
  self->_img_input = a3;
}

@end
