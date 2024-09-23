@implementation CLKUIPrimaryGamutMatrix

__n128 __CLKUIPrimaryGamutMatrix_block_invoke()
{
  __int128 v0;
  __n128 result;

  v0 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  CLKUIPrimaryGamutMatrix_p3ToNativeMatrix = *MEMORY[0x1E0C83FE8];
  unk_1EEE78E40 = v0;
  result = *(__n128 *)(MEMORY[0x1E0C83FE8] + 32);
  xmmword_1EEE78E50 = (__int128)result;
  return result;
}

@end
