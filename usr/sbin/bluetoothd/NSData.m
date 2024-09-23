@implementation NSData

- (id)sha256
{
  NSData *v2;
  unsigned __int8 *v3;
  _OWORD v5[2];

  memset(v5, 0, sizeof(v5));
  v2 = objc_retainAutorelease(self);
  v3 = CC_SHA256(-[NSData bytes](v2, "bytes", 0, 0, 0, 0), (CC_LONG)-[NSData length](v2, "length"), (unsigned __int8 *)v5);
  if (v3)
    v3 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5, 32));
  return v3;
}

@end
