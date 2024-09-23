@implementation NSObject

- (id)mf_andOperations:(id)a3
{
  id v3;
  _CollectingInvocationTrampoline *v4;

  v3 = a3;
  v4 = -[_CollectingInvocationTrampoline initWithCollection:allMustMatch:]([_CollectingInvocationTrampoline alloc], "initWithCollection:allMustMatch:", v3, 1);

  return v4;
}

- (id)mf_orOperations:(id)a3
{
  id v3;
  _CollectingInvocationTrampoline *v4;

  v3 = a3;
  v4 = -[_CollectingInvocationTrampoline initWithCollection:allMustMatch:]([_CollectingInvocationTrampoline alloc], "initWithCollection:allMustMatch:", v3, 0);

  return v4;
}

@end
