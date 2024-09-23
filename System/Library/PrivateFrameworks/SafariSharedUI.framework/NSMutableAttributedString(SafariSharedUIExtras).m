@implementation NSMutableAttributedString(SafariSharedUIExtras)

- (BOOL)safari_replaceOccurrenceOfString:()SafariSharedUIExtras withString:link:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(a1, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "rangeOfString:", v10);
  v14 = v13;

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0CEA0C0], v9, v12, v14);
    objc_msgSend(a1, "replaceCharactersInRange:withString:", v12, v14, v8);
  }

  return v12 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
