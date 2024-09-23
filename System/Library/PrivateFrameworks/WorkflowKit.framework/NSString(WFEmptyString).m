@implementation NSString(WFEmptyString)

- (BOOL)wf_isEmpty
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "wf_trimmedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length") == 0;

  return v2;
}

- (id)wf_trimmedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
