@implementation TSUMaxTextureSize

uint64_t __TSUMaxTextureSize_block_invoke()
{
  uint64_t result;
  double v1;

  result = TSUPadIsFirstGen();
  v1 = 4096.0;
  if ((_DWORD)result)
    v1 = 2048.0;
  TSUMaxTextureSize_s_maxTextureSize = *(_QWORD *)&v1;
  return result;
}

@end
