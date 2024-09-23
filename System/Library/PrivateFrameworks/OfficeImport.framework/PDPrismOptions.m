@implementation PDPrismOptions

- (BOOL)isContent
{
  return *((_BYTE *)&self->super.mDirection + 4);
}

- (void)setIsContent:(BOOL)a3
{
  *((_BYTE *)&self->super.mDirection + 4) = a3;
}

- (BOOL)isInverted
{
  return *((_BYTE *)&self->super.mDirection + 5);
}

- (void)setIsInverted:(BOOL)a3
{
  *((_BYTE *)&self->super.mDirection + 5) = a3;
}

@end
