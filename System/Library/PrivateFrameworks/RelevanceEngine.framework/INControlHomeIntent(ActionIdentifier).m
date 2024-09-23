@implementation INControlHomeIntent(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "userTask");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
  objc_msgSend(a1, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "re_actionIdentifierHashValue") ^ v3;

  return v5;
}

@end
