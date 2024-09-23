@implementation PFAssertionPolicyAbort

- (void)notifyAssertion:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isFatal"))
    abort();

}

@end
