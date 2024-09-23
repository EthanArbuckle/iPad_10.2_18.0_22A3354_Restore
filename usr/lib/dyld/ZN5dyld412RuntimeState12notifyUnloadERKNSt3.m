@implementation ZN5dyld412RuntimeState12notifyUnloadERKNSt3

_QWORD *___ZN5dyld412RuntimeState12notifyUnloadERKNSt3__14spanIPKNS_6LoaderELm18446744073709551615EEE_block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  const dyld4::Loader **v4;
  uint64_t v5;
  const dyld4::Loader *v6;
  uint64_t v7;
  const dyld4::Loader **v8;
  size_t v9;
  const dyld4::Loader **v10;
  const dyld4::Loader *v11;

  v1 = result[5];
  v2 = *(_QWORD *)(v1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)result[4];
    v4 = *(const dyld4::Loader ***)v1;
    v5 = *(_QWORD *)v1 + 8 * v2;
    do
    {
      v6 = *v4;
      v7 = v3[6];
      if (v7)
      {
        v8 = (const dyld4::Loader **)v3[5];
        v9 = 8 * v7 - 8;
        v10 = v8;
        while (1)
        {
          v11 = *v10++;
          if (v11 == v6)
            break;
          v9 -= 8;
          v8 = v10;
          if (v9 == -8)
            goto LABEL_11;
        }
        if (v9)
        {
          memmove(v8, v8 + 1, v9);
          v7 = v3[6];
        }
        v3[6] = v7 - 1;
      }
LABEL_11:
      result = dyld4::RuntimeState::removeDynamicDependencies(v3, v6);
      ++v4;
    }
    while (v4 != (const dyld4::Loader **)v5);
  }
  return result;
}

@end
