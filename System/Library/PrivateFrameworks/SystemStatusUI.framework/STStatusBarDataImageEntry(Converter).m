@implementation STStatusBarDataImageEntry(Converter)

- (uint64_t)initFromData:()Converter type:imageName:maxLength:
{
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v9 = *(unsigned __int8 *)(a3 + a4);
  v10 = (void *)objc_opt_class();
  v11 = v10;
  if (v9)
  {
    if (strnlen(a5, a6))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v11, "entryWithImageNamed:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    a1 = (void *)v12;
  }
  else
  {
    objc_msgSend(v10, "disabledEntry");
    v13 = objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end
