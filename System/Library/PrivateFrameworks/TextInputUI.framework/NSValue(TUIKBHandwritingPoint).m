@implementation NSValue(TUIKBHandwritingPoint)

- (double)TUIKBHandwritingPointValue
{
  _QWORD v2[3];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

+ (id)valueWithTUIKBHandwritingPoint:()TUIKBHandwritingPoint
{
  _QWORD v5[3];

  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  objc_msgSend(a1, "valueWithBytes:objCType:", v5, "{?={CGPoint=dd}d}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
