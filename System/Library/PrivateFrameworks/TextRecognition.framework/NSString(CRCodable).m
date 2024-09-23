@implementation NSString(CRCodable)

- (uint64_t)crCodableDataRepresentation
{
  return objc_msgSend(a1, "dataUsingEncoding:", 4);
}

- (id)initWithCRCodableDataRepresentation:()CRCodable
{
  id v3;

  if (a3)
  {
    a1 = (id)objc_msgSend(a1, "initWithData:encoding:", a3, 4);
    v3 = a1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
