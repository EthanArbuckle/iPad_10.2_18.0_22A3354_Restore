@implementation NSString(WFRanges)

- (id)allRangesOfString:()WFRanges options:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, 0, objc_msgSend(a1, "length"));
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    v11 = v9;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      v10 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, v10 + v11, objc_msgSend(a1, "length") - (v10 + v11));
      v11 = v13;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v7;
}

@end
