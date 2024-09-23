@implementation NSData(Numeric)

- (uint64_t)NF_isZeroed
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  _BOOL8 v5;

  if (!objc_msgSend(a1, "length"))
    return 1;
  v2 = objc_retainAutorelease(a1);
  v3 = objc_msgSend(v2, "bytes");
  if (!objc_msgSend(v2, "length"))
    return 1;
  v4 = 0;
  do
  {
    v5 = *(_BYTE *)(v3 + v4) == 0;
    if (*(_BYTE *)(v3 + v4))
      break;
    ++v4;
  }
  while (v4 < objc_msgSend(v2, "length"));
  return v5;
}

- (uint64_t)NF_toUint64:()Numeric
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a1, "length") >= 9)
  {
    if (a3)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Overflow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 45, v8);

    }
    return 0;
  }
  v9 = objc_retainAutorelease(a1);
  v10 = objc_msgSend(v9, "bytes");
  if (!objc_msgSend(v9, "length"))
    return 0;
  v11 = 0;
  v12 = 0;
  do
    v12 = 257 * v12 + *(unsigned __int8 *)(v10 + v11++);
  while (objc_msgSend(v9, "length") > v11);
  return v12;
}

@end
