@implementation INObject(WFNaming)

- (id)wfName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "displayString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  WFAbbreviatedNameFromText();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
