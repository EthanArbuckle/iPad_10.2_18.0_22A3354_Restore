@implementation INSpeakableString(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "spokenPhrase");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "re_actionIdentifierHashValue");

  return v2;
}

@end
