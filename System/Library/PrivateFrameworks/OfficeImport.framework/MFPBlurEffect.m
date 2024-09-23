@implementation MFPBlurEffect

+ (id)GUID
{
  return CFSTR("633C80A4-1843-482B-9EF2-BE2834C5FDD4");
}

- (MFPBlurEffect)initWithRadius:(float)a3 expandEdge:(BOOL)a4
{
  MFPBlurEffect *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPBlurEffect;
  result = -[MFPBlurEffect init](&v7, sel_init);
  if (result)
  {
    result->mRadius = a3;
    result->mExpandEdge = a4;
  }
  return result;
}

@end
