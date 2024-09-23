@implementation TSTLayoutUpdateTransformToCanvas

uint64_t __TSTLayoutUpdateTransformToCanvas_block_invoke(_OWORD *a1, void *a2)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = a1[3];
  v4[0] = a1[2];
  v4[1] = v2;
  v4[2] = a1[4];
  objc_msgSend(a2, "setTransformToCanvas:", v4);
  return 0;
}

@end
