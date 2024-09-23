@implementation STStatusBarDataBoolImageEntry(Converter)

- (uint64_t)initFromData:()Converter type:imageName:maxLength:BOOLValue:
{
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v11 = *(unsigned __int8 *)(a3 + a4);
  v12 = (void *)objc_opt_class();
  v13 = v12;
  if (v11)
  {
    if (strnlen(a5, a6))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v13, "entryWithImageNamed:BOOLValue:", v14, a7);
    v15 = objc_claimAutoreleasedReturnValue();

    a1 = (void *)v14;
  }
  else
  {
    objc_msgSend(v12, "disabledEntry");
    v15 = objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

@end
