@implementation NSData

- (NSString)byteString
{
  void *v3;
  NSData *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v4 = objc_retainAutorelease(self);
  v5 = -[NSData bytes](v4, "bytes");
  if (-[NSData length](v4, "length"))
  {
    v6 = 0;
    do
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), v5[v6++]);
    while (v6 < -[NSData length](v4, "length"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v3));

  return (NSString *)v7;
}

@end
