@implementation NSString(ZWJ_Duplicate_Removal)

- (uint64_t)hasDoubleZWJ
{
  uint64_t result;
  unint64_t v3;
  int v4;
  int v5;
  int v6;
  BOOL v7;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v3 = 0;
    v4 = 0;
    while (1)
    {
      v5 = objc_msgSend(a1, "characterAtIndex:", v3);
      v6 = v5;
      v7 = v4 == 8205 && v5 == 8205;
      result = v7;
      if (v7)
        break;
      ++v3;
      v4 = v6;
      if (v3 >= objc_msgSend(a1, "length"))
        return 0;
    }
  }
  return result;
}

- (id)stringRemovingDoubleZWJ
{
  void *v2;
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = objc_msgSend(a1, "characterAtIndex:", v3);
      v6 = v5;
      if (v4 != 8205 || v5 != 8205)
        objc_msgSend(v2, "appendFormat:", CFSTR("%C"), v5);
      ++v3;
      v4 = v6;
    }
    while (v3 < objc_msgSend(a1, "length"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
