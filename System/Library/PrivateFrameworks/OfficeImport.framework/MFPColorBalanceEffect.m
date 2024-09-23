@implementation MFPColorBalanceEffect

+ (id)GUID
{
  return CFSTR("537E597D-251E-48DA-9664-29CA496B70F8");
}

- (MFPColorBalanceEffect)initWithCyanRed:(int)a3 magentaGreen:(int)a4 yellowBlue:(int)a5
{
  MFPColorBalanceEffect *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFPColorBalanceEffect;
  result = -[MFPColorBalanceEffect init](&v9, sel_init);
  if (result)
  {
    result->mCyanRed = a3;
    result->mMagentaGreen = a4;
    result->mYellowBlue = a5;
  }
  return result;
}

@end
