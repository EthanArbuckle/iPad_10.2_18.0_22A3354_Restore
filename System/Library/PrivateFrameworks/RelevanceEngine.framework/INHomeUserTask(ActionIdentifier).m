@implementation INHomeUserTask(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = objc_msgSend(a1, "taskType");
  v3 = objc_msgSend(a1, "attribute") ^ v2;
  objc_msgSend(a1, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v4, "re_actionIdentifierHashValue");

  return v5;
}

@end
