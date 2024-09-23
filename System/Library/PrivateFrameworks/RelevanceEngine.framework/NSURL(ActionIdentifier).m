@implementation NSURL(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "standardizedURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");

  return v3;
}

@end
