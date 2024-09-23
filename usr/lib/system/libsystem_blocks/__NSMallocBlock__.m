@implementation __NSMallocBlock__

- (__NSMallocBlock__)retain
{
  _Block_copy(self);
  return self;
}

- (unint64_t)retainCount
{
  return 1;
}

@end
