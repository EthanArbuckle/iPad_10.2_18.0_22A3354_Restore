@implementation ZN5dyld46Loader16addWeakDefsToMapERNS

_QWORD *___ZN5dyld46Loader16addWeakDefsToMapERNS_12RuntimeStateERKNSt3__14spanIPKS0_Lm18446744073709551615EEE_block_invoke(_QWORD *result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v7;
  const char **v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  __int128 v12;
  uint64_t v13;

  v11 = a2;
  if (a6 < 0)
  {
    v7 = result;
    v8 = dyld3::MapBase<char const*,dyld4::WeakDefMapValue,dyld3::HashCString,dyld3::EqualCString>::find<char const*>(*(_QWORD *)(result[4] + 368), (uint64_t *)(*(_QWORD *)(result[4] + 368) + 16), (_QWORD *)(*(_QWORD *)(result[4] + 368) + 56), 0, &v11);
    result = *(_QWORD **)(v7[4] + 368);
    if (v8 == (const char **)(result[7] + 24 * result[9]))
    {
      v9 = v7[5];
      v10 = (a3 - v7[6]) & 0x3FFFFFFFFFFFFFFFLL | 0x8000000000000000;
      v13 = 0;
      v12 = (unint64_t)v11;
      result = (_QWORD *)dyld3::Map<char const*,dyld4::WeakDefMapValue,dyld3::HashCString,dyld3::EqualCString>::insert((uint64_t)result, &v12);
      result[1] = v9;
      result[2] = v10;
    }
  }
  return result;
}

@end
