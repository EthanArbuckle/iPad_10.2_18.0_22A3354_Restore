@implementation NSError

- (BOOL)isFileExistsError
{
  NSString *v3;
  BOOL v4;

  v3 = -[NSError domain](self, "domain");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", NSPOSIXErrorDomain))
    v4 = (id)-[NSError code](self, "code") == (id)17;
  else
    v4 = 0;

  return v4;
}

@end
