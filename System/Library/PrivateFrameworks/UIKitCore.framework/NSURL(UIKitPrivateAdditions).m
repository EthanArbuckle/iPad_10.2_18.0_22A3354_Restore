@implementation NSURL(UIKitPrivateAdditions)

- (uint64_t)isInternalUIKitURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || (v3 = 1, objc_msgSend(v1, "compare:options:", CFSTR("doubletap"), 1)))
    v3 = 0;

  return v3;
}

@end
