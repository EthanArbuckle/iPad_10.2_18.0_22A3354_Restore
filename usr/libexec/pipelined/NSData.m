@implementation NSData

- (BOOL)ps_containsString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));
    LOBYTE(self) = -[NSData rangeOfData:options:range:](self, "rangeOfData:options:range:", v6, 0, 0, -[NSData length](self, "length")) != (id)0x7FFFFFFFFFFFFFFFLL;

  }
  return (char)self;
}

@end
