@implementation TSDMutableReflection

- (void)setOpacity:(double)a3
{
  double v4;

  TSUClamp();
  self->super.mOpacity = v4;
}

- (void)setFadeAcceleration:(double)a3
{
  self->super.mFadeAcceleration = a3;
}

@end
