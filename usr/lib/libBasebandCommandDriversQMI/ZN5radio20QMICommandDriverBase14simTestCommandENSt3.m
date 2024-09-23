@implementation ZN5radio20QMICommandDriverBase14simTestCommandENSt3

char *___ZN5radio20QMICommandDriverBase14simTestCommandENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENSC_IK14__CFDictionaryEEEEE_block_invoke_2(char *result, char **a2)
{
  char *v3;
  size_t v4;
  char *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  char *v11;
  _OWORD *v12;
  __int128 *v13;
  unint64_t v14;
  __int128 v15;
  char *v16;
  size_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char v22;
  unint64_t v23;
  _OWORD *v24;
  char *v25;
  unint64_t v26;
  __int128 v27;
  char v28;

  if (result[55] < 0)
  {
    v3 = (char *)*((_QWORD *)result + 4);
    v4 = *((_QWORD *)result + 5);
    v5 = &v3[v4];
    v6 = (unint64_t)a2[2];
    v7 = *a2;
    if (v6 - (unint64_t)*a2 < v4)
    {
LABEL_3:
      if (v7)
      {
        a2[1] = v7;
        operator delete(v7);
        v6 = 0;
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
      }
      if ((v4 & 0x8000000000000000) != 0)
        goto LABEL_39;
      v8 = 2 * v6;
      if (2 * v6 <= v4)
        v8 = v4;
      v9 = v6 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v8;
      if ((v9 & 0x8000000000000000) != 0)
LABEL_39:
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      result = (char *)operator new(v9);
      *a2 = result;
      a2[1] = result;
      a2[2] = &result[v9];
      if (v4 < 0x20 || (unint64_t)(result - v3) < 0x20)
      {
        v10 = v3;
        v11 = result;
      }
      else
      {
        v10 = &v3[v4 & 0xFFFFFFFFFFFFFFE0];
        v11 = &result[v4 & 0xFFFFFFFFFFFFFFE0];
        v12 = result + 16;
        v13 = (__int128 *)(v3 + 16);
        v14 = v4 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v15 = *v13;
          *(v12 - 1) = *(v13 - 1);
          *v12 = v15;
          v12 += 2;
          v13 += 2;
          v14 -= 32;
        }
        while (v14);
        if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0))
          goto LABEL_28;
      }
      do
      {
        v22 = *v10++;
        *v11++ = v22;
      }
      while (v10 != v5);
LABEL_28:
      a2[1] = v11;
      return result;
    }
  }
  else
  {
    v3 = result + 32;
    v4 = result[55];
    v5 = &result[v4 + 32];
    v6 = (unint64_t)a2[2];
    v7 = *a2;
    if (v6 - (unint64_t)*a2 < v4)
      goto LABEL_3;
  }
  v16 = a2[1];
  v17 = v16 - v7;
  if (v16 - v7 >= v4)
  {
    if (v4)
      result = (char *)memmove(v7, v3, v4);
    v21 = &v7[v4];
    goto LABEL_38;
  }
  v18 = &v3[v17];
  if (v16 == v7)
  {
    v19 = v7;
    v20 = v7;
    if (v18 == v5)
      goto LABEL_37;
  }
  else
  {
    result = (char *)memmove(v7, v3, v17);
    v19 = a2[1];
    v20 = v19;
    if (v18 == v5)
      goto LABEL_37;
  }
  v23 = &v7[v4] - v16;
  if (v23 >= 0x20)
  {
    v20 = v19;
    if (&v19[v7 - &v16[(_QWORD)v3]] >= (char *)0x20)
    {
      v18 += v23 & 0xFFFFFFFFFFFFFFE0;
      v20 = &v19[v23 & 0xFFFFFFFFFFFFFFE0];
      v24 = v19 + 16;
      v25 = &v3[v16 - v7 + 16];
      v26 = v23 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v27 = *(_OWORD *)v25;
        *(v24 - 1) = *((_OWORD *)v25 - 1);
        *v24 = v27;
        v24 += 2;
        v25 += 32;
        v26 -= 32;
      }
      while (v26);
      if (v23 == (v23 & 0xFFFFFFFFFFFFFFE0))
        goto LABEL_37;
    }
  }
  else
  {
    v20 = v19;
  }
  do
  {
    v28 = *v18++;
    *v20++ = v28;
  }
  while (v18 != v5);
LABEL_37:
  v21 = v20;
LABEL_38:
  a2[1] = v21;
  return result;
}

@end
