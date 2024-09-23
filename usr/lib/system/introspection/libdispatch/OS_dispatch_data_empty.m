@implementation OS_dispatch_data_empty

- (unint64_t)retainCount
{
  return -1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &_dispatch_data_empty;
}

- (void)_getContext
{
  return 0;
}

@end
