@implementation NSValue(WFCoreGraphicsSupport)

+ (id)wf_valueWithCGAffineTransform:()WFCoreGraphicsSupport
{
  __int128 v3;
  _OWORD v5[3];

  v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  objc_msgSend(a1, "valueWithCGAffineTransform:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
