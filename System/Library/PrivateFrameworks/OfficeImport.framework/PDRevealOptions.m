@implementation PDRevealOptions

- (BOOL)isThroughBlack
{
  return *((_BYTE *)&self->super.mDirection + 4);
}

- (void)setIsThroughBlack:(BOOL)a3
{
  *((_BYTE *)&self->super.mDirection + 4) = a3;
}

@end
