@implementation CNDescriptionBuilder(CNVCardOptions)

- (id)appendName:()CNVCardOptions vCardOutputVersionValue:
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  if (a4 == 2)
  {
    v7 = CFSTR(".30");
  }
  else if (a4 == 1)
  {
    v7 = CFSTR(".21");
  }
  else
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("unknown (%@)"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "appendName:object:", v6, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v7 = CFSTR(".latest");
  }
  objc_msgSend(a1, "appendName:object:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v8;
}

@end
