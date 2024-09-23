@implementation NSString(RCAdditions)

- (uint64_t)rc_stringByReplacingBreakingWithNonBreakingSpaces
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
}

+ (uint64_t)rc_stringWithPersistentID:()RCAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), a3);
}

- (id)rc_reversedString
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__NSString_RCAdditions__rc_reversedString__block_invoke;
  v6[3] = &unk_1E769C930;
  v4 = v2;
  v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 258, v6);

  return v4;
}

- (id)rc_stringFromRealPath
{
  char *v1;
  char *v2;
  void *v3;

  v1 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
