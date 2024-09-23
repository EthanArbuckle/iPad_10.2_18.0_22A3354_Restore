@implementation NSString(SBPasscodeLockEntryFieldExtras)

- (uint64_t)isSingleCharacterAndMemberOfSet:()SBPasscodeLockEntryFieldExtras
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a1, "length") == 1)
    v5 = objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", 0));
  else
    v5 = 0;

  return v5;
}

- (uint64_t)isNewline
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isSingleCharacterAndMemberOfSet:", v2);

  return v3;
}

@end
