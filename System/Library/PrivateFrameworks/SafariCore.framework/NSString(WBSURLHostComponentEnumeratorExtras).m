@implementation NSString(WBSURLHostComponentEnumeratorExtras)

- (WBSURLHostComponentEnumerator)safari_hostComponentsEnumerator
{
  return -[WBSURLHostComponentEnumerator initWithHost:options:]([WBSURLHostComponentEnumerator alloc], "initWithHost:options:", a1, 5);
}

- (WBSURLHostComponentEnumerator)safari_hostDomainsEnumerator
{
  return -[WBSURLHostComponentEnumerator initWithHost:options:]([WBSURLHostComponentEnumerator alloc], "initWithHost:options:", a1, 4);
}

@end
