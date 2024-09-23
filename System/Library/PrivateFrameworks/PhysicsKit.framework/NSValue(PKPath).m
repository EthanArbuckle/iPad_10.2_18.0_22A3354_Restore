@implementation NSValue(PKPath)

+ (id)valueWithCGPoint:()PKPath
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)CGPointValue
{
  double v2;

  objc_msgSend(a1, "getValue:", &v2);
  return v2;
}

@end
