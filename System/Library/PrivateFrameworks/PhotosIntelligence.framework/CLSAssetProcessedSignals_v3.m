@implementation CLSAssetProcessedSignals_v3

- (BOOL)isRecallinglyNSFWExplicit
{
  return *((_BYTE *)self + 8) & 1;
}

- (void)setIsRecallinglyNSFWExplicit:(BOOL)a3
{
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFE | a3;
}

- (BOOL)isPreciselyNSFWExplicit
{
  return (*((unsigned __int8 *)self + 8) >> 1) & 1;
}

- (void)setIsPreciselyNSFWExplicit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFD | v3;
}

- (BOOL)isNSFWExplicit
{
  return (*((unsigned __int8 *)self + 8) >> 2) & 1;
}

- (void)setIsNSFWExplicit:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 8) = *((_BYTE *)self + 8) & 0xFB | v3;
}

@end
