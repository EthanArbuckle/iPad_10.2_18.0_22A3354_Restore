@implementation NSValue(_web_Extensions)

+ (uint64_t)_web_valueWithCGRect:()_web_Extensions
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
}

- (double)_web_CGRectValue
{
  double v2;

  objc_msgSend(a1, "getValue:", &v2);
  return v2;
}

@end
