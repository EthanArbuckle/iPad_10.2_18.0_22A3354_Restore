@implementation NSValue(PUPerspectiveTransform)

- (double)pu_PUPerspectiveTransformValue
{
  _OWORD v2[2];
  int v3;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

+ (id)pu_valueWithPUPerspectiveTransform:()PUPerspectiveTransform
{
  _OWORD v5[2];
  unsigned __int32 v6;

  a2.n128_u32[3] = a3.i32[0];
  v5[0] = a2;
  v5[1] = vextq_s8(vextq_s8(a3, a3, 0xCuLL), a4, 8uLL);
  v6 = a4.u32[2];
  objc_msgSend(a1, "valueWithBytes:objCType:", v5, "{PUBoxablePerspectiveTransform=fffffffff}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
