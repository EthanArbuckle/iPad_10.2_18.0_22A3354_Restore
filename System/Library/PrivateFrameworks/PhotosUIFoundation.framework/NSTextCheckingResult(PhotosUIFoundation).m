@implementation NSTextCheckingResult(PhotosUIFoundation)

- (id)px_matchAtIndex:()PhotosUIFoundation forString:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = objc_msgSend(a1, "rangeAtIndex:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
