@implementation ZN12TelephonyXPC18ClientStateTracker6insertENSt3

_QWORD *___ZN12TelephonyXPC18ClientStateTracker6insertENSt3__110shared_ptrINS_6Client5StateEEE_block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v2 = (_QWORD *)a1[4];
  v3 = operator new(0x10uLL);
  v4 = v3;
  v5 = a1[6];
  *v3 = a1[5];
  v3[1] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v9 = (_QWORD *)v2[4];
  v8 = v2[5];
  if ((unint64_t)v9 >= v8)
  {
    v11 = (_QWORD *)v2[3];
    v12 = v9 - v11;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61)
      std::vector<std::weak_ptr<TelephonyXPC::Client::State> *,std::allocator<std::weak_ptr<TelephonyXPC::Client::State> *>>::__throw_length_error[abi:ne180100]();
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 2 > v13)
      v13 = v14 >> 2;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
    {
      if (v15 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v16 = (char *)operator new(8 * v15);
    }
    else
    {
      v16 = 0;
    }
    v17 = &v16[8 * v12];
    *(_QWORD *)v17 = v4;
    v10 = v17 + 8;
    if (v9 != v11)
    {
      do
      {
        v18 = *--v9;
        *((_QWORD *)v17 - 1) = v18;
        v17 -= 8;
      }
      while (v9 != v11);
      v9 = (_QWORD *)v2[3];
    }
    v2[3] = v17;
    v2[4] = v10;
    v2[5] = &v16[8 * v15];
    if (v9)
      operator delete(v9);
  }
  else
  {
    *v9 = v3;
    v10 = v9 + 1;
  }
  v2[4] = v10;
  return v4;
}

@end
