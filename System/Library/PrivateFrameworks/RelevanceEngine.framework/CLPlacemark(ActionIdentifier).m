@implementation CLPlacemark(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  void *v1;
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "location");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "coordinate");
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "re_actionIdentifierHashValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "re_actionIdentifierHashValue") ^ v5;

  return v7;
}

@end
