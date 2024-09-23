@implementation CLSAssetProcessedSignals_v5

- (BOOL)isShowcasingFood
{
  return *((_BYTE *)&self->super.super + 10);
}

- (void)setIsShowcasingFood:(BOOL)a3
{
  *((_BYTE *)&self->super.super + 10) = a3;
}

@end
