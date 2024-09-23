@implementation ZN8BBUError14getErrorStringEv

void **___ZN8BBUError14getErrorStringEv_block_invoke(void **result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  int v6;
  size_t v7;
  __int128 v8;
  size_t v9;
  __int128 *v10;
  __int128 *v11;
  size_t v12;

  v1 = result[5];
  v3 = v1[4];
  v2 = v1[5];
  if (v3 != v2)
  {
    v4 = (__int128 *)(v2 - 32);
    v5 = *((_QWORD *)result[4] + 1);
    result = (void **)(v5 + 40);
    if (v5 + 40 != v2 - 32)
    {
      v6 = *(char *)(v5 + 63);
      v7 = *(unsigned __int8 *)(v2 - 9);
      if (v6 < 0)
      {
        v10 = *(__int128 **)(v2 - 32);
        v9 = *(_QWORD *)(v2 - 24);
        if ((v7 & 0x80u) == 0)
          v11 = v4;
        else
          v11 = v10;
        if ((v7 & 0x80u) == 0)
          v12 = v7;
        else
          v12 = v9;
        return std::string::__assign_no_alias<false>(result, v11, v12);
      }
      else if ((v7 & 0x80) != 0)
      {
        return (void **)std::string::__assign_no_alias<true>(result, *(void **)(v2 - 32), *(_QWORD *)(v2 - 24));
      }
      else
      {
        v8 = *v4;
        result[2] = *(void **)(v2 - 16);
        *(_OWORD *)result = v8;
      }
    }
  }
  return result;
}

@end
