@implementation STStatusBarDataStringEntry(Converter)

- (uint64_t)initFromData:()Converter type:string:maxLength:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(a3 + a4) && strnlen(__s1, a6))
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __s1);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryWithStringValue:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    a1 = (void *)v9;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "disabledEntry");
    v10 = objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
