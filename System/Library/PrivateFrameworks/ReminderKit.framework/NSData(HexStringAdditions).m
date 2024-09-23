@implementation NSData(HexStringAdditions)

+ (id)rem_dataWithHexString:()HexStringAdditions
{
  id v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  unsigned int v12;
  int v13;
  __int16 v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (v4 + 1) >> 1);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "mutableBytes");
  v7 = v4;
  if (v4)
  {
    v8 = v6;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    do
    {
      v13 = objc_msgSend(v3, "characterAtIndex:", v9);
      v14 = v13 - 48;
      if ((v13 - 48) <= 0x36 && ((0x7E0000007E03FFuLL >> v14) & 1) != 0)
      {
        ++v11;
        v10 = v13 + word_1B4B743F8[v14] + 16 * v10;
        if ((v11 & 1) == 0)
        {
          *(_BYTE *)(v8 + v12++) = v10;
          v10 = 0;
        }
      }
      ++v9;
    }
    while (v7 != v9);
    if ((v11 & 1) != 0)
      *(_BYTE *)(v8 + v12++) = v10;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v5, "setLength:", v12);

  return v5;
}

@end
