@implementation NSData

- (id)_reverse
{
  id v2;
  char *v3;
  char *v4;
  char *v5;
  BOOL v6;
  char *v7;
  char v8;
  id v10;

  v2 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithData:", self));
  v3 = (char *)objc_msgSend(v2, "mutableBytes");
  v4 = (char *)objc_msgSend(v2, "length");
  v5 = &v4[(_QWORD)v3 - 1];
  if (v4)
    v6 = v5 > v3;
  else
    v6 = 0;
  if (v6)
  {
    v7 = v3 + 1;
    do
    {
      v8 = *(v7 - 1);
      *(v7 - 1) = *v5;
      *v5-- = v8;
    }
    while (v7++ < v5);
  }
  v10 = objc_msgSend(objc_alloc((Class)NSData), "initWithData:", v2);

  return v10;
}

@end
