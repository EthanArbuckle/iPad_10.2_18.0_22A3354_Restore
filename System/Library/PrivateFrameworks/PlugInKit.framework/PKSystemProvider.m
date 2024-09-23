@implementation PKSystemProvider

- (void)exit:(int)a3
{
  exit(a3);
}

- (const)getenv:(const char *)a3
{
  return getenv(a3);
}

- (passwd)getpwuid:(unsigned int)a3
{
  return getpwuid(a3);
}

- (int)access:(const char *)a3 amode:(int)a4
{
  return access(a3, a4);
}

@end
