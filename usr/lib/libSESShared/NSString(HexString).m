@implementation NSString(HexString)

- (id)hexStringAsData
{
  id v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  char v8;
  char __str[2];
  __int16 v11;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", (unint64_t)objc_msgSend(v1, "length") >> 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if ((unint64_t)objc_msgSend(v1, "length") >= 2)
  {
    v4 = 0;
    v5 = 1;
    v6 = MEMORY[0x24BDAC740];
    while (1)
    {
      v7 = objc_msgSend(v1, "characterAtIndex:", v5 - 1);
      __str[0] = v7;
      v8 = objc_msgSend(v1, "characterAtIndex:", v5);
      __str[1] = v8;
      if ((v7 & 0x80) != 0)
        break;
      v3 = 0;
      if ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x10000) == 0 || v8 < 0)
        goto LABEL_11;
      if ((*(_DWORD *)(v6 + 4 * v8 + 60) & 0x10000) == 0)
        break;
      HIBYTE(v11) = strtol(__str, 0, 16);
      objc_msgSend(v2, "appendBytes:length:", (char *)&v11 + 1, 1);
      ++v4;
      v5 += 2;
      if (v4 >= (unint64_t)objc_msgSend(v1, "length") >> 1)
        goto LABEL_2;
    }
    v3 = 0;
  }
  else
  {
LABEL_2:
    v3 = v2;
  }
LABEL_11:

  return v3;
}

@end
