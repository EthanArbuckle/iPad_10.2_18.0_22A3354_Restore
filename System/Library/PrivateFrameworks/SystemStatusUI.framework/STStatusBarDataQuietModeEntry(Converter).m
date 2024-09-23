@implementation STStatusBarDataQuietModeEntry(Converter)

- (uint64_t)initFromData:()Converter type:focusName:maxFocusLength:imageName:maxImageLength:BOOLValue:
{
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v14 = *(unsigned __int8 *)(a3 + a4);
  v15 = (void *)objc_opt_class();
  v16 = v15;
  if (v14)
  {
    if (strnlen(a5, a6))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    if (strnlen(a7, a8))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v16, "entryWithFocusName:imageNamed:BOOLValue:", v17, v19, a9);
    v18 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "disabledEntry");
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = a1;
  }

  return v18;
}

@end
