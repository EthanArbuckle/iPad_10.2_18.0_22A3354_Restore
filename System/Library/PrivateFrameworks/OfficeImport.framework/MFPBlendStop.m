@implementation MFPBlendStop

- (MFPBlendStop)initWithFactor:(float)a3 position:(float)a4
{
  MFPBlendStop *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPBlendStop;
  result = -[MFPBlendStop init](&v7, sel_init);
  if (result)
  {
    result->mFactor = a3;
    result->mPosition = a4;
  }
  return result;
}

- (float)factor
{
  return self->mFactor;
}

- (float)position
{
  return self->mPosition;
}

@end
