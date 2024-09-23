@implementation NSString

- (void)writeToStdOut
{
  const char *v2;

  v2 = -[NSString UTF8String](objc_retainAutorelease(self), "UTF8String");
  fputs(v2, __stdoutp);
}

- (void)writeToStdErr
{
  const char *v2;

  v2 = -[NSString UTF8String](objc_retainAutorelease(self), "UTF8String");
  fputs(v2, __stderrp);
}

@end
