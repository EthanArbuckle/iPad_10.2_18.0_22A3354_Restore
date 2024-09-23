@implementation NSOperationQueue(RCAsyncBlockAdditions)

- (void)rc_addAsyncOperationWithBlock:()RCAsyncBlockAdditions
{
  id v2;

  +[RCAsyncBlockOperation asyncBlockOperationWithBlock:](RCAsyncBlockOperation, "asyncBlockOperationWithBlock:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addOperation:", v2);

}

@end
