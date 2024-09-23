@implementation CLSAssetProcessedSignals_v4

- (BOOL)isVeryPreciselyIVSNSFWExplicit
{
  return *((_BYTE *)&self->super + 9) & 1;
}

- (void)setIsVeryPreciselyIVSNSFWExplicit:(BOOL)a3
{
  *((_BYTE *)&self->super + 9) = *((_BYTE *)&self->super + 9) & 0xFE | a3;
}

@end
