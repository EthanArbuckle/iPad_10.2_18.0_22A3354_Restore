@implementation PFSceneTaxonomyEnumerateTopologicallyOrderedNodes

uint64_t __PFSceneTaxonomyEnumerateTopologicallyOrderedNodes_block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD **v16;
  _QWORD *v17;
  unint64_t v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  int8x8_t prime;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  uint8x8_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  uint64_t v41;
  void *v42;
  unint64_t v43;

  v43 = a2;
  v5 = PFSceneTaxonomyNodeParentsCount(a2);
  if (v5 == 1)
    goto LABEL_2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  v8 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v10 = *(_QWORD *)(v6 + 56);
  if (!v10)
  {
LABEL_35:
    v17 = operator new(0x20uLL);
    *v17 = 0;
    v17[1] = v9;
    v17[2] = a2;
    v17[3] = 0;
    v19 = (float)(unint64_t)(*(_QWORD *)(v6 + 72) + 1);
    v20 = *(float *)(v6 + 80);
    if (v10 && (float)(v20 * (float)v10) >= v19)
    {
LABEL_81:
      v37 = *(_QWORD *)(v6 + 48);
      v38 = *(_QWORD **)(v37 + 8 * v2);
      if (v38)
      {
        *v17 = *v38;
      }
      else
      {
        *v17 = *(_QWORD *)(v6 + 64);
        *(_QWORD *)(v6 + 64) = v17;
        *(_QWORD *)(v37 + 8 * v2) = v6 + 64;
        if (!*v17)
          goto LABEL_90;
        v39 = *(_QWORD *)(*v17 + 8);
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v39 >= v10)
            v39 %= v10;
        }
        else
        {
          v39 &= v10 - 1;
        }
        v38 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v39);
      }
      *v38 = v17;
LABEL_90:
      ++*(_QWORD *)(v6 + 72);
LABEL_91:
      v17[3] = 1;
      return 0;
    }
    v21 = 1;
    if (v10 >= 3)
      v21 = (v10 & (v10 - 1)) != 0;
    v22 = v21 | (2 * v10);
    v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23)
      prime = (int8x8_t)v23;
    else
      prime = (int8x8_t)v22;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v10 = *(_QWORD *)(v6 + 56);
    if (*(_QWORD *)&prime > v10)
      goto LABEL_47;
    if (*(_QWORD *)&prime < v10)
    {
      v31 = vcvtps_u32_f32((float)*(unint64_t *)(v6 + 72) / *(float *)(v6 + 80));
      if (v10 < 3 || (v32 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        v31 = std::__next_prime(v31);
      }
      else
      {
        v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2)
          v31 = v33;
      }
      if (*(_QWORD *)&prime <= v31)
        prime = (int8x8_t)v31;
      if (*(_QWORD *)&prime >= v10)
      {
        v10 = *(_QWORD *)(v6 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_47:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v25 = operator new(8 * *(_QWORD *)&prime);
          v26 = *(void **)(v6 + 48);
          *(_QWORD *)(v6 + 48) = v25;
          if (v26)
            operator delete(v26);
          v27 = 0;
          *(int8x8_t *)(v6 + 56) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v27++) = 0;
          while (*(_QWORD *)&prime != v27);
          v28 = *(_QWORD **)(v6 + 64);
          if (v28)
          {
            v29 = v28[1];
            v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(_QWORD *)&prime)
                v29 %= *(_QWORD *)&prime;
            }
            else
            {
              v29 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v29) = v6 + 64;
            v34 = (_QWORD *)*v28;
            if (*v28)
            {
              do
              {
                v35 = v34[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(_QWORD *)&prime)
                    v35 %= *(_QWORD *)&prime;
                }
                else
                {
                  v35 &= *(_QWORD *)&prime - 1;
                }
                if (v35 != v29)
                {
                  v36 = *(_QWORD *)(v6 + 48);
                  if (!*(_QWORD *)(v36 + 8 * v35))
                  {
                    *(_QWORD *)(v36 + 8 * v35) = v28;
                    goto LABEL_72;
                  }
                  *v28 = *v34;
                  *v34 = **(_QWORD **)(*(_QWORD *)(v6 + 48) + 8 * v35);
                  **(_QWORD **)(*(_QWORD *)(v6 + 48) + 8 * v35) = v34;
                  v34 = v28;
                }
                v35 = v29;
LABEL_72:
                v28 = v34;
                v34 = (_QWORD *)*v34;
                v29 = v35;
              }
              while (v34);
            }
          }
          v10 = (unint64_t)prime;
          goto LABEL_76;
        }
        v42 = *(void **)(v6 + 48);
        *(_QWORD *)(v6 + 48) = 0;
        if (v42)
          operator delete(v42);
        v10 = 0;
        *(_QWORD *)(v6 + 56) = 0;
      }
    }
LABEL_76:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v2 = v9 % v10;
      else
        v2 = v9;
    }
    else
    {
      v2 = (v10 - 1) & v9;
    }
    goto LABEL_81;
  }
  v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.u32[0] > 1uLL)
  {
    v12 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
    if (v9 >= v10)
      v12 = v9 % v10;
  }
  else
  {
    v12 = v9 & (v10 - 1);
  }
  v13 = *(_QWORD **)(*(_QWORD *)(v6 + 48) + 8 * v12);
  if (!v13 || (v14 = (_QWORD *)*v13) == 0)
  {
LABEL_20:
    if (v11.u32[0] > 1uLL)
    {
      v2 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10)
        v2 = v9 % v10;
    }
    else
    {
      v2 = v9 & (v10 - 1);
    }
    v16 = *(_QWORD ***)(*(_QWORD *)(v6 + 48) + 8 * v2);
    if (v16)
    {
      v17 = *v16;
      if (*v16)
      {
        while (1)
        {
          v18 = v17[1];
          if (v18 == v9)
          {
            if (v17[2] == a2)
              goto LABEL_91;
          }
          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v18 >= v10)
                v18 %= v10;
            }
            else
            {
              v18 &= v10 - 1;
            }
            if (v18 != v2)
              goto LABEL_35;
          }
          v17 = (_QWORD *)*v17;
          if (!v17)
            goto LABEL_35;
        }
      }
    }
    goto LABEL_35;
  }
  while (1)
  {
    v15 = v14[1];
    if (v15 == v9)
      break;
    if (v11.u32[0] > 1uLL)
    {
      if (v15 >= v10)
        v15 %= v10;
    }
    else
    {
      v15 &= v10 - 1;
    }
    if (v15 != v12)
      goto LABEL_20;
LABEL_19:
    v14 = (_QWORD *)*v14;
    if (!v14)
      goto LABEL_20;
  }
  if (v14[2] != a2)
    goto LABEL_19;
  v41 = v14[3] + 1;
  v14[3] = v41;
  if (v41 != v5)
    return 0;
LABEL_2:
  std::deque<void const*>::push_back((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), &v43);
  return 0;
}

@end
