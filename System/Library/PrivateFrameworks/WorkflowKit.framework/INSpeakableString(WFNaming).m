@implementation INSpeakableString(WFNaming)

- (id)wfName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "spokenPhrase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  WFAbbreviatedNameFromText();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
