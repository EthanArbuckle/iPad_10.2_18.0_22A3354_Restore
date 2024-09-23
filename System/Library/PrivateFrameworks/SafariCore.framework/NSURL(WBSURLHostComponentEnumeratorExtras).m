@implementation NSURL(WBSURLHostComponentEnumeratorExtras)

- (id)safari_hostComponentsEnumerator
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  objc_msgSend(a1, "host");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = &stru_1E64A2498;
  -[__CFString safari_hostComponentsEnumerator](v1, "safari_hostComponentsEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)safari_hostDomainsEnumerator
{
  __CFString *v1;
  __CFString *v2;
  void *v3;

  objc_msgSend(a1, "host");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = &stru_1E64A2498;
  -[__CFString safari_hostDomainsEnumerator](v1, "safari_hostDomainsEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
