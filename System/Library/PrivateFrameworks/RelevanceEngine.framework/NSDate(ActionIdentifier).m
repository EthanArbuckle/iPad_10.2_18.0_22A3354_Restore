@implementation NSDate(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  objc_msgSend(v1, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");

  return v3;
}

@end
