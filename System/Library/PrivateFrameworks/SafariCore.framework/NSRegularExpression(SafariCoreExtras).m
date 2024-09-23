@implementation NSRegularExpression(SafariCoreExtras)

+ (id)safari_escapedPatternForString:()SafariCoreExtras charactersToEscape:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v7);
    if (v9)
    {
      v10 = v8;
      v11 = v9;
      v12 = (id)objc_msgSend(v5, "mutableCopy");
      do
      {
        objc_msgSend(v12, "insertString:atIndex:", CFSTR("\\"), v10);
        v13 = v10 + v11;
        if (v13 + 1 >= (unint64_t)objc_msgSend(v12, "length"))
          break;
        v10 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v7, 0, v13 + 1, objc_msgSend(v12, "length") + ~v13);
        v11 = v14;
      }
      while (v14);
    }
    else
    {
      v12 = v5;
    }

  }
  else
  {
    v12 = v5;
  }

  return v12;
}

@end
