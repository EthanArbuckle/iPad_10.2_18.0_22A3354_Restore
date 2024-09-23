@implementation NSString(HexUtil)

- (id)numberFromHexDigits
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v6;

  v2 = (void *)objc_msgSend(a1, "length");
  if (v2)
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "scanHexLongLong:", &v6);

    v2 = 0;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

@end
