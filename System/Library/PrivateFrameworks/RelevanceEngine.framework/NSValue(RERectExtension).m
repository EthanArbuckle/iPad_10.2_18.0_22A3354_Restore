@implementation NSValue(RERectExtension)

+ (id)re_valueWithCGRect:()RERectExtension
{
  _QWORD v6[4];

  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  objc_msgSend(a1, "value:withObjCType:", v6, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)re_CGRectValue
{
  __int128 v1;
  _OWORD v3[2];

  v1 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v3[0] = *MEMORY[0x24BDBF090];
  v3[1] = v1;
  objc_msgSend(a1, "getValue:size:", v3, 32);
  return *(double *)v3;
}

@end
