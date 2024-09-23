@implementation NSString(SiriPresentationIdentifier)

+ (__CFString)stringWithSiriPresentationIdentifier:()SiriPresentationIdentifier
{
  if (a3 < 5)
    return off_1E91FC810[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown siri presentation identifier : %li>"), a3);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)siriPresentationIdentifier
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v2 = 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
  {
    v2 = 2;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqualToString:", v5);

    if ((v6 & 1) == 0)
    {
      v2 = 3;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqualToString:", v7);

      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriPresentationIdentifier:", 4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "isEqualToString:", v9);

        if (v10)
          return 4;
        else
          return 3;
      }
    }
  }
  return v2;
}

@end
