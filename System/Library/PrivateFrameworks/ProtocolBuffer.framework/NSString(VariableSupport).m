@implementation NSString(VariableSupport)

- (__CFString)_pb_fixCase:()VariableSupport
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  BOOL v8;
  char *v9;
  __darwin_ct_rune_t v10;
  __darwin_ct_rune_t v11;
  __CFString *v12;

  if (objc_msgSend(a1, "length"))
  {
    v5 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
    v6 = (char *)malloc_type_malloc(v5 + 1, 0x77095664uLL);
    objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v6, v5, 0, 4, 1, 0, objc_msgSend(a1, "length"), 0);
    v6[v5] = 0;
    v7 = 0;
    if (v5)
    {
      v8 = !a3;
      v9 = v6;
      do
      {
        v11 = *v9++;
        v10 = v11;
        if (a3)
        {
          LOBYTE(v10) = __toupper(v10);
        }
        else if (v8)
        {
          LOBYTE(v10) = __tolower(v10);
        }
        a3 = v10 == 95;
        if (v10 != 95)
          v6[v7++] = v10;
        v8 = 0;
        --v5;
      }
      while (v5);
    }
    v6[v7] = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else
  {
    v12 = &stru_1E4FACDB8;
  }
  return v12;
}

@end
