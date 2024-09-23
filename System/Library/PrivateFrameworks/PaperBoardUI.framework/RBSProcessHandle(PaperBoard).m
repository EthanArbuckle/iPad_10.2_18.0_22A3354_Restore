@implementation RBSProcessHandle(PaperBoard)

- (id)pb_shortDesc
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("("));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "substringToIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%d"), v6, objc_msgSend(a1, "pid"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
