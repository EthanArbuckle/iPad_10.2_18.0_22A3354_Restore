@implementation NSMutableData

- (void)appendByte:(unsigned __int8)a3
{
  unsigned __int8 v3;

  v3 = a3;
  -[NSMutableData appendBytes:length:](self, "appendBytes:length:", &v3, 1);
}

- (void)appendLittleInt16:(unsigned __int16)a3
{
  unsigned __int16 v3;

  v3 = a3;
  -[NSMutableData appendBytes:length:](self, "appendBytes:length:", &v3, 2);
}

- (void)appendLittleInt32:(unsigned int)a3
{
  unsigned int v3;

  v3 = a3;
  -[NSMutableData appendBytes:length:](self, "appendBytes:length:", &v3, 4);
}

@end
