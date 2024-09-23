@implementation NSValue(PXEdgeInsets)

- (double)PXEdgeInsetsValue
{
  _OWORD v2[2];

  v2[0] = PXEdgeInsetsNull;
  v2[1] = unk_24438BAE0;
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

+ (id)valueWithPXEdgeInsets:()PXEdgeInsets
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", v5, "{UIEdgeInsets=dddd}");
}

@end
